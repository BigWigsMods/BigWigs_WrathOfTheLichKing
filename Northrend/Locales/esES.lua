local L = BigWigs:NewBossLocale("Halion", "esES") or BigWigs:NewBossLocale("Halion", "esMX")
if not L then return end
if L then
	L.engage_trigger = "Vuestro mundo está al borde de la aniquilación."

	L.phase_two_trigger = "En el reino del crepúsculo solo encontraréis sufrimiento. ¡Entrad si os atrevéis!"

	L.twilight_cutter_trigger = "¡Las esferas que orbitan emiten energía oscura!"
	L.twilight_cutter_bar = "~Rayos Láser"
	L.twilight_cutter_warning = "¡Lanzando Rayos Láser!"

	L.fire_damage_message = "¡Tus pies están ardiendo!"
	L.fire_message = "Bomba de Fuego"
	L.shadow_message = "Bomba de Sombras"

	L.meteorstrike_yell = "¡Los cielos arden!"
	L.meteorstrike_bar = "Golpe de meteorito"
	L.meteor_warning_message = "¡Lanzando Golpe de meteorito!"
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "esES") or BigWigs:NewBossLocale("Toravon the Ice Watcher", "esMX")
if L then
	L.whiteout_bar = "Tormenta de nieve %d"
	L.whiteout_message = "¡Tormenta de nieve %d pronto!"

	L.freeze_message = "Congelado"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "esES") or BigWigs:NewBossLocale("Archavon the Stone Watcher", "esMX")
if L then
	--L.stomp_message = "Stomp - Charge Inc!"
	--L.stomp_warning = "Possible Stomp in ~5sec!"

	--L.charge = "Charge"
	--L.charge_desc = "Warn about Charge on players."
end

L = BigWigs:NewBossLocale("Malygos", "esES") or BigWigs:NewBossLocale("Malygos", "esMX")
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

L = BigWigs:NewBossLocale("Sartharion", "esES") or BigWigs:NewBossLocale("Sartharion", "esMX")
if L then
	--L.engage_trigger = "It is my charge to watch over these eggs. I will see you burn before any harm comes to them!"

	--L.tsunami = "Flame Wave"
	--L.tsunami_desc = "Warn for churning lava and show a bar."
	--L.tsunami_warning = "Wave in ~5sec!"
	--L.tsunami_message = "Flame Wave!"
	--L.tsunami_cooldown = "Wave Cooldown"
	--L.tsunami_trigger = "The lava surrounding %s churns!"

	--L.breath_cooldown = "Breath Cooldown"

	--L.drakes = "Drake Adds"
	--L.drakes_desc = "Warn when each drake add will join the fight."
	--L.drakes_incomingsoon = "%s landing in ~5sec!"

	--L.twilight = "Twilight Events"
	--L.twilight_desc = "Warn what happens in the Twilight."
	--L.twilight_trigger_tenebron = "Tenebron begins to hatch eggs in the Twilight!"
	--L.twilight_trigger_vesperon = "A Vesperon Disciple appears in the Twilight!"
	--L.twilight_trigger_shadron = "A Shadron Acolyte appears in the Twilight!"
	--L.twilight_message_tenebron = "Eggs hatching"
	--L.twilight_message = "%s add up!"

	--L.shadron = "Shadron"
	--L.tenebron = "Tenebron"
	--L.vesperon = "Vesperon"
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "esES") or BigWigs:NewBossLocale("Emalon the Storm Watcher", "esMX")
if L then
	--L.overcharge_message = "A minion is overcharged!"
	--L.overcharge_bar = "Explosion"

	--L.custom_on_overcharge_mark = "Overcharge marker"
	--L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "esES") or BigWigs:NewBossLocale("Koralon the Flame Watcher", "esMX")
if L then
	--L.breath_bar = "Breath %d"
	--L.breath_message = "Breath %d soon!"
end

L = BigWigs:NewBossLocale("Onyxia", "esES") or BigWigs:NewBossLocale("Onyxia", "esMX")
if L then
	--L.phase = "Phases"
	--L.phase_desc = "Warn for phase changes."
	--L.phase2_message = "Phase 2 incoming!"
	--L.phase3_message = "Phase 3 incoming!"

	--L.phase1_trigger = "How fortuitous"
	--L.phase2_trigger = "from above"
	--L.phase3_trigger = "It seems you'll need another lesson"

	--L.deepbreath_message = "Deep Breath incoming!"
	--L.fear_message = "Fear incoming!"
end
