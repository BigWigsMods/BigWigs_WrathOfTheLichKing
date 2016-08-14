--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Halion", 609, 1652)
if not mod then return end
mod:RegisterEnableMob(39863, 40142)
mod.toggleOptions = {{74562, "SAY", "ICON", "FLASH"}, 74648, {74792, "SAY", "ICON", "FLASH"}, 74769, 74806, 74525, "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local phase = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_trigger = "Your world teeters on the brink of annihilation. You will ALL bear witness to the coming of a new age of DESTRUCTION!"

	L.phase_two_trigger = "You will find only suffering within the realm of twilight! Enter if you dare!"

	L.twilight_cutter_trigger = "The orbiting spheres pulse with dark energy!"
	L.twilight_cutter_bar = "Laser beams"
	L.twilight_cutter_warning = "Laser beams incoming!"

	L.fire_damage_message = "Your feet are burning!"
	L.fire_message = "Fire bomb"
	L.shadow_message = "Shadow bomb"

	L.meteorstrike_yell = "The heavens burn!"
	L.meteorstrike_bar = "Meteor Strike"
	L.meteor_warning_message = "Meteor incoming!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Fire", 74562)
	self:Log("SPELL_AURA_APPLIED", "Shadow", 74792)
	self:Log("SPELL_CAST_SUCCESS", "MeteorStrike", 74648)
	--self:Log("SPELL_DAMAGE", "FireDamage", 75947, 75948, 75949, 75950, 75951, 75952) -- XXX These IDs no longer exist, we need to find the correct one(s).
	--self:Log("SPELL_MISSED", "FireDamage", 75947, 75948, 75949, 75950, 75951, 75952)
	-- Dark breath 25m, flame breath 25m, dark breath 10m, flame breath 10m
	self:Log("SPELL_CAST_START", "ShadowBreath", 74806)
	self:Log("SPELL_CAST_START", "FireBreath", 74525)
	self:Death("Win", 39863, 40142)

	self:Emote("TwilightCutter", L["twilight_cutter_trigger"])
	self:Yell("Engage", L["engage_trigger"])
	self:Yell("PhaseTwo", L["phase_two_trigger"])
	self:Yell("MeteorInc", L["meteorstrike_yell"])

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

function mod:OnEngage()
	phase = 1
	self:Berserk(480)
	self:Bar(74648, 30, L["meteorstrike_bar"])
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FireDamage(args)
	if self:Me(args.destGUID) then
		self:Message(74648, "Personal", nil, L["fire_damage_message"])
	end
end

function mod:Fire(args)
	self:Bar(74562, self:Heroic() and 20 or 25, L["fire_message"])
	if self:Me(args.destGUID) then
		self:Say(74562, L["fire_message"])
		self:Flash(74562)
	end
	self:TargetMessage(74562, args.destName, "Personal", "Info", L["fire_message"])
	self:PrimaryIcon(74562, args.destName)
end

function mod:Shadow(args)
	self:Bar(74792, self:Heroic() and 20 or 25, L["shadow_message"])
	if self:Me(args.destGUID) then
		self:Say(74792, L["shadow_message"])
		self:Flash(74792)
	end
	self:TargetMessage(74792, args.destName, "Personal", "Info", L["shadow_message"])
	self:SecondaryIcon(74792, args.destName)
end

function mod:ShadowBreath(args)
	self:Bar(74806, 12)
end

function mod:FireBreath(args)
	self:Bar(74525, 12)
end

function mod:TwilightCutter()
	self:CDBar(74769, 33, L["twilight_cutter_bar"])
	self:Message(74769, "Important", "Alert", L["twilight_cutter_warning"])
end

function mod:MeteorInc(args)
	self:Message(74648, "Urgent", "Long", L["meteor_warning_message"])
end

function mod:MeteorStrike(args)
	self:Bar(74648, 40, L["meteorstrike_bar"])
	self:Message(74648, "Important")
end

function mod:PhaseTwo(args)
	phase = 2
	self:CDBar(74769, 40, L["twilight_cutter_bar"])
end

