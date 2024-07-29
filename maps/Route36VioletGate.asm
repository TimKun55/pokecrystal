	object_const_def
	const ROUTE36VIOLETGATE_OFFICER

Route36VioletGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route36VioletGateOfficerScript:
	jumptextfaceplayer Route36VioletGateOfficerText

Route36VioletGateOfficerText:
	text "The Ruins Of Alph,"
	line "Sprout Tower,"

	para "Tin Tower and"
	line "the Burned Tower."

	para "There's so much to"
	line "see and experience"
	cont "out there!"
	done

Route36VioletGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_36, 5
	warp_event  0,  5, ROUTE_36, 6
	warp_event  9,  4, VIOLET_CITY, 11
	warp_event  9,  5, VIOLET_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36VioletGateOfficerScript, -1
