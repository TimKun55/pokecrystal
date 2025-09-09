	object_const_def
	const SEAFOAMISLANDSB4F_LORELEI
	const SEAFOAMISLANDSB4F_LAPRAS
	const SEAFOAMISLANDSB4F_ARTICUNO
	const SEAFOAMISLANDSB4F_POKE_BALL1
	const SEAFOAMISLANDSB4F_POKE_BALL2

SeafoamIslandsB4F_MapScripts:
	def_scene_scripts
	scene_script SeafoamIslandsB4FNoop1Scene, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY1
	scene_script SeafoamIslandsB4FNoop2Scene, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY2
	scene_script SeafoamIslandsB4FNoop3Scene, SCENE_SEAFOAMISLANDSB4F_LORELEI
	scene_script SeafoamIslandsB4FNoop4Scene, SCENE_SEAFOAMISLANDSB4F_NOOP

	def_callbacks

SeafoamIslandsB4FNoop1Scene:
SeafoamIslandsB4FNoop2Scene:
SeafoamIslandsB4FNoop3Scene:
SeafoamIslandsB4FNoop4Scene:
	end

SeafoamIslandsB4FArticunoCry1:
	pause 10
	cry ARTICUNO
	pause 10
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 10
	turnobject PLAYER, LEFT
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	turnobject PLAYER, RIGHT
	pause 15
	setscene SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY2
	appear SEAFOAMISLANDSB4F_LORELEI
	end

SeafoamIslandsB4FArticunoCry2:
	pause 10
	cry ARTICUNO
	pause 10
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 10
	turnobject PLAYER, LEFT
	pause 15
	setscene SCENE_SEAFOAMISLANDSB4F_LORELEI
	end

SeafoamIslandsB4FLoreleiBattle:
	pause 15
	applymovement PLAYER, PlayerApproachLoreleiMovement
	pause 10
	showemote EMOTE_SHOCK, SEAFOAMISLANDSB4F_LORELEI, 15
	turnobject SEAFOAMISLANDSB4F_LORELEI, DOWN
	pause 10
	checkevent EVENT_GUARDIAN_LORELEI_INTRO
	iftrue .SkipLoreleiIntro
	opentext
	writetext LoreleiChallengerText
	waitbutton
	closetext
	applymovement SEAFOAMISLANDSB4F_LORELEI, LoreleiBattleApproachMovement
	opentext
	writetext LoreleiIntroText
	waitbutton
	closetext
	setevent EVENT_GUARDIAN_LORELEI_INTRO
.ContinueBattleScript
	winlosstext LoreleiWinLossText, 0
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmapafterbattle
	opentext 
	writetext LoreleiOutroText
	waitbutton
	closetext
	applymovement SEAFOAMISLANDSB4F_LORELEI, LoreleiExitMovement
	disappear SEAFOAMISLANDSB4F_LORELEI
	appear SEAFOAMISLANDSB4F_LAPRAS
	turnobject SEAFOAMISLANDSB4F_LAPRAS, DOWN
	pause 10
	cry LAPRAS
	pause 10	
	applymovement SEAFOAMISLANDSB4F_LAPRAS, LaprasExitMovement
	disappear SEAFOAMISLANDSB4F_LAPRAS
	setscene SCENE_SEAFOAMISLANDSB4F_NOOP
	setevent EVENT_BEAT_GUARDIAN_LORELEI
	end

.SkipLoreleiIntro:
	applymovement SEAFOAMISLANDSB4F_LORELEI, LoreleiBattleApproachMovement
	opentext
	writetext LoreleiReturnChallengeText
	waitbutton
	closetext
	sjump .ContinueBattleScript

SeafoamIslandsB4FArticuno:
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ARTICUNO, 70
	startbattle
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_ARTICUNO
.nocatch
	checkevent EVENT_FOUGHT_ZAPDOS
	iffalse .end
	checkevent EVENT_FOUGHT_MOLTRES
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
.end
	end

PlayerApproachLoreleiMovement:
	slow_step UP
	slow_step UP
	step_end

LoreleiBattleApproachMovement:
	slow_step DOWN
	step_end

LoreleiExitMovement:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	slow_step DOWN
	step_end

LaprasExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

SeafoamIslandsB4FUltraBall:
	itemball ULTRA_BALL

SeafoamIslandsB4FZinc:
	itemball ZINC

LoreleiChallengerText:
	text "???: Oh!"
	line "And who are you?"
	done

LoreleiIntroText:
	text "My name is Lorelei"
	line "and I have been"
	cont "tasked with watch-"
	cont "ing over the"
	cont "Legendary Bird,"
	cont "Articuno."

	para "You certainly look"
	line "like a strong"
	cont "trainer, but"
	cont "looks aren't"
	cont "everything."

	para "As a former Elite"
	line "Four member let me"
	cont "warn you; you had"
	cont "best be prepared."
	done

LoreleiWinLossText:
	text "Oh my!"
	line "You truly"
	cont "are strong."
	done

LoreleiOutroText:
	text "Very well done."

	para "I did not expect"
	line "to be bested but"
	cont "there is only"
	cont "pride in seeing"
	cont "new, powerful"
	cont "trainers emerging."

	para "The last Champion"
	line "gave us clear"
	cont "instructions;"

	para "We were to watch"
	line "over the Birds"
	cont "until another"
	cont "powerful trainer"
	cont "rose up and"
	cont "came to find them."

	para "Go. Challenge"
	line "Articuno."

	para "Good luck."

	para "I hope I get to"
	line "see you again."
	done

LoreleiReturnChallengeText:
	text "Back again?"

	para "I'm always happy"
	line "to battle!"
	done

ArticunoText:
	text "Articuno: Gshya!"
	done

SeafoamIslandsB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  3, SEAFOAM_ISLANDS_B3F,  5
	warp_event 23,  3, SEAFOAM_ISLANDS_B3F,  6
	warp_event 20,  9, SEAFOAM_ISLANDS_B3F,  7
	warp_event  6, 13, SEAFOAM_ISLANDS_B3F,  8
	warp_event 36, 17, SEAFOAM_ISLANDS_B3F,  9
	warp_event 28, 13, SEAFOAM_ISLANDS_B3F, 10

	def_coord_events
	coord_event  7, 15, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY1, SeafoamIslandsB4FArticunoCry1
	coord_event 27, 21, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY2, SeafoamIslandsB4FArticunoCry2
	coord_event 19, 18, SCENE_SEAFOAMISLANDSB4F_LORELEI, SeafoamIslandsB4FLoreleiBattle

	def_bg_events

	def_object_events
	object_event 19, 14, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAFOAM_ISLANDS_B4F_LORELEI
	object_event 19, 20, SPRITE_LAPRAS_SAFARI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LORELEI_LAPRAS
	object_event 18, 14, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FArticuno, EVENT_ARTICUNO_NEST_ARTICUNO
	object_event 20,  3, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FUltraBall, EVENT_SEAFOAM_ISLANDS_B4F_ULTRA_BALL
	object_event 30,  5, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FZinc, EVENT_SEAFOAM_ISLANDS_B4F_ZINC
	