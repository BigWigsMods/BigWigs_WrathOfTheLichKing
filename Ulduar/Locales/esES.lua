
local L = BigWigs:NewBossLocale("Algalon the Observer", "esES")
if L then
	L.smash_message = "¡Machaque cósmico inminente!"
	L.blackhole_message = "¡Hoyo negro %d!"
	L.bigbang_bar = "Próximo Big Bang"
	L.bigbang_soon = "¡Big Bang inminente!"
end

L = BigWigs:NewBossLocale("Auriaya", "esES")
if L then
	L.engage_trigger = "¡Es mejor dejar ciertas cosas tal como están!"

	L.fear_warning = "¡Miedo inminente!"
	L.fear_message = "¡Lanzando miedo!"
	L.fear_bar = "~Miedo"

	L.swarm_message = "Enjambre"
	L.swarm_bar = "~Enjambre"

	L.defender = "Defensor feral"
	L.defender_desc = "Aviso para la vida del Defensor feral."
	L.defender_message = "¡Defensor vivo %d/9!"

	L.sonic_bar = "~Chirrido sónico"
end

L = BigWigs:NewBossLocale("Freya", "esES")
if L then
	L.engage_trigger1 = "¡Debemos proteger el Invernadero!"
	L.engage_trigger2 = "¡Ancestros, otorgadme vuestro poder!"

	L.phase = "Fases"
	L.phase_desc = "Aviso para cambios de fase."
	L.phase2_message = "¡Fase 2!"

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

	L.end_trigger = "Su control sobre mí se disipa. Vuelvo a ver con claridad. Gracias, héroes."
end

L = BigWigs:NewBossLocale("Hodir", "esES")
if L then
	L.engage_trigger = "¡Sufriréis por esta intromisión!"

	L.cold = "Frío cortante"
	L.cold_desc = "Avisa cuando tienes 2 o mas stacs de Frío cortante."
	L.cold_message = "¡Frío cortante x%d!"

	L.flash_warning = "¡Congelación!"
	L.flash_soon = "¡Congelación en 5seg!"

	L.hardmode = "Modo difícil"
	L.hardmode_desc = "Mostrar contador para el modo difícil."

	L.end_trigger = "Estoy... estoy libre de sus garras… al fin."
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "esES")
if L then
	L.engage_trigger = "¡Gusanos insolentes! ¡Vuestra sangre templará las armas que recuperarán este mundo!"
	L.brittle_message = "¡El ensamblaje es frágil!"
end

L = BigWigs:NewBossLocale("The Iron Council", "esES")
if L then
	L.engage_trigger1 = "¡No derrotaréis a la Asamblea de Hierro tan fácilmente, invasores!"
	L.engage_trigger2 = "Solo una aniquilación total y absoluta bastará."
	L.engage_trigger3 = "Ya seáis los mayores mequetrefes o los mayores héroes del mundo, seguís siendo mortales."

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

	L.shockwave = "Ola de choque"
	L.shockwave_desc = "Aviso cuando se aproxima la siguiente ola de choque."
	L.shockwave_trigger = "¡AL OLVIDO!"

	L.eyebeam = "Haz ocular enfocado"
	L.eyebeam_desc = "Avisa quien tiene el Haz ocular enfocado."
	L.eyebeam_trigger = "sus ojos en ti"
end

L = BigWigs:NewBossLocale("Flame Leviathan", "esES")
if L then
	L.engage = "Se activa"
	L.engage_desc = "Avisa cuando el Leviathan se activa."
	L.engage_trigger = "^Entidades hostiles detectadas."
	L.engage_message = "¡%s Activado!"

	L.pursue = "Persigue"
	L.pursue_desc = "Avisa cuando el Leviathan persigue a un jugador."
	L.pursue_trigger = "^%%s persigue"
	L.pursue_other = "¡El Leviathan persigue a %s!"

	L.shutdown_message = "¡Desconexión de sistemas!"
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

	L.fbomb_soon = "¡Posible Bomba de Escarcha inminente!"
	L.fbomb_bar = "Próxima Bomba de Escarcha"

	L.bomb_message = "¡Bombabot aparece!"

	L.end_trigger = "^Me parece que me he equivocado en los cálculos."
end

L = BigWigs:NewBossLocale("Razorscale", "esES")
if L then
	L.phase = "Fases"
	L.phase_desc = "Avisa cuando Tajoescama cambia de fases."
	L.ground_trigger = "¡Moveos! ¡No seguirá mucho más en el suelo!"
	L.ground_message = "¡Tajoescama está encandenado!"
	L.air_trigger = "Danos un momento para que nos preparemos para construir las torretas."
	L.air_trigger2 = "¡Llamas extintas! ¡Reconstruyamos esas torretas!" -- verificar
	L.air_message = "¡Despega!" -- verificar
	L.phase2_trigger = "¡%s ha aterrizado permanentemente!"
	L.phase2_message = "¡Fase 2!"
	L.phase2_warning = "¡Fase 2 inminente!"

	L.breath_trigger = "%s toma aire con fuerza..."
	L.breath_message = "¡Aliento de llamas!"
	L.breath_bar = "~Aliento CD"

	L.harpoon = "Arpones"
	L.harpoon_desc = "Anuncia cuando los arpones están listos para su uso."
	L.harpoon_message = "¡Arpón %d listo!"
	L.harpoon_trigger = "¡Torreta de arpones lista!"
	L.harpoon_nextbar = "Arpón %d"
end

L = BigWigs:NewBossLocale("Thorim", "esES")
if L then
	L["Runic Colossus"] = "Coloso rúnico" -- For the runic barrier emote.

	L.phase = "Fases"
	L.phase_desc = "Aviso para cambio de fase."
	L.phase1_message = "Fase 1"
	L.phase2_trigger = "¡Intrusos! Vosotros, mortales que osáis interferir en mi diversión, pagaréis… Un momento..."
	L.phase2_message = "¡Fase 2, rabia en 6:15!"
	L.phase3_trigger = "Gusanos impertinentes, ¿cómo osáis desafiarme en mi pedestal? ¡Os machacaré con mis propias manos!"
	L.phase3_message = "¡Fase 3 - Thorim activado!"

	L.hardmode = "Temporizador modo difícil"
	L.hardmode_desc = "Muestra un contador para cuando llegues a Thorim en modo difícil en fase 3."
	L.hardmode_warning = "Modo difícil expira"

	L.shock_message = "¡Estás recibiendo una sacudida eléctrica!"
	L.barrier_message = "¡Barrera activa!"

	L.detonation_say = "¡Soy una bomba!"

	L.charge_message = "Cargado x%d!"
	L.charge_bar = "Carga %d"

	L.strike_bar = "Golpe desequilibrante CD"

	L.end_trigger = "¡Guardad las armas! ¡Me rindo!"
end

L = BigWigs:NewBossLocale("General Vezax", "esES")
if L then
	L.engage_trigger = "^¡Vuestra destrucción anunciará una nueva era de sufrimiento!"

	L.surge_message = "¡Oleada %d!"
	L.surge_cast = "¡Lanzando %d oleada!"
	L.surge_bar = "Oleada %d"

	L.animus = "Animus de saronita"
	L.animus_desc = "Avisa cuanto el Animus de saronita aparece."
	L.animus_trigger = "The saronite vapors mass and swirl violently, merging into a monstrous form!" -- translate
	L.animus_message = "¡Animus aparece!"

	L.vapor = "Vapores de saronita"
	L.vapor_desc = "Avisa cuando avaprecen vapores de saronita."
	L.vapor_message = "¡Vapor de saronita %d!"
	L.vapor_bar = "Vapor %d/6"
	L.vapor_trigger = "¡Cerca se forma una nube de vapores de saronita!" -- verificar

	L.vaporstack = "Stacks de Vapores"
	L.vaporstack_desc = "Avisa cuando tienes 5 o más stacks de Vapores de saronita."
	L.vaporstack_message = "¡Vapores x%d!"

	L.crash_say = "Fragor"

	L.mark_message = "Marca"
	L.mark_message_other = "¡Marca en %s!"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "esES")
if L then
	L.exposed_warning = "Expuesto inminente"
	L.exposed_message = "¡Corazón expuesto!"

	L.gravitybomb_other = "¡Gravedad en %s!"

	L.lightbomb_other = "¡Luz en %s!"

	L.tantrum_bar = "~Rabia CD"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "esES")
if L then
	L["Crusher Tentacle"] = "Tentáculo triturador"
	L["The Observation Ring"] = "El anillo del observador" -- verificar

	L.phase = "Fase"
	L.phase_desc = "Aviso para cambios de fases."
	L.engage_warning = "Fase 1"
	L.engage_trigger = "^¡Pronto llegará la hora de"
	L.phase2_warning = "Fase 2"
	L.phase2_trigger = "^Soy un sueño lúcido."
	L.phase3_warning = "Fase 3"
	L.phase3_trigger = "^¡Observad el auténtico rostro de la muerte"

	L.portal = "Portal"
	L.portal_desc = "Aviso para portales."
	L.portal_trigger = "Portals open into %s's mind!" --translate
	L.portal_message = "¡Portales abiertos!"
	L.portal_bar = "Próximos portales"

	L.fervor_cast_message = "Lanzando Fervor en %s!"
	L.fervor_message = "Fervor en %s!"

	L.sanity_message = "¡Te estás volviendo loco!"

	L.weakened = "Aturdido"
	L.weakened_desc = "Avisa cuando Yogg-saron está aturdido."
	L.weakened_message = "¡%s está aturdido!"
	L.weakened_trigger = "The illusion shatters and a path to the central chamber opens!" --translate

	L.madness_warning = "¡Locura en 5 seg!"
	L.malady_message = "Mal de la mente: %s"

	L.tentacle = "Tentáculo triturador"
	L.tentacle_desc = "Aviso cuando Tentáculo triturador aparece."
	L.tentacle_message = "¡Triturador %d!"

	L.link_warning = "¡Estás enlazado!"

	L.gaze_bar = "~Mirada CD"
	L.empower_bar = "~Sombras potenciadas CD"

	L.guardian_message = "¡Guardian %d!"

	L.empowericon_message = "¡Sombras potenciadas se desvanecen!"

	L.roar_warning = "¡Rugido en 5seg!"
	L.roar_bar = "Próximo rugido"
end
