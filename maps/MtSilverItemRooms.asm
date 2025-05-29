	object_const_def
	const MTSILVERITEMROOMS_POKE_BALL1
	const MTSILVERITEMROOMS_POKE_BALL2

MtSilverItemRooms_MapScripts:
	def_scene_scripts

	def_callbacks

MtSilverItemRoomsMaxRevive:
	itemball MAX_REVIVE

MtSilverItemRoomsFullRestore:
	itemball FULL_RESTORE

MtSilverItemRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, MT_SILVER_ROOM_2, 3
	warp_event  7, 15, MT_SILVER_ROOM_2, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  3, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverItemRoomsMaxRevive, EVENT_MT_SILVER_ITEM_ROOMS_MAX_REVIVE
	object_event 15, 11, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverItemRoomsFullRestore, EVENT_MT_SILVER_ITEM_ROOMS_FULL_RESTORE
