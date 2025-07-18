	object_const_def
	const ROUTE2GATE_SCIENTIST

Route2Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2GateScientistScript:
	jumptextfaceplayer Route2GateScientistText

Route2GateScientistText:
	text "Are you <PLAY_G>?"

	para "I work as Prof."
	line "Oak's Aide."

	para "I had no idea that"
	line "you were out here."

	para "Prof.Oak's Lab is"
	line "nearby in Pallet"
	cont "Town."
	done

Route2Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_2, 4
	warp_event  5,  0, ROUTE_2, 5
	warp_event  4,  7, ROUTE_2, 2
	warp_event  5,  7, ROUTE_2, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2GateScientistScript, -1
