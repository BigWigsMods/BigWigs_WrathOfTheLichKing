--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Lich King", 604)
if not mod then return end
mod:RegisterEnableMob(36597)
mod.toggleOptions = {72143, 70541, {70337, "ICON", "FLASH"}, 70372, {72762, "SAY", "ICON", "FLASH"}, 69409, 69037, {68980, "ICON", "FLASH"}, 70498, {68981, "FLASH"}, 69200, {72262, "FLASH"}, 72350, {73529, "SAY", "FLASH", "ICON"}, "berserk", "bosskill"}
local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")
mod.optionHeaders = {
	[72143] = CL.phase:format(1),
	[72762] = CL.phase:format(2),
	[68980] = CL.phase:format(3),
	[68981] = "Transition",
	[73529] = "heroic",
	berserk = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local phase = 0
local hugged = mod:NewTargetList()
local class = select(2,UnitClass("player"))
local frenzied = {}
local plagueTicks = {}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.warmup_trigger = "So the Light's vaunted justice has finally arrived"
	L.engage_trigger = "I'll keep you alive to witness the end, Fordring."

	L.horror_bar = "~Next Horror"
	L.horror_message = "Shambling Horror"

	L.necroticplague_bar = "Necrotic Plague"

	L.ragingspirit_bar = "Raging Spirit"

	L.valkyr_bar = "Next Val'kyr"
	L.valkyr_message = "Val'kyr"

	L.vilespirits_bar = "~Vile Spirits"

	L.harvestsoul_bar = "Harvest Soul"

	L.remorselesswinter_message = "Remorseless Winter Casting"
	L.quake_message = "Quake Casting"
	L.quake_bar = "Quake"

	L.defile_message = "Defile on YOU!"
	L.defile_bar = "Next Defile"

	L.infest_bar = "~Next Infest"

	L.reaper_bar = "~Next Reaper"

	L.last_phase_bar = "Last Phase"

	L.trap_message = "Shadow Trap"
	L.trap_bar = "Next Trap"

	L.valkyrhug_message = "Val'kyrs Hugged"
	L.cave_phase = "Cave Phase"

	L.frenzy_bar = "%s frenzies!"
	L.frenzy_survive_message = "%s will survive after plague"
	L.enrage_bar = "~Enrage"
	L.frenzy_message = "Add frenzied!"
	L.frenzy_soon_message = "5sec to frenzy!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--


function mod:OnBossEnable()
	-- Phase 1
	self:Log("SPELL_CAST_START", "Infest", 70541)
	self:Log("SPELL_CAST_SUCCESS", "NecroticPlague", 70337, 70338)
	self:Log("SPELL_DISPEL", "PlagueScan", "*")
	self:Log("SPELL_SUMMON", "Horror", 70372)
	self:Log("SPELL_CAST_START", "Enrage", 72143)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 28747)
	self:Log("SPELL_PERIODIC_DAMAGE", "PlagueTick", 70337, 70338)

	-- Phase 2
	self:Log("SPELL_CAST_SUCCESS", "SoulReaper", 69409)
	self:Log("SPELL_CAST_START", "DefileCast", 72762)
	self:Log("SPELL_DAMAGE", "DefileRun", 72754)
	self:Log("SPELL_MISSED", "DefileRun", 72754)
	self:Log("SPELL_SUMMON", "Valkyr", 69037)

	-- Phase 3
	self:Log("SPELL_CAST_SUCCESS", "HarvestSoul", 68980)
	self:Log("SPELL_AURA_REMOVED", "HSRemove", 68980)
	self:Log("SPELL_CAST_START", "VileSpirits", 70498)

	-- Transition phases
	self:Log("SPELL_CAST_START", "RemorselessWinter", 68981, 72259)
	self:Log("SPELL_CAST_SUCCESS", "RagingSpirit", 69200)
	self:Log("SPELL_CAST_START", "Quake", 72262)

	self:Log("SPELL_CAST_START", "FuryofFrostmourne", 72350)

	-- Hard Mode
	self:Log("SPELL_CAST_START", "ShadowTrap", 73539)

	self:Death("Win", 36597)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Yell("Warmup", L["warmup_trigger"])
	self:Yell("Engage", L["engage_trigger"])
end

function mod:Warmup()
	self:Bar("berserk", self.displayName, 53, "achievement_boss_lichking")
end

function mod:OnEngage()
	wipe(frenzied)
	wipe(plagueTicks)

	self:Berserk(900)
	self:Bar(70337, L["necroticplague_bar"], 31, 70337)
	self:Bar(70372, L["horror_bar"], 22, 70372)
	phase = 1
	if self:Heroic() then
		self:Bar(73529, L["trap_bar"], 16, 73539)
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PlagueTick(horrorName, _, _, tickDamage, _, _, _, _, _, dGUID)
	if not self:Heroic() then return end -- Doesn't apply on normal diff.
	-- Not ticking on a Shambling Horror, so bail early
	if self:MobId(dGUID) ~= 37698 then return end

	if not plagueTicks[dGUID] then plagueTicks[dGUID] = 1
	else plagueTicks[dGUID] = plagueTicks[dGUID] + 1 end
	if plagueTicks[dGUID] == 3 then
		plagueTicks[dGUID] = nil
		return
	end

	-- Search by full GUID, so we don't mistake one shambler for another
	local unitId = self:GetUnitIdByGUID(dGUID)
	if not unitId then return end

	-- Shambler is already frenzied, will it die from the plague or endure
	-- for a longer period?
	if frenzied[dGUID] then
		local damageLeft = (3 - plagueTicks[dGUID]) * tickDamage
		local hp = UnitHealth(unitId)
		if hp > damageLeft then
			self:Message(70372, L["frenzy_survive_message"]:format(horrorName), "Attention", 72143)
		end
	else
		local hp, max = UnitHealth(unitId), UnitHealthMax(unitId)
		if not max or max == 0 then return end
		local nextTickHP = hp - tickDamage
		-- Will the shambler die from the next tick?
		if nextTickHP <= 0 then return end
		local percentHp = (nextTickHP / max) * 100
		-- This sucker will frenzy in 5 seconds
		if percentHp < 21 then
			self:Message(70372, L["frenzy_soon_message"], "Important", 72143, "Info")
			self:Bar(70372, L["frenzy_bar"]:format(horrorName), 5, 72143)
		end
	end
end

function mod:Frenzy(_, _, _, _, _, _, _, _, _, dGUID)
	frenzied[dGUID] = true
	self:Message(70372, L["frenzy_message"], "Important", 72143, "Long")
end

function mod:Horror(_, spellId)
	self:Message(70372, L["horror_message"], "Attention", spellId)
	self:Bar(70372, L["horror_bar"], 60, spellId)
end

function mod:FuryofFrostmourne()
	self:StopBar(L["defile_bar"])
	self:StopBar(L["reaper_bar"])
	self:StopBar(L["vilespirits_bar"])
	self:StopBar(L["harvestsoul_bar"])
	self:Bar(72350, L["last_phase_bar"], 160, 72350)
end

function mod:Infest(_, spellId, _, _, spellName)
	self:Message(70541, spellName, "Urgent", spellId)
	self:Bar(70541, L["infest_bar"], 22, spellId)
end

function mod:VileSpirits(_, spellId, _, _, spellName)
	self:Message(70498, spellName, "Urgent", spellId)
	self:Bar(70498, L["vilespirits_bar"], 30.5, spellId)
end

function mod:SoulReaper(player, spellId, _, _, spellName)
	self:TargetMessage(69409, spellName, player, "Personal", spellId, "Alert")
	self:Bar(69409, L["reaper_bar"], 30, spellId)
end

function mod:NecroticPlague(player, spellId, _, _, spellName)
	self:TargetMessage(70337, spellName, player, "Personal", spellId, "Alert")
	if UnitIsUnit(player, "player") then self:Flash(70337) end
	self:Bar(70337, L["necroticplague_bar"], 30, spellId)
	self:SecondaryIcon(70337, player)
end

do
	local plague = GetSpellInfo(70337)
	local function scanRaid()
		for i = 1, GetNumGroupMembers() do
			local player = GetRaidRosterInfo(i)
			if player then
				local debuffed, _, _, _, _, _, expire = UnitDebuff(player, plague)
				if debuffed and (expire - GetTime()) > 13 then
					mod:TargetMessage(70337, plague, player, "Personal", 70337, "Alert")
					if UnitIsUnit(player, "player") then mod:Flash(70337) end
					mod:SecondaryIcon(70337, player)
				end
			end
		end
	end
	function mod:PlagueScan()
		self:ScheduleTimer(scanRaid, 0.8)
	end
end

function mod:Enrage(_, spellId, _, _, spellName)
	if class == "HUNTER" or class == "ROGUE" then
		self:Message(72143, spellName, "Attention", spellId, "Info")
		self:Bar(72143, L["enrage_bar"], 21, spellId)
	else
		self:Message(72143, spellName, "Attention", spellId)
	end
end

function mod:RagingSpirit(player, spellId, _, _, spellName)
	self:TargetMessage(69200, spellName, player, "Personal", spellId, "Alert")
	self:Bar(69200, L["ragingspirit_bar"], 23, spellId)
end

local last = 0
function mod:DefileRun(player, spellId)
	local time = GetTime()
	if (time - last) > 2 then
		last = time
		if UnitIsUnit(player, "player") then
			self:Message(72762, L["defile_message"], "Personal", spellId, "Info")
			self:Flash(72762)
		end
	end
end

do
	local function ValkyrHugCheck()
		for i=1, GetNumGroupMembers() do
			local n = GetRaidRosterInfo(i)
			if UnitInVehicle(n) then
				hugged[#hugged + 1] = n
			end
		end
		mod:TargetMessage(69037, L["valkyrhug_message"], hugged, "Urgent", 71844)
	end

	local t = 0
	function mod:Valkyr(_, spellId)
		local time = GetTime()
		if (time - t) > 4 then
			t = time
			self:Message(69037, L["valkyr_message"], "Attention", 71844)
			self:Bar(69037, L["valkyr_bar"], 46, 71844)
			self:ScheduleTimer(ValkyrHugCheck, 6.1)
		end
	end
end

function mod:HarvestSoul(player, spellId, _, _, spellName)
	if self:Heroic() then
		self:StopBar(L["defile_bar"])
		self:StopBar(L["reaper_bar"])
		self:StopBar(L["ragingspirit_bar"])
		self:Bar(68980, L["cave_phase"], 50, spellId)
		self:Bar(68980, L["harvestsoul_bar"], 105, spellId)
	else
		self:Bar(68980, L["harvestsoul_bar"], 75, spellId)
		if UnitIsUnit(player, "player") then self:Flash(68980) end
		self:TargetMessage(68980, spellName, player, "Attention", spellId)
		self:SecondaryIcon(68980, player)
	end
end

function mod:HSRemove(player, spellId)
	self:SecondaryIcon(68980, false)
end

function mod:RemorselessWinter(_, spellId)
	phase = phase + 1
	self:StopBar(L["necroticplague_bar"])
	self:StopBar(L["horror_bar"])
	self:StopBar(L["infest_bar"])
	self:StopBar(L["defile_bar"])
	self:StopBar(L["reaper_bar"])
	self:StopBar(L["valkyr_bar"])
	self:StopBar(L["trap_bar"])
	self:Message(68981, L["remorselesswinter_message"], "Urgent", spellId, "Alert")
	self:Bar(72262, L["quake_bar"], 62, 72262)
	self:Bar(69200, L["ragingspirit_bar"], 15, spellId)
end

function mod:Quake(_, spellId)
	phase = phase + 1
	self:StopBar(L["ragingspirit_bar"])
	self:Message(72262, L["quake_message"], "Urgent", spellId, "Alert")
	self:Bar(72762, L["defile_bar"], 37, 72762)
	self:Bar(70541, L["infest_bar"], 13, 70541)
	self:Bar(69409, L["reaper_bar"], 39, 69409)
	if phase == 3 then
		self:Bar(69037, L["valkyr_bar"], 24, 71844)
	elseif phase == 5 then
		self:Bar(70498, L["vilespirits_bar"], 21, 70498)
		self:Bar(68980, L["harvestsoul_bar"], 12, 68980)
	end
end

do
	local id, name, handle = nil, nil, nil
	local function scanTarget()
		local bossId = mod:GetUnitIdByGUID(36597)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target then
			if UnitIsUnit(target, "player") then
				mod:Flash(72762)
				mod:Say(72762)
			end
			mod:TargetMessage(72762, name, target, "Important", id, "Alert")
			mod:PrimaryIcon(72762, target)
		end
		handle = nil
	end

	function mod:DefileCast(player, spellId, _, _, spellName)
		id, name = spellId, spellName
		self:CancelTimer(handle)
		self:Bar(72762, L["defile_bar"], 32, 72762)
		handle = self:ScheduleTimer(scanTarget, 0.01)
	end
end

do
	local scheduled = nil
	local function trapTarget(spellName)
		scheduled = nil
		local bossId = mod:GetUnitIdByGUID(36597)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target then
			if UnitIsUnit(target, "player") then
				mod:Flash(73529)
				mod:Say(73529)
			end
			mod:TargetMessage(73529, L["trap_message"], target, "Attention", 73539)
			mod:PrimaryIcon(73529, target)
		end
	end
	function mod:ShadowTrap(_, spellId, _, _, spellName)
		if not scheduled then
			scheduled = true
			self:ScheduleTimer(trapTarget, 0.01, spellName)
			self:Bar(73529, L["trap_bar"], 16, spellId)
		end
	end
end

