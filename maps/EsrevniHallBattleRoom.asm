	object_const_def
	const ESREVNIHALLBATTLEROOM_INVER

EsrevniHallBattleRoom_MapScripts:
	def_scene_scripts
	scene_script EsrevniHallBattleRoomEnterScene, SCENE_ESREVNIHALLBATTLEROOM_ENTER
	scene_script EsrevniHallBattleRoomNoopScene,  SCENE_ESREVNIHALLBATTLEROOM_NOOP

	def_callbacks

EsrevniHallBattleRoomEnterScene:
	disappear ESREVNIHALLBATTLEROOM_INVER
	sdefer EsrevniHallBattleRoomScript
	setscene SCENE_ESREVNIHALLBATTLEROOM_NOOP
EsrevniHallBattleRoomNoopScene:
	end

EsrevniHallBattleRoomScript:
	applymovement PLAYER, EsrevniHallBattleRoomPlayerEnterMovement
	turnobject PLAYER, RIGHT
	appear ESREVNIHALLBATTLEROOM_INVER
	warpsound
	waitsfx
	applymovement ESREVNIHALLBATTLEROOM_INVER, EsrevniHallBattleRoomInverEnterMovement1
	pause 15
	showemote EMOTE_SHOCK, ESREVNIHALLBATTLEROOM_INVER, 15
	pause 15
	applymovement ESREVNIHALLBATTLEROOM_INVER, EsrevniHallBattleRoomInverEnterMovement2
	turnobject ESREVNIHALLBATTLEROOM_INVER, LEFT
	opentext
	writetext EsrevniHallBattleRoomInverIntroText
	promptbutton
	closetext
	winlosstext EsrevniHallBattleRoomInverWinText, EsrevniHallBattleRoomInverLossText
	setlasttalked ESREVNIHALLBATTLEROOM_INVER
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .Inver2
	checkevent EVENT_BEAT_BLUE
	iftrue .Inver3
	checkevent EVENT_GRAND_CHAMPION
	iftrue .Inver4
	loadtrainer INVER, INVER_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmap
	iftrue .AfterLoss
	sjump .AfterWin

.Inver2:
	loadtrainer INVER, INVER_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmap
	iftrue .AfterLoss
	sjump .AfterWin

.Inver3:
	loadtrainer INVER, INVER_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmap
	iftrue .AfterLoss
	sjump .AfterWin

.Inver4:
	loadtrainer INVER, INVER_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmap
	iftrue .AfterLoss
.AfterWin:
	applymovement ESREVNIHALLBATTLEROOM_INVER, EsrevniHallBattleRoomInverExitMovement
	opentext
	writetext EsrevniHallBattleRoomInverPlayerWinText
	promptbutton
	closetext
	readmem wInverPoints
	addval 1
	writemem wInverPoints
	setevent EVENT_ESREVNI_HALL_AFTER_BATTLE
	sjump .FinishInver

.AfterLoss:
	applymovement ESREVNIHALLBATTLEROOM_INVER, EsrevniHallBattleRoomInverExitMovement
	opentext
	writetext EsrevniHallBattleRoomInverPlayerLossText
	promptbutton
	closetext
	setevent EVENT_ESREVNI_HALL_AFTER_BATTLE
	special HealParty
.FinishInver
	applymovement PLAYER, EsrevniHallBattleRoomPlayerExitMovement
	setmapscene ESREVNI_HALL_1F, SCENE_ESREVNIHALL1F_AFTERBATTLE
	clearevent EVENT_ESREVNI_HALL_1F_INVER
	special FadeOutToWhite
	pause 30
	warpfacing UP, ESREVNI_HALL_1F, 13, 11
	end

EsrevniHallBattleRoomPlayerEnterMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step_end

EsrevniHallBattleRoomInverEnterMovement1:
	slow_step DOWN
	step_end

EsrevniHallBattleRoomInverEnterMovement2:
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

EsrevniHallBattleRoomInverExitMovement:
	step LEFT
	step_end

EsrevniHallBattleRoomPlayerExitMovement:
	step RIGHT
	step_end

EsrevniHallBattleRoomInverIntroText:
	text "Welcome."
	
	para "How wonderful to"
	line "have another"
	cont "challenger."
	
	para "Let's begin."
	done

EsrevniHallBattleRoomInverWinText:
	text "A wonderful job."
	done

EsrevniHallBattleRoomInverLossText:
	text "That's too bad."
	done

EsrevniHallBattleRoomInverPlayerWinText:
	text "You've done well."
	
	para "Let's return to"
	line "the Main Hall."
	done

EsrevniHallBattleRoomInverPlayerLossText:
	text "No shame in"
	line "a loss."
	
	para "Let's return to"
	line "the Main Hall."
	done

EsrevniHallBattleRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ESREVNI_HALL_1F,  3
	warp_event  5, 17, ESREVNI_HALL_1F,  3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ESREVNI_HALL_BATTLE_ROOM_INVER
