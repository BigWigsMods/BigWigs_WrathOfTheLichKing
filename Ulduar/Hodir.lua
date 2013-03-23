--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Hodir", 529)
if not mod then return end
mod:RegisterEnableMob(32845)
mod.toggleOptions = {{"cold", "FLASH"}, {65123, "ICON"}, 61968, 62478, "hardmode", "berserk", "bosskill"}

mod.optionHeaders = {
	cold = "normal",
	hardmode = "hard",
	berserk = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local flashFreezed = mod:NewTargetList()
local lastCold = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "You will suffer for this trespass!"

	L.cold = "Biting Cold"
	L.cold_desc = "Warn when you have 2 or more stacks of Biting Cold."
	L.cold_message = "Biting Cold x%d!"

	L.flash_warning = "Freeze!"
	L.flash_soon = "Freeze in 5sec!"

	L.hardmode = "Hard mode"
	L.hardmode_desc = "Show timer for hard mode."

	L.end_trigger = "I... I am released from his grasp... at last."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FlashCast", 61968)
	self:Log("SPELL_AURA_APPLIED", "Flash", 61969, 61990)
	self:Log("SPELL_AURA_APPLIED", "Frozen", 62478, 63512)
	self:Log("SPELL_AURA_APPLIED", "Cloud", 65123, 65133)

	self:RegisterUnitEvent("UNIT_AURA", "BitingCold", "player")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:Yell("Engage", L["engage_trigger"])
	self:Yell("Win", L["end_trigger"])
end

function mod:OnEngage()
	lastCold = nil
	self:Bar(61968, 61968, 35, 61968) -- Flash Freeze
	self:Bar("hardmode", L["hardmode"], 180, 6673)
	self:Berserk(480)
end

function mod:VerifyEnable(unit)
	return (UnitIsEnemy(unit, "player") and UnitCanAttack(unit, "player")) and true or false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Cloud(args)
	self:TargetMessage(65123, args.spellName, args.destName, "Positive", args.spellId, "Info")
	self:TargetBar(65123, args.spellName, args.destName, 30, args.spellId)
	self:PrimaryIcon(65123, args.destName)
end

function mod:FlashCast(args)
	self:Message(args.spellId, L["flash_warning"], "Attention", args.spellId)
	self:Bar(args.spellId, args.spellName, 9, args.spellId)
	self:Bar(args.spellId, args.spellName, 35, args.spellId)
	self:DelayedMessage(args.spellId, 30, L["flash_soon"], "Attention")
end

do
	local handle = nil
	local function flashWarn(spellId, spellName)
		mod:TargetMessage(spellId, spellName, flashFreezed, "Urgent", spellId, "Alert")
		handle = nil
	end

	function mod:Flash(args)
		if UnitInRaid(args.destName) then
			flashFreezed[#flashFreezed + 1] = args.destName
			if not handle then
				handle = self:ScheduleTimer(flashWarn, 0.3, 61968, args.spellName)
			end
		end
	end
end

function mod:Frozen(args)
	self:Message(62478, args.spellName, "Important", args.spellId)
	self:Bar(62478, args.spellName, 20, args.spellId)
end

do
	local cold = mod:SpellName(62039)
	function mod:BitingCold(unit)
		local _, _, _, stack = UnitDebuff(unit, cold)
		if stack and stack ~= lastCold then
			if stack > 1 then
				self:Message("cold", L["cold_message"]:format(stack), "Personal", 62039)
				self:Flash("cold", 62039)
			end
			lastCold = stack
		end
	end
end

