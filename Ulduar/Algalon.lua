--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Algalon the Observer", 603, 1650)
if not mod then return end
mod:RegisterEnableMob(32871)
mod.engageId = 1130

--------------------------------------------------------------------------------
-- Locals
--

local blackholes = 0

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		64412, -- Phase Punch
		64597, -- Cosmic Smash
		64122, -- Black Hole Explosion
		64443, -- Big Bang
		"berserk"
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "PhasePunch", 64412)
	self:Log("SPELL_AURA_APPLIED_DOSE", "PhasePunchCount", 64412)
	self:Log("SPELL_CAST_SUCCESS", "CosmicSmash", 62301, 64598) -- Seems to be 62301 (which doens't have an icon)
	self:Log("SPELL_CAST_SUCCESS", "BlackHoleExplosion", 64122, 65108) -- Seems to be 65108
	self:Log("SPELL_CAST_START","BigBang", 64443, 64584)
end

function mod:OnEngage()
	blackholes = 0

	self:RegisterUnitEvent("UNIT_TARGETABLE_CHANGED", nil, "boss1")
	--self:Bar("stages", 8+offset, CL["phase"]:format(1), "INV_Gizmo_01") -- XXX FIXME
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_TARGETABLE_CHANGED(_, unit)
	if UnitCanAttack("player", unit) then -- Engage
		self:RegisterUnitEvent("UNIT_HEALTH", nil, unit)
		self:Bar(64443, 98) -- Big Bang
		self:DelayedMessage(64443, 93, "yellow", CL.soon:format(self:SpellName(64443)))
		self:Bar(64597, 33) -- Cosmic Smash
		self:Berserk(360)
	end
end

function mod:UNIT_HEALTH(event, unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if hp < 21 then
		self:MessageOld("stages", "green", nil, CL["soon"]:format(CL["phase"]:format(2)), false)
		self:UnregisterUnitEvent(event, unit)
	end
end

function mod:PhasePunch(args)
	self:Bar(args.spellId, 15)
end

function mod:PhasePunchCount(args)
	if args.amount > 3 then
		self:StackMessage(args.spellId, args.destName, args.amount, "orange", "alert")
	end
end

function mod:CosmicSmash(args)
	self:MessageOld(64597, "yellow", "info", CL.casting:format(args.spellName))
	self:CastBar(64597, 5)
	self:Bar(64597, 25)
end

function mod:BlackHoleExplosion()
	blackholes = blackholes + 1
	self:MessageOld(64122, "green", nil, CL.count:format(self:SpellName(186546), blackholes)) -- 186546 = "Black Hole"
end

function mod:BigBang(args)
	self:MessageOld(64443, "red", "alarm")
	self:CastBar(64443, 8)
	self:Bar(64443, 90)
	self:DelayedMessage(64443, 85, "yellow", CL.soon:format(args.spellName))
end
