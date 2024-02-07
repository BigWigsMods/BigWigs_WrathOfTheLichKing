--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Deathbringer Saurfang", 631, 1628)
if not mod then return end
mod:RegisterEnableMob(37813, 37200, 37187) -- Deathbringer Saurfang, Muradin, High Overlord Saurfang
-- mod:SetEncounterID(1096)
-- mod:SetRespawnTime(30)
mod.toggleOptions = {"warmup", "adds", 72410, 72385, {72293, "ICON", "FLASH"}, 72737, "proximity", "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local count = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.adds = "Blood Beasts"
	L.adds_desc = "Shows a timer and messages for when Blood Beasts spawn."
	L.adds_warning = "Blood Beasts in 5 sec!"
	L.adds_message = "Blood Beasts!"

	L.engage_trigger = "BY THE MIGHT OF THE LICH KING!"
	L.warmup_alliance = "Let's get a move on then! Move ou..."
	L.warmup_horde = "Kor'kron, move out! Champions, watch your backs. The Scourge have been..."
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:VerifyEnable(unit, mobId)
	if mobId == 37813 then -- Deathbringer Saurfang
		return true
	else
		return self:UnitIsInteractable(unit) -- Muradin & High Overlord Saurfang
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Adds", 72173)
	self:Log("SPELL_AURA_APPLIED", "RuneofBlood", 72410)
	self:Log("SPELL_AURA_APPLIED", "BoilingBlood", 72385)
	self:Log("SPELL_AURA_APPLIED", "Mark", 72293)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 72737)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:BossYell("Engage", L["engage_trigger"])
	self:BossYell("WarmupHorde", L["warmup_horde"])
	self:BossYell("WarmupAlliance", L["warmup_alliance"])

	self:Death("Win", 37813)
end

function mod:OnEngage()
	self:OpenProximity("proximity", 11)
	self:Berserk(self:Heroic() and 360 or 480)
	self:DelayedMessage("adds", 35, "orange", L["adds_warning"])
	self:Bar("adds", 40, L["adds"], 72173)
	count = 1
end

function mod:WarmupHorde()
	self:OpenProximity("proximity", 11)
	self:Bar("warmup", 96, self.displayName, "achievement_boss_saurfang")
end

function mod:WarmupAlliance()
	self:OpenProximity("proximity", 11)
	self:Bar("warmup", 48, self.displayName, "achievement_boss_saurfang")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local bbTargets, scheduled = mod:NewTargetList(), nil
	local function boilingWarn()
		mod:TargetMessageOld(72385, bbTargets, "orange")
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
	self:MessageOld("adds", "green", "alarm", L["adds_message"], args.spellId)
	self:DelayedMessage("adds", 35, "orange", L["adds_warning"])
	self:Bar("adds", 40, L["adds"], args.spellId)
end

function mod:RuneofBlood(args)
	self:TargetMessageOld(72410, args.destName, "yellow")
	self:CDBar(72410, 20)
end

function mod:Mark(args)
	self:StackMessageOld(72293, args.destName, count, "yellow", "alert")
	count = count + 1
	self:PrimaryIcon(72293, args.destName)
	if self:Me(args.destGUID) then
		self:Flash(72293)
	end
end

function mod:Frenzy(args)
	self:MessageOld(72737, "red", "long")
end

