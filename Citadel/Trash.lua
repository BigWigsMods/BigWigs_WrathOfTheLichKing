
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Icecrown Citadel Trash", 631)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	37007, -- Deathbound Ward
	36805, 36807, 36808, 36811, 36829, -- Deathspeaker Servant, Disciple, Zealot, Attendant, High Priest
	37217, 37025 -- Precious, Stinky
)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.deathbound_ward = "Deathbound Ward"
	L.deathspeaker_adds = "Lady Deathwhisper Trash"
	L.putricide_dogs = "Precious & Stinky"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		--[[ Deathbound Ward ]]--
		71022, -- Disrupting Shout
		--[[ Deathspeaker High Priest ]]--
		{69483, "ICON", "PROXIMITY"}, -- Dark Reckoning
		--[[ Putricide Dogs ]]--
		{71127, "TANK"}, -- Mortal Wound
	}, {
		[71022] = L.deathbound_ward,
		[69483] = L.deathspeaker_adds,
		[71127] = L.putricide_dogs,
	}
end

function mod:OnBossEnable()
	--[[ General ]]--
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")

	--[[ Deathbound Ward ]]--
	self:Log("SPELL_CAST_START", "DisruptingShout", 71022)

	--[[ Deathspeaker High Priest ]]--
	self:Log("SPELL_AURA_APPLIED", "DarkReckoningApplied", 69483)
	self:Log("SPELL_AURA_REMOVED", "DarkReckoningRemoved", 69483)

	--[[ Putricide Dogs ]]--
	self:Log("SPELL_AURA_APPLIED_DOSE", "MortalWound", 71127)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DisruptingShout(args)
	self:Message(71022, "red")
	self:PlaySound(71022, "alarm")
	self:Bar(71022, 3)
end

function mod:DarkReckoningApplied(args)
	self:TargetMessage(69483, "cyan", args.destName)
	self:TargetBar(69483, 8, args.destName)
	if self:Me(args.destGUID) then
		self:PlaySound(69483, "warning")
		self:OpenProximity(69483, 15)
	else
		self:PlaySound(69483, "alert")
	end
	self:PrimaryIcon(69483, args.destName)
end

function mod:DarkReckoningRemoved(args)
	self:StopBar(args.spellName, args.destName)
	self:PrimaryIcon(69483, nil)
	if self:Me(args.destGUID) then
		self:CloseProximity(69483)
	end
end

function mod:MortalWound(args)
	if args.amount % 2 == 0 or args.amount > 5 then
		self:StackMessage(71127, "purple", args.destName, args.amount, 6)
		if self:Tank() and args.amount > 5 then
			self:PlaySound(71127, "warning")
		end
	end
end
