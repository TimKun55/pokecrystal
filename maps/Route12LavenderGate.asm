	object_const_def
	const ROUTE12LAVENDERGATE_OFFICER

Route12LavenderGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route12LavenderGateOfficerScript:
	jumptextfaceplayer  Route12LavenderGateOfficerText

Route12LavenderGateOfficerText:
	text "Go north for the"
	line "Radio Tower, Power"
	cont "Plant, and"
	cont "Cerulean City."

	para "Go south for"
	line "Vermilion City,"
	cont "Fuchsia City and"
	cont "the Safari Zone."

	para "So much to do,"
	line "so much to see!"
	done

Route12LavenderGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, LAVENDER_TOWN, 8
	warp_event  5,  0, LAVENDER_TOWN, 9
	warp_event  4,  7, ROUTE_12, 2
	warp_event  5,  7, ROUTE_12, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route12LavenderGateOfficerScript, -1
