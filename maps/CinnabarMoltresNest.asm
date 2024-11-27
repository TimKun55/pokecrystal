	object_const_def
	const CINNABARMOLTRESNEST_BLAINE
	const CINNABARMOLTRESNEST_MOLTRES

CinnabarMoltresNest_MapScripts:
	def_scene_scripts
	scene_script CinnabarMoltresNestNoop1Scene, SCENE_CINNABARMOLTRESNEST_BLAINE
	scene_script CinnabarMoltresNestNoop2Scene, SCENE_CINNABARMOLTRESNEST_NOOP

	def_callbacks

CinnabarMoltresNestNoop1Scene:
	end

CinnabarMoltresNestNoop2Scene:
	end

CinnabarMoltresNestBlaine:
	opentext
	writetext MoltresNestBlaineStopText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	pause 10
	moveobject CINNABARMOLTRESNEST_BLAINE, 7, 17
	appear CINNABARMOLTRESNEST_BLAINE
	applymovement CINNABARMOLTRESNEST_BLAINE, BlaineBattleApproachMovement
	opentext
	writetext MoltresNestBlaineIntroText
	waitbutton
	closetext
	winlosstext MoltresNestBlaineWinLossText, 0
	loadtrainer BLAINE_G, BLAINE_G1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_BLAINE
	opentext 
	writetext MoltresNestBlaineOutroText
	waitbutton
	closetext
	applymovement CINNABARMOLTRESNEST_BLAINE, BlaineExitMovement
	disappear CINNABARMOLTRESNEST_BLAINE
	setscene SCENE_CINNABARMOLTRESNEST_NOOP
	end

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
	step UP
	step UP
	step UP
	step UP
	step_end

BlaineExitMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MoltresNestBlaineStopText:
	text "Hey, <PLAYER>!"
	line "Wait up!"
	done

MoltresNestBlaineIntroText:
	text "Ohoho!"
	line "I knew you'd"
	cont "come here!"
	
	para "I know you're"
	line "strong, but are"
	
	para "you ready to prove"
	line "it to Moltres?"
	
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
	
	para "it this far and"
	line "defeat me,"
	cont "the Guardian,"
	
	para "then that person"
	line "can try to capture"
	cont "the Bird."
	
	para "You've got your"
	line "work cut out for"
	cont "you, kid!"
	done

MoltresText:
	text "Moltres: Gshya!"
	done
	
CinnabarMoltresNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 17, CINNABAR_VOLCANO_2F, 6

	def_coord_events
	coord_event  7, 12, SCENE_CINNABARMOLTRESNEST_BLAINE, CinnabarMoltresNestBlaine

	def_bg_events

	def_object_events
	object_event 13, 21, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event  6,  7, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarMoltresNestMoltres, EVENT_MOLTRES_NEST_MOLTRES
	