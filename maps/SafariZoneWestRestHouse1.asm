	object_const_def
	const SAFARIZONEWESTRESTHOUSE_SCIENTIST
	const SAFARIZONEWESTRESTHOUSE_TEACHER
	const SAFARIZONEWESTRESTHOUSE_ROCKER

SafariZoneWestRestHouse1_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneWestRestHouseScientistScript:
	jumptextfaceplayer SafariZoneWestRestHouseScientistText

SafariZoneWestRestHouseTeacherScript:
	jumptextfaceplayer SafariZoneWestRestHouseTeacherText

SafariZoneWestRestHouseRockerScript:
	jumptextfaceplayer SafariZoneWestRestHouseRockerText

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

SafariZoneWestRestHouseTeacherText:
	text "I hiked a lot, but"
	line "didn't see any"
	cont "#mon I wanted."
	done

SafariZoneWestRestHouseRockerText:
	text "I caught so many"
	line "#mon today!"
	
	para "I'm pooped!"
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
	bg_event  0,  1, BGEVENT_READ, SafariZoneWestRestHouseJournalScript
	bg_event  1,  1, BGEVENT_READ, SafariZoneWestRestHouseJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariZoneWestRestHouseJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneWestRestHouseJournalScript

	def_object_events
	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseScientistScript, -1
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseTeacherScript, -1
	object_event  4,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouseRockerScript, -1
