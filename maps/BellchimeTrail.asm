	object_const_def

BellchimeTrail_MapScripts:
	def_scene_scripts

	def_callbacks

TinTowerSign:
	jumptext TinTowerSignText

TinTowerSignText:
	text "Tin Tower"

	para "A legendary #-"
	line "mon is said to"
	cont "roost here."
	done

BellchimeTrail_MapEvents:

	def_warp_events
	warp_event  4,  4, WISE_TRIOS_ROOM, 1
	warp_event  4,  5, WISE_TRIOS_ROOM, 2
	warp_event 19, 13, TIN_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 21, 14, BGEVENT_READ, TinTowerSign

	def_object_events
