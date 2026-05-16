-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "zhTW")
if L then
	--L.bone_spike = "Bone Spike" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "zhTW")
if L then
	L.touch = "無脅之觸"
	L.deformed_fanatic = "畸形的狂熱者" -- NPC ID 38135
	--L.empowered_adherent = "Empowered Adherent" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "zhTW")
if L then
	L.adds_trigger_alliance = "劫奪者，士官們，攻擊!"
	L.adds_trigger_horde = "海員們，士官們，攻擊!"

	L.mage = "法師"
	L.mage_desc = "當法師出現冰凍砲艇火砲時發出警報。"
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	L.warmup_trigger_alliance = "發動引擎"
	L.warmup_trigger_horde = "起來吧，部落的子女"

	L.disable_trigger_alliance = "向前衝"
	L.disable_trigger_horde = "向巫妖王前進"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "zhTW")
if L then
	--L.blood_beast = "Blood Beast" -- NPC ID 38508

	L.warmup_alliance = "那我們走吧!快點……"
	L.warmup_horde = "柯爾克隆，前進!勇士們，要當心，天譴軍團已經……"
end

L = BigWigs:NewBossLocale("Blood Prince Council", "zhTW")
if L then
	L.switch_message = "生命轉換：>%s<！"
	L.switch_bar = "<下一生命轉換>"

	L.empowered_flames = "製造強力烈焰"

	L.empowered_shock_message = "正在施放 強力震擊漩渦！"
	L.regular_shock_message = "強力震擊漩渦區域！"
	L.shock_bar = "<下一強力震擊漩渦>"

	L.iconprince = "強化的血親王標記"
	L.iconprince_desc = "為強化的血親王打上團隊標記。（需要權限）"

	L.prison_message = "暗影之牢：>x%d<！"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "zhTW")
if L then
	L.engage_trigger = "你做了一個…不明智的…選擇。"

	L.shadow = "群聚暗影"
	L.shadow_message = "群聚暗影！"
	L.shadow_bar = "<下一群聚暗影>"

	L.feed_message = "即將 狂亂嗜血！"

	L.pact_message = "暗殞契印"
	L.pact_bar = "<下一暗殞契印>"

	L.phase_message = "即將 空中階段！"
	L.phase1_bar = "<地面階段>"
	L.phase2_bar = "<空中階段>"
end

L = BigWigs:NewBossLocale("Festergut", "zhTW")
if L then
	L.engage_trigger = "玩耍時間?"

	L.inhale_bar = "<下一吸入荒疫：%d>"
	L.blight_warning = "約5秒後，刺鼻荒疫！"
	L.ball_message = "即將 綠色黏液之球！"
end

L = BigWigs:NewBossLocale("Professor Putricide", "zhTW")
if L then
	L.engage_trigger = "大夥聽著，好消息!"

	L.phase = "階段"
	L.phase_desc = "當進入不同階段發出警報。"
	L.phase_warning = "即將 第%d階段！"
	L.phase_bar = "<下一階段>"

	L.ball_bar = "<下一延展黏液>"
	L.ball_say = "即將 延展黏液！"

	L.experiment_message = "即將 軟泥怪！"
	L.experiment_heroic_message = "即將 軟泥怪！"
	L.experiment_bar = "<下一軟泥怪>"
	L.blight_message = "毒氣雲！"
	L.violation_message = "暴躁軟泥怪！"

	L.gasbomb_bar = "<多個窒息毒氣彈>"
	L.gasbomb_message = "窒息毒氣彈！"
end

L = BigWigs:NewBossLocale("Rotface", "zhTW")
if L then
	L.engage_trigger = "不不不不不!"

	L.infection_message = "突變感染"

	L.ooze = "軟泥融合"
	L.ooze_desc = "當軟泥融合時發出警報！"
	L.ooze_message = "不穩定的軟泥：>%dx<！"

	L.spray_bar = "<下一泥漿噴霧>"
end

L = BigWigs:NewBossLocale("Sindragosa", "zhTW")
if L then
	L.engage_trigger = "你們真是夠蠢了才會來到此地。北裂境的冰冷寒風將吞噬你們的靈魂!"

	L.phase2 = "第二階段"
	L.phase2_desc = "當辛德拉苟莎進入第二階段發出警報。（35%）"
	L.phase2_trigger = "現在，絕望地感受我主無限的力量吧!"
	L.phase2_message = "第二階段！"

	L.airphase = "空中階段"
	L.airphase_desc = "當辛德拉苟莎起飛時發出警報。"
	L.airphase_trigger = "你們的入侵將在此終止!誰也別想存活!"
	L.airphase_message = "空中階段！"
	L.airphase_bar = "<下一空中階段>"

	L.boom_message = "極凍之寒！"
	L.boom_bar = "<極凍之寒>"

	L.instability_message = "不穩定 x%d！"
	L.chilled_message = "沁骨之寒 x%d！"
	L.buffet_message = "秘能連擊 x%d！"
	L.buffet_cd = "<下一無束魔法>"
end

L = BigWigs:NewBossLocale("The Lich King", "zhTW")
if L then
	L.warmup_trigger = "聖光所謂的正義終於來了嗎"
	L.engage_trigger = "我會讓你活著見證到最後，弗丁"

	L.horror_message = "蹣跚的血殭屍！"
	L.horror_bar = "<下一血殭屍>"

	L.valkyr_message = "華爾琪影衛！"
	L.valkyr_bar = "<下一華爾琪影衛>"
	L.valkyrhug_message = "華爾琪抓人！"

	L.cave_phase = "劍內階段！"
	L.last_phase_bar = "<最終階段>"

	L.frenzy_bar = "%s狂亂！"
	L.frenzy_survive_message = "%s將在瘟疫後存活！"
	L.frenzy_message = "小怪狂亂！"
	L.frenzy_soon_message = "5秒後，狂亂！"

	L.custom_on_valkyr_marker = "華爾琪標記"
	L.custom_on_valkyr_marker_desc = "使用 {rt8}{rt7}{rt6} 標記華爾琪，需要權限。\n|cFFFF0000團隊中只有1名應該啟用此選項以防止標記衝突。|r\n|cFFADFF2F提示：如果團隊選擇你打開此選項，滑鼠快速指向華爾琪是標記他們的最快方式。|r"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "zhTW")
if L then
	L.engage_trigger = "入侵者已經突破了內部聖所。加快摧毀綠龍的速度!只要留下骨頭和肌腱來復活!"

	L.portal = "夢魘之門"
	L.portal_desc = "當瓦莉絲瑞雅·夢行者打開夢魘之門時發出警報。"
	L.portal_message = "打開夢魘之門！"
	L.portal_bar = "<即將夢魘之門>"
	L.portalcd_message = "14秒後，夢魘之門：>%d<！"
	L.portalcd_bar = "<下一夢魘之門：%d>"
	L.portal_trigger = "我打開了一道傳送門通往夢境。你們的救贖就在其中，英雄們……"

	L.suppresser = "抑制者出現"
	L.suppresser_desc = "當一群抑制者出現時發出警報。"
	L.suppresser_message = "即將出現 抑制者！"

	L.blazing = "熾熱骷髏"
	L.blazing_desc = "熾熱骷髏|cffff0000監視|r出現計時條。此計時條可能不準確，只做參考。"
	L.blazing_warning = "即將 熾熱骷髏！"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "zhTW")
if L then
	L.deathbound_ward = "縛亡守衛"
	--L.deathspeaker_high_priest = "Deathspeaker High Priest" -- NPC ID 36829
	L.putricide_dogs = "小寶 & 大臭"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "zhTW")
if L then
	L.engage_message = "阿努巴拉克進入戰鬥，80秒後，鑽地！"
	L.engage_trigger = "這裡將會是你們的墳墓!"

	L.unburrow_trigger = "從地底鑽出"
	L.burrow_trigger = "鑽進地裡"
	L.burrow = "鑽地"
	L.burrow_desc = "當阿努巴拉克鑽地時顯示計時條。"
	L.burrow_soon = "即將 鑽地！"

	L.nerubian_message = "即將 增援！"
	L.nerubian_burrower = "更多增援！"

	L.shadow_soon = "約5秒後，暗影打擊！"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "zhTW")
if L then
	L.wipe_trigger = "真可惜…"

	L.engage_trigger = "來自風暴群山最深邃，最黑暗的洞穴。歡迎『穿刺者』戈莫克!戰鬥吧，英雄們!"
	L.jormungars_trigger = "準備面對酸喉和懼鱗的雙重夢魘吧，英雄們，快就定位!"
	L.icehowl_trigger = "下一場參賽者的出場連空氣都會為之凝結:冰嚎!戰個你死我活吧，勇士們!"
	L.boss_incoming = "即將%s！"

	L.gormok = "『穿刺者』戈莫克"
	L.jormungars = "酸喉與懼鱗"
	L.icehowl = "冰嚎"

	-- Gormok
	L.snobold = "極地狗頭人奴僕"
	L.snobold_desc = "當出現極地狗頭人奴僕時發出警報。"

	-- Jormungars
	L.submerge = "隱沒"
	L.submerge_desc = "當下一次蟲子即將隱沒時顯示計時條。"
	L.spew = "酸液/熔火噴灑"
	L.spew_desc = "當施放酸液/熔火噴灑時發出警報。"
	L.sprays = "噴霧"
	L.sprays_desc = "顯示下一次痲痺噴霧和燃燒噴霧計時條。"
	L.slime_message = ">你< 泥漿池！"
	L.burn_spell = "燃燒膽汁"
	L.toxin_spell = "痲痺劇毒"
	L.spray = "<下一噴霧>"

	-- Icehowl
	L.charge = "狂烈衝鋒"
	L.charge_desc = "當玩家中了狂烈衝鋒時發出警報。"
	L.charge_trigger = "%s怒視著"

	L.bosses = "首領"
	L.bosses_desc = "當首領即將到來時發出警報。"
end

L = BigWigs:NewBossLocale("Faction Champions", "zhTW")
if L then
	L.defeat_trigger = "膚淺而悲痛的勝利。今天痛失的生命反而令我們更加的頹弱。除了巫妖王之外，誰還能從中獲利?偉大的戰士失去了寶貴生命。為了什麼?真正的威脅就在前方 - 巫妖王在死亡的領域中等著我們。"

	L["Shield on %s!"] = "聖盾術：>%s<！"
	L["Bladestorming!"] = "劍刃風暴！"
	L["Hunter pet up!"] = "呼喚寵物！"
	L["Felhunter up!"] = "召喚惡魔獵犬！"
	L["Heroism on champions!"] = "英勇氣概！"
	L["Bloodlust on champions!"] = "嗜血術！"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "zhTW")
if L then
	L.enable_trigger = "卑微的地精!你的傲慢將使你喪命!"

	L.engage = "進入戰鬥"
	L.engage_trigger = "你面對的是賈拉克瑟斯，燃燒軍團的埃雷達爾領主!"
	L.engage_trigger1 = "放逐到虛空吧!"

	L.adds = "虛空傳送門和煉獄火山"
	L.adds_desc = "當賈拉克瑟斯領主召喚虛空傳送門和煉獄火山時發出警報和顯示計時條。"

	L.incinerate_message = "焚化血肉"
	L.incinerate_other = "焚化血肉：>%s<！"
	L.incinerate_bar = "<下一焚化血肉>"
	L.incinerate_safe = "安全：>%s<！"

	L.legionflame_message = "軍團烈焰"
	L.legionflame_other = "軍團烈焰：>%s<！"
	L.legionflame_bar = "<下一軍團烈焰>"

	L.infernal_bar = "<煉獄火山出現>"
	L.netherportal_bar = "<下一虛空傳送門>"

	L.kiss_message = ">你< 仕女之吻！"
	L.kiss_interrupted = "中斷！"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "zhTW")
if L then
	L.engage_trigger1 = "以我們的黑暗君王之名。為了巫妖王。你‧得‧死。"

	L.vortex_or_shield_cd = "<下一漩渦/盾>"
	L.next = "下一漩渦/盾"
	L.next_desc = "當下一次漩渦或盾時發出警報。"

	L.vortex = "漩渦"
	L.vortex_desc = "當華爾琪雙子開始施放漩渦時發出警報。"

	L.shield = "黑暗/光明之盾"
	L.shield_desc = "當施放黑暗或光明之盾時發出警報。"

	L.touch = "黑暗/光明之觸"
	L.touch_desc = "當玩家中了黑暗或光明之觸時發出警報。"
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "zhTW")
if L then
	L.add = "地穴衛士"
	L.locust = "蝗蟲"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "zhTW")
if L then
	L.silencewarn = "沉默！延緩了狂怒！"
	L.silencewarn5sec = "5秒後沉默結束！"
	L.silence = "沉默"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "zhTW")
if L then
	L.phase1_trigger1 = "你們這些蠢貨已經主動步入了陷阱。"
	L.phase1_trigger2 = "Kazile Teamanare ZennshinagasRil" -- Curse of Tongues CHECK THIS
	L.phase2_trigger = "我已經等待很久了。現在你們將面對靈魂的收割者。"

	L.add = "增援警報"
	L.add_desc = "當增援時發出警報。"

	L.add_death = "增援死亡"
	L.add_death_desc = "當增援死亡時發出警報。"

	L.riderdiewarn = "騎兵已死亡！"
	L.dkdiewarn = "死亡騎士已死亡！"

	L.wave = "%d/23：%s"

	L.trawarn = "3秒後受訓員出現"
	L.dkwarn = "3秒後死亡騎士出現"
	L.riderwarn = "3秒後騎兵出現"

	L.trabar = "受訓員（%d）"
	L.dkbar = "死亡騎士（%d）"
	L.riderbar = "騎兵（%d）"

	--L.gate = "Gate Open!"
	--L.gatebar = "Gate opens"

	L.phase_soon = "10秒後進入房間！"

	L.engage_message = "『收割者』高希已進入參戰！"
end

L = BigWigs:NewBossLocale("Grobbulus", "zhTW")
if L then
	L.injection = "突變注射"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "zhTW")
if L then
	L.teleport_yell_trigger = "你的生命正走向終結。"
end

L = BigWigs:NewBossLocale("The Four Horsemen", "zhTW")
if L then
	L.mark = "印記"
	L.mark_desc = "當施放印記時發出警報。"

	L.engage_message = "四騎士已進入參戰！"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "zhTW")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "科爾蘇加德之間"

	L.phase1_trigger = "僕從們，侍衛們，隸屬於黑暗與寒冷的戰士們!聽從科爾蘇加德的召喚!"
	L.phase2_trigger1 = "祈禱我的慈悲吧!"
	L.phase2_trigger2 = "呼出你的最後一口氣!"
	L.phase2_trigger3 = "你的末日臨近了!"
	L.phase3_trigger = "主人，我需要幫助!"
	L.guardians_trigger = "非常好，凍原的戰士們，起來吧!我命令你們作戰，為你們的主人殺戮或獻身吧!不要留下活口!"

	L.phase2_warning = "第二階段 - 科爾蘇加德！"
	L.phase2_bar = "科爾蘇加德進入戰鬥"

	L.phase3_warning = "第三階段 - 約15秒後，寒冰皇冠守衛者出現！"

	L.guardians = "寒冰皇冠守護者"
	L.guardians_desc = "當第三階段召喚寒冰皇冠守護者時發出警報。"
	L.guardians_warning = "約10秒後，寒冰皇冠守護者出現！"
	L.guardians_bar = "寒冰皇冠守護者出現"

	--L.engage_message = "Kel'Thuzad encounter started!"
end

L = BigWigs:NewBossLocale("Loatheb", "zhTW")
if L then
	L.doomtime_bar = "每隔15秒 無可避免的末日"
	L.doomtime_now = "無可避免的末日現在每隔15秒發動一次！"

	L.spore_warn = "孢子(%d)"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "zhTW")
if L then
	L.adds_yell_trigger = "起來吧，我的戰士們" -- 起來吧，我的戰士們!起來，再為主人盡忠一次!
end

L = BigWigs:NewBossLocale("Maexxna", "zhTW")
if L then
	L.webspraywarn30sec = "10秒後，纏繞之網！"
	L.webspraywarn20sec = "纏繞之網！10秒後小蜘蛛出現！"
	L.webspraywarn10sec = "小蜘蛛出現！10秒後撒網！"
	L.webspraywarn5sec = "撒網5秒！"

	L.enragewarn = "狂怒！"
	L.enragesoonwarn = "即將 狂怒！"

	L.cocoons = "纏繞之網"
	L.spiders = "出現 小蜘蛛"
end

L = BigWigs:NewBossLocale("Sapphiron", "zhTW")
if L then
	L.airphase_trigger = "%s離地升空了!"
	L.deepbreath_trigger = "%s深深地吸了一口氣……" -- XXX Verify

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	L.ice_bomb = "寒冰炸彈"
	L.ice_bomb_warning = "即將 寒冰炸彈"
	L.ice_bomb_bar = "寒冰炸彈 落地"

	L.icebolt_say = "我是寒冰凍體！"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "zhTW")
if L then
	L.understudy = "見習死亡騎士"

	L.shout_warning = "5秒後，混亂怒吼！"
	L.taunt_warning = "5秒後，可以嘲諷！"
	L.shieldwall_warning = "5秒後，可以骸骨屏障！"
end

L = BigWigs:NewBossLocale("Thaddius", "zhTW")
if L then
	L[15929] = "斯塔拉格"
	L[15930] = "伏晨"

	L.stage2_yell_trigger1 = "咬碎……你的……骨頭……"
	L.stage2_yell_trigger2 = "打…碎…你……"
	L.stage2_yell_trigger3 = "殺……"

	L.add_death_emote_trigger = "%s死亡了。"
	L.overload_emote_trigger = "%s超負荷！"
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

	L.left = "<--- 到左邊 <--- 到左邊 <---"
	L.right = "---> 向右 ---> 向右 --->"
	L.swap = "^^^^ 交換 ^^^^ 交換 ^^^^"
	L.stay = "==== 不要動 ==== 不要動 ===="

	--L.chat_message = "The Thaddius mod supports showing you directional arrows and playing voices. Open the options to configure them."
end

-- Northrend

L = BigWigs:NewBossLocale("Onyxia", "zhTW")
if L then
	L.phase1_trigger = "真是幸運。通常我為了覓食就必須離開窩"
	L.phase2_trigger = "這毫無意義的行動讓我很厭煩。我會從上空把你們都燒成灰"
	L.phase3_trigger = "看起來需要再給你一次教訓，凡人"

	L.deep_breath = "深呼吸"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "zhTW")
if L then
	L.stomp_message = "踐踏 - 即將 衝鋒！"
	L.stomp_warning = "約5秒後，可能踐踏！"

	L.charge = "衝鋒"
	L.charge_desc = "當玩家中了衝鋒時發出警報。"
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "zhTW")
if L then
	L.overcharge_message = "暴雨爪牙 - 超載！"
	L.overcharge_bar = "<爆炸>"

	L.custom_on_overcharge_mark = "Overcharge marker"
	L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "zhTW")
if L then
	L.breath_bar = "<燃燒之息：%d>"
	L.breath_message = "即將 燃燒之息：>%d<！"
end

L = BigWigs:NewBossLocale("Malygos", "zhTW")
if L then
	L.sparks = "力量火花"
	L.sparks_desc = "當力量火花出現時發出警報。"
	L.sparks_message = "出現 力量火花！"
	L.sparks_warning = "約5秒後，力量火花！"

	L.sparkbuff = "瑪里苟斯獲得力量火花"
	L.sparkbuff_desc = "當瑪里苟斯獲得力量火花時發出警報。"
	L.sparkbuff_message = "瑪里苟斯：>力量火花<！"

	L.vortex = "漩渦"
	L.vortex_desc = "當施放漩渦時發出警報及顯示計時條。"
	L.vortex_message = "漩渦！"
	L.vortex_warning = "約5秒後，可能漩渦！"
	L.vortex_next = "<漩渦 冷卻>"

	L.breath = "深呼吸"
	L.breath_desc = "當施放深呼吸時發出警報。"
	L.breath_message = "深呼吸！"
	L.breath_warning = "約5秒後，深呼吸！"

	L.surge = "力量奔騰"
	L.surge_desc = "當玩家中了力量奔騰時發出警報。"
	L.surge_you = ">你< 力量奔騰！"
	L.surge_trigger = "%s將他的目光鎖在你身上!"

	L.phase = "階段"
	L.phase_desc = "當進入不同階段時發出警報。"
	L.phase2_warning = "即將 第二階段！"
	L.phase2_trigger = "我原本只是想盡快結束你們的生命"
	L.phase2_message = "第二階段 - 奧核領主與永恆之裔！"
	L.phase2_end_trigger = "夠了!既然你們這麼想奪回艾澤拉斯的魔法，我就給你們!"
	L.phase3_warning = "即將 第三階段！"
	L.phase3_trigger = "現在你們幕後的主使終於出現"
	L.phase3_message = "第三階段！"
end

L = BigWigs:NewBossLocale("Sartharion", "zhTW")
if L then
	L.engage_trigger = "我的職責是看守這些龍蛋。在你傷害這些蛋以前，我會先燒了你！"
	L.tsunami_trigger = "圍繞著%s的熔岩開始劇烈地翻騰!"
	L.twilight_trigger_vesperon = "一個維斯佩朗信徒從暮光中出現!"
	L.twilight_trigger_shadron = "一個夏德朗信徒從暮光中出現!"

	L.drakes = "飛龍增援"
	L.drakes_desc = "當每只飛龍增援加入戰鬥時發出警報。"

	-- Adds
	L.shadron = "夏德朗"
	L.tenebron = "坦納伯朗"
	L.vesperon = "維斯佩朗"
	L.lava_blaze = "熔炎" -- NPC 30643
	L.acolyte_shadron = "夏德朗侍僧" -- NPC 31218
	L.acolyte_vesperon = "維斯佩朗侍僧" -- NPC 31219
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "zhTW")
if L then
	L.whiteout_bar = "寒霜厲雪：>%d<！"
	L.whiteout_message = "即將寒霜厲雪：>%d<！"

	L.freeze_message = "冰凍之地！"
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "zhTW")
if L then
	L.twilight_cutter_emote_trigger = "這些環繞" -- 這些環繞的球體散發著黑暗能量!
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "zhTW")
if L then
	--L.baltharus = "Baltharus the Warborn" -- NPC 39751
	--L.saviana = "Saviana Ragefire" -- NPC 39747
	--L.zarithrian = "General Zarithrian" -- NPC 39746

	L.adds_yell_trigger = "去吧!將他們挫骨揚灰!"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "zhTW")
if L then
	L.swarm_message = "守護貓群"

	L.defender = "野性防衛者"
	L.defender_desc = "當野性防衛者出現時發出警報。"
	L.defender_message = "野性防衛者（%d/9）！"
end

L = BigWigs:NewBossLocale("Freya", "zhTW")
if L then
	L.wave = "波"
	L.wave_desc = "當一波小怪時發出警報。"
	L.wave_bar = "<下一波>"
	L.conservator_trigger = "伊歐娜，你的僕從需要協助!"
	L.detonate_trigger = "元素們將襲捲你們!"
	L.elementals_trigger = "孩子們，協助我!"
	L.tree_trigger = "一個|cFF00FFFF生命守縛者之禮|r開始生長!"
	L.conservator_message = "古樹護存者！"
	L.detonate_message = "引爆鞭笞者！"
	L.elementals_message = "上古水之靈！"

	L.tree = "伊歐娜的贈禮"
	L.tree_desc = "當芙蕾雅召喚伊歐娜的贈禮時發出警報。"
	L.tree_message = "伊歐娜的贈禮 出現！"

	L.fury_message = "自然烈怒"

	L.tremor_warning = "即將 地面震顫！"
	L.tremor_bar = "<下一地面震顫>"
	L.energy_message = ">你< 不穩定的能量！"
	L.sunbeam_message = "即將 太陽光束！"
	L.sunbeam_bar = "<下一太陽光束>"
end

L = BigWigs:NewBossLocale("Hodir", "zhTW")
if L then
	L.hardmode = "困難模式"
	L.hardmode_desc = "顯示困難模式計時器。"
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "zhTW")
if L then
	L.brittle_message = "鐵之傀儡 - 脆裂！"
end

L = BigWigs:NewBossLocale("The Iron Council", "zhTW")
if L then
	L.stormcaller_brundir = "風暴召喚者布倫迪爾"
	L.steelbreaker = "破鋼者"
	L.runemaster_molgeim = "符文大師墨吉姆"

	L.summoning_message = "閃電元素即將出現！"

	L.chased_other = "閃電觸鬚：>%s<！"
	L.chased_you = ">你< 閃電觸鬚！"
end

L = BigWigs:NewBossLocale("Kologarn", "zhTW")
if L then
	L.arm = "手臂死亡"
	L.arm_desc = "當左右手臂死亡時發出警報。"
	L.left_dies = "左臂死亡！"
	L.right_dies = "右臂死亡！"
	L.left_wipe_bar = "<左臂重生>"
	L.right_wipe_bar = "<右臂重生>"

	L.eyebeam = "集束目光"
	L.eyebeam_desc = "當玩家中了集束目光時發出警報。"
end

L = BigWigs:NewBossLocale("Mimiron", "zhTW")
if L then
	L.phase = "階段"
	L.phase_desc = "當進入不同階段發出警報。"
	L.engage_warning = "第一階段！"
	L.engage_trigger = "^我們沒有太多時間，朋友們!"
	L.phase2_warning = "即將 第二階段！"
	L.phase2_trigger = "^太好了!絕妙的良好結果!"
	L.phase3_warning = "即將 第三階段！"
	L.phase3_trigger = "^感謝你，朋友們!"
	L.phase4_warning = "即將 第四階段！"
	L.phase4_trigger = "^初步測試階段完成。"
	L.phase_bar = "<階段：%d>"

	L.hardmode_trigger = "^為什麼你要做出這種事?"

	L.plasma_warning = "正在施放 離子衝擊！"
	L.plasma_soon = "即將 離子衝擊！"
	L.plasma_bar = "<離子沖擊>"

	L.shock_next = "下一震爆！"

	L.laser_soon = "即將 P3Wx2雷射彈幕！"
	L.laser_bar = "<P3Wx2雷射彈幕>"

	L.magnetic_message = "空中指揮裝置 已降落！"

	L.suppressant_warning = "即將 熾焰抑制劑！"

	L.fbomb_bar = "<下一冰霜炸彈>"

	L.bomb_message = "炸彈機器人 出現！"
end

L = BigWigs:NewBossLocale("Razorscale", "zhTW")
if L then
	L.ground_trigger = "快!她可不會在地面上待太久!"
	L.ground_message = "銳鱗被鎖住了！"
	L.air_message = "起飛！"

	L.harpoon = "魚叉炮塔"
	L.harpoon_desc = "當魚叉炮塔可用時發出警報。"
	L.harpoon_message = "魚叉炮塔：>%d<可用！"
	L.harpoon_trigger = "魚叉砲塔已經準備就緒!"
	L.harpoon_nextbar = "<魚叉炮塔：%d>"
end

L = BigWigs:NewBossLocale("Thorim", "zhTW")
if L then
	L.phase2_trigger = "擅闖者!像你們這種膽敢干涉我好事的凡人將付出…等等--你……"
	L.phase3_trigger = "無禮的小輩，你竟敢在我的王座之上挑戰我?我會親手碾碎你們!"

	L.hardmode = "困難模式"
	L.hardmode_desc = "顯示困難模式計時器。"
	L.hardmode_warning = "困難模式結束！"

	L.barrier_message = "符文巨像 - 符刻屏障！"

	L.charge_message = "閃電能量：>%d<！"
	L.charge_bar = "<閃電能量：%d>"
end

L = BigWigs:NewBossLocale("General Vezax", "zhTW")
if L then
	L.surge_bar = "<暗鬱奔騰：%d>"

	L.animus = "薩倫聚惡體"
	L.animus_desc = "當薩倫聚惡體出現時發出警報。"
	L.animus_trigger = "薩倫煙霧聚集起來并且劇烈地旋轉，形成一個怪物般的形體!"
	L.animus_message = "薩倫聚惡體 出現！"

	L.vapor = "薩倫煙霧"
	L.vapor_desc = "當薩倫煙霧出現時發出警報。"
	L.vapor_message = "薩倫煙霧：>%d<！"
	L.vapor_bar = "薩倫煙霧"
	L.vapor_trigger = "一片薩倫煙霧在附近聚合!"

	L.vaporstack = "薩倫煙霧堆疊"
	L.vaporstack_desc = "當玩家中了5層或更多薩倫煙霧時發出警報。"
	L.vaporstack_message = "薩倫煙霧：>x%d<！"

	L.crash_say = "暗影暴擊"

	L.mark_message = "無面者印記"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "zhTW")
if L then
	L.lightbomb_other = "灼熱之光"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "zhTW")
if L then
	L.engage_trigger = "我們即將有機會打擊怪物的首腦!現在將你的憤怒與仇恨貫注在他的爪牙上!"
	L.phase2_trigger = "我是清醒的夢境。"
	L.phase3_trigger = "看看死亡的真實面貌，瞭解你們的末日降臨了!"

	L.portal = "傳送門"
	L.portal_desc = "當傳送門時發出警報。"
	L.portal_message = "開啟傳送門！"
	L.portal_bar = "<下一傳送門>"

	L.fervor_message = "薩拉的熱誠：>%s<！"

	L.sanity_message = ">你< 即將瘋狂！！"

	L.weakened = "昏迷"
	L.weakened_desc = "當尤格薩倫昏迷時發出警報。"
	L.weakened_message = "昏迷：>%s<！"

	L.madness_warning = "10秒後，瘋狂誘陷！"
	L.malady_message = "心靈缺陷" -- short for Malady of the Mind (63830)

	L.tentacle = "粉碎觸手"
	L.tentacle_desc = "當粉碎觸手出現時發出警報。"
	L.tentacle_message = "粉碎觸手：>%d<！"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = ">你< 腦波連結！"

	L.guardian_message = "尤格薩倫守護者：>%d<！ "

	L.roar_warning = "5秒後，震耳咆哮！"
	L.roar_bar = "<下一震耳咆哮>"
end
