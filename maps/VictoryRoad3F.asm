	object_const_def
	const VICTORYROAD3F_RIVAL
	const VICTORYROAD3F_ROCK1
	const VICTORYROAD3F_ROCK2
	const VICTORYROAD3F_ROCK3
	const VICTORYROAD3F_ROCK4
	const VICTORYROAD3F_ROCK5
	const VICTORYROAD3F_ROCK6
	const VICTORYROAD3F_POKE_BALL1
	const VICTORYROAD3F_POKE_BALL2
	const VICTORYROAD3F_POKE_BALL3

VictoryRoad3F_MapScripts:
	def_scene_scripts
	scene_script VictoryRoad3FNoop1Scene, SCENE_VICTORYROAD_3F_RIVAL_BATTLE
	scene_script VictoryRoad3FNoop2Scene, SCENE_VICTORYROAD_3F_NOOP

	def_callbacks

VictoryRoad3FNoop1Scene:
VictoryRoad3FNoop2Scene:
	end

VictoryRoad3FRivalLeft:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD3F_RIVAL
	applymovement VICTORYROAD3F_RIVAL, VictoryRoad3FRivalBattleApproachMovement1
	scall VictoryRoad3FRivalNext
	applymovement VICTORYROAD3F_RIVAL, VictoryRoad3FRivalBattleExitMovement1
	disappear VICTORYROAD3F_RIVAL
	setscene SCENE_VICTORYROAD_3F_NOOP
	playmapmusic
	end

VictoryRoad3FRivalRight:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD3F_RIVAL
	applymovement VICTORYROAD3F_RIVAL, VictoryRoad3FRivalBattleApproachMovement2
	scall VictoryRoad3FRivalNext
	applymovement VICTORYROAD3F_RIVAL, VictoryRoad3FRivalBattleExitMovement2
	disappear VICTORYROAD3F_RIVAL
	setscene SCENE_VICTORYROAD_3F_NOOP
	playmapmusic
	end

VictoryRoad3FRivalNext:
	turnobject PLAYER, DOWN
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VictoryRoadRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD3F_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD3F_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD3F_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetextend VictoryRoadRivalAfterText

VictoryRoad3FUltraBall:
	itemball ULTRA_BALL

VictoryRoad3FBigNugget:
	itemball BIG_NUGGET

VictoryRoad3FTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoad3FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VICTORY_ROAD_3F_HYPER_POTION

VictoryRoad3FHiddenZinc:
	hiddenitem ZINC, EVENT_VICTORY_ROAD_3F_ZINC

VictoryRoad3FRock:
	jumpstd SmashRockScript

VictoryRoad3FRivalBattleApproachMovement1:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

VictoryRoad3FRivalBattleApproachMovement2:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

VictoryRoad3FRivalBattleExitMovement1:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

VictoryRoad3FRivalBattleExitMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

VictoryRoadRivalBeforeText:
	text "Hold it."

	para "…Are you going to"
	line "challenge the"
	cont "#mon League?"

	para "Victory Road is at"
	line "its end, for sure."

	para "But did you"
	line "notice…?"

	para "You didn't see any"
	line "real trainers on"
	cont "the way, did you?"

	para "Man, they were"
	line "all spineless!"

	para "Well, the fact"
	line "that you have"
	cont "come this far"
	cont "means you're not"
	cont "one of them."

	para "But!"

	para "Your journey"
	line "ends here!"

	para "Because…"

	para "right here,"
	line "right now…"

	para "I will crush you!"
	done

VictoryRoadRivalDefeatText:
	text "…I couldn't win…"

	para "I gave it every-"
	line "thing I had…"

	para "What you possess,"
	line "and what I lack…"

	para "I'm beginning to"
	line "understand what"
	cont "that dragon master"
	cont "said to me…"
	done

VictoryRoadRivalAfterText:
	text "…… …… ……"

	para "I haven't given up"
	line "on becoming the"
	cont "greatest trainer…"

	para "I'm going to find"
	line "out why I can't"
	cont "win and become"
	cont "stronger…"

	para "When I do, I will"
	line "challenge you."

	para "And I'll beat you"
	line "down with all my"
	cont "power."

	para "…Humph! You keep"
	line "at it until then."
	done

VictoryRoadRivalVictoryText:
	text "…Humph!"

	para "When it comes down"
	line "to it, nothing can"
	cont "beat power."

	para "I don't need any-"
	line "thing else."
	done

VictoryRoad3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  9, VICTORY_ROAD_2F,  1
	warp_event 37, 11, VICTORY_ROAD_2F,  3
	warp_event 17, 21, VICTORY_ROAD_2F,  4
	warp_event 35, 19, VICTORY_ROAD_2F,  5
	warp_event 10,  5, VICTORY_ROAD_2F,  6 ; HOLE
	warp_event 18, 17, VICTORY_ROAD_2F,  7 ; HOLE
	warp_event 20, 21, VICTORY_ROAD_2F,  8 ; HOLE
	warp_event 38, 19, VICTORY_ROAD_2F,  9 ; HOLE
	warp_event 38, 13, VICTORY_ROAD_2F, 10 ; HOLE
	warp_event 25,  3, ROUTE_23, 4
	
	def_coord_events
	coord_event 25,  7, SCENE_VICTORYROAD_3F_RIVAL_BATTLE, VictoryRoad3FRivalLeft
	coord_event 26,  7, SCENE_VICTORYROAD_3F_RIVAL_BATTLE, VictoryRoad3FRivalRight

	def_bg_events
	bg_event 20, 16, BGEVENT_ITEM, VictoryRoad3FHiddenHyperPotion
	bg_event 19,  9, BGEVENT_ITEM, VictoryRoad3FHiddenZinc

	def_object_events
	object_event 23, 12, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event 34, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FRock, -1
	object_event 29, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FRock, -1
	object_event 30,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FRock, -1
	object_event 23, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FRock, -1
	object_event 23, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FRock, -1
	object_event 23, 13, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FRock, -1
	object_event 16,  4, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad3FUltraBall, EVENT_VICTORY_ROAD_3F_ULTRA_BALL
	object_event  8, 10, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad3FBigNugget, EVENT_VICTORY_ROAD_3F_BIG_NUGGET
	object_event 23, 17, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, VictoryRoad3FTMEarthquake, EVENT_VICTORY_ROAD_3F_TM_EARTHQUAKE
