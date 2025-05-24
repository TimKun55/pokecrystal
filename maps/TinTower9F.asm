	object_const_def
	const TINTOWER9F_POKE_BALL

TinTower9F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower9FHPUp:
	itemball HP_UP

TinTower9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  5, TIN_TOWER_8F, 2
	warp_event  2,  7, TIN_TOWER_8F, 3
	warp_event 12,  9, TIN_TOWER_8F, 4
	warp_event  7, 11, TIN_TOWER_ROOF, 1
	warp_event 16,  9, TIN_TOWER_7F, 5
	warp_event  6, 15, TIN_TOWER_8F, 5
	warp_event  8, 15, TIN_TOWER_8F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
