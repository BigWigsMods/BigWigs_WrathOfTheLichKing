--------------------------------------------------------------------------------
-- Module declaration
--

local mod = BigWigs:NewBoss("Grobbulus", 533, 1611)
if not mod then return end
mod:RegisterEnableMob(15931)
mod.toggleOptions = {{28169, "ICON", "FLASH"}, 28240, "berserk"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bomb_message = "Injection"
	L.bomb_message_other = "%s is Injected!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Inject", 28169)
	self:Log("SPELL_CAST_SUCCESS", "Cloud", 28240)
	self:Death("Win", 15931)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function mod:OnEngage()
	self:Berserk(540)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Inject(args)
	self:TargetMessageOld(args.spellId, args.destName, "blue", "alert", L["bomb_message"])
	if self:Me(args.destGUID) then
		self:Flash(args.spellId)
	end
	self:Bar(args.spellId, 10, L["bomb_message_other"]:format(args.destName))
	self:PrimaryIcon(args.spellId, args.destName)
end

function mod:Cloud(args)
	self:MessageOld(args.spellId, "yellow")
	self:Bar(args.spellId, 15)
end

