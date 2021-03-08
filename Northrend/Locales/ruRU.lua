local L = BigWigs:NewBossLocale("Onyxia", "ruRU")
if not L then return end
if L then
	L.phase = "Фазы"
	L.phase_desc = "Сообщать о смене фаз."
	L.phase2_message = "Фаза 2 - Ониксия взлетает!"
	L.phase3_message = "Фаза 3 - Ониксия приземляется!"

	L.phase1_trigger = "Вот это сюрприз."
	L.phase2_trigger = "Эта бессмысленная возня вгоняет меня в тоску. Я сожгу вас всех!"
	L.phase3_trigger = "Похоже, вам требуется преподать еще один урок, смертные!"

	L.deepbreath_message = "Огненное дыхание!"
	L.fear_message = "Страх через 1.5 сек!"
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
	--L.engage_trigger = "It is my charge to watch over these eggs. I will see you burn before any harm comes to them!"

	L.tsunami = "Огненное цунами"
	L.tsunami_desc = "Предупреждать о взбалтывании лавы и отображать полосу."
	L.tsunami_warning = "Огненное цунами через ~5сек!"
	L.tsunami_message = "Огненное цунами!"
	L.tsunami_cooldown = "Перезарядка цунами"
	L.tsunami_trigger = "Лава вокруг |3-1(%s) начинает бурлить!"

	L.breath_cooldown = "Перезарядка дыхания"

	L.drakes = "Драконы"
	L.drakes_desc = "Предупреждать когда драконы вступят в бой."
	L.drakes_incomingsoon = "%s прилетит через ~5сек!"

	L.twilight = "События в Зоне сумерек"
	L.twilight_desc = "Сообщать что происходит с Сумеречным порталом."
	L.twilight_trigger_tenebron = "Тенеброн начинает высиживать кладку в Зоне сумерек!"
	L.twilight_trigger_vesperon = "В Сумраке появляется ученик Весперона!"
	L.twilight_trigger_shadron = "Ученик Шадрона появляется в Зоне сумерек!"
	L.twilight_message_tenebron = "Вылупление яиц"
	L.twilight_message = "Появился Ученик |3-1(%s)!"

	L.shadron = "Шадрон"
	L.tenebron = "Тенеброн"
	L.vesperon = "Весперон"
end

L = BigWigs:NewBossLocale("Halion", "ruRU")
if L then
	L.engage_trigger = "Этот мир вот-вот соскользнет в бездну. Вам выпала честь узреть начало эры РАЗРУШЕНИЯ!"

	L.phase_two_trigger = "В мире сумерек вы найдете лишь страдания! Входите, если посмеете!"

	L.twilight_cutter_trigger = "Во вращающихся сферах пульсирует темная энергия!"
	L.twilight_cutter_bar = "~Лезвие сумерок"
	L.twilight_cutter_warning = "Скоро Лезвие сумерок"

	--L.fire_damage_message = "Your feet are burning!"
	L.fire_message = "Огненная бомба"
	L.shadow_message = "Пожирающая бомба"

	--L.meteorstrike_yell = "The heavens burn!"
	L.meteorstrike_bar = "Падение метеора"
	--L.meteor_warning_message = "Meteor incoming!"
end
