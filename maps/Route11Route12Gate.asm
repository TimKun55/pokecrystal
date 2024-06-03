	object_const_def
	const ROUTE11ROUTE12GATE_OFFICER

Route11Route12Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route11Route12GateOfficerScript:
	jumptextfaceplayer Route11Route12GateOfficerText

Route11Route12GateOfficerText:
	text "DIGLETT'S CAVE is"
	line "a super convenient"
	cont "shortcut between"

	para "VERMILLION CITY"
	line "and PEWTER CITY."
	done

Route11Route12Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_11, 2
	warp_event  0,  5, ROUTE_11, 3
	warp_event  9,  4, ROUTE_12, 3
	warp_event  9,  5, ROUTE_12, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11Route12GateOfficerScript, -1
