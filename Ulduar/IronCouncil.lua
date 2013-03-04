--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Iron Council", 529)
if not mod then return end
-- steelbreaker = 32867, molgeim = 32927, brundir = 32857
mod:RegisterEnableMob(32867, 32927, 32857)
mod.toggleOptions = {61869, 63483, {61887, "ICON", "FLASH"}, 61903, {64637, "ICON", "FLASH"}, "proximity", 62274, 61974, {62269, "FLASH"}, 62273, "berserk", "bosskill" }

mod.optionHeaders = {
	[61869] = "Stormcaller Brundir",
	[61903] = "Steelbreaker",
	[62274] = "Runemaster Molgeim",
	berserk = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local previous = nil
local deaths = 0
local overwhelmTime = 35
local tendrilscanner = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger1 = "You will not defeat the Assembly of Iron so easily, invaders!"
	L.engage_trigger2 = "Nothing short of total decimation will suffice."
	L.engage_trigger3 = "Whether the world's greatest gnats or the world's greatest heroes, you are still only mortal."

	L.overload_message = "Overload in 6sec!"
	L.death_message = "Rune of Death on YOU!"
	L.summoning_message = "Elementals Incoming!"

	L.chased_other = "%s is being chased!"
	L.chased_you = "YOU are being chased!"

	L.shield_message = "Rune shield!"

	L.council_dies = "%s dead"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Punch", 61903, 63493) -- Steelbreaker
	self:Log("SPELL_AURA_APPLIED", "Overwhelm", 64637, 61888) -- Steelbreaker +2
	self:Log("SPELL_AURA_REMOVED", "OverRemove", 64637, 61888)

	self:Log("SPELL_AURA_APPLIED", "Shield", 62274, 63489) -- Molgeim
	self:Log("SPELL_CAST_SUCCESS", "RunePower", 61974) -- Molgeim
	self:Log("SPELL_CAST_SUCCESS", "RuneDeathCD", 62269, 63490) -- Molgeim +1
	self:Log("SPELL_AURA_APPLIED", "RuneDeath", 62269, 63490) -- Molgeim +1
	self:Log("SPELL_CAST_START", "RuneSummoning", 62273) -- Molgeim +2

	self:Log("SPELL_CAST_SUCCESS", "Overload", 61869, 63481) -- Brundir
	self:Log("SPELL_CAST_SUCCESS", "Whirl", 63483, 61915) -- Brundir +1
	self:Log("SPELL_AURA_APPLIED", "Tendrils", 61887, 63486) -- Brundir +2
	self:Log("SPELL_AURA_REMOVED", "TendrilsRemoved", 61887, 63486) -- Brundir +2

	self:Death("Deaths", 32867, 32927, 32857)
	self:Yell("Engage", L["engage_trigger1"], L["engage_trigger2"], L["engage_trigger3"])
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

function mod:OnEngage(diff)
	previous = nil
	deaths = 0
	overwhelmTime = diff == 3 and 60 or 35
	self:Berserk(900)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Punch(args)
	self:Message(61903, args.spellName, "Urgent", args.spellId)
end

function mod:Overwhelm(args)
	if UnitIsUnit(args.destName, "player") then
		self:OpenProximity("proximity", 15)
		self:Flash(64637)
	end
	self:TargetMessage(64637, args.spellName, args.destName, "Personal", args.spellId, "Alert")
	self:TargetBar(64637, args.spellName, args.destName, overwhelmTime, args.spellId)
	self:PrimaryIcon(64637, args.destName)
end

function mod:OverRemove(args)
	if UnitIsUnit(args.destName, "player") then
		self:CloseProximity()
	end
	self:StopBar(args.spellName, args.destName)
end

function mod:Shield(args)
	if self:MobId(dGUID) == args.destGUID then
		self:Message(62274, L["shield_message"], "Attention", args.spellId)
	end
end

function mod:RunePower(args)
	self:Message(61974, args.spellName, "Positive", args.spellId)
	self:Bar(61974, args.spellName, 30, args.spellId)
end

function mod:RuneDeathCD(args)
	self:Bar(62269, args.spellName, 30, args.spellId)
end

function mod:RuneDeath(args)
	if UnitIsUnit(args.destName, "player") then
		self:Message(62269, L["death_message"], "Personal", args.spellId, "Alarm")
		self:Flash(62269)
	end
end

function mod:RuneSummoning(args)
	self:Message(62273, L["summoning_message"], "Attention", args.spellId)
end

function mod:Overload(args)
	self:Message(61869, L["overload_message"], "Attention", args.spellId, "Long")
	self:Bar(61869, args.spellName, 6, args.spellId)
end

function mod:Whirl(args)
	self:Message(63483, args.spellName, "Attention", args.spellId)
end

do
	local function targetCheck()
		local bossId = mod:GetUnitIdByGUID(32857)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target ~= previous then
			if target then
				if UnitIsUnit(target, "player") then
					mod:Message(61887, L["chased_you"], "Personal", nil, "Alarm")
					mod:Flash(61887)
				else
					mod:Message(61887, L["chased_other"]:format(target), "Attention")
				end
				mod:PrimaryIcon(61887, target)
				previous = target
			else
				previous = nil
			end
		end
	end

	local last = nil
	function mod:Tendrils(args)
		local t = GetTime()
		if not last or (t > last + 2) then
			self:Message(61887, args.spellName, "Attention", args.spellId)
			self:Bar(61887, args.spellName, 25, args.spellId)
			if not tendrilscanner then
				tendrilscanner = self:ScheduleRepeatingTimer(targetCheck, 0.2)
			end
		end
	end
end

function mod:TendrilsRemoved()
	self:CancelTimer(tendrilscanner)
	tendrilscanner = nil
	self:PrimaryIcon(61887)
end

function mod:Deaths(args)
	deaths = deaths + 1
	if deaths < 3 then
		self:Message("bosskill", L["council_dies"]:format(args.destName), "Positive")
	else
		self:Win()
	end
end

