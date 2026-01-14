	object_const_def
	const ROUTE29_LYRA
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL

Route29_MapScripts:
	def_scene_scripts
	scene_script Route29Noop1Scene, SCENE_ROUTE29_NOOP
	scene_script Route29Noop2Scene, SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29TuscanyCallback

Route29Noop1Scene:
Route29Noop2Scene:
	end

Route29TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE29_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE29_LYRA, 15
	special FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER
	pause 15
	applymovement ROUTE29_LYRA, LyraMovementData1a
	turnobject PLAYER, LEFT
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Route29RefusedTutorial
	closetext
	follow ROUTE29_LYRA, PLAYER
	applymovement ROUTE29_LYRA, LyraMovementData1b
	sjump Route29TutorialScript
	
Route29Tutorial2:
	turnobject ROUTE29_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE29_LYRA, 15
	special FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER
	pause 15
	applymovement ROUTE29_LYRA, LyraMovementData2a
	turnobject PLAYER, LEFT
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Route29RefusedTutorial
	closetext
	follow ROUTE29_LYRA, PLAYER
	applymovement ROUTE29_LYRA, LyraMovementData2b
Route29TutorialScript:	
	stopfollow
	loadwildmon PIDGEY, 5
	catchtutorial BATTLETYPE_TUTORIAL
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE
	turnobject ROUTE29_LYRA, UP
	opentext
	writetext CatchingTutorialDebriefText
Route29FinishTutorial:
	waitbutton
	giveitem POKE_BALL, 10
	writetext GetPokeballText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	writetext CatchingTutorialGoodbyeText
	waitbutton
	closetext
	applymovement ROUTE29_LYRA, LyraMovementData3
	disappear ROUTE29_LYRA
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	playmusic MUSIC_ROUTE_29
	end

Route29RefusedTutorial:
	setevent EVENT_NEVER_LEARNED_TO_CATCH_POKEMON
	writetext CatchingTutorialDeclinedText
	sjump Route29FinishTutorial

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime EVE | NITE
	iftrue .nite
.day_morn
	writetextend Route29CooltrainerMText_WaitingForNight

.nite
	writetextend Route29CooltrainerMText_WaitingForMorning

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetextend TuscanyGaveGiftText

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetextend TuscanyNotTuesdayText

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29OranTree:
	fruittree FRUITTREE_ROUTE_29_ORAN

Route29Potion:
	itemball POTION

LyraMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

LyraMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

LyraMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

LyraMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

LyraMovementData3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CatchingTutorialIntroText:
	text "Lyra: <PLAYER>!"

	para "You can catch wild"
	line "#mon with #"
	cont "Balls. Follow me"
	cont "and I'll show you!"
	done

CatchingTutorialDebriefText:
	text "Lyra: See? Just"
	line "like that!"

	para "If you weaken them"
	line "first, #mon are"
	cont "easier to catch."

	para "I'll give you"
	line "these. Good luck!"
	done

CatchingTutorialDeclinedText:
	text "Aww… I wanted to"
	line "show off my cap-"
	cont "turing skills a"
	cont "little…"

	para "Anyway, I'll give"
	line "you these."
	cont "Good luck!"
	done

GetPokeballText:
	text "<PLAYER> received"
	line "10 # Balls."
	done

CatchingTutorialGoodbyeText:
	text "Lyra: See you!"
	done

Route29YoungsterText:
	text "Yo. How are your"
	line "#mon?"

	para "If they're weak"
	line "and not ready for"
	cont "battle, keep out"
	cont "of the grass."
	done

Route29TeacherText:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "New Bark without"
	cont "walking through"
	cont "the grass."
	done

Route29FisherText:
	text "I wanted to take a"
	line "break, so I saved"
	cont "to record my"
	cont "progress."
	done

Route29CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#mon that"
	cont "appear only in"
	cont "the evening or"
	cont "at night."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#mon that"
	cont "appear only in the"
	cont "morning."
	done

MeetTuscanyText:
	text "Tuscany: I do be-"
	line "lieve that this is"
	cont "the first time"
	cont "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am Tuscany of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"
	cont "accept this gift,"
	cont "a Pink Bow."
	done

TuscanyGaveGiftText:
	text "Tuscany: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "Tuscany: Have you"
	line "met Monica, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, Wesley?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "Tuscany: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29Sign1Text:
	text "Route 29"

	para "Cherrygrove City -"
	line "New Bark Town"
	done

Route29Sign2Text:
	text "Route 29"

	para "Cherrygrove City -"
	line "New Bark Town"
	done

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  1, ROUTE_29_ROUTE_46_GATE, 3
	warp_event 26,  1, ROUTE_29_ROUTE_46_GATE, 4

	def_coord_events
	coord_event 51,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 51,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 49,  7, BGEVENT_READ, Route29Sign1
	bg_event  1,  5, BGEVENT_READ, Route29Sign2

	def_object_events
	object_event 48, 12, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_29
	object_event 25, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 13, 11, SPRITE_MARY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 10,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29OranTree, -1
	object_event 23,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 12,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 27, 12, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 47,  2, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
