SafariZoneHubRestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	
SafariPokemonJournalScript:
	jumpstd DifficultBookshelfScript
	
SafariZoneHubRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_HUB, 9
	warp_event  3,  7, SAFARI_ZONE_HUB, 9

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariPokemonJournalScript
	bg_event  5,  1, BGEVENT_READ, SafariPokemonJournalScript
	bg_event  6,  1, BGEVENT_READ, SafariPokemonJournalScript
	bg_event  7,  1, BGEVENT_READ, SafariPokemonJournalScript

	def_object_events
	