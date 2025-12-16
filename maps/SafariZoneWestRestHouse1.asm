	object_const_def
	const SAFARIZONEWESTRESTHOUSE_SCIENTIST

SafariZoneWestRestHouse1_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneWestRestHouseScientistScript:
	jumptextfaceplayer SafariZoneWestRestHouseScientistText

SafariZoneWestRestHouseJournalScript:
	jumptext SafariZoneWestRestHouseJournalText

SafariZoneWestRestHouseScientistText:
	text "Sigh…"
	
	para "I got roped into"
	line "doing this field"
	cont "work."

	para "I just wanna go"
	line "home…"
	
	para "My results are on"
	line "the shelves if you"
	cont "wanna see them…"
	done

SafariZoneWestRestHouseJournalText:
	text "Safari Zone"
	line "West Area"
	cont "wild #mon."
	
	para "Lots of Exeggutor,"
	line "Dodrio and"
	cont "Venomoth."
	
	para "Some Nidoking"
	line "and Nidoqueen."
	
	para "A few Tauros and"
	line "Kangaskhan."
	done
	
SafariZoneWestRestHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 7
	warp_event  3,  7, SAFARI_ZONE_WEST, 7

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SafariZoneWestRestHouseJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneWestRestHouseJournalScript

	def_object_events
	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseScientistScript, -1
