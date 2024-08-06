	object_const_def
	const FARAWAYISLANDOUTSIDE_SAILOR

FarawayIslandOutside_MapScripts:
	def_scene_scripts

	def_callbacks

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
	special FadeOutToWhite
	waitsfx
	warp VERMILION_SAILORS_HOUSE,  0,  5
	end

.LetMeKnow:
	writetext WhenToLeaveText
	waitbutton
	closetext
	end

FarawayIslandSign:
	jumptext FarawayIslandSignText

FarawayIslandEnterFastShipMovement:
	step DOWN
	step_end

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
	warp_event 16,  5, FARAWAY_ISLAND_INSIDE, 1
	warp_event 17,  5, FARAWAY_ISLAND_INSIDE, 2

	def_coord_events

	def_bg_events
	bg_event  3, 35, BGEVENT_READ, FarawayIslandSign

	def_object_events
	object_event 11, 41, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, FarawayIslandSailorScript, -1
