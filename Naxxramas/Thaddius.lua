--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Thaddius", 533, 1613)
if not mod then return end
mod:RegisterEnableMob(15928, 15929, 15930) -- Thaddius, Stalagg, Feugen
mod:SetEncounterID(1120)
mod:SetRespawnTime(32) -- p1 resets, p2 respawns

--------------------------------------------------------------------------------
-- Locals
--

local deaths = 0
local prevExpirationTime = 0
local lastCharge = nil
local shiftTime = nil
local throwHandle = nil
local strategy = {}

local EXTRAS_PATH = "Interface\\AddOns\\BigWigs_WrathOfTheLichKing\\Naxxramas\\Extras"

local ICON_POSITIVE = "Spell_ChargePositive" -- 135769
local ICON_NEGATIVE = "Spell_ChargeNegative" -- 135768

local DIRECTION_SOUND = {}
do
	local locale = GetLocale()
	if locale == "zhTW" then locale = "zhCN" end
	local locales = {
		deDE = true,
		koKR = true,
		zhCN = true,
	}
	if not locales[locale] then
		locale = "enUS"
	end

	-- PlaySoundFile("Interface\\AddOns\\BigWigs_WrathOfTheLichKing\\Naxxramas\\Extras\\Thaddius-enUS-Stay.ogg", "Master")
	DIRECTION_SOUND.left = ("%s\\Thaddius-%s-Left.ogg"):format(EXTRAS_PATH, locale)
	DIRECTION_SOUND.right = ("%s\\Thaddius-%s-Right.ogg"):format(EXTRAS_PATH, locale)
	DIRECTION_SOUND.swap = ("%s\\Thaddius-%s-Swap.ogg"):format(EXTRAS_PATH, locale)
	DIRECTION_SOUND.stay = ("%s\\Thaddius-%s-Stay.ogg"):format(EXTRAS_PATH, locale)
end

local DIRECTION_ARROW = {
	left = function()
		local frame = mod.arrow
		frame.texture:SetRotation(0)
		frame.texture:SetTexCoord(0, 1, 0, 1)
		frame:SetPoint("CENTER", -250, 100)
		frame:Show()
		mod:SimpleTimer(function() mod.arrow:Hide() end, 4)
	end,
	right = function()
		local frame = mod.arrow
		frame.texture:SetRotation(0)
		frame.texture:SetTexCoord(1, 0, 0, 1)
		frame:SetPoint("CENTER", 250, 100)
		frame:Show()
		mod:SimpleTimer(function() mod.arrow:Hide() end, 4)
	end,
	swap = function()
		local frame = mod.arrow
		frame.texture:SetRotation(math.rad(-70))
		frame:SetPoint("CENTER", 0, 100)
		frame:Show()
		mod:SimpleTimer(function() mod.arrow:Hide() end, 4)
	end,
	stay = function()
		-- stop sign?
	end,
}

local INITIAL_DIRECTION = {
	{ [ICON_NEGATIVE] = "left", [ICON_POSITIVE] = "right" }, -- 1
	{ [ICON_POSITIVE] = "left", [ICON_NEGATIVE] = "right" }, -- 2
	[false] = {}
}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.phase1_trigger1 = "Stalagg crush you!"
	L.phase1_trigger2 = "Feed you to master!"
	L.phase2_trigger1 = "Eat... your... bones..."
	L.phase2_trigger2 = "Break... you!!"
	L.phase2_trigger3 = "Kill..."

	L.add_death_trigger = "%s dies."
	L.add_revive_trigger = "%s is jolted back to life!"
	L.overload_trigger = "%s overloads!"

	L.polarity_changed = "Polarity changed!"
	L.polarity_nochange = "Same polarity!"
	L.polarity_first_positive = "You are POSITIVE!"
	L.polarity_first_negative = "You are NEGATIVE!"

	L.throw = "Throw"
	L.throw_desc = "Warn about tank platform swaps."
	L.throw_icon = "Ability_Druid_Maul"
	L.throw_warning = "Throw in ~5 sec!"

	L.engage_message = "Thaddius engaged! Phase 1"

	-- BigWigs_ThaddiusArrows
	L.polarity_extras = "Additional alerts for Polarity Shift positioning"

	L.custom_off_select_charge_position = "First position"
	L.custom_off_select_charge_position_desc = "Where to move to after the first Polarity Shift."
	L.custom_off_select_charge_position_value1 = "|cffff2020Negative (-)|r are LEFT, |cff2020ffPositive (+)|r are RIGHT"
	L.custom_off_select_charge_position_value2 = "|cff2020ffPositive (+)|r are LEFT, |cffff2020Negative (-)|r are RIGHT"

	L.custom_off_select_charge_movement = "Movement"
	L.custom_off_select_charge_movement_desc = "The movement strategy your group uses."
	L.custom_off_select_charge_movement_value1 = "Run |cff20ff20THROUGH|r the boss"
	L.custom_off_select_charge_movement_value2 = "Run |cff20ff20CLOCKWISE|r around the boss"
	L.custom_off_select_charge_movement_value3 = "Run |cff20ff20COUNTER-CLOCKWISE|r around the boss"
	L.custom_off_select_charge_movement_value4 = "Four camps 1: Polarity changed moves |cff20ff20RIGHT|r, same polarity moves |cff20ff20LEFT|r"
	L.custom_off_select_charge_movement_value5 = "Four camps 2: Polarity changed moves |cff20ff20LEFT|r, same polarity moves |cff20ff20RIGHT|r"

	L.custom_off_charge_graphic = "Graphical arrow"
	L.custom_off_charge_graphic_desc = "Show an arrow graphic."
	L.custom_off_charge_text = "Text arrows"
	L.custom_off_charge_text_desc = "Show an additional message."
	L.custom_off_charge_voice = "Voice alert"
	L.custom_off_charge_voice_desc = "Play a voice alert."

	-- Translate these to get locale sound files!
	L.left = "<--- GO LEFT <--- GO LEFT <---"
	L.right = "---> GO RIGHT ---> GO RIGHT --->"
	L.swap = "^^^^ SWITCH SIDES ^^^^ SWITCH SIDES ^^^^"
	L.stay = "==== DON'T MOVE ==== DON'T MOVE ===="
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		-- Stage 1
		"throw",
		28134, -- Power Surge
		-- Stage 2
		{28089, "FLASH"}, -- Polarity Shift
		"berserk",
		-- extras
		"custom_off_select_charge_position",
		"custom_off_select_charge_movement",
		"custom_off_charge_graphic",
		"custom_off_charge_text",
		"custom_off_charge_voice",
	}, {
		["throw"] = CL.stage:format(1),
		[28089] = CL.stage:format(2),
		["custom_off_select_charge_position"] = L.polarity_extras,
	}
end

function mod:OnRegister()
	local frame = CreateFrame("Frame", "BigWigsThaddiusArrow", UIParent)
	frame:SetFrameStrata("HIGH")
	frame:Raise()
	frame:SetSize(100, 100)
	frame:SetAlpha(0.6)
	self.arrow = frame

	local texture = frame:CreateTexture(nil, "BACKGROUND")
	texture:SetTexture(EXTRAS_PATH.."\\arrow")
	texture:SetAllPoints(frame)
	frame.texture = texture

	frame:Hide()
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "StalaggPower", 28134, 54529)
	self:Log("SPELL_CAST_START", "PolarityShiftCast", 28089)
	self:Log("SPELL_CAST_SUCCESS", "PolarityShift", 28089)

	self:BossYell("Engage", L.phase1_trigger1, L.phase1_trigger2)
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:Emote("PrePhase2", L.overload_trigger)
	self:BossYell("Phase2", L.phase2_trigger1, L.phase2_trigger2, L.phase2_trigger3)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

function mod:OnEngage()
	deaths = 0
	prevExpirationTime = 0
	lastCharge = nil
	shiftTime = nil

	strategy = {}
	local opt = self:GetOption("custom_off_select_charge_position")
	strategy.first = INITIAL_DIRECTION[opt]

	opt = self:GetOption("custom_off_select_charge_movement")
	if opt == 1 then -- through
		strategy.change = "swap"
		strategy.nochange = "stay"
	elseif opt == 2 then -- cw
		strategy.change = "left"
		strategy.nochange = "stay"
	elseif opt == 3 then -- ccw
		strategy.change = "right"
		strategy.nochange = "stay"
	elseif opt == 4 then -- 4r
		strategy.change = "right"
		strategy.nochange = "left"
	elseif opt == 5 then -- 4l
		strategy.change = "left"
		strategy.nochange = "right"
	end

	self:Message("stages", "yellow", CL.phase:format(1), false) -- L.engage_message
	self:Throw()
	-- self:Bar(28134, 11) -- Power Surge
end

function mod:OnBossDisable()
	self.arrow:Hide()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Throw()
	self:Bar("throw", 20, L.throw, L.throw_icon)
	self:DelayedMessage("throw", 15, "orange", L.throw_warning, L.throw_icon)
	throwHandle = self:ScheduleTimer("Throw", 21)
end

function mod:StalaggPower(args)
	self:Message(28134, "red", CL.on:format(args.spellName, args.destName))
	self:TargetBar(28134, 10, args.destName)
	-- self:CDBar(28134, 25) -- 26~30
end

function mod:CHAT_MSG_MONSTER_EMOTE(_, msg, sender)
	if msg == L.add_death_trigger then
		deaths = math.min(2, deaths + 1) -- they can revive, just don't look too weird
		self:Message("stages", "green", CL.mob_killed:format(sender, deaths, 2), false)
		self:PlaySound("stages", "info")
		if deaths == 2 then
			self:CancelTimer(throwHandle)
			self:StopBar(L.throw)
		end
	elseif msg == L.add_revive_trigger then
		deaths = deaths - 1
		-- self:Message("stages", "yellow", msg:format(sender))
	end
end

do
	local prev = 0
	function mod:PrePhase2()
		local t = GetTime()
		if t-prev > 2 then
			prev = t
			self:Message("stages", "yellow", CL.incoming:format(self.displayName), false)
			self:PlaySound("stages", "long")
			self:Bar("stages", 3, CL.active, "spell_lightning_lightningbolt01")
		end
	end
end

function mod:Phase2()
	self:CancelTimer(throwHandle)
	self:StopBar(L.throw)

	-- self:Message("stages", "yellow", CL.custom_start:format(self.displayName, self:SpellName(26662), 6))
	self:Berserk(360)
	self:PlaySound("stages", "alarm")
end

function mod:PolarityShiftCast(args)
	self:Message(28089, "orange", CL.casting:format(args.spellName))
	self:PlaySound(28089, "long")
	shiftTime = GetTime()
	self:RegisterUnitEvent("UNIT_AURA", nil, "player")
end

function mod:PolarityShift(args)
	self:Bar(28089, 30)
	self:DelayedMessage(28089, 25, "yellow", CL.soon:format(args.spellName), false, "info")
end

do
	local blacklist = {[28084] = true, [28059] = true} -- Negative, Postive
	local negativeCharge = mod:SpellName(28084)
	local positiveCharge = mod:SpellName(28059)

	function mod:UNIT_AURA(event, unit)
		if not shiftTime or (GetTime() - shiftTime) < 2.9 then return end

		for i = 1, 100 do
			local name, _, stack, _, _, expirationTime, _, _, _, spellId, _, _, _, _, _, value = UnitAura(unit, i, "HARMFUL")
			if not name then break end

			if (name == negativeCharge or name == positiveCharge) and
			   (not stack or stack == 0) and (not value or value == 0) and -- classic uses the value for the stack
				 expirationTime and expirationTime > 0 and expirationTime ~= prevExpirationTime
			then
				if not blacklist[spellId] then
					blacklist[spellId] = true
					BigWigs:Error(format("Found spell '%s' using id %d on %d, tell the authors!", name, spellId, self:Difficulty()))
				end

				self:PolarityShiftAura(lastCharge, name)

				lastCharge = name
				prevExpirationTime = expirationTime
				break
			end
		end

		shiftTime = nil
		self:UnregisterUnitEvent(event, unit)
	end

	function mod:PolarityShiftAura(prevCharge, newCharge)
		local direction, color, text
		local icon = newCharge == positiveCharge and ICON_POSITIVE or ICON_NEGATIVE
		if newCharge == prevCharge then
			-- No change
			direction = strategy.nochange
			color = "yellow"
			text = L.polarity_nochange
		else
			-- Change
			color = newCharge == positiveCharge and "blue" or "red"
			if not prevCharge then
				-- First charge
				direction = strategy.first[icon]
				text = newCharge == positiveCharge and L.polarity_first_positive or L.polarity_first_negative
			else
				direction = strategy.change
				text = L.polarity_changed
			end
			if not direction or not self:GetOption("custom_off_charge_voice") then
				self:PlaySound(28089, "warning")
			end
			self:Flash(28089, icon)
		end
		if direction then
			if self:GetOption("custom_off_charge_graphic") then
				DIRECTION_ARROW[direction]()
			end
			if self:GetOption("custom_off_charge_text") then
				self:Message(28089, color, L[direction], false) -- SetOption::blue,red,yellow::
			end
			if self:GetOption("custom_off_charge_voice") then
				PlaySoundFile(DIRECTION_SOUND[direction], "Master")
			end
		end
		self:Message(28089, color, text, icon) -- SetOption::blue,red,yellow::
	end
end
