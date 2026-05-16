-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "frFR")
if L then
	L.bone_spike = "Pointe d'os" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "frFR")
if L then
	L.touch = "Toucher"
	L.deformed_fanatic = "Fanatique déformé" -- NPC ID 38135
	L.empowered_adherent = "Adhérent investi" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "frFR")
if L then
	L.adds_trigger_alliance = "Saccageurs, sergents, à l'attaque !"
	L.adds_trigger_horde = "Soldats, sergents, à l'attaque !"

	L.mage = "Mage"
	L.mage_desc = "Prévient quand un mage apparaît pour congeler vos canons."
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	L.warmup_trigger_alliance = "Faites chauffer les moteurs"
	L.warmup_trigger_horde = "Levez%-vous, fils et filles"

	L.disable_trigger_alliance = "Mes frères et sœurs, en avant"
	L.disable_trigger_horde = "Sus au roi%-liche"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "frFR")
if L then
	L.blood_beast = "Bête de sang" -- NPC ID 38508

	L.warmup_alliance = "Bon allez, on se bouge ! En route -"
	L.warmup_horde = "Kor'krons, en route ! Champions, surveillez bien vos arrières. Le Fléau a été -"
end

L = BigWigs:NewBossLocale("Blood Prince Council", "frFR")
if L then
	L.switch_message = "Nouvelle cible : %s"
	L.switch_bar = "~Prochain chgt de cible"

	L.empowered_flames = "L'Embrasement surpuissant"

	L.empowered_shock_message = "Vortex de choc surpuissant en incantation !"
	L.regular_shock_message = "Vortex de choc"
	L.shock_bar = "~Prochain Vortex"

	L.iconprince = "Crâne sur le prince surpuissant"
	L.iconprince_desc = "Place l'icône de raid principale sur le prince de sang actuellement surpuissant (nécessite d'être assistant ou mieux)."

	L.prison_message = "Prison de l'ombre x%d !"
end

L = BigWigs:NewBossLocale("Festergut", "frFR")
if L then
	L.engage_trigger = "On joue ?"

	L.inhale_bar = "Inhalation %d"
	L.blight_warning = "Chancre âcre dans ~5 sec. !"
	L.ball_message = "Arrivée d'une Gelée malléable !"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "frFR")
if L then
	L.engage_trigger = "Ce n'est pas une décision... très sage." -- à vérifier

	L.shadow = "Les ombres"
	L.shadow_message = "Ombres"
	L.shadow_bar = "Prochaines Ombres"

	L.feed_message = "Besoin de se nourrir imminent !"

	L.pact_message = "Pacte"
	L.pact_bar = "Prochain Pacte"

	L.phase_message = "Arrivée d'une phase aérienne !"
	L.phase1_bar = "Retour sur le sol"
	L.phase2_bar = "Phase aérienne"
end

L = BigWigs:NewBossLocale("The Lich King", "frFR")
if L then
	L.warmup_trigger = "Voici donc qu’arrive la fameuse justice de la Lumière ?"
	L.engage_trigger = "Je vais te laisser en vie, que tu sois témoin de la fin, Fordring."

	L.horror_message = "Horreur titubante"
	L.horror_bar = "~Prochaine Horreur"

	L.valkyr_message = "Val'kyr(s)"
	L.valkyr_bar = "Prochaine(s) val'kyr(s)"
	L.valkyrhug_message = "Étreinte val'kyrienne"

	L.cave_phase = "Phase Deuillegivre"
	L.last_phase_bar = "Dernière phase"

	L.frenzy_bar = "%s s'enrage !"
	L.frenzy_survive_message = "%s survivra après la Peste"
	L.frenzy_message = "Horreur enragée !"
	L.frenzy_soon_message = "5 sec. avant Enrager !"

	--L.custom_on_valkyr_marker = "Val'kyr marker"
	--L.custom_on_valkyr_marker_desc = "Mark the Val'kyr with {rt8}{rt7}{rt6}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over the Val'kyr is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Professor Putricide", "frFR")
if L then
	L.engage_trigger = "Grande nouvelle, mes amis ! Je crois que j'ai mis au point une peste qui va détruire toute vie sur Azeroth !"

	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre change de phase."
	L.phase_warning = "Phase %d imminente !"
	L.phase_bar = "Prochaine phase"

	L.ball_bar = "Prochaine Gelée malléable"
	L.ball_say = "Gelée malléable moi !"

	L.experiment_message = "Arrivée d'une nouvelle expérience !"
	L.experiment_heroic_message = "Arrivée de nouvelles expériences !"
	L.experiment_bar = "Prochaine expérience"
	L.blight_message = "Nuage de gaz"
	L.violation_message = "Limon volatil"

	L.gasbomb_bar = "D'autres Bombes de gaz !"
	L.gasbomb_message = "Bombes de gaz !"
end

L = BigWigs:NewBossLocale("Rotface", "frFR")
if L then
	L.engage_trigger = "Wiiiiiiiiiii !"

	L.infection_message = "Infection"

	L.ooze = "Fusion de limons"
	L.ooze_desc = "Prévient quand un limon fusionne avec un autre."
	L.ooze_message = "Limon %dx"

	L.spray_bar = "Prochaine Projection"
end

L = BigWigs:NewBossLocale("Sindragosa", "frFR")
if L then
	L.engage_trigger = "Qu'il est stupide d'être venus ici."

	L.phase2 = "Phase 2"
	L.phase2_desc = "Prévient quand la rencontre passe en phase 2 à 35%."
	L.phase2_trigger = "Sentez maintenant le pouvoir infini de mon maître, et désespérez !"
	L.phase2_message = "Phase 2 !"

	L.airphase = "Phase aérienne"
	L.airphase_desc = "Prévient quand Sindragosas décolle."
	L.airphase_trigger = "Votre incursion s'arrête ici ! Personne n'en réchappera !"
	L.airphase_message = "Phase aérienne !"
	L.airphase_bar = "Prochaine phase aérienne"

	L.boom_message = "Explosion !"
	L.boom_bar = "Explosion"

	L.instability_message = "Magie débridée x%d !"
	L.chilled_message = "Transi jusqu'aux os x%d !"
	L.buffet_message = "Rafale mystique x%d !"
	L.buffet_cd = "Prochaine Rafale mystique"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "frFR")
if L then
	L.engage_trigger = "Des intrus se sont introduits dans le sanctuaire. Hâtez-vous d'achever le dragon vert ! Ne gardez que les os et les tendons, pour la réanimation !"

	L.portal = "Portails du Cauchemar"
	L.portal_desc = "Prévient quand Valithria ouvre des portails."
	L.portal_message = "Portails actifs !"
	L.portal_bar = "Arrivée des portails"
	L.portalcd_message = "Portails %d ouverts dans 14 sec. !"
	L.portalcd_bar = "Prochains portails %d"
	L.portal_trigger = "J'ai ouvert un portail vers le Rêve. Vous y trouverez votre salut, héros…"

	L.suppresser = "Apparition de Suppresseurs"
	L.suppresser_desc = "Prévient quand une meute de Suppresseurs apparaît."
	L.suppresser_message = "~Suppresseurs"

	L.blazing = "Squelette flamboyant"
	L.blazing_desc = "Délai de réapparition |cffff0000estimé|r des Squelettes flamboyants. Ce délai est sans doute imprécis, utilisez-le donc comme un repère."
	L.blazing_warning = "Squelette flamboyant imminent !"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "frFR")
if L then
	L.deathbound_ward = "Gardien lié par la mort"
	L.deathspeaker_high_priest = "Grand prêtre nécrorateur" -- NPC ID 36829
	L.putricide_dogs = "Bijou & Kifouette"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "frFR")
if L then
	L.engage_message = "Anub'arak engagé, Fouir dans 80 sec. !"
	L.engage_trigger = "Ce terreau sera votre tombeau !"

	L.unburrow_trigger = "surgit de la terre"
	L.burrow_trigger = "s'enfonce dans le sol"
	L.burrow = "Fouir"
	L.burrow_desc = "Affiche un délai de la technique Fouir d'Anub'Arak."
	L.burrow_soon = "Fouir imminent"

	L.nerubian_message = "Arrivée de fouisseurs !"
	L.nerubian_burrower = "Plus de fouisseurs"

	L.shadow_soon = "Attaque d'ombre dans ~5 sec. !"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "frFR")
if L then
	L.wipe_trigger = "Tragique…"

	L.engage_trigger = "Arrivant tout droit des plus noires et profondes cavernes des pics Foudroyés, Gormok l'Empaleur !"
	L.jormungars_trigger = "Apprêtez-vous, héros, car voici que les terreurs jumelles, Gueule-d'acide et Écaille-d'effroi, pénètrent dans l'arène !"
	L.icehowl_trigger = "L'air se gèle à l'entrée de notre prochain combattant, Glace-hurlante ! Tuez ou soyez tués, champions !"
	L.boss_incoming = "Arrivée de %s"

	L.gormok = "Gormok l’Empaleur"
	L.jormungars = "Gueule-d’acide et Ecaille-d’effroi"
	L.icehowl = "Glace-Hurlante"

	-- Gormok
	L.snobold = "Frigbold"
	L.snobold_desc = "Prévient quand un joueur a un frigbold sur sa tête."

	-- Jormungars
	L.submerge = "Dans le sol"
	L.submerge_desc = "Prévient quand les vers s'enfoncent dans le sol."
	L.spew = "Crachement acide/de lave"
	L.spew_desc = "Prévient de l'arrivée des Crachements acides/de lave."
	L.sprays = "Jets"
	L.sprays_desc = "Prévient de l'arrivée du prochain Jet paralysant et brûlant."
	L.slime_message = "Bave sur VOUS !"
	L.burn_spell = "Bile"
	L.toxin_spell = "Toxine"
	L.spray = "Prochain Jet"

	-- Icehowl
	L.charge = "Charge furieuse"
	L.charge_desc = "Prévient quand un joueur subit les effets d'une Charge furieuse."
	L.charge_trigger = "lâche un rugissement assourdissant !$"

	L.bosses = "Boss"
	L.bosses_desc = "Prévient quand le boss suivant arrive."
end

L = BigWigs:NewBossLocale("Faction Champions", "frFR")
if L then
	L.defeat_trigger = "Une victoire tragique et dépourvue de sens."

	L["Shield on %s!"] = "Bouclier sur %s !"
	L["Bladestorming!"] = "Tempête de lames !"
	L["Hunter pet up!"] = "Familier du chasseur appelé !"
	L["Felhunter up!"] = "Chasseur corrompu invoqué !"
	L["Heroism on champions!"] = "Héroïsme sur les champions !"
	L["Bloodlust on champions!"] = "Furie sanguinaire sur les champions !"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "frFR")
if L then
	L.enable_trigger = "Misérable gnome ! Ton arrogance te perdra !"

	L.engage = "Engagement"
	L.engage_trigger = "Devant vous se tient Jaraxxus, seigneur Érédar de la Légion ardente !"
	L.engage_trigger1 = "Mais ! C'est moi qui commande, ici"

	L.adds = "Portails et volcans"
	L.adds_desc = "Prévient quand Jaraxxus invoque des portails et des volcans."

	L.incinerate_message = "Incinérer la chair"
	L.incinerate_other = "Incinérer : %s"
	L.incinerate_bar = "Prochain Incinérer"
	L.incinerate_safe = "%s est sauf !"

	L.legionflame_message = "Flamme de la Légion"
	L.legionflame_other = "Flamme : %s"
	L.legionflame_bar = "Prochaine Flamme"

	L.infernal_bar = "Apparition d'un volcan"
	L.netherportal_bar = "Apparition d'un portail"

	L.kiss_message = "Baiser de la Maîtresse sur VOUS !"
	L.kiss_interrupted = "Interrompu !"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "frFR")
if L then
	L.engage_trigger1 = "Au nom de notre ténébreux maître. Pour le roi-liche. Vous. Allez. Mourir."

	L.vortex_or_shield_cd = "Prochain Vortex ou Bouclier"
	L.next = "Prochain Vortex ou Bouclier"
	L.next_desc = "Prévient quand le prochain Vortex ou Bouclier arrive."

	L.vortex = "Vortex"
	L.vortex_desc = "Prévient quand les jumelles commencent à incanter des Vortex."

	L.shield = "Bouclier des ténèbres/des lumières"
	L.shield_desc = "Prévient de l'arrivée des Boucliers des ténèbres/des lumières."

	L.touch = "Toucher des ténèbres/de lumière"
	L.touch_desc = "Prévient quand un joueur subit les effets d'un Toucher des ténèbres ou de lumière."
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "frFR")
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
	L.teleport_yell_trigger = "Votre fin est venue."
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
	L.adds_yell_trigger = "Levez-vous, soldats" -- Levez-vous, soldats ! Levez-vous et combattez une fois encore !
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
	L[15929] = "Stalagg"
	L[15930] = "Feugen"

	L.stage2_yell_trigger1 = "Manger… tes… os…"
	L.stage2_yell_trigger2 = "Casser... toi !"
	L.stage2_yell_trigger3 = "Tuer…"

	L.add_death_emote_trigger = "%s meurt."
	L.overload_emote_trigger = "%s entre en surcharge !"
	--L.add_revive_emote_trigger = "%s is jolted back to life!"

	L.polarity_extras = "Alertes supplémentaires pour le positionnement du changement de polarité"

	L.custom_select_charge_position = "Première position"
	L.custom_select_charge_position_desc = "Où se déplacer après le premier changement de polarité."
	L.custom_select_charge_position_value1 = "|cffff2020Charge négative (-)|r à GAUCHE, |cff2020ffCharge positive (+)|r à DROITE"
	L.custom_select_charge_position_value2 = "|cff2020ffCharge positive (+)|r à GAUCHE, |cffff2020Charge négative (-)|r à DROITE"

	L.custom_select_charge_movement = "Déplacement"
	L.custom_select_charge_movement_desc = "La stratégie de déplacement que votre groupe utilise."
	L.custom_select_charge_movement_value1 = "Courir |cff20ff20À TRAVERS|r le boss"
	L.custom_select_charge_movement_value2 = "Courir |cff20ff20DANS LE SENS DES AIGUILLES D'UNE MONTRE|r autour du boss"
	L.custom_select_charge_movement_value3 = "Courir |cff20ff20DANS LE SENS INVERSE DES AIGUILLES D'UNE MONTRE|r autour du boss"
	L.custom_select_charge_movement_value4 = "Quatre groupes 1 : Changement de polarité à |cff20ff20DROITE|r, même polarité à |cff20ff20GAUCHE|r"
	L.custom_select_charge_movement_value5 = "Quatre groupes 2 : Changement de polarité à |cff20ff20GAUCHE|r, même polarité à |cff20ff20DROITE|r"

	L.custom_off_charge_graphic = "Flèche graphique"
	L.custom_off_charge_graphic_desc = "Affiche une flèche graphique."
	L.custom_off_charge_text = "Flèches de texte"
	L.custom_off_charge_text_desc = "Affiche un message supplémentaire."
	L.custom_off_charge_voice = "Alerte vocale"
	L.custom_off_charge_voice_desc = "Joue un alerte vocale."

	--Translate these to get locale sound files!
	L.left = "<--- ALLEZ À GAUCHE <--- ALLEZ À GAUCHE <---"
	L.right = "---> ALLEZ À DROITE ---> ALLEZ À DROITE --->"
	L.swap = "^^^^ CHANGER DE CÔTÉS ^^^^ CHANGER DE CÔTÉS ^^^^"
	L.stay = "==== NE BOUGEZ PAS ==== NE BOUGEZ PAS ===="

	L.chat_message = "Le mod Thaddius prend en charge l'affichage de flèches directionnelles et la lecture de voix. Ouvrez les options pour les configurer."
end

-- Northrend

L = BigWigs:NewBossLocale("Onyxia", "frFR")
if L then
	L.phase1_trigger = "Quelle chance !"
	L.phase2_trigger = "un seul coup !"
	L.phase3_trigger = "Il semble que vous ayez besoin d'une autre leçon, mortels !"

	L.deep_breath = "Souffle profond"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "frFR")
if L then
	L.stomp_message = "Piétinement - Empaler imminent !"
	L.stomp_warning = "Piétinement probable dans ~5 sec. !"

	L.charge = "Empaler"
	L.charge_desc = "Prévient quand un joueur subit les effets d'un Empaler."
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "frFR")
if L then
	L.overcharge_message = "Un séide est surchargé !"
	L.overcharge_bar = "Explosion"

	L.custom_on_overcharge_mark = "Overcharge marker"
	L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "frFR")
if L then
	L.breath_bar = "Souffle %d"
	L.breath_message = "Souffle %d imminent !"
end

L = BigWigs:NewBossLocale("Malygos", "frFR")
if L then
	L.sparks = "Etincelle de puissance"
	L.sparks_desc = "Prévient quand une Etincelle de puissance apparait."
	L.sparks_message = "Etincelle de puissance apparue !"
	L.sparks_warning = "Etincelle de puissance dans ~5 sec. !"

	L.sparkbuff = "Etincelle de puissance sur Malygos"
	L.sparkbuff_desc = "Prévient quand Malygos récupère une Etincelle de puissance."
	L.sparkbuff_message = "Malygos gagne Etincelle de puissance !"

	L.vortex = "Vortex"
	L.vortex_desc = "Prévient de l'arrivée des Vortex."
	L.vortex_message = "Vortex !"
	L.vortex_warning = "Vortex probable dans ~5 sec. !"
	L.vortex_next = "Recharge Vortex"

	L.breath = "Inspiration profonde"
	L.breath_desc = "Prévient quand Malygos inspire profondément."
	L.breath_message = "Inspiration profonde !"
	L.breath_warning = "Inspiration profonde dans ~5 sec. !"

	L.surge = "Vague de puissance"
	L.surge_desc = "Prévient quand un joueur subit les effets de la Vague de puissance."
	L.surge_you = "Vague de puissance sur VOUS !"
	L.surge_trigger = "%s fixe le regard sur vous !"

	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre entre dans une nouvelle phase."
	L.phase2_warning = "Phase 2 imminente !"
	L.phase2_trigger = "Je pensais mettre rapidement fin à vos existences"
	L.phase2_message = "Phase 2 - Seigneurs du Nexus & Scions de l'Éternité !"
	L.phase2_end_trigger = "ASSEZ ! Si c'est la magie d'Azeroth que vous voulez, alors vous l'aurez !"
	L.phase3_warning = "Phase 3 imminente !"
	L.phase3_trigger = "Vos bienfaiteurs font enfin leur entrée, mais ils arrivent trop tard !"
	L.phase3_message = "Phase 3 !"
end

L = BigWigs:NewBossLocale("Sartharion", "frFR")
if L then
	L.engage_trigger = "Ces œufs sont sous ma responsabilité. Je vous ferai brûler avant de vous laisser y toucher !"
	L.tsunami_trigger = "La lave qui entoure %s bouillonne !"
	L.twilight_trigger_vesperon = "Un disciple de Vespéron apparaît dans le crépuscule !"
	L.twilight_trigger_shadron = "Un disciple d’Obscuron apparaît dans le crépuscule !"

	L.drakes = "Arrivée des drakes"
	L.drakes_desc = "Prévient quand chaque drake se joint au combat."

	-- Adds
	L.shadron = "Obscuron"
	L.tenebron = "Ténébron"
	L.vesperon = "Vespéron"
	L.lava_blaze = "Brasier de lave" -- NPC 30643
	L.acolyte_shadron = "Acolyte d'Obscuron" -- NPC 31218
	L.acolyte_vesperon = "Acolyte de Vespéron" -- NPC 31219
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "frFR")
if L then
	L.whiteout_bar = "Blanc aveuglant %d"
	L.whiteout_message = "Blanc aveuglant %d imminent !"

	L.freeze_message = "Sol givrant"
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "frFR")
if L then
	L.twilight_cutter_emote_trigger = "sphères" -- Les sphères volantes rayonnent d’énergie noire !
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "frFR")
if L then
	L.baltharus = "Baltharus l'Enfant de la guerre" -- NPC 39751
	L.saviana = "Saviana Ragefeu" -- NPC 39747
	L.zarithrian = "Général Zarithrian" -- NPC 39746

	L.adds_yell_trigger = "Serviteurs, réduisez-les en cendres !"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "frFR")
if L then
	L.swarm_message = "Essaim gardien"

	L.defender = "Défenseur farouche"
	L.defender_desc = "Prévient quand le Défenseur farouche apparaît et quand il perd une vie."
	L.defender_message = "Défenseur actif %d/9 !"
end

L = BigWigs:NewBossLocale("Freya", "frFR")
if L then
	L.wave = "Vagues"
	L.wave_desc = "Prévient de l'arrivée des vagues."
	L.wave_bar = "Prochaine vague"
	L.conservator_trigger = "Eonar, ta servante a besoin d'aide !"
	L.detonate_trigger = "La nuée des éléments va vous submerger !"
	L.elementals_trigger = "Mes enfants, venez m'aider !"
	L.tree_trigger = "Un |cFF00FFFFdon de la Lieuse-de-vie|r commence à pousser !"
	L.conservator_message = "Ancien conservateur !"
	L.detonate_message = "Flagellants explosifs !"
	L.elementals_message = "Élémentaires !"

	L.tree = "Cadeau d'Eonar"
	L.tree_desc = "Prévient quand Freya fait apparaître un Cadeau d'Eonar."
	L.tree_message = "Un arbre pousse !"

	L.fury_message = "Fureur de la nature"

	L.tremor_warning = "Tremblement de terre imminent !"
	L.tremor_bar = "~Prochain Tremblement"
	L.energy_message = "Energie instable sur VOUS !"
	L.sunbeam_message = "Rayons de soleil actif !"
	L.sunbeam_bar = "~Prochains Rayons de soleil"
end

L = BigWigs:NewBossLocale("Hodir", "frFR")
if L then
	L.hardmode = "Jouons à casse-cache"
	L.hardmode_desc = "Affiche le délai avant qu'Hodir ne détruise sa cache rare."
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "frFR")
if L then
	L.brittle_message = "Un Assemblage est devenu Fragile !"
end

L = BigWigs:NewBossLocale("The Iron Council", "frFR")
if L then
	L.stormcaller_brundir = "Mande-foudre Brundir"
	L.steelbreaker = "Brise-acier"
	L.runemaster_molgeim = "Maître des runes Molgeim"

	L.summoning_message = "Arrivée des élémentaires !"

	L.chased_other = "%s est poursuivi(e) !"
	L.chased_you = "VOUS êtes poursuivi(e) !"
end

L = BigWigs:NewBossLocale("Kologarn", "frFR")
if L then
	L.arm = "Destruction des bras"
	L.arm_desc = "Prévient quand le bras gauche et/ou droit est détruit."
	L.left_dies = "Bras gauche détruit"
	L.right_dies = "Bras droit détruit"
	L.left_wipe_bar = "Repousse bras gauche"
	L.right_wipe_bar = "Repousse bras droit"

	L.eyebeam = "Rayon de l'oeil"
	L.eyebeam_desc = "Prévient quand un Rayon de l'oeil focalisé est incanté."
end

L = BigWigs:NewBossLocale("Mimiron", "frFR")
if L then
	L.phase = "Phases"
	L.phase_desc = "Prévient quand la rencontre change de phase."
	L.engage_warning = "Phase 1"
	L.engage_trigger = "^Nous n'avons pas beaucoup de temps, les amis !"
	L.phase2_warning = "Arrivée de la phase 2"
	L.phase2_trigger = "^MERVEILLEUX ! Résultats parfaitement formidables !"
	L.phase3_warning = "Arrivée de la phase 3"
	L.phase3_trigger = "^Merci, les amis !"
	L.phase4_warning = "Arrivée de la phase 4"
	L.phase4_trigger = "^Fin de la phase d'essais préliminaires"
	L.phase_bar = "Phase %d"

	L.hardmode_trigger = "^Mais, pourquoi"

	L.plasma_warning = "Plasma en incantation !"
	L.plasma_soon = "Explosion de plasma imminente !"
	L.plasma_bar = "Plasma"

	L.shock_next = "Prochain Horion"

	L.laser_soon = "Accélération !"
	L.laser_bar = "Barrage"

	L.magnetic_message = "UCA au sol !"

	L.suppressant_warning = "Arrivée d'un Coupe-flamme !"

	L.fbomb_bar = "Prochaine Bombe de givre"

	L.bomb_message = "Robo-bombe apparu !"
end

L = BigWigs:NewBossLocale("Razorscale", "frFR")
if L then
	L.ground_trigger = "Faites vite ! Elle va pas rester au sol très longtemps !"
	L.ground_message = "Tranchécaille enchaînée !"
	L.air_message = "Décollage !"

	L.harpoon = "Tourelle à harpon"
	L.harpoon_desc = "Prévient quand une tourelle à harpon est prête."
	L.harpoon_message = "Tourelle à harpon %d prête !"
	L.harpoon_trigger = "Tourelle à harpon prête à l'action !"
	L.harpoon_nextbar = "Tourelle %d"
end

L = BigWigs:NewBossLocale("Thorim", "frFR")
if L then
	L.phase2_trigger = "Des intrus ! Mortels, vous qui osez me déranger en plein divertissement allez pay - Attendez, vous -"
	L.phase3_trigger = "Avortons impertinents, vous osez me défier sur mon piédestal ? Je vais vous écraser moi-même !"

	L.hardmode = "Sifonné"
	L.hardmode_desc = "Affiche le délai avant que Sif ne disparaisse."
	L.hardmode_warning = "Sif a disparue"

	L.barrier_message = "Barrière runique actif !"

	L.charge_message = "Charge de foudre x%d !"
	L.charge_bar = "Charge %d"
end

L = BigWigs:NewBossLocale("General Vezax", "frFR")
if L then
	L.surge_bar = "Vague %d"

	L.animus = "Animus de saronite"
	L.animus_desc = "Prévient quand l'Animus de saronite apparaît."
	L.animus_trigger = "Les vapeurs saronitiques s'amassent et tourbillonnent violemment pour former un amas monstrueux !"
	L.animus_message = "Animus apparu !"

	L.vapor = "Vapeurs de saronite"
	L.vapor_desc = "Prévient quand des Vapeurs de saronite apparaissent."
	L.vapor_message = "Vapeurs de saronite %d !"
	L.vapor_bar = "Vapeurs"
	L.vapor_trigger = "Un nuage de vapeurs saronitiques se forme non loin !"

	L.vaporstack = "Cumul des Vapeurs"
	L.vaporstack_desc = "Prévient quand vous avez 5 cumuls ou plus de Vapeurs de saronite."
	L.vaporstack_message = "Vapeurs de saronite x%d !"

	L.crash_say = "Déferlante d'ombre"

	L.mark_message = "Marque"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "frFR")
if L then
	L.lightbomb_other = "Lumière"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "frFR")
if L then
	L.engage_trigger = "^Il sera bientôt temps de"
	L.phase2_trigger = "^Je suis le rêve éveillé"
	L.phase3_trigger = "^Contemplez le vrai visage de la mort"

	L.portal = "Portail"
	L.portal_desc = "Prévient de l'arrivée des portails."
	L.portal_message = "Portails ouverts !"
	L.portal_bar = "Prochains portails"

	L.fervor_message = "Ferveur sur %s !"

	L.sanity_message = "Vous allez devenir fou !"

	L.weakened = "Étourdi"
	L.weakened_desc = "Prévient quand Yogg-Saron est étourdi."
	L.weakened_message = "%s est étourdi !"

	L.madness_warning = "Susciter la folie dans 10 sec. !"
	L.malady_message = "Mal" -- short for Malady of the Mind (63830)

	L.tentacle = "Tentacule écraseur"
	L.tentacle_desc = "Prévient quand un Tentacule écraseur apparaît."
	L.tentacle_message = "Écraseur %d !"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = "Votre cerveau est lié !"

	L.guardian_message = "Gardien %d !"

	L.roar_warning = "Rugissement dans 5 sec. !"
	L.roar_bar = "Prochain Rugissement"
end
