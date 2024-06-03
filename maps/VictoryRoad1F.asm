	object_const_def
	const VICTORYROAD1F_BOULDER1
	const VICTORYROAD1F_BOULDER2
	const VICTORYROAD1F_ROCK1
	const VICTORYROAD1F_ROCK2
	const VICTORYROAD1F_ROCK3
	const VICTORYROAD1F_ROCK4
	const VICTORYROAD1F_POKE_BALL1
	const VICTORYROAD1F_POKE_BALL2
	const VICTORYROAD1F_POKE_BALL3

VictoryRoad1F_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoad1FSuperPotion:
	itemball SUPER_POTION

VictoryRoad1FFullHeal:
	itemball FULL_HEAL

VictoryRoad1FMaxRevive:
	itemball MAX_REVIVE

VictoryRoad1FRock:
	jumpstd SmashRockScript

VictoryRoad1FBoulder:
	jumpstd StrengthBoulderScript

VictoryRoad1FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_1F_HIDDEN_FULL_HEAL

VictoryRoad1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_1F_HIDDEN_MAX_POTION

VictoryRoad1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 33, ROUTE_23, 3
	warp_event  3,  3, VICTORY_ROAD_2F, 2
	
	def_coord_events

	def_bg_events
	bg_event  8, 21, BGEVENT_ITEM, VictoryRoad1FHiddenFullHeal
	bg_event  5, 12, BGEVENT_ITEM, VictoryRoad1FHiddenMaxPotion

	def_object_events
	object_event 16, 30, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FBoulder, -1
	object_event  6, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FBoulder, -1
	object_event 20, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FRock, -1
	object_event 23, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FRock, -1
	object_event 18, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FRock, -1
	object_event 21, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FRock, -1
	object_event  8, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad1FSuperPotion, EVENT_VICTORY_ROAD_1F_SUPER_POTION
	object_event 15, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad1FFullHeal, EVENT_VICTORY_ROAD_1F_FULL_HEAL
	object_event 19, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad1FMaxRevive, EVENT_VICTORY_ROAD_1F_MAX_REVIVE
