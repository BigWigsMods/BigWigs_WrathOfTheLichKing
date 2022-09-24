--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Heigan the Unclean", 533, 1605)
if not mod then return end
mod:RegisterEnableMob(15936)
mod:SetEncounterID(1112)
-- mod:SetRespawnTime(0) -- resets, doesn't respawn

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.teleport_trigger = "The end is upon you."

	L.teleport = "Teleport"
	L.teleport_desc = "Warn for Teleports."
	L.teleport_icon = "Spell_Arcane_Blink"
	L.teleport_1min_message = "Teleport in 1 min"
	L.teleport_30sec_message = "Teleport in 30 sec"
	L.teleport_10sec_message = "Teleport in 10 sec!"
	L.on_platform_message = "Teleport! On platform for 45 sec!"

	L.to_floor_30sec_message = "Back in 30 sec"
	L.to_floor_10sec_message = "Back in 10 sec!"
	L.on_floor_message = "Back on the floor! 90 sec to next teleport!"

	L.teleport_bar = "Teleport!"
	L.back_bar = "Back on the floor!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29998, -- Decrepit Fever
		"teleport",
	}
end

function mod:OnBossEnable()
	self:BossYell("Teleport", L.teleport_trigger)
	self:Log("SPELL_CAST_SUCCESS", "DecrepitFever", 29998, 55011)
end

function mod:OnEngage()
	self:Message("teleport", "yellow", CL.custom_start_s:format(self.displayName, L.teleport, 90), false)
	self:Bar("teleport", 90, L.teleport_bar, L.teleport_icon)
	self:DelayedMessage("teleport", 30, "yellow", L.teleport_1min_message)
	self:DelayedMessage("teleport", 60, "orange", L.teleport_30sec_message)
	self:DelayedMessage("teleport", 80, "red", L.teleport_10sec_message)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DecrepitFever(args)
	self:Message(29998, "cyan")
	self:PlaySound(29998, "alert")
end

local function backToRoom()
	mod:Message("teleport", "yellow", L.on_floor_message, false)
	mod:PlaySound("teleport", "long")
	mod:DelayedMessage("teleport", 60, "orange", L.teleport_30sec_message)
	mod:DelayedMessage("teleport", 80, "red", L.teleport_10sec_message, false, "info")
	mod:Bar("teleport", 90, L.teleport_bar, L.teleport_icon)
end

function mod:Teleport()
	self:ScheduleTimer(backToRoom, 45)
	self:Message("teleport", "yellow", L.on_platform_message, false)
	self:PlaySound("teleport", "long")
	self:DelayedMessage("teleport", 15, "orange", L.to_floor_30sec_message)
	self:DelayedMessage("teleport", 35, "red", L.to_floor_10sec_message, false, "info")
	self:Bar("teleport", 45, L.back_bar, L.teleport_icon)
end
