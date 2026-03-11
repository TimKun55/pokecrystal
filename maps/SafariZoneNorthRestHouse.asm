	object_const_def
	const SAFARIZONENORTHRESTHOUSE_SCIENTIST
	const SAFARIZONENORTHRESTHOUSE_GENTLEMAN
	const SAFARIZONENORTHRESTHOUSE_FISHING_GURU
	const SAFARIZONENORTHRESTHOUSE_FISHER

SafariZoneNorthRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneNorthRestHouseScientistScript:
	jumptextfaceplayer SafariZoneNorthRestHouseScientistText

SafariZoneNorthRestHouseGentlemanScript:
	jumptextfaceplayer SafariZoneNorthRestHouseGentlemanText

SafariZoneNorthRestHouseFishingGuruScript:
	jumptextfaceplayer SafariZoneNorthRestHouseFishingGuruText

SafariZoneNorthRestHouseFisherScript:
	jumptextfaceplayer SafariZoneNorthRestHouseFisherText

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

SafariZoneNorthRestHouseGentlemanText:
	text "My Eevee evolved"
	line "into Espeon."
	
	para "But, a friend's"
	line "Eevee turned into"
	cont "a Sylveon."
	
	para "I wonder why?"
	done

SafariZoneNorthRestHouseFishingGuruText:
	text "Go to the deepest"
	line "part of the Safari"
	cont "Zone."
	
	para "You will win"
	line "a prize!"
	done

SafariZoneNorthRestHouseFisherText:
	text "The Safari Zone"
	line "is huge, wouldn't"
	cont "you say?"
	
	para "Fuchsia's Gym"
	line "Leader patrols"
	cont "the grounds every"
	cont "so often."

	para "Thanks to her,"
	line "we can explore"
	cont "here knowing that"
	cont "we're safe."
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
	bg_event  0,  1, BGEVENT_READ, SafariZoneNorthRestHouseJournalScript
	bg_event  1,  1, BGEVENT_READ, SafariZoneNorthRestHouseJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariZoneNorthRestHouseJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneNorthRestHouseJournalScript

	def_object_events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthRestHouseScientistScript, -1
	object_event  5,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthRestHouseGentlemanScript, -1
	object_event  3,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthRestHouseFishingGuruScript, -1
	object_event  0,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthRestHouseFisherScript, -1
