--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Auriaya", 529, 1643)
if not mod then return end
mod:RegisterEnableMob(33515)
--Feral Defender = 34035
mod.toggleOptions = { 64386, 64389, 64396, 64422, "defender", "berserk" }

--------------------------------------------------------------------------------
-- Locals
--

local count = 9

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Some things are better left alone!"

	L.fear_warning = "Fear soon!"
	L.fear_message = "Casting Fear!"
	L.fear_bar = "~Fear"

	L.swarm_message = "Swarm"
	L.swarm_bar = "~Swarm"

	L.defender = "Feral Defender"
	L.defender_desc = "Warn for Feral Defender lives."
	L.defender_message = "Defender up %d/9!"

	L.sonic_bar = "~Sonic"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Sonic", 64422, 64688)
	self:Log("SPELL_CAST_START", "Fear", 64386)
	self:Log("SPELL_CAST_START", "Sentinel", 64389, 64678)
	self:Log("SPELL_AURA_APPLIED", "Swarm", 64396)
	self:Log("SPELL_AURA_APPLIED", "Defender", 64455)
	self:Log("SPELL_AURA_REMOVED_DOSE", "DefenderKill", 64455)
	self:Death("Win", 33515)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])
end

function mod:OnEngage()
	count = 9
	self:Bar("defender", 60, L["defender_message"]:format(count), 64455)
	self:Bar(64386, 32, L["fear_bar"])
	self:DelayedMessage(64386, 32, L["fear_warning"], "Attention")
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Sonic(args)
	self:Message(64422, "Attention")
	self:Bar(64422, 28, L["sonic_bar"])
end

function mod:Defender(args)
	self:Message("defender", "Attention", nil, L["defender_message"]:format(count), args.spellId)
end

function mod:DefenderKill(args)
	count = count - 1
	self:Bar("defender", 34, L["defender_message"]:format(count), args.spellId)
end

function mod:Swarm(args)
	self:TargetMessage(args.spellId, args.destName, "Attention", nil, L["swarm_message"])
	self:Bar(args.spellId, 37, L["swarm_bar"])
end

function mod:Fear(args)
	self:Message(args.spellId, "Urgent", nil, L["fear_message"])
	self:Bar(args.spellId, 35, L["fear_bar"])
	self:DelayedMessage(args.spellId, 32, "Attention", L["fear_warning"])
end

function mod:Sentinel()
	self:Message(64389, "Important")
end

