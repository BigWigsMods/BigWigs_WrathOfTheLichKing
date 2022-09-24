--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Gluth", 533, 1612)
if not mod then return end
mod:RegisterEnableMob(15932)
mod:SetEncounterID(1108)
-- mod:SetRespawnTime(0) -- resets, doesn't respawn, doesn't fuck off

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.decimate_bar = "Decimate Zombies"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{25646, "TANK_HEALER"}, -- Mortal Wound
		28371, -- Enrage
		28374, -- Decimate
		1604, -- Dazed
		"berserk",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "MortalWound", 25646, 54378)
	self:Log("SPELL_AURA_APPLIED_DOSE", "MortalWound", 25646, 54378)
	self:Log("SPELL_CAST_SUCCESS", "Enrage", 28371, 54427)
	self:Log("SPELL_DAMAGE", "Decimate", 28375, 54426)
	self:Log("SPELL_MISSED", "Decimate", 28375, 54426)
	self:Log("SPELL_AURA_APPLIED", "Dazed", 1604)
end

function mod:OnEngage(diff)
	self:Berserk(diff == 3 and 480 or 420)
	self:Bar(25646, 11.3) -- Mortal Wound
	self:CDBar(28374, 90) -- Decimate
	self:DelayedMessage(28374, 85, "orange", CL.soon:format(self:SpellName(28374)), 28374, "alarm")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:MortalWound(args)
	self:StackMessage(25646, "purple", args.destName, args.amount, 5)
	if self:Tank() and (args.amount or 1) > 4 then
		self:PlaySound(25646, "warning")
	end
	self:Bar(25646, 11.3)
end

function mod:Enrage(args)
	self:Message(28371, "red")
	if self:Dispeller("enrage", true) then
		self:PlaySound(28371, "alert")
	end
	self:Bar(28371, 8)
end

do
	local prev = 0
	function mod:Decimate(args)
		local t = args.time
		if t - prev > 5 then
			prev = t
			self:Message(28374, "yellow")
			self:PlaySound(28374, "long")
			self:CDBar(28374, 90)
			self:DelayedMessage(28374, 85, "orange", CL.soon:format(args.spellName), 28374, "alarm")
		end
	end
end

do
	local prev = {}
	function mod:Dazed(args)
		if args.time - (prev[args.destName] or 0) > 5 then
			prev[args.destName] = args.time
			self:TargetMessage(args.spellId, "orange", args.destName)
		end
	end
end
