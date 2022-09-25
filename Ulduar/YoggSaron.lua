--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Yogg-Saron", 603, 1649)
if not mod then return end
mod:RegisterEnableMob(33288, 33134, 33890) -- Yogg-Saron, Sara, Brain of Yogg-Saron
mod:SetEncounterID(1143)
mod:SetRespawnTime(46)

--------------------------------------------------------------------------------
-- Locals
--

local guardianCount = 1
local crusherCount = 1
local smallTentacleCount = 1
local portalCount = 1
local warnedForSanity = false
local shadowBeacon1GUID, shadowBeacon2GUID = nil, nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "^The time to"
	L.phase2_trigger = "^I am the lucid dream"
	L.phase3_trigger = "^Look upon the true face"

	L.portal = "Portal"
	L.portal_desc = "Warn for Portals."
	L.portal_message = "Portals open!"
	L.portal_bar = "Next portals"

	L.fervor_message = "Fervor on %s!"

	L.sanity_message = "You're going insane!"

	L.weakened = "Stunned"
	L.weakened_desc = "Warn when Yogg-saron becomes stunned."
	L.weakened_message = "%s is stunned!"

	L.madness_warning = "Madness in 10 sec!"

	L.malady_message = "Malady"

	L.tentacle = "Crusher Tentacle"
	L.tentacle_desc = "Warn for Crusher Tentacle spawn."
	L.tentacle_message = "Crusher %d!"

	L.small_tentacles = "Small Tentacles"
	L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = "You are linked!"

	L.guardian_message = "Guardian %d!"

	L.roar_warning = "Roar in 5sec!"
	L.roar_bar = "Next Roar"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

local shadowBeaconMarker = mod:AddMarkerOption(true, "npc", 8, 64465, 8, 7) -- Shadow Beacon
function mod:GetOptions()
	return {
		62979, -- Summon Guardian
		{63138, "FLASH"}, -- Sara's Fervor
		"tentacle",
		"small_tentacles",
		{63830, "ICON", "ME_ONLY"}, -- Malady of the Mind
		{63802, "FLASH"}, -- Brain Link
		64126, -- Squeeze
		"portal",
		"weakened",
		{64059, "COUNTDOWN"}, -- Induce Madness
		64465, -- Shadow Beacon
		shadowBeaconMarker,
		64163, -- Lunatic Gaze
		64189, -- Deafening Roar
		"stages",
		{63050, "FLASH"}, -- Sanity
		63120, -- Insane
		"berserk",
	}, {
		[62979] = CL.stage:format(1),
		tentacle = CL.stage:format(2),
		[64465] = CL.stage:format(3),
		[64189] = "hard",
		stages = "general",
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "SarasFervorCast", 63138)
	self:Log("SPELL_AURA_APPLIED", "SarasFervor", 63138)
	self:Log("SPELL_CAST_START", "DeafeningRoar", 64189)
	self:Log("SPELL_CAST_START", "InduceMadness", 64059)
	self:Log("SPELL_AURA_APPLIED", "IllusionRoom", 63988)
	self:Log("SPELL_AURA_REMOVED", "IllusionRoomExit", 63988)
	self:Log("SPELL_CAST_SUCCESS", "ShadowBeacon", 64465)
	self:Log("SPELL_AURA_APPLIED", "ShadowBeaconApplied", 64465)
	self:Log("SPELL_AURA_REMOVED", "ShadowBeaconRemoved", 64465)
	self:Log("SPELL_CAST_SUCCESS", "TentacleSpawn", 64144) -- Erupt
	self:Log("SPELL_AURA_APPLIED", "Squeeze", 64126)
	self:Log("SPELL_AURA_APPLIED", "BrainLink", 63802)
	self:Log("SPELL_AURA_REMOVED", "LunaticGazeOver", 64163)
	self:Log("SPELL_AURA_APPLIED", "LunaticGaze", 64163)
	self:Log("SPELL_AURA_APPLIED", "MaladyOfTheMind", 63830)
	self:Log("SPELL_AURA_REMOVED", "MaladyOfTheMindRemoved", 63830)
	self:Log("SPELL_AURA_APPLIED", "Insane", 63120)
	self:Log("SPELL_AURA_REMOVED_DOSE", "SanityDecrease", 63050)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SanityIncrease", 63050)
	self:Log("SPELL_SUMMON", "SummonGuardian", 62979)
	self:Log("SPELL_CAST_SUCCESS", "PortalsOpen", 64167) -- Lunatic Gaze
	self:Log("SPELL_CAST_SUCCESS", "BrainStunned", 64173) -- Shattered Illusion

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

function mod:OnEngage()
	guardianCount = 1
	crusherCount = 1
	smallTentacleCount = 1
	portalCount = 1
	warnedForSanity = false
	shadowBeacon1GUID, shadowBeacon2GUID = nil, nil
	self:Berserk(900)
end

function mod:VerifyEnable()
	return BigWigsLoader.GetBestMapForUnit("player") == 150 -- Floor 4, The Prison of Yogg-Saron
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function printTarget(self, name, guid)
		self:TargetMessageOld(63138, name, "orange", "alert")
	end

	function mod:SarasFervorCast(args)
		self:GetUnitTarget(printTarget, 0.5, args.sourceGUID)
	end
end

function mod:SarasFervor(args)
	self:Bar(args.spellId, 15, L.fervor_message:format(self:ColorName(args.destName)))
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
end

function mod:SanityIncrease(args)
	if self:Me(args.destGUID) and warnedForSanity and args.amount > 40 then
		warnedForSanity = false
	end
end

function mod:SanityDecrease(args)
	if self:Me(args.destGUID) and not warnedForSanity and args.amount < 41 then
		warnedForSanity = true
		self:MessageOld(args.spellId, "blue", nil, L.sanity_message)
		self:Flash(args.spellId)
	end
end

function mod:SummonGuardian(args)
	self:MessageOld(args.spellId, "green", nil, L.guardian_message:format(guardianCount))
	guardianCount = guardianCount + 1
end

function mod:Insane(args)
	self:TargetMessageOld(args.spellId, args.destName, "yellow")
end

function mod:TentacleSpawn(args)
	-- Crusher Tentacle (33966) 55 sec
	-- Corruptor Tentacle (33985) 25 sec
	-- Constrictor Tentacle (33983) 25 sec
	if self:MobId(args.sourceGUID) == 33966 then
		self:MessageOld("tentacle", "red", nil, L.tentacle_message:format(crusherCount), 64139)
		crusherCount = crusherCount + 1
		self:Bar("tentacle", 55, L.tentacle_message:format(crusherCount), 64139)
	elseif self:MobId(args.sourceGUID) == 33985 then -- Corruptor & Constrictor at the same time
		self:MessageOld("small_tentacles", "red", nil, CL.count:format(L.small_tentacles, smallTentacleCount), 64139)
		smallTentacleCount = smallTentacleCount + 1
		self:Bar("small_tentacles", 25, CL.count:format(L.small_tentacles, smallTentacleCount), 64139)
	end
end

function mod:DeafeningRoar(args)
	self:MessageOld(args.spellId, "yellow")
	self:Bar(args.spellId, 60, L.roar_bar)
	self:DelayedMessage(args.spellId, 55, "yellow", L.roar_warning)
end

function mod:MaladyOfTheMind(args)
	self:TargetMessageOld(args.spellId, args.destName, "yellow", "alert", L.malady_message)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:MaladyOfTheMindRemoved(args)
	self:PrimaryIcon(args.spellId)
end

function mod:Squeeze(args)
	self:TargetMessageOld(args.spellId, args.destName, "green")
end

function mod:BrainLink(args)
	if self:Me(args.destGUID) then
		self:MessageOld(args.spellId, "blue", "alarm", L.link_warning)
		self:Flash(args.spellId)
	end
end

function mod:LunaticGazeOver(args)
	self:CDBar(args.spellId, 9)
end

function mod:LunaticGaze(args)
	self:MessageOld(args.spellId, "red", "warning")
	self:CastBar(args.spellId, 4)
end

do
	local madnessTime = 0
	function mod:InduceMadness()
		madnessTime = GetTime()
	end

	function mod:IllusionRoom(args)
		-- Induce Madness
		if self:Me(args.destGUID) then
			local passed = GetTime() - madnessTime
			local remaining = 55 - passed
			self:Bar(64059, remaining)
			self:DelayedMessage(64059, remaining - 10, "orange", L.madness_warning, false, "warning")
		end
	end

	function mod:IllusionRoomExit(args)
		-- Induce Madness
		if self:Me(args.destGUID) then
			self:StopBar(64059)
			self:CancelDelayedMessage(L.madness_warning)
		end
	end
end

function mod:ShadowBeacon(args)
	self:CDBar(args.spellId, 46)
end

do
	local function Cleanup(self)
		shadowBeacon1GUID, shadowBeacon2GUID = nil, nil
		self:UnregisterTargetEvents()
	end

	function mod:UnmarkShadowBeacon(event, unit, guid)
		if guid == shadowBeacon1GUID or guid == shadowBeacon2GUID then
			self:CustomIcon(false, unit, 0)
		end
	end

	local prev = 0
	function mod:ShadowBeaconRemoved(args)
		local t = GetTime()
		if t-prev > 5 then
			prev = t
			self:MessageOld(args.spellId, "green", nil, CL.removed:format(args.spellName))
			if self:GetOption(shadowBeaconMarker) then
				self:ScheduleTimer(Cleanup, 5, self)
			end
		end

		if self:GetOption(shadowBeaconMarker) then
			local destGUID = args.destGUID
			if destGUID == shadowBeacon1GUID or destGUID == shadowBeacon2GUID then
				local unitId = mod:GetUnitIdByGUID(destGUID)
				if unitId then
					self:CustomIcon(false, unitId, 0)
				else
					self:RegisterTargetEvents("UnmarkShadowBeacon")
				end
			end
		end
	end
end

do
	function mod:MarkShadowBeacon(event, unit, guid)
		if guid == shadowBeacon1GUID then
			self:CustomIcon(false, unit, 8)
		elseif guid == shadowBeacon2GUID then
			self:CustomIcon(false, unit, 7)
		end
	end

	local prev = 0
	function mod:ShadowBeaconApplied(args)
		local t = GetTime()
		if t-prev > 5 then
			prev = t
			self:TargetMessageOld(args.spellId, args.destName, "red")
		end

		if self:GetOption(shadowBeaconMarker) then
			if not shadowBeacon1GUID then
				shadowBeacon1GUID = args.destGUID
			else
				shadowBeacon2GUID = args.destGUID
			end

			local unitId = mod:GetUnitIdByGUID(shadowBeacon2GUID or shadowBeacon1GUID)
			if unitId then
				self:CustomIcon(false, unitId, shadowBeacon2GUID and 7 or 8)
			else
				self:RegisterTargetEvents("MarkShadowBeacon")
			end
		end
	end
end

do
	local prev = 0
	function mod:PortalsOpen(args) -- Laughing Skulls above portals all gain Lunatic Gaze
		local t = GetTime()
		if t-prev > 10 then
			prev = t
			self:MessageOld("portal", "green", nil, CL.count:format(L.portal_message, portalCount), 35717)
			portalCount = portalCount + 1
			self:Bar("portal", 61, CL.count:format(L.portal_bar, portalCount), 35717)
		end
	end
end

function mod:BrainStunned(args) -- Shattered Illusion
	self:MessageOld("weakened", "green", "long", L.weakened_message:format(self.displayName), 50661) -- 50661 / Weakened Resolve / spell_shadow_brainwash / icon 136125
end

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.phase2_trigger) then
		crusherCount = 1
		self:MessageOld("stages", "yellow", nil, CL.stage:format(2), false)
		self:Bar("portal", 25, CL.count:format(L.portal_bar, portalCount), 35717)
	elseif msg:find(L.phase3_trigger) then
		self:CancelDelayedMessage(L.madness_warning)

		self:StopBar(64059) -- Induce Madness
		self:StopBar(L.tentacle_message:format(crusherCount))
		self:StopBar(CL.count:format(L.portal_bar, portalCount))

		self:MessageOld("stages", "red", "alarm", CL.stage:format(3), false)
		self:Bar(64465, 46)
	elseif msg:find(L.engage_trigger) and not self.isEngaged then
		self:Engage() -- Remove if Sara is added to boss frames on engage
	end
end
