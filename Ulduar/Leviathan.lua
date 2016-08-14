--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Flame Leviathan", 529, 1637)
if not mod then return end
mod:RegisterEnableMob(33113)
mod.toggleOptions = {"engage", 68605, 62396, {"pursue", "FLASH"}, 62475}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage = "Engage warning"
	L.engage_desc = "Warn when Flame Leviathan is engaged."
	L.engage_trigger = "^Hostile entities detected."
	L.engage_message = "%s Engaged!"

	L.pursue = "Pursuit"
	L.pursue_desc = "Warn when Flame Leviathan pursues a player."
	L.pursue_trigger = "^%%s pursues"
	L.pursue_other = "Leviathan pursues %s!"

	L.shutdown_message = "Systems down!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Flame", 62396)
	self:Log("SPELL_AURA_APPLIED", "Shutdown", 62475)
	self:Log("SPELL_AURA_REMOVED", "FlameFailed", 62396)

	self:Log("SPELL_AURA_APPLIED", "Pyrite", 68605)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Pyrite", 68605)
	self:Log("SPELL_AURA_REFRESH", "Pyrite", 68605)

	self:Death("Win", 33113)

	self:Emote("Pursue", L["pursue_trigger"])
	self:Yell("Engage", L["engage_trigger"])
end

function mod:OnEngage()
	self:Message("engage", "Attention", nil, L["engage_message"]:format(self.displayName), false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Pyrite(args)
	if bit.band(args.sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE or 0x1) ~= 0 then
		self:Bar(args.spellId, 10)
	end
end

function mod:Flame(args)
	self:Message(args.spellId, "Urgent")
	self:Bar(args.spellId, 10)
end

function mod:FlameFailed(args)
	self:StopBar(args.spellName)
end

function mod:Shutdown(args)
	if self:MobId(args.destGUID) == 33113 then
		self:Message(args.spellId, "Positive", "Long", L["shutdown_message"])
		self:Bar(args.spellId, 20)
	end
end

function mod:Pursue(msg, unit, _, _, player)
	self:TargetMessage("pursue", player, "Personal", "Alarm", L["pursue"], 62374)
	if UnitIsUnit(player, "player") then self:Flash("pursue", 62374) end
	self:Bar("pursue", 30, L["pursue_other"]:format(player), 62374)
end

