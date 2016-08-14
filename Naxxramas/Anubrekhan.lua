--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Anub'Rekhan", 535, 1601)
if not mod then return end
mod:RegisterEnableMob(15956)
mod.toggleOptions = {28785}

--------------------------------------------------------------------------------
-- Locals
--

local locustTime = 90
local started = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.starttrigger1 = "Just a little taste..."
	L.starttrigger2 = "Yes, run! It makes the blood pump faster!"
	L.starttrigger3 = "There is no way out."
	L.engagewarn = "Anub'Rekhan engaged! Locust Swarm in ~%d sec"

	L.gainnextwarn = "Next Locust Swarm in ~85 sec"
	L.gainwarn10sec = "~10 sec until Locust Swarm"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "GainSwarm", 28785, 54021)
	self:Log("SPELL_CAST_START", "Swarm", 28785, 54021)
	self:Death("Win", 15956)

	started = nil
	self:Yell("Engage", L["starttrigger1"], L["starttrigger2"], L["starttrigger3"])
end

function mod:OnEngage(diff)
	if started then return end
	started = true
	locustTime = diff == 3 and 102 or 90
	self:Message(28785, "Attention", nil, L["engagewarn"]:format(locustTime), false)
	self:DelayedMessage(28785, locustTime - 10, "Important", L["gainwarn10sec"])
	self:CDBar(28785, locustTime) -- Locus Swarm
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GainSwarm(args)
	if self:MobId(args.destGUID) == 15956 then
		self:DelayedMessage(28785, 20, "Important", CL["over"]:format(args.spellName))
		self:Bar(28785, 20, 131394) -- "Swarming Insects"
		self:DelayedMessage(28785, 75, L["gainwarn10sec"], "Important")
		self:CDBar(28785, 85)
	end
end

function mod:Swarm(args)
	self:Message(28785, "Attention", nil, CL["incoming"]:format(args.spellName))
	self:Bar(28785, 3, CL["incoming"]:format(args.spellName))
end

