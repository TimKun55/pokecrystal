Route7UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathEntranceSign:
	jumptext Route7UndergroundPathEntranceSignText

Route7UndergroundPathEntranceSignText:
	text "Closed."
	done

Route7UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_7, 3
	warp_event  4,  7, ROUTE_7, 4
	warp_event  0,  6, ROCKET_UNDERGROUND_TUNNEL, 2

	def_coord_events

	def_bg_events
	bg_event  3,  5, BGEVENT_READ, Route7UndergroundPathEntranceSign
	bg_event  4,  5, BGEVENT_READ, Route7UndergroundPathEntranceSign

	def_object_events
