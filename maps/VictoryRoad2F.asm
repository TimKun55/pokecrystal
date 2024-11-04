	object_const_def
	const VICTORYROAD2F_BOULDER1
	const VICTORYROAD2F_ROCK1
	const VICTORYROAD2F_ROCK2
	const VICTORYROAD2F_POKE_BALL1
	const VICTORYROAD2F_POKE_BALL2
	const VICTORYROAD2F_POKE_BALL3

VictoryRoad2F_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoad2FFullRestore:
	itemball FULL_RESTORE

VictoryRoad2FHPUp:
	itemball HP_UP

VictoryRoad2FRareCandy:
	itemball RARE_CANDY

VictoryRoad2FRock:
	jumpstd SmashRockScript

VictoryRoad2FBoulder:
	jumpstd StrengthBoulderScript

VictoryRoad2FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_VICTORY_ROAD_2F_HIDDEN_MAX_REVIVE

VictoryRoad2FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_VICTORY_ROAD_2F_HIDDEN_ULTRA_BALL

VictoryRoad2FHiddenPPUp:
	hiddenitem PP_UP, EVENT_VICTORY_ROAD_2F_HIDDEN_PP_UP

VictoryRoad2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, VICTORY_ROAD_3F, 1
	warp_event  5, 11, VICTORY_ROAD_1F, 2
	warp_event 39,  9, VICTORY_ROAD_3F, 2
	warp_event 19, 19, VICTORY_ROAD_3F, 3
	warp_event 29, 15, VICTORY_ROAD_3F, 4
	warp_event 10,  2, VICTORY_ROAD_3F, 5 ; HOLE (Fallen)
	warp_event 15, 12, VICTORY_ROAD_3F, 6 ; HOLE (Fallen)
	warp_event 17, 15, VICTORY_ROAD_3F, 7 ; HOLE (Fallen)
	warp_event 30, 18, VICTORY_ROAD_3F, 8 ; HOLE (Fallen)
	warp_event 39, 14, VICTORY_ROAD_3F, 9 ; HOLE (Fallen)
	
	def_coord_events

	def_bg_events
	bg_event  4,  7, BGEVENT_ITEM, VictoryRoad2FHiddenMaxRevive
	bg_event 21, 15, BGEVENT_ITEM, VictoryRoad2FHiddenUltraBall
	bg_event 36, 19, BGEVENT_ITEM, VictoryRoad2FHiddenPPUp

	def_object_events
	object_event 36, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FBoulder, -1
	object_event 15, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FRock, -1
	object_event 32, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FRock, -1
	object_event  8, 28, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FFullRestore, EVENT_VICTORY_ROAD_2F_FULL_RESTORE
	object_event 13, 16, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FHPUp, EVENT_VICTORY_ROAD_2F_HP_UP
	object_event 40, 12, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FRareCandy, EVENT_VICTORY_ROAD_2F_RARE_CANDY
