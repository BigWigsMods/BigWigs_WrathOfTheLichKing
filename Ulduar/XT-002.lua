--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("XT-002 Deconstructor", 603, 1640)
if not mod then return end
mod:RegisterEnableMob(33293)
mod.engageId = 1142
--mod.respawnTime = resets, doesn't respawn

--------------------------------------------------------------------------------
-- Locals
--

local exposed1 = false
local exposed2 = false
local exposed3 = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.gravitybomb_other = "Gravity"
	L.lightbomb_other = "Light"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{64234, "ICON", "FLASH", "SAY", "SAY_COUNTDOWN", "PROXIMITY"}, -- Gravity Bomb
		{65121, "ICON", "FLASH", "SAY", "PROXIMITY"}, -- Searing Light
		62776, -- Tympanic Tantrum
		64193, -- Heartbreak
		63849, -- Exposed Heart
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ExposedHeart", 63849)
	self:Log("SPELL_AURA_APPLIED", "Heartbreak", 64193, 65737) -- XXX verify id
	self:Log("SPELL_AURA_APPLIED", "GravityBomb", 64234)
	self:Log("SPELL_AURA_APPLIED", "SearingLight", 65121)
	self:Log("SPELL_AURA_REMOVED", "GravityBombRemoved", 64234)
	self:Log("SPELL_AURA_REMOVED", "SearingLightRemoved", 65121)
	self:Log("SPELL_CAST_START", "TympanicTantrum", 62776)

	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "boss1")
end

function mod:OnEngage()
	exposed1 = false
	exposed2 = false
	exposed3 = false
	self:Berserk(600)
	self:CDBar(62776, 32) -- Tympanic Tantrum
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ExposedHeart(args)
	self:MessageOld(args.spellId, "yellow", "long")
	self:Bar(args.spellId, 30)
end

function mod:Heartbreak()
	self:MessageOld(64193, "red", "info")
end

function mod:TympanicTantrum(args)
	self:MessageOld(args.spellId, "yellow", "warning")
	self:CDBar(args.spellId, 62)
end

function mod:GravityBomb(args)
	if self:Me(args.destGUID) then
		self:OpenProximity(args.spellId, 10)
		self:Flash(args.spellId)
		self:Say(args.spellId)
		self:SayCountdown(args.spellId, 9)
	end
	self:TargetMessageOld(args.spellId, args.destName, "blue", "alert")
	self:TargetBar(args.spellId, 9, args.destName, L.gravitybomb_other)
	self:SecondaryIcon(args.spellId, args.destName)
end

function mod:GravityBombRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity(args.spellId)
		self:CancelSayCountdown(args.spellId)
	end
	self:StopBar(L.gravitybomb_other, args.destName)
	self:SecondaryIcon(args.spellId)
end

function mod:SearingLight(args)
	if self:Me(args.destGUID) then
		self:OpenProximity(args.spellId, 10)
		self:Flash(args.spellId)
		self:Say(args.spellId)
	end
	self:TargetMessageOld(args.spellId, args.destName, "blue", "alert")
	self:TargetBar(args.spellId, 9, args.destName, L.lightbomb_other)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:SearingLightRemoved(args)
	if self:Me(args.destGUID) then
		self:CloseProximity(args.spellId)
	end
	self:StopBar(L.lightbomb_other, args.destName)
	self:PrimaryIcon(args.spellId)
end

function mod:UNIT_HEALTH_FREQUENT(event, unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if not exposed1 and hp > 86 and hp < 90 then
		exposed1 = true
		self:MessageOld(63849, "yellow", nil, CL.soon:format(self:SpellName(63849))) -- Exposed Heart soon
	elseif not exposed2 and hp > 56 and hp < 58 then
		exposed2 = true
		self:MessageOld(63849, "yellow", nil, CL.soon:format(self:SpellName(63849)))
	elseif not exposed3 and hp > 26 and hp < 28 then
		exposed3 = true
		self:UnregisterUnitEvent(event, unit)
		self:MessageOld(63849, "yellow", nil, CL.soon:format(self:SpellName(63849)))
	end
end
