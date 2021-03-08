local L = BigWigs:NewBossLocale("Blood Prince Council", "esES") or BigWigs:NewBossLocale("Blood Prince Council", "esMX")
if not L then return end
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

L = BigWigs:NewBossLocale("Lady Deathwhisper", "esES") or BigWigs:NewBossLocale("Lady Deathwhisper", "esMX")
if L then
	L.engage_trigger = "¿Qué es este alboroto? ¿Osáis entrar en suelo sagrado? ¡Este será vuestro lugar de reposo final!"
	L.phase2_message = "¡Barrera BAJA - Fase 2!"

	L.dnd_message = "¡Muerte y Descomposición en TÍ!"

	L.adds = "Adds"
	L.adds_desc = "Contador para Nuevos Adds."
	L.adds_bar = "Nuevos Adds"
	L.adds_warning = "¡Nuevos adds en 5 sec!"

	L.touch_message = "%2$dx Toque en %1$s"
	L.touch_bar = "Siguiente Toque"

	L.deformed_fanatic = "¡Fanático deformado!"

	L.spirit_message = "¡Invocando Espíritu!"
	L.spirit_bar = "Nuevos Espíritus"
end

L = BigWigs:NewBossLocale("Festergut", "esES") or BigWigs:NewBossLocale("Festergut", "esMX")
if L then
	L.engage_trigger = "¿A divertirse?"

	L.inhale_bar = "Inhalar %d"
	L.blight_warning = "¡Añublo acre en ~5sec!"
	L.ball_message = "¡Lanzando Moco maleable!"
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "esES") or BigWigs:NewBossLocale("Icecrown Gunship Battle", "esMX")
if L then
	L.adds = "Portal"
	L.adds_desc = "Avisar Portal."
	L.adds_trigger_alliance = "¡Atracadores, sargentos, atacad!"
	L.adds_trigger_horde = "Marines, Sergeants, attack!"
	L.adds_message = "¡Portal!"
	L.adds_bar = "Siguiente Portal"

	L.mage = "Mago"
	L.mage_desc = "Avisa cuando aparece un Mago para congelar los cañones."
	L.mage_message = "¡Mago aparece!"
	L.mage_bar = "Siguiente Mago"

	L.warmup_trigger_alliance = "¡Arrancad los motores!"
	L.warmup_trigger_horde = "Rise up, sons and daughters"

	L.disable_trigger_alliance = "¡No digáis que no lo avisé"
	L.disable_trigger_horde = "Onward to the Lich King"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "esES") or BigWigs:NewBossLocale("Blood-Queen Lana'thel", "esMX")
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

L = BigWigs:NewBossLocale("The Lich King", "esES") or BigWigs:NewBossLocale("The Lich King", "esMX")
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

L = BigWigs:NewBossLocale("Lord Marrowgar", "esES") or BigWigs:NewBossLocale("Lord Marrowgar", "esMX")
if L then
	L.engage_trigger = "¡La Plaga arrasará este mundo como un enjambre de muerte y destrucción!"

	L.bonestorm_warning = "¡Tormenta ósea en 5 sec!"
end

L = BigWigs:NewBossLocale("Professor Putricide", "esES") or BigWigs:NewBossLocale("Professor Putricide", "esMX")
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

L = BigWigs:NewBossLocale("Rotface", "esES") or BigWigs:NewBossLocale("Rotface", "esMX")
if L then
	L.engage_trigger = "¡WEEEEEEE!"

	L.infection_message = "Infección"

	L.ooze = "Moco Fusionado"
	L.ooze_desc = "Avisa cuando un moco se fusiona."
	L.ooze_message = "Moco %dx"

	L.spray_bar = "Siguiente Pulverizador"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "esES") or BigWigs:NewBossLocale("Deathbringer Saurfang", "esMX")
if L then
	L.adds = "Bestias de sangre"
	L.adds_desc = "Shows a timer and messages for when Blood Beasts spawn."
	L.adds_warning = "¡Bestias de sangre en 5 sec!"
	L.adds_message = "¡Bestias de sangre!"

	L.engage_trigger = "¡POR EL PODER DEL REY EXÁNIME!"
	L.warmup_alliance = "¡Entonces movámonos! ¡Sali...!"
	L.warmup_horde = "Kor'kron, move out! Champions, watch your backs. The Scourge have been..."
end

L = BigWigs:NewBossLocale("Sindragosa", "esES") or BigWigs:NewBossLocale("Sindragosa", "esMX")
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

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "esES") or BigWigs:NewBossLocale("Valithria Dreamwalker", "esMX")
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

