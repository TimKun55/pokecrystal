	object_const_def

CinnabarVolcano2F_MapScripts:
	def_scene_scripts

	def_callbacks
	
CinnabarVolcano2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, CINNABAR_VOLCANO_1F, 2
	warp_event  7,  5, CINNABAR_VOLCANO_2F, 5
	warp_event 31, 25, CINNABAR_VOLCANO_2F, 4
	warp_event  5, 25, CINNABAR_VOLCANO_2F, 3
	warp_event 19,  5, CINNABAR_VOLCANO_2F, 2
	warp_event 31,  5, CINNABAR_MOLTRES_NEST, 1

	def_coord_events

	def_bg_events

	def_object_events
	