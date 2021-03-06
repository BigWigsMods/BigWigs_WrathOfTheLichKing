--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Maexxna", 533, 1603)
if not mod then return end
mod:RegisterEnableMob(15952)
mod.toggleOptions = {29484, 28622, 54123}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.webspraywarn30sec = "Cocoons in 10 sec"
	L.webspraywarn20sec = "Cocoons! Spiders in 10 sec!"
	L.webspraywarn10sec = "Spiders! Spray in 10 sec!"
	L.webspraywarn5sec = "WEB SPRAY in 5 seconds!"
	L.webspraywarn = "Web Spray! 40 sec until next!"
	L.enragewarn = "Frenzy - SQUISH SQUISH SQUISH!"
	L.enragesoonwarn = "Frenzy Soon - Bugsquatters out!"

	L.webspraybar = "Web Spray"
	L.cocoonbar = "Cocoons"
	L.spiderbar = "Spiders"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Cocoon", 28622)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 54123, 54124) --Norm/Heroic
	self:Log("SPELL_CAST_SUCCESS", "Spray", 29484, 54125)
	self:Death("Win", 15952)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	self:Spray()
	self:RegisterUnitEvent("UNIT_HEALTH", nil, "target", "focus")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local cocoonTargets, scheduled = mod:NewTargetList(), nil
	local function cocoonWarn()
		mod:TargetMessageOld(28622, cocoonTargets, "red", "alert", L["cocoonbar"], 745)
		scheduled = nil
	end
	function mod:Cocoon(args)
		cocoonTargets[#cocoonTargets + 1] = args.destName
		self:CancelTimer(scheduled)
		scheduled = self:ScheduleTimer(cocoonWarn, 0.3)
	end
end

function mod:Spray()
	self:MessageOld(29484, "red", nil, L["webspraywarn"], 54125)
	self:DelayedMessage(29484, 10, "yellow", L["webspraywarn30sec"])
	self:DelayedMessage(29484, 20, "yellow", L["webspraywarn20sec"])
	self:DelayedMessage(29484, 30, "yellow", L["webspraywarn10sec"])
	self:DelayedMessage(29484, 35, "yellow", L["webspraywarn5sec"])
	self:Bar(29484, 40, L["webspraybar"], 54125)
	self:Bar(28622, 20, L["cocoonbar"], 745)
	self:Bar(29484, 30, L["spiderbar"], 17332)
end

function mod:Frenzy(args)
	self:UnregisterUnitEvent("UNIT_HEALTH", "target", "focus")
	self:MessageOld(54123, "yellow", "alarm", L["enragewarn"], args.spellId)
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 15952 then
		local health = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if health < 36 then
			self:MessageOld(54123, "red", nil, L["enragesoonwarn"], false)
			self:UnregisterUnitEvent(event, "target", "focus")
		end
	end
end

