--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Deathbound Ward", 631)
if not mod then return end
mod:RegisterEnableMob(37007)
mod.toggleOptions = {{71022, "FLASH"}}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Shout", 71022)
	self:Death("Deaths", 37007)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Shout(args)
	self:MessageOld(71022, "blue")
	self:Bar(71022, 3)
	self:Flash(71022)
end

function mod:Deaths()
	--Disable when OOC, since being in combat with several is possible
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "Disable")
end

