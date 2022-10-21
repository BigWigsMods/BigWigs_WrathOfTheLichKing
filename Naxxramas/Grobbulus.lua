--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Grobbulus", 533, 1611)
if not mod then return end
mod:RegisterEnableMob(15931)
mod:SetEncounterID(1111)
-- mod:SetRespawnTime(0) -- resets, doesn't respawn

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.injection = "Injection"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{28169, "ICON", "FLASH", "ME_ONLY_EMPHASIZE"}, -- Mutating Injection
		28240, -- Poison Cloud
		28157, -- Slime Spray
		28137, -- Slime Stream
		"berserk",
	}, nil, {
		[28169] = L.injection,
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MutatingInjectionApplied", 28169)
	self:Log("SPELL_AURA_REMOVED", "MutatingInjectionRemoved", 28169)
	self:Log("SPELL_CAST_SUCCESS", "PoisonCloud", 28240)
	self:Log("SPELL_CAST_SUCCESS", "SlimeSpray", 28157, 54364)
	self:Log("SPELL_CAST_SUCCESS", "SlimeStream", 28137)
end

function mod:OnEngage()
	self:Berserk(540)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MutatingInjectionApplied(args)
	self:TargetMessage(args.spellId, "red", args.destName, L.injection)
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning")
		self:Flash(args.spellId)
	end
	self:TargetBar(args.spellId, 10, args.destName, L.injection)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:MutatingInjectionRemoved(args)
	self:StopBar(args.spellId, args.destName)
	self:PrimaryIcon(args.spellId)
end

function mod:PoisonCloud(args)
	self:Message(args.spellId, "yellow")
	self:CDBar(args.spellId, 15) -- 14.6~17.1
end

function mod:SlimeSpray(args)
	self:Message(28157, "purple")
	self:PlaySound(28157, "alert")
end

function mod:SlimeStream(args)
	self:Message(args.spellId, "orange")
end
