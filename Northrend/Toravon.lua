--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Toravon the Ice Watcher", 532, 1600)
if not mod then return end
mod:RegisterEnableMob(38433)
mod.toggleOptions = {72034, 72091, 72004, 72090}

--------------------------------------------------------------------------------
-- Locals
--

local count = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.whiteout_bar = "Whiteout %d"
	L.whiteout_message = "Whiteout %d soon!"

	L.freeze_message = "Freeze"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Whiteout", 72034)
	self:Log("SPELL_CAST_START", "Orbs", 72091)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Frostbite", 72004)
	self:Log("SPELL_AURA_APPLIED", "Freeze", 72090)
	self:Death("Win", 38433)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	count = 1
	self:Bar(72091, 15) -- Frozen Orb
	self:Bar(72034, 30, L["whiteout_bar"]:format(count))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Whiteout(args)
	self:Message(args.spellId, "Positive")
	count = count + 1
	self:Bar(args.spellId, 35, L["whiteout_bar"]:format(count))
	self:DelayedMessage(args.spellId, 30, "Attention", L["whiteout_message"]:format(count))
end

function mod:Orbs(args)
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 30)
end

function mod:Frostbite(args)
	self:StackMessage(args.spellId, args.destName, args.amount, "Urgent")
end

do
	local freezeTargets, scheduled = mod:NewTargetList(), nil
	local function freezeWarn()
		mod:TargetMessage(72090, freezeTargets, "Personal", nil, L["freeze_message"])
		scheduled = nil
	end
	function mod:Freeze(args)
		freezeTargets[#freezeTargets + 1] = args.destName
		if not scheduled then
			scheduled = self:ScheduleTimer(freezeWarn, 0.2)
		end
	end
end

