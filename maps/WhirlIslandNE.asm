	object_const_def
	const WHIRLISLANDNE_POKE_BALL

WhirlIslandNE_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

WhirlIslandNE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 13, ROUTE_41, 2
	warp_event 17,  3, WHIRL_ISLAND_B1F, 2
	warp_event 13, 11, WHIRL_ISLAND_B1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 11, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
