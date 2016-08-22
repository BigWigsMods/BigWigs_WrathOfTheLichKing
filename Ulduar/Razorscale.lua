--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Razorscale", 529, 1639)
if not mod then return end
--[[
	33287 = Expedition Engineer
	33816 = Expedition Defender
	33210 = Expidition Commander
	33186 = Razorscale
--]]
mod:RegisterEnableMob(33186, 33210, 33816, 33287)
mod.toggleOptions = {"phase", 64021, {64704, "FLASH"}, "harpoon", "berserk"}

--------------------------------------------------------------------------------
-- Locals
--

local started = nil
local count = 0
local totalHarpoons = 4
local phase = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase = "Phases"
	L.phase_desc = "Warn when Razorscale switches between phases."
	L.ground_trigger = "Move quickly! She won't remain grounded for long!"
	L.ground_message = "Razorscale Chained up!"
	L.air_trigger = "Give us a moment to prepare to build the turrets."
	L.air_trigger2 = "Fires out! Let's rebuild those turrets!"
	L.air_message = "Takeoff!"
	L.phase2_trigger = "%s grounded permanently!"
	L.phase2_message = "Phase 2!"
	L.phase2_warning = "Phase 2 Soon!"

	L.breath_trigger = "%s takes a deep breath..."
	L.breath_message = "Flame Breath!"
	L.breath_bar = "~Breath Cooldown"

	L.harpoon = "Harpoons"
	L.harpoon_desc = "Announce when the harpoons are ready for use."
	L.harpoon_message = "Harpoon %d ready!"
	L.harpoon_trigger = "Harpoon Turret is ready for use!"
	L.harpoon_nextbar = "Harpoon %d"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_DAMAGE", "Flame", 64704, 64733)
	self:Log("SPELL_MISSED", "Flame", 64704, 64733)
	self:Death("Win", 33186)

	self:Emote("Phase2", L["phase2_trigger"])
	self:Emote("Breath", L["breath_trigger"])
	self:Emote("Harpoon", L["harpoon_trigger"])

	self:Yell("Grounded", L["ground_trigger"])
	self:Yell("Airphase", L["air_trigger"])
	self:Yell("Airphase10", L["air_trigger2"])

	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "target", "focus")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	totalHarpoons = self:Difficulty() == 3 and 2 or 4
	started = nil
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Flame(args)
	if self:Me(args.destGUID) then
		self:Message(64704, "Personal", "Alarm", CL.underyou:format(args.spellName))
		self:Flash(64704)
	end
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	if self:MobId(UnitGUID(unit)) == 33186 then
		local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
		if hp > 51 and hp < 55 then
			self:Message("phase", "Positive", nil, L["phase2_warning"], false)
			self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "target", "focus")
		end
	end
end

function mod:Phase2()
	phase = 2
	self:StopBar(171163) -- Stun
	self:Message("phase", "Attention", nil, L["phase2_message"], false)
end

function mod:Breath()
	self:Message(64021, "Attention", nil, L["breath_message"])
	if phase == 2 then
		self:Bar(64021, 21, L["breath_bar"], 64021)
	end
end

function mod:Harpoon()
	count = count + 1
	self:Message("harpoon", "Attention", nil, L["harpoon_message"]:format(count), "INV_Spear_06")
	if count < totalHarpoons then
		self:Bar("harpoon", 18, L["harpoon_nextbar"]:format(count+1), "INV_Spear_06")
	end
end

function mod:Grounded()
	self:Message("phase", "Attention", "Long", L["ground_message"], false)
	self:Bar("phase", 38, 171163) -- spell_frost_stun / Stun / icon id 135860
	count = 0
end

function mod:Airphase()
	count = 0
	self:Bar("harpoon", 55, L["harpoon_nextbar"]:format(1), "INV_Spear_06")
	if not started then
		self:Engage()
		self:Berserk(900)
		started = true
		phase = 1
	else
		self:StopBar(171163) -- Stun
		self:Message("phase", "Attention", "Info", L["air_message"], false)
	end
end

-- for 10man, has a different yell, and different timing <.<
-- it happens alot later then the 25m yell, so a "Takeoff" warning isn't really appropriate anymore.
-- just a bar for the next harpoon
function mod:Airphase10()
	count = 0
	self:Bar("harpoon", 22, L["harpoon_nextbar"]:format(1), "INV_Spear_06")
	self:StopBar(171163) -- Stun
	--self:Message(L["air_message"], "Attention", nil, "Info")
end

