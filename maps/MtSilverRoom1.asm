	object_const_def
	const MTSILVERROOM1_POKE_BALL1
	const MTSILVERROOM1_POKE_BALL2
	const MTSILVERROOM1_POKE_BALL3
	const MTSILVERROOM1_POKE_BALL4

MtSilverRoom1_MapScripts:
	def_scene_scripts

	def_callbacks

MtSilverRoom1MaxElixer:
	itemball MAX_ELIXER

MtSilverRoom1Protein:
	itemball PROTEIN

MtSilverRoom1EscapeRope:
	itemball ESCAPE_ROPE

MtSilverRoom1UltraBall:
	itemball ULTRA_BALL

MtSilverRoom1HiddenDireHit:
	hiddenitem DIRE_HIT, EVENT_MT_SILVER_ROOM_1_HIDDEN_DIRE_HIT

MtSilverRoom1HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_MT_SILVER_ROOM_1_HIDDEN_ULTRA_BALL

MtSilverRoom1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, MT_SILVER_OUTSIDE, 2
	warp_event 15,  1, MT_SILVER_ROOM_2, 1

	def_coord_events

	def_bg_events
	bg_event 16, 23, BGEVENT_ITEM, MtSilverRoom1HiddenDireHit
	bg_event 17, 12, BGEVENT_ITEM, MtSilverRoom1HiddenUltraBall

	def_object_events
	object_event  4,  9, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom1MaxElixer, EVENT_MT_SILVER_ROOM_1_MAX_ELIXER
	object_event 15, 29, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom1Protein, EVENT_MT_SILVER_ROOM_1_PROTEIN
	object_event  5, 30, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom1EscapeRope, EVENT_MT_SILVER_ROOM_1_ESCAPE_ROPE
	object_event  7, 18, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverRoom1UltraBall, EVENT_MT_SILVER_ROOM_1_ULTRA_BALL
