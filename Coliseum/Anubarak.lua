-------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Anub'arak", 543, 1623)
if not mod then return end
mod.toggleOptions = {66012, "burrow", {67574, "ICON", "FLASH"}, {66013, "FLASH"}, 66118, 66134, "berserk"}
mod:RegisterEnableMob(34564, 34607, 34605)
mod.optionHeaders = {
	[66012] = "normal",
	[66134] = "heroic",
	berserk = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local handle_NextWave = nil
local handle_NextStrike = nil

local isBurrowed = nil
local phase2 = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_message = "Anub'arak engaged, burrow in 80sec!"
	L.engage_trigger = "This place will serve as your tomb!"

	L.unburrow_trigger = "emerges from the ground"
	L.burrow_trigger = "burrows into the ground"
	L.burrow = "Burrow"
	L.burrow_desc = "Shows timers for emerges and submerges, and also add spawn timers."
	L.burrow_soon = "Burrow soon"

	L.nerubian_message = "Adds incoming!"
	L.nerubian_burrower = "More adds"

	L.shadow_soon = "Shadow Strike in ~5sec!"

	L.chase = "Pursue"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

-- Shadow Strike!
-- 1. On engage, start a 30.5 second shadow strike timer if heroic.
-- 2. When the 30.5 second timer is over, restart it.
-- 3. When an add casts shadow strike, cancel all timers and restart at 30.5 seconds.
-- 4. When Anub'arak emerges from a burrow, start the timers after 5.5 seconds, so
--    the time from emerge -> Shadow Strike is 5.5 + 30.5 seconds = 36 seconds.

local function unscheduleStrike()
	mod:CancelDelayedMessage(L["shadow_soon"])
	mod:CancelTimer(handle_NextStrike)
	mod:StopBar(66134)
end

local function scheduleStrike()
	unscheduleStrike()
	mod:Bar(66134, 30.5)
	mod:DelayedMessage(66134, 25.5, "Attention", L["shadow_soon"])
	handle_NextStrike = mod:ScheduleTimer(scheduleStrike, 30.5)
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Swarm", 66118)
	self:Log("SPELL_CAST_SUCCESS", "ColdCooldown", 66013)
	self:Log("SPELL_AURA_APPLIED", "ColdDebuff", 66013)
	self:Log("SPELL_AURA_APPLIED", "Pursue", 67574)

	self:Log("SPELL_CAST_START", scheduleStrike, 66134)
	self:Log("SPELL_CAST_SUCCESS", "FreezeCooldown", 66012)
	self:Log("SPELL_MISSED", "FreezeCooldown", 66012)

	self:Emote("Burrow", L["burrow_trigger"])
	self:Emote("Surface", L["unburrow_trigger"])

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 34564)
end

local function scheduleWave()
	if isBurrowed then return end
	mod:Message("burrow", "Urgent", nil, L["nerubian_message"], 66333)
	mod:Bar("burrow", 45, L["nerubian_burrower"], 66333)
	handle_NextWave = mod:ScheduleTimer(scheduleWave, 45)
end

function mod:OnEngage()
	isBurrowed = nil
	self:Message("burrow", "Attention", nil, L["engage_message"], 65919)
	self:Bar("burrow", 80, L["burrow"], 65919)
	self:DelayedMessage("burrow", 65, L["burrow_soon"], "Attention")

	self:Bar("burrow", 10, L["nerubian_burrower"], 66333)
	handle_NextWave = self:ScheduleTimer(scheduleWave, 10)

	if self:GetOption(66134) and self:Heroic() then
		scheduleStrike()
	end

	self:Berserk(570, true)
	phase2 = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FreezeCooldown(args)
	self:CDBar(args.spellId, 20)
end

do
	local coldTargets, scheduled = mod:NewTargetList(), nil
	local function coldWarn(spellId)
		mod:TargetMessage(spellId, coldTargets, "Urgent")
		scheduled = nil
	end
	function mod:ColdDebuff(args)
		if not phase2 then return end
		coldTargets[#coldTargets + 1] = args.destName
		if self:Me(args.destGUID) then
			self:Flash(args.spellId)
		end
		if not scheduled then
			scheduled = self:ScheduleTimer(coldWarn, 0.2, args.spellId)
		end
	end
end

function mod:ColdDebuff(args)
	if self:Me(args.destGUID) and phase2 then
		self:Message(args.spellId, "Personal")
		self:Flash(args.spellId)
	end
end

function mod:ColdCooldown(args)
	if phase2 then
		self:CDBar(args.spellId, 15)
	end
end

function mod:Swarm(args)
	self:Message(args.spellId, "Important", "Long")
	phase2 = true
	self:StopBar(L["burrow"])
	self:CancelDelayedMessage(L["burrow_soon"])
	if not self:Heroic() then -- Normal modes
		self:StopBar(L["nerubian_burrower"])
		self:CancelTimer(handle_NextWave)
	end
end

function mod:Pursue(args)
	self:TargetMessage(args.spellId, args.destName, "Personal", "Alert", L["chase"])
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Burrow()
	isBurrowed = true
	unscheduleStrike()
	self:StopBar(66012)
	self:StopBar(L["nerubian_burrower"])
	self:CancelTimer(handle_NextWave)

	self:Bar("burrow", 65, L["burrow"], 65919)
end

function mod:Surface()
	isBurrowed = nil
	self:Bar("burrow", 76, L["burrow"], 65919)
	self:DelayedMessage("burrow", 61, "Attention", L["burrow_soon"])

	self:Bar("burrow", 5, L["nerubian_burrower"], 66333)
	handle_NextWave = self:ScheduleTimer(scheduleWave, 5)

	if self:GetOption(66134) and self:Heroic() then
		unscheduleStrike()
		handle_NextStrike = self:ScheduleTimer(scheduleStrike, 5.5)
	end
end

