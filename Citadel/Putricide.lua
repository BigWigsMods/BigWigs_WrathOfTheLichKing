--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Professor Putricide", 604)
if not mod then return end
--Putricide, Gas Cloud (Red Ooze), Volatile Ooze (Green Ooze)
mod:RegisterEnableMob(36678, 37562, 37697)
mod.toggleOptions = {{70447, "ICON"}, {70672, "FLASH"}, 70351, 71255, {72295, "SAY", "FLASH"}, 72451, {70911, "ICON", "FLASH"}, "phase", "berserk", "bosskill"}
local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")
mod.optionHeaders = {
	[70447] = CL.phase:format(1),
	[71255] = CL.phase:format(2),
	[72451] = CL.phase:format(3),
	[70911] = "heroic",
	phase = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local p2, p3, first, barText = nil, nil, nil, "test"
local oozeTargets = mod:NewTargetList()
local gasTargets = mod:NewTargetList()

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase = "Phases"
	L.phase_desc = "Warn for phase changes."
	L.phase_warning = "Phase %d soon!"
	L.phase_bar = "Next Phase"

	L.engage_trigger = "I think I've perfected a plague"

	L.ball_bar = "Next bouncing goo ball"
	L.ball_say = "Goo ball incoming!"

	L.experiment_message = "Ooze incoming!"
	L.experiment_heroic_message = "Oozes incoming!"
	L.experiment_bar = "Next ooze"
	L.blight_message = "Red ooze"
	L.violation_message = "Green ooze"

	L.plague_message = "%2$dx plague on %1$s"
	L.plague_bar = "Next plague"

	L.gasbomb_bar = "More yellow gas bombs"
	L.gasbomb_message = "Yellow bombs!"

	L.unbound_bar = "Unbound Plague: %s"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ChasedByRedOoze", 70672)
	self:Log("SPELL_AURA_APPLIED", "StunnedByGreenOoze", 70447)
	self:Log("SPELL_CAST_START", "Experiment", 70351)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Plague", 72451)
	self:Log("SPELL_CAST_SUCCESS", "GasBomb", 71255)
	self:Log("SPELL_CAST_SUCCESS", "BouncingGooBall", 72295)
	self:Log("SPELL_AURA_APPLIED", "TearGasStart", 71615)
	self:Log("SPELL_AURA_REMOVED", "TearGasOver", 71615)

	-- Heroic
	self:Log("SPELL_AURA_APPLIED", "UnboundPlague", 70911)
	self:Log("SPELL_CAST_START", "VolatileExperiment", 72840)

	self:RegisterEvent("UNIT_HEALTH")

	self:Death("RedOozeDeath", 37562)
	self:Death("Win", 36678)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])
end

function mod:OnEngage()
	self:Berserk(600)
	p2, p3, first = nil, nil, nil
	self:Bar(70351, L["experiment_bar"], 25, 70351)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function stopOldStuff()
		mod:StopBar(L["experiment_bar"])
		mod:StopBar(barText)
	end
	local function newPhase()
		mod:Bar(71255, L["gasbomb_bar"], 14, 71255)
		mod:Bar(72295, L["ball_bar"], 6, 72295)
		if not first then
			mod:Message("phase", CL.phase:format(2), "Positive")
			mod:Bar(70351, L["experiment_bar"], 25, 70351)
			first = true
			p2 = true
		else
			mod:Message("phase", CL.phase:format(3), "Positive")
			first = nil
			p3 = true
		end
	end

	-- Heroic mode phase change
	function mod:VolatileExperiment()
		stopOldStuff()
		self:Message("phase", L["experiment_heroic_message"], "Important")
		if not first then
			self:Bar("phase", L["phase_bar"], 45, "achievement_boss_profputricide")
			self:ScheduleTimer(newPhase, 45)
		else
			self:Bar("phase", L["phase_bar"], 37, "achievement_boss_profputricide")
			self:ScheduleTimer(newPhase, 37)
		end
	end

	-- Normal mode phase change
	local stop = nil
	local function nextPhase()
		stop = nil
	end
	function mod:TearGasStart()
		if stop then return end
		stop = true
		self:Bar("phase", L["phase_bar"], 18, "achievement_boss_profputricide")
		self:ScheduleTimer(nextPhase, 3)
		stopOldStuff()
	end
	function mod:TearGasOver()
		if stop then return end
		stop = true
		self:ScheduleTimer(nextPhase, 13)
		newPhase()
	end
end

function mod:Plague(player, spellId, _, _, _, stack)
	if stack > 1 then
		self:TargetMessage(72451, L["plague_message"], player, "Urgent", spellId, "Info", stack)
		self:Bar(72451, L["plague_bar"], 10, spellId)
	end
end

function mod:UNIT_HEALTH(_, unit)
	if p2 and p3 then
		self:UnregisterEvent("UNIT_HEALTH")
		return
	end
	if UnitName(unit) == self.displayName then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp <= 83 and not p2 then
			self:Message("phase", L["phase_warning"]:format(2), "Positive")
			p2 = true
		elseif hp <= 37 and not p3 then
			self:Message("phase", L["phase_warning"]:format(3), "Positive")
			p3 = true
		end
	end
end

function mod:ChasedByRedOoze(player, spellId)
	self:StopBar(barText)
	self:TargetMessage(70672, L["blight_message"], player, "Personal", spellId)
	if UnitIsUnit(player, "player") then
		self:Flash(70672)
	end
	barText = CL.other:format(L["blight_message"], player)
	self:Bar(70672, barText, 20, spellId)
end

function mod:RedOozeDeath()
	self:StopBar(barText)
end

function mod:StunnedByGreenOoze(player, spellId)
	self:TargetMessage(70447, L["violation_message"], player, "Personal", spellId)
	self:PrimaryIcon(70447, player)
end

function mod:Experiment(_, spellId)
	self:Message(70351, L["experiment_message"], "Attention", spellId, "Alert")
	self:Bar(70351, L["experiment_bar"], 38, spellId)
end

function mod:GasBomb(_, spellId)
	self:Message(71255, L["gasbomb_message"], "Urgent", spellId)
	self:Bar(71255, L["gasbomb_bar"], 35, spellId)
end

do
	local scheduled = nil
	local function scanTarget(spellName)
		scheduled = nil
		local bossId = mod:GetUnitIdByGUID(36678)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target then
			if UnitIsUnit(target, "player") then
				mod:Flash(72295)
				mod:Say(72295, L["ball_say"], true)
			end
			mod:TargetMessage(72295, spellName, target, "Attention", 72295)
		end
	end
	function mod:BouncingGooBall(_, spellId, _, _, spellName)
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(scanTarget, 0.2, spellName)
			if self:Heroic() then
				self:Bar(72295, L["ball_bar"], 20, spellId)
			else
				self:Bar(72295, L["ball_bar"], 25, spellId)
			end
		end
	end
end

do
	local oldPlagueBar = nil
	function mod:UnboundPlague(player, spellId, _, _, spellName)
		local expirationTime = select(7, UnitDebuff(player, spellName))
		if expirationTime then
			if oldPlagueBar then self:StopBar(oldPlagueBar) end
			oldPlagueBar = L["unbound_bar"]:format(player)
			self:Bar(70911, oldPlagueBar, expirationTime - GetTime(), spellId)
		end
		self:TargetMessage(70911, spellName, player, "Personal", spellId, "Alert")
		self:SecondaryIcon(70911, player)
		if UnitIsUnit(player, "player") then
			self:Flash(70911)
		end
	end
end

