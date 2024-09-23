	object_const_def

SeafoamIslands1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamGymSign:
	jumptext SeafoamGymSignText

SeafoamGymSignText:
	text "The relocated"
	line "Cinnabar Gym"
	cont "Please climb up."
	done	

SeafoamIslands1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  7, ROUTE_20, 1
	warp_event 14,  3, SEAFOAM_ISLANDS_B1F, 1
	warp_event  7,  3, SEAFOAM_ISLANDS_B1F, 6
	warp_event  5,  7, ROUTE_20, 2
	warp_event 17,  4, SEAFOAM_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 18, 4, BGEVENT_READ, SeafoamGymSign

	def_object_events