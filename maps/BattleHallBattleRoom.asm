	object_const_def
	const BATTLEHALLBATTLEROOM_INVER
	const BATTLEHALLBATTLEROOM_THORTON

BattleHallBattleRoom_MapScripts:
	def_scene_scripts
	scene_script BattleHallBattleRoomEnterScene, SCENE_BATTLEHALLBATTLEROOM_ENTER
	scene_script BattleHallBattleRoomNoopScene,  SCENE_BATTLEHALLBATTLEROOM_NOOP

	def_callbacks

BattleHallBattleRoomEnterScene:
	disappear BATTLEHALLBATTLEROOM_INVER
	disappear BATTLEHALLBATTLEROOM_THORTON
	checkevent EVENT_BATTLE_HALL_TYPELESS_MODE
	iftrue BattleHallBattleRoomTypeless
	sdefer BattleHallBattleRoomInverseScript
	setscene SCENE_BATTLEHALLBATTLEROOM_NOOP
BattleHallBattleRoomNoopScene:
	end

BattleHallBattleRoomTypeless:
	sdefer BattleHallBattleRoomTypelessScript
	setscene SCENE_BATTLEHALLBATTLEROOM_NOOP
	end

BattleHallBattleRoomInverseScript:
	applymovement PLAYER, BattleHallBattleRoomPlayerEnterMovement
	turnobject PLAYER, RIGHT
	appear BATTLEHALLBATTLEROOM_INVER
	warpsound
	waitsfx
	applymovement BATTLEHALLBATTLEROOM_INVER, BattleHallBattleRoomOpponentEnterMovement1
	pause 15
	showemote EMOTE_SHOCK, BATTLEHALLBATTLEROOM_INVER, 15
	pause 15
	applymovement BATTLEHALLBATTLEROOM_INVER, BattleHallBattleRoomOpponentEnterMovement2
	opentext
	writetext BattleHallBattleRoomInverIntroText
	promptbutton
	closetext
	winlosstext BattleHallBattleRoomInverWinText, BattleHallBattleRoomInverLossText
	setlasttalked BATTLEHALLBATTLEROOM_INVER
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
	applymovement BATTLEHALLBATTLEROOM_INVER, BattleHallBattleRoomOpponentExitMovement
	opentext
	writetext BattleHallBattleRoomInverPlayerWinText
	promptbutton
	closetext
	readmem wInverPoints
	addval 1
	writemem wInverPoints
	sjump .FinishInver

.AfterLoss:
	applymovement BATTLEHALLBATTLEROOM_INVER, BattleHallBattleRoomOpponentExitMovement
	opentext
	writetext BattleHallBattleRoomInverPlayerLossText
	promptbutton
	closetext
	special HealParty
.FinishInver
	applymovement PLAYER, BattleHallBattleRoomPlayerExitMovement
	setmapscene BATTLE_HALL_1F, SCENE_BATTLEHALL1F_AFTERINVERBATTLE
	clearevent EVENT_BATTLE_HALL_1F_INVER
	special FadeOutToWhite
	pause 30
	warpfacing UP, BATTLE_HALL_1F, 12,  7
	end

BattleHallBattleRoomTypelessScript:
	applymovement PLAYER, BattleHallBattleRoomPlayerEnterMovement
	turnobject PLAYER, RIGHT
	appear BATTLEHALLBATTLEROOM_THORTON
	warpsound
	waitsfx
	applymovement BATTLEHALLBATTLEROOM_THORTON, BattleHallBattleRoomOpponentEnterMovement1
	pause 15
	showemote EMOTE_SHOCK, BATTLEHALLBATTLEROOM_THORTON, 15
	pause 15
	applymovement BATTLEHALLBATTLEROOM_THORTON, BattleHallBattleRoomOpponentEnterMovement2
	opentext
	writetext BattleHallBattleRoomThortonIntroText
	promptbutton
	closetext
	winlosstext BattleHallBattleRoomThortonWinText, BattleHallBattleRoomThortonLossText
	setlasttalked BATTLEHALLBATTLEROOM_THORTON
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .Thorton2
	checkevent EVENT_BEAT_BLUE
	iftrue .Thorton3
	checkevent EVENT_GRAND_CHAMPION
	iftrue .Thorton4
	loadtrainer THORTON, THORTON_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmap
	iftrue .AfterLoss
	sjump .AfterWin

.Thorton2:
	loadtrainer THORTON, THORTON_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmap
	iftrue .AfterLoss
	sjump .AfterWin

.Thorton3:
	loadtrainer THORTON, THORTON_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmap
	iftrue .AfterLoss
	sjump .AfterWin

.Thorton4:
	loadtrainer THORTON, THORTON_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmap
	iftrue .AfterLoss
.AfterWin:
	applymovement BATTLEHALLBATTLEROOM_THORTON, BattleHallBattleRoomOpponentExitMovement
	opentext
	writetext BattleHallBattleRoomThortonPlayerWinText
	promptbutton
	closetext
	readmem wThortonPoints
	addval 1
	writemem wThortonPoints
	sjump .FinishThorton

.AfterLoss:
	applymovement BATTLEHALLBATTLEROOM_THORTON, BattleHallBattleRoomOpponentExitMovement
	opentext
	writetext BattleHallBattleRoomThortonPlayerLossText
	promptbutton
	closetext
	special HealParty
.FinishThorton
	applymovement PLAYER, BattleHallBattleRoomPlayerExitMovement
	setmapscene BATTLE_HALL_1F, SCENE_BATTLEHALL1F_AFTERTHORTONBATTLE
	clearevent EVENT_BATTLE_HALL_1F_THORTON
	special FadeOutToWhite
	pause 30
	warpfacing UP, BATTLE_HALL_1F, 12,  7
	end

BattleHallBattleRoomPlayerEnterMovement:
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

BattleHallBattleRoomOpponentEnterMovement1:
	slow_step DOWN
	step_end

BattleHallBattleRoomOpponentEnterMovement2:
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

BattleHallBattleRoomOpponentExitMovement:
	step LEFT
	step_end

BattleHallBattleRoomPlayerExitMovement:
	step RIGHT
	step_end

BattleHallBattleRoomInverIntroText:
	text "Welcome."
	
	para "How wonderful to"
	line "have another"
	cont "challenger."
	
	para "Let's begin."
	done

BattleHallBattleRoomInverWinText:
	text "A wonderful job."
	done

BattleHallBattleRoomInverLossText:
	text "That's too bad."
	done

BattleHallBattleRoomInverPlayerWinText:
	text "You've done well."
	
	para "Let's return to"
	line "the Main Hall."
	done

BattleHallBattleRoomInverPlayerLossText:
	text "No shame in"
	line "a loss."
	
	para "Let's return to"
	line "the Main Hall."
	done

BattleHallBattleRoomThortonIntroText:
	text "Bzweeeeep!"
	
	para "Sorry, don't mind"
	line "me. I'm using an"
	cont "invention of mine."
	
	para "It's my data-"
	line "analysing machine."
	
	para "It's calculating"
	line "your chance of"
	cont "winning."
	
	para "Oh!"
	
	para "Interesting."
	
	para "Oh, don't worry"
	line "about that number."
	
	para "Let's get going!"
	done

BattleHallBattleRoomThortonWinText:
	text "Woah! You sure"
	line "showed me!"
	done

BattleHallBattleRoomThortonLossText:
	text "See? Just as"
	line "analysed."
	done

BattleHallBattleRoomThortonPlayerWinText:
	text "Good job!"
	
	para "Let's go back to"
	line "the Main Hall."
	done

BattleHallBattleRoomThortonPlayerLossText:
	text "You battled well."
	
	para "Let's go back to"
	line "the Main Hall."
	done

BattleHallBattleRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BATTLE_HALL_1F,  3
	warp_event  5, 17, BATTLE_HALL_1F,  4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_HALL_BATTLE_ROOM_INVER
	object_event  5,  1, SPRITE_THORTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_HALL_BATTLE_ROOM_THORTON
