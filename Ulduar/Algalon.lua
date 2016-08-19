--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Algalon the Observer", 529, 1650)
if not mod then return end
mod:RegisterEnableMob(32871)
mod.toggleOptions = {"stages", 64412, 64597, 64122, 64443, "berserk"}
mod.engageId = 1130

--------------------------------------------------------------------------------
-- Locals
--

local phase = nil
local blackholes = 0
local offset = 8

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.smash_message = "Incoming Cosmic Smash!"
	L.blackhole_message = "Black Hole %d!"
	L.bigbang_bar = "Next Big Bang"
	L.bigbang_soon = "Big Bang soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Punch", 64412)
	self:Log("SPELL_AURA_APPLIED_DOSE", "PunchCount", 64412)
	self:Log("SPELL_CAST_SUCCESS", "Smash", 62301, 64598)
	self:Log("SPELL_CAST_SUCCESS", "BlackHole", 64122, 65108)
	self:Log("SPELL_CAST_START","BigBang", 64443, 64584)
end

function mod:OnEngage()
	blackholes = 0

	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	self:Bar("stages", 8+offset, CL["phase"]:format(1), "INV_Gizmo_01")
	self:Bar(64443, 98+offset) -- Big Bang
	self:DelayedMessage(64443, 93+offset, "Attention", L["bigbang_soon"])
	self:Bar(64597, 33+offset) -- Cosmic Smash
	self:Berserk(360+offset)

	offset = 0
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 32871 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 21 then
			self:Message("stages", "Positive", nil, CL["soon"]:format(CL["phase"]:format(2)), false)
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

function mod:Punch(args)
	self:Bar(args.spellId, 15)
end

function mod:PunchCount(args)
	if args.amount >= 4 then
		self:StackMessage(args.spellId, args.destName, args.amount, "Urgent", "Alert")
	end
end

function mod:Smash(args)
	self:Message(64597, "Attention", "Info", L["smash_message"], 64597)
	self:Bar(64597, 5, L["smash_message"], 64597)
	self:Bar(64597, 25, args.spellName, 64597)
end

function mod:BlackHole()
	blackholes = blackholes + 1
	self:Message(64122, "Positive", nil, L["blackhole_message"]:format(blackholes))
end

function mod:BigBang()
	self:Message(64443, "Important", "Alarm")
	self:Bar(64443, 8)
	self:Bar(64443, 90, L["bigbang_bar"])
	self:DelayedMessage(64443, 85, "Attention", L["bigbang_soon"])
end

