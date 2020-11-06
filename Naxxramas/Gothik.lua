--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Gothik the Harvester", 533, 1608)
if not mod then return end
mod:RegisterEnableMob(16060)
mod.toggleOptions = {"room", "add", "adddeath"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.room = "Room Arrival Warnings"
	L.room_desc = "Warn for Gothik's arrival"

	L.add = "Add Warnings"
	L.add_desc = "Warn for adds"

	L.adddeath = "Add Death Alert"
	L.adddeath_desc = "Alerts when an add dies."

	L.starttrigger1 = "Foolishly you have sought your own demise."
	L.starttrigger2 = "Teamanare shi rikk mannor rikk lok karkun"
	L.startwarn = "Gothik the Harvester engaged! 4:30 till he's in the room."

	L.rider = "Unrelenting Rider"
	L.spectral_rider = "Spectral Rider"
	L.deathknight = "Unrelenting Deathknight"
	L.spectral_deathknight = "Spektral Deathknight"
	L.trainee = "Unrelenting Trainee"
	L.spectral_trainee = "Spectral Trainee"

	L.riderdiewarn = "Rider dead!"
	L.dkdiewarn = "Death Knight dead!"

	L.warn1 = "In room in 3 min"
	L.warn2 = "In room in 90 sec"
	L.warn3 = "In room in 60 sec"
	L.warn4 = "In room in 30 sec"
	L.warn5 = "Gothik Incoming in 10 sec"

	L.wave = "%d/23: %s"

	L.trawarn = "Trainees in 3 sec"
	L.dkwarn = "Deathknights in 3 sec"
	L.riderwarn = "Rider in 3 sec"

	L.trabar = "Trainee - %d"
	L.dkbar = "Deathknight - %d"
	L.riderbar = "Rider - %d"

	L.inroomtrigger = "I have waited long enough. Now you face the harvester of souls."
	L.inroomwarn = "He's in the room!"

	L.inroombartext = "In Room"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

local wave = 0
local timeTrainer, timeDK, timeRider = 27, 77, 137
local numTrainer, numDK, numRider = nil, nil, nil

function mod:OnBossEnable()
	wave = 0
	timeTrainer = 27
	timeDK = 77
	timeRider = 137

	self:Death("DKDead", 16125)
	self:Death("RiderDead", 16126)
	self:Death("Win", 16060)
	self:BossYell("Engage", L["starttrigger1"], L["starttrigger2"])
	self:BossYell("InRoom", L["inroomtrigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DKDead()
	self:MessageOld("adddeath", "red", nil, L["dkdiewarn"], false)
end

function mod:RiderDead()
	self:MessageOld("adddeath", "red", nil, L["riderdiewarn"], false)
end

local function waveWarn(message, color)
	wave = wave + 1
	if wave < 24 then
		mod:MessageOld("add", color, nil, L["wave"]:format(wave, message), false) -- SetOption:add:yellow,orange,red::
	end
	if wave == 23 then
		mod:StopBar(L["trabar"]:format(numTrainer - 1))
		mod:StopBar(L["dkbar"]:format(numDK - 1))
		mod:StopBar(L["riderbar"]:format(numRider - 1))
		mod:CancelAllTimers()
	end
end

local function newTrainee()
	mod:Bar("add", timeTrainer, L["trabar"]:format(numTrainer), "Ability_Seal")
	mod:ScheduleTimer(waveWarn, timeTrainer - 3, L["trawarn"], "yellow")
	mod:ScheduleTimer(newTrainee, timeTrainer)
	numTrainer = numTrainer + 1
end

local function newDeathknight()
	mod:Bar("add", timeDK, L["dkbar"]:format(numDK), "INV_Boots_Plate_08")
	mod:ScheduleTimer(waveWarn, timeDK - 3, L["dkwarn"], "orange")
	mod:ScheduleTimer(newDeathknight, timeDK)
	numDK = numDK + 1
end

local function newRider()
	mod:Bar("add", timeRider, L["riderbar"]:format(numRider), "Spell_Shadow_DeathPact")
	mod:ScheduleTimer(waveWarn, timeRider - 3, L["riderwarn"], "red")
	mod:ScheduleTimer(newRider, timeRider)
	numRider = numRider + 1
end

function mod:OnEngage()
	self:MessageOld("room", "yellow", nil, L["startwarn"], false)
	self:Bar("room", 270, L["inroombartext"], "Spell_Magic_LesserInvisibilty")
	self:DelayedMessage("room", 90, "yellow", L["warn1"])
	self:DelayedMessage("room", 180, "yellow", L["warn2"])
	self:DelayedMessage("room", 210, "orange", L["warn3"])
	self:DelayedMessage("room", 240, "red", L["warn4"])
	self:DelayedMessage("room", 260, "red", L["warn5"])
	numTrainer = 1
	numDK = 1
	numRider = 1
	if self.db.profile.add then
		newTrainee()
		newDeathknight()
		newRider()
	end
	-- set the new times
	timeTrainer = 20
	timeDK = 25
	timeRider = 30
end

function mod:InRoom()
	self:MessageOld("room", "red", nil, L["inroomwarn"], false)
end

