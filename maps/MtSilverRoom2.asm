	object_const_def
	const MTSILVERROOM2_POKE_BALL1
	const MTSILVERROOM2_POKE_BALL2
	const MTSILVERROOM2_POKE_BALL3

MtSilverRoom2_MapScripts:
	def_scene_scripts

	def_callbacks

MtSilverRoom2Calcium:
	itemball CALCIUM

MtSilverRoom2UltraBall:
	itemball ULTRA_BALL

MtSilverRoom2PPUp:
	itemball PP_UP

MtSilverRoom2HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_MT_SILVER_ROOM_2_HIDDEN_MAX_POTION

MtSilverRoom2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 31, MT_SILVER_ROOM_1, 2
	warp_event 23,  3, MT_SILVER_ROOM_3, 1
	warp_event 13, 21, MT_SILVER_ITEM_ROOMS, 1
	warp_event 11,  5, MT_SILVER_ITEM_ROOMS, 2

	def_coord_events

	def_bg_events
	bg_event 14, 31, BGEVENT_ITEM, MtSilverRoom2HiddenMaxPotion

	def_object_events
	object_event 24, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom2Calcium, EVENT_MT_SILVER_ROOM_2_CALCIUM
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom2UltraBall, EVENT_MT_SILVER_ROOM_2_ULTRA_BALL
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom2PPUp, EVENT_MT_SILVER_ROOM_2_PP_UP
