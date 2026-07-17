	object_const_def
	const TINTOWER9F_POKE_BALL

TinTower9F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower9FHPUp:
	itemball HP_UP

TinTower9F_MapEvents:

	def_warp_events
	warp_event 10,  3, TIN_TOWER_8F, 2
	warp_event  0,  5, TIN_TOWER_8F, 3
	warp_event 10,  7, TIN_TOWER_8F, 4
	warp_event  5,  9, TIN_TOWER_ROOF, 1
	warp_event 14,  7, TIN_TOWER_7F, 5
	warp_event  4, 13, TIN_TOWER_8F, 5
	warp_event  6, 13, TIN_TOWER_8F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  1, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
