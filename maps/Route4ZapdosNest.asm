	object_const_def
	const ROUTE4ZAPDOSNEST_AGATHA
	const ROUTE4ZAPDOSNEST_ZAPDOS
	const ROUTE4ZAPDOSNEST_ROCK1
	const ROUTE4ZAPDOSNEST_ROCK2
	const ROUTE4ZAPDOSNEST_ROCK3
	const ROUTE4ZAPDOSNEST_ROCK4
	const ROUTE4ZAPDOSNEST_ROCK5
	const ROUTE4ZAPDOSNEST_ROCK6

Route4ZapdosNest_MapScripts:
	def_scene_scripts
	scene_script Route4ZapdosNestNoop1Scene, SCENE_ROUTE4ZAPDOSNEST_ZAPDOSCRY
	scene_script Route4ZapdosNestNoop2Scene, SCENE_ROUTE4ZAPDOSNEST_AGATHA
	scene_script Route4ZapdosNestNoop3Scene, SCENE_ROUTE4ZAPDOSNEST_NOOP

	def_callbacks

Route4ZapdosNestNoop1Scene:
	end

Route4ZapdosNestNoop2Scene:
	end

Route4ZapdosNestNoop3Scene:
	end

Route4ZapdosNestZapdosCry:
	pause 10
	cry ZAPDOS
	pause 10
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 10
	turnobject PLAYER, LEFT
	pause 15
	turnobject PLAYER, RIGHT
	pause 15
	turnobject PLAYER, UP
	pause 15
	setscene SCENE_ROUTE4ZAPDOSNEST_AGATHA
	end

Route4ZapdosNestAgathaBattle:
	opentext
	writetext AgathaStopText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	pause 10
	moveobject ROUTE4ZAPDOSNEST_AGATHA, 5, 17
	appear ROUTE4ZAPDOSNEST_AGATHA
	applymovement ROUTE4ZAPDOSNEST_AGATHA, AgathaBattleApproachMovement
	opentext
	writetext AgathaIntroText
	waitbutton
	closetext
	winlosstext AgathaWinLossText, 0
	loadtrainer AGATHA, AGATHA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_AGATHA
	opentext
	writetext AgathaOutroText
	waitbutton
	closetext
	cry GENGAR
	applymovement ROUTE4ZAPDOSNEST_AGATHA, AgathaLeaveMovement
	disappear ROUTE4ZAPDOSNEST_AGATHA
	setscene SCENE_ROUTE4ZAPDOSNEST_NOOP
	end
	
Route4ZapdosNestZapdos:
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ZAPDOS, 70
	startbattle
	disappear ROUTE4ZAPDOSNEST_ZAPDOS
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_ZAPDOS
.nocatch
	checkevent EVENT_FOUGHT_ARTICUNO
	iffalse .end
	checkevent EVENT_FOUGHT_MOLTRES
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
.end	
	end

Route4ZapdosNestRock:
	jumpstd SmashRockScript

AgathaBattleApproachMovement:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

AgathaLeaveMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

AgathaStopText:
	text "Stop right there!"
	done

AgathaIntroText:
	text "So, you think can"
	line "battle a Legendary"
	cont "Bird?"
	
	para "Oh, you're the"
	line "Champion of Johto"
	
	para "and you've been"
	line "collecting Kanto"
	cont "Badges, too?"
	
	para "Impressive."
	
	para "It's not often I"
	line "get to meet one"
	cont "like you."
	
	para "As a former Elite"
	line "Four member, I"
	cont "expect only the"
	
	para "best from those"
	line "who wish to"
	cont "challenge Zapdos."
	
	para "I hope you're"
	line "prepared for this."
	done
	
AgathaWinLossText:
	text "Well, well, well."
	line "You really know"
	cont "what you're doing."
	done
	
AgathaOutroText:
	text "You've done well,"
	line "young challenger."
	
	para "I really am"
	line "impressed with how"
	cont "you handled your"
	cont "#mon."
	
	para "At my age, it's"
	line "good to know that"
	cont "there are strong,"
	
	para "dedicated trainers"
	line "out there."
	
	para "Speaking of,"
	
	para "The former"
	line "Champion, Red,"
	cont "asked me to watch"
	
	para "over Zapdos until"
	line "another strong,"
	cont "worthy trainer"
	cont "appeared."
	
	para "You may now try"
	line "and capture it."
	
	para "Good luck."
	line "You'll need it."
	
	para "I'm sure we'll"
	line "meet again."
	
	para "Let's go, Gengar."
	done

ZapdosText:
	text "Zapdos: Gshya!"
	done

Route4ZapdosNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events
	coord_event 8, 19, SCENE_ROUTE4ZAPDOSNEST_ZAPDOSCRY, Route4ZapdosNestZapdosCry
	coord_event 7, 18, SCENE_ROUTE4ZAPDOSNEST_ZAPDOSCRY, Route4ZapdosNestZapdosCry
	coord_event 9, 12, SCENE_ROUTE4ZAPDOSNEST_AGATHA, Route4ZapdosNestAgathaBattle

	def_bg_events

	def_object_events
	object_event 19,  0, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event  8,  4, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestZapdos, EVENT_ZAPDOS_NEST_ZAPDOS
	object_event  6, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event  4, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event  9, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event 11, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event  8, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event 13, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
