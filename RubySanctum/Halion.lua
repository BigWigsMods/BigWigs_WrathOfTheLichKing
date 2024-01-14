--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Halion", 724, 1652)
if not mod then return end
mod:RegisterEnableMob(39863, 40142)
mod:SetEncounterID(mod:Classic() and 887 or 1150)
mod:SetRespawnTime(31)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.twilight_cutter_emote_trigger = "spheres" -- The orbiting spheres pulse with dark energy!
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{74562, "SAY", "ICON", "ME_ONLY_EMPHASIZE"}, -- Fiery Combustion
		74648, -- Meteor Strike
		74525, -- Flame Breath
		{74792, "SAY", "ICON", "ME_ONLY_EMPHASIZE"}, -- Soul Consumption
		74769, -- Twilight Cutter
		74806, -- Dark Breath
		74826, -- Corporeality
		"stages",
		"berserk",
	},{
		[74792] = self:SpellName(74807), -- Twilight Realm
		[74826] = CL.stage:format(3),
		["stages"] = "general",
	},{
		[74562] = CL.bomb, -- Fiery Combustion (Bomb)
		[74648] = CL.meteor, -- Meteor Strike (Meteor)
		[74525] = CL.breath, -- Flame Breath (Breath)
		[74792] = CL.bomb, -- Soul Consumption (Bomb)
		[74769] = CL.beams, -- Twilight Cutter (Beams)
		[74806] = CL.breath, -- Dark Breath (Breath)
	}
end

function mod:OnBossEnable()
	-- Normal Realm
	self:Log("SPELL_CAST_SUCCESS", "FieryCombustion", 74562)
	self:Log("SPELL_AURA_APPLIED", "FieryCombustionApplied", 74562)
	self:Log("SPELL_AURA_REMOVED", "FieryCombustionRemoved", 74562)
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1", "boss2") -- Pre-Meteor
	self:Log("SPELL_CAST_SUCCESS", "MeteorStrike", 74648)
	self:Log("SPELL_DAMAGE", "MeteorStrikeDamage", 74712, 74717) -- Center pool of fire, lines of fire stretching out
	self:Log("SPELL_MISSED", "MeteorStrikeDamage", 74712, 74717)
	self:Log("SPELL_CAST_START", "FlameBreath", 74525)

	-- Twilight Realm
	self:Log("SPELL_CAST_SUCCESS", "SoulConsumption", 74792)
	self:Log("SPELL_AURA_APPLIED", "SoulConsumptionApplied", 74792)
	self:Log("SPELL_AURA_REMOVED", "SoulConsumptionRemoved", 74792)
	self:Log("SPELL_CAST_START", "DarkBreath", 74806)
	self:RegisterMessage("BigWigs_BossComm")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE") -- Twilight Cutter

	-- Stages
	self:Log("SPELL_CAST_SUCCESS", "DuskShroud", 75476)
	self:Log("SPELL_CAST_START", "TwilightDivision", 75063)
	self:Log("SPELL_AURA_APPLIED", "Corporeality50", 74826)
	self:Log("SPELL_AURA_APPLIED", "Corporeality60", 74827)
	self:Log("SPELL_AURA_APPLIED", "Corporeality70", 74828)
	self:Log("SPELL_AURA_APPLIED", "Corporeality80", 74829)
	self:Log("SPELL_AURA_APPLIED", "Corporeality90", 74830)
	self:Log("SPELL_AURA_APPLIED", "Corporeality100", 74831)

	self:Death("Win", 39863, 40142)
end

function mod:OnEngage()
	self:SetStage(1)
	self:Berserk(480)
	self:CDBar(74525, 8, CL.breath) -- Flame Breath
	self:CDBar(74562, 16, CL.bomb) -- Fiery Combustion
	self:CDBar(74648, 21, CL.meteor) -- Meteor Strike
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Normal Realm
function mod:FieryCombustion(args)
	self:StopBar(CL.bomb)
	if not self:UnitBuff("player", 74807) then
		self:CDBar(args.spellId, self:Heroic() and 21 or 25.5, CL.bomb)
	end
end

do
	local bombTarget = nil
	function mod:FieryCombustionApplied(args)
		bombTarget = args.destGUID
		self:PrimaryIcon(args.spellId, args.destName)
		if not self:UnitBuff("player", 74807) then
			self:TargetMessage(args.spellId, "yellow", args.destName, CL.bomb)
		end
		if self:Me(args.destGUID) then
			self:Say(args.spellId, CL.bomb, nil, "Bomb")
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		end
	end
	function mod:FieryCombustionRemoved(args)
		if bombTarget == args.destGUID then
			self:PrimaryIcon(args.spellId)
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, _, spellId) -- Pre-Meteor
	if spellId == 74637 then -- Meteor Strike (before it lands)
		self:StopBar(CL.meteor)
		if not self:UnitBuff("player", 74807) then
			self:CDBar(74648, 40, CL.meteor)
			self:Message(74648, "red", CL.incoming:format(CL.meteor))
			self:PlaySound(74648, "long")
		end
	end
end

function mod:MeteorStrike(args) -- When it lands
	if not self:UnitBuff("player", 74807) then
		self:Message(args.spellId, "red")
	end
end

do
	local prev = 0
	function mod:MeteorStrikeDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(74648, "underyou")
			self:PlaySound(74648, "underyou")
		end
	end
end

function mod:FlameBreath(args)
	self:StopBar(CL.breath)
	if not self:UnitBuff("player", 74807) then
		self:Message(args.spellId, "orange", CL.breath)
		self:CDBar(args.spellId, 14.5, CL.breath)
	end
end

-- Twilight Realm
function mod:SoulConsumption(args)
	self:StopBar(CL.bomb)
	if self:UnitBuff("player", 74807) then
		self:CDBar(args.spellId, self:Heroic() and 21 or 25.5, CL.bomb)
	end
end

do
	local bombTarget = nil
	function mod:SoulConsumptionApplied(args)
		bombTarget = args.destGUID
		self:SecondaryIcon(args.spellId, args.destName)
		if self:UnitBuff("player", 74807) then
			self:TargetMessage(args.spellId, "yellow", args.destName, CL.bomb)
		end
		if self:Me(args.destGUID) then
			self:Say(args.spellId, CL.bomb, nil, "Bomb")
			self:PlaySound(args.spellId, "warning", nil, args.destName)
		end
	end
	function mod:SoulConsumptionRemoved(args)
		if bombTarget == args.destGUID then
			self:SecondaryIcon(args.spellId)
		end
	end
end

function mod:DarkBreath(args)
	self:StopBar(CL.breath)
	if self:UnitBuff("player", 74807) then
		self:Message(args.spellId, "orange", CL.breath)
		self:CDBar(args.spellId, 14, CL.breath)
	end
end

do
	local prev = 0
	function mod:BigWigs_BossComm(_, msg)
		local t = GetTime()
		if msg == "Beams" and t - prev > 12 then
			prev = t
			self:StopBar(CL.beams)
			if self:UnitBuff("player", 74807) then
				self:CDBar(74769, 30, CL.beams)
				self:Message(74769, "red", CL.incoming:format(CL.beams))
				self:PlaySound(74769, "alert")
			end
		end
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, msg) -- Twilight Cutter
	if msg:find(L.twilight_cutter_emote_trigger, nil, true) then
		self:Sync("Beams") -- You can't see this in both realms, so sync
	end
end

-- Stages
function mod:DuskShroud() -- Stage 2
	self:SetStage(2)
	self:StopBar(CL.bomb) -- Fiery Combustion
	self:StopBar(CL.breath) -- Flame Breath
	self:StopBar(CL.meteor) -- Meteor Strike
	self:Message("stages", "cyan", CL.percent:format(75, CL.stage:format(2)), false)
	self:CDBar(74792, 16, CL.bomb) -- Soul Consumption
	self:CDBar(74806, 18, CL.breath) -- Dark Breath
	self:CDBar(74769, 30, CL.beams) -- Twilight Cutter
	self:PlaySound("stages", "info")
end

function mod:TwilightDivision() -- Stage 3
	self:SetStage(3)
	self:Message("stages", "cyan", CL.percent:format(50, CL.stage:format(3)), false)
	self:PlaySound("stages", "info")
end

function mod:Corporeality50(args)
	if self:MobId(args.destGUID) == 40142 then -- Shadow
		self:Message(args.spellId, "cyan", CL.percent:format(50, args.spellName))
	end
end

function mod:Corporeality60(args)
	if self:MobId(args.destGUID) == 40142  then
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(60, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(40, args.spellName))
		end
	else
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(40, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(60, args.spellName))
		end
	end
end

function mod:Corporeality70(args)
	if self:MobId(args.destGUID) == 40142  then
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(70, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(30, args.spellName))
		end
	else
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(30, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(70, args.spellName))
		end
	end
	self:PlaySound("stages", "info")
end

function mod:Corporeality80(args)
	if self:MobId(args.destGUID) == 40142  then
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(80, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(20, args.spellName))
		end
	else
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(20, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(80, args.spellName))
		end
	end
	self:PlaySound("stages", "warning")
end

function mod:Corporeality90(args)
	if self:MobId(args.destGUID) == 40142  then
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(90, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(10, args.spellName))
		end
	else
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(10, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(90, args.spellName))
		end
	end
	self:PlaySound("stages", "warning")
end

function mod:Corporeality100(args)
	if self:MobId(args.destGUID) == 40142  then
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(100, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(0, args.spellName))
		end
	else
		if self:UnitBuff("player", 74807) then
			self:Message(74826, "cyan", CL.percent:format(100, args.spellName))
		else
			self:Message(74826, "cyan", CL.percent:format(0, args.spellName))
		end
	end
	self:PlaySound("stages", "warning")
end
