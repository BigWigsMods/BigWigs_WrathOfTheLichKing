
local L = BigWigs:NewBossLocale("Onyxia", "zhCN")
if L then
	L.phase = "阶段"
	L.phase_desc = "当阶段转换时发出警报。"
	L.phase2_message = "即将 第二阶段！"
	L.phase3_message = "即将 第三阶段！"

	L.phase1_trigger = "真是走运。通常我必须离开窝才能找到食物。"
	L.phase2_trigger = "这毫无意义的行动让我很厌烦。我会从上空把你们都烧成灰！"
	L.phase3_trigger = "看起来需要再给你一次教训，凡人！"

	L.deepbreath_message = "即将 深呼吸！"
	L.fear_message = "即将 恐惧！"
end

local L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "zhCN")
if L then
	L.stomp_message = "践踏 - 即将 冲锋！"
	L.stomp_warning = "约5秒后，可能践踏！"
	L.stomp_bar = "<践踏 冷却>"

	L.cloud_message = ">你< 窒息云雾！"

	L.charge = "冲锋"
	L.charge_desc = "当玩家中了冲锋时发出警报。"
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "zhCN")
if L then
	L.nova_next = "<闪电新星 冷却>"

	L.overcharge_message = "风暴爪牙 - 能量超载！"
	L.overcharge_bar = "<爆炸>"
	L.overcharge_next = "<下一能量超载>"

	L.custom_on_overcharge_mark = "能量超载标记"
	L.custom_on_overcharge_mark_desc = "使用 {rt8} 标记能量超载的风暴爪牙，需要权限。"
end

L = BigWigs:NewBossLocale("Halion", "zhCN")
if L then
	L.engage_trigger = "你们的世界正在灭亡的边缘摇摆"

	L.phase_two_trigger = "暮光的世界将会让你痛不欲生"

	L.twilight_cutter_trigger = "这些环绕的球体散发着黑暗能量"
	L.twilight_cutter_bar = "<暮光撕裂射线>"
	L.twilight_cutter_warning = "即将 暮光撕裂射线！"

	L.fire_damage_message = ">你< 炽焰燃烧！"
	L.fire_message = "炽焰燃烧！"
	L.fire_bar = "<下一炽焰燃烧>"
	L.shadow_message = "灵魂吞噬！"
	L.shadow_bar = "<下一灵魂吞噬>"

	L.meteorstrike_yell = "天空在燃烧"
	L.meteorstrike_bar = "<流星打击>"
	L.meteor_warning_message = "即将 流星打击！"

	L.sbreath_cooldown = "<下一黑暗吐息>"
	L.fbreath_cooldown = "<下一火息术>"
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "zhCN")
if L then
	L.fists_bar = "<下一流星拳>"
	L.cinder_message = ">你< 余烬！"

	L.breath_bar = "<灼热吐息：%d>"
	L.breath_message = "即將 灼热吐息：>%d<！"
end

L = BigWigs:NewBossLocale("Malygos", "zhCN")
if L then
	L.sparks = "能量火花"
	L.sparks_desc = "当能量火花出现时发出警报。"
	L.sparks_message = "出现 能量火花！"
	L.sparks_warning = "约5秒后，能量火花！"

	L.sparkbuff = "玛里苟斯获得能量火花"
	L.sparkbuff_desc = "当玛里苟斯获得能量火花时发出警报。"
	L.sparkbuff_message = "玛里苟斯：>能量火花<！"

	L.vortex = "漩涡"
	L.vortex_desc = "当施放漩涡时发出警报及显示计时条。"
	L.vortex_message = "漩涡！"
	L.vortex_warning = "约5秒后，可能漩涡！"
	L.vortex_next = "<漩涡 冷却>"

	L.breath = "深呼吸"
	L.breath_desc = "当施放深呼吸时发出警报。"
	L.breath_message = "深呼吸！"
	L.breath_warning = "约5秒后，深呼吸！"

	L.surge = "能量涌动"
	L.surge_desc = "当玩家中了能量涌动时发出警报。"
	L.surge_you = ">你< 能量涌动！"
	L.surge_trigger = "%s在注视你！"

	L.phase = "阶段"
	L.phase_desc = "当进入不同阶段时发出警报。"
	L.phase2_warning = "即将 第二阶段！"
	L.phase2_trigger = "我原本只是想尽快结束你们的生命"
	L.phase2_message = "第二阶段 - 魔枢领主与永恒子嗣!"
	L.phase2_end_trigger = "够了！既然你们这么想夺回艾泽拉斯的魔法，我就给你们！"
	L.phase3_warning = "即将 第三阶段！"
	L.phase3_trigger = "现在你们幕后的主使终于出现"
	L.phase3_message = "第三阶段！"
end

L = BigWigs:NewBossLocale("Sartharion", "zhCN")
if L then
	L.engage_trigger = "我的职责是保护这些龙卵。在伤害到它们之前，你们就会被我的龙息烧成灰烬！"

	L.tsunami = "烈焰之啸"
	L.tsunami_desc = "当熔岩搅动时显示计时条。"
	L.tsunami_warning = "约5秒，烈焰之啸！"
	L.tsunami_message = "烈焰之啸！"
	L.tsunami_cooldown = "烈焰之啸冷却！"
	L.tsunami_trigger = "%s周围的岩浆沸腾了起来！"

	L.breath_cooldown = "烈焰吐息冷却！"

	L.drakes = "幼龙增援"
	L.drakes_desc = "当每只幼龙增援加入战斗时发出警报。"
	L.drakes_incomingsoon = "约5秒后，%s即将到来！"

	L.twilight = "暮光召唤"
	L.twilight_desc = "当暮光召唤时发出警报。"
	L.twilight_trigger_tenebron = "塔尼布隆开始孵蛋！"
	L.twilight_trigger_vesperon = "一只维斯匹隆的信徒出现了！"
	L.twilight_trigger_shadron = "一只沙德隆的信徒出现了！"
	L.twilight_message_tenebron = "正在孵卵！"
	L.twilight_message = "%s到来！"

	L.shadron = "沙德隆"
	L.tenebron = "塔尼布隆"
	L.vesperon = "维斯匹隆"
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "zhCN")
if L then
	L.whiteout_bar = "霜至：>%d<！"
	L.whiteout_message = "即将 霜至：>%d<！"

	L.frostbite_message = "冰霜撕咬%2$dx：>%1$s<！"

	L.freeze_message = "大地冰封！"

	L.orb_bar = "<下一冰冻之球>"
end
