	object_const_def

BattleTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

BattleTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, BATTLE_TOWER_1F, 4
	warp_event 20,  1, BATTLE_TOWER_1F, 5

	def_coord_events

	def_bg_events

	def_object_events
