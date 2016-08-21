--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Yogg-Saron", 529, 1649)
if not mod then return end
--Sara = 33134, Yogg brain = 33890
mod:RegisterEnableMob(33288, 33134, 33890)
mod.toggleOptions = {62979, {63138, "FLASH"}, "tentacle", {63830, "ICON"}, {63802, "FLASH"}, 64125, "portal", "weakened", 64059, {64465, "ICON"}, 64163, 64189, "phase", {63050, "FLASH"}, 63120, "berserk"}

mod.optionHeaders = {
	[62979] = CL.phase:format(1),
	tentacle = CL.phase:format(2),
	[64465] = CL.phase:format(3),
	[64189] = "hard",
	phase = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local guardianCount = 1
local crusherCount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L["Crusher Tentacle"] = true
	L["The Observation Ring"] = true

	L.phase = "Phase"
	L.phase_desc = "Warn for phase changes."
	L.engage_warning = "Phase 1"
	L.engage_trigger = "^The time to"
	L.phase2_warning = "Phase 2"
	L.phase2_trigger = "^I am the lucid dream"
	L.phase3_warning = "Phase 3"
	L.phase3_trigger = "^Look upon the true face"

	L.portal = "Portal"
	L.portal_desc = "Warn for Portals."
	L.portal_trigger = "Portals open into %s's mind!"
	L.portal_message = "Portals open!"
	L.portal_bar = "Next portals"

	L.fervor_cast_message = "Casting Fervor on %s!"
	L.fervor_message = "Fervor on %s!"

	L.sanity_message = "You're going insane!"

	L.weakened = "Stunned"
	L.weakened_desc = "Warn when Yogg-saron becomes stunned."
	L.weakened_message = "%s is stunned!"
	L.weakened_trigger = "The illusion shatters and a path to the central chamber opens!"

	L.madness_warning = "Madness in 5sec!"
	L.malady_message = "Malady: %s"

	L.tentacle = "Crusher Tentacle"
	L.tentacle_desc = "Warn for Crusher Tentacle spawn."
	L.tentacle_message = "Crusher %d!"

	L.link_warning = "You are linked!"

	L.gaze_bar = "~Gaze Cooldown"
	L.empower_bar = "~Empower Cooldown"

	L.guardian_message = "Guardian %d!"

	L.empowericon_message = "Empower Faded!"

	L.roar_warning = "Roar in 5sec!"
	L.roar_bar = "Next Roar"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FervorCast", 63138)
	self:Log("SPELL_AURA_APPLIED", "Fervor", 63138)
	self:Log("SPELL_CAST_START", "Roar", 64189)
	self:Log("SPELL_CAST_START", "Madness", 64059)
	self:Log("SPELL_CAST_SUCCESS", "Empower", 64465)
	self:Log("SPELL_AURA_APPLIED", "EmpowerIcon", 64465)
	self:Log("SPELL_AURA_REMOVED", "RemoveEmpower", 64465)
	self:Log("SPELL_CAST_SUCCESS", "Tentacle", 64144)
	self:Log("SPELL_AURA_APPLIED", "Squeeze", 64125, 64126)
	self:Log("SPELL_AURA_APPLIED", "Linked", 63802)
	self:Log("SPELL_AURA_REMOVED", "Gaze", 64163)
	self:Log("SPELL_AURA_APPLIED", "CastGaze", 64163)
	self:Log("SPELL_AURA_APPLIED", "Malady", 63830, 63881)
	self:Log("SPELL_AURA_REMOVED", "RemoveMalady", 63830, 63881)
	self:Log("SPELL_AURA_APPLIED", "Insane", 63120)
	self:Log("SPELL_AURA_REMOVED_DOSE", "SanityDecrease", 63050)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SanityIncrease", 63050)
	self:Log("SPELL_SUMMON", "Guardian", 62979)
	self:Death("Win", 33288)
	self:Emote("Portal", L["portal_trigger"])
	self:Emote("Weakened", L["weakened_trigger"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])
	self:Yell("Yells", L["phase2_trigger"], L["phase3_trigger"])
end

function mod:OnEngage()
	guardianCount = 1
	self:Message("phase", "Attention", nil, L["engage_warning"], false)
	self:Berserk(900, true)
end

function mod:VerifyEnable()
	local z = GetSubZoneText()
	if z and z == L["The Observation Ring"] then return false end
	return true
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FervorCast(args)
	local bossId = self:GetUnitIdByGUID(33134)
	if bossId then
		local target = UnitName(bossId .. "target")
		if not target then return end
		self:Message(args.spellId, "Personal", nil, L["fervor_cast_message"]:format(target))
	end
end

function mod:Fervor(args)
	self:Bar(args.spellId, 15, L["fervor_message"]:format(args.destName))
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
end

do
	local warned = {}
	function mod:SanityIncrease(args)
		if not warned[args.destName] then return end
		if args.amount > 70 then warned[args.destName] = nil end
	end
	function mod:SanityDecrease(args)
		if warned[args.destName] then return end
		if self:Me(args.destGUID) then
			if args.amount > 40 then return end
			self:Message(args.spellId, "Personal", nil, L["sanity_message"])
			self:Flash(args.spellId)
			warned[args.destName] = true
		elseif args.amount < 31 then
			warned[args.destName] = true
		end
	end
end

function mod:Guardian(args)
	self:Message(args.spellId, "Positive", nil, L["guardian_message"]:format(guardianCount))
	guardianCount = guardianCount + 1
end

function mod:Insane(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
end

function mod:Tentacle(args)
	-- Crusher Tentacle (33966) 50 sec
	-- Corruptor Tentacle (33985) 25 sec
	-- Constrictor Tentacle (33983) 20 sec
	if self:MobId(args.sourceGUID) == 33966 then
		self:Message("tentacle", "Important", nil, L["tentacle_message"]:format(crusherCount), 64139)
		crusherCount = crusherCount + 1
		self:Bar("tentacle", 55, L["tentacle_message"]:format(crusherCount), 64139)
	end
end

function mod:Roar(args)
	self:Message(args.spellId, "Attention")
	self:Bar(args.spellId, 60, L["roar_bar"])
	self:DelayedMessage(args.spellId, 55, "Attention", L["roar_warning"])
end

function mod:Malady(args)
	self:PrimaryIcon(63830, args.destName)
end

function mod:RemoveMalady()
	self:PrimaryIcon(63830)
end

function mod:Squeeze(args)
	self:TargetMessage(64125, args.destName, "Positive")
end

function mod:Linked(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "Personal", "Alarm", L["link_warning"])
		self:Flash(args.spellId)
	end
end

function mod:Gaze(args)
	self:Bar(args.spellId, 9, L["gaze_bar"])
end

function mod:CastGaze(args)
	self:Bar(args.spellId, 4)
end

function mod:Madness(args)
	self:Bar(args.spellId, 60)
	self:DelayedMessage(args.spellId, 55, "Urgent", L["madness_warning"])
end

function mod:Empower(args)
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 46, L["empower_bar"])
end

function mod:RemoveEmpower(args)
	self:Message(args.spellId, "Positive", nil, L["empowericon_message"])
	--self:SendMessage("BigWigs_RemoveRaidIcon")
end

do
	local empowerscanner = nil
	local function scanTarget(dGuid)
		local unitId = mod:GetUnitIdByGUID(dGuid)
		if not unitId then return end
		SetRaidTarget(unitId, 8)
		mod:CancelTimer(empowerscanner)
		empowerscanner = nil
	end
	function mod:EmpowerIcon(args)
		if empowerscanner or (not UnitIsGroupLeader("player") and not UnitIsGroupAssistant("player")) then return end
		if bit.band(self.db.profile[64465], BigWigs.C.ICON) ~= BigWigs.C.ICON then return end
		empowerscanner = self:ScheduleRepeatingTimer(scanTarget, 0.3, args.destGUID)
	end
end

function mod:Portal()
	self:Message("portal", "Positive", nil, L["portal_message"], 35717)
	self:Bar("portal", 90, L["portal_bar"], 35717)
end

function mod:Weakened(_, unit)
	self:Message("weakened", "Positive", nil, L["weakened_message"]:format(unit), 50661)
end

function mod:Yells(msg)
	if msg:find(L["phase2_trigger"]) then
		crusherCount = 1
		self:Message("phase", "Attention", nil, L["phase2_warning"], false)
		self:Bar("portal", 78, L["portal_bar"], 35717)
	elseif msg:find(L["phase3_trigger"]) then
		self:CancelDelayedMessage(L["madness_warning"])

		self:StopBar(64059) -- Induce Madness
		self:StopBar(L["tentacle_message"]:format(crusherCount))
		self:StopBar(L["portal_bar"])

		self:Message("phase", "Important", "Alarm", L["phase3_warning"], false)
		self:Bar(64465, 46, L["empower_bar"])
	end
end

