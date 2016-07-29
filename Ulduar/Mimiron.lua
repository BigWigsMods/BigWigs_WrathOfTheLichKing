--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Mimiron", 529)
if not mod then return end
-- Leviathan Mk II(33432), VX-001(33651), Aerial Command Unit(33670),
mod:RegisterEnableMob(33350, 33432, 33651, 33670)
mod.toggleOptions = {62997, 63631, {63274, "FLASH"}, 64444, 63811, 64623, 64570, "phase", "proximity", "berserk" }
mod.optionHeaders = {
	[62997] = "normal",
	[64623] = "hard",
	phase = "general",
}

--------------------------------------------------------------------------------
-- Locals
--

local ishardmode = nil
local phase = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.phase = "Phases"
	L.phase_desc = "Warn for phase changes."
	L.engage_warning = "Phase 1"
	L.engage_trigger = "^We haven't much time, friends!"
	L.phase2_warning = "Phase 2 incoming"
	L.phase2_trigger = "^WONDERFUL! Positively marvelous results!"
	L.phase3_warning = "Phase 3 incoming"
	L.phase3_trigger = "^Thank you, friends!"
	L.phase4_warning = "Phase 4 incoming"
	L.phase4_trigger = "^Preliminary testing phase complete"
	L.phase_bar = "Phase %d"

	L.hardmode_trigger = "^Now, why would you go and do something like that?"

	L.plasma_warning = "Casting Plasma Blast!"
	L.plasma_soon = "Plasma soon!"
	L.plasma_bar = "Plasma"

	L.shock_next = "Next Shock Blast"

	L.laser_soon = "Spinning up!"
	L.laser_bar = "Barrage"

	L.magnetic_message = "ACU Rooted!"

	L.suppressant_warning = "Suppressant incoming!"

	L.fbomb_soon = "Possible Frost Bomb soon!"
	L.fbomb_bar = "Next Frost Bomb"

	L.bomb_message = "Bomb Bot spawned!"

	L.end_trigger = "^It would appear that I've made a slight miscalculation."
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Plasma", 62997, 64529)
	self:Log("SPELL_CAST_START", "Suppressant", 64570)
	self:Log("SPELL_CAST_START", "FBomb", 64623)
	self:Log("SPELL_CAST_START", "Shock", 63631)
	self:Log("SPELL_CAST_SUCCESS", "Spinning", 63414)
	self:Log("SPELL_SUMMON", "Magnetic", 64444)
	self:Log("SPELL_SUMMON", "Bomb", 63811)
	self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", nil, "target", "focus")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_LOOT")
	self:Yell("Yells", L["engage_trigger"], L["hardmode_trigger"], L["phase2_trigger"], L["phase3_trigger"], L["phase4_trigger"])
	self:Yell("Win", L["end_trigger"])
	self:AddSyncListener("MimiLoot")
	self:AddSyncListener("MimiBarrage")
end

function mod:VerifyEnable(unit)
	return (UnitIsEnemy(unit, "player") and UnitCanAttack(unit, "player")) and true or false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Bomb(args)
	self:Message(args.spellId, "Important", "Alert", L["bomb_message"])
end

function mod:Suppressant(args)
	self:Message(args.spellId, "Important", nil, L["suppressant_warning"])
	self:Bar(args.spellId, 3)
end

function mod:FBomb(args)
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 2)
	self:Bar(args.spellId, 30, L["fbomb_bar"])
end

function mod:Plasma()
	self:Message(62997, "Important", nil, L["plasma_warning"])
	self:Bar(62997, 3, L["plasma_warning"])
	self:Bar(62997, 30, L["plasma_bar"])
end

function mod:Shock(args)
	self:Message(args.spellId, "Important")
	self:Bar(args.spellId, 3.5)
	self:Bar(args.spellId, 34, L["shock_next"])
end

function mod:Spinning(args)
	self:Message(63274, "Personal", "Long", L["laser_soon"], args.spellId)
	self:Flash(63274)
end

do
	local laser = GetSpellInfo(63274)
	function mod:UNIT_SPELLCAST_CHANNEL_START(unit, spell)
		if spell == laser then
			self:Sync("MimiBarrage")
		end
	end
end

function mod:Magnetic(args)
	self:Message(args.spellId, "Important", nil, L["magnetic_message"])
	self:Bar(args.spellId, 15)
end

local function start()
	ishardmode = nil
	phase = 1
	mod:Message("phase", "Attention", nil, L["engage_warning"], false)
	mod:Bar("phase", 7, L["phase_bar"]:format(phase), "INV_Gizmo_01")

	mod:Bar(63631, 30, L["shock_next"])
	mod:Bar(62997, 20, L["plasma_bar"])
	mod:DelayedMessage(62997, 17, "Attention", L["plasma_soon"])
end

function mod:Yells(msg)
	if msg:find(L["hardmode_trigger"]) then
		start()
		ishardmode = true
		self:Berserk(600, true)
		self:OpenProximity("proximity", 5)
		self:Engage()
	elseif msg:find(L["engage_trigger"]) then
		start()
		self:Berserk(900, true)
		self:Engage()
	elseif msg:find(L["phase2_trigger"]) then
		phase = 2
		self:StopBar(L["plasma_bar"])
		self:StopBar(L["shock_next"])
		self:Message("phase", "Attention", nil, L["phase2_warning"], false)
		self:Bar("phase", 40, L["phase_bar"]:format(phase), "INV_Gizmo_01")
		if ishardmode then
			self:Bar(64623, 45, L["fbomb_bar"])
		end
		self:CloseProximity()
	elseif msg:find(L["phase3_trigger"]) then
		phase = 3
		self:Message("phase", "Attention", nil, L["phase3_warning"], false)
		self:Bar("phase", 25, L["phase_bar"]:format(phase), "INV_Gizmo_01")
	elseif msg:find(L["phase4_trigger"]) then
		phase = 4
		self:Message("phase", "Attention", nil, L["phase4_warning"], false)
		self:Bar("phase", 25, L["phase_bar"]:format(phase), "INV_Gizmo_01")
		if ishardmode then
			self:Bar(64623, 30, L["fbomb_bar"])
		end
		self:Bar(63631, 48, L["shock_next"])
	end
end

do
	local lootItem = '^' .. LOOT_ITEM:gsub("%%s", "(.-)") .. '$'
	local lootItemSelf = '^' .. LOOT_ITEM_SELF:gsub("%%s", "(.*)") .. '$'
	function mod:CHAT_MSG_LOOT(event, msg)
		local _, _, player, item = msg:find(lootItem)
		if not player then
			_, _, item = msg:find(lootItemSelf)
			if item then
				player = self:UnitName("player")
			end
		end

		if type(item) == "string" and type(player) == "string" then
			local _, itemLink, itemRarity = GetItemInfo(item)
			if itemRarity and itemRarity == 1 and itemLink then
				local _, _, itemId = itemLink:find("item:(%d+):")
				if not itemId then return end
				itemId = tonumber(itemId:trim())
				if type(itemId) ~= "number" or itemId ~= 46029 then return end
				self:Sync("MimiLoot", player)
			end
		end
	end
end

function mod:OnSync(sync, rest, nick)
	if sync == "MimiLoot" and rest then
		self:TargetMessage(64444, rest, "Positive", "Info")
	elseif sync == "MimiBarrage" then
		self:Message(63274, "Important", nil, L["laser_bar"])
		self:Bar(63274, 60, L["laser_bar"])
	end
end

