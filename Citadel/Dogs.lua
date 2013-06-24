--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Putricide Dogs", 604)
if not mod then return end
mod:RegisterEnableMob(37217, 37025)
mod.toggleOptions = {71127}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED_DOSE", "Wound", 71127)
	self:Death("Disable", 37217, 37025)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Wound(args)
	if args.amount > 5 then
		self:StackMessage(71127, args.destName, args.amount, "Important")
	end
end

