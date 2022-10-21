--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Patchwerk", 533, 1610)
if not mod then return end
mod:RegisterEnableMob(16028)
mod:SetEncounterID(1118)
-- mod:SetRespawnTime(0) -- resets, doesn't respawn

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		28131, -- Frenzy
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 28131)
end

function mod:OnEngage()
	self:Berserk(361)

	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Frenzy(args)
	self:Message(28131, "red", CL.percent:format(5, args.spellName))
	self:PlaySound(28131, "long")
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 16028 then -- To be compatible with classic
		local hp = self:GetHealth(unit)
		if hp < 8 then
			if hp > 5 then
				self:Message(28131, "orange", CL.soon:format(self:SpellName(28131)))
				self:PlaySound(28131, "alarm")
			end
			self:UnregisterUnitEvent(event, unit)
		end
	end
end
