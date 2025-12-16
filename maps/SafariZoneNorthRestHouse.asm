	object_const_def
	const SAFARIZONENORTHRESTHOUSE_SCIENTIST

SafariZoneNorthRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneNorthRestHouseScientistScript:
	jumptextfaceplayer SafariZoneNorthRestHouseScientistText

SafariZoneNorthRestHouseJournalScript:
	jumptext SafariZoneNorthRestHouseJournalText

SafariZoneNorthRestHouseScientistText:
	text "I've been out"
	line "finding all the"
	cont "#mon in this"
	cont "area!"

	para "I'm sure I got"
	line "them all!"
	
	para "Check out the"
	line "shelves for my"
	cont "results!"
	done

SafariZoneNorthRestHouseJournalText:
	text "Safari Zone"
	line "North Area"
	cont "wild #mon."
	
	para "Exeggutor, Para-"
	line "sect and Venomoth"
	cont "are common."
	
	para "Nidoking, Nido-"
	line "queen and Tauros"
	cont "are uncommon."
	
	para "Blissey is rare."
	done

SafariZoneNorthRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_NORTH, 7
	warp_event  3,  7, SAFARI_ZONE_NORTH, 7

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SafariZoneNorthRestHouseJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneNorthRestHouseJournalScript

	def_object_events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthRestHouseScientistScript, -1
