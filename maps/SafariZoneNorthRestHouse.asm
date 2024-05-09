SafariZoneNorthRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneNorthPokemonJournalScript:
	jumpstd DifficultBookshelfScript

SafariZoneNorthRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_NORTH, 7
	warp_event  3,  7, SAFARI_ZONE_NORTH, 7

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariZoneNorthPokemonJournalScript
	bg_event  5,  1, BGEVENT_READ, SafariZoneNorthPokemonJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariZoneNorthPokemonJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneNorthPokemonJournalScript

	def_object_events
