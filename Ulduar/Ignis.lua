--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Ignis the Furnace Master", 529)
if not mod then return end
mod:RegisterEnableMob(33118)
mod.toggleOptions = { 62488, 62382, {62680, "FLASH"}, {62546, "FLASH"}, 62717, "bosskill"}

--------------------------------------------------------------------------------
-- Locals
--

local spawnTime = 30

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Insolent whelps! Your blood will temper the weapons used to reclaim this world!"

	L.construct_message = "Add incoming!"
	L.construct_bar = "Next add"
	L.brittle_message = "Construct is Brittle!"
	L.flame_bar = "~Jets cooldown"
	L.scorch_message = "Scorch on you!"
	L.scorch_soon = "Scorch in ~5sec!"
	L.scorch_bar = "Next Scorch"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Construct", 62488)
	self:Log("SPELL_CAST_SUCCESS", "ScorchCast", 62546, 63474)
	self:Log("SPELL_CAST_START", "Jets", 62680, 63472)
	self:Log("SPELL_DAMAGE", "Scorch", 62548, 63475)
	self:Log("SPELL_MISSED", "Scorch", 62548, 63475)
	self:Log("SPELL_AURA_APPLIED", "SlagPot", 62717, 63477)
	self:Log("SPELL_AURA_APPLIED", "Brittle", 62382)
	self:Death("Win", 33118)
	self:Yell("Engage", L["engage_trigger"])
end

function mod:OnEngage(diff)
	spawnTime = diff == 3 and 40 or 30
	self:Bar(62680, L["flame_bar"], 21, 62680)
	self:Bar(62488, L["construct_bar"], 10, "INV_Misc_Statue_07")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Brittle(args)
	self:Message(args.spellId, L["brittle_message"], "Positive", args.spellId)
end

function mod:Construct()
	self:Message(62488, L["construct_message"], "Important", "INV_Misc_Statue_07")
	self:Bar(62488, L["construct_bar"], spawnTime, "INV_Misc_Statue_07")
end

function mod:ScorchCast(args)
	self:Message(62546, args.spellName, "Attention", args.spellId)
	self:Bar(62546, L["scorch_bar"], 25, args.spellId)
	self:DelayedMessage(62546, 20, L["scorch_soon"], "Urgent", args.spellId)
end

do
	local last = nil
	function mod:Scorch(args)
		if UnitIsUnit(args.destName, "player") then
			local t = GetTime()
			if not last or (t > last + 4) then
				self:LocalMessage(62546, L["scorch_message"], "Personal", args.spellId, last and nil or "Alarm")
				self:Flash(62546)
				last = t
			end
		end
	end
end

function mod:SlagPot(args)
	self:TargetMessage(62717, args.spellName, args.destName, "Important", args.spellId)
	self:TargetBar(62717, args.spellName, args.destName, 10, args.spellId)
end

do
	-- XXX Why do we still do this?
	local _, class = UnitClass("player")
	local function isCaster()
		local power = UnitPowerType("player")
		if power ~= 0 then return end
		if class == "PALADIN" then
			local tree = GetSpecialization()
			local role = GetSpecializationRole(tree)
			if role ~= "HEALER" then return end
		end
		return true
	end

	function mod:Jets(args)
		local caster = isCaster()
		local color = caster and "Personal" or "Attention"
		local sound = caster and "Long" or nil
		self:Message(62680, args.spellName, color, args.spellId, sound)
		self:Bar(62680, L["flame_bar"], 25, args.spellId)
		if caster then
			self:Bar(62680, args.spellName, 2.7, args.spellId)
			self:Flash(62680)
		end
	end
end

