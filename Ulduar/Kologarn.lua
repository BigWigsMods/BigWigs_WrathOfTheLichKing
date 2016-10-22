--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Kologarn", 529, 1642)
if not mod then return end
mod:RegisterEnableMob(32930)
--mod.engageId = 1137
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

	self:Death("ArmsDie", 32933, 32934)
	self:Death("Win", 32930)

	self:RegisterEvent("CHAT_MSG_RAID_BOSS_WHISPER")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterMessage("BigWigs_BossComm")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Armor(args)
	self:StackMessage(63355, args.destName, args.amount, "Urgent", "Info")
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

function mod:CHAT_MSG_RAID_BOSS_WHISPER(event, msg, unitName)
	-- Kologarn focuses his eyes on you!#Kologarn
	if unitName == self.displayName then
		self:Flash("eyebeam", 63976)
		self:Say("eyebeam", eyeBeam)
		self:Sync("EyeBeamWarn")
	end
end

function mod:ArmsDie(args)
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

function mod:BigWigs_BossComm(_, msg, _, sender)
	if sync == "EyeBeamWarn" then
		self:TargetMessage("eyebeam", sender, "Positive", "Info", eyeBeam, 63976)
		self:TargetBar("eyebeam", 11, sender, eyeBeam, 63976)
		self:CDBar("eyebeam", 20, eyeBeam, 63976)
		self:PrimaryIcon("eyebeam", sender)
		self:ScheduleTimer("PrimaryIcon", 12, "eyebeam")
	end
end

