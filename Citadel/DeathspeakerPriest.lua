--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Deathspeaker High Priest", 604)
if not mod then return end
mod:RegisterEnableMob(36805, 36807, 36808, 36811, 36829)
mod.toggleOptions = {{69483, "ICON", "FLASH"}, "proximity"}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Reckoning", 69483)

	self:Death("Deaths", 36829)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Reckoning(player, spellId, _, _, spellName)
	self:TargetMessage(69483, spellName, player, "Personal", spellId, "Alert")
	self:Bar(69483, spellName, 8, spellId)
	if UnitIsUnit(player, "player") then
		self:Flash(69483)
		self:OpenProximity("proximity", 15)
		self:ScheduleTimer(self.CloseProximity, 9, self)
	end
	self:PrimaryIcon(69483, player, "icon")
end

do
	local deaths = 0
	function mod:Deaths()
		deaths = deaths + 1
		if deaths == 2 then 
			self:Disable()
		end
	end
end

