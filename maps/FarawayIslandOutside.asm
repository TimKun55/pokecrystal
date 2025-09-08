	object_const_def
	const FARAWAYISLANDOUTSIDE_SAILOR
	const FARAWAYISLANDOUTSIDE_SCIENTIST1
	const FARAWAYISLANDOUTSIDE_SCIENTIST2
	const FARAWAYISLANDOUTSIDE_MEW

FarawayIslandOutside_MapScripts:
	def_scene_scripts
	scene_script FarawayIslandOutsideNoop1Scene, SCENE_FARAWAYISLANDOUTSIDE_NOOP
	scene_script FarawayIslandOutsideNoop2Scene, SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW1
	scene_script FarawayIslandOutsideNoop3Scene, SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW2
	scene_script FarawayIslandOutsideNoop4Scene, SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW3

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FarawayIslandOutsideScientistCallback

FarawayIslandOutsideNoop1Scene:
FarawayIslandOutsideNoop2Scene:
FarawayIslandOutsideNoop3Scene:
FarawayIslandOutsideNoop4Scene:
	end

FarawayIslandOutsideScientistCallback:
	checkevent EVENT_READ_FARAWAY_ISLAND_SIGN
	iffalse .Appear
	disappear FARAWAYISLANDOUTSIDE_SCIENTIST1
	disappear FARAWAYISLANDOUTSIDE_SCIENTIST2
	endcallback

.Appear:
	appear FARAWAYISLANDOUTSIDE_SCIENTIST1
	endcallback

FarawayIslandChaseMew1Scene:
	moveobject FARAWAYISLANDOUTSIDE_MEW, 11, 12
	appear FARAWAYISLANDOUTSIDE_MEW
	cry MEW
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, PlayerSlowStepUpMovement
	pause 15
	applymovement FARAWAYISLANDOUTSIDE_MEW, Mew1Movement
	pause 15
	disappear FARAWAYISLANDOUTSIDE_MEW
	setscene SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW2
	end

FarawayIslandChaseMew2Scene:
	moveobject FARAWAYISLANDOUTSIDE_MEW, 14,  7
	appear FARAWAYISLANDOUTSIDE_MEW
	cry MEW
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	applymovement PLAYER, PlayerSlowStepUpMovement
	pause 15
	showemote EMOTE_SHOCK, FARAWAYISLANDOUTSIDE_MEW, 15
	applymovement FARAWAYISLANDOUTSIDE_MEW, Mew2Movement
	pause 15
	disappear FARAWAYISLANDOUTSIDE_MEW
	setscene SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW3
	end

FarawayIslandChaseMew3Scene:
	moveobject FARAWAYISLANDOUTSIDE_MEW, 21, 11
	appear FARAWAYISLANDOUTSIDE_MEW
	cry MEW
	turnobject PLAYER, RIGHT
	applymovement PLAYER, PlayerSlowStepUp3Movement
	pause 15
	applymovement FARAWAYISLANDOUTSIDE_MEW, Mew3Movement
	disappear FARAWAYISLANDOUTSIDE_MEW
	setscene SCENE_FARAWAYISLANDOUTSIDE_NOOP
	end

FarawayIslandScientist1Script:
	faceplayer
	opentext
	writetext ScientistInspectingText
	waitbutton
	closetext
	turnobject FARAWAYISLANDOUTSIDE_SCIENTIST1, LEFT
	end

FarawayIslandScientist2Script:
	jumptextfaceplayer FinishedInspectingText

FarawayIslandSailorScript:
	faceplayer
	opentext
	writetext FarawayIslandReadytoleaveText
	yesorno
	iffalse .LetMeKnow
	writetext FarawayIslandDepartingText
	waitbutton
	closetext
	turnobject FARAWAYISLANDOUTSIDE_SAILOR, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear FARAWAYISLANDOUTSIDE_SAILOR
	waitsfx
	applymovement PLAYER, FarawayIslandEnterFastShipMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warp VERMILION_SAILORS_HOUSE,  0,  5
	end

.LetMeKnow:
	writetextend WhenToLeaveText

FarawayIslandSign:
	opentext
	checkevent EVENT_READ_FARAWAY_ISLAND_SIGN
	iftrue .DontSetEvent
	setevent EVENT_READ_FARAWAY_ISLAND_SIGN
	disappear FARAWAYISLANDOUTSIDE_SCIENTIST1
	appear FARAWAYISLANDOUTSIDE_SCIENTIST2
	setscene SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW1
.DontSetEvent
	writetextend FarawayIslandSignText

PlayerSlowStepUpMovement:
	slow_step UP
	slow_step UP
	step_end

PlayerSlowStepUp3Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

Mew1Movement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	step_end

Mew2Movement:
	step DOWN
	step DOWN
	step RIGHT
	step_end

Mew3Movement:
	step UP
	step RIGHT
	step UP
	step UP
	step_end

FarawayIslandEnterFastShipMovement:
	step DOWN
	step_end

ScientistInspectingText:
	text "I'm so excited to"
	line "be here!"

	para "I think there are"
	line "some footprints"
	cont "here…"

	para "Can you give me a"
	line "few minutes to"
	cont "sketch these and"
	cont "make some notes?"
	done	

FinishedInspectingText:
	text "Thanks for letting"
	line "me finish up"
	cont "my notes."
	
	para "I'm going to keep"
	line "having a look"
	cont "around and then"
	cont "wait for you on"
	cont "the boat."
	
	para "I don't want to"
	line "go any further"
	cont "up into the"
	cont "jungle, though…"
	done

FarawayIslandReadytoleaveText:
	text "Are you ready"
	line "to go back to"
	cont "Vermilion?"
	done

FarawayIslandDepartingText:
	text "Off we go, then."
	done

WhenToLeaveText:
	text "Let me know when"
	line "you'd like to go."
	done

FarawayIslandSignText:
	text "The writing is"
	line "fading as if it"

	para "was written a long"
	line "time ago…"

	para "“…ber, 6th day"

	para "If any human…sets"
	line "foot here…"
	cont "again…et it be a"
	cont "kindhearted pers…"

	para "…ith that hope,"
	line "I depar…"

	para "…ji”"
	done

FarawayIslandOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 22,  8, FARAWAY_ISLAND_INSIDE, 1
	warp_event 23,  8, FARAWAY_ISLAND_INSIDE, 2

	def_coord_events
	coord_event  9, 17, SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW1, FarawayIslandChaseMew1Scene
	coord_event  9, 12, SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW2, FarawayIslandChaseMew2Scene
	coord_event 15,  9, SCENE_FARAWAYISLANDOUTSIDE_CHASE_MEW3, FarawayIslandChaseMew3Scene	

	def_bg_events
	bg_event  4, 34, BGEVENT_READ, FarawayIslandSign

	def_object_events
	object_event 12, 42, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, FarawayIslandSailorScript, -1
	object_event 17, 22, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandScientist1Script, EVENT_FARAWAY_ISLAND_SCIENTIST
	object_event 11, 25, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandScientist2Script, EVENT_FARAWAY_ISLAND_SCIENTIST
	object_event 33,  0, SPRITE_MEW, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FARAWAY_ISLAND_OUTSIDE_MEW
