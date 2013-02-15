--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Algalon the Observer", 529)
if not mod then return end
mod:RegisterEnableMob(32871)
mod.toggleOptions = {"stages", 64412, 62301, 64122, 64443, "berserk", "bosskill"}

--------------------------------------------------------------------------------
-- Locals
--

local phase = nil
local blackholes = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Your actions are illogical. All possible results for this encounter have been calculated. The Pantheon will receive the Observer's message regardless of outcome."

	L.punch_message = "%2$dx Phase Punch on %1$s"
	L.smash_message = "Incoming Cosmic Smash!"
	L.blackhole_message = "Black Hole %d!"
	L.bigbang_bar = "Next Big Bang"
	L.bigbang_soon = "Big Bang soon!"

	L.end_trigger = "I have seen worlds bathed in the Makers' flames."
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

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Yell("Engage", L["engage_trigger"])
	self:Yell("Win", L["end_trigger"])
end

function mod:OnEngage()
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")

	blackholes = 0
	local offset = 0
	local _, _, _, text = GetWorldStateUIInfo(1)
	local num = tonumber((text or ""):match("(%d+)") or nil)
	if num == 60 then offset = 19 end
	self:Bar("stages", CL["phase"]:format(1), 8+offset, "INV_Gizmo_01")
	self:Bar(64443, 64443, 98+offset, 64443) -- Big Bang
	self:DelayedMessage(64443, 93+offset, L["bigbang_soon"], "Attention")
	self:Bar(62301, 62301, 33+offset, 64597) -- Cosmic Smash
	self:Berserk(360+offset)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 32871 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp < 21 then
			self:Message("stages", CL["soon"]:format(CL["phase"]:format(2)), "Positive")
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

function mod:Punch(args)
	self:Bar(args.spellId, args.spellName, 15, args.spellId)
end

function mod:PunchCount(args)
	if args.amount >= 4 then
		self:TargetMessage(args.spellId, L["punch_message"], args.destName, "Urgent", args.spellId, "Alert", args.amount)
	end
end

function mod:Smash(args)
	self:Message(62301, L["smash_message"], "Attention", 64597, "Info")
	self:Bar(62301, L["smash_message"], 5, 64597)
	self:Bar(62301, args.spellName, 25, 64597)
end

function mod:BlackHole(args)
	blackholes = blackholes + 1
	self:Message(64122, L["blackhole_message"]:format(blackholes), "Positive", args.spellId)
end

function mod:BigBang(args)
	self:Message(64443, args.spellName, "Important", 64443, "Alarm")
	self:Bar(64443, args.spellName, 8, 64443)
	self:Bar(64443, L["bigbang_bar"], 90, 64443)
	self:DelayedMessage(64443, 85, L["bigbang_soon"], "Attention")
end

