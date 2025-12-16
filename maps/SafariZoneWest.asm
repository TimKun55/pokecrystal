	object_const_def
	const SAFARIZONEWEST_GENTLEMAN
	const SAFARIZONEWEST_LASS
	const SAFARIZONEWEST_POKE_BALL1
	const SAFARIZONEWEST_POKE_BALL2
	const SAFARIZONEWEST_POKE_BALL3

SafariZoneWest_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneWestGentlemanScript:
	jumptextfaceplayer SafariZoneWestGentlemanText
	
SafariZoneWestLassScript:
	jumptextfaceplayer SafariZoneWestLassText
	
SafariZoneWestAreaSign:
	jumptext SafariZoneWestAreaSignText
	
SafariZoneWestRestHouseSign:
	jumptext SafariZoneWestRestHouseSignText
	
SafariZoneWestTrainerTips1Sign:
	jumptext SafariZoneWestTrainerTips1SignText

SafariZoneWestTrainerTips2Sign:
	jumptext SafariZoneWestTrainerTips2SignText
	
SafariZoneWestMaxRevive:
	itemball MAX_REVIVE

SafariZoneWestPPUp:
	itemball PP_UP
	
SafariZoneWestTMBodySlam:
	itemball TM_BODY_SLAM

SafariZoneWestGentlemanText:
	text "I love this place!"
	line "So many rare"
	cont "#mon to find!"
	done
	
SafariZoneWestLassText:
	text "I've been here"
	line "so many times"
	cont "but I still can't"
	cont "seem to catch"
	cont "a Tauros!"
	done

SafariZoneWestAreaSignText:
	text "Safari Zone"
	line "West Area"
	done

SafariZoneWestRestHouseSignText:
	text "West Area"
	line "Rest House"
	done

SafariZoneWestTrainerTips1SignText:
	text "Trainer Tips"

	para "Fire-type #mon"
	line "cannot be burnt,"
	cont "and ice-type #-"
	cont "mon can't have"
	cont "frostbite."
	done

SafariZoneWestTrainerTips2SignText:
	text "Trainer Tips"

	para "In a Sandstorm,"
	line "rock-type #mon"
	cont "get a boost to"
	cont "their Sp.Def and"
	cont "in Hail, ice-type"
	cont "#mon get a"
	cont "Def boost."
	done

SafariZoneWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 22,  4, SAFARI_ZONE_NORTH, 8
	warp_event 23,  4, SAFARI_ZONE_NORTH, 9
	warp_event 28,  4, SAFARI_ZONE_NORTH, 3
	warp_event 29,  4, SAFARI_ZONE_NORTH, 4
	warp_event 31, 26, SAFARI_ZONE_HUB, 5
	warp_event 31, 27, SAFARI_ZONE_HUB, 6
	warp_event 13, 16, SAFARI_ZONE_WEST_REST_HOUSE_1, 1
	warp_event  5,  8, SAFARI_ZONE_WEST_REST_HOUSE_2, 1

	def_coord_events

	def_bg_events
	bg_event 26, 26, BGEVENT_READ, SafariZoneWestAreaSign
	bg_event 14, 17, BGEVENT_READ, SafariZoneWestRestHouseSign
	bg_event 28,  8, BGEVENT_READ, SafariZoneWestTrainerTips1Sign
	bg_event 19,  7, BGEVENT_READ, SafariZoneWestTrainerTips2Sign

	def_object_events
	object_event 22, 25, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestGentlemanScript, -1
	object_event 23, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestLassScript, -1
	object_event  7, 10, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestMaxRevive, EVENT_SAFARI_ZONE_WEST_MAX_REVIVE
	object_event 27, 20, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestPPUp, EVENT_SAFARI_ZONE_WEST_PP_UP
	object_event 15, 19, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, SafariZoneWestTMBodySlam, EVENT_SAFARI_ZONE_WEST_TM_BODY_SLAM
