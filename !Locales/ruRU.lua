-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "ruRU")
if L then
	L.bone_spike = "Костяной шип" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "ruRU")
if L then
	L.touch = "Прикосновение"
	L.deformed_fanatic = "Кособокий фанатик" -- NPC ID 38135
	L.empowered_adherent = "Могущественный последователь" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "ruRU")
if L then
	L.adds_trigger_alliance = "Разрушители, сержанты, в бой!"
	L.adds_trigger_horde = "Пехота, сержанты, в бой!"

	L.mage = "Маг"
	L.mage_desc = "Предупредит когда появится маг и заморозит пушки."
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	L.warmup_trigger_alliance = "Запускайте двигатели"
	L.warmup_trigger_horde = "Воспряньте, сыны и дочери Орды"

	L.disable_trigger_alliance = "братья и сестры"
	L.disable_trigger_horde = "Вперед к Королю-Личу"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "ruRU")
if L then
	L.blood_beast = "Кровавое чудовище" -- NPC ID 38508

	L.warmup_alliance = "Тогда выдвигаемся! Быст..."
	L.warmup_horde = "Кор'крон, выдвигайтесь! Герои, будьте начеку. Плеть только что..."
end

L = BigWigs:NewBossLocale("Blood Prince Council", "ruRU")
if L then
	L.switch_message = "Смена цели: %s"
	L.switch_bar = "~Следующая смена цели"

	L.empowered_flames = "Жаркое пламя"

	L.empowered_shock_message = "Могучий вихрь!"
	L.regular_shock_message = "Вихрь"
	L.shock_bar = "~Следующий вихрь"

	L.iconprince = "Помечать активного принца"
	L.iconprince_desc = "Пометить черепом активного принца с полосой здоровья."

	L.prison_message = "Темница Тьмы x%d!"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "ruRU")
if L then
	L.engage_trigger = "Это было... неразумное... решение."

	L.shadow = "Тени"
	L.shadow_message = "Тени"
	L.shadow_bar = "~Тени"

	L.feed_message = "Скоро пора кормиться!"

	L.pact_message = "Пакт Омраченных"
	L.pact_bar = "~Пакт Омраченных"

	L.phase_message = "Скоро воздушная фаза!"
	L.phase1_bar = "Возврат на землю"
	L.phase2_bar = "Воздушная фаза"
end

L = BigWigs:NewBossLocale("Festergut", "ruRU")
if L then
	L.engage_trigger = "Повеселимся?"

	L.inhale_bar = "~Следующее вдыхание %d"
	L.blight_warning = "Едкая гниль через ~5сек!"
	L.ball_message = "Скоро комок гадости!"
end

L = BigWigs:NewBossLocale("Professor Putricide", "ruRU")
if L then
	L.engage_trigger = "Отличные новости, народ!"

	L.phase = "Фазы"
	L.phase_desc = "Предупреждает о смене фаз."
	L.phase_warning = "Скоро %d-я фаза!"
	L.phase_bar = "Следующая фаза"

	L.ball_bar = "Следующий бросок вязкой гадости"
	L.ball_say = "Бросок вязкой гадости на МНЕ!"

	L.experiment_message = "Скоро появится слизнюк!"
	L.experiment_heroic_message = "Скоро появятся слизнюки!"
	L.experiment_bar = "Следующий слизнюк"
	L.blight_message = "Газовое облако"
	L.violation_message = "Зеленый слизнюк"

	L.gasbomb_bar = "Следующие желтые газовые бомбы"
	L.gasbomb_message = "Желтые бомбы!"
end

L = BigWigs:NewBossLocale("Rotface", "ruRU")
if L then
	L.engage_trigger = "УУИИИИИИ!"

	L.infection_message = "Инфекция"

	L.ooze = "Сливание слизнюков"
	L.ooze_desc = "Предупреждает когда слизнюки сливаются."
	L.ooze_message = "Нестабильный слизнюк %dx"

	L.spray_bar = "Следующие брызги"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "ruRU")
if L then
	L.engage_trigger = "Чужаки ворвались во внутренние покои. Уничтожьте зеленого дракона!"

	L.portal = "Портал к кошмарам"
	L.portal_desc = "Сообщать когда Валитрия открывает портал."
	L.portal_message = "Портал!"
	L.portal_bar = "Скоро портал"
	L.portalcd_message = "Портал %d, через 14 сек!"
	L.portalcd_bar = "Следующий портал %d"
	L.portal_trigger = "Я открыла портал в Изумрудный Сон. Там вы найдете спасение, герои..."

	L.suppresser = "Появление Подавителей"
	L.suppresser_desc = "Сообщать когда будут появляться Подавители."
	L.suppresser_message = "~Подавители"

	L.blazing = "Исторгающий пламя скелет"
	L.blazing_desc = "|cffff0000Предполагаемый|r таймер появления Исторгающего пламя скелета. Этот таймер может быть неточным, используйте его только в качестве приблизительного ориентира."
	L.blazing_warning = "Скоро Исторгающий пламя скелет!"
end

L = BigWigs:NewBossLocale("Sindragosa", "ruRU")
if L then
	L.engage_trigger = "Глупцы, зачем вы сюда явились!"

	L.phase2 = "Фаза 2"
	L.phase2_desc = "Сообщать, когда Синдрагоса перейдет во вторую фазу на 35% жизней."
	L.phase2_trigger = "А теперь почувствуйте всю мощь господина и погрузитесь в отчаяние!"
	L.phase2_message = "Фаза 2!"

	L.airphase = "Воздушная фаза"
	L.airphase_desc = "Сообщать когда Синдрагоса отрывается от земли."
	L.airphase_trigger = "Здесь ваше вторжение и окончится! Никто не уцелеет."
	L.airphase_message = "Воздушная фаза!"
	L.airphase_bar = "Следующая воздушная фаза."

	L.boom_message = "Взрыв!"
	L.boom_bar = "Взрыв"

	L.instability_message = "Неустойчивость x%d!"
	L.chilled_message = "Обжигающий холод x%d!"
	L.buffet_message = "Таинственная энергия x%d!"
	L.buffet_cd = "~Таинственная энергия"
end

L = BigWigs:NewBossLocale("The Lich King", "ruRU")
if L then
	L.warmup_trigger = "Неужели прибыли наконец хваленые силы Света?"
	L.engage_trigger = "Я оставлю тебя в живых, чтобы ты увидел финал."

	L.horror_message = "Шаркающий ужас"
	L.horror_bar = "~Следующий Ужас"

	L.valkyr_message = "Валь'кира"
	L.valkyr_bar = "Следующая Валь'кира"
	L.valkyrhug_message = "Валь'кира схватила"

	L.cave_phase = "Фаза пещеры"
	L.last_phase_bar = "Последняя фаза"

	--L.frenzy_bar = "%s frenzies!"
	--L.frenzy_survive_message = "%s will survive after plague"
	--L.frenzy_message = "Add frenzied!"
	--L.frenzy_soon_message = "5sec to frenzy!"

	--L.custom_on_valkyr_marker = "Val'kyr marker"
	--L.custom_on_valkyr_marker_desc = "Mark the Val'kyr with {rt8}{rt7}{rt6}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over the Val'kyr is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "ruRU")
if L then
	L.deathbound_ward = "Заклятый страж"
	L.deathspeaker_high_priest = "Вестник смерти - верховный жрец" -- NPC ID 36829
	L.putricide_dogs = "Прелесть & Вонючка"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "ruRU")
if L then
	L.engage_message = "Ануб'арак вступил в бой, зарывание в землю через 80сек!"
	L.engage_trigger = "Это место станет вашей могилой!"

	L.unburrow_trigger = "вылезает на поверхность!"
	L.burrow_trigger = "зарывается в землю!"
	L.burrow = "Зарывание в землю"
	L.burrow_desc = "Отображать таймер до закапывания Ануб'арака"
	L.burrow_soon = "Скоро зарывание"

	L.nerubian_message = "Жуки наступают!"
	L.nerubian_burrower = "Ещё жуки"

	L.shadow_soon = "Теневой удар через ~5сек!"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "ruRU")
if L then
	L.wipe_trigger = "Трагично..."

	L.engage_trigger = "Из самых глубоких и темных пещер Грозовой Гряды был призван Гормок Пронзающий Бивень! В бой, герои!"
	L.jormungars_trigger = "Приготовьтесь к схватке с близнецами-чудовищами, Кислотной Утробой и Жуткой Чешуей!"
	L.icehowl_trigger = "В воздухе повеяло ледяным дыханием следующего бойца: на арену выходит Ледяной Рев! Сражайтесь или погибните, чемпионы!"
	L.boss_incoming = "На подходе %s"

	L.gormok = "Гормок Пронзающий Бивень"
	L.jormungars = "Кислотная Утроба и Жуткая Чешуя"
	L.icehowl = "Ледяной Рев"

	-- Gormok
	L.snobold = "Снобольд"
	L.snobold_desc = "Сообщать о том, на кого прыгнул снобольд."

	-- Jormungars
	L.submerge = "Погружение"
	L.submerge_desc = "Показывать таймеры погружений."
	L.spew = "Кислотная/Жгучая рвота"
	L.spew_desc = "Сообщать о кислотной/жгучей рвоте."
	L.sprays = "Брызги"
	L.sprays_desc = "Показывать таймеры для следующих применений парализующих и горящих брызгов."
	L.slime_message = "Вы в луже жижи!"
	L.burn_spell = "Горящая желчь"
	L.toxin_spell = "Паралитический токсин"
	L.spray = "Брызги"

	-- Icehowl
	L.charge = "Отчаянный рывок" --Furious Charge - судя по транскриптору нет русского перевода :(
	L.charge_desc = "Сообщать об отчаянном рывке."
	L.charge_trigger = "глядит на" --check

	L.bosses = "Боссы"
	L.bosses_desc = "Сообщать о появлении следующего босса."
end

L = BigWigs:NewBossLocale("Faction Champions", "ruRU")
if L then
	L.defeat_trigger = "Пустая и горькая победа. После сегодняшних потерь мы стали слабее как целое. Кто еще, кроме Короля-лича, выиграет от подобной глупости? Пали великие воины. И ради чего? Истинная опасность еще впереди – нас ждет битва с  Королем-личом."

	L["Shield on %s!"] = "Щит на %s"
	L["Bladestorming!"] = "Вихрь клинков!"
	L["Hunter pet up!"] = "Охотник воскресил питомца!"
	L["Felhunter up!"] = "Чернокнижник воскресил питомца!"
	L["Heroism on champions!"] = "Героизм на чемпионах!"
	L["Bloodlust on champions!"] = "Жажда крови на чемпионах!"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "ruRU")
if L then
	L.enable_trigger = "Ничтожный гном! Тебя погубит твоя самоуверенность!"

	L.engage = "Начало битвы"
	L.engage_trigger = "Перед вами Джараксус, эредарский повелитель Пылающего Легиона!"
	L.engage_trigger1 = "Отправляйся в Пустоту!"

	L.adds = "Врата и вулкан"
	L.adds_desc = "Показывать таймер и сообщать о создании порталов и вулканов."

	L.incinerate_message = "Испепеление"
	L.incinerate_other = "Испепеление плоти на |3-5(%s)! Хил!"
	L.incinerate_bar = "~Следующее испепеление"
	L.incinerate_safe = "%s в безопасности!"

	L.legionflame_message = "Пламя"
	L.legionflame_other = "Пламя Легиона на |3-5(%s)!"
	L.legionflame_bar = "~Следующее пламя"

	L.infernal_bar = "~появление вулкана"
	L.netherportal_bar = "~появление врат"

	L.kiss_message = "Поцелуй на ВАС!"
	L.kiss_interrupted = "Прерывание!"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "ruRU")
if L then
	L.engage_trigger1 = "Во имя темного повелителя. Во имя Короля-лича. Вы. Умрете."

	L.vortex_or_shield_cd = "Воронка или Щит"
	L.next = "Следующая воронка или щит"
	L.next_desc = "Сообщать о следующей воронке или щите"

	L.vortex = "Воронка"
	L.vortex_desc = "Сообщать, когда близнецы начинают применять воронку."

	L.shield = "Щит Тьмы/Света"
	L.shield_desc = "Сообщать о щите тьмы/света."

	L.touch = "Касание тьмы/света"
	L.touch_desc = "Сообщать о касании тьмы/света"
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "ruRU")
if L then
	L.add = "Некрорахнид-стражник"
	L.locust = "Саранча"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "ruRU")
if L then
	L.silencewarn = "Безмолвие! Задержка ярости!"
	L.silencewarn5sec = "Безмолвие закончится через 5 секунд"
	L.silence = "Безмолвие"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "ruRU")
if L then
	L.phase1_trigger1 = "Глупо было искать свою смерть."
	L.phase1_trigger2 = "Я очень долго ждал. Положите свою душу в мой комбайн и будем вам дерево с золотыми монетами." -- Curse of Tongues CHECK THIS
	L.phase2_trigger = "Я ждал слишком долго. Сейчас вы предстанете пред ликом Жнеца душ."

	L.add = "Появление помощников"
	L.add_desc = "Сообщать о появлении помощников"

	L.add_death = "Оповещать смерть помощников"
	L.add_death_desc = "Сообщать о смерти помощников."

	L.riderdiewarn = "Всадник мёртв!"
	L.dkdiewarn = "Рыцарь смерти мёртв!"

	L.wave = "%d/23: %s"

	L.trawarn = "Ученик через 3 секунды"
	L.dkwarn = "Рыцарь Смерти через 3 секунды"
	L.riderwarn = "Всадник через 3 секунды"

	L.trabar = "Ученик (%d)"
	L.dkbar = "Рыцарь Смерти (%d)"
	L.riderbar = "Всадник (%d)"

	--L.gate = "Gate Open!"
	--L.gatebar = "Gate opens"

	L.phase_soon = "Готик появится через 10 секунд"

	L.engage_message = "Готик вступает в бой! 4:30 до входа в комнату."
end

L = BigWigs:NewBossLocale("Grobbulus", "ruRU")
if L then
	L.injection = "Укол"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "ruRU")
if L then
	L.teleport_yell_trigger = "Вам конец."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "ruRU")
if L then
	L.mark = "Знак"
	L.mark_desc = "Предупреждать о знаках."

	L.engage_message = "Четыре Всадника вступили в бой!"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "ruRU")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Зал Кел'Тузада"

	L.phase1_trigger = "Соратники, слуги, солдаты холодной тьмы! Повинуйтесь зову Кел'Тузада!"
	L.phase2_trigger1 = "Молите о пощаде!"
	L.phase2_trigger2 = "Кричите! Кричите изо всех сил!"
	L.phase2_trigger3 = "Вы уже мертвы!"
	L.phase3_trigger = "Господин, мне нужна помощь!"
	L.guardians_trigger = "Хорошо. Воины ледяных пустошей, восстаньте! Повелеваю вам сражаться, убивать и умирать во имя своего повелителя! Не щадить никого!"

	L.phase2_warning = "Фаза 2 - Кел'Тузад просыпается!"
	L.phase2_bar = "Кел'Тузад активен!"

	L.phase3_warning = "Фаза 3 - защитники через ~15 секунд!"

	L.guardians = "Появление стражей"
	L.guardians_desc = "Сообщать о появлении стражей ледяной короны в третьей фазе."
	L.guardians_warning = "Стражи появятся через 15 секунд!"
	L.guardians_bar = "Появляются стражи!"

	L.engage_message = "Бой с Кел'Тузадом начинается!"
end

L = BigWigs:NewBossLocale("Loatheb", "ruRU")
if L then
	L.doomtime_bar = "Рок каждые 15 секунд"
	L.doomtime_now = "Рок теперь накладывается каждые 15 секунд!"

	L.spore_warn = "Спора (%d)"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "ruRU")
if L then
	L.adds_yell_trigger = "Встаньте мои воины" -- Встаньте мои воины! Встаньте и сражайтесь вновь!
end

L = BigWigs:NewBossLocale("Maexxna", "ruRU")
if L then
	L.webspraywarn30sec = "Паутина через 10 секунд"
	L.webspraywarn20sec = "Паутина! 10 секунд до появления пауков!"
	L.webspraywarn10sec = "Пауки! 10 секунд до паутины!"
	L.webspraywarn5sec = "Паутина через 5 секунд!"

	L.enragewarn = "Бешенство - ХЛЮП ХЛЮП ХЛЮП!"
	L.enragesoonwarn = "Скоро бешенство"

	L.cocoons = "Коконы"
	L.spiders = "Пауки"
end

L = BigWigs:NewBossLocale("Sapphiron", "ruRU")
if L then
	L.airphase_trigger = "%s взмывает в воздух!"
	L.deepbreath_trigger = "%s глубоко вдыхает."

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	L.ice_bomb = "Ледяная бомба"
	L.ice_bomb_warning = "Появляется ледяная бомба!"
	L.ice_bomb_bar = "Приземляется ледяная бомба!"

	L.icebolt_say = "Я в глыбе!"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "ruRU")
if L then
	L.understudy = "Ученик рыцаря смерти"

	L.shout_warning = "Разрушительный крик через 5 сек!"
	L.taunt_warning = "Провокация закончится через 5 сек!"
	L.shieldwall_warning = "Преграда из костей закончится через 5 сек!"
end

L = BigWigs:NewBossLocale("Thaddius", "ruRU")
if L then
	L[15929] = "Сталагг"
	L[15930] = "Фойген"

	L.stage2_yell_trigger1 = "Отведайте... своих... костей..."
	L.stage2_yell_trigger2 = "Растерзаю!!!"
	L.stage2_yell_trigger3 = "Убей..."

	L.add_death_emote_trigger = "%s умирает."
	L.overload_emote_trigger = "%s перезагружается!"
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

L = BigWigs:NewBossLocale("Onyxia", "ruRU")
if L then
	L.phase1_trigger = "Вот это сюрприз."
	L.phase2_trigger = "Эта бессмысленная возня вгоняет меня в тоску. Я сожгу вас всех!"
	L.phase3_trigger = "Похоже, вам требуется преподать еще один урок, смертные!"

	L.deep_breath = "Глубокий вдох"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "ruRU")
if L then
	L.stomp_message = "Топот - близится Рывок!"
	L.stomp_warning = "Топот через ~5сек!"

	L.charge = "Рывок"
	L.charge_desc = "Предупреждать о Рывках."
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "ruRU")
if L then
	L.overcharge_message = "Служитель бури перегружен!"
	L.overcharge_bar = "Взрыв Служителя бури"

	L.custom_on_overcharge_mark = "Overcharge marker"
	L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "ruRU")
if L then
	L.breath_bar = "Дыхание %d"
	L.breath_message = "Скоро дыхание %d!"
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "ruRU")
if L then
	L.whiteout_bar = "Пурга %d"
	L.whiteout_message = "Скоро пурга %d!"

	L.freeze_message = "Заморозка"
end

L = BigWigs:NewBossLocale("Malygos", "ruRU")
if L then
	L.sparks = "Искра мощи"
	L.sparks_desc = "Предупреждать о появлениях Искры мощи."
	L.sparks_message = "Появилась Искра мощи!"
	L.sparks_warning = "Искра мощи через ~5сек!"

	L.sparkbuff = "Яркая искра на Малигосе"
	L.sparkbuff_desc = "Предупреждать когда Малигос получает Яркую искру."
	L.sparkbuff_message = "Малигос получил Яркую искру!"

	L.vortex = "Воронка"
	L.vortex_desc = "Предупреждать о воронках и отображать полосу."
	L.vortex_message = "Воронка!"
	L.vortex_warning = "Воронка через ~5сек!"
	L.vortex_next = "Перезарядка воронки"

	L.breath = "Глубокое дыхание"
	L.breath_desc = "Оповещать кокда Малигос использует Deep Breath во 2ой фазе."
	L.breath_message = "Глубокое дыхание!"
	L.breath_warning = "Глубокое дыхание через ~5сек!"

	L.surge = "Прилив мощи"
	L.surge_desc = "Предупреждать кто получает Прилив мощи."
	L.surge_you = "На ВАС - Прилив мощи!"
	L.surge_trigger = "%s уставился на вас!"

	L.phase = "Фазы"
	L.phase_desc = "Предупреждать о смене фаз."
	L.phase2_warning = "Скоро 2 фаза!"
	L.phase2_trigger = "Я рассчитывал быстро покончить с вами, однако вы оказались более… более стойкими, чем я рассчитывал"
	L.phase2_message = "2 Фаза - Повелители нексуса и Потомоки вечности!"
	L.phase2_end_trigger = "ХВАТИТ! Если ты намерен вернуть себе магию Азерота, ты ее получишь!"
	L.phase3_warning = "Скоро 3 фаза!"
	L.phase3_trigger = "А-а, вот и твои благодетели!"
	L.phase3_message = "3 Фаза!"
end

L = BigWigs:NewBossLocale("Sartharion", "ruRU")
if L then
	L.engage_trigger = "Моя обязанность – оберегать эти яйца, и вы сгорите, прежде чем хоть пальцем тронете их!"
	L.tsunami_trigger = "Лава вокруг |3-1(%s) начинает бурлить!"
	L.twilight_trigger_vesperon = "В Сумраке появляется ученик Весперона!"
	L.twilight_trigger_shadron = "Ученик Шадрона появляется в Зоне сумерек!"

	L.drakes = "Драконы"
	L.drakes_desc = "Предупреждать когда драконы вступят в бой."

	-- Adds
	L.shadron = "Шадрон"
	L.tenebron = "Тенеброн"
	L.vesperon = "Весперон"
	L.lava_blaze = "Пламя лавы" -- NPC 30643
	L.acolyte_shadron = "Служитель Шадрона" -- NPC 31218
	L.acolyte_vesperon = "Служитель Весперона" -- NPC 31219
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "ruRU")
if L then
	L.twilight_cutter_emote_trigger = "сферах" -- Во вращающихся сферах пульсирует темная энергия!
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "ruRU")
if L then
	L.baltharus = "Балтар Рожденный в Битве" -- NPC 39751
	L.saviana = "Савиана Огненная Пропасть" -- NPC 39747
	L.zarithrian = "Генерал Заритриан" -- NPC 39746

	L.adds_yell_trigger = "Слуги! Обратите их в пепел!"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "ruRU")
if L then
	L.swarm_message = "Cтража"

	L.defender = "Дикий защитник"
	L.defender_desc = "Сообщать о жизни Дикого защитника."
	L.defender_message = "Защитник (%d/9)!"
end

L = BigWigs:NewBossLocale("Freya", "ruRU")
if L then
	L.wave = "Волны"
	L.wave_desc = "Сообщать о волнах."
	L.wave_bar = "Следующая волна"
	L.conservator_trigger = "Эонар, твоей прислужнице нужна помощь!"
	L.detonate_trigger = "Вас захлестнет сила стихий!"
	L.elementals_trigger = "Помогите мне, дети мои!"
	L.tree_trigger = "|cFF00FFFFДар Хранительницы жизни|r начинает расти!"
	L.conservator_message = "Древний опекун!"
	L.detonate_message = "Взрывные плеточники!"
	L.elementals_message = "Элементали!"

	L.tree = "Дар Эонара"
	L.tree_desc = "Сообщать когда Фрейа призывает Дар Эонара."
	L.tree_message = "Появление Дара Эонара!"

	L.fury_message = "Гнев"

	L.tremor_warning = "Скоро Дрожание земли!"
	L.tremor_bar = "~Дрожание земли"
	L.energy_message = "Нестабильная энергия на ВАС!"
	L.sunbeam_message = "Луч солнца!"
	L.sunbeam_bar = "~следующий Луч солнца"
end

L = BigWigs:NewBossLocale("Hodir", "ruRU")
if L then
	L.hardmode = "Сложный режим"
	L.hardmode_desc = "Отображать таймер сложного режима."
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "ruRU")
if L then
	L.brittle_message = "Создание подверглось Ломкости!"
end

L = BigWigs:NewBossLocale("The Iron Council", "ruRU")
if L then
	L.stormcaller_brundir = "Буревестник Брундир"
	L.steelbreaker = "Сталелом"
	L.runemaster_molgeim = "Мастер рун Молгейм"

	L.summoning_message = "Руна призыва - приход Элементалей!"

	L.chased_other = "Преследует |3-3(%s)!"
	L.chased_you = "ВАС преследуют!"
end

L = BigWigs:NewBossLocale("Kologarn", "ruRU")
if L then
	L.arm = "Уничтожение рук"
	L.arm_desc = "Сообщать о смерти левой и правой руки."
	L.left_dies = "Левая рука уничтожена"
	L.right_dies = "Правая рука уничтожена"
	L.left_wipe_bar = "Восcтaновление левой руки"
	L.right_wipe_bar = "Восcтaновление правой руки"

	L.eyebeam = "Сосредоточенный взгляд"
	L.eyebeam_desc = "Сообщать кто попал под воздействие Сосредоточенный взгляд."
end

L = BigWigs:NewBossLocale("Mimiron", "ruRU")
if L then
	L.phase = "Фазы"
	L.phase_desc = "Сообщать о смене фаз."
	L.engage_warning = "1ая фаза"
	L.engage_trigger = "^У нас мало времени, друзья!"
	L.phase2_warning = "Наступает 2-ая фаза"
	L.phase2_trigger = "^ПРЕВОСХОДНО! Просто восхитительный результат!"
	L.phase3_warning = "Наступает 3-ая фаза"
	L.phase3_trigger = "^Спасибо, друзья!"
	L.phase4_warning = "Наступает 4-ая фаза"
	L.phase4_trigger = "^Фаза предварительной проверки завершена."
	L.phase_bar = "%d фаза"

	L.hardmode_trigger = "^Так, зачем вы это сделали?"

	L.plasma_warning = "Применяется Взрыв плазмы!"
	L.plasma_soon = "Скоро Взрыв плазмы!"
	L.plasma_bar = "Взрыв плазмы"

	L.shock_next = "Следующий Шоковый удар!"

	L.laser_soon = "Вращение!"
	L.laser_bar = "Обстрел"

	L.magnetic_message = "Магнитное ядро! БОМБИТЕ!"

	L.suppressant_warning = "Подавитель пламени!"

	L.fbomb_bar = "~Ледяная бомба"

	L.bomb_message = "Появился Бомбот!"
end

L = BigWigs:NewBossLocale("Razorscale", "ruRU")
if L then
	L.ground_trigger = "Быстрее! Сейчас она снова взлетит!"
	L.ground_message = "Острокрылая на привязи!"
	L.air_message = "Взлет!"

	L.harpoon = "Гарпунная Пушка"
	L.harpoon_desc = "Объявлять Гарпунные Пушки."
	L.harpoon_message = "Пушка (%d) готова!"
	L.harpoon_trigger = "Гарпунная пушка готова!"
	L.harpoon_nextbar = "Гарпун (%d)"
end

L = BigWigs:NewBossLocale("Thorim", "ruRU")
if L then
	L.phase2_trigger = "Незваные гости! Вы заплатите за то, что посмели вмешаться... Погодите, вы..."
	L.phase3_trigger = "Бесстыжие выскочки, вы решили бросить вызов мне лично? Я сокрушу вас всех!"

	L.hardmode = "Таймеры сложного режима"
	L.hardmode_desc = "Отображения таймера для сложного режима."
	L.hardmode_warning = "Завершение сложного режима"

	L.barrier_message = "Колосс под Рунической преградой!"

	L.charge_message = "Разряд: x%d"
	L.charge_bar = "Разряд %d"
end

L = BigWigs:NewBossLocale("General Vezax", "ruRU")
if L then
	L.surge_bar = "Наплыв %d"

	L.animus = "Саронитовый враг"
	L.animus_desc = "Сообщать о появлении саронитового врага."
	L.animus_trigger = "Саронитовые испарения яростно клубятся и струятся, принимая пугающую форму!"
	L.animus_message = "Появился саронитовый враг!"

	L.vapor = "Саронитовые пары"
	L.vapor_desc = "Сообщать о появлении саронитовых паров."
	L.vapor_message = "Саронитовые пары (%d)!"
	L.vapor_bar = "Пары"
	L.vapor_trigger = "Поблизости начинают возникать саронитовые испарения!"

	L.vaporstack = "Стаки испарения"
	L.vaporstack_desc = "Сообщать, когда у вас уже 5 стаков саронитового испарения."
	L.vaporstack_message = "Испарения x%d!"

	L.crash_say = "Сокрушение"

	L.mark_message = "Метка"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "ruRU")
if L then
	L.lightbomb_other = "Взрыв"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "ruRU")
if L then
	L.engage_trigger = "^Скоро мы сразимся с главарем этих извергов!"
	L.phase2_trigger = "^Я – это сон наяву"
	L.phase3_trigger = "^Взгляните в истинное лицо"

	L.portal = "Портал"
	L.portal_desc = "Сообщать о портале."
	L.portal_message = "Порталы открыты!"
	L.portal_bar = "Следующий портал"

	L.fervor_message = "Рвение на |3-5(%s)!"

	L.sanity_message = "Вы теряете рассудок!"

	L.weakened = "Оглушение"
	L.weakened_desc = "Сообщать, когда Йогг-Сарон производит оглушение."
	L.weakened_message = "%s оглушен!"

	L.madness_warning = "Помешательство через 10 сек!"
	L.malady_message = "Болезнь" -- short for Malady of the Mind (63830)

	L.tentacle = "Тяжелое щупальце"
	L.tentacle_desc = "Сообщать о появлении тяжелого щупальца."
	L.tentacle_message = "Щупальце %d!"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = "У вас схожее мышление!"

	L.guardian_message = "Страж %d!"

	L.roar_warning = "Крик через 5 сек!"
	L.roar_bar = "Следущий крик"
end
