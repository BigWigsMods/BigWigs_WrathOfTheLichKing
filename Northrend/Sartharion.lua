--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Sartharion", 531, 1616)
if not mod then return end
-- sartharion, tenebron, shadron, vesperon
mod:RegisterEnableMob(28860, 30449, 30451, 30452)
mod.toggleOptions = {"tsunami", 56908, "drakes", {"twilight", "FLASH"}, "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local shadronStarted, tenebronStarted, vesperonStarted = nil, nil, nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "It is my charge to watch over these eggs. I will see you burn before any harm comes to them!"

	L.tsunami = "Flame Wave"
	L.tsunami_desc = "Warn for churning lava and show a bar."
	L.tsunami_warning = "Wave in ~5sec!"
	L.tsunami_message = "Flame Wave!"
	L.tsunami_cooldown = "Wave Cooldown"
	L.tsunami_trigger = "The lava surrounding %s churns!"

	L.breath_cooldown = "Breath Cooldown"

	L.drakes = "Drake Adds"
	L.drakes_desc = "Warn when each drake add will join the fight."
	L.drakes_incomingsoon = "%s landing in ~5sec!"

	L.twilight = "Twilight Events"
	L.twilight_desc = "Warn what happens in the Twilight."
	L.twilight_trigger_tenebron = "Tenebron begins to hatch eggs in the Twilight!"
	L.twilight_trigger_vesperon = "A Vesperon Disciple appears in the Twilight!"
	L.twilight_trigger_shadron = "A Shadron Acolyte appears in the Twilight!"
	L.twilight_message_tenebron = "Eggs hatching"
	L.twilight_message = "%s add up!"

	L.shadron = "Shadron"
	L.tenebron = "Tenebron"
	L.vesperon = "Vesperon"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "DrakeCheckShadron", 58105)
	self:Log("SPELL_AURA_APPLIED", "DrakeCheckTenebron", 61248)
	self:Log("SPELL_AURA_APPLIED", "DrakeCheckVesperon", 61251)
	self:Log("SPELL_CAST_START", "Breath", 56908, 58956)
	self:Death("Win", 28860)

	self:Emote("Tsunami", L["tsunami_trigger"])
	self:Emote("Tenebron", L["twilight_trigger_tenebron"])
	self:Emote("Shadron", L["twilight_trigger_shadron"])
	self:Emote("Vesperon", L["twilight_trigger_vesperon"])

	self:Yell("Engage", L["engage_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	shadronStarted, tenebronStarted, vesperonStarted = nil, nil, nil
end

function mod:OnEngage()
	self:Bar("tsunami", 30, L["tsunami_cooldown"], 57491)
	self:DelayedMessage("tsunami", 25, "Attention", L["tsunami_warning"])
	self:Berserk(900)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Each drake takes around 12 seconds to land
-- Shadron called in roughly 60s after engage
function mod:DrakeCheckShadron(args)
	if not shadronStarted then
		self:CDBar("drakes", 80, L.shadron, 58105)
		self:DelayedMessage("drakes", 75, "Attention", L["drakes_incomingsoon"]:format(L.shadron))
		shadronStarted = true
	end
end

-- Tenebron called in roughly 15s after engage
function mod:DrakeCheckTenebron(args)
	if not tenebronStarted then
		self:CDBar("drakes", 30, L.tenebron, 61248)
		self:DelayedMessage("drakes", 25, "Attention", L["drakes_incomingsoon"]:format(L.tenebron))
		tenebronStarted = true
	end
end

-- Vesperon called in roughly 105s after engage
function mod:DrakeCheckVesperon(args)
	if not vesperonStarted then
		self:CDBar("drakes", 120, L.vesperon, 61251)
		self:DelayedMessage("drakes", 115, "Attention", L["drakes_incomingsoon"]:format(L.vesperon))
		vesperonStarted = true
	end
end

function mod:Breath(args)
	self:CDBar(56908, 12, L["breath_cooldown"])
end

function mod:Tsunami()
	self:Message("tsunami", "Important", "Alert", L["tsunami_message"], 57491)
	self:Bar("tsunami", 30, L["tsunami_cooldown"], 57491)
	self:DelayedMessage("tsunami", 25, "Attention", L["tsunami_warning"])
end

function mod:Tenebron(msg, mob)
	if mob ~= L.tenebron then return end
	self:Bar("twilight", 20, L["twilight_message_tenebron"], 23851)
	self:Message("twilight", "Attention", nil, L["twilight_message_tenebron"], 23851)
end

function mod:Shadron(msg, mob)
	if mob ~= L.shadron then return end
	self:Message("twilight", "Urgent", nil, L["twilight_message"]:format(mob), 59570)
end

function mod:Vesperon(msg, mob)
	if mob ~= L.vesperon then return end
	self:Message("twilight", "Personal", "Alarm", L["twilight_message"]:format(mob), 59569)
	self:Flash("twilight", 59569)
end

