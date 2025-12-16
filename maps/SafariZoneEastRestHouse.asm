	object_const_def
	const SAFARIZONEEASTRESTHOUSE_SCIENTIST

SafariZoneEastRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneEastRestHouseScientistScript:
	jumptextfaceplayer SafariZoneEastRestHouseScientistText

SafariZoneEastRestHouseJournalScript:
	jumptext SafariZoneEastRestHouseJournalText

SafariZoneEastRestHouseScientistText:
	text "Whew!"

	para "I'm exhausted from"
	line "all the work I've"
	cont "been doing!"
	
	para "You can check out"
	line "my work on the"
	cont "shelves over there"
	cont "if you want."
	done

SafariZoneEastRestHouseJournalText:
	text "Safari Zone"
	line "East Area"
	cont "wild #mon."
	
	para "Exeggutor, Dodrio"
	line "and Parasect;"
	cont "common."
	
	para "Kangaskhan, Scy-"
	line "ther and Pinsir;"
	cont "uncommon."
	
	para "Blissey; rare but"
	line "unconfirmed."
	done

SafariZoneEastRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_EAST, 5
	warp_event  3,  7, SAFARI_ZONE_EAST, 5

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SafariZoneEastRestHouseJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneEastRestHouseJournalScript

	def_object_events
	object_event  5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneEastRestHouseScientistScript, -1