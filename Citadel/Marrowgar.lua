--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lord Marrowgar", 604, 1624)
if not mod then return end
mod:RegisterEnableMob(36612)
mod.toggleOptions = {69076, 69057, {69138, "FLASH"}}

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
	self:Log("SPELL_CAST_START", "BonestormCast", 69076)
	self:Log("SPELL_AURA_APPLIED", "Bonestorm", 69076)
	self:Log("SPELL_AURA_APPLIED", "Coldflame", 69146)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])

	self:Death("Win", 36612)
end

function mod:OnEngage()
	self:CDBar(69076, 45)
	self:DelayedMessage(69076, 40, "Attention", L["bonestorm_warning"])
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local impaleTargets, scheduled = mod:NewTargetList(), nil
	local function impaleWarn(spellId)
		mod:TargetMessage(69057, impaleTargets, "Urgent", "Alert", spellId)
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

function mod:Coldflame(args)
	if self:Me(args.destName) then
		self:Message(69138, "Personal", "Alarm", CL["under"]:format(args.spellName))
		self:Flash(69138)
	end
end

do
	local function afterTheStorm()
		if mod:Heroic() then
			mod:Bar(69076, 55)
			mod:DelayedMessage(69076, 50, "Attention", L["bonestorm_warning"])
		else
			mod:CDBar(69076, 40) -- Bonestorm
			mod:DelayedMessage(69076, 65, "Attention", L["bonestorm_warning"])
			mod:CDBar(69057, 18, 69062) -- Impale
		end
	end
	function mod:Bonestorm(args)
		if not self:Heroic() then
			self:StopBar(69062) -- Impale
		end
		local time = self:Heroic() and 34 or 20
		self:Bar(args.spellId, time)
		self:ScheduleTimer(afterTheStorm, time)
	end
end

function mod:BonestormCast(args)
	self:Message(args.spellId, "Attention")
end

