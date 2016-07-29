--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Kologarn", 529)
if not mod then return end
mod:RegisterEnableMob(32930)
mod.toggleOptions = { 64290, "shockwave", {"eyebeam", "ICON", "FLASH", "SAY"}, "arm", 63355}

--------------------------------------------------------------------------------
-- Locals
--

local grip = mod:NewTargetList()
local eyeBeam = mod:SpellName(40620)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.arm = "Arm dies"
	L.arm_desc = "Warn for Left & Right Arm dies."
	L.arm_icon = 73903 -- spell_nature_earthelemental_totem / Earth Elemental Totem / icon 136024
	L.left_dies = "Left Arm dies"
	L.right_dies = "Right Arm dies"
	L.left_wipe_bar = "Respawn Left Arm"
	L.right_wipe_bar = "Respawn Right Arm"

	L.shockwave = "Shockwave"
	L.shockwave_desc = "Warn when the next Shockwave is coming."
	L.shockwave_trigger = "Oblivion!"

	L.eyebeam = "Focused Eyebeam"
	L.eyebeam_desc = "Warn who gets Focused Eyebeam."
	L.eyebeam_trigger = "his eyes on you"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Grip", 64290, 64292)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Armor", 63355, 64002)
	self:Log("UNIT_DIED", "Deaths")

	self:Death("Deaths", 32933, 32934)
	self:Death("Win", 32930)

	self:RegisterEvent("RAID_BOSS_WHISPER")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:AddSyncListener("EyeBeamWarn")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Armor(player, spellId, _, _, _, stack)
	if stack > 1 then
		self:StackMessage(63355,  player, stack, "Urgent", "Info")
	end
end

do
	local handle = nil
	local function gripWarn()
		mod:TargetMessage(64290, grip, "Attention", "Alert")
		mod:Bar(64290, 10)
		handle = nil
	end

	function mod:Grip(args)
		grip[#grip + 1] = args.destName
		if not handle then
			handle = self:ScheduleTimer(gripWarn, 0.2)
		end
	end
end

function mod:RAID_BOSS_WHISPER(event, msg)
	if msg:find(L["eyebeam_trigger"]) then
		self:Message("eyebeam", "Personal", "Long", CL["you"]:format(eyeBeam), 63976)
		self:Flash("eyebeam", 63976)
		self:Say("eyebeam", eyeBeam)
	end
	self:Sync("EyeBeamWarn")
end

function mod:Deaths(args)
	if args.mobId == 32933 then
		self:Message("arm", "Attention", nil, L["left_dies"], L.arm_icon)
		self:Bar("arm", 50, L["left_wipe_bar"], L.arm_icon)
	elseif args.mobId == 32934 then
		self:Message("arm", "Attention", nil, L["right_dies"], L.arm_icon)
		self:Bar("arm", 50, L["right_wipe_bar"], L.arm_icon)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(event, msg)
	if msg == L["shockwave_trigger"] then
		self:Message("shockwave", "Attention", nil, L["shockwave"], 63982)
		self:Bar("shockwave", 21, L["shockwave"], 63982)
	end
end

function mod:OnSync(sync, rest, nick)
	if sync == "EyeBeamWarn" and nick then
		self:TargetMessage("eyebeam", nick, "Positive", "Info", eyeBeam, 63976)
		self:TargetBar("eyebeam", 11, nick, eyeBeam, 63976)
		self:CDBar("eyebeam", 20, eyeBeam, 63976)
		self:PrimaryIcon("eyebeam", nick)
	end
end

