--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Twin Val'kyr", 543, 1622)
if not mod then return end
mod:RegisterEnableMob(34496, 34497) -- Darkbane, Lightbane
mod.toggleOptions = {{"vortex", "FLASH"}, "shield", "next", {"touch", "FLASH"}, "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local essenceLight = GetSpellInfo(65686)
local essenceDark = GetSpellInfo(65684)
local started = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger1 = "In the name of our dark master. For the Lich King. You. Will. Die."

	L.vortex_or_shield_cd = "Next Vortex or Shield"
	L.next = "Next Vortex or Shield"
	L.next_desc = "Warn for next Vortex or Shield"

	L.vortex = "Vortex"
	L.vortex_desc = "Warn when the twins start casting vortexes."

	L.shield = "Shield of Darkness/Light"
	L.shield_desc = "Warn for Shield of Darkness/Light."

	L.touch = "Touch of Darkness/Light"
	L.touch_desc = "Warn for Touch of Darkness/Light"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "LightVortex", 66046)
	self:Log("SPELL_CAST_START", "DarkVortex", 66058)
	self:Log("SPELL_AURA_APPLIED", "DarkShield", 65874)
	self:Log("SPELL_AURA_APPLIED", "LightShield", 65858)
	self:Log("SPELL_AURA_APPLIED", "Touch", 66001, 65950) -- Dark/Light

	self:Yell("Engage", L["engage_trigger1"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 34496)

	started = nil
end

function mod:OnEngage()
	if started then return end
	started = true
	self:Bar("next", 45, L["vortex_or_shield_cd"], 39089)
	self:Berserk(self:Heroic() and 360 or 480)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Touch(args)
	self:TargetMessage("touch", args.destName, "Personal", "Info", args.spellId)
	if self:Me(args.destGUID) then
		self:Flash("touch", args.spellId)
	end
end

function mod:DarkShield(args)
	self:Bar("shield", 45, L["vortex_or_shield_cd"], 39089)
	if UnitDebuff("player", essenceDark) then
		self:Message("shield", "Important", "Alert", args.spellId)
	else
		self:Message("shield", "Urgent", nil, args.spellId)
	end
end

function mod:LightShield(args)
	self:Bar("shield", 45, L["vortex_or_shield_cd"], 39089)
	if UnitDebuff("player", essenceLight) then
		self:Message("shield", "Important", "Alert", args.spellId)
	else
		self:Message("shield", "Urgent", nil, args.spellId)
	end
end

function mod:LightVortex(args)
	self:Bar("vortex", 45, L["vortex_or_shield_cd"], 39089)
	if UnitDebuff("player", essenceLight) then
		self:Message("vortex", "Positive", nil, args.spellId)
	else
		self:Message("vortex", "Personal", "Alarm", args.spellId)
		self:Flash("vortex", args.spellId)
	end
end

function mod:DarkVortex(args)
	self:Bar("vortex", 45, L["vortex_or_shield_cd"], 39089)
	if UnitDebuff("player", essenceDark) then
		self:Message("vortex", "Positive", nil, args.spellId)
	else
		self:Message("vortex", "Personal", "Alarm", args.spellId)
		self:Flash("vortex", args.spellId)
	end
end

