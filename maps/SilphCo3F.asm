	object_const_def
	const SILPHCO3F_OFFICER
	const SILPHCO3F_SCIENTIST1
	const SILPHCO3F_SCIENTIST2
	const SILPHCO3F_SCIENTIST3
	const SILPHCO3F_SCIENTIST4
	const SILPHCO3F_SCIENTIST5
	const SILPHCO3F_SCIENTIST6
	const SILPHCO3F_SCIENTIST7

SilphCo3F_MapScripts:
	def_scene_scripts
	scene_script SilphCo3FNoopScene, SCENE_SILPHCO3F_STAIRS
	scene_script SilphCo3FLeaveElevatorScene, SCENE_SILPHCO3F_ELEVATOR_EXIT

	def_callbacks

SilphCo3FLeaveElevatorScene:
	sdefer PlayerLeavesElevatorScene
SilphCo3FNoopScene:
	end

SilphCo3FOfficerStopLScene:
	turnobject PLAYER, RIGHT
	turnobject SILPHCO3F_OFFICER, LEFT
	sjump SilphCo3FOfficerStopRScene.ContinueOfficer

SilphCo3FOfficerStopRScene:
	turnobject PLAYER, LEFT
	turnobject SILPHCO3F_OFFICER, RIGHT
.ContinueOfficer
	opentext
	writetext SilphCo3FOfficerText
	waitbutton
	closetext
	applymovement PLAYER, SilphCo3FPlayerMovement
	turnobject SILPHCO3F_OFFICER, DOWN
	end

PlayerLeavesElevatorScene:
	turnobject PLAYER, LEFT
	turnobject SILPHCO3F_SCIENTIST7, RIGHT
	opentext
	writetext SilphCo3FScientistElevatorText
	waitbutton
	closetext
	turnobject SILPHCO3F_SCIENTIST7, DOWN
	setscene SCENE_SILPHCO3F_STAIRS
	end

SilphCo3FOfficerScript:
	jumptextfaceplayer SilphCo3FOfficerText

SilphCo3FScientist1Script:
	faceplayer
	opentext
	;checkevent 1 for intro, 1 for after event is over
	writetext SilphCo3FScientist1IntroText
	waitbutton
.SkipIntro:
	writetext SilphCo3FScientist1AreYouReadyText
	yesorno
	iftrue .EnterTransferMachine
	writetextend SilphCo3FScientist1NextTimeText

.EnterTransferMachine:
	writetext SilphCo3FScientist1LetsGetStartedText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .FromLeftMovement
	ifequal UP, .FromUpMovement
; FromRightMovement
	applymovement PLAYER, SilphCo3FPlayerToDoorMovement1
	sjump .ContinueEnterTransferMachine

.FromLeftMovement:
	applymovement PLAYER, SilphCo3FPlayerToDoorMovement3
	sjump .ContinueEnterTransferMachine

.FromUpMovement:
	applymovement PLAYER, SilphCo3FPlayerToDoorMovement2
.ContinueEnterTransferMachine:
	turnobject SILPHCO3F_SCIENTIST1, UP
	pause 10
	playsound SFX_BOOT_PC
	waitsfx
	playsound SFX_CHOOSE_PC_OPTION
	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_BALL_WOBBLE
	turnobject SILPHCO3F_SCIENTIST1, LEFT
	opentext
	writetext SilphCo3FScientist1ReadyToStartText
	waitbutton
	closetext
	applymovement PLAYER, SilphCo3FPlayerSlowStepUpMovement
	playsound SFX_ENTER_DOOR
;	disappear PLAYER
	special FadeOutToWhite
	pause 15
; placeholder
;	appear PLAYER
	special LoadMapPalettes
	applymovement PLAYER, SilphCo3FPlayerMovement
	end

SilphCo3FScientist2Script:
	faceplayer
	opentext
	writetext SilphCo3FScientist2Text
	waitbutton
	closetext
	turnobject SILPHCO3F_SCIENTIST2, UP
	end

SilphCo3FScientist3Script:
	faceplayer
	opentext
	writetext SilphCo3FScientist3Text
	waitbutton
	closetext
	turnobject SILPHCO3F_SCIENTIST3, UP
	end

SilphCo3FScientist4Script:
	faceplayer
	opentext
	writetext SilphCo3FScientist4Text
	waitbutton
	closetext
	turnobject SILPHCO3F_SCIENTIST4, UP
	end

SilphCo3FScientist5Script:
	faceplayer
	opentext
	writetext SilphCo3FScientist5Text
	waitbutton
	closetext
	turnobject SILPHCO3F_SCIENTIST5, UP
	end

SilphCo3FScientist6Script:
	faceplayer
	opentext
	writetext SilphCo3FScientist6Text
	waitbutton
	closetext
	turnobject SILPHCO3F_SCIENTIST6, UP
	end

SilphCo3FScientist7Script:
	faceplayer
	opentext
	writetext SilphCo3FScientist7UseElevatorText
	yesorno
	iftrue .UseElevator
	writetextend SilphCo3FScientist7NextTimeText

.UseElevator:
	writetext SilphCo3FScientist7LetsGoText
	waitbutton
	closetext
	follow SILPHCO3F_SCIENTIST7, PLAYER
	applymovement SILPHCO3F_SCIENTIST7, SilphCo3FScientist7Movement
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SILPHCO3F_SCIENTIST7
	applymovement PLAYER, SilphCo3FPlayerStepUpMovement
	playsound SFX_ENTER_DOOR
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	clearevent EVENT_SILPH_CO_ELEVATOR_UP
	warpfacing UP, SILPH_CO_ELEVATOR, 2, 3
	end

SilphCo3FElevator:
	jumptext SilphCo3FElevatorText

SilphCo3FFloorSign:
	jumptext SilphCo3FFloorSignText

SilphCo3FVendingMachine:
	jumpstd VendingMachineScript

SilphCo3FPlayerMovement:
	step DOWN
	step_end

SilphCo3FPlayerToDoorMovement1:
	step LEFT
	turn_head UP
	step_end

SilphCo3FPlayerToDoorMovement3:
	step DOWN
	step LEFT
SilphCo3FPlayerToDoorMovement2:
	step LEFT
	step LEFT
	step UP
	step_end

SilphCo3FPlayerSlowStepUpMovement:
	slow_step UP
	step_end

SilphCo3FScientist7Movement:
	step RIGHT
SilphCo3FPlayerStepUpMovement:
	step UP
	step_end

SilphCo3FOfficerText:
	text "Only employees are"
	line "permitted to use"
	cont "the stairs."
	done

SilphCo3FScientistElevatorText:
	text "Welcome to 3F!"
	
	para "If you'd like to"
	line "return to the 1F,"
	cont "I'll be happy to"
	cont "return you."
	done

SilphCo3FScientist7UseElevatorText:
	text "Hello!"
	
	para "Would you like to"
	line "return to 1F?"
	done

SilphCo3FScientist7NextTimeText:
	text "Let me know when"
	line "you'd like to"
	cont "return."
	done

SilphCo3FScientist7LetsGoText:
	text "Let's go!"
	done

SilphCo3FScientist1IntroText:
	text "Hello, are you"
	line "here to help us"
	cont "with Porygon?"
	
	para "Amazing!"
	
	para "When you step into"
	line "the transfer"
	cont "machine, it will"
	cont "digitize your body"
	cont "and #mon so"
	cont "you can enter the"
	cont "Porygon Farm."
	done

SilphCo3FScientist1NextTimeText:
	text "Take your time to"
	line "prepare. We can"
	cont "start when you're"
	cont "ready."
	done

SilphCo3FScientist1LetsGetStartedText:
	text "Let's get started!"
	
	para "Please stand in"
	line "front of the door."
	done

SilphCo3FScientist1ReadyToStartText:
	text "We're good to go!"
	line "Good luck in there"
	cont "and see you soon!"
	done

SilphCo3FScientist1AreYouReadyText:
	text "Are you ready"
	line "to start?"
	done

SilphCo3FScientist2Text:
	text "I monitor the"
	line "transfer machine."

	para "There are a lot"
	line "of things that can"
	cont "go wrong, but I'm"
	cont "very good at doing"
	cont "my job!"
	done	

SilphCo3FScientist3Text:
SilphCo3FScientist4Text:
	text "I'm monotoring the"
	line "virtual space that"
	cont "all the Porygon"
	cont "live in."
	done

SilphCo3FScientist5Text:
	text "I'm looking into"
	line "Porygon's evo-"
	cont "lution potential."
	done

SilphCo3FScientist6Text:
	text "I'm looking into"
	line "Porygon's biology."
	
	para "Facinating how it"
	line "is a digital life-"
	cont "form but also"
	cont "seems to be an"
	cont "organic lifeform."	
	done

SilphCo3FElevatorText:
	text "…… ……"

	para "There's no"
	line "response…"
	done

SilphCo3FFloorSignText:
	text "Silph Co."
	line "3rd Floor."

	para "Porygon farm"
	line "management dept."
	done

SilphCo3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events
	coord_event 17,  1, SCENE_SILPHCO3F_STAIRS, SilphCo3FOfficerStopLScene
	coord_event 19,  1, SCENE_SILPHCO3F_STAIRS, SilphCo3FOfficerStopRScene

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, SilphCo3FElevator
	bg_event 15,  0, BGEVENT_READ, SilphCo3FFloorSign
	bg_event  6,  1, BGEVENT_UP, SilphCo3FVendingMachine
	bg_event  7,  1, BGEVENT_UP, SilphCo3FVendingMachine

	def_object_events
	object_event 18,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo3FOfficerScript, -1

	object_event  8, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist1Script, -1

	object_event  2,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist2Script, -1

	object_event 14,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist3Script, -1
	object_event 18,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist4Script, -1
	object_event 18, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist5Script, -1
	object_event 14, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist6Script, -1
	object_event 13,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FScientist7Script, -1