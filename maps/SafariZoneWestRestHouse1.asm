SafariZoneWestRestHouse1_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneWestRestHouse1PokemonJournalScript:
	jumpstd DifficultBookshelfScript
	
SafariZoneWestRestHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 7
	warp_event  3,  7, SAFARI_ZONE_WEST, 7

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariZoneWestRestHouse1PokemonJournalScript
	bg_event  5,  1, BGEVENT_READ, SafariZoneWestRestHouse1PokemonJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariZoneWestRestHouse1PokemonJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneWestRestHouse1PokemonJournalScript

	def_object_events
