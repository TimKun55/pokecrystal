	object_const_def
	const SAFARIZONEEAST_COOLTRAINER_F	
	const SAFARIZONEEAST_POKE_BALL1
	const SAFARIZONEEAST_POKE_BALL2

SafariZoneEast_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneEastCooltrainer_f:
	jumptextfaceplayer SafariZoneEastCooltrainer_fText
	
SafariZoneEastCarbos:
	itemball CARBOS

SafariZoneEastFullRestore:
	itemball FULL_RESTORE
	
SafariZoneEastAreaSign:
	jumptext SafariZoneEastAreaSignText
	
SafariZoneEastRestHouseSign:
	jumptext SafariZoneEastRestHouseSignText
	
SafariZoneEastTrainerTipsSign:
	jumptext SafariZoneEastTrainerTipsSignText
	
SafariZoneEastCooltrainer_fText:
	text "Trying to find"
	line "some rare #mon"
	
	para "but I keep finding"
	line "the same 3 over"
	cont "and over!"
	done
	
SafariZoneEastAreaSignText:
	text "Safari Zone"
	line "East Area"
	done
	
SafariZoneEastRestHouseSignText:
	text "Rest House"
	done
	
SafariZoneEastTrainerTipsSignText:
	text "Trainer Tips"

	para "Search for rare"
	line "#mon but beware"
	cont "of powerful ones."
	done

SafariZoneEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 24, SAFARI_ZONE_HUB, 3
	warp_event  4, 25, SAFARI_ZONE_HUB, 4
	warp_event  4,  6, SAFARI_ZONE_NORTH, 1
	warp_event  4,  7, SAFARI_ZONE_NORTH, 2
	warp_event 29, 11, SAFARI_ZONE_EAST_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  8, 24, BGEVENT_READ, SafariZoneEastAreaSign
	bg_event 30, 12, BGEVENT_READ, SafariZoneEastRestHouseSign
	bg_event 10,  6, BGEVENT_READ, SafariZoneEastTrainerTipsSign

	def_object_events
	object_event 11, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneEastCooltrainer_f, -1
	object_event 24, 15, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastCarbos, EVENT_SAFARI_ZONE_EAST_CARBOS
	object_event  7,  3, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SafariZoneEastFullRestore, EVENT_SAFARI_ZONE_EAST_FULL_RESTORE
