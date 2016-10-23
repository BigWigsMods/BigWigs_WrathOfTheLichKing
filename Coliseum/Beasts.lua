--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Beasts of Northrend", 543, 1618)
if not mod then return end
mod:RegisterEnableMob(
	34796, -- Gormok
	34799, -- Dreadscale
	35144, -- Acidmaw
	34797  -- Icehowl
)
--mod.engageId = 0 -- Inconsistent between tries, ends between bosses

--------------------------------------------------------------------------------
-- Locals
--

local snobolledWarned = {}
local sprayTimer = nil
local handle_Jormungars = nil
local icehowl, jormungars, gormok
do
	local _
	_, icehowl = EJ_GetCreatureInfo(1, 1618) -- Gormok the Impaler
	_, jormungars = EJ_GetCreatureInfo(2, 1618) -- Acidmaw and Dreadscale
	_, gormok = EJ_GetCreatureInfo(3, 1618) -- Icehowl
end

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.wipe_trigger = "Tragic..."

	L.engage_trigger = "Hailing from the deepest, darkest caverns of the Storm Peaks, Gormok the Impaler! Battle on, heroes!"
	L.jormungars_trigger = "Steel yourselves, heroes, for the twin terrors, Acidmaw and Dreadscale, enter the arena!"
	L.icehowl_trigger = "The air itself freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!"
	L.boss_incoming = "%s incoming"

	-- Gormok
	L.snobold = "Snobold"
	L.snobold_desc = "Warn who gets a Snobold on their heads."
	L.snobold_message = "Add"

	-- Jormungars
	L.submerge = "Submerge"
	L.submerge_desc = "Show a timer bar for the next time the worms will submerge."
	L.spew = "Acidic/Molten Spew"
	L.spew_desc = "Warn for Acidic/Molten Spew."
	L.sprays = "Sprays"
	L.sprays_desc = "Show timers for the next Paralytic and Burning Sprays."
	L.slime_message = "Slime on YOU!"
	L.burn_spell = "Burn"
	L.toxin_spell = "Toxin"
	L.spray = "Next Spray"

	-- Icehowl
	L.charge = "Furious Charge"
	L.charge_desc = "Warn about Furious Charge on players."
	L.charge_trigger = "glares at"

	L.bosses = "Bosses"
	L.bosses_desc = "Warn about bosses incoming"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnRegister()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end
mod.OnBossDisable = mod.OnRegister

function mod:GetOptions()
	return {
		--[[ Gormok the Impaler ]]--
		"snobold",
		66331,
		66330,
		{66317, "FLASH"},

		--[[ Jormungars ]]--
		"submerge",
		{66883, "FLASH"},
		"spew",
		"sprays",
		{66823, "FLASH"},
		66869,
		68335,
		"proximity",

		--[[ Icehowl ]]--
		66770,
		{"charge", "ICON", "SAY", "FLASH"},
		66758,
		66759,

		--[[ General ]]--
		"bosses",
		"berserk",
	}, {
		snobold = gormok,
		submerge = jormungars,
		[66770] = icehowl,
		bosses = "general",
	}
end

function mod:OnBossEnable()
	-- Gormok
	self:Log("SPELL_DAMAGE", "FireBomb", 66317)
	self:Log("SPELL_MISSED", "FireBomb", 66317)
	self:Log("SPELL_AURA_APPLIED", "Impale", 66331)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Impale", 66331)
	self:Log("SPELL_CAST_START", "StaggeringStomp", 66330)

	-- Jormungars
	self:Log("SPELL_CAST_SUCCESS", "SlimeCast", 66883)
	self:Log("SPELL_DAMAGE", "Slime", 66883)
	self:Log("SPELL_MISSED", "Slime", 66883)
	self:Log("SPELL_CAST_START", "Spew", 66818, 66821) -- Acidic, Molten
	self:Log("SPELL_CAST_START", "Spray", 66901, 66902) -- Paralytic Spray / Burning Spray
	self:Log("SPELL_AURA_APPLIED", "Toxin", 66823)
	self:Log("SPELL_AURA_APPLIED", "Burn", 66869, 66870)
	self:Log("SPELL_AURA_APPLIED", "Enraged", 68335)

	-- Icehowl
	self:Log("SPELL_AURA_APPLIED", "Rage", 66759)
	self:Log("SPELL_AURA_APPLIED", "Daze", 66758)
	self:Log("SPELL_AURA_APPLIED", "Butt", 66770)

	-- Common
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "Reboot")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Charge")
	self:Death("Win", 34797)
end

function mod:OnEngage()
	self:CloseProximity()
	self:Bar("bosses", 20, L["boss_incoming"]:format(gormok), 66331)
	if self:Heroic() then
		self:Bar("bosses", 180, L["boss_incoming"]:format(jormungars), "INV_Misc_MonsterScales_18")
	else
		self:Berserk(900)
	end
	wipe(snobolledWarned)
	self:RegisterEvent("UNIT_AURA")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg == L.engage_trigger or msg:find(L.engage_trigger, nil, true) then
		if not self:IsEnabled() then
			self:Enable()
		end
		self:Engage()
	elseif msg == L.wipe_trigger or msg:find(L.wipe_trigger, nil, true) then
		self:Reboot()
	elseif msg == L.icehowl_trigger or msg:find(L.icehowl_trigger, nil, true) then
		self:Icehowl()
	elseif msg == L.jormungars_trigger or msg:find(L.jormungars_trigger, nil, true) then
		self:Jormungars()
	end
end

--------------------------------------------------------------------------------
-- Gormok the Impaler
--

do
	local UnitDebuff = UnitDebuff
	local snobolled = GetSpellInfo(66406)
	function mod:UNIT_AURA(_, unit)
		local debuffed = UnitDebuff(unit, snobolled)
		local player = self:UnitName(unit)
		if snobolledWarned[player] and not debuffed then
			snobolledWarned[player] = nil
		elseif debuffed and not snobolledWarned[player] then
			self:TargetMessage("snobold", player, "Attention", nil, L["snobold_message"], 66406)
			snobolledWarned[player] = true
		end
	end
end

function mod:Impale(args)
	if args.amount then
		self:StackMessage(args.spellId, args.destName, args.amount, "Urgent", "Info")
	end
	self:Bar(args.spellId, 10)
end

function mod:StaggeringStomp(args)
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 21)
end

do
	local last = 0
	function mod:FireBomb(args)
		if self:Me(args.destGUID) then
			local t = GetTime()
			if t-4 > last then
				self:Message(args.spellId, "Personal", "Alarm", CL["you"]:format(args.spellName))
				self:Flash(args.spellId)
				last = t
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Jormungars
--

function mod:Jormungars()
	local m = L["boss_incoming"]:format(jormungars)
	self:Message("bosses", "Positive", nil, m, "Ability_Hunter_Pet_Worm")
	self:Bar("bosses", 15, m, "INV_Misc_MonsterScales_18")
	if self:Heroic() then
		self:Bar("bosses", 200, L["boss_incoming"]:format(icehowl), "INV_Misc_MonsterHorn_07")
	end
	self:OpenProximity("proximity", 10)
	-- The first worm to spray is Acidmaw, he has a 10 second spray timer after emerge
	sprayTimer = 10
	handle_Jormungars = self:ScheduleTimer("Emerge", 15)
end

do
	local function submerge()
		handle_Jormungars = mod:ScheduleTimer("Emerge", 10)
	end

	function mod:Emerge()
		self:Bar("submerge", 45, L["submerge"], "INV_Misc_MonsterScales_18")
		handle_Jormungars = self:ScheduleTimer(submerge, 45)
		-- Rain of Fire icon as a generic AoE spray icon .. good enough?
		self:CDBar("sprays", sprayTimer, L["spray"], 5740)
		sprayTimer = sprayTimer == 10 and 20 or 10
	end

	function mod:Spray(args)
		self:Message("sprays", "Important", nil, args.spellName, args.spellId)
		self:CDBar("sprays", 20, L["spray"], 5740)
	end
end


function mod:SlimeCast(args)
	self:Message(args.spellId, "Attention")
end

function mod:Spew(args)
	self:Message("spew", "Attention", nil, args.spellName, args.spellId)
end

do
	local toxinTargets, scheduled = mod:NewTargetList(), nil
	local function toxinWarn(spellId)
		mod:TargetMessage(spellId, toxinTargets, "Urgent", "Info", L["toxin_spell"])
		scheduled = nil
	end
	function mod:Toxin(args)
		toxinTargets[#toxinTargets + 1] = args.destName
		if self:Me(args.destGUID) then
			self:Flash(args.spellId)
		end
		if not scheduled then 
			scheduled = self:ScheduleTimer(toxinWarn, 0.5, args.spellId)
		end
	end
end

do
	local burnTargets, scheduled = mod:NewTargetList()
	local function burnWarn()
		mod:TargetMessage(66869, burnTargets, "Urgent", "Info", L["burn_spell"])
		scheduled = nil
	end
	function mod:Burn(args)
		burnTargets[#burnTargets + 1] = args.destName
		if not scheduled then 
			scheduled = self:ScheduleTimer(burnWarn, 0.5)
		end
	end
end

function mod:Enraged(args)
	self:Message(args.spellId, "Important", "Long")
end

do
	local last = 0
	function mod:Slime(args)
		if self:Me(args.destGUID) then
			local t = GetTime()
			if t-4 > last then
				self:Message(args.spellId, "Personal", "Alarm", L["slime_message"])
				self:Flash(args.spellId)
				last = t
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Icehowl
--

function mod:Icehowl()
	local m = L["boss_incoming"]:format(icehowl)
	self:Message("bosses", "Positive", nil, m, "INV_Misc_Pet_Pandaren_Yeti")
	self:Bar("bosses", 10, m, "INV_Misc_MonsterHorn_07")
	self:CancelTimer(handle_Jormungars)
	handle_Jormungars = nil
	self:StopBar(L["spray"])
	self:StopBar(L["submerge"])
	if self:Heroic() then
		self:Berserk(220, true, icehowl)
	end
	self:CloseProximity()
end

function mod:Rage(args)
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 15)
end

function mod:Daze(args)
	self:Message(args.spellId, "Positive")
	self:Bar(args.spellId, 15)
end

function mod:Butt(args)
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:CDBar(args.spellId, 12)
end

function mod:Charge(_, msg, unit, _, _, player)
	if unit == icehowl then
		local furiousChargeId = 52311
		self:TargetMessage("charge", player, "Personal", "Alarm", furiousChargeId)
		if UnitIsUnit(player, "player") then
			self:Flash("charge", furiousChargeId)
			self:Say("charge", furiousChargeId)
		end
		self:Bar("charge", 7.5, furiousChargeId)
		self:PrimaryIcon("charge", player)
	end
end

