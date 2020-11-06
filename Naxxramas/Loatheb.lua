--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Loatheb", 533, 1606)
if not mod then return end
mod:RegisterEnableMob(16011)
mod.toggleOptions = {55593, 29865, 29204, 29234, "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local doomTime = 30
local sporeCount = 1
local doomCount = 1
local sporeTime = 16

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.startwarn = "Loatheb engaged, 2 minutes to Inevitable Doom!"

	L.aura_message = "Necrotic Aura - Duration 17 sec!"
	L.aura_warning = "Aura gone in 3 sec!"

	L.deathbloom_warning = "Bloom in 5 sec!"

	L.doombar = "Inevitable Doom %d"
	L.doomwarn = "Doom %d! %d sec to next!"
	L.doomwarn5sec = "Doom %d in 5 sec!"
	L.doomtimerbar = "Doom every 15sec"
	L.doomtimerwarn = "Doom timer changes in %s sec!"
	L.doomtimerwarnnow = "Doom now happens every 15 sec!"

	L.sporewarn = "Spore %d!"
	L.sporebar = "Summon Spore %d"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Aura", 55593)
	self:Log("SPELL_CAST_SUCCESS", "Deathbloom", 29865, 55053)
	self:Log("SPELL_CAST_SUCCESS", "Doom", 29204, 55052)
	self:Log("SPELL_CAST_SUCCESS", "Spore", 29234)
	self:Death("Win", 16011)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

local function swapTime() doomTime = 15 end
function mod:OnEngage(diff)
	doomTime = 30
	sporeCount = 1
	doomCount = 1
	sporeTime = diff == 3 and 36 or 16
	self:Bar(29204, 300, L["doomtimerbar"])
	self:DelayedMessage(29204, 240, "yellow", L["doomtimerwarn"]:format(60))
	self:DelayedMessage(29204, 270, "yellow", L["doomtimerwarn"]:format(30))
	self:DelayedMessage(29204, 290, "orange", L["doomtimerwarn"]:format(10))
	self:DelayedMessage(29204, 295, "red", L["doomtimerwarn"]:format(5))
	self:DelayedMessage(29204, 300, "red", L["doomtimerwarnnow"])

	self:ScheduleTimer(swapTime, 300)
	self:MessageOld(29204, "yellow", nil, L["startwarn"], false)
	self:Bar(29204, 120, L["doombar"]:format(doomCount))
	self:DelayedMessage(29204, 115, "orange", L["doomwarn5sec"]:format(doomCount))

	self:Berserk(720, true)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Aura(args)
	self:MessageOld(args.spellId, "red", nil, L["aura_message"])
	self:Bar(args.spellId, 17)
	self:DelayedMessage(args.spellId, 14, "yellow", L["aura_warning"])
end

function mod:Deathbloom(args)
	self:MessageOld(29865, "red")
	self:Bar(29865, 30)
	self:DelayedMessage(29865, 15, "yellow", L["deathbloom_warning"])
end

function mod:Doom(args)
	self:MessageOld(29204, "orange", nil, L["doomwarn"]:format(doomCount, doomTime))
	doomCount = doomCount + 1
	self:Bar(29204, doomTime, L["doombar"]:format(doomCount))
	self:DelayedMessage(29204, doomTime - 5, "orange", L["doomwarn5sec"]:format(doomCount))
end

function mod:Spore(args)
	--spellId is a question mark, so we use our own: 38755
	self:MessageOld(args.spellId, "red", nil, L["sporewarn"]:format(sporeCount), 38755)
	sporeCount = sporeCount + 1
	self:Bar(args.spellId, sporeTime, L["sporebar"]:format(sporeCount), 38755)
end

