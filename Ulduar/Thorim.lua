--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Thorim", 529, 1645)
if not mod then return end
-- 32865 = thorim, 32882 = behemoth, 32872 = runic colossus, 32908/32907 = Captured Mercenary Captain, 32885/32883 = Captured Mercenary Soldier
mod:RegisterEnableMob(32865, 32882, 32872, 32908, 32907, 32885, 32883)
mod.toggleOptions = {{62042, "ICON"}, 62016, 62331, {62017, "FLASH"}, 62338, {62526, "ICON", "SAY"}, 62279, 62130, "proximity", "hardmode", "phase"}

mod.optionHeaders = {
	[62042] = CL.phase:format(2),
	[62279] = CL.phase:format(3),
	hardmode = "hard",
	phase = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local chargeCount = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L["Runic Colossus"] = true -- For the runic barrier emote.

	L.phase = "Phases"
	L.phase_desc = "Warn for phase changes."
	L.phase1_message = "Phase 1"
	L.phase2_trigger = "Interlopers! You mortals who dare to interfere with my sport will pay.... Wait--you..."
	L.phase2_message = "Phase 2, berserk in 6:15!"
	L.phase3_trigger = "Impertinent whelps, you dare challenge me atop my pedestal? I will crush you myself!"
	L.phase3_message = "Phase 3 - Thorim engaged!"

	L.hardmode = "Hard mode timer"
	L.hardmode_desc = "Show timer for when you have to reach Thorim in order to enter hard mode in phase 3."
	L.hardmode_warning = "Hard mode expires"

	L.shock_message = "You're getting shocked!"
	L.barrier_message = "Barrier up!"

	L.detonation_say = "I'm a bomb!"

	L.charge_message = "Charged x%d!"
	L.charge_bar = "Charge %d"

	L.strike_bar = "Unbalancing Strike CD"

	L.end_trigger = "Stay your arms! I yield!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Hammer", 62042)
	self:Log("SPELL_CAST_SUCCESS", "Charge", 62279)
	self:Log("SPELL_CAST_SUCCESS", "StrikeCooldown", 62130)
	self:Log("SPELL_MISSED", "StrikeCooldown", 62130)
	self:Log("SPELL_AURA_APPLIED", "Strike", 62130)
	self:Log("SPELL_AURA_APPLIED", "Detonation", 62526)
	self:Log("SPELL_AURA_APPLIED", "Orb", 62016)
	self:Log("SPELL_AURA_APPLIED", "Impale", 62331, 62418)
	self:Log("SPELL_AURA_APPLIED", "Barrier", 62338)
	self:Log("SPELL_DAMAGE", "Shock", 62017)
	self:Log("SPELL_MISSED", "Shock", 62017)

	self:Yell("PhaseTwo", L["phase2_trigger"])
	self:Yell("PhaseThree", L["phase3_trigger"])
	self:Yell("Win", L["end_trigger"])

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:VerifyEnable(unit)
	return (UnitIsEnemy(unit, "player") and UnitCanAttack(unit, "player")) and true or false
end

function mod:OnEngage()
	chargeCount = 1
	self:Message("phase", "Attention", nil, L["phase1_message"], false)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Barrier(args)
	self:Message(args.spellId, "Urgent", "Alarm", L["barrier_message"])
	self:Bar(args.spellId, 20)
end

function mod:Charge(args)
	self:Message(args.spellId, "Attention", nil, L["charge_message"]:format(chargeCount))
	chargeCount = chargeCount + 1
	self:Bar(args.spellId, 15, L["charge_bar"]:format(chargeCount))
end

function mod:Hammer(args)
	self:TargetMessage(args.spellId, args.destName, "Urgent")
	self:Bar(args.spellId, 16)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Strike(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:TargetBar(args.spellId, 15, args.destName)
end

function mod:StrikeCooldown(args)
	self:Bar(args.spellId, 25, L["strike_bar"])
end

function mod:Orb(args)
	self:Message(args.spellId, "Urgent")
	self:Bar(args.spellId, 15)
end

local last = 0
function mod:Shock(args)
	local time = GetTime()
	if (time - last) > 5 then
		last = time
		if self:Me(args.destGUID) then
			self:Message(args.spellId, "Personal", "Info", L["shock_message"])
			self:Flash(args.spellId)
		end
	end
end

function mod:Impale(args)
	self:TargetMessage(62331, args.destName, "Important")
end

function mod:Detonation(args)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, L["detonation_say"], true)
	end
	self:TargetMessage(args.spellId, args.destName, "Important")
	self:TargetBar(args.spellId, 4, args.destName)
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:PhaseTwo()
	self:Message("phase", "Attention", nil, L["phase2_message"], false)
	self:Bar("phase", 375, 26662) -- Berserk
	self:Bar("hardmode", 173, L["hardmode"], 27578) -- ability_warrior_battleshout / Battle Shout / icon 132333
	self:DelayedMessage("hardmode", 173, "Attention", L["hardmode_warning"])
end

function mod:PhaseThree()
	self:CancelDelayedMessage(L["hardmode_warning"])
	self:StopBar(L["hardmode"])
	self:StopBar(26662) -- Berserk
	self:Message("phase", "Attention", nil, L["phase3_message"], false)
	self:OpenProximity("proximity", 5)
end

