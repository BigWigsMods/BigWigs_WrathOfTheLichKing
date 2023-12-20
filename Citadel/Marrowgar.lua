--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lord Marrowgar", 631, 1624)
if not mod then return end
mod:RegisterEnableMob(36612)
-- mod:SetEncounterID(1101)
-- mod:SetRespawnTime(30)
mod.toggleOptions = {69076, 69057, 69138}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "The Scourge will wash over this world as a swarm of death and destruction!"

	L.bonestorm_warning = "Bone Storm in 5 sec!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_SUMMON", "Impale", 69062, 72669, 72670) --25, ??, ??
	self:Log("SPELL_CAST_START", "BoneStormCast", 69076)
	self:Log("SPELL_AURA_APPLIED", "BoneStormApplied", 69076)
	self:Log("SPELL_AURA_APPLIED", "ColdflameDamage", 69146)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:BossYell("Engage", L["engage_trigger"])

	self:Death("Win", 36612)
end

function mod:OnEngage()
	self:CDBar(69076, 45) -- Bone Storm
	self:DelayedMessage(69076, 40, "yellow", L["bonestorm_warning"]) -- Bone Storm
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local impaleTargets, scheduled = mod:NewTargetList(), nil
	local function impaleWarn(spellId)
		mod:TargetMessageOld(69057, impaleTargets, "orange", "alert", spellId)
		scheduled = nil
	end
	function mod:Impale(args)
		impaleTargets[#impaleTargets + 1] = args.destName
		if not scheduled then
			scheduled = self:ScheduleTimer(impaleWarn, 0.3, args.spellId)
			self:CDBar(69057, 15, args.spellId)
		end
	end
end

do
	local prev = 0
	function mod:ColdflameDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PlaySound(69138, "underyou")
			self:PersonalMessage(69138, "underyou")
		end
	end
end

do
	local function afterTheStorm()
		if mod:Heroic() then
			mod:Bar(69076, 55)
			mod:DelayedMessage(69076, 50, "yellow", L["bonestorm_warning"])
		else
			mod:CDBar(69076, 40) -- Bonestorm
			mod:DelayedMessage(69076, 65, "yellow", L["bonestorm_warning"])
			mod:CDBar(69057, 18, 69062) -- Impale
		end
	end
	function mod:BoneStormApplied(args)
		if not self:Heroic() then
			self:StopBar(69062) -- Impale
		end
		local time = self:Heroic() and 34 or 20
		self:Bar(args.spellId, time)
		self:ScheduleTimer(afterTheStorm, time)
	end
end

function mod:BoneStormCast(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "long")
end
