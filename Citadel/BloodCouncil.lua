--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Blood Prince Council", 604, 1632)
if not mod then return end
mod:RegisterEnableMob(37970, 37972, 37973) -- Prince Valanar, Prince Keleseth, Prince Taldaram
mod.toggleOptions = {{72040, "ICON", "FLASH"}, 72039, {72037, "SAY", "FLASH"}, 72999, 70981, 72052, {"iconprince", "ICON"}, "berserk", "proximity"}
mod.optionHeaders = {
	[72040] = "Taldaram",
	[72039] = "Valanar",
	[72999] = "heroic",
	[70981] = "general",
}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.switch_message = "Health swap: %s"
	L.switch_bar = "Next health swap"

	L.empowered_flames = "Empowered Flames"

	L.empowered_shock_message = "Casting Shock!"
	L.regular_shock_message = "Shock zone"
	L.shock_bar = "Next Shock"

	L.iconprince = "Icon on active prince"
	L.iconprince_desc = "Place the primary raid icon on the active prince (requires promoted or leader)."

	L.prison_message = "Shadow Prison x%d!"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED_DOSE", "Prison", 72999)
	self:Log("SPELL_AURA_APPLIED", "Switch", 70981, 70982, 70952, 70983, 70934, 71582, 71596)
	self:Log("SPELL_CAST_START", "EmpoweredShock", 72039)
	self:Log("SPELL_SUMMON", "RegularShock", 72037)
	self:Log("SPELL_CAST_SUCCESS", "Bomb", 72052)

	self:Emote("EmpoweredFlame", L["empowered_flames"])

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Death("Deaths", 37970, 37972, 37973)
end

function mod:OnEngage()
	self:CDBar(70981, 45, L["switch_bar"])
	self:CDBar(72037, 20, L["shock_bar"])
	self:Berserk(600)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Bomb(args)
	self:Message(72052, "Attention", "Alert")
end

function mod:Prison(args)
	if args.amount > 2 and self:Me(args.destGUID) then
		self:Message(72999, "Personal", nil, L["prison_message"]:format(args.amount))
	end
end

function mod:Switch(args)
	self:Message(70981, "Positive", "Info", L["switch_message"]:format(args.destName))
	self:CDBar(70981, 45, L["switch_bar"])
	self:StopBar(L["empowered_flames"])
	for i = 1, 3 do
		local bossId = ("boss%d"):format(i)
		if UnitGUID(bossId) == args.destGUID then
			self:PrimaryIcon("iconprince", bossId)
			break
		end
	end
end

function mod:EmpoweredShock(_, spellId)
	self:Message(72039, "Important", "Long", L["empowered_shock_message"])
	self:OpenProximity("proximity", 15)
	self:ScheduleTimer("CloseProximity", 5)
	self:CDBar(72039, 16, L["shock_bar"])
end

function mod:RegularShock()
	for i = 1, 3 do
		local boss = ("boss%d"):format(i)
		if self:MobId(UnitGUID(boss)) == 37970 then
			local bossTarget = boss.."target"
			if UnitExists(bossTarget) then
				if UnitIsUnit("player", bossTarget) then
					self:Flash(72037)
					self:Say(72037)
				end
				self:TargetMessage(72037, self:UnitName(bossTarget), "Urgent", nil, L["regular_shock_message"])
				self:CDBar(72037, 16, L["shock_bar"])
			end
			break
		end
	end
end

function mod:EmpoweredFlame(msg, _, _, _, player)
	if UnitIsUnit(player, "player") then
		self:Flash(72040)
	end
	self:TargetMessage(72040, player, "Urgent", "Long", L["empowered_flames"])
	self:SecondaryIcon(72040, player)
	self:CDBar(72040, 20, L["empowered_flames"])
end

do
	local deaths = 0
	function mod:Deaths()
		deaths = deaths + 1
		if deaths == 3 then
			self:Win()
		end
	end
end

