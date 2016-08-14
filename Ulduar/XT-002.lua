--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("XT-002 Deconstructor", 529, 1640)
if not mod then return end
mod:RegisterEnableMob(33293)
mod.toggleOptions = {{63024, "ICON", "FLASH"}, {63018, "ICON", "FLASH"}, 62776, 64193, 63849, "proximity", "berserk"}
mod.optionHeaders = {
	[63024] = "normal",
	[64193] = "hard",
	proximity = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local phase = nil
local exposed1 = nil
local exposed2 = nil
local exposed3 = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.exposed_warning = "Exposed soon"
	L.exposed_message = "Heart exposed!"

	L.gravitybomb_other = "Gravity on %s!"

	L.lightbomb_other = "Light on %s!"

	L.tantrum_bar = "~Tantrum Cooldown"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Exposed", 63849)
	self:Log("SPELL_AURA_APPLIED", "Heartbreak", 64193, 65737)
	self:Log("SPELL_AURA_APPLIED", "GravityBomb", 63024, 64234)
	self:Log("SPELL_AURA_APPLIED", "LightBomb", 63018, 65121)
	self:Log("SPELL_AURA_REMOVED", "GravityRemoved", 63024, 64234)
	self:Log("SPELL_AURA_REMOVED", "LightRemoved", 63018, 65121)
	self:Log("SPELL_CAST_START", "Tantrum", 62776)
	self:Death("Win", 33293)
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	phase = 1
	exposed1 = nil
	exposed2 = nil
	exposed3 = nil
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Exposed(args)
	self:Message(args.spellId, "Attention", nil, L["exposed_message"])
	self:Bar(args.spellId, 30)
end

function mod:Heartbreak()
	phase = 2
	self:Message(64193, "Important")
end

function mod:Tantrum(args)
	if phase == 2 then
		self:Message(args.spellId, "Attention")
		self:Bar(args.spellId, 65, L["tantrum_bar"])
	end
end

function mod:GravityBomb(args)
	if self:Me(args.destGUID) then
		self:OpenProximity("proximity", 10)
		self:Flash(63024)
	end
	self:TargetMessage(63024, args.destName, "Personal", "Alert")
	self:Bar(63024, 9, L["gravitybomb_other"]:format(args.destName))
	self:SecondaryIcon(63024, args.destName)
end

function mod:LightBomb(args)
	if self:Me(args.destGUID) then
		self:OpenProximity("proximity", 10)
		self:Flash(63018)
	end
	self:TargetMessage(63018, args.destName, "Personal", "Alert")
	self:Bar(63018, 9, L["lightbomb_other"]:format(args.destName))
	self:PrimaryIcon(63018, args.destName)
end

function mod:GravityRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity()
	end
	self:SecondaryIcon(63024)
end

function mod:LightRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity()
	end
	self:PrimaryIcon(63018)
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 33293 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if not exposed1 and hp > 86 and hp <= 88 then
			exposed1 = true
			self:Message(63849, "Attention", nil, L["exposed_warning"])
		elseif not exposed2 and hp > 56 and hp <= 58 then
			exposed2 = true
			self:Message(63849, "Attention", nil, L["exposed_warning"])
		elseif not exposed3 and hp > 26 and hp <= 28 then
			exposed3 = true
			self:Message(63849, "Attention", nil, L["exposed_warning"])
		end
	end
end

