local L = BigWigs:NewBossLocale("Anub'Rekhan", "frFR")
if not L then return end
if L then
	L.add = "Gardien des cryptes"
	L.locust = "Locuste"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "frFR")
if L then
	L.silencewarn = "Réduite au silence !"
	L.silencewarn5sec = "Fin du silence dans 5 sec."
	L.silence = "Silence"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "frFR")
if L then
	L.phase1_trigger1 = "Dans votre folie, vous avez provoqué votre propre mort."
	L.phase1_trigger2 = "Teamanare shi rikk mannor rikk lok karkun" -- Curse of Tongues
	L.phase2_trigger = "J'ai attendu assez longtemps. Maintenant, vous affrontez le moissonneur d'âmes."

	L.add = "Arrivée des renforts"
	L.add_desc = "Prévient quand des renforts se joignent au combat."

	L.add_death = "Mort des renforts"
	L.add_death_desc = "Prévient quand un des renforts meurt."

	L.riderdiewarn = "Cavalier éliminé !"
	L.dkdiewarn = "Chevalier éliminé !"

	L.wave = "%d/23 : %s"

	L.trawarn = "Jeune recrue dans 3 sec."
	L.dkwarn = "Chevalier de la mort dans 3 sec."
	L.riderwarn = "Cavalier dans 3 sec."

	L.trabar = "Jeune recrue (%d)"
	L.dkbar = "Chevalier de la mort (%d)"
	L.riderbar = "Cavalier (%d)"

	--L.gate = "Gate Open!"
	--L.gatebar = "Gate opens"

	L.phase_soon = "Arrivée de Gothik dans 10 sec."

	L.engage_message = "Gothik le moissonneur engagé !"
end

L = BigWigs:NewBossLocale("Grobbulus", "frFR")
if L then
	L.injection = "Injection"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "frFR")
if L then
	L.teleport_trigger = "Votre fin est venue."

	L.teleport = "Téléportation"
	L.teleport_desc = "Prévient quand Heigan se téléporte."
	L.teleport_1min_message = "Téléportation dans 1 min."
	L.teleport_30sec_message = "Téléportation dans 30 sec."
	L.teleport_10sec_message = "Téléportation dans 10 sec. !"
	L.on_platform_message = "Téléportation ! Sur la plate-forme pendant 45 sec. !"

	L.to_floor_30sec_message = "De retour dans 30 sec."
	L.to_floor_10sec_message = "De retour dans 10 sec. !"
	L.on_floor_message = "De retour sur le sol ! 90 sec. avant la prochaine téléportation !"

	L.teleport_bar = "Téléportation !"
	L.back_bar = "Retour sur le sol !"
end

L = BigWigs:NewBossLocale("The Four Horsemen", "frFR")
if L then
	L.mark = "Marque"
	L.mark_desc = "Prévient de l'arrivée des marques."

	L.engage_message = "Les 4 cavaliers engagés !"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "frFR")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Appartements de Kel'Thuzad"

	L.phase1_trigger = "Serviteurs, valets et soldats des ténèbres glaciales ! Répondez à l'appel de Kel'Thuzad !"
	L.phase2_trigger1 = "Faites vos prières !"
	L.phase2_trigger2 = "Hurlez et expirez !"
	L.phase2_trigger3 = "Votre fin est proche !"
	L.phase3_trigger = "Maître, j'ai besoin d'aide !"
	L.guardians_trigger = "Très bien. Guerriers des terres gelées, relevez-vous ! Je vous ordonne de combattre, de tuer et de mourir pour votre maître ! N'épargnez personne !"

	L.phase2_warning = "Phase 2 - Arrivée de Kel'Thuzad !"
	L.phase2_bar = "Kel'Thuzad actif !"

	L.phase3_warning = "Phase 3 - Gardiens dans ~15 sec. !"

	L.guardians = "Apparition des gardiens"
	L.guardians_desc = "Prévient de l'arrivée des gardiens en phase 3."
	L.guardians_warning = "Arrivée des gardiens dans ~10 sec. !"
	L.guardians_bar = "Arrivée des gardiens !"

	L.engage_message = "Kel'Thuzad engagé !"
end

L = BigWigs:NewBossLocale("Loatheb", "frFR")
if L then
	L.doomtime_bar = "Malé. toutes les 15 sec."
	L.doomtime_now = "La Malédiction inévitable arrive désormais toutes les 15 sec. !"

	L.spore_warn = "Spore (%d)"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "frFR")
if L then
	L.add_trigger = "Levez-vous, soldats ! Levez-vous et combattez une fois encore !"

	L.teleport = "Téléportation"
	L.teleport_desc = "Prévient quand Noth se téléporte."
	L.teleport_balcony = "Téléportation ! Il est sur le balcon !"
	L.teleport_room = "Téléportation ! De retour dans la salle !"

	L.curse_explosion = "Explosion des malé. !"
	L.curse_warn = "Malédictions !"
	L.curse_10secwarn = "Malédictions dans ~10 sec."
	L.curse_bar = "Prochaines malédictions"

	L.wave = "Invocation de squelettes"
	L.wave_desc = "Prévient de l'arrivée des vagues."
	L.wave1 = "1ère vague"
	L.wave2 = "2ème vague"
end

L = BigWigs:NewBossLocale("Maexxna", "frFR")
if L then
	L.webspraywarn30sec = "Entoilage dans 10 sec."
	L.webspraywarn20sec = "Entoilage ! 10 sec. avant les araignées !"
	L.webspraywarn10sec = "Araignées ! 10 sec. avant le Jet de rets !"
	L.webspraywarn5sec = "Jet de rets dans 5 sec. !"

	L.enragewarn = "Frénésie !"
	L.enragesoonwarn = "Frénésie imminente !"

	L.cocoons = "Entoilage"
	L.spiders = "Araignées"
end

L = BigWigs:NewBossLocale("Sapphiron", "frFR")
if L then
	L.airphase_trigger = "Saphiron s'envole !"
	L.deepbreath_trigger = "%s inspire profondément."

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	L.ice_bomb = "Bombe de glace"
	L.ice_bomb_warning = "Arrivée d'une Bombe de glace !"
	L.ice_bomb_bar = "Impact Bombe de glace "

	L.icebolt_say = "Je suis un bloc !"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "frFR")
if L then
	L.understudy = "Doublure de chevalier de la mort"

	L.shout_warning = "Cri perturbant dans 5 sec. !"
	L.taunt_warning = "Provocation prête dans 5 sec. !"
	L.shieldwall_warning = "Barrière d'os terminée dans 5 sec. !"
end

L = BigWigs:NewBossLocale("Thaddius", "frFR")
if L then
	L.phase1_trigger1 = "Stalagg écraser toi !"
	L.phase1_trigger2 = "À manger pour maître !"
	L.phase2_trigger1 = "Manger… tes… os…"
	L.phase2_trigger2 = "Casser... toi !"
	L.phase2_trigger3 = "Tuer…"

	L.add_death_trigger = "%s meurt."
	L.overload_trigger = "%s entre en surcharge !"

	L.polarity_changed = "La polarité a changé !"
	L.polarity_nochange = "Même polarité !"
	L.polarity_first_positive = "Vous êtes POSITIF !"
	L.polarity_first_negative = "Vous êtes NÉGATIF !"

	L.throw = "Lancer"
	L.throw_desc = "Prévient quand les tanks sont lancés d'une plate-forme à l'autre."
	L.throw_warning = "Lancer dans ~5 sec. !"

	--L.polarity_extras = "Additional alerts for Polarity Shift positioning"

	--L.custom_off_select_charge_position = "First position"
	--L.custom_off_select_charge_position_desc = "Where to move to after the first Polarity Shift."
	--L.custom_off_select_charge_position_value1 = "|cffff2020Negative (-)|r are LEFT, |cff2020ffPositive (+)|r are RIGHT"
	--L.custom_off_select_charge_position_value2 = "|cff2020ffPositive (+)|r are LEFT, |cffff2020Negative (-)|r are RIGHT"

	--L.custom_off_select_charge_movement = "Movement"
	--L.custom_off_select_charge_movement_desc = "The movement strategy your group uses."
	--L.custom_off_select_charge_movement_value1 = "Run |cff20ff20THROUGH|r the boss"
	--L.custom_off_select_charge_movement_value2 = "Run |cff20ff20CLOCKWISE|r around the boss"
	--L.custom_off_select_charge_movement_value3 = "Run |cff20ff20COUNTER-CLOCKWISE|r around the boss"
	--L.custom_off_select_charge_movement_value4 = "Four camps 1: Polarity changed moves |cff20ff20RIGHT|r, same polarity moves |cff20ff20LEFT|r"
	--L.custom_off_select_charge_movement_value5 = "Four camps 2: Polarity changed moves |cff20ff20LEFT|r, same polarity moves |cff20ff20RIGHT|r"

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
end
