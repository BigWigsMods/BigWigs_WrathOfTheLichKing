--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Koralon the Flame Watcher", 532)
if not mod then return end
mod:RegisterEnableMob(35013)
mod.toggleOptions = {66725, {66684, "FLASH"}, 66665, "bosskill"}

--------------------------------------------------------------------------------
-- Locals
--

local count = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.fists_bar = "Next Fists"

	L.cinder_message = "Flame on YOU!"

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
	self:Bar(66725, L["fists_bar"], 47, 66725)
	self:Bar(66665, L["breath_bar"]:format(count), 10, 66665)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Fists(_, spellId, _, _, spellName)
	self:Message(66725, spellName, "Attention", spellId)
	self:Bar(66725, spellName, 15, spellId)
	self:Bar(66725, L["fists_bar"], 47, spellId)
end

function mod:Cinder(player, spellId)
	if UnitIsUnit(player, "player") then
		self:Message(66684, L["cinder_message"], "Personal", spellId, "Alarm")
		self:Flash(66684)
	end
end

function mod:Breath(_, spellId, _, _, spellName)
	self:Message(66665, spellName, "Positive", spellId)
	count = count + 1
	self:Bar(66665, L["breath_bar"]:format(count), 45, spellId)
	self:DelayedMessage(66665, 40, L["breath_message"]:format(count), "Attention")
end

