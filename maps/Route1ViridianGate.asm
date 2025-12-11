	object_const_def
	const ROUTE1VIRIDIANGATE_OFFICER

Route1ViridianGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route1ViridianGuardScript:
	jumptextfaceplayer Route1ViridianGuardText

Route1ViridianGuardText:
	text "Welcome to"
	line "Viridian City."

	para "Head north for"
	line "Pewter City via"
	cont "Viridian Forest."

	para "Head south for"
	line "Pallet Town."

	para "Head west for the"
	line "#mon League,"
	cont "Mt.Silver and"
	cont "Johto."
	done

Route1ViridianGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, VIRIDIAN_CITY, 6
	warp_event  4,  0, VIRIDIAN_CITY, 7
	warp_event  3,  7, ROUTE_1, 1
	warp_event  4,  7, ROUTE_1, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1ViridianGuardScript, -1
