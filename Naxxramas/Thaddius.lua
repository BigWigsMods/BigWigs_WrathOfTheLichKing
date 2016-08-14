--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Thaddius", 535, 1613)
if not mod then return end
-- 15928 thaddius, 15929 - stalagg, 15930 - feugen
mod:RegisterEnableMob(15928, 15929, 15930)
mod.toggleOptions = {{28089, "FLASH"}, 28134, "throw", "phase", "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local deaths = 0
local stage1warn = nil
local lastCharge = nil
local shiftTime = nil
local throwHandle = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase = "Phase"
	L.phase_desc = "Warn for Phase transitions"

	L.throw = "Throw"
	L.throw_desc = "Warn about tank platform swaps."

	L.trigger_phase1_1 = "Stalagg crush you!"
	L.trigger_phase1_2 = "Feed you to master!"
	L.trigger_phase2_1 = "Eat... your... bones..."
	L.trigger_phase2_2 = "Break... you!!"
	L.trigger_phase2_3 = "Kill..."

	L.polarity_trigger = "Now you feel pain..."
	L.polarity_message = "Polarity Shift incoming!"
	L.polarity_warning = "3 sec to Polarity Shift!"
	L.polarity_bar = "Polarity Shift"
	L.polarity_changed = "Polarity changed!"
	L.polarity_nochange = "Same polarity!"

	L.polarity_first_positive = "You're POSITIVE!"
	L.polarity_first_negative = "You're NEGATIVE!"

	L.phase1_message = "Phase 1"
	L.phase2_message = "Phase 2, Berserk in 6 minutes!"

	L.surge_message = "Power Surge on Stalagg!"

	L.throw_bar = "Throw"
	L.throw_warning = "Throw in ~5 sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "StalaggPower", 28134, 54529)
	self:Log("SPELL_CAST_START", "Shift", 28089)
	self:Death("Win", 15928)

	deaths = 0
	stage1warn = nil
	lastCharge = nil
	shiftTime = nil

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:StalaggPower(args)
	self:Message(28134, "Important", nil, L["surge_message"])
	self:Bar(28134, 10)
end

function mod:UNIT_AURA(_, unit)
	if not shiftTime or (GetTime() - shiftTime) < 3 then return end

	local newCharge = nil
	for i = 1, 10 do
		local name, _, icon, stack = UnitDebuff("player", i)
		-- If stack > 1 we need to wait for another UNIT_AURA event.
		-- UnitDebuff returns 0 for debuffs that don't stack.
		if icon == "Interface\\Icons\\Spell_ChargeNegative" or icon == "Interface\\Icons\\Spell_ChargePositive" then
			if stack > 1 then return end
			newCharge = icon
			-- We keep scanning even though we found one, because
			-- if we have another buff with these icons that has
			-- stack > 1 then we need to break and wait for another
			-- UNIT_AURA event.
		end
	end
	if newCharge then
		if not lastCharge then
			local text = newCharge == "Interface\\Icons\\Spell_ChargePositive" and L["polarity_first_positive"] or L["polarity_first_negative"]
			self:Message(28089, "Personal", "Alert", text, newCharge)
			self:Flash(28089)
		else
			if newCharge == lastCharge then
				self:Message(28089, "Positive", nil, L["polarity_nochange"], newCharge)
			else
				self:Message(28089, "Personal", "Alert", L["polarity_changed"], newCharge)
				self:Flash(28089)
			end
		end
		lastCharge = newCharge
		shiftTime = nil
		self:UnregisterUnitEvent("UNIT_AURA")
	end
end

function mod:Shift()
	shiftTime = GetTime()
	self:RegisterUnitEvent("UNIT_AURA", nil, "player")
	self:Message(28089, "Important", nil, L["polarity_message"])
end

local function throw()
	mod:Bar("throw", 20, L["throw_bar"], "Ability_Druid_Maul")
	mod:DelayedMessage("throw", 15, "Urgent", L["throw_warning"])
	throwHandle = mod:ScheduleTimer(throw, 21)
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L["polarity_trigger"], nil, true) then
		self:DelayedMessage(28089, 25, "Important", L["polarity_warning"])
		self:Bar(28089, 28, L["polarity_bar"], "Spell_Nature_Lightning")
	elseif msg == L["trigger_phase1_1"] or msg == L["trigger_phase1_2"] then
		if not stage1warn then
			self:Message("phase", "Important", nil, L["phase1_message"], false)
		end
		deaths = 0
		stage1warn = true
		throw()
		self:Engage()
	elseif msg:find(L["trigger_phase2_1"], nil, true) or msg:find(L["trigger_phase2_2"], nil, true) or msg:find(L["trigger_phase2_3"], nil, true) then
		self:CancelTimer(throwHandle)
		self:StopBar(L["throw_bar"])
		self:Message("phase", "Important", nil, L["phase2_message"], false)
		self:Berserk(360, true)
	end
end

