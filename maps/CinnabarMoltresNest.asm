	object_const_def
	const CINNABARMOLTRESNEST_BLAINE
	const CINNABARMOLTRESNEST_MOLTRES

CinnabarMoltresNest_MapScripts:
	def_scene_scripts
	scene_script CinnabarMoltresNestNoop1Scene, SCENE_CINNABARMOLTRESNEST_MOLTRES_CRY
	scene_script CinnabarMoltresNestNoop2Scene, SCENE_CINNABARMOLTRESNEST_BLAINE
	scene_script CinnabarMoltresNestNoop3Scene, SCENE_CINNABARMOLTRESNEST_NOOP

	def_callbacks

CinnabarMoltresNestNoop1Scene:
	end

CinnabarMoltresNestNoop2Scene:
	end

CinnabarMoltresNestNoop3Scene:
	end

CinnabarMoltresNestMoltresCry:
	pause 10
	cry MOLTRES
	pause 10
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 10
	turnobject PLAYER, RIGHT
	pause 15
	turnobject PLAYER, LEFT
	pause 15
	turnobject PLAYER, UP
	pause 15
	setscene SCENE_CINNABARMOLTRESNEST_BLAINE
	appear CINNABARMOLTRESNEST_BLAINE
	end

CinnabarMoltresNestBlaine:
	pause 10
	showemote EMOTE_SHOCK, CINNABARMOLTRESNEST_BLAINE, 15
	turnobject CINNABARMOLTRESNEST_BLAINE, DOWN
	pause 10
	checkevent EVENT_GUARDIAN_BLAINE_INTRO
	iftrue .SkipBlaineIntro
	opentext
	writetext MoltresNestBlaineChallengerText
	waitbutton
	closetext
	applymovement CINNABARMOLTRESNEST_BLAINE, BlaineBattleApproachMovement
	opentext
	writetext MoltresNestBlaineIntroText
	waitbutton
	closetext
	setevent EVENT_GUARDIAN_BLAINE_INTRO
.ContinueBattleScript
	winlosstext MoltresNestBlaineWinLossText, 0
	loadtrainer BLAINE_G, BLAINE_G1
	startbattle
	reloadmapafterbattle
	opentext 
	writetext MoltresNestBlaineOutroText
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovesForBlaineMovement
	pause 10
	applymovement CINNABARMOLTRESNEST_BLAINE, BlaineExitMovement
	disappear CINNABARMOLTRESNEST_BLAINE
	setscene SCENE_CINNABARMOLTRESNEST_NOOP
	setevent EVENT_BEAT_GUARDIAN_BLAINE
	setevent EVENT_SEAFOAM_GYM_MAGMAR
	clearevent EVENT_SEAFOAM_GYM_MAGMORTAR
	end

.SkipBlaineIntro:
	applymovement CINNABARMOLTRESNEST_BLAINE, BlaineBattleApproachMovement
	opentext
	writetext MoltresNestBlaineReturnChallengeText
	waitbutton
	closetext
	sjump .ContinueBattleScript

CinnabarMoltresNestMoltres:
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_FOUGHT_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MOLTRES, 70
	startbattle
	disappear CINNABARMOLTRESNEST_MOLTRES
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_MOLTRES
.nocatch
	checkevent EVENT_FOUGHT_ARTICUNO
	iffalse .end
	checkevent EVENT_FOUGHT_ZAPDOS
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
.end
	end
	
BlaineBattleApproachMovement:
	slow_step DOWN
	step_end

PlayerMovesForBlaineMovement:
	step LEFT
	turn_head RIGHT
	step_end

BlaineExitMovement:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end

MoltresNestBlaineChallengerText:
	text "Blaine: <PLAYER>!"
	line "I should have"
	cont "known!"
	done

MoltresNestBlaineIntroText:
	text "Ohoho!"
	line "I knew you'd"
	cont "come here!"
	
	para "I know you're"
	line "strong, but are"
	cont "you ready to prove"
	cont "it to Moltres?"
	
	para "You're gonna need"
	line "a bit more than"
	cont "Burn Heal!"
	done
	
MoltresNestBlaineWinLossText:
	text "Amazing."
	line "Just amazing!"
	done
	
MoltresNestBlaineOutroText:
	text "Ahahaha!"
	
	para "Kid! You did it!"
	line "You really put on"
	cont "a show for us!"
	
	para "You've definitely"
	line "proved yourself"
	cont "not just to me"
	cont "but to Moltres."
	
	para "Red left clear"
	line "instructions;"
	
	para "If a challenger"
	line "was able to make"
	cont "it this far and"
	cont "defeat me,"
	cont "the Guardian,"
	cont "then that person"
	cont "can try to capture"
	cont "Moltres."
	
	para "You've got your"
	line "work cut out for"
	cont "you, kid!"
	done

MoltresNestBlaineReturnChallengeText:
	text "You're back,"
	line "<PLAYER>!"
	
	para "Here to try"
	line "again?"
	done

MoltresText:
	text "Moltres: Gshya!"
	done
	
CinnabarMoltresNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 17, CINNABAR_VOLCANO_2F, 6

	def_coord_events
	coord_event 15, 13, SCENE_CINNABARMOLTRESNEST_MOLTRES_CRY, CinnabarMoltresNestMoltresCry
	coord_event 11,  6, SCENE_CINNABARMOLTRESNEST_BLAINE, CinnabarMoltresNestBlaine

	def_bg_events

	def_object_events
	object_event 11,  4, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CINNABAR_MOLTRES_NEST_BLAINE
	object_event 10,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarMoltresNestMoltres, EVENT_MOLTRES_NEST_MOLTRES
	