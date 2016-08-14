--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ignis the Furnace Master", 529, 1638)
if not mod then return end
mod:RegisterEnableMob(33118)
mod.toggleOptions = { 62488, 62382, {62680, "FLASH"}, {62546, "FLASH"}, 62717}

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
	L.brittle_message = "Construct is Brittle!"
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
	self:CDBar(62680, 21)
	self:Bar(62488, 10, CL["next_add"], "INV_Misc_Statue_07")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Brittle(args)
	self:Message(args.spellId, "Positive", nil, L["brittle_message"])
end

function mod:Construct()
	self:Message(62488, "Important", nil, CL["add_spawned"], "INV_Misc_Statue_07")
	self:Bar(62488, spawnTime, CL["next_add"], "INV_Misc_Statue_07")
end

function mod:ScorchCast(args)
	self:Message(62546, "Attention")
	self:Bar(62546, 25)
	self:DelayedMessage(62546, 20, "Urgent", CL["custom_sec"]:format(args.spellName, 5))
end

do
	local last = nil
	function mod:Scorch(args)
		if self:Me(args.destGUID) then
			local t = GetTime()
			if not last or (t > last + 4) then
				self:Message(62546, "Personal", last and nil or "Alarm", CL["underyou"]:format(args.spellName))
				self:Flash(62546)
				last = t
			end
		end
	end
end

function mod:SlagPot(args)
	self:TargetMessage(62717, args.destName, "Important")
	self:TargetBar(62717, 10, args.destName)
end

do
	-- XXX Why do we still do this?
	local function isCaster()
		local power = UnitPowerType("player")
		local _, class = UnitClass("player")
		if power ~= 0 or (class == "PALADIN" and not mod:Healer()) then return end
		return true
	end

	function mod:Jets(args)
		local caster = isCaster()
		local color = caster and "Personal" or "Attention"
		local sound = caster and "Long" or nil
		self:Message(62680, color, sound)
		self:CDBar(62680, 25)
		if caster then
			self:Bar(62680, 2.7, CL["cast"]:format(args.spellName))
			self:Flash(62680)
		end
	end
end

