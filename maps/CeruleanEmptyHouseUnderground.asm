	object_const_def

CeruleanEmptyHouseUnderground_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanEmptyHouseUnderground_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 30,  3, CERULEAN_EMPTY_HOUSE, 2
	warp_event 27,  6, CERULEAN_EMPTY_HOUSE_UNDERGROUND, 3
	warp_event 20,  5, CERULEAN_EMPTY_HOUSE_UNDERGROUND, 2
	warp_event  2,  0, CERULEAN_CAVE_1F, 1
	def_coord_events

	def_bg_events

	def_object_events

