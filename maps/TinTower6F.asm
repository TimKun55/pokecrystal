	object_const_def
	const TINTOWER6F_POKE_BALL

TinTower6F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower6FMaxPotion:
	itemball MAX_POTION

TinTower6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, TIN_TOWER_7F, 1
	warp_event 11, 17, TIN_TOWER_5F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 10, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, TinTower6FMaxPotion, EVENT_TIN_TOWER_6F_MAX_POTION
