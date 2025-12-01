	object_const_def
	const WHIRLISLANDSE_POKE_BALL

WhirlIslandSE_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlIslandSETMScald:
	itemball TM_SCALD

WhirlIslandSE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 13, ROUTE_41, 4
	warp_event  7,  5, WHIRL_ISLAND_B1F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 2, 3, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSETMScald, EVENT_WHIRL_ISLAND_SE_TM_SCALD
