--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Noth the Plaguebringer", 533, 1604)
if not mod then return end
mod:RegisterEnableMob(15954)
mod.toggleOptions = {"blink", "teleport", 29213, "wave"}

--------------------------------------------------------------------------------
-- Locals
--

local timeroom = 90
local timebalcony = 70
local cursetime = 55
local wave1time = 10
local wave2time = 41

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.starttrigger1 = "Die, trespasser!"
	L.starttrigger2 = "Glory to the master!"
	L.starttrigger3 = "Your life is forfeit!"
	L.startwarn = "Noth the Plaguebringer engaged! 90 sec till teleport"

	L.blink = "Blink"
	L.blink_desc = "Warnings when Noth blinks."
	L.blinktrigger = "%s blinks away!"
	L.blinkwarn = "Blink!"
	L.blinkwarn2 = "Blink in ~5 sec!"
	L.blinkbar = "Blink"

	L.teleport = "Teleport"
	L.teleport_desc = "Warnings and bars for teleport."
	L.teleportbar = "Teleport!"
	L.backbar = "Back in room!"
	L.teleportwarn = "Teleport! He's on the balcony!"
	L.teleportwarn2 = "Teleport in 10 sec!"
	L.backwarn = "He's back in the room for %d sec!"
	L.backwarn2 = "10 sec until he's back in the room!"

	L.curseexplosion = "Curse explosion!"
	L.cursewarn = "Curse! next in ~55 sec"
	L.curse10secwarn = "Curse in ~10 sec"
	L.cursebar = "Next Curse"

	L.wave = "Waves"
	L.wave_desc = "Alerts for the different waves."
	L.addtrigger = "Rise, my soldiers! Rise and fight once more!"
	L.wave1bar = "Wave 1"
	L.wave2bar = "Wave 2"
	L.wave2_message = "Wave 2 in 10 sec"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Curse", 29213, 54835)

	self:BossYell("Engage", L["starttrigger1"], L["starttrigger2"], L["starttrigger3"])
	self:Emote("Blink", L["blinktrigger"])

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 15954)
end

function mod:OnEngage(diff)
	timeroom = 90
	timebalcony = 70
	cursetime = 55
	wave1time = 10
	wave2time = 41

	self:MessageOld("teleport", "yellow", nil, L["startwarn"], false)
	self:DelayedMessage("teleport", timeroom - 10, "orange", L["teleportwarn2"])
	self:Bar("teleport", timeroom, L["teleportbar"], "Spell_Magic_LesserInvisibilty")
	if diff == 4 then
		self:DelayedMessage("blink", 25, "yellow", L["blinkwarn2"])
		self:Bar("blink", 30, L["blinkbar"], 29208)
	end
	self:ScheduleTimer("TeleportToBalcony", timeroom)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Curse(args)
	self:MessageOld(29213, "red", "alarm", L["cursewarn"])
	self:DelayedMessage(29213, cursetime - 10, "orange", L["curse10secwarn"])
	self:Bar(29213, cursetime, L["cursebar"])
	self:Bar(29213, 10, L["curseexplosion"])
end

function mod:Blink()
	self:MessageOld("blink", "red", nil, L["blinkwarn"], 29208)
	self:DelayedMessage("blink", 34, "yellow", L["blinkwarn2"])
	self:Bar("blink", 39, L["blinkbar"], 29208)
end

function mod:TeleportToBalcony()
	if timeroom == 90 then
		timeroom = 110
	elseif timeroom == 110 then
		timeroom = 180
	end

	self:StopBar(L["blinkbar"])
	self:StopBar(L["cursebar"])

	self:MessageOld("teleport", "red", nil, L["teleportwarn"], false)
	self:Bar("teleport", timebalcony, L["backbar"], "Spell_Magic_LesserInvisibilty")
	self:DelayedMessage("teleport", timebalcony - 10, "orange", L["backwarn2"])

	self:Bar("wave", wave1time, L["wave1bar"], "Spell_ChargePositive")
	self:Bar("wave", wave2time, L["wave2bar"], "Spell_ChargePositive")
	self:DelayedMessage("wave", wave2time - 10, "orange", L["wave2_message"])

	self:ScheduleTimer("TeleportToRoom", timebalcony)
	wave2time = wave2time + 15
end

function mod:TeleportToRoom()
	if timebalcony == 70 then
		timebalcony = 95
	elseif timebalcony == 95 then
		timebalcony = 120
	end

	self:MessageOld("teleport", "red", nil, L["backwarn"]:format(timeroom), false)
	self:Bar("teleport", timeroom, L["teleportbar"], "Spell_Magic_LesserInvisibilty")
	self:DelayedMessage("teleport", timeroom - 10, "orange", L["teleportwarn2"])
	self:ScheduleTimer("TeleportToBalcony", timeroom)
end

