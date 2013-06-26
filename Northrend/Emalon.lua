--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Emalon the Storm Watcher", 532)
if not mod then return end
mod:RegisterEnableMob(33993)
mod.toggleOptions = {64216, {64218, "ICON"}, "proximity", "berserk", "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.overcharge_message = "A minion is overcharged!"
	L.overcharge_bar = "Explosion"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Nova", 64216, 65279)
	self:Log("SPELL_CAST_SUCCESS", "Overcharge", 64218)
	self:Log("SPELL_HEAL", "OverchargeIcon", 64218)
	self:Death("Win", 33993)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	self:OpenProximity("proximity", 5)
	self:CDBar(64218, 45) -- Overcharge
	self:Berserk(360)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Nova(args)
	self:Message(64216, "Attention")
	self:Bar(64216, 5, CL["cast"]:format(args.spellName))
	self:CDBar(64216, 25)
end

function mod:Overcharge(args)
	self:Message(args.spellId, "Positive", nil, L["overcharge_message"])
	self:Bar(args.spellId, 20, L["overcharge_bar"])
	self:CDBar(args.spellId, 45)
end

do
	local overcharge, timer = GetSpellInfo(64218), nil
	local function scanTarget(destGUID)
		local unitId = mod:GetUnitIdByGUID(destGUID)
		if not unitId then return end
		SetRaidTarget(unitId, 8)
		mod:CancelTimer(timer)
		timer = nil
	end

	function mod:OverchargeIcon(args)
		if (not UnitIsGroupLeader("player") and not UnitIsGroupAssistant("player")) or bit.band(self.db.profile[overcharge], BigWigs.C.ICON) ~= BigWigs.C.ICON then return end
		if not timer then
			timer = self:ScheduleRepeatingTimer(scanTarget, 0.2, args.destGUID)
		end
	end
end

