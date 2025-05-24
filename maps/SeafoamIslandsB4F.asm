	object_const_def
	const SEAFOAMISLANDSB4F_LORELEI
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
	end

SeafoamIslandsB4FNoop2Scene:
	end

SeafoamIslandsB4FNoop3Scene:
	end

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

SeafoamIslandsB4FLorelei:
	opentext
	writetext LoreleiWaitText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	pause 10
	moveobject SEAFOAMISLANDSB4F_LORELEI, 35, 12
	appear SEAFOAMISLANDSB4F_LORELEI
	applymovement SEAFOAMISLANDSB4F_LORELEI, LoreleiBattleApproachMovement
	opentext
	writetext LoreleiIntroText
	waitbutton
	closetext
	winlosstext LoreleiWinLossText, 0
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_LORELEI
	opentext 
	writetext LoreleiOutroText
	waitbutton
	closetext
	applymovement SEAFOAMISLANDSB4F_LORELEI, LoreleiExitMovement
	disappear SEAFOAMISLANDSB4F_LORELEI
	setscene SCENE_SEAFOAMISLANDSB4F_NOOP
	end

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

LoreleiBattleApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end

LoreleiExitMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

SeafoamIslandsB4FUltraBall:
	itemball ULTRA_BALL

SeafoamIslandsB4FZinc:
	itemball ZINC

LoreleiWaitText:
	text "Wait right there,"
	line "please!"
	done

LoreleiIntroText:
	text "So, you think you"
	line "can approach the"
	cont "Legendary Bird?"
	
	para "You certainly look"
	line "like a strong"
	cont "trainer, but"
	
	para "looks aren't"
	line "everything."
	
	para "As a former Elite"
	line "Four member let me"
	
	para "warn you; you had"
	line "best be prepared."
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
	
	para "pride in seeing"
	line "new, powerful"
	cont "trainers emerging."
	
	para "The last Champion"
	line "gave us clear"
	cont "instructions;"
	
	para "We were to watch"
	line "over the Birds"
	
	para "until another"
	line "powerful trainer"

	para "rose up and"
	line "came to find them."

	para "Go. Challenge"
	line "Articuno."
	
	para "Good luck."
	
	para "I hope I get to"
	line "see you again."
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
	warp_event 36, 15, SEAFOAM_ISLANDS_B3F,  9
	warp_event 28, 15, SEAFOAM_ISLANDS_B3F, 10

	def_coord_events
	coord_event  7, 15, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY1, SeafoamIslandsB4FArticunoCry1
	coord_event 35, 13, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY2, SeafoamIslandsB4FArticunoCry2
	coord_event 36, 13, SCENE_SEAFOAMISLANDSB4F_ARTICUNO_CRY2, SeafoamIslandsB4FArticunoCry2
	coord_event 33,  7, SCENE_SEAFOAMISLANDSB4F_LORELEI, SeafoamIslandsB4FLorelei

	def_bg_events

	def_object_events
	object_event 39, 21, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event 18, 15, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FArticuno, EVENT_ARTICUNO_NEST_ARTICUNO
	object_event 20,  3, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FUltraBall, EVENT_SEAFOAM_ISLANDS_B4F_ULTRA_BALL
	object_event 30,  5, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FZinc, EVENT_SEAFOAM_ISLANDS_B4F_ZINC
	