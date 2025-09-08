	object_const_def
	const OLIVINELIGHTHOUSE1F_SAILOR1
	const OLIVINELIGHTHOUSE1F_POKEFAN_F
	const OLIVINELIGHTHOUSE1F_SAILOR2
	const OLIVINELIGHTHOUSE1F_POKEFAN_M
	const OLIVINELIGHTHOUSE1F_TWIN

OlivineLighthouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse1FSailorScript:
	jumptextfaceplayer OlivineLighthouse1FSailorText

OlivineLighthouse1FPokefanFScript:
	jumptextfaceplayer OlivineLighthouse1FPokefanFText

OlivineLighthouse1FElevatorSailorScript:
	jumptextfaceplayer OlivineLighthouse1FElevatorSailorText

OlivineLighthouse1FPokefanMTwinScript:
	turnobject OLIVINELIGHTHOUSE1F_TWIN, LEFT
	pause 10
	turnobject OLIVINELIGHTHOUSE1F_TWIN, RIGHT
	pause 10
	opentext
	writetext OlivineLighthouse1FTwinText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE1F_POKEFAN_M, LEFT
	opentext
	writetext OlivineLighthouse1FPokefanMText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE1F_POKEFAN_M, UP
	pause 10
	turnobject OLIVINELIGHTHOUSE1F_POKEFAN_M, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE1F_POKEFAN_M, LEFT
	pause 10
	turnobject OLIVINELIGHTHOUSE1F_POKEFAN_M, DOWN
	end

OlivineLighthouse1FSailorText:
	text "People train at"
	line "this Lighthouse."

	para "It's not easy to"
	line "climb because of"
	cont "all the trainers."
	done

OlivineLighthouse1FPokefanFText:
	text "In the past, #-"
	line "mon used to light"
	cont "the sea around"
	cont "Olivine at night."

	para "The Lighthouse was"
	line "made in honor of"
	cont "those #mon."
	done

OlivineLighthouse1FElevatorSailorText:
	text "Sorry, kid!"
	line "The elevator isn't"
	cont "working right now!"
	done

OlivineLighthouse1FTwinText:
	text "Daddy, please, can"
	line "we go to the top?"
	done

OlivineLighthouse1FPokefanMText:
	text "Oh, sweetie, I'm"
	line "really not good"
	cont "with heights…"

	para "Where's your"
	line "mother…?"
	done

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 17, OLIVINE_CITY, 8
	warp_event 10, 17, OLIVINE_CITY, 8
	warp_event  7,  2, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_ELEVATOR, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSailorScript, -1
	object_event 10, 10, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanFScript, -1
	object_event  9,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FElevatorSailorScript, EVENT_OLIVINE_LIGHTHOUSE_ELEVATOR_SAILOR
	object_event  6, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanMTwinScript, -1
	object_event  5, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanMTwinScript, -1
