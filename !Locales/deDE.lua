-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "deDE")
if L then
	L.bone_spike = "Knochenstachel" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "deDE")
if L then
	L.touch = "Berührung"
	L.deformed_fanatic = "Deformierter Fanatiker" -- NPC ID 38135
	L.empowered_adherent = "Machterfüllter Kultist" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "deDE")
if L then
	L.adds_trigger_alliance = "Häscher, Unteroffiziere, Angriff!"
	L.adds_trigger_horde = "Soldaten! Zum Angriff!"

	L.mage = "Magier"
	L.mage_desc = "Warnt, wenn ein Magier erscheint, um die Kanonen einzufrieren."
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	L.warmup_trigger_alliance = "Alle Maschinen auf Volldampf"
	L.warmup_trigger_horde = "Erhebt Euch, Söhne und Töchter"

	L.disable_trigger_alliance = "Vorwärts, Brüder und Schwestern"
	L.disable_trigger_horde = "Vorwärts zum Lichkönig"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "deDE")
if L then
	L.blood_beast = "Blutbestie" -- NPC ID 38508

	L.warmup_alliance = "Dann beeilen wir uns! Brechen wir au..."
	L.warmup_horde = "Kor'kron, Aufbruch! Champions, gebt Acht. Die Geißel ist..."
end

L = BigWigs:NewBossLocale("Blood Prince Council", "deDE")
if L then
	L.switch_message = "Ziel wechseln: %s"
	L.switch_bar = "~Ziel wechseln"

	L.empowered_flames = "Machtvolle Flammen"

	L.empowered_shock_message = "Schockvortex kommt!"
	L.regular_shock_message = "Schockzone"
	L.shock_bar = "~Nächster Schock"

	L.iconprince = "Symbol auf aktivem Prinz"
	L.iconprince_desc = "Plaziert das erste Schlachtzugs-Symbol auf dem aktiven Blutprinzen (benötigt Assistent oder höher)."

	L.prison_message = "%dx Schattengefängnis!"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "deDE")
if L then
	L.engage_trigger = "Ihr habt... unklug... gewählt."

	L.shadow = "Schatten"
	L.shadow_message = "Schatten"
	L.shadow_bar = "Nächster Schatten"

	L.feed_message = "Blutdurst stillen!"

	L.pact_message = "Pakt"
	L.pact_bar = "Nächster Pakt"

	L.phase_message = "Flugphase kommt!"
	L.phase1_bar = "Zurück am Boden"
	L.phase2_bar = "Flugphase"
end

L = BigWigs:NewBossLocale("Festergut", "deDE")
if L then
	L.engage_trigger = "Zeit für Spaß?"

	L.inhale_bar = "Einatmen %d"
	L.blight_warning = "Stechende Seuche in ~5 sek!"
	L.ball_message = "Glibber!"
end

L = BigWigs:NewBossLocale("Professor Putricide", "deDE")
if L then
	L.engage_trigger = "Ich habe eine Seuche perfektioniert"

	L.phase = "Phasen"
	L.phase_desc = "Warnt vor Phasenwechsel."
	L.phase_warning = "Phase %d bald!"
	L.phase_bar = "Nächste Phase"

	L.ball_bar = "Nächster Glibber"
	L.ball_say = "Glibber auf MIR!"

	L.experiment_message = "Schlamm kommt!"
	L.experiment_heroic_message = "Schlammer kommen!"
	L.experiment_bar = "Nächster Schlamm"
	L.blight_message = "Roter Schlamm"
	L.violation_message = "Grüner Schlamm"

	L.gasbomb_bar = "Weitere Gasbomben"
	L.gasbomb_message = "Gasbomben!"
end

L = BigWigs:NewBossLocale("Rotface", "deDE")
if L then
	L.engage_trigger = "WIIIIII!"

	L.infection_message = "Infektion"

	L.ooze = "Brühschlammer verschmelzen"
	L.ooze_desc = "Warnt, wenn Brühschlammer miteinander verschmelzen."
	L.ooze_message = "%dx Brühschlammer!"

	L.spray_bar = "~Schleimsprühen"
end

L = BigWigs:NewBossLocale("Sindragosa", "deDE")
if L then
	L.engage_trigger = "Ihr seid Narren, euch hierher zu wagen. Der eisige Wind Nordends wird eure Seelen verschlingen!"

	L.phase2 = "Phase 2"
	L.phase2_desc = "Warnt, wenn Phase 2 bei 35% beginnt."
	L.phase2_trigger = "Fühlt die grenzenlose Macht meines Meisters, und verzweifelt!!"
	L.phase2_message = "Phase 2!"

	L.airphase = "Flugphase"
	L.airphase_desc = "Warnt, wenn Sindragosa abhebt."
	L.airphase_trigger = "Euer Vormarsch endet hier! Keiner wird überleben!"
	L.airphase_message = "Flugphase kommt!"
	L.airphase_bar = "Nächste Flugphase"

	L.boom_message = "Explosion!"
	L.boom_bar = "Explosion"

	L.instability_message = "%dx Instabilität!"
	L.chilled_message = "%dx Durchgefroren!"
	L.buffet_message = "%dx Puffer!"
	L.buffet_cd = "Nächster Puffer"
end

L = BigWigs:NewBossLocale("The Lich King", "deDE")
if L then
	L.warmup_trigger = "Der vielgerühmte Streiter des Lichts ist endlich hier?"
	L.engage_trigger = "Ihr bleibt bis zum Ende am Leben, Fordring."

	L.horror_message = "Torkelnder Schrecken!"
	L.horror_bar = "~Torkelnder Schrecken"

	L.valkyr_message = "Val'kyr!"
	L.valkyr_bar = "Nächsten Val'kyr"
	L.valkyrhug_message = "Val'kyren"

	L.cave_phase = "Höhlenphase"
	L.last_phase_bar = "Letzte Phase"

	L.frenzy_bar = "%s in Raserei"
	L.frenzy_survive_message = "%s wird Seuchentick überleben!"
	L.frenzy_message = "Add Raserei!"
	L.frenzy_soon_message = "5 sek bis Raserei!"

	--L.custom_on_valkyr_marker = "Val'kyr marker"
	--L.custom_on_valkyr_marker_desc = "Mark the Val'kyr with {rt8}{rt7}{rt6}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over the Val'kyr is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "deDE")
if L then
	L.engage_trigger = "Eindringlinge im Inneren Sanktum! Beschleunigt die Vernichtung des grünen Drachen!"

	L.portal = "Alptraumportale"
	L.portal_desc = "Warnt, wenn Valithria Alptraumportale öffnet."
	L.portal_message = "Portale offen!"
	L.portal_bar = "Portale kommen"
	L.portalcd_message = "Portale %d in 14 sek offen!"
	L.portalcd_bar = "Portale %d"
	L.portal_trigger = "Ich habe ein Portal in den Traum geöffnet. Darin liegt Eure Erlösung, Helden..."

	L.suppresser = "Unterdrücker erscheinen"
	L.suppresser_desc = "Warnt, wenn eine Gruppe Unterdrücker erscheint."
	L.suppresser_message = "~Unterdrücker"

	L.blazing = "Loderndes Skelett"
	L.blazing_desc = "|cffff0000Geschätzter|r Timer für die Lodernden Skelette. Dieser Timer ist wahrscheinlich ungenau, nur als Schätzung verwenden."
	L.blazing_warning = "Loderndes Skelett bald!"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "deDE")
if L then
	L.deathbound_ward = "Todesgeweihter Wächter"
	L.deathspeaker_high_priest = "Hohepriester der Todessprecher" -- NPC ID 36829
	L.putricide_dogs = "Schatz & Stinki"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "deDE")
if L then
	L.engage_message = "Anub'arak angegriffen, Eingraben in 80 sek!"
	L.engage_trigger = "Dieser Ort wird Euch als Grab dienen!"

	L.unburrow_trigger = "entsteigt dem Boden"
	L.burrow_trigger = "gräbt sich in den Boden"
	L.burrow = "Eingraben"
	L.burrow_desc = "Zeigt Timer für Anub'araks Ein- und Ausgraben sowie für das Erscheinen der Nerubischen Gräber."
	L.burrow_soon = "Eingraben bald!"

	L.nerubian_message = "Adds kommen!"
	L.nerubian_burrower = "Weitere Adds"

	L.shadow_soon = "Schattenhieb in ~5 sek!"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "deDE")
if L then
	L.wipe_trigger = "Tragisch..."

	L.engage_trigger = "Er kommt aus den tiefsten, dunkelsten Höhlen der Sturmgipfel - Gormok der Pfähler! Voran, Helden!"
	L.jormungars_trigger = "Stählt Euch, Helden, denn die Zwillingsschrecken Ätzschlund und Schreckensmaul erscheinen in der Arena!"
	L.icehowl_trigger = "Mit der Ankündigung unseres nächsten Kämpfers gefriert die Luft selbst: Eisheuler! Tötet oder werdet getötet, Champions!"
	L.boss_incoming = "%s kommt"

	L.gormok = "Gormok der Pfähler"
	L.jormungars = "Ätzschlund und Schreckensmaul"
	L.icehowl = "Eisheuler"

	-- Gormok
	L.snobold = "Schneebold"
	L.snobold_desc = "Warnt davor, wer einen Schneebold auf seinem Kopf hat."

	-- Jormungars
	L.submerge = "Eingraben"
	L.submerge_desc = "Zeigt die Zeit bis zum nächsten Eingraben der Würmer."
	L.spew = "Ätzender/Geschmolzener Auswurf"
	L.spew_desc = "Warnt vor Ätzender/Geschmolzener Auswurf."
	L.sprays = "Sprühen"
	L.sprays_desc = "Zeigt Zeitleisten für Paralysierendes und Brennendes Sprühen."
	L.slime_message = "Schleimpfütze auf DIR!"
	L.burn_spell = "Brennende Galle"
	L.toxin_spell = "Paralysierendes Toxin"
	L.spray = "Sprühen"

	-- Icehowl
	L.charge = "Wütender Ansturm"
	L.charge_desc = "Warnt vor Wütender Ansturm auf Spielern."
	L.charge_trigger = "zornig an"

	L.bosses = "Bosse"
	L.bosses_desc = "Warnt, wann die nachfolgenden Bosse eintreffen."
end

L = BigWigs:NewBossLocale("Faction Champions", "deDE")
if L then
	L.defeat_trigger = "Ein tragischer Sieg. Wir wurden schwächer durch die heutigen Verluste. Wer außer dem Lichkönig profitiert von solchen Torheiten? Große Krieger gaben ihr Leben. Und wofür? Die wahre Bedrohung erwartet uns noch - der Lichkönig erwartet uns alle im Tod."

	L["Shield on %s!"] = "Schild: %s!"
	L["Bladestorming!"] = "Klingensturm!"
	L["Hunter pet up!"] = "Jäger Pet da!"
	L["Felhunter up!"] = "Teufelsjäger da!"
	L["Heroism on champions!"] = "Heldentum auf Champions!"
	L["Bloodlust on champions!"] = "Kampfrausch auf Champions!"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "deDE")
if L then
	L.enable_trigger = "Unbedeutender Gnom! Deine Arroganz wird dir zum Verhängnis!"

	L.engage = "Angegriffen"
	L.engage_trigger = "^Ihr steht vor Jaraxxus"
	L.engage_trigger1 = "Aber ich habe hier die Kontrollehhh..."

	L.adds = "Portale und Vulkane"
	L.adds_desc = "Zeigt einen Timer und warnt vor der Beschwörung der Portale und Vulkane."

	L.incinerate_message = "Einäschern"
	L.incinerate_other = "Einäschern: %s"
	L.incinerate_bar = "~Einäschern"
	L.incinerate_safe = "%s ist sicher!"

	L.legionflame_message = "Legionsflamme"
	L.legionflame_other = "Legionsflamme: %s"
	L.legionflame_bar = "~Legionsflamme"

	L.infernal_bar = "Vulkan kommt"
	L.netherportal_bar = "Netherportal kommt"

	L.kiss_message = "Kuss auf DIR!"
	L.kiss_interrupted = "Unterbrochen!"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "deDE")
if L then
	L.engage_trigger1 = "Im Namen unseres dunklen Meisters. Für den Lichkönig. Ihr. Werdet. Sterben."

	L.vortex_or_shield_cd = "~Vortex/Schild"
	L.next = "Vortex/Schild"
	L.next_desc = "Warnt vor dem nächsten Vortex/Schild."

	L.vortex = "Vortex"
	L.vortex_desc = "Warnt, wenn die Zwillinge anfangen, einen Vortex zu wirken."

	L.shield = "Schild der Nacht/Licht"
	L.shield_desc = "Warnt bei Schild der Nacht/Licht."

	L.touch = "Berührung der Nacht/Licht"
	L.touch_desc = "Warnt bei Berührung der Nacht/Licht."
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "deDE")
if L then
	L.add = "Gruftwache"
	L.locust = "Heuschrecke"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "deDE")
if L then
	L.silencewarn = "Stille! Raserei verzögert!"
	L.silencewarn5sec = "Stille endet in 5 sek!"
	L.silence = "Stille"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "deDE")
if L then
	L.phase1_trigger1 = "Ihr Narren habt euren eigenen Untergang heraufbeschworen."
	L.phase1_trigger2 = "Maz Azgala veni kamil toralar Naztheros zennshinagas." -- Curse of Tongues
	L.phase2_trigger = "Ich habe lange genug gewartet. Stellt euch dem Seelenjäger."

	L.add = "Adds"
	L.add_desc = "Warnungen und Timer für die Adds."

	L.add_death = "Tod eines Adds"
	L.add_death_desc = "Warnt, wenn ein Add stirbt."

	L.riderdiewarn = "Reiter tot!"
	L.dkdiewarn = "Todesritter tot!"

	L.wave = "%d/23: %s"

	L.trawarn = "Lehrlinge in 3 sek!"
	L.dkwarn = "Todesritter in 3 sek!"
	L.riderwarn = "Reiter in 3 sek!"

	L.trabar = "Lehrling (%d)"
	L.dkbar = "Todesritter (%d)"
	L.riderbar = "Reiter (%d)"

	--L.gate = "Gate Open!"
	--L.gatebar = "Gate opens"

	L.phase_soon = "Gothik im Raum in 10 sek!"

	L.engage_message = "Gothik der Ernter angegriffen!"
end

L = BigWigs:NewBossLocale("Grobbulus", "deDE")
if L then
	L.injection = "Injektion"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "deDE")
if L then
	L.teleport_yell_trigger = "Euer Ende naht."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "deDE")
if L then
	L.mark = "Male"
	L.mark_desc = "Warnungen und Timer für die Male."

	L.engage_message = "Die Vier Reiter angegriffen!"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "deDE")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Kel'Thuzads Gemach"

	L.phase1_trigger = "Lakaien, Diener, Soldaten der eisigen Finsternis! Folgt dem Ruf von Kel'Thuzad!"
	L.phase2_trigger1 = "Betet um Gnade!"
	L.phase2_trigger2 = "Schreiend werdet ihr diese Welt verlassen!"
	L.phase2_trigger3 = "Euer Ende ist gekommen!"
	L.phase3_trigger = "Meister, ich benötige Beistand."
	L.guardians_trigger = "Wohlan, Krieger der Eisigen Weiten, erhebt euch! Ich befehle euch für euren Meister zu kämpfen, zu töten und zu sterben! Keiner darf überleben!"

	L.phase2_warning = "Phase 2 - Kel'Thuzad kommt!"
	L.phase2_bar = "Kel'Thuzad aktiv"

	L.phase3_warning = "Phase 3 - Wächter in ~15 sek!"

	L.guardians = "Wächter"
	L.guardians_desc = "Warnt vor den Wächtern von Eiskrone in Phase 3."
	L.guardians_warning = "Wächter in ~10 sek!"
	L.guardians_bar = "Wächter kommen"

	L.engage_message = "Kel'Thuzad gestartet!"
end

L = BigWigs:NewBossLocale("Loatheb", "deDE")
if L then
	L.doomtime_bar = "Schicksal alle 15 sek"
	L.doomtime_now = "Unausweichliches Schicksal nun alle 15 sek!"

	L.spore_warn = "Spore (%d)"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "deDE")
if L then
	L.adds_yell_trigger = "Erhebt euch, Soldaten" -- Erhebt euch, Soldaten! Erhebt euch und kämpft erneut!
end

L = BigWigs:NewBossLocale("Maexxna", "deDE")
if L then
	L.webspraywarn30sec = "Fangnetz in 10 sek!"
	L.webspraywarn20sec = "Fangnetz! Spinnen in 10 sek!"
	L.webspraywarn10sec = "Spinnen! Gespinstschauer in 10 sek!"
	L.webspraywarn5sec = "GESPINSTSCHAUER in 5 sek!"

	L.enragewarn = "Raserei!"
	L.enragesoonwarn = "Raserei bald!"

	L.cocoons = "Fangnetz"
	L.spiders = "Spinnen"
end

L = BigWigs:NewBossLocale("Sapphiron", "deDE")
if L then
	L.airphase_trigger = "Saphiron erhebt sich in die Lüfte!"
	L.deepbreath_trigger = "%s holt tief Luft."

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	L.ice_bomb = "Frostatem"
	L.ice_bomb_warning = "Frostatem kommt!"
	L.ice_bomb_bar = "Frostatem landet!"

	L.icebolt_say = "Ich bin ein Eisblock!"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "deDE")
if L then
	L.understudy = "Reservist der Todesritter"

	L.shout_warning = "Unterbrechender Schrei in 5 sek!"
	L.taunt_warning = "Spott bereit in 5 sek!"
	L.shieldwall_warning = "Knochenbarriere weg in 5 sek!"
end

L = BigWigs:NewBossLocale("Thaddius", "deDE")
if L then
	L[15929] = "Stalagg"
	L[15930] = "Feugen"

	L.stage2_yell_trigger1 = "Eure... Knochen... zermalmen..."
	L.stage2_yell_trigger2 = "Euch... zerquetschen!"
	L.stage2_yell_trigger3 = "Töten..."

	L.add_death_emote_trigger = "%s stirbt."
	L.overload_emote_trigger = "%s überlädt!"
	--L.add_revive_emote_trigger = "%s is jolted back to life!"

	L.polarity_extras = "Zusätzliche Warnungen für Polaritätsveränderung-Positionierung"

	L.custom_select_charge_position = "Erste Position"
	L.custom_select_charge_position_desc = "Einzunehmende Position nach erster Polaritätsveränderung."
	L.custom_select_charge_position_value1 = "|cffff2020Negative (-)|r sind LINKS, |cff2020ffPositive (+)|r sind RECHTS"
	L.custom_select_charge_position_value2 = "|cff2020ffPositive (+)|r sind LINKS, |cffff2020Negative (-)|r sind RECHTS"

	L.custom_select_charge_movement = "Bewegung"
	L.custom_select_charge_movement_desc = "Die Bewegungsstrategie, welche die Gruppe nutzt."
	L.custom_select_charge_movement_value1 = "Laufe |cff20ff20DURCH|r den Boss"
	L.custom_select_charge_movement_value2 = "Laufe |cff20ff20IM UHRZEIGERSINN|r um den Boss"
	L.custom_select_charge_movement_value3 = "Laufe |cff20ff20GEGEN UHRZEIGERSINN|r um den Boss"
	L.custom_select_charge_movement_value4 = "Vier Camps 1: Geänderte Polarität läuft |cff20ff20RECHTS|r, gleiche Polaritäte läuft |cff20ff20LINKS|r"
	L.custom_select_charge_movement_value5 = "Vier Camps 2: Geänderte Polarität läuft |cff20ff20LINKS|r, gleiche Polaritäte läuft |cff20ff20RECHTS|r"

	L.custom_off_charge_graphic = "Grafischer Pfeil"
	L.custom_off_charge_graphic_desc = "Zeigt eine Pfeilgrafik an."
	L.custom_off_charge_text = "Textpfeile"
	L.custom_off_charge_text_desc = "Zeigt eine zusätzliche Nachricht."
	L.custom_off_charge_voice = "Sprachwarnung"
	L.custom_off_charge_voice_desc = "Spielt eine Sprachwarnung ab."

	L.left = "<--- Nach Links <--- Nach Links <---"
	L.right = "---> Nach Rechts ---> Nach Rechts --->"
	L.swap = "^^^^ Seitenwechseln ^^^^ Seitenwechseln ^^^^"
	L.stay = "==== Nicht Bewegen ==== Nicht Bewegen ===="

	--L.chat_message = "The Thaddius mod supports showing you directional arrows and playing voices. Open the options to configure them."
end

-- Northrend

L = BigWigs:NewBossLocale("Onyxia", "deDE")
if L then
	L.phase1_trigger = "Was für ein Zufall"
	L.phase2_trigger = "Diese sinnlose Anstrengung langweilt mich"
	L.phase3_trigger = "Mir scheint, dass Ihr noch eine Lektion braucht"

	L.deep_breath = "Tiefer Atem"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "deDE")
if L then
	L.stomp_message = "Stampfen - Ansturm bald!"
	L.stomp_warning = "Mögliches Stampfen in ~5 sek!"

	L.charge = "Ansturm"
	L.charge_desc = "Warnt, wenn ein Spieler angestürmt wird."
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "deDE")
if L then
	L.overcharge_message = "Sturmdiener überladen!"
	L.overcharge_bar = "Explosion"

	L.custom_on_overcharge_mark = "Overcharge marker"
	L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "deDE")
if L then
	L.breath_bar = "Atem %d"
	L.breath_message = "Atem %d bald!"
end

L = BigWigs:NewBossLocale("Malygos", "deDE")
if L then
	L.sparks = "Energiefunke"
	L.sparks_desc = "Warnungen und Timer für das Erscheinen von Energiefunken."
	L.sparks_message = "Energiefunke!"
	L.sparks_warning = "Energiefunke in ~5 sek!"

	L.sparkbuff = "Energiefunke auf Malygos"
	L.sparkbuff_desc = "Warnt, sobald ein Energiefunke Malygos erreicht hat."
	L.sparkbuff_message = "Malygos bekommt Energiefunke!"

	L.vortex = "Vortex"
	L.vortex_desc = "Warnungen und Timer für Vortex in Phase 1."
	L.vortex_message = "Vortex!"
	L.vortex_warning = "Vortex in ~5 sek!"
	L.vortex_next = "~Vortex"

	L.breath = "Tiefer Atem"
	L.breath_desc = "Warnungen und Timer für Tiefer Atem (Kraftsog) in Phase 2."
	L.breath_message = "Tiefer Atem!"
	L.breath_warning = "Tiefer Atem in ~5 sek!"

	L.surge = "Kraftsog"
	L.surge_desc = "Warnt, wenn du von Kraftsog in Phase 3 betroffen ist."
	L.surge_you = "Kraftsog auf DIR!"
	L.surge_trigger = "Die Augen von %s sind auf Euch fixiert!"

	L.phase = "Phasen"
	L.phase_desc = "Warnt bei Phasenwechsel."
	L.phase2_warning = "Phase 2 bald!"
	L.phase2_trigger = "Ich hatte gehofft, eure Leben schnell zu beenden, doch ihr zeigt euch... hartnäckiger als erwartet. Nichtsdestotrotz sind eure Bemühungen vergebens. Ihr törichten, leichtfertigen Sterblichen tragt die Schuld an diesem Krieg. Ich tue, was ich tun muss, und wenn das eure Auslöschung bedeutet... dann SOLL ES SO SEIN!"
	L.phase2_message = "Phase 2, Nexuslords & Saat der Ewigkeit"
	L.phase2_end_trigger = "GENUG! Wenn ihr die Magie Azeroths zurückhaben wollt, dann sollt ihr sie bekommen!"
	L.phase3_warning = "Phase 3 bald!"
	L.phase3_trigger = "Eure Wohltäter sind eingetroffen, doch sie kommen zu spät! Die hier gespeicherten Energien reichen aus, die Welt zehnmal zu zerstören. Was, denkt ihr, werden sie mit euch machen?"
	L.phase3_message = "Phase 3"
end

L = BigWigs:NewBossLocale("Sartharion", "deDE")
if L then
	L.engage_trigger = "Meine Aufgabe ist es, über diese Eier zu wachen. Kommt ihnen zu nahe und von euch bleibt nur ein Häuflein Asche."
	L.tsunami_trigger = "Die Lava um %s brodelt!"
	L.twilight_trigger_vesperon = "Ein Vesperonjünger erscheint im Zwielicht!"
	L.twilight_trigger_shadron = "Ein Shadronjünger erscheint im Zwielicht!"

	L.drakes = "Drachen"
	L.drakes_desc = "Warnungen und Timer für den Kampfbeitritt der Drachen."

	-- Adds
	L.shadron = "Shadron"
	L.tenebron = "Tenebron"
	L.vesperon = "Vesperon"
	L.lava_blaze = "Lavaflamme" -- NPC 30643
	L.acolyte_shadron = "Akolyth von Shadron" -- NPC 31218
	L.acolyte_vesperon = "Akolyth von Vesperon" -- NPC 31219
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "deDE")
if L then
	L.whiteout_bar = "Schneesturm %d"
	L.whiteout_message = "Schneesturm %d bald!"

	L.freeze_message = "Eingefroren"
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "deDE")
if L then
	L.twilight_cutter_emote_trigger = "Sphären" -- Die kreisenden Sphären pulsieren vor dunkler Energie!
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "deDE")
if L then
	L.baltharus = "Baltharus der Kriegsjünger" -- NPC 39751
	L.saviana = "Saviana Flammenschlund" -- NPC 39747
	L.zarithrian = "General Zarithrian" -- NPC 39746

	L.adds_yell_trigger = "Äschert sie ein, Lakaien!"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "deDE")
if L then
	L.swarm_message = "Wächterschwarm"

	L.defender = "Wilder Verteidiger"
	L.defender_desc = "Warnt, wieviele Leben der Wilder Verteidiger noch hat."
	L.defender_message = "Verteidiger da %d/9!"
end

L = BigWigs:NewBossLocale("Freya", "deDE")
if L then
	L.wave = "Wellen"
	L.wave_desc = "Warnt vor den Wellen."
	L.wave_bar = "Nächste Welle"
	L.conservator_trigger = "Eonar, Eure Dienerin braucht Hilfe!"
	L.detonate_trigger = "Der Schwarm der Elemente soll über Euch kommen!"
	L.elementals_trigger = "Helft mir, Kinder!"
	L.tree_trigger = "Ein |cFF00FFFFGeschenk der Lebensbinderin|r fängt an zu wachsen!"
	L.conservator_message = "Konservator!"
	L.detonate_message = "Explosionspeitscher!"
	L.elementals_message = "Elementare!"

	L.tree = "Eonars Geschenk"
	L.tree_desc = "Warnt, wenn Eonars Geschenk auftaucht."
	L.tree_message = "Eonars Geschenk!"

	L.fury_message = "Furor"

	L.tremor_warning = "Bebende Erde bald!"
	L.tremor_bar = "~Bebende Erde"
	L.energy_message = "Instabile Energie auf DIR!"
	L.sunbeam_message = "Sonnenstrahl!"
	L.sunbeam_bar = "~Sonnenstrahl"
end

L = BigWigs:NewBossLocale("Hodir", "deDE")
if L then
	L.hardmode = "Hard Mode"
	L.hardmode_desc = "Timer für den Hard Mode."
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "deDE")
if L then
	L.brittle_message = "Konstrukt ist spröde!"
end

L = BigWigs:NewBossLocale("The Iron Council", "deDE")
if L then
	L.stormcaller_brundir = "Sturmrufer Brundir"
	L.steelbreaker = "Stahlbrecher"
	L.runemaster_molgeim = "Runenmeister Molgeim"

	L.summoning_message = "Elementare!"

	L.chased_other = "%s wird verfolgt!"
	L.chased_you = "DU wirst verfolgt!"
end

L = BigWigs:NewBossLocale("Kologarn", "deDE")
if L then
	L.arm = "Arm stirbt"
	L.arm_desc = "Warnung und Timer für das Sterben des linken & rechten Arms."
	L.left_dies = "Linker Arm stirbt!"
	L.right_dies = "Rechter Arm stirbt!"
	L.left_wipe_bar = "Neuer linker Arm"
	L.right_wipe_bar = "Neuer rechter Arm"

	L.eyebeam = "Fokussierter Augenstrahl"
	L.eyebeam_desc = "Warnt, wenn du von Fokussierter Augenstrahl betroffen bist."
end

L = BigWigs:NewBossLocale("Mimiron", "deDE")
if L then
	L.phase = "Phasen"
	L.phase_desc = "Warnt bei Phasenwechsel."
	L.engage_warning = "Phase 1"
	L.engage_trigger = "^Wir haben nicht viel Zeit, Freunde!"
	L.phase2_warning = "Phase 2"
	L.phase2_trigger = "WUNDERBAR! Das sind Ergebnisse nach meinem Geschmack! Integrität der Hülle bei 98,9 Prozent! So gut wie keine Dellen! Und weiter geht's."
	L.phase3_warning = "Phase 3"
	L.phase3_trigger = "^Danke Euch, Freunde! Eure Anstrengungen haben fantastische Daten geliefert!"
	L.phase4_warning = "Phase 4"
	L.phase4_trigger = "Vorversuchsphase abgeschlossen. Jetzt kommt der eigentliche Test!"
	L.phase_bar = "Phase %d"

	L.hardmode_trigger = "^Warum habt Ihr das denn jetzt gemacht?"

	L.plasma_warning = "Wirkt Plasmaeruption!"
	L.plasma_soon = "Plasmaeruption bald!"
	L.plasma_bar = "Plasmaeruption"

	L.shock_next = "~Schockschlag"

	L.laser_soon = "Lasersalve!"
	L.laser_bar = "Lasersalve"

	L.magnetic_message = "Einheit am Boden!"

	L.suppressant_warning = "Löschschaum kommt!"

	L.fbomb_bar = "~Frostbombe"

	L.bomb_message = "Bombenbot!"
end

L = BigWigs:NewBossLocale("Razorscale", "deDE")
if L then
	L.ground_trigger = "Beeilt Euch! Sie wird nicht lange am Boden bleiben!"
	L.ground_message = "Angekettet!"
	L.air_message = "Hebt ab!"

	L.harpoon = "Harpunengeschütze"
	L.harpoon_desc = "Warnungen und Timer für die Harpunengeschütze."
	L.harpoon_message = "Harpunengeschütz %d bereit!"
	L.harpoon_trigger = "Harpunengeschütz ist einsatzbereit!"
	L.harpoon_nextbar = "Geschütz %d"
end

L = BigWigs:NewBossLocale("Thorim", "deDE")
if L then
	L.phase2_trigger = " Eindringlinge! Ihr Sterblichen, die Ihr es wagt, Euch in mein Vergnügen einzumischen, werdet... Wartet... Ihr..." -- space in the beginning!
	L.phase3_trigger = "Ihr unverschämtes Geschmeiß! Ihr wagt es, mich in meinem Refugium herauszufordern? Ich werde Euch eigenhändig zerschmettern!"

	L.hardmode = "Hard Mode"
	L.hardmode_desc = "Timer für den Hard Mode."
	L.hardmode_warning = "Hard Mode beendet!"

	L.barrier_message = "Runenbarriere oben!"

	L.charge_message = "Blitzladung x%d!"
	L.charge_bar = "Blitzladung %d"
end

L = BigWigs:NewBossLocale("General Vezax", "deDE")
if L then
	L.surge_bar = "Sog %d"

	L.animus = "Saronitanimus"
	L.animus_desc = "Warnt, wenn ein Saronitanimus auftaucht."
	L.animus_trigger = "Die Saronitdämpfe sammeln sich, wirbeln heftig herum und verschmelzen zu einer monströsen Form!"
	L.animus_message = "Saronitanimus kommt!"

	L.vapor = "Saronitdämpfe"
	L.vapor_desc = "Warnung und Timer für das Auftauchen von Saronitdämpfen."
	L.vapor_message = "Saronitdämpfe %d!"
	L.vapor_bar = "Saronitdämpfe"
	L.vapor_trigger = "Eine Wolke Saronitdämpfe bildet sich in der Nähe!"

	L.vaporstack = "Saronitdämpfe Stapel"
	L.vaporstack_desc = "Warnt, wenn du 5 oder mehr Stapel der Saronitdämpfe hast."
	L.vaporstack_message = "Saronitdämpfe x%d!"

	L.crash_say = "Schattengeschoss"

	L.mark_message = "Mal"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "deDE")
if L then
	L.lightbomb_other = "Licht"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "deDE")
if L then
	L.engage_trigger = "^Bald ist die Zeit"
	L.phase2_trigger = "^Ich bin der strahlende Traum"
	L.phase3_trigger = "^Erblickt das wahre Antlitz des Todes"

	L.portal = "Portale"
	L.portal_desc = "Warnt, wenn Portale erscheinen."
	L.portal_message = "Portale offen!"
	L.portal_bar = "Nächsten Portale"

	L.fervor_message = "Eifer auf %s!"

	L.sanity_message = "DU wirst verrückt!"

	L.weakened = "Geschwächt"
	L.weakened_desc = "Warnt, wenn Yogg-Saron geschwächt ist."
	L.weakened_message = "%s ist geschwächt!"

	L.madness_warning = "Wahnsinn in 10 sek!"
	L.malady_message = "Geisteskrank" -- short for Malady of the Mind (63830)

	L.tentacle = "Schmettertentakel"
	L.tentacle_desc = "Warnung und Timer für das Auftauchen der Schmettertentakel."
	L.tentacle_message = "Schmettertentakel %d!"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = "DU bist verbunden!"

	L.guardian_message = "Wächter %d!"

	L.roar_warning = "Gebrüll in 5 sek!"
	L.roar_bar = "Nächstes Gebrüll"
end
