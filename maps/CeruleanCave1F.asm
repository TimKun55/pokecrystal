	object_const_def

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 19, CERULEAN_EMPTY_HOUSE_UNDERGROUND, 4
	warp_event  9,  3, CERULEAN_CAVE_2F, 1
	warp_event 29,  3, CERULEAN_CAVE_2F, 2
	warp_event  3,  5, CERULEAN_CAVE_2F, 3
	warp_event  2,  8, CERULEAN_CAVE_B1F, 1
	warp_event 25,  9, CERULEAN_CAVE_2F, 4
	warp_event 20, 11, CERULEAN_CAVE_2F, 5
	warp_event  5, 13, CERULEAN_CAVE_2F, 6

	def_coord_events

	def_bg_events

	def_object_events
