	object_const_def
	const SAFARIZONEHUBRESTHOUSE_SCIENTIST

SafariZoneHubRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneHubRestHouseScientistScript:
	jumptextfaceplayer SafariZoneHubRestHouseScientistText

SafariZoneHubRestHouseJournalScript:
	jumptext SafariZoneHubRestHouseJournalText

SafariZoneHubRestHouseScientistText:
	text "I'm out here doing"
	line "research on the"
	cont "wild #mon here."
	
	para "Check out my notes"
	line "on the shelves"
	cont "over there!"
	done

SafariZoneHubRestHouseJournalText:
	text "Safari Zone"
	line "Central Area"
	cont "wild #mon."
	
	para "Exeggutor, Nido-"
	line "queen and Nidoking"
	cont "are common."
	
	para "Rhydon, Scyther"
	line "and Pinsir seem to"
	cont "be uncommon."
	
	para "There have been"
	line "Blissey sightings"
	cont "but can't confirm."
	done

SafariZoneHubRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_HUB, 9
	warp_event  3,  7, SAFARI_ZONE_HUB, 9

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SafariZoneHubRestHouseJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneHubRestHouseJournalScript

	def_object_events
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneHubRestHouseScientistScript, -1
