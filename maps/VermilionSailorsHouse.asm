	object_const_def
	const VERMILIONSAILORSHOUSE_SAILOR

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
	special FadeOutToWhite
	waitsfx
	appear VERMILIONSAILORSHOUSE_SAILOR
	warp FARAWAY_ISLAND_OUTSIDE, 11, 40
	end

.NotSailing
	writetext SailorMorePreparedText
	waitbutton
	closetext
	end

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
	step LEFT
	step_end

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

SailorSoBoredText:
	text "I finally got a"
	line "new ship, but"
	
	para "I've got nowhere"
	line "new to sail…"
	done

SailorWhatIsThatMapText:
	text "Wait! That Map"
	line "you have!"
	
	para "Can I see that?"
	
	para "I've never seen"
	line "this before!"
	
	para "Is this a forgot-"
	line "ten island?"
	
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
	object_event  2,  4, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionSailorsHouseSailorScript, -1
