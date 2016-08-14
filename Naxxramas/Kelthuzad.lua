--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Kel'Thuzad", 535, 1615)
if not mod then return end
mod:RegisterEnableMob(15990)
mod.toggleOptions = {27808, 27810, 28410, {27819, "ICON", "FLASH"}, "guardians", "phase", "proximity"}

--------------------------------------------------------------------------------
-- Locals
--

local fbTargets = mod:NewTargetList()
local mcTargets = mod:NewTargetList()

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Kel'Thuzad's Chamber"

	L.start_trigger = "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!"
	L.start_warning = "Kel'Thuzad encounter started! ~3min 30sec till he is active!"
	L.start_bar = "Phase 2"

	L.phase = "Phase"
	L.phase_desc = "Warn for phases."
	L.phase2_trigger1 = "Pray for mercy!"
	L.phase2_trigger2 = "Scream your dying breath!"
	L.phase2_trigger3 = "The end is upon you!"
	L.phase2_warning = "Phase 2, Kel'Thuzad incoming!"
	L.phase2_bar = "Kel'Thuzad Active!"
	L.phase3_soon_warning = "Phase 3 soon!"
	L.phase3_trigger = "Master, I require aid!"
	L.phase3_warning = "Phase 3, Guardians in ~15 sec!"

	L.frostblast_bar = "Possible Frost Blast"
	L.frostblast_soon_message = "Possible Frost Blast in ~5 sec!"

	L.detonate_other = "Detonate - %s"
	L.detonate_possible_bar = "Possible Detonate"
	L.detonate_warning = "Next Detonate in 5 sec!"

	L.guardians = "Guardian Spawns"
	L.guardians_desc = "Warn for incoming Icecrown Guardians in phase 3."
	L.guardians_trigger = "Very well. Warriors of the frozen wastes, rise up! I command you to fight, kill and die for your master! Let none survive!"
	L.guardians_warning = "Guardians incoming in ~10sec!"
	L.guardians_bar = "Guardians incoming!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

-- Big evul hack to enable the module when entering Kel'Thuzads chamber.
function mod:OnRegister()
	local f = CreateFrame("Frame")
	local func = function()
		if not mod:IsEnabled() and GetSubZoneText() == L["KELTHUZADCHAMBERLOCALIZEDLOLHAX"] then
			mod:Enable()
		end
	end
	f:SetScript("OnEvent", func)
	f:RegisterEvent("ZONE_CHANGED_INDOORS")
	func()
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Fizzure", 27810)
	self:Log("SPELL_AURA_APPLIED", "FrostBlast", 27808)
	self:Log("SPELL_AURA_APPLIED", "Detonate", 27819)
	self:Log("SPELL_AURA_APPLIED", "ChainsOfKelThuzad", 28410)
	self:Death("Win", 15990)

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Fizzure(args)
	self:Message(args.spellId, "Important")
end

do
	local handle = nil
	local function fbWarn(spellId)
		mod:TargetMessage(spellId, fbTargets, "Important", "Alert")
		mod:DelayedMessage(spellId, 32, "Attention", L["frostblast_soon_message"])
		mod:Bar(spellId, 37, L["frostblast_bar"])
		handle = nil
	end

	function mod:FrostBlast(args)
		fbTargets[#fbTargets + 1] = args.destName
		self:CancelTimer(handle)
		handle = self:ScheduleTimer(fbWarn, 0.4, args.spellId)
	end
end

function mod:Detonate(args)
	self:TargetMessage(args.spellId, args.destName, "Personal", "Alert")
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
	self:PrimaryIcon(args.spellId, args.destName)
	self:Bar(args.spellId, 5, L["detonate_other"]:format(args.destName))
	self:Bar(args.spellId, 20, L["detonate_possible_bar"])
	self:DelayedMessage(args.spellId, 15, L["detonate_warning"], "Attention")
end

do
	local handle = nil
	local function mcWarn(spellId)
		local mindControl = mod:SpellName(605)
		mod:TargetMessage(spellId, mcTargets, "Important", "Alert", mindControl)
		mod:Bar(spellId, 20, mindControl)
		mod:DelayedMessage(spellId, 68, CL["soon"]:format(mindControl), "Urgent")
		mod:CDBar(spellId, 68, mindControl)
		handle = nil
	end

	function mod:ChainsOfKelThuzad(args)
		mcTargets[#mcTargets + 1] = args.destName
		self:CancelTimer(handle)
		handle = self:ScheduleTimer(mcWarn, 0.5, args.spellId)
	end
end

function mod:UNIT_HEALTH_FREQUENT(msg)
	if UnitName(msg) == mod.displayName then
		local health = UnitHealth(msg) / UnitHealthMax(msg) * 100
		if health < 46 then
			self:Message("phase", "Attention", nil, L["phase3_soon_warning"], false)
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(event, msg)
	if msg == L["start_trigger"] then
		self:Message("phase", "Attention", nil, L["start_warning"], false)
		self:Bar("phase", 215, L["start_bar"], "Spell_Fire_FelImmolation")
		wipe(mcTargets)
		wipe(fbTargets)
		self:CloseProximity()
		--self:Engage() -- No wipe check?
	elseif msg == L["phase2_trigger1"] or msg == L["phase2_trigger2"] or msg == L["phase2_trigger3"] then
		self:StopBar(L["start_bar"])
		self:Message("phase", "Important", nil, L["phase2_warning"], false)
		self:Bar("phase", 15, L["phase2_bar"], "Spell_Shadow_Charm")
		self:OpenProximity("proximity", 10)
	elseif msg == L["phase3_trigger"] then
		self:Message("phase", "Attention", nil, L["phase3_warning"], false)
	elseif msg == L["guardians_trigger"] then
		self:Message("guardians", "Important", nil, L["guardians_warning"], false)
		self:Bar("guardians", 10, L["guardians_bar"], "inv_trinket_naxxramas04")
	end
end

