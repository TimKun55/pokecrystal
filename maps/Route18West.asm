	object_const_def

Route18West_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route18WestAlwaysOnBikeCallback

Route18WestAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

Route18West_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19,  8, ROUTE_18_EAST_WEST_GATE, 1
	warp_event 19,  9, ROUTE_18_EAST_WEST_GATE, 2

	def_coord_events

	def_bg_events

	def_object_events
