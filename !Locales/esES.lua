-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "esES")
if L then
	L.bone_spike = "Púa ósea" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "esES")
if L then
	L.touch = "Toque"
	L.deformed_fanatic = "Fanático deformado" -- NPC ID 38135
	L.empowered_adherent = "Partidario potenciado" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "esES")
if L then
	L.adds_trigger_alliance = "¡Atracadores, sargentos, atacad!"
	L.adds_trigger_horde = "Marines, Sergeants, attack!"

	L.mage = "Mago"
	L.mage_desc = "Avisa cuando aparece un Mago para congelar los cañones."
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	L.warmup_trigger_alliance = "¡Arrancad los motores!"
	L.warmup_trigger_horde = "Rise up, sons and daughters"

	L.disable_trigger_alliance = "¡No digáis que no lo avisé"
	L.disable_trigger_horde = "Onward to the Lich King"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "esES")
if L then
	L.blood_beast = "Bestia de sangre" -- NPC ID 38508

	L.warmup_alliance = "¡Entonces movámonos! ¡Sali...!"
	L.warmup_horde = "Kor'kron, move out! Champions, watch your backs. The Scourge have been..."
end

L = BigWigs:NewBossLocale("Blood Prince Council", "esES")
if L then
	L.switch_message = "Cambio de objetivo: %s"
	L.switch_bar = "~Próximo cambio de objetivo"

	L.empowered_flames = "Llama potenciada"

	L.empowered_shock_message = "¡Casteando Choque!"
	L.regular_shock_message = "Zona de Choque"
	L.shock_bar = "~Próximo Choque"

	L.iconprince = "Icono en el príncipe activo"
	L.iconprince_desc = "Coloca el primer icono de raid en el príncipe activo (requiere ayudante o líder)."

	L.prison_message = "¡Prisión de las Sombras x%d!"
end

L = BigWigs:NewBossLocale("Festergut", "esES")
if L then
	L.engage_trigger = "¿A divertirse?"

	L.inhale_bar = "Inhalar %d"
	L.blight_warning = "¡Añublo acre en ~5sec!"
	L.ball_message = "¡Lanzando Moco maleable!"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "esES")
if L then
	L.engage_trigger = "Habéis tomado una... decisión... incorrecta."

	L.shadow = "Sombras"
	L.shadow_message = "Sombras"
	L.shadow_bar = "Próximas Sombras"

	L.feed_message = "¡Tiempo para morder pronto!"

	L.pact_message = "Pacto"
	L.pact_bar = "Siguiente Pacto"

	L.phase_message = "¡Fase aérea entrando!"
	L.phase1_bar = "Aterriza"
	L.phase2_bar = "Fase aérea"
end

L = BigWigs:NewBossLocale("The Lich King", "esES")
if L then
	L.warmup_trigger = "¿Así que por fin ha llegado la elogiada justicia de la Luz?"
	L.engage_trigger = "Te mantendré vivo para presenciar el final, Vadín"

	L.horror_message = "Horror desgarbado"
	L.horror_bar = "~Siguiente Horror"

	L.valkyr_message = "Val'kyr"
	L.valkyr_bar = "Siguiente Val'kyr"
	L.valkyrhug_message = "Val'kyrs Hugged"

	L.cave_phase = "Cave Phase"
	L.last_phase_bar = "Última fase"

	L.frenzy_bar = "¡%s Frenesí!"
	L.frenzy_survive_message = "%s sobrevirán después de la peste"
	L.frenzy_message = "¡Add frenesí!"
	L.frenzy_soon_message = "¡5sec para frenesí!"

	--L.custom_on_valkyr_marker = "Val'kyr marker"
	--L.custom_on_valkyr_marker_desc = "Mark the Val'kyr with {rt8}{rt7}{rt6}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over the Val'kyr is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Professor Putricide", "esES")
if L then
	L.engage_trigger = "¡Buenas noticias, amigos!"

	L.phase = "Fases"
	L.phase_desc = "Avisar cambios de fase."
	L.phase_warning = "¡Fase %d pronto!"
	L.phase_bar = "Siguiente Fase"

	L.ball_bar = "Próximo Moco maleable"
	L.ball_say = "¡Lanzando Moco maleable!"

	L.experiment_message = "¡Moco aparece!"
	L.experiment_heroic_message = "¡Mocos aparecen!"
	L.experiment_bar = "Siguiente Moco"
	L.blight_message = "Babosa Roja"
	L.violation_message = "Babosa Verde"

	L.gasbomb_bar = "Más Bombas de gas asfixiante"
	L.gasbomb_message = "¡Bomba de gas asfixiante!"
end

L = BigWigs:NewBossLocale("Rotface", "esES")
if L then
	L.engage_trigger = "¡WEEEEEEE!"

	L.infection_message = "Infección"

	L.ooze = "Moco Fusionado"
	L.ooze_desc = "Avisa cuando un moco se fusiona."
	L.ooze_message = "Moco %dx"

	L.spray_bar = "Siguiente Pulverizador"
end

L = BigWigs:NewBossLocale("Sindragosa", "esES")
if L then
	L.engage_trigger = "¡Estáis locos por haber venido aquí!"

	L.phase2 = "Fase 2"
	L.phase2_desc = "Avisa cuando Sindragosa entra en Fase 2, al 35%."
	L.phase2_trigger = "¡Ahora sentid el poder sin fin de mi maestro y desesperad!"
	L.phase2_message = "¡Fase 2!"

	L.airphase = "Fase aérea"
	L.airphase_desc = "Avisa cuando Sindragosa despegue."
	L.airphase_trigger = "¡Aquí termina vuestra incursión! ¡Nadie sobrevivirá!"
	L.airphase_message = "¡Fase aérea!"
	L.airphase_bar = "Próxima Fase aérea"

	L.boom_message = "¡Explosión!"
	L.boom_bar = "Explosión"

	L.instability_message = "Inestabilidad x%d!"
	L.chilled_message = "¡Helado hasta los huesos x%d!"
	L.buffet_message = "¡Sacudida mística x%d!"
	L.buffet_cd = "Siguiente Sacudida mística"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "esES")
if L then
	L.engage_trigger = "Han entrado intrusos en el Sagrario Interior."

	L.portal = "Portal pesadilla"
	L.portal_desc = "Avisa cuando Valithria abra portales."
	L.portal_message = "¡Portales up!"
	L.portal_bar = "Portales inc"
	L.portalcd_message = "¡Portales %d up en 14 sec!"
	L.portalcd_bar = "Próximos portales %d"
	L.portal_trigger = "He abierto un portal al Sueño."

	L.suppresser = "Supresores aparecen"
	L.suppresser_desc = "Avisa cuando una oleada de supresores aparecen."
	L.suppresser_message = "~Supresores"

	L.blazing = "Esqueleto llameante"
	L.blazing_desc = "Esqueleto llameante |cffff0000estimated|r tiempo de reaparición. Este contador puede que no sea preciso."
	L.blazing_warning = "¡Esqueleto llameante pronto!"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "esES")
if L then
	L.deathbound_ward = "Depositario vinculado a la muerte"
	L.deathspeaker_high_priest = "Sumo sacerdote portavoz de la muerte" -- NPC ID 36829
	L.putricide_dogs = "Precioso & Apestoso"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "esES")
if L then
	L.engage_message = "¡Anub'arak activo, se entierra en 80sec!"
	L.engage_trigger = "¡Este lugar será vuestra tumba!"

	L.unburrow_trigger = "emerge de la tierra!"
	L.burrow_trigger = "se entierra en el suelo!"
	L.burrow = "Se entierra"
	L.burrow_desc = "Mostrar contadores para emerger y enterrar, y también para aparición de adds."
	L.burrow_soon = "Se entierra pronto"

	L.nerubian_message = "¡Aparecen Adds!"
	L.nerubian_burrower = "Más adds"

	L.shadow_soon = "¡Golpe de las Sombras en ~5sec!"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "esES")
if L then
	L.wipe_trigger = "Trágico..."

	L.engage_trigger = "Desde las cavernas más oscuras y profundas de Las Cumbres Tormentosas: ¡Gormok el Empalador! ¡A luchar, héroes!"
	L.jormungars_trigger = "Preparaos, héroes, para los temibles gemelos: ¡Fauceácida y Aterraescama! ¡A la arena!"
	L.icehowl_trigger = "El propio aire se congela al presentar a nuestro siguiente combatiente: ¡Aullahielo! ¡Matad o morid, campeones!"
	L.boss_incoming = "%s entrando"

	L.gormok = "Gormok el Empalador"
	L.jormungars = "Fauceácida y Aterraescama"
	L.icehowl = "Aullahielo"

	-- Gormok
	L.snobold = "Snobold"
	L.snobold_desc = "Avisa quien tiene un Snobold en su cabeza."

	-- Jormungars
	L.submerge = "Sumerge"
	L.submerge_desc = "Muestra un contador para la siguiente vez que los gusanos se sumerjan."
	L.spew = "Acidic/Molten Spew"
	L.spew_desc = "Warn for Acidic/Molten Spew."
	L.sprays = "Sprays"
	L.sprays_desc = "Muestra un contador para los siguientes sprays de Parálisis y Fuego."
	L.slime_message = "¡Baba paralizante en TI!"
	L.burn_spell = "Fuego"
	L.toxin_spell = "Toxina"
	L.spray = "Siguiente Spray"

	-- Icehowl
	L.charge = "Carga furiosa"
	L.charge_desc = "Avisa sobre la Carga furiosa en jugadores."
	L.charge_trigger = "mira a"

	L.bosses = "Jefes"
	L.bosses_desc = "Avisa cuando los Jefes esten entrando."
end

L = BigWigs:NewBossLocale("Faction Champions", "esES")
if L then
	L.defeat_trigger = "Una victoria trágica y fútil."

	L["Shield on %s!"] = "¡Escudo en %s!"
	L["Bladestorming!"] = "¡Filotormenta"
	L["Hunter pet up!"] = "¡Mascota de Cazador up!"
	L["Felhunter up!"] = "¡Manáfago up!"
	L["Heroism on champions!"] = "¡Heroismo en campeones!"
	L["Bloodlust on champions!"] = "¡Ansia de sangre en campeones!"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "esES")
if L then
	L.enable_trigger = "¡Un gnomo insignificante! ¡Tu arrogancia será tu perdición!"

	L.engage = "Activo"
	L.engage_trigger = "Soy Jaraxxus, señor Eredar de la Legión Ardiente."
	L.engage_trigger1 = "But I'm in charge here"

	L.adds = "Portales y Volcanes"
	L.adds_desc = "Muestra un contador y un aviso cuando Jaraxxus invoque portales y volcanes."

	L.incinerate_message = "Incinerar"
	L.incinerate_other = "¡%s tiene bomba!"
	L.incinerate_bar = "Siguiente Incinerar"
	L.incinerate_safe = "%s esta a salvo, ya :)"

	L.legionflame_message = "Llamas"
	L.legionflame_other = "¡Llamas en %s!"
	L.legionflame_bar = "Siguiente llamas"

	L.infernal_bar = "Volcán aparece"
	L.netherportal_bar = "Portal aparece"

	L.kiss_message = "¡Beso en TI!"
	L.kiss_interrupted = "¡Cortado!"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "esES")
if L then
	L.engage_trigger1 = "En el nombre de nuestro oscuro maestro. Por el Rey Exánime. Morirás."

	L.vortex_or_shield_cd = "Siguiente Vórtice o Escudo"
	L.next = "Siguiente Vórtice o Escudo"
	L.next_desc = "Aviso para siguiente Vórtice o Escudo"

	L.vortex = "Vórtice"
	L.vortex_desc = "Aviso cuando la gemela empieza a lanzar vórtices."

	L.shield = "Escudo de Oscuridad/Luz"
	L.shield_desc = "Aviso para Escudo de Oscuridad/Luz."

	L.touch = "Toque de Oscuridad/Luz"
	L.touch_desc = "Aviso para Toque de Oscuridad/Luz"
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "esES")
if L then
	L.add = "Guardia de la cripta"
	L.locust = "Langosta"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "esES")
if L then
	--L.silencewarn = "Silenced!"
	--L.silencewarn5sec = "Silence ends in 5 sec"
	L.silence = "Silencio"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "esES")
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

L = BigWigs:NewBossLocale("Grobbulus", "esES")
if L then
	--L.injection = "Injection"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "esES")
if L then
	--L.teleport_yell_trigger = "The end is upon you."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "esES")
if L then
	--L.mark = "Mark"
	--L.mark_desc = "Warn for marks."

	--L.engage_message = "The Four Horsemen engaged!"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "esES")
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

L = BigWigs:NewBossLocale("Loatheb", "esES")
if L then
	--L.doomtime_bar = "Doom every 15 sec"
	--L.doomtime_now = "Doom now happens every 15 sec!"

	--L.spore_warn = "Spore (%d)"
end

L = BigWigs:NewBossLocale("Maexxna", "esES")
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

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "esES")
if L then
	L.adds_yell_trigger = "¡Levantaos, soldados míos!" -- Rise, my soldiers! Rise and fight once more!
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "esES")
if L then
	L.understudy = "Suplente Caballero de la Muerte"

	--L.shout_warning = "Disrupting Shout in 5 sec!"
	--L.taunt_warning = "Taunt ready in 5 sec!"
	--L.shieldwall_warning = "Barrier gone in 5 sec!"
end

L = BigWigs:NewBossLocale("Sapphiron", "esES")
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

L = BigWigs:NewBossLocale("Thaddius", "esES")
if L then
	L[15929] = "Stalagg"
	L[15930] = "Feugen"

	--L.stage2_yell_trigger1 = "Eat... your... bones..."
	--L.stage2_yell_trigger2 = "Break... you!!"
	--L.stage2_yell_trigger3 = "Kill..."

	--L.add_death_emote_trigger = "%s dies."
	L.overload_emote_trigger = "¡%s se sobrecarga!"
	--L.add_revive_emote_trigger = "%s is jolted back to life!"

	L.polarity_extras = "Avisos adicionales para el posicionamiento del cambio de polaridad"

	L.custom_select_charge_position = "Primera posición"
	L.custom_select_charge_position_desc = "Posicionamiento después del primer cambio de polaridad."
	L.custom_select_charge_position_value1 = "|cffff2020Carga negativa (-)|r a la IZQUIERDA, |cff2020ffCarga positiva (+)|r a la DERECHA"
	L.custom_select_charge_position_value2 = "|cff2020ffCarga positiva (+)|r a la IZQUIERDA, |cffff2020Carga negativa (-)|r a la DERECHA"

	L.custom_select_charge_movement = "Movimiento"
	L.custom_select_charge_movement_desc = "La estrategia de movimiento que se utiliza tu grupo."
	L.custom_select_charge_movement_value1 = "Corre |cff20ff20A TRAVÉS|r del jefe"
	L.custom_select_charge_movement_value2 = "Corre |cff20ff20EN SENTIDO HORARIO|r alrededor del jefe."
	L.custom_select_charge_movement_value3 = "Corre |cff20ff20EN SENTIDO ANTIHORARIO|r alrededor del jefe."
	L.custom_select_charge_movement_value4 = "Cuatro grupos 1: Cambio de polaridad hacia la |cff20ff20DERECHA|r, misma polaridad hacia la |cff20ff20IZQUIERDA|r."
	L.custom_select_charge_movement_value5 = "Cuatro grupos 2: Cambio de polaridad hacia la |cff20ff20IZQUIERDA|r, misma polaridad hacia la |cff20ff20DERECHA|r."

	L.custom_off_charge_graphic = "Flecha gráfica"
	L.custom_off_charge_graphic_desc = "Muestra una flecha gráfica."
	L.custom_off_charge_text = "Flecha de texto"
	L.custom_off_charge_text_desc = "Muestra un mensaje adicional."
	L.custom_off_charge_voice = "Alerta de voz"
	L.custom_off_charge_voice_desc = "Reproduce una alerta de voz."

	--Translate these to get locale sound files!
	L.left = "<--- VE A LA IZQUIERDA <--- VE A LA IZQUIERDA <---"
	L.right = "---> VE A LA DERECHA ---> VE A LA DERECHA --->"
	L.swap = "^^^^ CAMBIA DE LADO ^^^^ CAMBIA DE LADO ^^^^"
	L.stay = "==== NO TE MUEVES ==== NO TE MUEVES ===="

	L.chat_message = "El módulo de Thaddius admite mostrar flechas direccionales y reproducir voces. Abre las opciones para configurarlas."
end

-- Northrend

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "esES")
if L then
	L.whiteout_bar = "Tormenta de nieve %d"
	L.whiteout_message = "¡Tormenta de nieve %d pronto!"

	L.freeze_message = "Congelado"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "esES")
if L then
	--L.stomp_message = "Stomp - Charge Inc!"
	--L.stomp_warning = "Possible Stomp in ~5sec!"

	--L.charge = "Charge"
	--L.charge_desc = "Warn about Charge on players."
end

L = BigWigs:NewBossLocale("Malygos", "esES")
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

L = BigWigs:NewBossLocale("Sartharion", "esES")
if L then
	L.engage_trigger = "Mi tarea es cuidar de estos huevos. ¡Arderéis antes de hacerles el más mínimo daño!"
	L.tsunami_trigger = "¡La lava se arremolina alrededor de %s!"
	L.twilight_trigger_vesperon = "¡Un discípulo de Vesperon aparece en el Crepúsculo!"
	L.twilight_trigger_shadron = "¡Un discípulo de Shadron aparece en el Crepúsculo!"

	--L.drakes = "Drake Adds"
	--L.drakes_desc = "Warn when each drake add will join the fight."

	-- Adds
	L.shadron = "Shadron"
	L.tenebron = "Tenebron"
	L.vesperon = "Vesperon"
	L.lava_blaze = "Llamarada de lava" -- NPC 30643
	L.acolyte_shadron = "Acólito de Shadron" -- NPC 31218
	L.acolyte_vesperon = "Acólito de Vesperon" -- NPC 31219
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "esES")
if L then
	--L.overcharge_message = "A minion is overcharged!"
	--L.overcharge_bar = "Explosion"

	--L.custom_on_overcharge_mark = "Overcharge marker"
	--L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "esES")
if L then
	--L.breath_bar = "Breath %d"
	--L.breath_message = "Breath %d soon!"
end

L = BigWigs:NewBossLocale("Onyxia", "esES")
if L then
	--L.phase1_trigger = "How fortuitous"
	--L.phase2_trigger = "from above"
	--L.phase3_trigger = "It seems you'll need another lesson"

	L.deep_breath = "Aliento profundo"
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "esES")
if L then
	L.twilight_cutter_emote_trigger = "esferas" -- ¡Las esferas que orbitan emiten energía oscura!
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "esES")
if L then
	L.baltharus = "Baltharus el Batallante" -- NPC 39751
	L.saviana = "Saviana Furia Ardiente" -- NPC 39747
	L.zarithrian = "General Zarithrian" -- NPC 39746

	L.adds_yell_trigger = "¡Reducidlos a cenizas, esbirros!"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "esES")
if L then
	L.swarm_message = "Enjambre"

	L.defender = "Defensor feral"
	L.defender_desc = "Aviso para la vida del Defensor feral."
	L.defender_message = "¡Defensor vivo %d/9!"
end

L = BigWigs:NewBossLocale("Freya", "esES")
if L then
	L.wave = "Oleadas"
	L.wave_desc = "Aviso para oleadas."
	L.wave_bar = "Próxima oleada"
	L.conservator_trigger = "¡Eonar, tus sirvientes requieren tu ayuda!"
	L.detonate_trigger = "¡El azote de los elementos podrá con vosotros!"
	L.elementals_trigger = "¡Hijos, ayudadme!"
	L.tree_trigger = "¡El |cFF00FFFFDon de Eonar|r empieza a brotar!" -- verificar
	L.conservator_message = "¡Conservador!"
	L.detonate_message = "¡Azotadores detonantes!"
	L.elementals_message = "¡Elementales!"

	L.tree = "Don de Eonar"
	L.tree_desc = "Alerta cuando Freya invoca un Don de Eonar."
	L.tree_message = "¡Arbol vivo!"

	L.fury_message = "Furia"

	L.tremor_warning = "¡Tremor terrenal inminente!"
	L.tremor_bar = "~Próximo Tremor terrenal"
	L.energy_message = "¡Energía inestable en TI!"
	L.sunbeam_message = "¡Rayos activos!"
	L.sunbeam_bar = "~Próximos Rayos de sol"
end

L = BigWigs:NewBossLocale("Hodir", "esES")
if L then
	L.hardmode = "Modo difícil"
	L.hardmode_desc = "Mostrar contador para el modo difícil."
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "esES")
if L then
	L.brittle_message = "¡El ensamblaje es frágil!"
end

L = BigWigs:NewBossLocale("The Iron Council", "esES")
if L then
	L.stormcaller_brundir = "Clamatormentas Brundir"
	L.steelbreaker = "Rompeacero"
	L.runemaster_molgeim = "Maestro de runas Molgeim"

	L.summoning_message = "¡Elementales inminentes!"

	L.chased_other = "¡%s está siendo perseguido!"
	L.chased_you = "¡TU estás siendo perseguido!"
end

L = BigWigs:NewBossLocale("Kologarn", "esES")
if L then
	L.arm = "Muere el brazo"
	L.arm_desc = "Aviso cuando muere el brazo izquierdo/derecho."
	L.left_dies = "Muere el brazo izquierdo"
	L.right_dies = "Muere el brazo derecho"
	L.left_wipe_bar = "Reaparece el brazo izquierdo"
	L.right_wipe_bar = "Reaparece el brazo derecho"

	L.eyebeam = "Haz ocular enfocado"
	L.eyebeam_desc = "Avisa quien tiene el Haz ocular enfocado."
end

L = BigWigs:NewBossLocale("Mimiron", "esES")
if L then
	L.phase = "Fases"
	L.phase_desc = "Aviso para cambios de fases."
	L.engage_warning = "Fase 1"
	L.engage_trigger = "^¡No tenemos mucho tiempo, amigos!"
	L.phase2_warning = "Fase 2 inminente"
	L.phase2_trigger = "^¡ESTUPENDO! ¡Unos resultados definitivamente maravillosos!"
	L.phase3_warning = "Fase 3 inminente"
	L.phase3_trigger = "^¡Gracias amigos!"
	L.phase4_warning = "Fase 4 inminente"
	L.phase4_trigger = "^Fase de prueba preliminar completada."
	L.phase_bar = "Fase %d"

	L.hardmode_trigger = "^¡Cómo se os ocurre hacer algo así!"

	L.plasma_warning = "¡Lanzando Explosión de plasma!"
	L.plasma_soon = "¡Plasma inminente!"
	L.plasma_bar = "Plasma"

	L.shock_next = "Próxima Explosión de choque"

	L.laser_soon = "¡Girando!"
	L.laser_bar = "Tromba de láseres"

	L.magnetic_message = "¡ACU pegado!"

	L.suppressant_warning = "¡Supresor inminente!"

	L.fbomb_bar = "Próxima Bomba de Escarcha"

	L.bomb_message = "¡Bombabot aparece!"
end

L = BigWigs:NewBossLocale("Razorscale", "esES")
if L then
	L.ground_trigger = "¡Moveos! ¡No seguirá mucho más en el suelo!"
	L.ground_message = "¡Tajoescama está encandenado!"
	L.air_message = "¡Despega!"

	L.harpoon = "Arpones"
	L.harpoon_desc = "Anuncia cuando los arpones están listos para su uso."
	L.harpoon_message = "¡Arpón %d listo!"
	L.harpoon_trigger = "¡Torreta de arpones lista!"
	L.harpoon_nextbar = "Arpón %d"
end

L = BigWigs:NewBossLocale("Thorim", "esES")
if L then
	L.phase2_trigger = "¡Intrusos! Vosotros, mortales que osáis interferir en mi diversión, pagaréis… Un momento..."
	L.phase3_trigger = "Gusanos impertinentes, ¿cómo osáis desafiarme en mi pedestal? ¡Os machacaré con mis propias manos!"

	L.hardmode = "Temporizador modo difícil"
	L.hardmode_desc = "Muestra un contador para cuando llegues a Thorim en modo difícil en fase 3."
	L.hardmode_warning = "Modo difícil expira"

	L.barrier_message = "¡Barrera activa!"

	L.charge_message = "Cargado x%d!"
	L.charge_bar = "Carga %d"
end

L = BigWigs:NewBossLocale("General Vezax", "esES")
if L then
	L.surge_bar = "Oleada %d"

	L.animus = "Animus de saronita"
	L.animus_desc = "Avisa cuanto el Animus de saronita aparece."
	L.animus_trigger = "The saronite vapors mass and swirl violently, merging into a monstrous form!" -- translate
	L.animus_message = "¡Animus aparece!"

	L.vapor = "Vapores de saronita"
	L.vapor_desc = "Avisa cuando avaprecen vapores de saronita."
	L.vapor_message = "¡Vapor de saronita %d!"
	L.vapor_bar = "Vapor"
	L.vapor_trigger = "¡Cerca se forma una nube de vapores de saronita!" -- verificar

	L.vaporstack = "Stacks de Vapores"
	L.vaporstack_desc = "Avisa cuando tienes 5 o más stacks de Vapores de saronita."
	L.vaporstack_message = "¡Vapores x%d!"

	L.crash_say = "Fragor"

	L.mark_message = "Marca"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "esES")
if L then
	L.lightbomb_other = "Luz"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "esES")
if L then
	L.engage_trigger = "^¡Pronto llegará la hora de"
	L.phase2_trigger = "^Soy un sueño lúcido."
	L.phase3_trigger = "^¡Observad el auténtico rostro de la muerte"

	L.portal = "Portal"
	L.portal_desc = "Aviso para portales."
	L.portal_message = "¡Portales abiertos!"
	L.portal_bar = "Próximos portales"

	L.fervor_message = "Fervor en %s!"

	L.sanity_message = "¡Te estás volviendo loco!"

	L.weakened = "Aturdido"
	L.weakened_desc = "Avisa cuando Yogg-saron está aturdido."
	L.weakened_message = "¡%s está aturdido!"

	L.madness_warning = "¡Locura en 10 seg!"
	L.malady_message = "Mal de la mente" -- short for Malady of the Mind (63830)

	L.tentacle = "Tentáculo triturador"
	L.tentacle_desc = "Aviso cuando Tentáculo triturador aparece."
	L.tentacle_message = "¡Triturador %d!"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = "¡Estás enlazado!"

	L.guardian_message = "¡Guardian %d!"

	L.roar_warning = "¡Rugido en 5seg!"
	L.roar_bar = "Próximo rugido"
end
