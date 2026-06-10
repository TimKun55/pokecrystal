	object_const_def
	const TINTOWER5F_POKE_BALL

TinTower5F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower5FRareCandy:
	itemball RARE_CANDY

TinTower5FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE

TinTower5FHiddenCarbos:
	hiddenitem CARBOS, EVENT_TIN_TOWER_5F_HIDDEN_CARBOS

TinTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 17, TIN_TOWER_6F, 2
	warp_event  0,  6, TIN_TOWER_4F, 1
	warp_event  0, 16, TIN_TOWER_4F, 3
	warp_event 15, 17, TIN_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event 14, 16, BGEVENT_ITEM, TinTower5FHiddenFullRestore
	bg_event  1, 17, BGEVENT_ITEM, TinTower5FHiddenCarbos

	def_object_events
	object_event  7, 11, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower5FRareCandy, EVENT_TIN_TOWER_5F_RARE_CANDY
