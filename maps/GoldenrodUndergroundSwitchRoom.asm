DEF ugdoor_n = 0

MACRO ugdoor_def
;\1: x coord
;\2: y coord
;\3: closed block id
;\4: open block id
;...
	DEF ugdoor_n += 1
	DEF UGDOOR_{d:ugdoor_n}_SIZE EQU _NARG / 4
	for i, UGDOOR_{d:ugdoor_n}_SIZE
		DEF UGDOOR_{d:ugdoor_n}_X_{d:i}      EQU \1
		DEF UGDOOR_{d:ugdoor_n}_Y_{d:i}      EQU \2
		DEF UGDOOR_{d:ugdoor_n}_CLOSED_{d:i} EQU \3
		DEF UGDOOR_{d:ugdoor_n}_OPEN_{d:i}   EQU \4
		shift 4
	endr
ENDM

	;           x,  y, closed, open,  x,  y, closed, open ; id
	ugdoor_def 18,  4,    $59,  $4d, 18,  6,    $58,  $4d ;  1
	ugdoor_def 12,  4,    $59,  $4d, 12,  6,    $58,  $4d ;  2
	ugdoor_def  4,  4,    $59,  $4d,  4,  6,    $58,  $4d ;  3
	ugdoor_def  4,  8,    $59,  $4d,  4, 10,    $58,  $4d ;  4
	ugdoor_def 12,  8,    $59,  $4d, 12, 10,    $58,  $4d ;  5
	ugdoor_def 18,  8,    $59,  $4d, 18, 10,    $58,  $4d ;  6
	ugdoor_def 14,  4,    $5b,  $57, 14,  6,    $5c,  $58 ;  7
	ugdoor_def  8,  4,    $5a,  $51,  8,  6,    $5c,  $58 ;  8
	ugdoor_def 14,  8,    $5f,  $6b, 14, 10,    $5c,  $58 ;  9
	ugdoor_def  8,  8,    $5e,  $5d,  8, 10,    $5c,  $58 ; 10
	ugdoor_def 20,  8,    $68,  $6c, 20, 10,    $5c,  $58 ; 11

MACRO changeugdoor
;\1: ugdoor id
;\2: state (CLOSED or OPEN)
	DEF n = \1
	for i, UGDOOR_{d:n}_SIZE
		changeblock UGDOOR_{d:n}_X_{d:i}, UGDOOR_{d:n}_Y_{d:i}, UGDOOR_{d:n}_\2_{d:i}
	endr
ENDM

	object_const_def
	const GOLDENRODUNDERGROUNDSWITCHROOM_PHARMACIST1
	const GOLDENRODUNDERGROUNDSWITCHROOM_PHARMACIST2
	const GOLDENRODUNDERGROUNDSWITCHROOM_ROCKET1
	const GOLDENRODUNDERGROUNDSWITCHROOM_ROCKET2
	const GOLDENRODUNDERGROUNDSWITCHROOM_ROCKET3
	const GOLDENRODUNDERGROUNDSWITCHROOM_ROCKET_GIRL
	const GOLDENRODUNDERGROUNDSWITCHROOM_POKE_BALL1
	const GOLDENRODUNDERGROUNDSWITCHROOM_POKE_BALL2
	const GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL

GoldenrodUndergroundSwitchRoom_MapScripts:
	def_scene_scripts
	scene_script GoldenrodUndergroundSwitchRoomNoop1Scene, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE
	scene_script GoldenrodUndergroundSwitchRoomNoop2Scene, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodUndergroundSwitchRoomUpdateDoorPositionsCallback

GoldenrodUndergroundSwitchRoomNoop1Scene:
GoldenrodUndergroundSwitchRoomNoop2Scene:
	end

GoldenrodUndergroundSwitchRoomUpdateDoorPositionsCallback:
for n, 1, ugdoor_n + 1
	checkevent EVENT_DOOR_{d:n}_OPEN
	iffalse .door_{d:n}_closed
	changeugdoor n, OPEN
.door_{d:n}_closed
endr
	endcallback

UndergroundRivalScene1:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, UndergroundRivalApproachMovement1
	turnobject PLAYER, RIGHT
	scall UndergroundRivalBattleScript
	applymovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, UndergroundRivalRetreatMovement1
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	setscene SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_NOOP
	waitsfx
	playmapmusic
	end

UndergroundRivalScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	waitsfx
	applymovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, UndergroundRivalApproachMovement2
	turnobject PLAYER, RIGHT
	scall UndergroundRivalBattleScript
	applymovement GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL, UndergroundRivalRetreatMovement2
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	setscene SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_NOOP
	waitsfx
	playmapmusic
	end

UndergroundRivalBattleScript:
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .Continue
	setevent EVENT_RIVAL_BURNED_TOWER
	setmapscene BURNED_TOWER_1F, SCENE_BURNEDTOWER1F_RIVAL_BATTLE
.Continue:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_GOLDENROD_UNDERGROUND
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Totodile:
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.Chikorita:
	winlosstext UndergroundRivalWinText, UndergroundRivalLossText
	setlasttalked GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL
	loadtrainer RIVAL1, RIVAL1_4_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRivalBattle

.FinishRivalBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetextend UndergroundRivalAfterText

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntM11AfterBattleText

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntM25AfterBattleText

TrainerBurglarDuncan:
	trainer BURGLAR, DUNCAN, EVENT_BEAT_BURGLAR_DUNCAN, BurglarDuncanSeenText, BurglarDuncanBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BurglarDuncanAfterBattleText

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BurglarEddieAfterBattleText

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntM13AfterBattleText

TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntF3AfterBattleText

Switch1Script:
	opentext
	writetext SwitchRoomText_Switch1
	promptbutton
	checkevent EVENT_SWITCH_1
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	readmem wUndergroundSwitchPositions
	addval 1
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_1
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	readmem wUndergroundSwitchPositions
	addval -1
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_1
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

Switch2Script:
	opentext
	writetext SwitchRoomText_Switch2
	promptbutton
	checkevent EVENT_SWITCH_2
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	readmem wUndergroundSwitchPositions
	addval 2
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_2
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	readmem wUndergroundSwitchPositions
	addval -2
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_2
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

Switch3Script:
	opentext
	writetext SwitchRoomText_Switch3
	promptbutton
	checkevent EVENT_SWITCH_3
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	readmem wUndergroundSwitchPositions
	addval 3
	writemem wUndergroundSwitchPositions
	setevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	readmem wUndergroundSwitchPositions
	addval -3
	writemem wUndergroundSwitchPositions
	clearevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

EmergencySwitchScript:
	opentext
	writetext SwitchRoomText_Emergency
	promptbutton
	checkevent EVENT_EMERGENCY_SWITCH
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	setval 7
	writemem wUndergroundSwitchPositions
	setevent EVENT_EMERGENCY_SWITCH
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse GoldenrodUndergroundSwitchRoom_DontToggle
	setval 0
	writemem wUndergroundSwitchPositions
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	sjump GoldenrodUndergroundSwitchRoom_UpdateDoors

GoldenrodUndergroundSwitchRoom_DontToggle:
	closetext
	end

GoldenrodUndergroundSwitchRoom_UpdateDoors:
	readmem wUndergroundSwitchPositions
	ifequal 0, .Position0
	ifequal 1, .Position1
	ifequal 2, .Position2
	ifequal 3, .Position3
	ifequal 4, .Position4
	ifequal 5, .Position5
	ifequal 6, .Position6
	ifequal 7, .EmergencyPosition
.Position0:
	playsound SFX_ENTER_DOOR
	scall .CloseDoor1
	scall .CloseDoor2
	scall .CloseDoor3
	scall .CloseDoor4
	scall .CloseDoor5
	scall .CloseDoor6
	scall .CloseDoor7
	scall .CloseDoor8
	scall .CloseDoor9
	scall .CloseDoor10
	scall .CloseDoor11
	reloadmappart
	closetext
	end

.Position1:
	playsound SFX_ENTER_DOOR
	scall .OpenDoor1
	scall .OpenDoor7
	scall .OpenDoor10
	scall .CloseDoor6
	scall .CloseDoor8
	scall .CloseDoor9
	scall .CloseDoor11
	reloadmappart
	closetext
	end

.Position2:
	playsound SFX_ENTER_DOOR
	scall .OpenDoor2
	scall .OpenDoor8
	scall .OpenDoor9
	scall .CloseDoor5
	scall .CloseDoor7
	scall .CloseDoor10
	scall .CloseDoor11
	reloadmappart
	closetext
	end

.Position3:
	playsound SFX_ENTER_DOOR
	scall .OpenDoor3
	scall .OpenDoor7
	scall .OpenDoor10
	scall .CloseDoor4
	scall .CloseDoor8
	scall .CloseDoor9
	scall .CloseDoor11
	reloadmappart
	closetext
	end

.Position4:
	playsound SFX_ENTER_DOOR
	scall .OpenDoor4
	scall .OpenDoor8
	scall .OpenDoor9
	scall .CloseDoor3
	scall .CloseDoor7
	scall .CloseDoor10
	scall .CloseDoor11
	reloadmappart
	closetext
	end

.Position5:
	playsound SFX_ENTER_DOOR
	scall .OpenDoor5
	scall .OpenDoor7
	scall .OpenDoor10
	scall .CloseDoor2
	scall .CloseDoor8
	scall .CloseDoor9
	scall .CloseDoor11
	reloadmappart
	closetext
	end

.Position6:
	playsound SFX_ENTER_DOOR
	scall .OpenDoor6
	scall .OpenDoor8
	scall .OpenDoor9
	scall .OpenDoor11
	scall .CloseDoor1
	scall .CloseDoor7
	scall .CloseDoor10
	reloadmappart
	closetext
	end

.EmergencyPosition:
	playsound SFX_ENTER_DOOR
	scall .CloseDoor1
	scall .CloseDoor2
	scall .OpenDoor3
	scall .CloseDoor4
	scall .OpenDoor5
	scall .OpenDoor6
	scall .CloseDoor7
	scall .OpenDoor8
	scall .OpenDoor9
	scall .CloseDoor10
	scall .OpenDoor11
	reloadmappart
	closetext
	setval 6
	writemem wUndergroundSwitchPositions
	end

for n, 1, ugdoor_n + 1
.OpenDoor{d:n}:
	changeugdoor n, OPEN
	setevent EVENT_DOOR_{d:n}_OPEN
	end
endr

for n, 1, ugdoor_n + 1
.CloseDoor{d:n}:
	changeugdoor n, CLOSED
	clearevent EVENT_DOOR_{d:n}_OPEN
	end
endr

GoldenrodUndergroundSwitchRoomSmokeBall:
	itemball SMOKE_BALL

GoldenrodUndergroundSwitchRoomFullHeal:
	itemball FULL_HEAL

GoldenrodUndergroundSwitchRoomHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_HIDDEN_MAX_POTION

GoldenrodUndergroundSwitchRoomHiddenRevive:
	hiddenitem REVIVE, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_HIDDEN_REVIVE

UndergroundRivalApproachMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundRivalApproachMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundRivalRetreatMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

UndergroundRivalRetreatMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

UndergroundRivalBeforeText:
	ntag "<RIVAL>"
	text "Hold it!"

	para "I saw you, so I"
	line "tailed you."

	para "I don't need you"
	line "underfoot while I"
	cont "take care of Team"
	cont "Rocket."

	para "…Wait a second."
	line "You beat me be-"
	cont "fore, didn't you?"

	para "That was just a"
	line "fluke."

	para "But I repay my"
	line "debts!"
	done

UndergroundRivalWinText:
	ntag "<RIVAL>"
	text "…Why…"
	line "Why do I lose?"

	para "I've assembled the"
	line "toughest #mon."

	para "I didn't ease up"
	line "on the gas."

	para "So why do I lose?"
	done

UndergroundRivalAfterText:
	ntag "<RIVAL>"
	text "…I don't under-"
	line "stand…"

	para "Is what that Lance"
	line "guy said true?"

	para "That I don't treat"
	line "#mon properly?"

	para "Love…"

	para "Trust…"

	para "Are they really"
	line "what I lack?"

	para "Are they keeping"
	line "me from winning?"

	para "I… I just don't"
	line "understand."

	para "But it's not going"
	line "to end here."

	para "Not now. Not"
	line "because of this."

	para "I won't give up my"
	line "dream of becoming"

	para "the world's best"
	line "#mon trainer!"
	done

UndergroundRivalLossText:
	ntag "<RIVAL>"
	text "Humph. This is my"
	line "real power, wimp."

	para "I'll make Team"
	line "Rocket history."

	para "And I'm going to"
	line "grind that Lance"
	cont "under my heels."
	done

GruntM11SeenText:
	text "Open one shutter,"
	line "another closes."

	para "Bet you can't get"
	line "where you want!"
	done

GruntM11BeatenText:
	text "Drat! I was sunk"
	line "by indecision!"
	done

GruntM11AfterBattleText:
	text "I'm confused too…"
	line "The switch on the"
	cont "end is the one to"
	cont "press first, but…"
	done

GruntM25SeenText:
	text "Kwahaha!"

	para "Confounded by the"
	line "shutters, are we?"

	para "I'll let you in on"
	line "a secret if you"
	cont "can beat me!"
	done

GruntM25BeatenText:
	text "Uwww…"
	line "I blew it."
	done

GruntM25AfterBattleText:
	text "All right. A hint!"

	para "Change the order"
	line "of switching."

	para "That'll change the"
	line "ways the shutters"
	cont "open and close."
	done

BurglarDuncanSeenText:
	text "Fork over your"
	line "goodies!"
	done

BurglarDuncanBeatenText:
	text "Mercy!"
	done

BurglarDuncanAfterBattleText:
	text "Steal and sell!"
	line "That's basic in"
	cont "crime, kid!"
	done

BurglarEddieSeenText:
	text "They ditched this"
	line "project before"
	cont "they finished."

	para "I'm searching for"
	line "leftover loot."
	done

BurglarEddieBeatenText:
	text "Over the top!"
	done

BurglarEddieAfterBattleText:
	text "Underground Ware-"
	line "house?"

	para "What do you want"
	line "to go there for?"

	para "There's nothing"
	line "down there."
	done

GruntM13SeenText:
	text "I don't care if"
	line "you're lost."

	para "You show up here,"
	line "you're nothing but"
	cont "a victim!"
	done

GruntM13BeatenText:
	text "Urk! Yeah, think"
	line "you're cool, huh?"
	done

GruntM13AfterBattleText:
	text "You must have ice"
	line "in your veins to"
	cont "dis Team Rocket."
	done

SwitchRoomText_Switch1:
	text "It's labeled"
	line "SWITCH 1."
	done

GruntF3SeenText:
	text "Are you lost? No,"
	line "you can't be."

	para "You don't have"
	line "that scared look."

	para "I'll give you"
	line "something to be"
	cont "scared about!"
	done

GruntF3BeatenText:
	text "How could you?"
	done

GruntF3AfterBattleText:
	text "Go wherever you'd"
	line "like! Get lost!"
	cont "See if I care!"
	done

SwitchRoomText_OffTurnOn:
	text "It's OFF."
	line "Turn it ON?"
	done

SwitchRoomText_OnTurnOff:
	text "It's ON."
	line "Turn it OFF?"
	done

SwitchRoomText_Switch2:
	text "It's labeled"
	line "SWITCH 2."
	done

SwitchRoomText_Switch3:
	text "It's labeled"
	line "SWITCH 3."
	done

SwitchRoomText_Emergency:
	text "It's labeled"
	line "EMERGENCY."
	done

GoldenrodUndergroundSwitchRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, GOLDENROD_UNDERGROUND, 6
	warp_event 24,  9, GOLDENROD_UNDERGROUND_WAREHOUSE, 1
	warp_event 25,  9, GOLDENROD_UNDERGROUND_WAREHOUSE, 2

	def_coord_events
	coord_event 20,  3, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE, UndergroundRivalScene1
	coord_event 20,  4, SCENE_GOLDENRODUNDERGROUNDSWITCHROOM_RIVAL_BATTLE, UndergroundRivalScene2

	def_bg_events
	bg_event 18,  0, BGEVENT_READ, Switch1Script
	bg_event 12,  0, BGEVENT_READ, Switch2Script
	bg_event  4,  0, BGEVENT_READ, Switch3Script
	bg_event 22,  9, BGEVENT_READ, EmergencySwitchScript
	bg_event 10,  8, BGEVENT_ITEM, GoldenrodUndergroundSwitchRoomHiddenMaxPotion
	bg_event  3,  6, BGEVENT_ITEM, GoldenrodUndergroundSwitchRoomHiddenRevive

	def_object_events
	object_event 11, 10, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBurglarDuncan, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 19,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 21, 10, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3, 10, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundSwitchRoomSmokeBall, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_SMOKE_BALL
	object_event 16,  8, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundSwitchRoomFullHeal, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_FULL_HEAL
	object_event 25,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_GOLDENROD_UNDERGROUND
