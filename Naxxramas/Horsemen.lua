--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("The Four Horsemen", 535, 1609)
if not mod then return end
mod:RegisterEnableMob(16063, 16064, 16065, 30549) -- Zeliek, Thane, Blaumeux, Baron
mod.toggleOptions = {"mark", 28884, 28863, 28883, "stages"}

--------------------------------------------------------------------------------
-- Locals
--

local deaths = 0
local marks = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.mark = "Mark"
	L.mark_desc = "Warn for marks."
	L.markbar = "Mark %d"
	L.markwarn1 = "Mark %d!"
	L.markwarn2 = "Mark %d in 5 sec"

	L.dies = "#%d Killed"

	L.startwarn = "The Four Horsemen Engaged! Mark in ~17 sec"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "VoidZone", 28863, 57463)
	self:Log("SPELL_CAST_START", "Meteor", 28884, 57467)
	self:Log("SPELL_CAST_SUCCESS", "Wrath", 28883, 57466)
	self:Log("SPELL_CAST_SUCCESS", "Mark", 28832, 28833, 28834, 28835) --Mark of Korth'azz, Mark of Blaumeux, Mark of Rivendare, Mark of Zeliek
	self:Death("Deaths", 16063, 16064, 16065, 30549)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	marks = 1
	deaths = 0
	self:Message("mark", "Attention", nil, L["startwarn"], false)
	self:Bar("mark", 17, L["markbar"]:format(marks), 28835)
	self:DelayedMessage("mark", 12, "Urgent", L["markwarn2"]:format(marks))
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Deaths()
	deaths = deaths + 1
	if deaths < 4 then
		self:Message("stages", "Positive", nil, CL.mob_killed:format(deaths, 4), false)
	else
		self:Win()
	end
end

function mod:VoidZone(args)
	self:Message(28863, "Important")
	self:Bar(28863, 12)
end

function mod:Meteor(args)
	self:Message(28884, "Important")
	self:Bar(28884, 12)
end

function mod:Wrath(args)
	self:Message(28883, "Important")
	self:Bar(28883, 12)
end

do
	local last = 0
	function mod:Mark(args)
		local t = GetTime()
		if t-5 > last then
			self:Message("mark", "Important", nil, L["markwarn1"]:format(marks), 28835)
			marks = marks + 1
			self:Bar("mark", 12, L["markbar"]:format(marks), 28835)
			self:DelayedMessage("mark", 7, "Urgent", L["markwarn2"]:format(marks))
			last = t
		end
	end
end

