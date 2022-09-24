--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Noth the Plaguebringer", 533, 1604)
if not mod then return end
mod:RegisterEnableMob(15954)
mod:SetEncounterID(1117)
-- mod:SetRespawnTime(0) -- resets, doesn't respawn

--------------------------------------------------------------------------------
-- Locals
--

local timeroom = 90
local timebalcony = 70
local wave2time = 41
local phaseCount = 1
local waveCount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale()
if L then
	L.add_trigger = "Rise, my soldiers! Rise and fight once more!"

	L.teleport = "Teleport"
	L.teleport_desc = "Warnings for when Noth teleports."
	L.teleport_icon = "Spell_Magic_LesserInvisibilty"
	L.teleport_balcony = "Teleport! He's on the balcony!"
	L.teleport_room = "Teleport! He's back in room!"

	L.curse_explosion = "Curse explosion!"
	L.curse_warn = "Curse!"
	L.curse_10secwarn = "Curse in ~10 sec"
	L.curse_bar = "Next Curse"

	L.wave = "Summon Skeletons" -- 29237
	L.wave_desc = "Warnings for the skeleton add waves."
	L.wave_icon = "inv_misc_bone_dwarfskull_01"
	L.wave1 = "Wave 1"
	L.wave2 = "Wave 2"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		29210, -- Blink
		29212, -- Cripple
		29213, -- Curse of the Plaguebringer
		"teleport",
		"wave",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Blink", 29208, 29209, 29210, 29211)
	self:Log("SPELL_AURA_APPLIED", "Cripple", 29212)
	self:Log("SPELL_CAST_SUCCESS", "Curse", 29213, 54835)
	self:BossYell("SkeletonWarriors", L.add_trigger)
end

function mod:OnEngage(diff)
	self:SetStage(1)
	timeroom = 90
	timebalcony = 70
	phaseCount = 1
	waveCount = 1

	self:Message("teleport", "yellow", CL.custom_start_s:format(self.displayName, L.teleport, 90), false)

	self:CDBar(29213, 11, L.curse_bar) -- Curse
	self:CDBar("wave", 15, CL.count:format(L.wave, waveCount), L.wave_icon)
	self:Bar("teleport", timeroom, L.teleport, L.teleport_icon)
	self:DelayedMessage("teleport", timeroom - 10, "orange", CL.soon:format(L.teleport))
	if diff == 4 then -- 25
		self:CDBar(29210, 33) -- Blink
		self:DelayedMessage(29210, 27, "orange", CL.soon:format(self:SpellName(29210)), 29210, "alarm")
	end
	self:ScheduleTimer("TeleportToBalcony", timeroom)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Curse(args)
	self:Message(29213, "red", L.curse_warn)
	self:PlaySound(29213, "alert")
	self:Bar(29213, 10, L.curse_explosion, "spell_shadow_antishadow") -- Wrath of the Plaguebringer
	if self:GetStage() == 1 then
		self:CDBar(29213, 55, L.curse_bar)
		self:DelayedMessage(29213, 45, "red", L.curse_10secwarn, 29213)
	end
end

function mod:Cripple(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId)
		self:PlaySound(args.spellId, "alarm")
	end
end

function mod:Blink(args)
	if self:MobId(args.sourceGUID) ~= 15954 then return end

	self:Message(29210, "purple")
	self:PlaySound(29210, "warning")
	local cd = phaseCount == 3 and 38 or 43
	if self:GetStage() == 1 then
		self:CDBar(29210, cd)
		self:DelayedMessage(29210, cd - 5, "orange", CL.soon:format(self:SpellName(29210)), 29210, "alarm")
	end
end

function mod:SkeletonWarriors(_, msg)
	local cd = 5
	if self:BarTimeLeft(CL.count:format(L.wave, waveCount)) > 0 then
		cd = {5, waveCount == 1 and 15 or 33} -- adjust the time if there is a bar up
	end
	self:Bar("wave", cd, CL.count:format(L.wave, waveCount), L.wave_icon)
	self:ScheduleTimer(function()
		self:Message("wave", "yellow", CL.count:format(L.wave, waveCount), L.wave_icon)
		self:PlaySound("wave", "info")
		waveCount = waveCount + 1
		if self:GetStage() == 1 then
			self:CDBar("wave", 33, CL.count:format(L.wave, waveCount), L.wave_icon) -- 30~42
		end
	end, 5)
end

function mod:TeleportToBalcony()
	if timeroom == 90 then
		timeroom = 110
	elseif timeroom == 110 then
		timeroom = 180
	end

	self:StopBar(L.curse_bar)
	self:CancelDelayedMessage(L.curse_10secwarn)
	self:StopBar(CL.count:format(L.wave, waveCount))
	self:StopBar(29210) -- Blink
	self:CancelDelayedMessage(CL.soon:format(self:SpellName(29210)))

	self:SetStage(2)
	waveCount = 1

	self:Message("teleport", "cyan", L.teleport_balcony, false)
	self:PlaySound("teleport", "long")
	self:Bar("teleport", timebalcony, L.teleport, L.teleport_icon)
	self:DelayedMessage("teleport", timebalcony - 10, "cyan", CL.soon:format(L.teleport), false, "alarm")

	local wave_icon = "spell_shadow_raisedead"
	self:Bar("wave", 10, L.wave1, wave_icon)
	self:DelayedMessage("wave", 10, "yellow", L.wave1, wave_icon, "info")
	self:Bar("wave", wave2time, L.wave2, wave_icon)
	self:DelayedMessage("wave", wave2time, "yellow", L.wave2, wave_icon, "info")
	wave2time = wave2time + 15

	self:ScheduleTimer("TeleportToRoom", timebalcony)
end

function mod:TeleportToRoom()
	if timebalcony == 70 then
		timebalcony = 95
	elseif timebalcony == 95 then
		timebalcony = 120
	end

	self:SetStage(1)
	phaseCount = phaseCount + 1
	waveCount = 1

	self:Message("teleport", "cyan", L.teleport_room, false)
	self:PlaySound("teleport", "long")
	if phaseCount < 4 then
		self:Bar("teleport", timeroom, L.teleport, L.teleport_icon)
		self:DelayedMessage("teleport", timeroom - 10, "cyan", CL.soon:format(L.teleport))
		self:ScheduleTimer("TeleportToBalcony", timeroom)
		self:CDBar("wave", 15, CL.count:format(L.wave, waveCount), L.wave_icon)
	else
		-- he breaks if you live this long? should be enrage, but instead you get no emote adds every ~35s,
		-- will eventually blink + teleport, then emote back after like 3s but stays on the balcony
	end
	self:CDBar(29213, 13, L.curse_bar) -- Curse

	if self:Difficulty() == 4 then -- 25
		self:CDBar(29210, 33) -- Blink
		self:DelayedMessage(29210, 27, "orange", CL.soon:format(self:SpellName(29210)), 29210, "alarm")
	end
end
