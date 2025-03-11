Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#mon League"

	para "Victory Road"
	line "Entrance"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  4, POKEMON_LEAGUE_GATE, 1
	warp_event  4,  5, POKEMON_LEAGUE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
