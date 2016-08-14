--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Iron Council", 529, 1641)
if not mod then return end
-- steelbreaker = 32867, molgeim = 32927, brundir = 32857
mod:RegisterEnableMob(32867, 32927, 32857)
mod.toggleOptions = {61869, 63483, {61887, "ICON", "FLASH"}, 61903, {64637, "ICON", "FLASH"}, "proximity", 62274, 61974, {62269, "FLASH"}, 62273, "berserk", "stages" }

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

	L.summoning_message = "Elementals Incoming!"

	L.chased_other = "%s is being chased!"
	L.chased_you = "YOU are being chased!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Punch", 61903, 63493) -- Steelbreaker
	self:Log("SPELL_AURA_APPLIED", "Overwhelm", 64637, 61888) -- Steelbreaker +2
	self:Log("SPELL_AURA_REMOVED", "OverwhelmRemove", 64637, 61888)

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
	self:Message(61903, "Urgent")
end

function mod:Overwhelm(args)
	if self:Me(args.destGUID) then
		self:OpenProximity("proximity", 15)
		self:Flash(64637)
	end
	self:TargetMessage(64637, args.destName, "Personal", "Alert")
	self:TargetBar(64637, overwhelmTime, args.destName)
	self:PrimaryIcon(64637, args.destName)
end

function mod:OverwhelmRemove(args)
	if self:Me(args.destGUID) then
		self:CloseProximity()
	end
	self:StopBar(args.spellName, args.destName)
end

function mod:Shield(args)
	if self:MobId(args.destGUID) == 32927 then
		self:Message(62274, "Attention")
	end
end

function mod:RunePower(args)
	self:Message(61974, "Positive")
	self:Bar(61974, 30)
end

function mod:RuneDeathCD(args)
	self:Bar(62269, 30)
end

function mod:RuneDeath(args)
	if self:Me(args.destGUID) then
		self:Message(62269, "Personal", "Alarm", CL["you"]:format(self:SpellName(62269)))
		self:Flash(62269)
	end
end

function mod:RuneSummoning(args)
	self:Message(args.spellId, "Attention", nil, L["summoning_message"])
end

function mod:Overload(args)
	self:Message(61869, "Attention", "Long", CL["custom_sec"]:format(args.spellName, 6))
	self:Bar(61869, 6)
end

function mod:Whirl(args)
	self:Message(63483, "Attention")
end

do
	local function targetCheck()
		local bossId = mod:GetUnitIdByGUID(32857)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target ~= previous then
			if target then
				if UnitIsUnit(target, "player") then
					mod:Message(61887, "Personal", "Alarm", L["chased_you"])
					mod:Flash(61887)
				else
					mod:Message(61887, "Attention", nil, L["chased_other"]:format(target))
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
			self:Message(61887, "Attention")
			self:Bar(61887, 25)
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
		self:Message("stages", "Positive", nil, CL["mob_killed"]:format(args.destName, deaths, 3), false)
	else
		self:Win()
	end
end

