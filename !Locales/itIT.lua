-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "itIT")
if L then
	L.bone_spike = "Aculeo Osseo" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "itIT")
if L then
	L.touch = "Tocco"
	L.deformed_fanatic = "Fanatico Deformato" -- NPC ID 38135
	L.empowered_adherent = "Proselito Potenziato" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "itIT")
if L then
	--L.adds_trigger_alliance = "Reavers, Sergeants, attack!"
	--L.adds_trigger_horde = "Marines, Sergeants, attack!"

	--L.mage = "Mage"
	--L.mage_desc = "Warn when a mage spawns to freeze the gunship cannons."
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	--L.warmup_trigger_alliance = "Fire up the engines"
	--L.warmup_trigger_horde = "Rise up, sons and daughters"

	--L.disable_trigger_alliance = "Onward, brothers and sisters"
	--L.disable_trigger_horde = "Onward to the Lich King"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "itIT")
if L then
	L.blood_beast = "Bestia di Sangue" -- NPC ID 38508

	--L.warmup_alliance = "Let's get a move on then! Move ou..."
	--L.warmup_horde = "Kor'kron, move out! Champions, watch your backs. The Scourge have been..."
end

L = BigWigs:NewBossLocale("Blood Prince Council", "itIT")
if L then
	--L.switch_message = "Health swap: %s"
	--L.switch_bar = "Next health swap"

	--L.empowered_flames = "Empowered Flames"

	--L.empowered_shock_message = "Casting Shock!"
	--L.regular_shock_message = "Shock zone"
	--L.shock_bar = "Next Shock"

	--L.iconprince = "Icon on active prince"
	--L.iconprince_desc = "Place the primary raid icon on the active prince (requires promoted or leader)."

	--L.prison_message = "Shadow Prison x%d!"
end

L = BigWigs:NewBossLocale("Festergut", "itIT")
if L then
	--L.engage_trigger = "Fun time?"

	--L.inhale_bar = "Inhale (%d)"
	--L.blight_warning = "Pungent Blight in ~5sec!"
	--L.ball_message = "Goo ball incoming!"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "itIT")
if L then
	--L.engage_trigger = "You have made an... unwise... decision."

	--L.shadow = "Shadows"
	--L.shadow_message = "Shadows"
	--L.shadow_bar = "Next Shadows"

	--L.feed_message = "Time to feed soon!"

	--L.pact_message = "Pact"
	--L.pact_bar = "Next Pact"

	--L.phase_message = "Air phase incoming!"
	--L.phase1_bar = "Back on floor"
	--L.phase2_bar = "Air phase"
end

L = BigWigs:NewBossLocale("The Lich King", "itIT")
if L then
	--L.warmup_trigger = "So the Light's vaunted justice has finally arrived"
	--L.engage_trigger = "I'll keep you alive to witness the end, Fordring."

	--L.horror_message = "Shambling Horror"
	--L.horror_bar = "Next Horror"

	--L.valkyr_message = "Val'kyr"
	--L.valkyr_bar = "Next Val'kyr"
	--L.valkyrhug_message = "Val'kyrs Hugged"

	--L.cave_phase = "Cave Phase"
	--L.last_phase_bar = "Last Phase"

	--L.frenzy_bar = "%s frenzies!"
	--L.frenzy_survive_message = "%s will survive after plague"
	--L.frenzy_message = "Add frenzied!"
	--L.frenzy_soon_message = "5sec to frenzy!"

	--L.custom_on_valkyr_marker = "Val'kyr marker"
	--L.custom_on_valkyr_marker_desc = "Mark the Val'kyr with {rt8}{rt7}{rt6}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over the Val'kyr is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Professor Putricide", "itIT")
if L then
	--L.engage_trigger = "I think I've perfected a plague"

	--L.phase = "Phases"
	--L.phase_desc = "Warn for phase changes."
	--L.phase_warning = "Phase %d soon!"
	--L.phase_bar = "Next Phase"

	--L.ball_bar = "Next bouncing goo ball"
	--L.ball_say = "Goo ball incoming!"

	--L.experiment_message = "Ooze incoming!"
	--L.experiment_heroic_message = "Oozes incoming!"
	--L.experiment_bar = "Next ooze"
	--L.blight_message = "Red ooze"
	--L.violation_message = "Green ooze"

	--L.gasbomb_bar = "More yellow gas bombs"
	--L.gasbomb_message = "Yellow bombs!"
end

L = BigWigs:NewBossLocale("Rotface", "itIT")
if L then
	--L.engage_trigger = "WEEEEEE!"

	--L.infection_message = "Infection"

	--L.ooze = "Ooze Merge"
	--L.ooze_desc = "Warn when an ooze merges."
	--L.ooze_message = "Ooze %dx"

	--L.spray_bar = "Next Spray"
end

L = BigWigs:NewBossLocale("Sindragosa", "itIT")
if L then
	--L.engage_trigger = "You are fools to have come to this place."

	--L.phase2 = "Phase 2"
	--L.phase2_desc = "Warn when Sindragosa goes into phase 2, at 35%."
	--L.phase2_trigger = "Now, feel my master's limitless power and despair!"
	--L.phase2_message = "Phase 2!"

	--L.airphase = "Air phase"
	--L.airphase_desc = "Warn when Sindragosa will lift off."
	--L.airphase_trigger = "Your incursion ends here! None shall survive!"
	--L.airphase_message = "Air phase!"
	--L.airphase_bar = "Next air phase"

	--L.boom_message = "Explosion!"
	--L.boom_bar = "Explosion"

	--L.instability_message = "Unstable x%d!"
	--L.chilled_message = "Chilled x%d!"
	--L.buffet_message = "Magic x%d!"
	--L.buffet_cd = "Next Magic"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "itIT")
if L then
	--L.engage_trigger = "Intruders have breached the inner sanctum. Hasten the destruction of the green dragon!"

	--L.portal = "Nightmare Portals"
	--L.portal_desc = "Warns when Valithria opens portals."
	--L.portal_message = "Portals up!"
	--L.portal_bar = "Portals inc"
	--L.portalcd_message = "Portals %d up in 14 sec!"
	--L.portalcd_bar = "Next Portals %d"
	--L.portal_trigger = "I have opened a portal into the Dream. Your salvation lies within, heroes..."

	--L.suppresser = "Suppressers spawn"
	--L.suppresser_desc = "Warns when a pack of Suppressers spawn."
	--L.suppresser_message = "Suppressers"

	--L.blazing = "Blazing Skeleton"
	--L.blazing_desc = "Blazing Skeleton |cffff0000estimated|r respawn timer. This timer may be inaccurate, use only as a rough guide."
	--L.blazing_warning = "Blazing Skeleton soon!"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "itIT")
if L then
	L.deathbound_ward = "Guardia Predestinata"
	L.deathspeaker_high_priest = "Gran Sacerdote Necroratore" -- NPC ID 36829
	L.putricide_dogs = "Tesoruccio & Puzzone"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("The Beasts of Northrend", "itIT")
if L then
	--L.wipe_trigger = "Tragic..."

	--L.engage_trigger = "Hailing from the deepest, darkest caverns of the Storm Peaks, Gormok the Impaler! Battle on, heroes!"
	--L.jormungars_trigger = "Steel yourselves, heroes, for the twin terrors, Acidmaw and Dreadscale, enter the arena!"
	--L.icehowl_trigger = "The air itself freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!"
	--L.boss_incoming = "%s incoming"

	L.gormok = "Gormok l'Impalatore"
	L.jormungars = "Acidalingua e Magmascaglia"
	L.icehowl = "Urlogelido"

	--L.snobold = "Snobold"
	--L.snobold_desc = "Warn who gets a Snobold on their heads."

	--L.submerge = "Submerge"
	--L.submerge_desc = "Show a timer bar for the next time the worms will submerge."
	--L.spew = "Acidic/Molten Spew"
	--L.spew_desc = "Warn for Acidic/Molten Spew."
	--L.sprays = "Sprays"
	--L.sprays_desc = "Show timers for the next Paralytic and Burning Sprays."
	--L.slime_message = "Slime on YOU!"
	--L.burn_spell = "Burn"
	--L.toxin_spell = "Toxin"
	--L.spray = "Next Spray"

	--L.charge = "Furious Charge"
	--L.charge_desc = "Warn about Furious Charge on players."
	--L.charge_trigger = "glares at"

	--L.bosses = "Bosses"
	--L.bosses_desc = "Warn about bosses incoming"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "itIT")
if L then
	--L.enable_trigger = "Trifling gnome! Your arrogance will be your undoing!"

	--L.engage = "Engage"
	--L.engage_trigger = "You face Jaraxxus, Eredar Lord of the Burning Legion!"
	--L.engage_trigger1 = "But I'm in charge here"

	--L.adds = "Portals and volcanos"
	--L.adds_desc = "Show a timer and warn for when Jaraxxus summons portals and volcanos."

	--L.incinerate_message = "Incinerate"
	--L.incinerate_other = "%s goes boom!"
	--L.incinerate_bar = "Next Incinerate"
	--L.incinerate_safe = "%s is safe, yay :)"

	--L.legionflame_message = "Flame"
	--L.legionflame_other = "Flame on %s!"
	--L.legionflame_bar = "Next Flame"

	--L.infernal_bar = "Volcano spawns"
	--L.netherportal_bar = "Portal spawns"

	--L.kiss_message = "Kiss on YOU!"
	--L.kiss_interrupted = "Interrupted!"
end

L = BigWigs:NewBossLocale("Faction Champions", "itIT")
if L then
	--L.defeat_trigger = "A shallow and tragic victory."

	--L["Shield on %s!"] = "Shield on %s!"
	--L["Bladestorming!"] = "Bladestorming!"
	--L["Hunter pet up!"] = "Hunter pet up!"
	--L["Felhunter up!"] = "Felhunter up!"
	--L["Heroism on champions!"] = "Heroism on champions!"
	--L["Bloodlust on champions!"] = "Bloodlust on champions!"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "itIT")
if L then
	--L.engage_trigger1 = "In the name of our dark master. For the Lich King. You. Will. Die."

	--L.vortex_or_shield_cd = "Next Vortex or Shield"
	--L.next = "Next Vortex or Shield"
	--L.next_desc = "Warn for next Vortex or Shield"

	--L.vortex = "Vortex"
	--L.vortex_desc = "Warn when the twins start casting vortexes."

	--L.shield = "Shield of Darkness/Light"
	--L.shield_desc = "Warn for Shield of Darkness/Light."

	--L.touch = "Touch of Darkness/Light"
	--L.touch_desc = "Warn for Touch of Darkness/Light"
end

L = BigWigs:NewBossLocale("Anub'arak", "itIT")
if L then
	--L.engage_message = "Anub'arak engaged, burrow in 80sec!"
	--L.engage_trigger = "This place will serve as your tomb!"

	--L.unburrow_trigger = "emerges from the ground"
	--L.burrow_trigger = "burrows into the ground"
	--L.burrow = "Burrow"
	--L.burrow_desc = "Shows timers for emerges and submerges, and also add spawn timers."
	--L.burrow_soon = "Burrow soon"

	--L.nerubian_message = "Adds incoming!"
	--L.nerubian_burrower = "More adds"

	--L.shadow_soon = "Shadow Strike in ~5sec!"
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "itIT")
if L then
	--L.add = "Crypt Guard"
	L.locust = "Locusta"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "itIT")
if L then
	--L.silencewarn = "Silenced!"
	--L.silencewarn5sec = "Silence ends in 5 sec"
	L.silence = "Silenzio"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "itIT")
if L then
	--L.phase1_trigger1 = "Foolishly you have sought your own demise."
	--L.phase1_trigger2 = "Teamanare shi rikk mannor rikk lok karkun" -- Curse of Tongues
	--L.phase2_trigger = "I have waited long enough. Now you face the harvester of souls."

	--L.add = "Add Warnings"
	--L.add_desc = "Warnings for add waves."

	--L.add_death = "Add Death Alert"
	--L.add_death_desc = "Alerts when an add dies."

	--L.riderdiewarn = "Rider dead!"
	--L.dkdiewarn = "Death Knight dead!"

	--L.wave = "%d/23: %s"

	--L.trawarn = "Trainees in 3 sec"
	--L.dkwarn = "Death Knights in 3 sec"
	--L.riderwarn = "Rider in 3 sec"

	--L.trabar = "Trainee (%d)"
	--L.dkbar = "Death Knight (%d)"
	--L.riderbar = "Rider (%d)"

	--L.gate = "Gate Open!"
	--L.gatebar = "Gate opens"

	--L.phase_soon = "Gothik Incoming in 10 sec"

	--L.engage_message = "Gothik the Harvester engaged!"
end

L = BigWigs:NewBossLocale("Grobbulus", "itIT")
if L then
	--L.injection = "Injection"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "itIT")
if L then
	--L.teleport_yell_trigger = "The end is upon you."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "itIT")
if L then
	--L.mark = "Mark"
	--L.mark_desc = "Warn for marks."

	--L.engage_message = "The Four Horsemen engaged!"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "itIT")
if L then
	--L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Kel'Thuzad's Chamber"

	--L.phase1_trigger = "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!"
	--L.phase2_trigger1 = "Pray for mercy!"
	--L.phase2_trigger2 = "Scream your dying breath!"
	--L.phase2_trigger3 = "The end is upon you!"
	--L.phase3_trigger = "Master, I require aid!"
	--L.guardians_trigger = "Very well. Warriors of the frozen wastes, rise up! I command you to fight, kill and die for your master! Let none survive!"

	--L.phase2_warning = "Phase 2 - Kel'Thuzad Incoming!"
	--L.phase2_bar = "Kel'Thuzad active"

	--L.phase3_warning = "Stage 3 - Guardians in ~15 sec!"

	--L.guardians = "Guardian Spawns"
	--L.guardians_desc = "Warn for incoming Icecrown Guardians in phase 3."
	--L.guardians_icon = "inv_trinket_naxxramas04"
	--L.guardians_warning = "Guardians incoming in ~10sec!"
	--L.guardians_bar = "Guardians incoming!"

	--L.engage_message = "Kel'Thuzad encounter started!"
end

L = BigWigs:NewBossLocale("Loatheb", "itIT")
if L then
	--L.doomtime_bar = "Doom every 15sec"
	--L.doomtime_now = "Doom now happens every 15 sec!"

	--L.spore_warn = "Spore (%d)"
end

L = BigWigs:NewBossLocale("Maexxna", "itIT")
if L then
	--L.webspraywarn30sec = "Cocoons in 10 sec"
	--L.webspraywarn20sec = "Cocoons! Spiders in 10 sec!"
	--L.webspraywarn10sec = "Spiders! Spray in 10 sec!"
	--L.webspraywarn5sec = "WEB SPRAY in 5 seconds!"

	--L.enragewarn = "Frenzy - SQUISH SQUISH SQUISH!"
	--L.enragesoonwarn = "Frenzy Soon - Bugsquatters out!"

	--L.cocoons = "Cocoons"
	--L.spiders = "Spiders"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "itIT")
if L then
	--L.adds_yell_trigger = "Rise, my soldiers" -- Rise, my soldiers! Rise and fight once more!
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "itIT")
if L then
	--L.understudy = "Death Knight Understudy"

	--L.shout_warning = "Disrupting Shout in 5 sec!"
	--L.taunt_warning = "Taunt ready in 5 sec!"
	--L.shieldwall_warning = "Barrier gone in 5 sec!"
end

L = BigWigs:NewBossLocale("Sapphiron", "itIT")
if L then
	--L.airphase_trigger = "Sapphiron lifts off into the air!"
	--L.deepbreath_trigger = "%s takes a deep breath."

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	--L.ice_bomb = "Ice Bomb"
	--L.ice_bomb_warning = "Ice Bomb Incoming!"
	--L.ice_bomb_bar = "Ice Bomb Lands!"

	--L.icebolt_say = "I'm a Block!"
end

L = BigWigs:NewBossLocale("Thaddius", "itIT")
if L then
	L[15929] = "Stalagg"
	L[15930] = "Feugen"

	--L.stage2_yell_trigger1 = "Eat... your... bones..."
	--L.stage2_yell_trigger2 = "Break... you!!"
	--L.stage2_yell_trigger3 = "Kill..."

	--L.add_death_emote_trigger = "%s dies."
	--L.overload_emote_trigger = "%s overloads!"
	--L.add_revive_emote_trigger = "%s is jolted back to life!"

	--L.polarity_extras = "Additional alerts for Polarity Shift positioning"

	--L.custom_select_charge_position = "First position"
	--L.custom_select_charge_position_desc = "Where to move to after the first Polarity Shift."
	--L.custom_select_charge_position_value1 = "|cffff2020Negative (-)|r are LEFT, |cff2020ffPositive (+)|r are RIGHT"
	--L.custom_select_charge_position_value2 = "|cff2020ffPositive (+)|r are LEFT, |cffff2020Negative (-)|r are RIGHT"

	--L.custom_select_charge_movement = "Movement"
	--L.custom_select_charge_movement_desc = "The movement strategy your group uses."
	--L.custom_select_charge_movement_value1 = "Run |cff20ff20THROUGH|r the boss"
	--L.custom_select_charge_movement_value2 = "Run |cff20ff20CLOCKWISE|r around the boss"
	--L.custom_select_charge_movement_value3 = "Run |cff20ff20COUNTER-CLOCKWISE|r around the boss"
	--L.custom_select_charge_movement_value4 = "Four camps 1: Polarity changed moves |cff20ff20RIGHT|r, same polarity moves |cff20ff20LEFT|r"
	--L.custom_select_charge_movement_value5 = "Four camps 2: Polarity changed moves |cff20ff20LEFT|r, same polarity moves |cff20ff20RIGHT|r"

	--L.custom_off_charge_graphic = "Graphical arrow"
	--L.custom_off_charge_graphic_desc = "Show an arrow graphic."
	--L.custom_off_charge_text = "Text arrows"
	--L.custom_off_charge_text_desc = "Show an additional message."
	--L.custom_off_charge_voice = "Voice alert"
	--L.custom_off_charge_voice_desc = "Play a voice alert."

	--Translate these to get locale sound files!
	--L.left = "<--- GO LEFT <--- GO LEFT <---"
	--L.right = "---> GO RIGHT ---> GO RIGHT --->"
	--L.swap = "^^^^ SWITCH SIDES ^^^^ SWITCH SIDES ^^^^"
	--L.stay = "==== DON'T MOVE ==== DON'T MOVE ===="

	--L.chat_message = "The Thaddius mod supports showing you directional arrows and playing voices. Open the options to configure them."
end

-- Northrend

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "itIT")
if L then
	--L.stomp_message = "Stomp - Charge Inc!"
	--L.stomp_warning = "Possible Stomp in ~5sec!"

	--L.charge = "Charge"
	--L.charge_desc = "Warn about Charge on players."
end

L = BigWigs:NewBossLocale("Malygos", "itIT")
if L then
	--L.sparks = "Spark Spawns"
	--L.sparks_desc = "Warns on Power Spark spawns."
	--L.sparks_message = "Power Spark spawns!"
	--L.sparks_warning = "Power Spark in ~5sec!"

	--L.sparkbuff = "Power Spark on Malygos"
	--L.sparkbuff_desc = "Warns when Malygos gets a Power Spark."
	--L.sparkbuff_message = "Malygos gains Power Spark!"

	--L.vortex = "Vortex"
	--L.vortex_desc = "Warn for Vortex in phase 1."
	--L.vortex_message = "Vortex!"
	--L.vortex_warning = "Possible Vortex in ~5sec!"
	--L.vortex_next = "Vortex Cooldown"

	--L.breath = "Deep Breath"
	--L.breath_desc = "Warn when Malygos is using Deep Breath in phase 2."
	--L.breath_message = "Deep Breath!"
	--L.breath_warning = "Deep Breath in ~5sec!"

	--L.surge = "Surge of Power"
	--L.surge_desc = "Warn when Malygos uses Surge of Power on you in phase 3."
	--L.surge_you = "Surge of Power on YOU!"
	--L.surge_trigger = "%s fixes his eyes on you!"

	--L.phase = "Phases"
	--L.phase_desc = "Warn for phase changes."
	--L.phase2_warning = "Phase 2 soon!"
	--L.phase2_trigger = "I had hoped to end your lives quickly"
	--L.phase2_message = "Phase 2 - Nexus Lord & Scion of Eternity!"
	--L.phase2_end_trigger = "ENOUGH! If you intend to reclaim Azeroth's magic"
	--L.phase3_warning = "Phase 3 soon!"
	--L.phase3_trigger = "Now your benefactors make their"
	--L.phase3_message = "Phase 3!"
end

L = BigWigs:NewBossLocale("Sartharion", "itIT")
if L then
	L.engage_trigger = "Il mio compito è badare a queste uova. Preferisco vedervi bruciare piuttosto che metterle in pericolo!"
	L.tsunami_trigger = "La lava che circonda %s inizia ad agitarsi!"
	L.twilight_trigger_vesperon = "Un Discepolo di Vespron appare nel Crepuscolo!"
	L.twilight_trigger_shadron = "Un Discepolo di Shadron appare nel Crepuscolo!"

	--L.drakes = "Drake Adds"
	--L.drakes_desc = "Warn when each drake add will join the fight."

	-- Adds
	L.shadron = "Shadron"
	L.tenebron = "Tenebron"
	L.vesperon = "Vesperon"
	L.lava_blaze = "Fiammata di Lava" -- NPC 30643
	L.acolyte_shadron = "Accolito di Shadron" -- NPC 31218
	L.acolyte_vesperon = "Accolita di Vespron" -- NPC 31219
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "itIT")
if L then
	--L.overcharge_message = "A minion is overcharged!"
	--L.overcharge_bar = "Explosion"

	--L.custom_on_overcharge_mark = "Overcharge marker"
	--L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "itIT")
if L then
	--L.breath_bar = "Breath %d"
	--L.breath_message = "Breath %d soon!"
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "itIT")
if L then
	--L.whiteout_bar = "Whiteout %d"
	--L.whiteout_message = "Whiteout %d soon!"

	--L.freeze_message = "Freeze"
end

L = BigWigs:NewBossLocale("Onyxia", "itIT")
if L then
	--L.phase1_trigger = "How fortuitous"
	--L.phase2_trigger = "from above"
	--L.phase3_trigger = "It seems you'll need another lesson"

	L.deep_breath = "Alito del Drago"
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "itIT")
if L then
	L.twilight_cutter_emote_trigger = "sfere" -- Le sfere orbitanti pulsano di Energia Oscura!
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "itIT")
if L then
	L.baltharus = "Baltharus il Figlio della Guerra" -- NPC 39751
	L.saviana = "Saviana Fiammafurente" -- NPC 39747
	L.zarithrian = "Generale Zarithrian" -- NPC 39746

	L.adds_yell_trigger = "Riduceteli in cenere, servi!"
end

-- Ulduar

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "itIT")
if L then
	--L.brittle_message = "Construct is Brittle!"
end

L = BigWigs:NewBossLocale("Razorscale", "itIT")
if L then
	--L.ground_trigger = "Move quickly! She won't remain grounded for long!"
	--L.ground_message = "Razorscale Chained up!"
	--L.air_message = "Takeoff!"

	--L.harpoon = "Harpoons"
	--L.harpoon_desc = "Announce when the harpoons are ready for use."
	--L.harpoon_message = "Harpoon %d ready!"
	--L.harpoon_trigger = "Harpoon Turret is ready for use!"
	--L.harpoon_nextbar = "Harpoon %d"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "itIT")
if L then
	--L.lightbomb_other = "Light"
end

L = BigWigs:NewBossLocale("The Iron Council", "itIT")
if L then
	L.stormcaller_brundir = "Invocatore delle Tempeste Brundir"
	L.steelbreaker = "Spaccacciaio"
	L.runemaster_molgeim = "Maestro Runico Molgeim"

	--L.summoning_message = "Elementals Incoming!"

	--L.chased_other = "%s is being chased!"
	--L.chased_you = "YOU are being chased!"
end

L = BigWigs:NewBossLocale("Kologarn", "itIT")
if L then
	--L.arm = "Arm dies"
	--L.arm_desc = "Warn for Left & Right Arm dies."
	--L.left_dies = "Left Arm dies"
	--L.right_dies = "Right Arm dies"
	--L.left_wipe_bar = "Respawn Left Arm"
	--L.right_wipe_bar = "Respawn Right Arm"

	--L.eyebeam = "Focused Eyebeam"
	--L.eyebeam_desc = "Warn who gets Focused Eyebeam."
end

L = BigWigs:NewBossLocale("Auriaya", "itIT")
if L then
	--L.swarm_message = "Swarm"

	--L.defender = "Feral Defender"
	--L.defender_desc = "Warn for Feral Defender lives."
	--L.defender_message = "Defender up %d/9!"
end

L = BigWigs:NewBossLocale("Hodir", "itIT")
if L then
	--L.hardmode = "Hard mode"
	--L.hardmode_desc = "Show timer for hard mode."
end

L = BigWigs:NewBossLocale("Thorim", "itIT")
if L then
	--L.phase2_trigger = "Interlopers! You mortals who dare to interfere with my sport will pay.... Wait--you..."
	--L.phase3_trigger = "Impertinent whelps, you dare challenge me atop my pedestal? I will crush you myself!"

	--L.hardmode = "Hard mode timer"
	--L.hardmode_desc = "Show timer for when you have to reach Thorim in order to enter hard mode in phase 3."
	--L.hardmode_warning = "Hard mode expires"

	--L.barrier_message = "Barrier up!"

	--L.charge_message = "Charged x%d!"
	--L.charge_bar = "Charge %d"
end

L = BigWigs:NewBossLocale("Freya", "itIT")
if L then
	--L.wave = "Waves"
	--L.wave_desc = "Warn for Waves."
	--L.wave_bar = "Next Wave"
	--L.conservator_trigger = "Eonar, your servant requires aid!"
	--L.detonate_trigger = "The swarm of the elements shall overtake you!"
	--L.elementals_trigger = "Children, assist me!"
	--L.tree_trigger = "A |cFF00FFFFLifebinder's Gift|r begins to grow!"
	--L.conservator_message = "Conservator!"
	--L.detonate_message = "Detonating lashers!"
	--L.elementals_message = "Elementals!"

	--L.tree = "Eonar's Gift"
	--L.tree_desc = "Alert when Freya spawns a Eonar's Gift."
	--L.tree_message = "Tree is up!"

	--L.fury_message = "Fury"

	--L.tremor_warning = "Ground Tremor soon!"
	--L.tremor_bar = "~Next Ground Tremor"
	--L.energy_message = "Unstable Energy on YOU!"
	--L.sunbeam_message = "Sun beams up!"
	--L.sunbeam_bar = "~Next Sun Beams"
end

L = BigWigs:NewBossLocale("Mimiron", "itIT")
if L then
	--L.phase = "Phases"
	--L.phase_desc = "Warn for phase changes."
	--L.engage_warning = "Phase 1"
	--L.engage_trigger = "^We haven't much time, friends!"
	--L.phase2_warning = "Phase 2 incoming"
	--L.phase2_trigger = "^WONDERFUL! Positively marvelous results!"
	--L.phase3_warning = "Phase 3 incoming"
	--L.phase3_trigger = "^Thank you, friends!"
	--L.phase4_warning = "Phase 4 incoming"
	--L.phase4_trigger = "^Preliminary testing phase complete"
	--L.phase_bar = "Phase %d"

	--L.hardmode_trigger = "^Now, why would you go and do something like that?"

	--L.plasma_warning = "Casting Plasma Blast!"
	--L.plasma_soon = "Plasma soon!"
	--L.plasma_bar = "Plasma"

	--L.shock_next = "Next Shock Blast"

	--L.laser_soon = "Spinning up!"
	--L.laser_bar = "Barrage"

	--L.magnetic_message = "ACU Rooted!"

	--L.suppressant_warning = "Suppressant incoming!"

	--L.fbomb_bar = "Next Frost Bomb"

	--L.bomb_message = "Bomb Bot spawned!"
end

L = BigWigs:NewBossLocale("General Vezax", "itIT")
if L then
	--L.surge_bar = "Surge %d"

	--L.animus = "Saronite Animus"
	--L.animus_desc = "Warn when the Saronite Animus spawns."
	--L.animus_trigger = "The saronite vapors mass and swirl violently, merging into a monstrous form!"
	--L.animus_message = "Animus spawns!"

	--L.vapor = "Saronite Vapors"
	--L.vapor_desc = "Warn when Saronite Vapors spawn."
	--L.vapor_message = "Saronite Vapor %d!"
	--L.vapor_bar = "Vapor"
	--L.vapor_trigger = "A cloud of saronite vapors coalesces nearby!"

	--L.vaporstack = "Vapors Stack"
	--L.vaporstack_desc = "Warn when you have 5 or more stacks of Saronite Vapors."
	--L.vaporstack_message = "Vapors x%d!"

	--L.crash_say = "Crash"

	--L.mark_message = "Mark"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "itIT")
if L then
	--L.engage_trigger = "^The time to"
	--L.phase2_trigger = "^I am the lucid dream"
	--L.phase3_trigger = "^Look upon the true face"

	--L.portal = "Portal"
	--L.portal_desc = "Warn for Portals."
	--L.portal_message = "Portals open!"
	--L.portal_bar = "Next portals"

	--L.fervor_message = "Fervor on %s!"

	--L.sanity_message = "You're going insane!"

	--L.weakened = "Stunned"
	--L.weakened_desc = "Warn when Yogg-saron becomes stunned."
	--L.weakened_message = "%s is stunned!"

	--L.madness_warning = "Madness in 10 sec!"

	--L.malady_message = "Malady"

	--L.tentacle = "Crusher Tentacle"
	--L.tentacle_desc = "Warn for Crusher Tentacle spawn."
	--L.tentacle_message = "Crusher %d!"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	--L.link_warning = "You are linked!"

	--L.guardian_message = "Guardian %d!"

	--L.roar_warning = "Roar in 5sec!"
	--L.roar_bar = "Next Roar"
end
