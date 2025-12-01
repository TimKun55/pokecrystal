	object_const_def
	const UNDERGROUNDPATH_POKE_BALL

UndergroundPath_MapScripts:
	def_scene_scripts

	def_callbacks

UndergroundPathTMCalmMind:
	itemball TM_CALM_MIND

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpAtk:
	hiddenitem X_SP_ATK, EVENT_UNDERGROUND_PATH_HIDDEN_X_SP_ATK

UndergroundPath_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  3, 24, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  3,  9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event  1, 19, BGEVENT_ITEM, UndergroundPathHiddenXSpAtk

	def_object_events
	object_event  4, 13, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, UndergroundPathTMCalmMind, EVENT_UNDERGROUND_PATH_TM_CALM_MIND