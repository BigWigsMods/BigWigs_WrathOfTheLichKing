--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Lady Deathwhisper", 604, 1625)
if not mod then return end
mod:RegisterEnableMob(36855, 37949, 38010, 37890, 38009, 38135) --Deathwhisper, Cult Adherent, Reanimated Adherent, Cult Fanatic, Reanimated Fanatic, Deformed Fanatic
mod.toggleOptions = {"adds", 70842, 71204, 71426, 71289, {71001, "FLASH"}, "berserk"}
mod.optionHeaders = {
	adds = CL.phase:format(1),
	[71204] = CL.phase:format(2),
	[71289] = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local handle_Adds = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "What is this disturbance?"
	L.phase2_message = "Barrier DOWN - Phase 2!"

	L.dnd_message = "Death and Decay on YOU!"

	L.adds = "Adds"
	L.adds_desc = "Show timers for when the adds spawn."
	L.adds_bar = "Next Adds"
	L.adds_warning = "New adds in 5 sec!"

	L.touch_message = "%2$dx Touch on %1$s"
	L.touch_bar = "Next Touch"

	L.deformed_fanatic = "Deformed Fanatic!"

	L.spirit_message = "Summon Spirit!"
	L.spirit_bar = "Next Spirit"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "DnD", 71001)
	self:Log("SPELL_AURA_REMOVED", "Barrier", 70842)
	self:Log("SPELL_AURA_APPLIED", "DominateMind", 71289)
	self:Log("SPELL_AURA_APPLIED", "Touch", 71204)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Touch", 71204)
	self:Log("SPELL_CAST_START", "Deformed", 70900)
	self:Log("SPELL_SUMMON", "Spirit", 71426)
	self:Death("Win", 36855)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])
end

local function adds(time)
	mod:DelayedMessage("adds", time-5, "Attention", L["adds_warning"])
	mod:Bar("adds", time, L["adds_bar"], 70768)
	handle_Adds = mod:ScheduleTimer(adds, time, time)
end

function mod:OnEngage(diff)
	self:Berserk(600, true)
	self:Bar("adds", 7, L["adds_bar"], 70768)
	if diff > 3 then
		self:CDBar(71289, 30) -- Dominate Mind
	end
	handle_Adds = self:ScheduleTimer(adds, 7, self:Heroic() and 45 or 60)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DnD(args)
	if self:Me(args.destGUID) then
		self:Message(71001, "Personal", "Alarm", L["dnd_message"], 71001)
		self:Flash(71001)
	end
end

function mod:Barrier(args)
	if not self:Heroic() then
		self:CancelTimer(handle_Adds)
		self:StopBar(L["adds_bar"])
		self:CancelDelayedMessage(L["adds_warning"])
	end
	self:Message(70842, "Positive", "Info", L["phase2_message"], args.spellId)
	self:Bar(71426, 30, L["spirit_bar"])
end

do
	local dmTargets, scheduled = mod:NewTargetList(), nil
	local function dmWarn()
		mod:TargetMessage(71289, dmTargets, "Important", "Alert")
		scheduled = nil
	end
	function mod:DominateMind(args)
		dmTargets[#dmTargets + 1] = args.destName
		if not scheduled then
			self:CDBar(71289, 40) -- Dominate Mind
			scheduled = self:ScheduleTimer(dmWarn, 0.3)
		end
	end
end

function mod:Touch(args)
	if (args.amount or 1) > 1 then
		self:StackMessage(71204, args.destName, args.amount, "Urgent")
	end
	self:Bar(71204, 7, L["touch_bar"], 71204)
end

function mod:Deformed()
	self:Message("adds", "Urgent", nil, L["deformed_fanatic"], 70900)
end

do
	local t = 0
	function mod:Spirit(args)
		local time = GetTime()
		if (time - t) > 5 then
			t = time
			self:Message(71426, "Attention", nil, L["spirit_message"])
			self:Bar(71426, 13, L["spirit_bar"])
		end
	end
end

