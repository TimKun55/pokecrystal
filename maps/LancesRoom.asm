	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_DRAGONITE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_script LancesRoomNoopScene,     SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorsCallback

LancesRoomLockDoorScene:
	sdefer LancesRoomDoorLocksBehindYouScript
	end

LancesRoomNoopScene:
	end

LancesRoomDoorsCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	endcallback

LancesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	turnobject LANCESROOM_DRAGONITE, LEFT
	opentext	
	checkevent EVENT_GRAND_CHAMPION
	iftrue .LanceGrandChampionMatch
	readvar VAR_BADGES
	ifequal 16, .Lance16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LanceChampionMatch
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE1
	startbattle	
	dontrestartmapmusic
	sjump .AfterBattle

.LanceChampionMatch:
	writetext LanceChampionBattleIntroText
	waitbutton
	closetext
	winlosstext LanceChampionBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE1
	startbattle	
	dontrestartmapmusic
	sjump .AfterBattle

.Lance16Badges:
	writetext Lance16BadgesBattleIntroText
	waitbutton
	closetext
	winlosstext LanceChampionBattleWinText, 0
	loadtrainer CHAMPION, LANCE2
	startbattle
	dontrestartmapmusic
	sjump .AfterBattle

.LanceGrandChampionMatch:
	writetext LanceGrandChampionBattleIntroText
	waitbutton
	closetext
	winlosstext LanceChampionBattleWinText, 0
	loadtrainer CHAMPION, LANCE2
	startbattle
	dontrestartmapmusic
.AfterBattle:
	disappear LANCESROOM_DRAGONITE
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	checkevent EVENT_GRAND_CHAMPION
	iftrue .GrandChampionAfter
	readvar VAR_BADGES
	ifequal 16, .Champion16BadgesAfter
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FirstTimeChampion
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LanceLetsRegister
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

.Champion16BadgesAfter:
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LanceGrandChampFirstTime
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

.GrandChampionAfter:
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LanceLetsRegisterGrandChamp
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

.FirstTimeChampion:
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
	opentext
	writetext LancesRoomMaryOhNoOakText
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LancesRoomOakCongratulationsText
	waitbutton
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, LEFT
	opentext
	writetext LancesRoomMaryInterviewText
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LancesRoomNoisyText
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext LancesRoomMaryNoInterviewText
	pause 30
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end
	
LancesRoomDragoniteScript:
	opentext
	writetext DragoniteText
	cry DRAGONITE
	waitbutton
	refreshscreen
	pokepic DRAGONITE
	waitbutton
	closepokepic
	closetext
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceBattleIntroText:
	text "Lance: I've been"
	line "waiting for you."

	para "<PLAY_G>!"

	para "I knew that you,"
	line "with your skills,"

	para "would eventually"
	line "reach me here."

	para "There's no need"
	line "for words now."

	para "We will battle to"
	line "determine who is"

	para "the stronger of"
	line "the two of us."

	para "As the most power-"
	line "ful trainer and as"

	para "the #mon League"
	line "Champion…"

	para "I, Lance the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

LanceBattleWinText:
	text "…It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "witnessed the rise"

	para "of a great new"
	line "Champion!"
	done

LanceBattleAfterText:
	text "…Whew."

	para "You have become"
	line "truly powerful,"
	cont "<PLAY_G>."

	para "Your #mon have"
	line "responded to your"

	para "strong and up-"
	line "standing nature."

	para "As a trainer, you"
	line "will continue to"

	para "grow strong with"
	line "your #mon."
	done

LanceChampionBattleIntroText:
	text "Champion <PLAYER>,"
	line "you're back!"
	
	para "Ready to test your"
	line "skills again?"

	para "I, Lance the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

LanceChampionBattleWinText:
	text "I've been bested"
	line "again!"
	done

Lance16BadgesBattleIntroText:
	text "Champion <PLAYER>,"
	line "you're back!"
	
	para "So, you've been"
	line "around Kanto and"
	
	para "collected all"
	line "their Badges, too?"
	
	para "You really are"
	line "something else!"
	
	para "This is great;"
	line "I no longer need"
	cont "to hold back."
	
	para "We can now have an"
	line "all-out battle!"
	
	para "I, Lance the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

LanceGrandChampionBattleIntroText:
	text "Grand Champion"
	line "<PLAYER>."
	
	para "Welcome back to"
	line "the League."
	
	para "It is an honour"
	line "to battle with"
	cont "you once again."

	para "You, as the Grand"
	line "Champion of Johto"
	cont "and Kanto."
	
	para "Me, as a former"
	line "Elite Four member"
	cont "and current Elite"
	cont "Four Champion."
	
	para "I, Lance the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

LanceLetsRegister:
	text "<PLAYER>, let's"
	line "get you guys"
	cont "registered again."
	done

LanceGrandChampFirstTime:
	text "<PLAYER>, you've"
	line "collected all the"
	cont "Johto and Kanto"
	
	para "Badges, and you"
	line "have defeated me,"
	cont "the League"
	cont "Champion."
	
	para "You have proven"
	line "yourself over and"
	cont "over, and it is my"
	
	para "pleasure to give"
	line "you the title of"
	cont "Grand Champion."
	
	para "Come on, let's"
	line "register you guys."
	done

LanceLetsRegisterGrandChamp:
	text "Well done, Grand"
	line "Champion!"
	
	para "Come on, let's"
	line "register you guys."
	done

LancesRoomMaryOhNoOakText:
	text "Mary: Oh, no!"
	line "It's all over!"

	para "Prof.Oak, if you"
	line "weren't so slow…"
	done

LancesRoomOakCongratulationsText:
	text "Prof.Oak: Ah,"
	line "<PLAY_G>!"

	para "It's been a long"
	line "while."

	para "You certainly look"
	line "more impressive."

	para "Your conquest of"
	line "the League is just"
	cont "fantastic!"

	para "Your dedication,"
	line "trust and love for"

	para "your #mon made"
	line "this happen."

	para "Your #mon were"
	line "outstanding too."

	para "Because they be-"
	line "lieved in you as a"

	para "trainer, they per-"
	line "severed."

	para "Congratulations,"
	line "<PLAY_G>!"
	done

LancesRoomMaryInterviewText:
	text "Mary: Let's inter-"
	line "view the brand new"
	cont "Champion!"
	done

LancesRoomNoisyText:
	text "Lance: This is"
	line "getting to be a"
	cont "bit too noisy…"

	para "<PLAY_G>, could you"
	line "come with me?"
	done

LancesRoomMaryNoInterviewText:
	text "Mary: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
	
	para "<PLAY_G>!"
	
	para "Come see me the"
	line "next time you're"
	cont "in Goldenrod City!"
	done
	
DragoniteText:
	text "Dragonite: Drago!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  6,  3, SPRITE_DRAGONITE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomDragoniteScript, EVENT_CHAMPION_ROOM_DRAGONITE
	object_event  4,  8, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  8, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
