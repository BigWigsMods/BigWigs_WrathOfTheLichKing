--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Sapphiron", 535, 1614)
if not mod then return end
mod:RegisterEnableMob(15989)
mod.toggleOptions = {28542, 28524, {28522, "ICON", "SAY"}, "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local breath = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.airphase_trigger = "Sapphiron lifts off into the air!"
	L.deepbreath_incoming_message = "Ice Bomb casting in ~14sec!"
	L.deepbreath_incoming_soon_message = "Ice Bomb casting in ~5sec!"
	L.deepbreath_incoming_bar = "Ice Bomb Cast"
	L.deepbreath_trigger = "%s takes a deep breath."
	L.deepbreath_warning = "Ice Bomb Incoming!"
	L.deepbreath_bar = "Ice Bomb Lands!"

	L.lifedrain_message = "Life Drain! Next in ~24sec!"
	L.lifedrain_warn1 = "Life Drain in ~5sec!"
	L.lifedrain_bar = "Possible Life Drain"

	L.icebolt_say = "I'm a Block!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Drain", 28542, 55665)
	self:Log("SPELL_CAST_SUCCESS", "Breath", 28524, 29318)
	self:Log("SPELL_AURA_APPLIED", "Icebolt", 28522)

	self:Emote("Airphase", L["airphase_trigger"])
	self:Emote("Deepbreath", L["deepbreath_trigger"])

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:Death("Win", 15989)
end

function mod:OnEngage()
	breath = 1
	self:Berserk(900)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Airphase()
	self:CancelDelayedMessage(L["lifedrain_warn1"])
	self:StopBar(L["lifedrain_bar"])
	--43810 Frost Wyrm, looks like a dragon breathing 'deep breath' :)
	self:Message(28524, "Attention", nil, L["deepbreath_incoming_message"])
	self:Bar(28524, 14, L["deepbreath_incoming_bar"], 43810)
	self:DelayedMessage(28524, 9, "Attention", L["deepbreath_incoming_soon_message"])
end

function mod:Deepbreath()
	self:Message(28524, "Attention", nil, L["deepbreath_warning"])
	self:Bar(28524, 10, L["deepbreath_bar"])
end

function mod:Breath(args)
	breath = breath + 1
	if breath == 2 then
		self:Message(28524, "Important")
	end
end

function mod:Drain(args)
	self:Message(28542, "Urgent", nil, L["lifedrain_message"])
	self:CDBar(28542, 23, L["lifedrain_bar"])
	self:DelayedMessage(28542, 18, "Important", L["lifedrain_warn1"])
end

function mod:Icebolt(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, L["icebolt_say"], true)
	else
		self:TargetMessage(args.spellId, args.destName, "Attention")
	end
	self:PrimaryIcon(args.spellId, args.destName)
end

