Route28_MapScripts:
	def_scene_scripts

	def_callbacks

Route28Sign:
	jumptext Route28SignText

Route28HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_28_HIDDEN_RARE_CANDY

Route28SignText:
	text "ROUTE 28"
	done

Route28_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  5, ROUTE_28_STEEL_WING_HOUSE, 1
	warp_event 35,  6, VICTORY_ROAD_GATE, 7
	warp_event 35,  7, VICTORY_ROAD_GATE, 7

	def_coord_events

	def_bg_events
	bg_event 30,  6, BGEVENT_READ, Route28Sign
	bg_event 29,  3, BGEVENT_ITEM, Route28HiddenRareCandy

	def_object_events
