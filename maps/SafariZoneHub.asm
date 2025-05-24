	object_const_def
	const SAFARIZONEHUB_POKE_BALL1
	const SAFARIZONEHUB_POKE_BALL2

SafariZoneHub_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneHubNuggetScript:
	itemball NUGGET

SafariZoneHubUltraBallScript:
	itemball ULTRA_BALL
	
SafariZoneHubAreaSign:
	jumptext SafariZoneHubAreaSignText
	
SafariZoneHubRestHouseSign:
	jumptext SafariZoneHubRestHouseSignText
	
SafariZoneHubAreaSignText:
	text "Safari Zone"
	line "Center Area"
	done

SafariZoneHubRestHouseSignText:
	text "Rest House"
	done

SafariZoneHub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 29, SAFARI_ZONE_FUCHSIA_GATE, 1
	warp_event 19, 29, SAFARI_ZONE_FUCHSIA_GATE, 2
	warp_event 33, 14, SAFARI_ZONE_EAST, 1
	warp_event 33, 15, SAFARI_ZONE_EAST, 2
	warp_event  4, 14, SAFARI_ZONE_WEST, 5
	warp_event  4, 15, SAFARI_ZONE_WEST, 6
	warp_event 18,  4, SAFARI_ZONE_NORTH, 5
	warp_event 19,  4, SAFARI_ZONE_NORTH, 6
	warp_event 21, 23, SAFARI_ZONE_HUB_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 18, 26, BGEVENT_READ, SafariZoneHubAreaSign
	bg_event 22, 24, BGEVENT_READ, SafariZoneHubRestHouseSign

	def_object_events
	object_event 17, 14, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SafariZoneHubNuggetScript, EVENT_SAFARI_ZONE_HUB_NUGGET
	object_event 10, 23, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SafariZoneHubUltraBallScript, EVENT_SAFARI_ZONE_HUB_ULTRA_BALL
