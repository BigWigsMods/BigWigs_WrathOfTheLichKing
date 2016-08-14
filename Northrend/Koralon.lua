--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Koralon the Flame Watcher", 532, 1599)
if not mod then return end
mod:RegisterEnableMob(35013)
mod.toggleOptions = {66725, {66684, "FLASH"}, 66665}

--------------------------------------------------------------------------------
-- Locals
--

local count = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.breath_bar = "Breath %d"
	L.breath_message = "Breath %d soon!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Fists", 66725)
	self:Log("SPELL_AURA_APPLIED", "Cinder", 66684)
	self:Log("SPELL_CAST_START", "Breath", 66665)
	self:Death("Win", 35013)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	count = 1
	self:Bar(66725, 47) -- Meteor Fists
	self:Bar(66665, 10, L["breath_bar"]:format(count))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Fists(args)
	self:Message(args.spellId, "Attention")
	self:Bar(args.spellId, 15)
	self:Bar(args.spellId, 47)
end

function mod:Cinder(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "Personal", "Alarm", CL["you"]:format(args.spellName))
		self:Flash(args.spellId)
	end
end

function mod:Breath(args)
	self:Message(args.spellId, "Positive")
	count = count + 1
	self:Bar(args.spellId, 45, L["breath_bar"]:format(count))
	self:DelayedMessage(args.spellId, 40, "Attention", L["breath_message"]:format(count))
end

