SafariZoneEastRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariZoneEastPokemonJournalScript:
	jumpstd DifficultBookshelfScript

SafariZoneEastRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_EAST, 5
	warp_event  3,  7, SAFARI_ZONE_EAST, 5

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariZoneEastPokemonJournalScript
	bg_event  5,  1, BGEVENT_READ, SafariZoneEastPokemonJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariZoneEastPokemonJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariZoneEastPokemonJournalScript

	def_object_events
