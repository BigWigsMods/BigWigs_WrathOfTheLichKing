-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "zhCN")
if L then
	L.bone_spike = "骨针" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "zhCN")
if L then
	L.touch = "蔑视之触"
	L.deformed_fanatic = "畸形的狂热者" -- NPC ID 38135
	L.empowered_adherent = "亢奋的追随者" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "zhCN")
if L then
	L.adds_trigger_alliance = "将士们，给我进攻"
	L.adds_trigger_horde = "将士们，给我进攻"

	L.mage = "法师"
	L.mage_desc = "当法师出现冰冻炮舰火炮时发出警报。"
	-- 联盟: 我们的船体受损了，赶快叫个战斗法师来轰掉那些大炮！
	-- 部落: 我们的船体受伤了，赶快叫个法师来干掉那些大炮！
	L.mage_yell_trigger = "我们的船体"

	L.warmup_trigger_alliance = "启动引擎！小伙子们"
	L.warmup_trigger_horde = "来吧！部落忠诚勇敢的儿女们"

	L.disable_trigger_alliance = "我早就警告过你，恶棍"
	L.disable_trigger_horde = "联盟不行了。向巫妖王进攻！"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "zhCN")
if L then
	L.blood_beast = "血兽" -- NPC ID 38508

	L.warmup_alliance = "那我们要行动了，我们要……"
	L.warmup_horde = "库卡隆，行动！勇士们，提高警惕。天灾军团已经"
end

L = BigWigs:NewBossLocale("Blood Prince Council", "zhCN")
if L then
	L.switch_message = "生命转换：%s！"
	L.switch_bar = "下一生命转换"

	L.empowered_flames = "塑造强能烈焰"

	L.empowered_shock_message = "正在施放强能震荡涡流！"
	L.regular_shock_message = "强能震荡涡流区域！"
	L.shock_bar = "下一强能震荡涡流"

	L.iconprince = "标记强化的鲜血王子"
	L.iconprince_desc = "为强化的鲜血王子打上团队标记。（需要权限）"

	L.prison_message = "暗影牢笼：x%d！"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "zhCN")
if L then
	L.engage_trigger = "你做了一个……愚蠢的……决定。"

	L.shadow = "蜂拥之影"
	L.shadow_message = "蜂拥之影！"
	L.shadow_bar = "下一蜂拥之影"

	L.feed_message = "即将 疯狂嗜血！"

	L.pact_message = "黑暗堕落者的契约"
	L.pact_bar = "下一黑暗堕落者的契约"

	L.phase_message = "即将 空中阶段！"
	L.phase1_bar = "地面阶段"
	L.phase2_bar = "空中阶段"
end

L = BigWigs:NewBossLocale("Festergut", "zhCN")
if L then
	L.engage_trigger = "玩吗？玩吗？"

	L.inhale_bar = "下一凋零呼吸：%d"
	L.blight_warning = "约5秒后，刺鼻毒气！"
	L.ball_message = "即将 绿色软泥黏液球！"
end

L = BigWigs:NewBossLocale("Professor Putricide", "zhCN")
if L then
	L.engage_trigger = "喜讯，各位！我想我已经研制出一种能够毁灭艾泽拉斯的药剂了！"

	L.phase = "阶段"
	L.phase_desc = "当进入不同阶段时发出警报。"
	L.phase_warning = "即将 第%d阶段！"
	L.phase_bar = "下一阶段"

	L.ball_bar = "下一可延展黏液"
	L.ball_say = "即将 可延展黏液！"

	L.experiment_message = "即将 软泥怪！"
	L.experiment_heroic_message = "即将 软泥怪！"
	L.experiment_bar = "下一软泥怪"
	L.blight_message = "毒肿！"
	L.violation_message = "不稳定的软泥怪！"

	L.gasbomb_bar = "多个窒息毒气弹"
	L.gasbomb_message = "窒息毒气弹！"
end

L = BigWigs:NewBossLocale("Rotface", "zhCN")
if L then
	L.engage_trigger = "WEEEEEE!"

	L.infection_message = "畸变感染！"

	L.ooze = "软泥融合"
	L.ooze_desc = "当软泥融合时发出警报。"
	L.ooze_message = "不稳定的软泥：%dx！"

	L.spray_bar = "下一软泥喷射"
end

L = BigWigs:NewBossLocale("Sindragosa", "zhCN")
if L then
	L.engage_trigger = "你们这些蠢货胆敢闯入这里"  -- 你们这些蠢货胆敢闯入这里。诺森德的冰风将卷走你们的灵魂！

	L.phase2 = "第二阶段"
	L.phase2_desc = "当辛达苟萨进入第二阶段发出警报。（35%）"
	L.phase2_trigger = "绝望吧，体会主人那无穷无尽的力量吧"
	L.phase2_message = "第二阶段！"

	L.airphase = "空中阶段"
	L.airphase_desc = "当辛达苟萨起飞时发出警报。"
	L.airphase_trigger = "你们的入侵结束了"
	L.airphase_message = "空中阶段！"
	L.airphase_bar = "下一空中阶段"

	L.boom_message = "严寒！"
	L.boom_bar = "严寒"

	L.instability_message = "动荡 x%d！"
	L.chilled_message = "寒霜刺骨 x%d！"
	L.buffet_message = "秘法打击 x%d！"
	L.buffet_cd = "下一狂咒"
end

L = BigWigs:NewBossLocale("The Lich King", "zhCN")
if L then
	L.warmup_trigger = "怎么，自诩正义的圣光终于来了"  -- 怎么，自诩正义的圣光终于来了？我是不是该丢下霜之哀伤，恳求您的宽恕呢，弗丁？
	L.engage_trigger = "我会让你活着目睹这个末日，弗丁。"  -- 我会让你活着目睹这个末日，弗丁。这悲惨的世界将在我手中重铸，我不想让圣光最强大的勇士错过这一切。

	L.horror_message = "蹒跚的血僵尸！"
	L.horror_bar = "下一血僵尸"

	L.valkyr_message = "瓦格里暗影戒卫者！"
	L.valkyr_bar = "下一瓦格里暗影戒卫者"
	L.valkyrhug_message = "瓦格里抓人！"

	L.cave_phase = "剑内阶段！"
	L.last_phase_bar = "最终阶段"

	L.frenzy_bar = "%s狂乱！"
	L.frenzy_survive_message = "%s将在瘟疫后存活！"
	L.frenzy_message = "小怪狂乱！"
	L.frenzy_soon_message = "5秒后，狂乱！"

	L.custom_on_valkyr_marker = "瓦格里标记"
	L.custom_on_valkyr_marker_desc = "使用 {rt8}{rt7}{rt6} 标记瓦格里，需要权限。\n|cFFFF0000团队中只有1名应该启用此选项以防止标记冲突。|r\n|cFFADFF2F提示：如果团队选择你打开此选项，鼠标快速指向瓦格里是标记他们的最快方式。|r"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "zhCN")
if L then
	L.engage_trigger = "入侵者闯入了内室。加紧毁掉那条绿龙！留下龙筋龙骨用来复生！"

	L.portal = "梦魇之门"
	L.portal_desc = "当踏梦者瓦利瑟瑞娅打开梦魇之门时发出警报。"
	L.portal_message = "打开梦魇之门！"
	L.portal_bar = "即将梦魇之门"
	L.portalcd_message = "14秒后，梦魇之门：%d！"
	L.portalcd_bar = "下一梦魇之门：%d"
	L.portal_trigger = "我打开了进入梦境的传送门。英雄们，救赎就在其中……"

	L.suppresser = "抑制者出现"
	L.suppresser_desc = "当一群抑制者出现时发出警报。"
	L.suppresser_message = "即将出现 抑制者！"

	L.blazing = "炽热骷髅"
	L.blazing_desc = "炽热骷髅|cffff0000监视|r出现计时条。此计时条可能不准确，只做参考。"
	L.blazing_warning = "即将 炽热骷髅！"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "zhCN")
if L then
	L.deathbound_ward = "缚亡守卫"
	L.deathspeaker_high_priest = "亡语高阶祭司" -- NPC ID 36829
	L.putricide_dogs = "小宝和大臭"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "zhCN")
if L then
	L.engage_message = "阿努巴拉克已激活，80秒后，钻地！"
	L.engage_trigger = "这里将是你的葬身之地！"

	L.unburrow_trigger = "从地面上升起"
	L.burrow_trigger = "钻入了地下"
	L.burrow = "钻地"
	L.burrow_desc = "当阿努巴拉克钻地时显示计时条。"
	L.burrow_soon = "即将 钻地！"

	L.nerubian_message = "即将 增援！"
	L.nerubian_burrower = "更多增援！"

	L.shadow_soon = "约5秒后，暗影突击！"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "zhCN")
if L then
	L.wipe_trigger = "悲剧……"

	L.engage_trigger = "他来自风暴峭壁最幽深，最黑暗的洞穴，穿刺者戈莫克！准备战斗，英雄们！"
	L.jormungars_trigger = "做好准备，英雄们，两头猛兽已经进入了竞技场！它们是酸喉和恐鳞！"
	L.icehowl_trigger = "当下一名斗士出场时，空气都会为之冻结！它是冰吼，胜或是死，勇士们！"
	L.boss_incoming = "即将 %s！"

	L.gormok = "穿刺者戈莫克"
	L.jormungars = "酸喉和恐鳞"
	L.icehowl = "冰吼"

	-- Gormok
	L.snobold = "狗头人奴隶"
	L.snobold_desc = "当出现狗头人奴隶时发出警报。"

	-- Jormungars
	L.submerge = "潜地"
	L.submerge_desc = "当下一次虫子即将潜地时显示计时条。"
	L.spew = "强酸/熔岩喷射"
	L.spew_desc = "当施放强酸/熔岩喷射时发出警报。"
	L.sprays = "喷溅"
	L.sprays_desc = "显示下一次麻痹喷溅和烈焰喷射计时条。"
	L.slime_message = " 你 粘液池！"
	L.burn_spell = "灼热胆汁"
	L.toxin_spell = "麻痹毒素"
	L.spray = "下一喷溅"

	-- Icehowl
	L.charge = "野性冲锋"
	L.charge_desc = "当玩家中了野性冲锋时发出警报。"
	L.charge_trigger = "%s等着"

	L.bosses = "首领"
	L.bosses_desc = "当首领即将到来时发出警报。"
end

L = BigWigs:NewBossLocale("Faction Champions", "zhCN")
if L then
	L.defeat_trigger = "肤浅且可悲的胜利。今天的内耗让我们又一次被削弱了。这种愚蠢的行为只能让巫妖王受益！伟大的战士们就这样白白牺牲，而真正的威胁却步步逼近。巫妖王正计算着我们的死期。"

	L["Shield on %s!"] = "圣盾术：%s ！"
	L["Bladestorming!"] = "剑刃风暴！"
	L["Hunter pet up!"] = "召唤宠物！"
	L["Felhunter up!"] = "召唤地狱猎犬！"
	L["Heroism on champions!"] = "英勇！"
	L["Bloodlust on champions!"] = "嗜血！"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "zhCN")
if L then
	L.enable_trigger = "渺小的侏儒！你们的傲慢将会招致灭亡！"

	L.engage = "激活"
	L.engage_trigger = "面对加拉克苏斯吧，燃烧军团的艾瑞达之王！"
	L.engage_trigger1 = "放逐到虛空吧！"

	L.adds = "虚空传送门和地狱火山"
	L.adds_desc = "当加拉克苏斯大王召唤虚空传送门和地狱火山时发出警报和显示计时条。"

	L.incinerate_message = "血肉成灰"
	L.incinerate_other = "血肉成灰：%s ！"
	L.incinerate_bar = "下一血肉成灰"
	L.incinerate_safe = "安全：%s ！"

	L.legionflame_message = "军团烈焰"
	L.legionflame_other = "军团烈焰：%s ！"
	L.legionflame_bar = "下一军团烈焰"

	L.infernal_bar = "地狱火山出现"
	L.netherportal_bar = "下一虚空传送门"

	L.kiss_message = "你 仕女之吻！"
	L.kiss_interrupted = "打断！"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "zhCN")
if L then
	L.engage_trigger1 = "以黑暗之主的名义。为了巫妖王。你必死无疑。"

	L.vortex_or_shield_cd = "下一漩涡/盾"
	L.next = "下一漩涡/盾"
	L.next_desc = "当下一次漩涡或盾时发出警报。"

	L.vortex = "漩涡"
	L.vortex_desc = "当双子开始施放漩涡时发出警报。"

	L.shield = "黑暗/光明之盾"
	L.shield_desc = "当施放黑暗或光明之盾时发出警报。"

	L.touch = "黑暗/光明之触"
	L.touch_desc = "当玩家中了黑暗或光明之触时发出警报。"
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "zhCN")
if L then
	L.add = "地穴卫士"
	L.locust = "蝗虫"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "zhCN")
if L then
	L.silencewarn = "沉默！延缓了激怒！"
	L.silencewarn5sec = "5秒后沉默结束！"
	L.silence = "沉默"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "zhCN")
if L then
	L.phase1_trigger1 = "你们这些蠢货已经主动步入了陷阱。"
	--L.phase1_trigger2 = "Teamanare shi rikk mannor rikk lok karkun" -- Curse of Tongues
	L.phase2_trigger = "我已经等待很久了。现在你们将面对灵魂的收割者。"

	L.add = "增援"
	L.add_desc = "当增援时发出警报。"

	L.add_death = "增援死亡"
	L.add_death_desc = "当增援死亡时发出警报。"

	L.riderdiewarn = "骑兵已死亡！"
	L.dkdiewarn = "死亡骑士已死亡！"

	L.wave = "%d/23：%s"

	L.trawarn = "3秒后学徒出现"
	L.dkwarn = "3秒后死亡骑士出现"
	L.riderwarn = "3秒后骑兵出现"

	L.trabar = "学徒（%d）"
	L.dkbar = "死亡骑士（%d）"
	L.riderbar = "骑兵（%d）"

	L.gate = "门打开!"
	L.gatebar = "门打开"

	L.phase_soon = "收割者戈提克10秒后进入房间！"

	L.engage_message = "收割者戈提克已激活！"
end

L = BigWigs:NewBossLocale("Grobbulus", "zhCN")
if L then
	L.injection = "变异注射"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "zhCN")
if L then
	L.teleport_yell_trigger = "你的生命正走向终结。"
end

L = BigWigs:NewBossLocale("The Four Horsemen", "zhCN")
if L then
	L.mark = "印记"
	L.mark_desc = "当施放印记时发出警报。"

	L.engage_message = "四骑士已激活！"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "zhCN")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "克尔苏加德的大厅"

	L.phase1_trigger = "仆从们，侍卫们，隶属于黑暗与寒冷的战士们！听从克尔苏加德的召唤！"
	L.phase2_trigger1 = "祈祷我的慈悲吧！"
	L.phase2_trigger2 = "呼出你的最后一口气！"
	L.phase2_trigger3 = "你的末日临近了！"
	L.phase3_trigger = "主人，我需要帮助！"
	L.guardians_trigger = "很好，冰荒废土的战士们，起来吧！我命令你们为主人而战斗，杀戮，直到死亡！一个活口都不要留！"

	L.phase2_warning = "第二阶段 - 克尔苏加德！"
	L.phase2_bar = "激活克尔苏加德"

	L.phase3_warning = "第三阶段 - 约15秒后，寒冰皇冠卫士出现！"

	L.guardians = "寒冰皇冠卫士"
	L.guardians_desc = "当第三阶段召唤寒冰皇冠卫士时发出警报。"
	L.guardians_warning = "约10秒后，寒冰皇冠卫士出现！"
	L.guardians_bar = "寒冰皇冠卫士出现"

	L.engage_message = "克尔苏加德发动了攻击！"
end

L = BigWigs:NewBossLocale("Loatheb", "zhCN")
if L then
	L.doomtime_bar = "每隔15秒 必然的厄运"
	L.doomtime_now = "必然的厄运现在每隔15秒发动一次！"

	L.spore_warn = "孢子(%d)"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "zhCN")
if L then
	L.adds_yell_trigger = "起来吧，我的战士们" -- 起来吧，我的战士们！起来，再为主人尽忠一次！
end

L = BigWigs:NewBossLocale("Maexxna", "zhCN")
if L then
	L.webspraywarn30sec = "10秒后，蛛网裹体！"
	L.webspraywarn20sec = "蛛网裹体！10秒后小蜘蛛出现！"
	L.webspraywarn10sec = "小蜘蛛出现！10秒后蛛网喷射！"
	L.webspraywarn5sec = "蛛网喷射5秒！"

	L.enragewarn = "激怒！"
	L.enragesoonwarn = "即将 激怒！"

	L.cocoons = "蛛网裹体"
	L.spiders = "出现 小蜘蛛"
end

L = BigWigs:NewBossLocale("Sapphiron", "zhCN")
if L then
	L.airphase_trigger = "萨菲隆缓缓升空！"
	L.deepbreath_trigger = "%s深深地吸了一口气。"

	L.air_phase = "空中阶段"
	L.ground_phase = "地面阶段"

	L.ice_bomb = "寒冰炸弹"
	L.ice_bomb_warning = "即将 寒冰炸弹"
	L.ice_bomb_bar = "寒冰炸弹 落地"

	L.icebolt_say = "我是寒冰屏障！"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "zhCN")
if L then
	L.understudy = "见习死亡骑士"

	L.shout_warning = "5秒后，瓦解怒吼！"
	L.taunt_warning = "5秒后，可以嘲讽！"
	L.shieldwall_warning = "5秒后，可以白骨屏障！"
end

L = BigWigs:NewBossLocale("Thaddius", "zhCN")
if L then
	L[15929] = "斯塔拉格"
	L[15930] = "费尔根"

	L.stage2_yell_trigger1 = "咬碎……你的……骨头……"
	L.stage2_yell_trigger2 = "打……烂……你！"
	L.stage2_yell_trigger3 = "杀……"

	L.add_death_emote_trigger = "%s死了。"
	L.overload_emote_trigger = "%s超载了！"
	--L.add_revive_emote_trigger = "%s is jolted back to life!"

	L.polarity_extras = "有关极性转化后需要跑位的警报"

	L.custom_select_charge_position = "起始位置"
	L.custom_select_charge_position_desc = "第一次极性转化后的位置。"
	L.custom_select_charge_position_value1 = "|cffff2020负极(-)|r 向左, |cff20ff20正极(+)|r 向右"
	L.custom_select_charge_position_value2 = "|cff20ff20正极(+)|r 向左, |cffff2020负极(-)|r 向右"

	L.custom_select_charge_movement = "移动战术"
	L.custom_select_charge_movement_desc = "你团队使用的移动战术。"
	L.custom_select_charge_movement_value1 = "使用战术： |cff20ff20穿过|r BOSS"
	L.custom_select_charge_movement_value2 = "使用战术：在BOSS身边 |cff20ff20顺时针|r 移动"
	L.custom_select_charge_movement_value3 = "使用战术：在BOSS身边 |cff20ff20逆时针|r 移动"
	L.custom_select_charge_movement_value4 = "四点战术 1: 极性转化改变 |cff20ff20向右|r, 极性转化未改变 |cff20ff20向左|r"
	L.custom_select_charge_movement_value5 = "四点战术 2: 极性转化改变 |cff20ff20向左|r, 极性转化未改变 |cff20ff20向右|r"

	L.custom_off_charge_graphic = "图形箭头"
	L.custom_off_charge_graphic_desc = "显示图形箭头。"
	L.custom_off_charge_text = "文字箭头"
	L.custom_off_charge_text_desc = "显示文字箭头。"
	L.custom_off_charge_voice = "语音提示"
	L.custom_off_charge_voice_desc = "播放语音提示。"

	L.left = "<--- 向左 <--- 向左 <---"
	L.right = "---> 向右 ---> 向右 --->"
	L.swap = "^^^^ 交换 ^^^^ 迅速 ^^^^"
	L.stay = "==== 不要动 ==== 不要动 ===="

	L.chat_message = "电男战术模块 支持显示方向箭头和播放声音。打开选项对其进行配置。"
end

-- Northrend

L = BigWigs:NewBossLocale("Onyxia", "zhCN")
if L then
	L.phase1_trigger = "真是走运。通常我必须离开窝才能找到食物"
	L.phase2_trigger = "这毫无意义的行动让我很厌烦。我会从上空把你们都烧成灰"
	L.phase3_trigger = "看起来需要再给你一次教训，凡人"

	L.deep_breath = "深呼吸"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "zhCN")
if L then
	L.stomp_message = "践踏 - 即将 冲锋！"
	L.stomp_warning = "约5秒后，可能践踏！"

	L.charge = "冲锋"
	L.charge_desc = "当玩家中了冲锋时发出警报。"
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "zhCN")
if L then
	L.overcharge_message = "风暴爪牙 - 能量超载！"
	L.overcharge_bar = "爆炸"

	L.custom_on_overcharge_mark = "能量超载标记"
	L.custom_on_overcharge_mark_desc = "使用 {rt8} 标记能量超载的风暴爪牙，需要权限。"
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "zhCN")
if L then
	L.breath_bar = "灼热吐息：%d"
	L.breath_message = "即將 灼热吐息：%d ！"
end

L = BigWigs:NewBossLocale("Malygos", "zhCN")
if L then
	L.sparks = "能量火花"
	L.sparks_desc = "当能量火花出现时发出警报。"
	L.sparks_message = "出现 能量火花！"
	L.sparks_warning = "约5秒后，能量火花！"

	L.sparkbuff = "玛里苟斯获得能量火花"
	L.sparkbuff_desc = "当玛里苟斯获得能量火花时发出警报。"
	L.sparkbuff_message = "玛里苟斯：能量火花！"

	L.vortex = "漩涡"
	L.vortex_desc = "当施放漩涡时发出警报及显示计时条。"
	L.vortex_message = "漩涡！"
	L.vortex_warning = "约5秒后，可能漩涡！"
	L.vortex_next = "漩涡 冷却"

	L.breath = "深呼吸"
	L.breath_desc = "当施放深呼吸时发出警报。"
	L.breath_message = "深呼吸！"
	L.breath_warning = "约5秒后，深呼吸！"

	L.surge = "能量涌动"
	L.surge_desc = "当玩家中了能量涌动时发出警报。"
	L.surge_you = "你 能量涌动！"
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
	L.tsunami_trigger = "%s周围的岩浆沸腾了起来！"
	L.twilight_trigger_vesperon = "一只维斯匹隆的信徒出现了！"
	L.twilight_trigger_shadron = "一只沙德隆的信徒出现了！"

	L.drakes = "幼龙增援"
	L.drakes_desc = "当每只幼龙增援加入战斗时发出警报。"

	-- Adds
	L.shadron = "沙德隆"
	L.tenebron = "塔尼布隆"
	L.vesperon = "维斯匹隆"
	L.lava_blaze = "熔岩烈焰" -- NPC 30643
	L.acolyte_shadron = "沙德隆的追随者" -- NPC 31218
	L.acolyte_vesperon = "维斯匹隆的追随者" -- NPC 31219
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "zhCN")
if L then
	L.whiteout_bar = "霜至：%d ！"
	L.whiteout_message = "即将 霜至：%d ！"

	L.freeze_message = "大地冰封！"
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "zhCN")
if L then
	L.twilight_cutter_emote_trigger = "黑暗能量" -- 黑暗能量正在这颗旋转的魔球中脉动！
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "zhCN")
if L then
	L.baltharus = "战争之子巴尔萨鲁斯" -- NPC 39751
	L.saviana = "塞维娅娜·怒火" -- NPC 39747
	L.zarithrian = "萨瑞瑟里安将军" -- NPC 39746

	L.adds_yell_trigger = "让他们化为灰烬，仆从们！"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "zhCN")
if L then
	L.swarm_message = "守护虫群"

	L.defender = "野性防御者"
	L.defender_desc = "当野性防御者出现时发出警报。"
	L.defender_message = "野性防御者（%d/9）！"
end

L = BigWigs:NewBossLocale("Freya", "zhCN")
if L then
	L.wave = "波"
	L.wave_desc = "当一波小怪时发出警报。"
	L.wave_bar = "下一波"
	L.conservator_trigger = "艾欧娜尔，您的仆人需要帮助！"
	L.detonate_trigger = "元素之潮会击垮你们！"
	L.elementals_trigger = "孩子们，帮帮我！"
	L.tree_trigger = "|cFF00FFFF生命缚誓者的礼物|r开始生长！"
	L.conservator_message = "古树监护者！"
	L.detonate_message = "引爆鞭笞者！"
	L.elementals_message = "古代水之精魂！"

	L.tree = "艾欧娜尔的礼物"
	L.tree_desc = "当弗蕾亚召唤艾欧娜尔的礼物时发出警报。"
	L.tree_message = "艾欧娜尔的礼物 出现！"

	L.fury_message = "自然之怒"

	L.tremor_warning = "即将 大地震颤！"
	L.tremor_bar = "下一大地震颤"
	L.energy_message = "你 不稳定的能量！"
	L.sunbeam_message = "即将 阳光！"
	L.sunbeam_bar = "下一阳光"
end

L = BigWigs:NewBossLocale("Hodir", "zhCN")
if L then
	L.hardmode = "困难模式"
	L.hardmode_desc = "显示困难模式计时器。"
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "zhCN")
if L then
	L.brittle_message = "铁铸像 - 脆弱！"
end

L = BigWigs:NewBossLocale("The Iron Council", "zhCN")
if L then
	L.stormcaller_brundir = "唤雷者布隆迪尔"
	L.steelbreaker = "断钢者"
	L.runemaster_molgeim = "符文大师莫尔基姆"

	L.summoning_message = "闪电元素即将出现！"

	L.chased_other = "闪电之藤：%s ！"
	L.chased_you = "你 闪电之藤！"
end

L = BigWigs:NewBossLocale("Kologarn", "zhCN")
if L then
	L.arm = "手臂死亡"
	L.arm_desc = "当左右手臂死亡时发出警报。"
	L.left_dies = "左臂死亡！"
	L.right_dies = "右臂死亡！"
	L.left_wipe_bar = "左臂重生"
	L.right_wipe_bar = "右臂重生"

	L.eyebeam = "聚焦视线"
	L.eyebeam_desc = "当玩家中了聚焦视线时发出警报。"
end

L = BigWigs:NewBossLocale("Mimiron", "zhCN")
if L then
	L.phase = "阶段"
	L.phase_desc = "当进入不同阶段发出警报。"
	L.engage_warning = "第一阶段！"
	L.engage_trigger = "^我们时间不多了，朋友们！"
	L.phase2_warning = "即将 第二阶段！"
	L.phase2_trigger = "^太棒了！测试结果非常好！"
	L.phase3_warning = "即将 第三阶段！"
	L.phase3_trigger = "^非常感谢，朋友们！"
	L.phase4_warning = "即将 第四阶段！"
	L.phase4_trigger = "^初步测试阶段完成。"
	L.phase_bar = "阶段：%d"

	L.hardmode_trigger = "^嘿，你们为什么要这么做啊？"

	L.plasma_warning = "正在施放 等离子冲击！"
	L.plasma_soon = "即将 等离子冲击！"
	L.plasma_bar = "等离子冲击"

	L.shock_next = "下一震荡冲击！"

	L.laser_soon = "即将 P3Wx2激光弹幕！"
	L.laser_bar = "P3Wx2激光弹幕"

	L.magnetic_message = "空中指挥单位 已降落！"

	L.suppressant_warning = "即将 烈焰遏制！"

	L.fbomb_bar = "下一冰霜炸弹"

	L.bomb_message = "炸弹机器人 出现！"
end

L = BigWigs:NewBossLocale("Razorscale", "zhCN")
if L then
	L.ground_trigger = "快一点！她马上就要挣脱了！"
	L.ground_message = "锋鳞被锁住了！"
	L.air_message = "起飞！"

	L.harpoon = "鱼叉炮台"
	L.harpoon_desc = "当鱼叉炮台可用时发出警报。"
	L.harpoon_message = "鱼叉炮台：%d 可用！"
	L.harpoon_trigger = "可以使用鱼叉炮台了！"
	L.harpoon_nextbar = "鱼叉炮台：%d"
end

L = BigWigs:NewBossLocale("Thorim", "zhCN")
if L then
	L.phase2_trigger = "入侵者！你们这些凡人竟敢坏了我的兴致，看我怎么……等等，你们……"
	L.phase3_trigger = "狂妄的小崽子们，竟敢在我的地盘上挑战我？我要亲自碾碎你们！"

	L.hardmode = "困难模式"
	L.hardmode_desc = "显示困难模式计时器。"
	L.hardmode_warning = "困难模式结束！"

	L.barrier_message = "符文巨像 - 符文屏障！"

	L.charge_message = "闪电充能：%d ！"
	L.charge_bar = "闪电充能：%d"
end

L = BigWigs:NewBossLocale("General Vezax", "zhCN")
if L then
	L.surge_bar = "黑暗涌动：%d"

	L.animus = "萨隆邪铁畸体"
	L.animus_desc = "当萨隆邪铁畸体出现时发出警报。"
	L.animus_trigger = "萨隆邪铁蒸汽剧烈地旋转着，汇集成一个畸体。"
	L.animus_message = "萨隆邪铁畸体 出现！"

	L.vapor = "萨隆邪铁蒸汽"
	L.vapor_desc = "当萨隆邪铁蒸汽出现时发出警报。"
	L.vapor_message = "萨隆邪铁蒸汽：%d ！"
	L.vapor_bar = "萨隆邪铁蒸汽"
	L.vapor_trigger = "一团萨隆邪铁蒸汽在附近聚集起来！"

	L.vaporstack = "萨隆邪铁蒸汽堆叠"
	L.vaporstack_desc = "当玩家中了5层或更多萨隆邪铁蒸汽时发出警报。"
	L.vaporstack_message = "萨隆邪铁蒸汽：x%d ！"

	L.crash_say = "暗影冲撞"

	L.mark_message = "无面者的印记"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "zhCN")
if L then
	L.lightbomb_other = "灼热之光"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "zhCN")
if L then
	L.engage_trigger = "攻击这头野兽要害的时刻即将来临！将你们的愤怒和仇恨倾泻到它的爪牙身上！"
	L.phase2_trigger = "我是清醒的梦境。"
	L.phase3_trigger = "凝视死亡的真正面孔吧，你们的末日就要来了！"

	L.portal = "传送门"
	L.portal_desc = "当传送门时发出警报。"
	L.portal_message = "开启传送门！"
	L.portal_bar = "下一传送门"

	L.fervor_message = "萨拉的热情：%s ！"

	L.sanity_message = "你 即将疯狂！"

	L.weakened = "昏迷"
	L.weakened_desc = "当尤格-萨隆昏迷时发出警报。"
	L.weakened_message = "昏迷：%s ！"

	L.madness_warning = "10秒后，疯狂诱导！"
	L.malady_message = "心灵疾病" -- short for Malady of the Mind (63830)

	L.tentacle = "重压触须"
	L.tentacle_desc = "当重压触须出现时发出警报。"
	L.tentacle_message = "重压触须：%d ！"

	L.small_tentacles = "小型触须"
	L.small_tentacles_desc = "警告腐蚀触须和缠绕触须的刷新时间。"

	L.link_warning = "你 心智链接！"

	L.guardian_message = "召唤卫士：%d ！"

	L.roar_warning = "5秒后，震耳咆哮！"
	L.roar_bar = "下一震耳咆哮"
end
