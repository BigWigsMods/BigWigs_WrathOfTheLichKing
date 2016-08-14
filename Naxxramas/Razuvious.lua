--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Instructor Razuvious", 535, 1607)
if not mod then return end
mod:RegisterEnableMob(16061)
mod.toggleOptions = {55543, 55550, 29061, 29060}

--------------------------------------------------------------------------------
-- Locals
--

local L = mod:NewLocale("enUS", true)
if L then
	L.shout_warning = "Disrupting Shout in 5sec!"

	L.taunt_warning = "Taunt ready in 5sec!"
	L.shieldwall_warning = "Barrier gone in 5sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Shout", 29107, 55543)
	self:Log("SPELL_CAST_SUCCESS", "Taunt", 29060)
	self:Log("SPELL_AURA_APPLIED", "Knife", 55550)
	self:Log("SPELL_CAST_SUCCESS", "ShieldWall", 29061)
	self:Death("Win", 16061)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	self:Bar(55543, 15) -- Disrupting Shout
	self:DelayedMessage(55543, 12, "Attention", L["shout_warning"])
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Shout(args)
	self:Message(55543, "Important")
	self:Bar(55543, 15)
	self:DelayedMessage(55543, 12, "Attention", L["shout_warning"])
end

function mod:ShieldWall(args)
	self:Message(args.spellId, "Positive")
	self:Bar(args.spellId, 20)
	self:DelayedMessage(args.spellId, 15, "Attention", L["taunt_warning"])
end

function mod:Taunt(args)
	self:Message(args.spellId, "Positive")
	self:Bar(args.spellId, 20)
	self:DelayedMessage(args.spellId, 15, "Attention", L["shieldwall_warning"])
end

function mod:Knife(args)
	self:TargetMessage(args.spellId, args.destName, "Important")
end

