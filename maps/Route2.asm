	object_const_def
	const ROUTE2_POKE_BALL1
	const ROUTE2_FRUIT_TREE

Route2_MapScripts:
	def_scene_scripts

	def_callbacks


Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2Elixer:
	itemball ELIXER
	

Route2FruitTree:
	fruittree FRUITTREE_ROUTE_2

Route2SignText:
	text "ROUTE 2"

	para "Viridian City -"
	line "Pewter City"
	done

Route2DiglettsCaveSignText:
	text "Diglett's Cave"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 14, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 15, 31, ROUTE_2_GATE, 3
	warp_event 15, 27, ROUTE_2_GATE, 1
	warp_event 16, 27, ROUTE_2_GATE, 2
	warp_event 12,  7, DIGLETTS_CAVE, 3
	warp_event  3, 33, ROUTE_2_VIRIDIAN_FOREST_GATE, 1
	warp_event  1,  9, VIRIDIAN_FOREST_ROUTE_2_GATE, 3
	warp_event  2,  9, VIRIDIAN_FOREST_ROUTE_2_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 10, 48, BGEVENT_READ, Route2Sign
	bg_event 11,  9, BGEVENT_READ, Route2DiglettsCaveSign

	def_object_events
	object_event 14, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event 13, 36, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree, -1
