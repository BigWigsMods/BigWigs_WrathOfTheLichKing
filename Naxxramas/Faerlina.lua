--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Grand Widow Faerlina", 535, 1602)
if not mod then return end
--Faerlina, Worshipper, Follower
mod:RegisterEnableMob(15953, 16506, 16505)
mod.toggleOptions = {28732, {28794, "FLASH"}, 28798}

--------------------------------------------------------------------------------
-- Locals
--

local started = nil
local frenzied = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.starttrigger1 = "Kneel before me, worm!"
	L.starttrigger2 = "Slay them in the master's name!"
	L.starttrigger3 = "You cannot hide from me!"
	L.starttrigger4 = "Run while you still can!"

	L.startwarn = "Faerlina engaged, 60 sec to frenzy!"

	L.enragewarn15sec = "15 sec to frenzy!"
	L.enragewarn = "Frenzied!"
	L.enragewarn2 = "Frenzied Soon!"
	L.enrageremovewarn = "Frenzy removed! ~60 sec until next!"

	L.silencewarn = "Silenced!"
	L.silencewarn5sec = "Silence ends in 5 sec"
	L.silencebar = "Silence"

	L.rain_message = "Fire on YOU!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Silence", 28732, 54097)
	self:Log("SPELL_AURA_APPLIED", "Rain", 28794, 54099)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 28798, 54100)
	self:Death("Win", 15953)

	started = nil

	self:Yell("Engage", L["starttrigger1"], L["starttrigger2"], L["starttrigger3"], L["starttrigger4"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

function mod:OnEngage()
	if not started then
		self:Message(28798, "Attention", nil, L["startwarn"], false)
		self:DelayedMessage(28798, 45, "Important", L["enragewarn2"])
		self:Bar(28798, 60)
		started = true --If I remember right, we need this as she sometimes uses an engage trigger mid-fight
		frenzied = nil
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Silence(args)
	if self:MobId(args.destGUID) ~= 15953 then return end

	if not frenzied then
		-- preemptive, 30s silence
		self:Message(28732, "Positive", nil, L["silencewarn"])
		self:Bar(28732, 30, L["silencebar"])
		self:DelayedMessage(28732, 25, "Urgent", L["silencewarn5sec"])
	else
		-- Reactive enrage removed
		self:Message(28798, "Positive", nil, L["enrageremovewarn"])
		self:DelayedMessage(28798, 45, "Important", L["enragewarn2"])
		self:Bar(28798, 60)

		self:Bar(28732, 30, L["silencebar"])
		self:DelayedMessage(28732, 25, "Urgent", L["silencewarn5sec"])
		frenzied = nil
	end
end

function mod:Rain(args)
	if self:Me(args.destGUID) then
		self:Message(28794, "Personal", "Alarm", L["rain_message"], 54099)
		self:Flash(28794)
	end
end

function mod:Frenzy(args)
	if self:MobId(args.destGUID) == 15953 then
		self:Message(28798, "Urgent", nil, L["enragewarn"])
		self:StopBar(args.spellName)
		self:CancelDelayedMessage(L["enragewarn2"])
		frenzied = true
	end
end

