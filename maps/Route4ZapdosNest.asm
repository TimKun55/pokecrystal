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
	turnobject PLAYER, RIGHT
	pause 15
	turnobject PLAYER, LEFT
	pause 15
	turnobject PLAYER, UP
	pause 15
	setscene SCENE_ROUTE4ZAPDOSNEST_AGATHA
	appear ROUTE4ZAPDOSNEST_AGATHA
	end

Route4ZapdosNestAgathaBattle:
	pause 15
	applymovement PLAYER, PlayerBattleApproachMovement
	pause 10
	showemote EMOTE_SHOCK, ROUTE4ZAPDOSNEST_AGATHA, 15
	turnobject ROUTE4ZAPDOSNEST_AGATHA, DOWN
	pause 10
	checkevent EVENT_GUARDIAN_AGATHA_INTRO
	iftrue .SkipAgathaIntro
	opentext
	writetext AgathaChallengerText
	waitbutton
	closetext
	applymovement ROUTE4ZAPDOSNEST_AGATHA, AgathaBattleApproachMovement
	opentext
	writetext AgathaIntroText
	waitbutton
	closetext
	setevent EVENT_GUARDIAN_AGATHA_INTRO
.ContinueBattleScript
	winlosstext AgathaWinLossText, 0
	loadtrainer AGATHA, AGATHA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext AgathaOutroText
	waitbutton
	closetext
	pause 10
	cry GENGAR
	pause 10
	applymovement ROUTE4ZAPDOSNEST_AGATHA, AgathaLeaveMovement
	disappear ROUTE4ZAPDOSNEST_AGATHA
	setscene SCENE_ROUTE4ZAPDOSNEST_NOOP
	setevent EVENT_BEAT_GUARDIAN_AGATHA
	end

.SkipAgathaIntro:
	applymovement ROUTE4ZAPDOSNEST_AGATHA, AgathaBattleApproachMovement
	opentext
	writetext AgathaReturnChallengeText
	waitbutton
	closetext
	sjump .ContinueBattleScript

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
	slow_step DOWN
	step_end

PlayerBattleApproachMovement:
	slow_step UP
	step_end

AgathaLeaveMovement:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AgathaChallengerText:
	text "???: Well,"
	line "well, well."
	
	para "A challenger,"
	line "perhaps?"
	done

AgathaIntroText:
	text "???: So, you think"
	line "you can battle a"
	cont "Legendary Bird?"

	para "……"

	para "Oh, you're the"
	line "Champion of Johto"
	cont "and you've been"
	cont "collecting Kanto"
	cont "Badges, too?"
	
	para "Impressive."
	
	para "It's not often I"
	line "get to meet one"
	cont "like you."

	para "My name is Agatha."
	
	para "As a former Elite"
	line "Four member, I"
	cont "expect only the"
	cont "best from those"
	cont "who wish to"
	cont "challenge Zapdos."
	
	para "I hope you're"
	line "prepared for this."
	
	para "If you want your"
	line "shot at Zapdos,"
	cont "you'll have to go"
	cont "through me first!"
	done

AgathaReturnChallengeText:
	text "Back again, eh?"
	
	para "Hehe, I like your"
	line "determination!"
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
	cont "dedicated trainers"
	cont "out there."
	
	para "Speaking of such"
	line "strong trainers,"
	cont "The former Champ-"
	cont "ion, Red, asked"
	cont "me to watch over"
	cont "Zapdos until"
	cont "another strong,"
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
	coord_event  9,  7, SCENE_ROUTE4ZAPDOSNEST_AGATHA, Route4ZapdosNestAgathaBattle

	def_bg_events

	def_object_events
	object_event  9,  4, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ZAPDOS_NEST_AGATHA
	object_event  8,  4, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestZapdos, EVENT_ZAPDOS_NEST_ZAPDOS
	object_event  6, 13, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event  4, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event  9, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event 10, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
	object_event 13, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestRock, -1
