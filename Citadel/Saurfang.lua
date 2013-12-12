--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Deathbringer Saurfang", 604)
if not mod then return end
mod:RegisterEnableMob(37813, 37200, 37830, 37187, 37920) -- Deathbringer Saurfang, Muradin, Marine, Overlord Saurfang, Kor'kron Reaver
mod.toggleOptions = {"adds", 72410, 72385, {72293, "ICON", "FLASH"}, 72737, "proximity", "berserk", "bosskill"}

--------------------------------------------------------------------------------
-- Locals
--

local killed = nil
local count = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.adds = "Blood Beasts"
	L.adds_desc = "Shows a timer and messages for when Blood Beasts spawn."
	L.adds_warning = "Blood Beasts in 5 sec!"
	L.adds_message = "Blood Beasts!"

	L.engage_trigger = "BY THE MIGHT OF THE LICH KING!"
	L.warmup_alliance = "Let's get a move on then! Move ou..."
	L.warmup_horde = "Kor'kron, move out! Champions, watch your backs. The Scourge have been..."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Adds", 72173) --10man Id's: 72172, 72173; 25man Id's: 72172, 72173, 72356, 72357, 72358
	self:Log("SPELL_AURA_APPLIED", "RuneofBlood", 72410)
	self:Log("SPELL_AURA_APPLIED", "BoilingBlood", 72385)
	self:Log("SPELL_AURA_APPLIED", "Mark", 72293)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 72737)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Engage", L["engage_trigger"])
	self:Yell("Warmup", L["warmup_alliance"], L["warmup_horde"])

	self:Death("Deaths", 37813)
end

function mod:OnEngage()
	self:OpenProximity("proximity", 11)
	self:Berserk(self:Heroic() and 360 or 480)
	self:DelayedMessage("adds", 35, "Urgent", L["adds_warning"])
	self:Bar("adds", 40, L["adds"], 72173)
	count = 1
end

function mod:Warmup(msg)
	self:OpenProximity("proximity", 11)
	self:Bar("adds", L["warmup_alliance"] and 48 or 99, self.displayName, "achievement_boss_saurfang")
end

function mod:VerifyEnable()
	BigWigsLoader.SetMapToCurrentZone()
	return not killed and GetCurrentMapDungeonLevel() == 3
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local bbTargets, scheduled = mod:NewTargetList(), nil
	local function boilingWarn()
		mod:TargetMessage(72385, bbTargets, "Urgent")
		scheduled = nil
	end
	function mod:BoilingBlood(args)
		bbTargets[#bbTargets + 1] = args.destName
		if not scheduled then
			scheduled = self:ScheduleTimer(boilingWarn, 0.3)
		end
	end
end

function mod:Adds(args)
	self:Message("adds", "Positive", "Alarm", L["adds_message"], args.spellId)
	self:DelayedMessage("adds", 35, "Urgent", L["adds_warning"])
	self:Bar("adds", 40, L["adds"], args.spellId)
end

function mod:RuneofBlood(args)
	self:TargetMessage(72410, args.destName, "Attention")
	self:CDBar(72410, 20)
end

function mod:Mark(args)
	self:StackMessage(72293, args.destName, count, "Attention", "Alert")
	count = count + 1
	self:PrimaryIcon(72293, args.destName)
	if self:Me(args.destGUID) then
		self:Flash(72293)
	end
end

function mod:Frenzy(args)
	self:Message(72737, "Important", "Long")
end

function mod:Deaths()
	killed = true
	self:Win()
end

