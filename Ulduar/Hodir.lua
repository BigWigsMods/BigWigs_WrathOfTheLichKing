--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Hodir", 529, 1644)
if not mod then return end
mod:RegisterEnableMob(32845)
mod.toggleOptions = {{"cold", "FLASH"}, {65123, "ICON"}, 61968, 62478, "hardmode", "berserk"}

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
	self:Bar(61968, 35) -- Flash Freeze
	self:Bar("hardmode", 180, L["hardmode"], 27578) -- ability_warrior_battleshout / Battle Shout / icon 132333
	self:Berserk(480)
end

function mod:VerifyEnable(unit)
	return (UnitIsEnemy(unit, "player") and UnitCanAttack(unit, "player")) and true or false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Cloud(args)
	self:TargetMessage(65123, args.destName, "Positive", "Info")
	self:TargetBar(65123, 30, args.destName)
	self:PrimaryIcon(65123, args.destName)
end

function mod:FlashCast(args)
	self:Message(args.spellId, "Attention", nil, L["flash_warning"])
	self:Bar(args.spellId, 9, CL["cast"]:format(args.spellName))
	self:Bar(args.spellId, 35)
	self:DelayedMessage(args.spellId, 30, "Attention", L["flash_soon"])
end

do
	local handle = nil
	local function flashWarn(spellId, spellName)
		mod:TargetMessage(61968, flashFreezed, "Urgent", "Alert")
		handle = nil
	end

	function mod:Flash(args)
		if UnitInRaid(args.destName) then
			flashFreezed[#flashFreezed + 1] = args.destName
			if not handle then
				handle = self:ScheduleTimer(flashWarn, 0.3)
			end
		end
	end
end

function mod:Frozen()
	self:Message(62478, "Important")
	self:Bar(62478, 20)
end

do
	local cold = mod:SpellName(62039)
	function mod:BitingCold(unit)
		local _, _, _, stack = UnitDebuff(unit, cold)
		if stack and stack ~= lastCold then
			if stack > 1 then
				self:Message("cold", "Personal", nil, L["cold_message"]:format(stack), 62039)
				self:Flash("cold", 62039)
			end
			lastCold = stack
		end
	end
end

