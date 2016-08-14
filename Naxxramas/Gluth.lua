--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Gluth", 535, 1612)
if not mod then return end
mod:RegisterEnableMob(15932)
mod.toggleOptions = {28371, 54426, "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local enrageTime = 420

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.startwarn = "Gluth engaged, ~105 sec to decimate!"

	L.decimatesoonwarn = "Decimate Soon!"
	L.decimatebartext = "Decimate Zombies"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Frenzy", 28371, 54427)
	self:Log("SPELL_DAMAGE", "Decimate", 28375, 54426)
	self:Log("SPELL_MISSED", "Decimate", 28375, 54426)
	self:Death("Win", 15932)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage(diff)
	self:Berserk(diff == 3 and 480 or 420, true)
	self:Message(54426, "Attention", nil, L["startwarn"], false)
	self:CDBar(54426, 105, L["decimatebartext"])
	self:DelayedMessage(54426, 100, "Urgent", L["decimatesoonwarn"])
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Frenzy(args)
	self:Message(28371, "Important")
end

do
	local last = 0
	function mod:Decimate(args)
		local t = GetTime()
		if t-5 > last then
			self:Message(54426, "Attention", "Alert")
			self:CDBar(54426, 105, L["decimatebartext"])
			self:DelayedMessage(54426, 100, "Urgent", L["decimatesoonwarn"])
			last = t
		end
	end
end

