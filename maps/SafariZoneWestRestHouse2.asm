	object_const_def
	const SAFARIZONEWESTRESTHOUSE2_FISHER

SafariZoneWestRestHouse2_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneWestRestHouse2Fisher:
	jumptextfaceplayer SafariZoneWestRestHouse2FisherText
	
SafariZoneWestRestHouse2PokemonJournalScript:
	jumpstd DifficultBookshelfScript
	
SafariZoneWestRestHouse2FisherText:
	text "Hi there!"
	line "As a reward for"
	cont "reaching this"
	cont "Rest House, have"
	cont "this HM as a"
	cont "reward!"

	para "… … …"
	
	para "Wait, you've"
	line "already got one?"
	
	para "Ah, I'm sorry"
	line "I can't give"
	cont "you anything!"
	done
	
SafariZoneWestRestHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 8
	warp_event  3,  7, SAFARI_ZONE_WEST, 8

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariZoneWestRestHouse2PokemonJournalScript
	bg_event  5,  1, BGEVENT_READ, SafariZoneWestRestHouse2PokemonJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariZoneWestRestHouse2PokemonJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneWestRestHouse2PokemonJournalScript

	def_object_events
	object_event  3,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouse2Fisher, -1
	