	object_const_def

RuinsOfAlphCaveEntrance_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphCaveEntranceHiddenDoorCallback

RuinsOfAlphCaveEntranceHiddenDoorCallback:
	checkevent EVENT_WALL_OPENED_IN_INNER_CHAMBER
	iftrue .WallOpened
	endcallback
	
.WallOpened:
	changeblock 3, 0, $3e ; opened wall
	endcallback

RuinsOfAlphCaveEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 5, 9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event 6, 9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event 5, 4, RUINS_OF_ALPH_INNER_CHAMBER, 1

	def_coord_events

	def_bg_events

	def_object_events
