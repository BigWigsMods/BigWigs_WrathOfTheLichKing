--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Archavon the Stone Watcher", 532, 1597)
if not mod then return end
mod:RegisterEnableMob(31125)
mod.toggleOptions = {58663, "charge", {58678, "MESSAGE", "ICON"}, {58965, "FLASH"}, "berserk"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.stomp_message = "Stomp - Charge Inc!"
	L.stomp_warning = "Possible Stomp in ~5sec!"

	L.charge = "Charge"
	L.charge_desc = "Warn about Charge on players."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Stomp", 58663, 60880)
	self:Log("SPELL_CAST_START", "Shards", 58678)
	self:Log("SPELL_AURA_APPLIED", "Cloud", 58965, 61672)
	self:Death("Win", 31125)

	-- Need the actual emote for the charge to use :Emote
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	self:CDBar(58663, 47) -- Stomp
	self:DelayedMessage(58663, 42, "Attention", L["stomp_warning"])
	self:Berserk(300)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Stomp(args)
	self:Message(58663, "Positive", nil, L["stomp_message"])
	self:CDBar(58663, 47)
	self:DelayedMessage(58663, 42, "Attention", L["stomp_warning"])
end

function mod:Cloud(args)
	if self:Me(args.destGUID) then
		self:Message(58965, "Personal", "Alarm", CL["you"]:format(args.spellName))
		self:Flash(58965)
	end
end

do
	local handle = nil
	local function scanTarget(spellId)
		handle = nil
		local bossId = mod:GetUnitIdByGUID(31125)
		if not bossId then return end
		local target = mod:UnitName(bossId .. "target")
		if target then
			mod:TargetMessage(58965, target, "Important", nil, spellId)
			mod:PrimaryIcon(58965, target)
		end
	end
	function mod:Shards(args)
		if not handle then
			handle = self:ScheduleTimer(scanTarget, 0.2, args.spellId)
		end
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, _, unit, _, _, player)
	if unit == self.displayName then
		self:TargetMessage("charge", player, "Attention", nil, L["charge"], 11578)
	end
end

