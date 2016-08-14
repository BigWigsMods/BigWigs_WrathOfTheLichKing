--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Sindragosa", 604, 1635)
if not mod then return end
mod:RegisterEnableMob(36853, 37533, 37534) -- Sindragosa, Rimefang, Spinestalker
mod.toggleOptions = {"airphase", "phase2", 70127, {69762, "FLASH"}, 69766, 70106, 70123, {70126, "FLASH"}, "proximity", "berserk"}
mod.optionHeaders = {
	airphase = CL.phase:format(1),
	phase2 = CL.phase:format(2),
	[69762] = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local phase = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "You are fools to have come to this place."

	L.phase2 = "Phase 2"
	L.phase2_desc = "Warn when Sindragosa goes into phase 2, at 35%."
	L.phase2_trigger = "Now, feel my master's limitless power and despair!"
	L.phase2_message = "Phase 2!"

	L.airphase = "Air phase"
	L.airphase_desc = "Warn when Sindragosa will lift off."
	L.airphase_trigger = "Your incursion ends here! None shall survive!"
	L.airphase_message = "Air phase!"
	L.airphase_bar = "Next air phase"

	L.boom_message = "Explosion!"
	L.boom_bar = "Explosion"

	L.instability_message = "Unstable x%d!"
	L.chilled_message = "Chilled x%d!"
	L.buffet_message = "Magic x%d!"
	L.buffet_cd = "Next Magic"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Unchained", 69762)
	self:Log("SPELL_AURA_REMOVED", "UnchainedRemoved", 69762)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Instability", 69766)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Chilled", 70106)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Buffet", 70127)

	self:Log("SPELL_AURA_APPLIED", "FrostBeacon", 70126)
	self:Log("SPELL_AURA_APPLIED", "Tombed", 70157)

	-- 70123 is the actual blistering cold
	self:Log("SPELL_CAST_SUCCESS", "Grip", 70117)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Warmup", L["engage_trigger"])
	self:Yell("AirPhase", L["airphase_trigger"])
	self:Yell("Phase2", L["phase2_trigger"])
	self:Death("Win", 36853)
end

function mod:Warmup()
	self:Bar("berserk", 10, self.displayName, "achievement_boss_sindragosa")
	self:ScheduleTimer("Engage", 10)
end

function mod:OnEngage()
	phase = 1
	self:Berserk(600)
	self:Bar("airphase", 63, L["airphase_bar"], 23684)
	self:Bar(69762, 15) -- Unchained Magic
	self:Bar(70123, 34, 70117) -- Icy Grip
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Tombed(args)
	if self:Me(args.destGUID) then
		self:CloseProximity()
	end
end

do
	local beaconTargets, scheduled = mod:NewTargetList(), nil
	local function baconWarn()
		mod:TargetMessage(70126, beaconTargets, "Urgent")
		mod:Bar(70126, 7)
		scheduled = nil
	end
	function mod:FrostBeacon(args)
		beaconTargets[#beaconTargets + 1] = args.destName
		if self:Me(args.destGUID) then
			self:OpenProximity("proximity", 10)
			self:Flash(70126)
		end
		if not scheduled then
			scheduled = self:ScheduleTimer(baconWarn, 0.2)
		end
	end
end

function mod:Grip()
	self:Message(70123, "Important", "Alarm", L["boom_message"])
	self:Bar(70123, 5, L["boom_bar"])
	if phase == 2 then
		self:Bar(70123, 67, 70117) -- Icy Grip
	end
end

function mod:AirPhase()
	self:Message("airphase", "Positive", nil, L["airphase_message"], 23684)
	self:Bar("airphase", 110, L["airphase_bar"], 23684)
	self:Bar(70123, 80, 70117) -- Icy Grip
	self:Bar(69762, 57) -- Unchained Magic
end

function mod:Phase2()
	phase = 2
	self:StopBar(L["airphase_bar"])
	self:Message("phase2", "Positive", "Long", L["phase2_message"], false)
	self:Bar(70123, 38, 70117) -- Icy Grip
end

function mod:Buffet(args)
	self:Bar(70127, 6, L["buffet_cd"])
	if (args.amount % 2 == 0) and self:Me(args.destGUID) then
		self:Message(70127, "Attention", "Info", L["buffet_message"]:format(args.amount))
	end
end

function mod:Instability(args)
	if args.amount > 4 and self:Me(args.destGUID) then
		self:Message(69766, "Personal", nil, L["instability_message"]:format(args.amount))
	end
end

function mod:Chilled(args)
	if args.amount > 4 and self:Me(args.destGUID) then
		self:Message(70106, "Personal", nil, L["chilled_message"]:format(args.amount))
	end
end

function mod:Unchained(args)
	if phase == 1 then
		self:Bar(69762, 30)
	elseif phase == 2 then
		self:Bar(69762, 80)
	end
	if self:Me(args.destGUID) then
		self:Message(69762, "Personal", "Alert", CL["you"]:format(args.spellName))
		self:Flash(69762)
		if self:Heroic() then
			self:OpenProximity("proximity", 20)
			self:ScheduleTimer("CloseProximity", 30)
		end
	end
end

function mod:UnchainedRemoved(args)
	self:CloseProximity()
end

