--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Thaddius", 533, 1613)
if not mod then return end
-- 15928 thaddius, 15929 - stalagg, 15930 - feugen
mod:RegisterEnableMob(15928, 15929, 15930)
mod.toggleOptions = {{28089, "FLASH"}, 28134, "throw", "phase", "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local deaths = 0
local prevExpirationTime = 0
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
	prevExpirationTime = 0
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
	self:MessageOld(28134, "red", nil, L["surge_message"])
	self:Bar(28134, 10)
end

local blacklist= {}
function mod:UNIT_AURA(event, unit)
	if not shiftTime or (GetTime() - shiftTime) < 2.9 then return end

	local negativeCharge = self:SpellName(39093)
	local positiveCharge = self:SpellName(28059)

	for i = 1, 100 do
		local name, _, stack, _, _, expirationTime, _, _, _, spellId = UnitAura(unit, i, "HARMFUL")

		if name == negativeCharge or name == positiveCharge then
			if (not stack or stack == 0) and expirationTime and expirationTime > 0 and expirationTime ~= prevExpirationTime then
				if not blacklist[spellId] then
					blacklist[spellId] = true
					BigWigs:Error(format("Found spell '%s' using id %d on %d, tell the authors!", name, spellId, self:Difficulty()))
				end

				prevExpirationTime = expirationTime
				shiftTime = nil
				self:UnregisterUnitEvent(event, unit)

				if name == negativeCharge then
					if not lastCharge then
						lastCharge = negativeCharge
						self:MessageOld(28089, "blue", "alert", L["polarity_first_negative"], "spell_chargenegative")
						self:Flash(28089)
					else
						if lastCharge == negativeCharge then
							self:MessageOld(28089, "green", nil, L["polarity_nochange"], "spell_chargenegative")
						else
							lastCharge = negativeCharge
							self:MessageOld(28089, "blue", "alert", L["polarity_changed"], "spell_chargepositive")
							self:Flash(28089)
						end
					end
				elseif name == positiveCharge then
					if not lastCharge then
						lastCharge = positiveCharge
						self:MessageOld(28089, "blue", "alert", L["polarity_first_positive"], "spell_chargepositive")
						self:Flash(28089)
					else
						if lastCharge == positiveCharge then
							self:MessageOld(28089, "green", nil, L["polarity_nochange"], "spell_chargepositive")
						else
							lastCharge = positiveCharge
							self:MessageOld(28089, "blue", "alert", L["polarity_changed"], "spell_chargenegative")
							self:Flash(28089)
						end
					end
				end
			end
		elseif not name then
			shiftTime = nil
			self:UnregisterUnitEvent(event, unit)
			return
		end
	end
end

function mod:Shift()
	shiftTime = GetTime()
	self:RegisterUnitEvent("UNIT_AURA", nil, "player")
	self:MessageOld(28089, "red", nil, L["polarity_message"])
end

local function throw()
	mod:Bar("throw", 20, L["throw_bar"], "Ability_Druid_Maul")
	mod:DelayedMessage("throw", 15, "orange", L["throw_warning"])
	throwHandle = mod:ScheduleTimer(throw, 21)
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L["polarity_trigger"], nil, true) then
		self:DelayedMessage(28089, 25, "red", L["polarity_warning"])
		self:Bar(28089, 28, L["polarity_bar"], "Spell_Nature_Lightning")
	elseif msg == L["trigger_phase1_1"] or msg == L["trigger_phase1_2"] then
		if not stage1warn then
			self:MessageOld("phase", "red", nil, L["phase1_message"], false)
		end
		deaths = 0
		stage1warn = true
		throw()
		self:Engage()
	elseif msg:find(L["trigger_phase2_1"], nil, true) or msg:find(L["trigger_phase2_2"], nil, true) or msg:find(L["trigger_phase2_3"], nil, true) then
		self:CancelTimer(throwHandle)
		self:StopBar(L["throw_bar"])
		self:MessageOld("phase", "red", nil, L["phase2_message"], false)
		self:Berserk(360, true)
	end
end
