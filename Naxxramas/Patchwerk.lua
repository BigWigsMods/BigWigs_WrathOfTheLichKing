--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Patchwerk", 533, 1610)
if not mod then return end
mod:RegisterEnableMob(16028)
mod.toggleOptions = {28131, "berserk"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.enragewarn = "5% - Frenzied!"
	L.starttrigger1 = "Patchwerk want to play!"
	L.starttrigger2 = "Kel'thuzad make Patchwerk his avatar of war!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 28131)
	self:Death("Win", 16028)

	self:BossYell("Engage", L["starttrigger1"], L["starttrigger2"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

function mod:OnEngage()
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Frenzy(args)
	self:MessageOld(args.spellId, "yellow", "alarm", L["enragewarn"])
end

