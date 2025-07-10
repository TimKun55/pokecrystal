	object_const_def
	const VERMILIONSAILORSHOUSE_SAILOR
	const VERMILIONSAILORSHOUSE_SCIENTIST

VermilionSailorsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionSailorsHouseSailorScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_VERMILION_SAILOR
	iftrue .ReturnSail
	checkitem OLD_SEA_MAP
	iftrue .FirstSail
	writetext SailorSoBoredText
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .WayIsClear
	applymovement PLAYER, PlayerOutOfWayMovement
.WayIsClear:	
	applymovement VERMILIONSAILORSHOUSE_SAILOR, BoredSailorLeavesMovement
	disappear VERMILIONSAILORSHOUSE_SAILOR
	playsound SFX_EXIT_BUILDING
	waitsfx
	end
	
.FirstSail
	writetext SailorWhatIsThatMapText
	promptbutton
	setevent EVENT_TALKED_TO_VERMILION_SAILOR
.ReturnSail
	writetext SailorShouldWeSailText
	yesorno
	iffalse .NotSailing
	writetext SailorLetsGoText
	promptbutton
	closetext
	checkevent EVENT_FARAWAY_ISLAND_FIRST_TRIP
	iftrue .NotFirstTime
	opentext
	writetext SailorCallScientist1Text
	waitbutton
	closetext
	turnobject VERMILIONSAILORSHOUSE_SAILOR, RIGHT
	pause 15
	playsound SFX_CALL
	waitsfx
	playsound SFX_CALL
	waitsfx
	pause 15
	opentext
	writetext SailorCallScientist2Text
	waitbutton
	closetext
	playsound SFX_HANG_UP
	waitsfx
	showemote EMOTE_QUESTION, VERMILIONSAILORSHOUSE_SAILOR, 15
	faceplayer
	opentext
	writetext SailorCallScientist3Text
	waitbutton
	closetext
	pause 15
	playsound SFX_EXIT_BUILDING
	appear VERMILIONSAILORSHOUSE_SCIENTIST
	pause 15
	showemote EMOTE_SHOCK, VERMILIONSAILORSHOUSE_SAILOR, 15
	turnobject VERMILIONSAILORSHOUSE_SAILOR, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	readvar VAR_FACING	
	ifnotequal UP, .NoMovement
	turnobject PLAYER, DOWN
	applymovement PLAYER, PlayerMoveForScientistMovement
.NoMovement
	turnobject PLAYER, DOWN
	applymovement VERMILIONSAILORSHOUSE_SCIENTIST, ScientistWalksInMovement
	opentext
	writetext ScientistArrivalText
	waitbutton
	closetext
	showemote EMOTE_HAPPY, VERMILIONSAILORSHOUSE_SAILOR, 15
	opentext
	writetext SailorWaitOnBoatText
	waitbutton
	closetext
	applymovement VERMILIONSAILORSHOUSE_SCIENTIST, ScientistLeavesMovement
	disappear VERMILIONSAILORSHOUSE_SCIENTIST
	playsound SFX_EXIT_BUILDING
	setevent EVENT_FARAWAY_ISLAND_FIRST_TRIP
	faceplayer
	follow VERMILIONSAILORSHOUSE_SAILOR, PLAYER
	applymovement VERMILIONSAILORSHOUSE_SAILOR, SailorExitMove1
	stopfollow
	disappear VERMILIONSAILORSHOUSE_SAILOR
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement PLAYER, PlayerSingleStepExitMovement
	sjump .Continue2

.NotFirstTime:
	readvar VAR_FACING
	ifequal UP, .SailorLocation1
	applymovement VERMILIONSAILORSHOUSE_SAILOR, SailorExitMove1
	sjump .Continue1

.SailorLocation1:
	applymovement VERMILIONSAILORSHOUSE_SAILOR, SailorExitMove2
.Continue1:
	disappear VERMILIONSAILORSHOUSE_SAILOR
	playsound SFX_EXIT_BUILDING
	waitsfx
	readvar VAR_FACING
	ifequal UP, .PlayerLocation1
	readvar VAR_FACING
	ifequal DOWN, .PlayerLocation2
	applymovement PLAYER, PlayerExitMove1
	sjump .Continue2

.PlayerLocation1
	applymovement PLAYER, PlayerExitMove2
	sjump .Continue2

.PlayerLocation2
	applymovement PLAYER, PlayerExitMove3
	sjump .Continue2

.Continue2
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear VERMILIONSAILORSHOUSE_SAILOR
	warp FARAWAY_ISLAND_OUTSIDE, 12, 41
	end

.NotSailing
	writetext SailorMorePreparedText
	waitbutton
	closetext
	end

PlayerOutOfWayMovement:
	step LEFT
	turn_head RIGHT
	step_end

BoredSailorLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

	step_end	

SailorExitMove1:
	step DOWN
	step LEFT
	step LEFT
	step_end

SailorExitMove2:
	step LEFT
	step DOWN
	step LEFT
	step_end

PlayerExitMove1:
	step DOWN
PlayerSingleStepExitMovement:
	step LEFT
	step_end

ScientistLeavesMovement:
PlayerExitMove2:
	step LEFT
	step LEFT
	step_end

PlayerExitMove3:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

SetText:
	text "SET."
	done

SailorSoBoredText:
	text "I finally got a"
	line "new ship, but"
	
	para "I've got nowhere"
	line "new to sail…"
	
	para "Maybe I should"
	line "give up sailing"
	cont "for now…"
	
	para "… … …"
	
	para "I might visit"
	line "my mate in"
	cont "Fuchsia City…"
	done

SailorWhatIsThatMapText:
	text "There you are!"
	
	para "You have the Map"
	line "with you, right?"
	
	para "May I see it"
	line "again, please?"
	
	para "… … …"
	
	para "Yes, I'm sure."
	line "This is the 'lost'"
	cont "jungle island"
	cont "that Team Rocket"
	cont "were trying to"
	cont "get to!"
	
	para "According to"
	line "rumour, this is"
	cont "where a Mythical"
	cont "#mon was dis-"
	cont "covered…"
	
	para "Wow!"
	done

SailorShouldWeSailText:
	text "Should we set sail"
	line "and explore?"
	done

SailorLetsGoText:
	text "Amazing!"
	line "Let's go!"
	done

SailorCallScientist1Text:
	text "Oh!"
	
	para "Hang on, I need"
	line "to make a quick"
	cont "phone call."
	done

SailorCallScientist2Text:
	text "Hey, it's me!"
	
	para "We're about to"
	line "set sail - how"
	cont "fast can you"
	cont "get here?"
	
	para "… … …"
	done

SailorCallScientist3Text:
	text "He hung up…"
	done

ScientistArrivalText:
	text "Scientist: I was"
	line "already in town"
	cont "doing some field"
	cont "research."
	
	para "But that can all"
	line "wait - let's go"
	cont "right now!"
	done

SailorWaitOnBoatText:
	text "Sailor: Amazing"
	line "timing, mate!"
	
	para "Go on and get"
	line "settled in."
	done

SailorMorePreparedText:
	text "No problem."
	line "Best to prepare."
	done

VermilionSailorsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 10
	warp_event  3,  7, VERMILION_CITY, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionSailorsHouseSailorScript, EVENT_VERMILION_SAILORS_HOUSE_SAILOR
	object_event  2,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_VERMILION_SAILORS_HOUSE_SCIENTIST
