-- Icecrown Citadel

local L = BigWigs:NewBossLocale("Lord Marrowgar", "koKR")
if L then
	L.bone_spike = "뼈 가시" -- NPC ID 36619
end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "koKR")
if L then
	L.touch = "손길"
	L.deformed_fanatic = "변형된 광신자" -- NPC ID 38135
	L.empowered_adherent = "강화된 신봉자" -- NPC ID 38136
end

L = BigWigs:NewBossLocale("Icecrown Gunship Battle", "koKR")
if L then
	L.adds_trigger_alliance = "약탈자, 하사관, 공격하라!"
	L.adds_trigger_horde = "해병, 하사관, 공격하라!"

	L.mage = "마법사"
	L.mage_desc = "마법사 소환과 대포가 얼었을때 알립니다."
	-- Alliance: We're taking hull damage, get a battle-mage out here to shut down those cannons!
	-- Horde: We're taking hull damage, get a sorcerer out here to shut down those cannons!
	--L.mage_yell_trigger = "taking hull damage"

	L.warmup_trigger_alliance = "속도를 올려라"
	L.warmup_trigger_horde = "호드의 아들딸이여"

	L.disable_trigger_alliance = "형제자매여, 전진"
	L.disable_trigger_horde = "리치 왕을 향해 전진하라"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "koKR")
if L then
	L.blood_beast = "피의 괴물" -- NPC ID 38508

	L.warmup_alliance = "그러면 이동하자! 이동..."
	L.warmup_horde = "코르크론, 출발하라! 용사들이여, 뒤를 조심하게. 스컬지는..."
end

L = BigWigs:NewBossLocale("Blood Prince Council", "koKR")
if L then
	L.switch_message = "대상 변경: %s"
	L.switch_bar = "~다음 대상 변경"

	L.empowered_flames = "강력한 불꽃"

	L.empowered_shock_message = "충격의 소용돌이 시전!"
	L.regular_shock_message = "충격 지역"
	L.shock_bar = "~다음 충격"

	L.iconprince = "활성화된 왕자 해골"
	L.iconprince_desc = "활성화된 왕자에게 해골 징표를 표시합니다 (승급된 사람만 가능)."

	L.prison_message = "어둠의 감옥 x%d!"
end

L = BigWigs:NewBossLocale("Festergut", "koKR")
if L then
	L.engage_trigger = "노는... 거야?"

	L.inhale_bar = "들이마시기 %d"
	L.blight_warning = "약 5초 후 파멸의 역병!"
	L.ball_message = "탱탱볼!"
end

L = BigWigs:NewBossLocale("Professor Putricide", "koKR")
if L then
	L.engage_trigger = "좋은 소식이에요, 여러분!"

	L.phase = "단계"
	L.phase_desc = "단계 변화를 알립니다."
	L.phase_warning = "곧 %d 단계!"
	L.phase_bar = "다음 단계"

	L.ball_bar = "다음 끈적이"
	L.ball_say = "곧 통통 끈적이!"

	L.experiment_message = "곧 수액 추가!"
	L.experiment_heroic_message = "수액들 추가!"
	L.experiment_bar = "다음 수액 추가"
	L.blight_message = "붉은 수액"
	L.violation_message = "녹색 수액"

	L.gasbomb_bar = "다음 노란 가스탄"
	L.gasbomb_message = "숨막히는 가스탄!"
end

L = BigWigs:NewBossLocale("Rotface", "koKR")
if L then
	L.engage_trigger = "우와아아아아아!"

	L.infection_message = "돌연변이 전염병"

	L.ooze = "불안정한 수액괴물"
	L.ooze_desc = "불안정한 수액괴물을 알립니다."
	L.ooze_message = "불안정한 수액괴물 %dx"

	L.spray_bar = "다음 독액 뿌리기"
end

L = BigWigs:NewBossLocale("Sindragosa", "koKR")
if L then
	L.engage_trigger = "여기까지 오다니 너무나 어리석구나. 노스렌드의 얼음 바람이 영혼까지 삼키리라!"

	L.phase2 = "2 단계"
	L.phase2_desc = "2 단계 변화를 알립니다."
	L.phase2_trigger = "자, 주인님의 무한한 힘을 느끼고 절망에 빠져보아라!"
	L.phase2_message = "2 단계!"

	L.airphase = "비행 단계"
	L.airphase_desc = "신드라고사의 착지 & 비행에 대한 단계를 알립니다."
	L.airphase_trigger = "여기가 끝이다! 아무도 살아남지 못하리라!"
	L.airphase_message = "비행 단계!"
	L.airphase_bar = "비행 단계"

	L.boom_message = "폭발!"
	L.boom_bar = "폭발"

	L.instability_message = "불안정 x%d!"
	L.chilled_message = "사무치는 한기 x%d!"
	L.buffet_message = "신비한 강타 x%d!"
	L.buffet_cd = "다음 신비한 강타"
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "koKR")
if L then
	L.engage_trigger = "영웅들이여, 나를 도와다오. 더는... 더는 저들을 붙들어 둘 수 없다. 이 상처를 치유해다오!"

	L.portal = "악몽의 차원문"
	L.portal_desc = "악몽의 차원문을 알립니다."
	L.portal_message = "차원문 생성!"
	L.portal_bar = "차원문 생성"
	L.portalcd_message = "14초 후 차원문 %d 생성!"
	L.portalcd_bar = "다음 차원문 %d"
	L.portal_trigger = "에메랄드의 꿈으로 가는 차원문을 열어두었다. 너희의 구원은 그 안에 있다..."

	L.suppresser = "억제자 소환"
	L.suppresser_desc = "억제자 소환을 알립니다."
	L.suppresser_message = "~억제자"

	L.blazing = "타오르는 해골"
	L.blazing_desc = "타오르는 해골의 |cffff0000추정|r되는 재생성 타이머 입니다. 이 타이머는 도적에게만 효용있게 만들어져 있습니다."
	L.blazing_warning = "곧 타오르는 해골!"
end

L = BigWigs:NewBossLocale("Blood-Queen Lana'thel", "koKR")
if L then
	L.engage_trigger = "정말... 현명하지 못한... 결정을 했군."

	L.shadow = "어둠이 쌓이더니"
	L.shadow_message = "모여드는 어둠"
	L.shadow_bar = "다음 어둠"

	L.feed_message = "피의 갈증"

	L.pact_message = "암흑사도의 계약"
	L.pact_bar = "다음 계약"

	L.phase_message = "곧 공중 단계!"
	L.phase1_bar = "착지"
	L.phase2_bar = "공중 단계"
end

L = BigWigs:NewBossLocale("The Lich King", "koKR")
if L then
	L.warmup_trigger = "그러니까 성스러운 빛이 자랑하던 정의가 마침내 왔다 이건가?"
	L.engage_trigger = "폴드링, 너는 살려서 최후를 지켜보게 하겠다."

	L.horror_message = "휘청거리는 괴물"
	L.horror_bar = "~다음 휘청 괴물"

	L.valkyr_message = "발키르"
	L.valkyr_bar = "다음 발키르"
	L.valkyrhug_message = "발키르 붙음"

	L.cave_phase = "동굴 단계"
	L.last_phase_bar = "마지막 단계"

	L.frenzy_bar = "%s 광기!"
	L.frenzy_survive_message = "%s 역병 후 살아남음"
	L.frenzy_message = "격노 추가!"
	L.frenzy_soon_message = "5초 후 격노!"

	--L.custom_on_valkyr_marker = "Val'kyr marker"
	--L.custom_on_valkyr_marker_desc = "Mark the Val'kyr with {rt8}{rt7}{rt6}, requires promoted or leader.\n|cFFFF0000Only 1 person in the raid should have this enabled to prevent marking conflicts.|r\n|cFFADFF2FTIP: If the raid has chosen you to turn this on, quickly mousing over the Val'kyr is the fastest way to mark them.|r"
end

L = BigWigs:NewBossLocale("Icecrown Citadel Trash", "koKR")
if L then
	L.deathbound_ward = "죽음에 속박된 감시자"
	L.deathspeaker_high_priest = "죽음예언자 대사제" -- NPC ID 36829
	L.putricide_dogs = "예삐 & 구리구리"
end

-- Crusaders' Coliseum

L = BigWigs:NewBossLocale("Anub'arak", "koKR")
if L then
	L.engage_message = "전투 시작"
	L.engage_trigger = "여기가 네 무덤이 되리라!"

	L.unburrow_trigger = "땅속에서 모습을 드러냅니다!"
	L.burrow_trigger = "땅속으로 숨어버립니다!"
	L.burrow = "소멸"
	L.burrow_desc = "아눕아락의 등장과 소멸, 소환 되어 추가되는 벌레들을 알립니다."
	L.burrow_soon = "곧 소멸"

	L.nerubian_message = "곧 땅무지 추가!"
	L.nerubian_burrower = "땅무지 추가"

	L.shadow_soon = "약 5초 후 어둠의 일격!"
end

L = BigWigs:NewBossLocale("The Beasts of Northrend", "koKR")
if L then
	L.wipe_trigger = "비극이야..."

	L.engage_trigger = "폭풍우 봉우리의 가장 깊고 어두운 동굴에서 온, 꿰뚫는 자 고르목일세! 영웅들이여, 전투에 임하게!"
	L.jormungars_trigger = "마음을 단단히 먹게, 영웅들이여. 두 배의 공포, 산성아귀와 공포비늘이 투기장으로 들어온다네!"
	L.icehowl_trigger = "다음은, 소개하는 순간 공기마저 얼어붙게 하는 얼음울음일세! 죽이지 않으면 죽을 걸세, 용사들이여!"
	L.boss_incoming = "곧 %s 등장"

	L.gormok = "꿰뚫는 자 고르목"
	L.jormungars = "산성아귀와 공포비늘"
	L.icehowl = "얼음울음"

	-- Gormok
	L.snobold = "스노볼트"
	L.snobold_desc = "스노볼트가 누구의 머리위에 있는지를 알립니다."

	-- Jormungars
	L.submerge = "잠수"
	L.submerge_desc = "요르문가르의 다음 잠수에 대한 타이머를 표시합니다."
	L.spew = "산성/용암 내뿜기"
	L.spew_desc = "산성/용암 내뿜기를 알립니다."
	L.sprays = "분사"
	L.sprays_desc = "다음 화염과 마비액 분사에 대한 타이머를 표시합니다."
	L.slime_message = "당신은 진흙 웅덩이!"
	L.burn_spell = "불타는 담즙"
	L.toxin_spell = "마비 독"
	L.spray = "다음 분사"

	-- Icehowl
	L.charge = "사나운 돌진"
	L.charge_desc = "사나운 돌진의 대상 플레이어를 알립니다."
	L.charge_trigger = "([^%s]+)|1을;를; 노려보며 큰 소리로 울부짖습니다.$"

	L.bosses = "보스 등장"
	L.bosses_desc = "보스들 등장을 알립니다."
end

L = BigWigs:NewBossLocale("Faction Champions", "koKR")
if L then
	L.defeat_trigger = "상처뿐인 승리로군."

	L["Shield on %s!"] = "기사무적: %s!"
	L["Bladestorming!"] = "칼날폭풍!"
	L["Hunter pet up!"] = "냥꾼 야수 소환!"
	L["Felhunter up!"] = "지옥사냥개 소환!"
	L["Heroism on champions!"] = "용사 영웅심!"
	L["Bloodlust on champions!"] = "용사 피의 욕망!"
end

L = BigWigs:NewBossLocale("Lord Jaraxxus", "koKR")
if L then
	L.enable_trigger = "보이지도 않는 노움 주제에! 그렇게 까불더니 무덤을 파는구나!"

	L.engage = "전투 시작"
	L.engage_trigger = "불타는 군단의 에레다르 군주, 자락서스 님이 상대해주마!"
	L.engage_trigger1 = "황천으로 사라져라!"

	L.adds = "차원문과 화산"
	L.adds_desc = "자락서스의 차원문과 화산 소환에 대한 알림과 타이머를 표시합니다."

	L.incinerate_message = "살점 소각"
	L.incinerate_other = "살점 소각: %s!"
	L.incinerate_bar = "~살점 소각 대기시간"
	L.incinerate_safe = "%s 안전함 :)"

	L.legionflame_message = "군단 불꽃"
	L.legionflame_other = "군단 불꽃 : %s!"
	L.legionflame_bar = "~군단 불꽃 대기시간"

	L.infernal_bar = "화산 소환"
	L.netherportal_bar = "~황천 차원문 대기시간"

	L.kiss_message = "당신에게 키스!"
	L.kiss_interrupted = "차단함!"
end

L = BigWigs:NewBossLocale("The Twin Val'kyr", "koKR")
if L then
	L.engage_trigger1 = "어둠의 주인님을 받들어. 리치 왕을 위하여. 너희에게. 죽음을. 안기리라."

	L.vortex_or_shield_cd = "소용돌이/방패 대기시간"
	L.next = "다음 소용돌이 또는 방패"
	L.next_desc = "다음 소용돌이 또는 방패에 대해 알립니다."

	L.vortex = "소용돌이"
	L.vortex_desc = "쌍둥이의 소용돌이 시전을 알립니다."

	L.shield = "어둠/빛의 방패"
	L.shield_desc = "어둠/빛의 방패를 알립니다."

	L.touch = "어둠/빛의 손길"
	L.touch_desc = "어둠/빛의 손길을 알립니다."
end

-- Naxxramas

L = BigWigs:NewBossLocale("Anub'Rekhan", "koKR")
if L then
	L.add = "지하마귀 수호병"
	L.locust = "무리바퀴"
end

L = BigWigs:NewBossLocale("Grand Widow Faerlina", "koKR")
if L then
	L.silencewarn = "침묵!"
	L.silencewarn5sec = "5초 후 침묵 종료!"
	L.silence = "침묵"
end

L = BigWigs:NewBossLocale("Gothik the Harvester", "koKR")
if L then
	L.phase1_trigger1 = "어리석은 것들, 스스로 죽음을 자초하다니!"
	--L.phase1_trigger2 = "Teamanare shi rikk mannor rikk lok karkun" -- Curse of Tongues
	L.phase2_trigger = "오랫동안 기다렸다. 이제 영혼 착취자를 만날 차례다."

	L.add = "추가 몹 알림"
	L.add_desc = "추가 몹을 알립니다."

	L.add_death = "추가 몹 죽음 알림"
	L.add_death_desc = "추가된 몹 죽음을 알립니다."

	L.riderdiewarn = "기병 죽음!"
	L.dkdiewarn = "죽음의 기사 죽음!"

	L.wave = "%d/23: %s"

	L.trawarn = "수습생 3초 후 등장"
	L.dkwarn = "죽음의 기사 3초 후 등장"
	L.riderwarn = "기병 3초 후 등장"

	L.trabar = "수습생 (%d)"
	L.dkbar = "죽음의 기사 (%d)"
	L.riderbar = "기병 (%d)"

	--L.gate = "Gate Open!"
	--L.gatebar = "Gate opens"

	L.phase_soon = "고딕 등장 10초 전"

	L.engage_message = "영혼 착취자 고딕 전투 시작!"
end

L = BigWigs:NewBossLocale("Grobbulus", "koKR")
if L then
	L.injection = "돌연변이 유발"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "koKR")
if L then
	L.teleport_yell_trigger = "여기가 너희 무덤이 되리라."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "koKR")
if L then
	L.mark = "징표"
	L.mark_desc = "징표를 알립니다."

	L.engage_message = "4인의 기병대 전투 시작!"
end

L = BigWigs:NewBossLocale("Kel'Thuzad Naxxramas", "koKR")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "켈투자드의 방"

	L.phase1_trigger = "어둠의 문지기와 하수인, 그리고 병사들이여! 나 켈투자드가 부르니 명을 받들라!"
	L.phase2_trigger1 = "자비를 구하라!" -- CHECK
	L.phase2_trigger2 = "마지막 숨이나 쉬어라!"
	L.phase2_trigger3 = "최후를 맞이하라!"
	L.phase3_trigger = "주인님, 도와주소서!"
	L.guardians_trigger = "좋다. 얼어붙은 땅의 전사들이여, 일어나라! 너희에게 싸울 것을 명하노라. 날 위해 죽고, 날 위해 죽여라! 한 놈도 살려두지 마라!"

	L.phase2_warning = "2 단계 - 켈투자드!"
	L.phase2_bar = "켈투자드 활동!"

	L.phase3_warning = "3 단계 - 약 15초 이내 수호자 등장!"

	L.guardians = "수호자 생성"
	L.guardians_desc = "3 단계의 수호자 소환을 알립니다."
	L.guardians_warning = "10초 이내 수호자 등장!"
	L.guardians_bar = "수호자 등장!"

	L.engage_message = "켈투자드 전투 시작! 약 3분 30초 후 활동!"
end

L = BigWigs:NewBossLocale("Loatheb", "koKR")
if L then
	L.doomtime_bar = "파멸 - 매 15초"
	L.doomtime_now = "피할 수 없는 파멸! 지금부터 매 15초마다."

	L.spore_warn = "포자 (%d)"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "koKR")
if L then
	L.adds_yell_trigger = "일어나라,병사들이여" -- 일어나라,병사들이여! 다시 일어나 싸워라!
end

L = BigWigs:NewBossLocale("Maexxna", "koKR")
if L then
	L.webspraywarn30sec = "10초 이내 거미줄 감싸기"
	L.webspraywarn20sec = "거미줄 감싸기. 10초 후 거미 소환!"
	L.webspraywarn10sec = "거미 소환. 10초 후 거미줄 뿌리기!"
	L.webspraywarn5sec = "5초 후 거미줄 뿌리기!"

	L.enragewarn = "광기!"
	L.enragesoonwarn = "잠시 후 광기!"

	L.cocoons = "거미줄 감싸기"
	L.spiders = "거미 소환"
end

L = BigWigs:NewBossLocale("Sapphiron", "koKR")
if L then
	L.airphase_trigger = "사피론이 공중으로 떠오릅니다!"
	L.deepbreath_trigger = "%s|1이;가; 숨을 깊게 들이마십니다."

	--L.air_phase = "Air Phase"
	--L.ground_phase = "Ground Phase"

	L.ice_bomb = "얼음 폭탄"
	L.ice_bomb_warning = "잠시 후 얼음 폭탄!"
	L.ice_bomb_bar = "얼음 폭탄 떨어짐!"

	L.icebolt_say = "저 방패에요!"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "koKR")
if L then
	L.understudy = "죽음의 기사 수습생"

	L.shout_warning = "5초 후 분열의 외침!"
	L.taunt_warning = "5초 후 도발 종료!"
	L.shieldwall_warning = "5초 후 방패의 벽 종료!"
end

L = BigWigs:NewBossLocale("Thaddius", "koKR")
if L then
	L[15929] = "스탈라그"
	L[15930] = "퓨진"

	L.stage2_yell_trigger1 = "잡아... 먹어주마..."
	L.stage2_yell_trigger2 = "박살을 내주겠다!"
	L.stage2_yell_trigger3 = "죽여주마..."

	L.add_death_emote_trigger = "%s|1이;가; 죽습니다."
	L.overload_emote_trigger = "%s|1이;가; 과부하 상태가 됩니다."
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

	L.left = "<--- 왼쪽으로 <--- 왼쪽으로 <---"
	L.right = "---> 오른쪽으로 ---> 오른쪽으로 --->"
	L.swap = "^^^^ 방향 전환 ^^^^ 방향 전환 ^^^^"
	L.stay = "==== 움직 이지마 ==== 움직 이지마 ===="

	--L.chat_message = "The Thaddius mod supports showing you directional arrows and playing voices. Open the options to configure them."
end

-- Northrend

L = BigWigs:NewBossLocale("Onyxia", "koKR")
if L then
	L.phase1_trigger = "오늘은 운이 아주 좋군."
	L.phase2_trigger = "쓸데없이 힘을 쓰는 것도 지루하군. 네 녀석들 머리 위에서 모조리 불살라 주마!"
	L.phase3_trigger = "혼이 더 나야 정신을 차리겠구나!"

	L.deep_breath = "깊은 숨결"
end

L = BigWigs:NewBossLocale("Archavon the Stone Watcher", "koKR")
if L then
	L.stomp_message = "발 구르기 - 곧 돌진!"
	L.stomp_warning = "약 5초 후 발구르기 가능!"

	L.charge = "돌진"
	L.charge_desc = "돌진의 대상인 플레이어를 알립니다."
end

L = BigWigs:NewBossLocale("Emalon the Storm Watcher", "koKR")
if L then
	L.overcharge_message = "하수인 과충전!"
	L.overcharge_bar = "폭발"

	L.custom_on_overcharge_mark = "Overcharge marker"
	L.custom_on_overcharge_mark_desc = "Place the {rt8} marker on the overcharged minion, requires promoted or leader."
end

L = BigWigs:NewBossLocale("Koralon the Flame Watcher", "koKR")
if L then
	L.breath_bar = "숨결 %d"
	L.breath_message = "곧 %d 숨결!"
end

L = BigWigs:NewBossLocale("Toravon the Ice Watcher", "koKR")
if L then
	L.whiteout_bar = "시아상실 %d"
	L.whiteout_message = "곧 시아상실 %d !"

	L.freeze_message = "땅얼리기"
end

L = BigWigs:NewBossLocale("Malygos", "koKR")
if L then
	L.sparks = "불꽃 소환"
	L.sparks_desc = "마력의 불꽃 소환을 알립니다."
	L.sparks_message = "마력의 불꽃 소환!"
	L.sparks_warning = "약 5초 후 마력의 불꽃!"

	L.sparkbuff = "말리고스의 마력의 불꽃"
	L.sparkbuff_desc = "말리고스의 마력의 불꽃 획득을 알립니다."
	L.sparkbuff_message = "말리고스 마력의 불꽃 획득!"

	L.vortex = "회오리"
	L.vortex_desc = "1단계에서 회오리를 알립니다."
	L.vortex_message = "회오리!"
	L.vortex_warning = "약 5초 후 회오리 사용가능!"
	L.vortex_next = "회오리 대기시간"

	L.breath = "깊은 숨결"
	L.breath_desc = "2단계에서 말리고스가 사용하는 깊은 숨결을 알립니다."
	L.breath_message = "깊은 숨결!"
	L.breath_warning = "약 5초 후 깊은 숨결!"

	L.surge = "마력의 쇄도"
	L.surge_desc = "3단계에서 말리고스가 당신에게 마력의 쇄도를 사용시 알립니다."
	L.surge_you = "당신에게 마력의 쇄도!"
	L.surge_trigger = "%s|1이;가; 당신을 주시합니다!"

	L.phase = "단계"
	L.phase_desc = "단계 변화를 알립니다."
	L.phase2_warning = "잠시 후 2 단계!"
	L.phase2_trigger = "되도록 빨리 끝내 주고 싶었다만"
	L.phase2_message = "2 단계 - 마력의 군주 & 영원의 후예!"
	L.phase2_end_trigger = "그만! 아제로스의 마력을 되찾고"
	L.phase3_warning = "잠시 후 3 단계!"
	L.phase3_trigger = "네놈들의 후원자가 나타났구나"
	L.phase3_message = "3 단계!"
end

L = BigWigs:NewBossLocale("Sartharion", "koKR")
if L then
	L.engage_trigger = "내 임무는 알을 보호하는 것. 알에 손대지 못하게 모두 불태워 주마."
	L.tsunami_trigger = "%s|1을;를; 둘러싼 용암이 끓어오릅니다!"
	L.twilight_trigger_vesperon = "베스페론의 신도가 황혼에서 나타납니다!"
	L.twilight_trigger_shadron = "샤드론의 신도가 황혼에서 나타납니다!"

	L.drakes = "비룡 추가"
	L.drakes_desc = "각 비룡이 전투에 추가되는 것을 알립니다."

	-- Adds
	L.shadron = "샤드론"
	L.tenebron = "테네브론"
	L.vesperon = "베스페론"
	L.lava_blaze = "타오르는 용암" -- NPC 30643
	L.acolyte_shadron = "샤드론의 수행사제" -- NPC 31218
	L.acolyte_vesperon = "베스페론의 수행사제" -- NPC 31219
end

-- Ruby Sanctum

L = BigWigs:NewBossLocale("Halion", "koKR")
if L then
	L.twilight_cutter_emote_trigger = "주위를 회전하는 구슬들이" -- 주위를 회전하는 구슬들이 고동치며 어둠의 기운을 내뿜습니다!
end

L = BigWigs:NewBossLocale("The Ruby Sanctum Trash", "koKR")
if L then
	L.baltharus = "전쟁의 아들 발타루스" -- NPC 39751
	L.saviana = "사비아나 레이지파이어" -- NPC 39747
	L.zarithrian = "장군 자리스리안" -- NPC 39746

	L.adds_yell_trigger = "저놈들을 재로 만들어버려라!"
end

-- Ulduar

L = BigWigs:NewBossLocale("Auriaya", "koKR")
if L then
	L.swarm_message = "수호자의 무리"

	L.defender = "수호 야수"
	L.defender_desc = "수호 야수의 남은 생명 횟수를 알립니다."
	L.defender_message = "수호 야수 (생명: %d/9)!"
end

L = BigWigs:NewBossLocale("Freya", "koKR")
if L then
	L.wave = "웨이브"
	L.wave_desc = "웨이브에 대해 알립니다."
	L.wave_bar = "다음 웨이브"
	L.conservator_trigger = "이오나여, 당신의 종이 도움을 청합니다!"
	L.detonate_trigger = "정령의 무리가 너희를 덮치리라!"
	L.elementals_trigger = "얘들아, 날 도와라!"
	L.tree_trigger = "|cFF00FFFF생명의 어머니의 선물|r이 자라기 시작합니다!"
	L.conservator_message = "수호자 소환"
	L.detonate_message = "폭발 덩굴손 소환"
	L.elementals_message = "정령 3 소환"

	L.tree = "이오나의 선물"
	L.tree_desc = "프레이야의 이오나의 선물 소환을 알립니다."
	L.tree_message = "이오나의 선물 소환"

	L.fury_message = "격노"

	L.tremor_warning = "곧 지진!"
	L.tremor_bar = "~다음 지진"
	L.energy_message = "당신은 불안정한 힘!"
	L.sunbeam_message = "태양 광선!"
	L.sunbeam_bar = "~다음 태양 광선"
end

L = BigWigs:NewBossLocale("Hodir", "koKR")
if L then
	L.hardmode = "도전 모드 시간"
	L.hardmode_desc = "도전 모드의 시간을 표시합니다."
end

L = BigWigs:NewBossLocale("Ignis the Furnace Master", "koKR")
if L then
	L.brittle_message = "피조물 부서지는 몸!"
end

L = BigWigs:NewBossLocale("The Iron Council", "koKR")
if L then
	L.stormcaller_brundir = "폭풍소환사 브룬디르"
	L.steelbreaker = "강철파괴자"
	L.runemaster_molgeim = "룬술사 몰가임"

	L.summoning_message = "소환의 룬 - 곧 정령 등장!"

	L.chased_other = "%s 추적 중!"
	L.chased_you = "당신을 추적 중!"
end

L = BigWigs:NewBossLocale("Kologarn", "koKR")
if L then
	L.arm = "팔 죽음"
	L.arm_desc = "왼팔 & 오른팔의 죽음을 알립니다."
	L.left_dies = "왼팔 죽음"
	L.right_dies = "오른팔 죽음"
	L.left_wipe_bar = "왼팔 재생성"
	L.right_wipe_bar = "오른팔 재생성"

	L.eyebeam = "안광 집중"
	L.eyebeam_desc = "안광 집중의 대상이된 플레이어를 알립니다."
end

L = BigWigs:NewBossLocale("Mimiron", "koKR")
if L then
	L.phase = "단계"
	L.phase_desc = "단계 변화를 알립니다."
	L.engage_warning = "1 단계"
	L.engage_trigger = "^시간이 없어, 친구들!"
	L.phase2_warning = "곧 2 단계"
	L.phase2_trigger = "^멋지군!"
	L.phase3_warning = "곧 3 단계"
	L.phase3_trigger = "^고맙다, 친구들!"
	L.phase4_warning = "곧 4 단계"
	L.phase4_trigger = "^예비 시험은 이걸로 끝이다"
	L.phase_bar = "%d 단계"

	L.hardmode_trigger = "^아니, 대체 왜 그런 짓을 한 게지?"

	L.plasma_warning = "플라스마 폭발 시전!"
	L.plasma_soon = "곧 플라스마!"
	L.plasma_bar = "다음 플라스마"

	L.shock_next = "다음 충격파"

	L.laser_soon = "회전 가속!"
	L.laser_bar = "레이저 탄막"

	L.magnetic_message = "공중 지휘기! 극딜!"

	L.suppressant_warning = "곧 화염 억제!"

	L.fbomb_bar = "다음 서리 폭탄"

	L.bomb_message = "폭발로봇 소환!"
end

L = BigWigs:NewBossLocale("Razorscale", "koKR")
if L then
	L.ground_trigger = "움직이세요! 오래 붙잡아둘 순 없을 겁니다!"
	L.ground_message = "칼날비늘 묶임!"
	L.air_message = "이륙!"

	L.harpoon = "작살 포탑"
	L.harpoon_desc = "작살 포탑의 준비를 알립니다."
	L.harpoon_message = "작살 포탑 (%d)"
	L.harpoon_trigger = "작살 포탑이 준비되었습니다!"
	L.harpoon_nextbar = "다음 작살 (%d)"
end

L = BigWigs:NewBossLocale("Thorim", "koKR")
if L then
	L.phase2_trigger = "침입자라니! 감히 내 취미 생활을 방해하는 놈들은 쓴맛을 단단히... 잠깐... 너는..."
	L.phase3_trigger = "건방진 젖먹이 같으니... 감히 여기까지 기어올라와 내게 도전해? 내 손으로 쓸어버리겠다!"

	L.hardmode = "도전 모드 시간"
	L.hardmode_desc = "도전 모드의 시간을 표시합니다."
	L.hardmode_warning = "도전 모드 종료"

	L.barrier_message = "거인 - 룬문자 방벽!"

	L.charge_message = "충전 (%d)!"
	L.charge_bar = "충전 (%d)"
end

L = BigWigs:NewBossLocale("General Vezax", "koKR")
if L then
	L.surge_bar = "쇄도 %d"

	L.animus = "사로나이트 원혼"
	L.animus_desc = "사로나이트 원혼 소환을 알립니다."
	L.animus_trigger = "사로나이트 증기가 한 덩어리가 되어 맹렬하게 소용돌이치며, 무시무시한 형상으로 변화합니다!"
	L.animus_message = "원혼 소환!"

	L.vapor = "사로나이트 증기"
	L.vapor_desc = "사로나이트 증기 소환을 알립니다."
	L.vapor_message = "사로나이트 증기 (%d)!"
	L.vapor_bar = "다음 증기"
	L.vapor_trigger = "가까운 사로나이트 증기 구름이 합쳐집니다!"

	L.vaporstack = "증기 중첩"
	L.vaporstack_desc = "사로나이트 증기 5중첩이상을 알립니다."
	L.vaporstack_message = "증기 x%d 중첩!"

	L.crash_say = "어둠 붕괴요"

	L.mark_message = "징표"
end

L = BigWigs:NewBossLocale("XT-002 Deconstructor", "koKR")
if L then
	L.lightbomb_other = "타오르는 빛"
end

L = BigWigs:NewBossLocale("Yogg-Saron", "koKR")
if L then
	L.engage_trigger = "^짐승의 대장을 칠 때가 곧 다가올 거예요"
	L.phase2_trigger = "^나는, 살아 있는 꿈이다"
	L.phase3_trigger = "^죽음의 진정한 얼굴을 보아라"

	L.portal = "차원문"
	L.portal_desc = "차원문을 알립니다."
	L.portal_message = "차원문 열림!"
	L.portal_bar = "다음 차원문"

	L.fervor_message = "사라의 열정: %s!"

	L.sanity_message = "당신의 이성 위험!"

	L.weakened = "기절"
	L.weakened_desc = "기절 상태를 알립니다."
	L.weakened_message = "%s 기절!"

	L.madness_warning = "10초 후 광기 유발!"

	L.malady_message = "병든 정신" -- short for Malady of the Mind (63830)

	L.tentacle = "촉수 소환"
	L.tentacle_desc = "촉수 소환을 알립니다."
	L.tentacle_message = "분쇄의 촉수(%d)"

	--L.small_tentacles = "Small Tentacles"
	--L.small_tentacles_desc = "Warn for Corruptor Tentacle and Constrictor Tentacle spawns."

	L.link_warning = "당신은 두뇌의 고리!"

	L.guardian_message = "수호자 소환 %d!"

	L.roar_warning = "5초 후 포효!"
	L.roar_bar = "다음 포효"
end
