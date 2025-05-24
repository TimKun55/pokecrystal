	object_const_def
	const TINTOWER3F_POKE_BALL

TinTower3F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower3FFullHeal:
	itemball FULL_HEAL

TinTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 16, TIN_TOWER_2F, 1
	warp_event 16,  4, TIN_TOWER_4F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 16, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, TinTower3FFullHeal, EVENT_TIN_TOWER_3F_FULL_HEAL
