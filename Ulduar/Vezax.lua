--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("General Vezax", 529, 1648)
if not mod then return end
mod:RegisterEnableMob(33271)
mod.toggleOptions = {"vapor", {"vaporstack", "FLASH"}, {62660, "ICON", "SAY", "FLASH"}, {63276, "ICON", "FLASH"}, 62661, 62662, "animus", "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local vaporCount = 1
local surgeCount = 1
local lastVapor = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L["Vezax Bunny"] = true -- For emote catching.

	L.engage_trigger = "^Your destruction will herald a new age of suffering!"

	L.surge_message = "Surge %d!"
	L.surge_cast = "Surge %d casting!"
	L.surge_bar = "Surge %d"

	L.animus = "Saronite Animus"
	L.animus_desc = "Warn when the Saronite Animus spawns."
	L.animus_trigger = "The saronite vapors mass and swirl violently, merging into a monstrous form!"
	L.animus_message = "Animus spawns!"

	L.vapor = "Saronite Vapors"
	L.vapor_desc = "Warn when Saronite Vapors spawn."
	L.vapor_message = "Saronite Vapor %d!"
	L.vapor_bar = "Vapor %d/6"
	L.vapor_trigger = "A cloud of saronite vapors coalesces nearby!"

	L.vaporstack = "Vapors Stack"
	L.vaporstack_desc = "Warn when you have 5 or more stacks of Saronite Vapors."
	L.vaporstack_message = "Vapors x%d!"

	L.crash_say = "Crash"

	L.mark_message = "Mark"
	L.mark_message_other = "Mark on %s!"
end
L = mod:GetLocale()

mod.optionHeaders = {
	vapor = L.vapor,
	[62660] = 62660,
	[63276] = 63276,
	[62661] = "normal",
	animus = "hard",
	berserk = "general",
}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Flame", 62661)
	self:Log("SPELL_CAST_START", "Surge", 62662)
	self:Log("SPELL_AURA_APPLIED", "SurgeGain", 62662)
	self:Log("SPELL_CAST_SUCCESS", "Crash", 60835, 62660)
	self:Log("SPELL_CAST_SUCCESS", "Mark", 63276)
	self:Death("Win", 33271)

	self:Emote("Vapor", L["vapor_trigger"])
	self:Emote("Animus", L["animus_trigger"])

	self:RegisterUnitEvent("UNIT_AURA", nil, "player")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])
end

function mod:OnEngage()
	lastVapor = nil
	vaporCount = 1
	surgeCount = 1
	self:Berserk(600)
	self:Bar(62662, 60, L["surge_bar"]:format(surgeCount))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Vapor()
	self:Message("vapor", "Positive", nil, L["vapor_message"]:format(vaporCount), 63323)
	vaporCount = vaporCount + 1
	if vaporCount < 7 then
		self:Bar("vapor", 30, L["vapor_bar"]:format(vaporCount), 63323)
	end
end

function mod:Animus()
	self:Message("animus", "Important", nil, L["animus_message"], 63319)
end

function mod:UNIT_AURA()
	local _, _, _, stack = UnitDebuff("player", self:SpellName(63322))
	if stack and stack ~= lastVapor then
		if stack > 5 then
			self:Message("vaporstack", "Personal", nil, L["vaporstack_message"]:format(stack), 63322)
			self:Flash("vaporstack", 63322)
		end
		lastVapor = stack
	end
end

do
	local handle = nil
	local function scanTarget()
		local bossId = mod:GetUnitIdByGUID(33271)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target then
			if UnitIsUnit(target, "player") then
				mod:Flash(62660)
				mod:Say(62660, L["crash_say"])
			end
			mod:TargetMessage(62660, target, "Personal", "Alert")
			mod:SecondaryIcon(62660, target)
		end
		handle = nil
	end

	function mod:Crash()
		if not handle then
			handle = self:ScheduleTimer(scanTarget, 0.1)
		end
	end
end

function mod:Mark(args)
	self:TargetMessage(args.spellId, args.destName, "Personal", "Alert", L["mark_message"])
	if self:Me(args.destGUID) then self:Flash(63276) end
	self:Bar(args.spellId, 10, L["mark_message_other"]:format(args.destName))
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Flame(args)
	self:Message(args.spellId, "Urgent")
end

function mod:Surge(args)
	self:Message(args.spellId, "Important", nil, L["surge_message"]:format(surgeCount))
	self:Bar(args.spellId, 3, L["surge_cast"]:format(surgeCount))
	surgeCount = surgeCount + 1
	self:Bar(args.spellId, 60, L["surge_bar"]:format(surgeCount))
end

function mod:SurgeGain(args)
	self:Bar(args.spellId, 10)
end

