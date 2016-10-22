--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Festergut", 604, 1629)
if not mod then return end
mod:RegisterEnableMob(36626)
mod.toggleOptions = {{69279, "FLASH"}, 69165, 69195, 72219, 69240, 72295, "proximity", "berserk"}
mod.optionHeaders = {
	[69279] = "normal",
	[72295] = "heroic",
	proximity = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local count = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Fun time?"

	L.inhale_bar = "Inhale (%d)"
	L.blight_warning = "Pungent Blight in ~5sec!"
	L.ball_message = "Goo ball incoming!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "InhaleCD", 69165)
	self:Log("SPELL_CAST_START", "Blight", 69195)
	self:Log("SPELL_CAST_SUCCESS", "VileGas", 69240)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Bloat", 72219)
	self:Death("Win", 36626)

	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])

	self:Log("SPELL_AURA_APPLIED", "Spores", 69279)
end

function mod:OnEngage()
	count = 1
	self:Berserk(300, true)
	self:CDBar(69279, 20) -- Gas Spore
	self:Bar(69165, 33.5, L["inhale_bar"]:format(count))
	self:OpenProximity("proximity", 9)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local sporeTargets, scheduled = mod:NewTargetList(), nil
	local function sporeWarn()
		mod:TargetMessage(69279, sporeTargets, "Urgent", "Alert")
		scheduled = nil
	end
	function mod:Spores(args)
		sporeTargets[#sporeTargets + 1] = args.destName
		if self:Me(args.destGUID) then
			self:Flash(69279)
		end
		if not scheduled then
			scheduled = self:ScheduleTimer(sporeWarn, 0.2, args.spellName)
			self:ScheduleTimer("CDBar", 12, 69279, 28) -- Gas Spore
			self:Bar(69279, 12, 67729) -- Explode
		end
	end
end

function mod:InhaleCD(args)
	self:Message(69165, "Attention", nil, CL["count"]:format(args.spellName, count))
	count = count + 1
	if count == 4 then
		self:DelayedMessage(69195, 28.5, "Attention", L["blight_warning"])
		self:Bar(69195, 33.5)
	else
		self:Bar(69165, 33.5, L["inhale_bar"]:format(count))
	end
end

function mod:Blight(args)
	count = 1
	self:Message(69195, "Attention")
	self:Bar(69165, 33.5, L["inhale_bar"]:format(count))
end

function mod:Bloat(args)
	if args.amount > 5 then
		self:StackMessage(72219, args.destName, args.amount, "Positive")
		self:CDBar(72219, 10)
	end
end

do
	local t = 0
	function mod:VileGas(args)
		local time = GetTime()
		if (time - t) > 2 then
			t = time
			self:Message(69240, "Important")
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, _, _, spellId)
	if spellId == 72299 then
		self:Message(72295, "Important", nil, L["ball_message"])
	end
end
