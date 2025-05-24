	object_const_def
	const SEAFOAMISLANDSB3F_POKE_BALL1
	const SEAFOAMISLANDSB3F_POKE_BALL2

SeafoamIslandsB3F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB3FRevive:
	itemball REVIVE

SeafoamIslandsB3FBigPearl:
	itemball BIG_PEARL

SeafoamIslandsB3FBoulder:
	jumpstd StrengthBoulderScript

SeafoamIslandsB3FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_SEAFOAM_ISLANDS_B3F_HIDDEN_MAX_REVIVE

SeafoamIslandsB3FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_SEAFOAM_ISLANDS_B3F_HIDDEN_RARE_CANDY

SeafoamIslandsB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31,  9, SEAFOAM_ISLANDS_B2F, 5
	warp_event 15,  9, SEAFOAM_ISLANDS_B2F, 6
	warp_event 31, 15, SEAFOAM_ISLANDS_B2F, 7
	warp_event  3, 15, SEAFOAM_ISLANDS_B2F, 8
	warp_event  3,  3, SEAFOAM_ISLANDS_B4F, 1
	warp_event 23,  3, SEAFOAM_ISLANDS_B4F, 2
	warp_event 17,  7, SEAFOAM_ISLANDS_B4F, 3
	warp_event  7, 11, SEAFOAM_ISLANDS_B4F, 4
	warp_event 29, 13, SEAFOAM_ISLANDS_B4F, 5
	warp_event 23, 15, SEAFOAM_ISLANDS_B4F, 6

	def_coord_events

	def_bg_events
	bg_event 27, 11, BGEVENT_ITEM, SeafoamIslandsB3FHiddenMaxRevive
	bg_event  2,  7, BGEVENT_ITEM, SeafoamIslandsB3FHiddenRareCandy

	def_object_events
	object_event 14, 16, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB3FRevive, EVENT_SEAFOAM_ISLANDS_B3F_REVIVE
	object_event 12,  7, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB3FBigPearl, EVENT_SEAFOAM_ISLANDS_B3F_BIG_PEARL
	object_event 21,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB3FBoulder, -1
	