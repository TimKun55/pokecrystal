	object_const_def
	const CINNABARMOLTRESNEST_BLAINE
	const CINNABARMOLTRESNEST_MOLTRES

CinnabarMoltresNest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CinnabarMoltresNestBlaineCallback
	callback MAPCALLBACK_OBJECTS, CinnabarMoltresNestMoltresCallback
	
CinnabarMoltresNestBlaineCallback:
	checkevent EVENT_BEAT_GUARDIAN_BLAINE
	iftrue .NoAppear
	checkevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear CINNABARMOLTRESNEST_BLAINE
	endcallback

.NoAppear:
	disappear CINNABARMOLTRESNEST_BLAINE
	endcallback

CinnabarMoltresNestMoltresCallback:
	checkevent EVENT_MOLTRES_NEST_MOLTRES
	iftrue .NoAppear
	checkevent EVENT_BEAT_GUARDIAN_BLAINE
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear CINNABARMOLTRESNEST_MOLTRES
	endcallback

.NoAppear:
	disappear CINNABARMOLTRESNEST_MOLTRES
	endcallback

CinnabarMoltresNestBlaine:
	faceplayer
	opentext
	writetext GuardianBlaineIntroText
	waitbutton
	closetext
	winlosstext GuardianBlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_BLAINE
	opentext GuardianBlaineOutroText
	waitbutton
	closetext
	cry MAGMAR
	applymovement CINNABARMOLTRESNEST_BLAINE, GuardianBlaineExitMovement
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	cry MOLTRES
	pause 15
	playsound SFX_ESCAPE_ROPE
	disappear CINNABARMOLTRESNEST_BLAINE
	appear CINNABARMOLTRESNEST_MOLTRES
	end

CinnabarMoltresNestMoltres:
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_MOLTRES_NEST_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MOLTRES, 70
	startbattle
	disappear CINNABARMOLTRESNEST_MOLTRES
	reloadmapafterbattle
	checkevent EVENT_ARTICUNO_NEST_ARTICUNO
	iffalse .end
	checkevent EVENT_ZAPDOS_NEST_ZAPDOS
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	end
	
.end
	end
	
GuardianBlaineExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

GuardianBlaineIntroText:
	text "Ohoho!"
	line "You're back!"
	
	para "As one of the"
	line "GUARDIANS I can't"
	cont "let anyone get"
	
	para "their hands on"
	line "MOLTRES. But"
	
	para "you're not just"
	line "anyone, are ya?"
	
	para "I know you're"
	line "strong, but are"
	
	para "you ready to prove"
	line "it to MOLTRES?"
	
	para "You're gonna need"
	line "a bit more than"
	cont "BURN HEAL!"
	done
	
GuardianBlaineWinLossText:
	text "Amazing."
	line "Just amazing!"
	done
	
GuardianBlaineOutroText:
	text "Ahahaha!"
	
	para "Kid! You did it!"
	line "You really put on"
	cont "a show for us!"
	
	para "You've definitely"
	line "proved yourself"
	cont "not just to me"
	cont "but to MOLTRES."
	
	para "RED left clear"
	line "instructions;"
	
	para "I'll now release"
	line "MOLTRES and you"
	
	para "can try to capture"
	line "it. You've got"
	cont "work cut out for"
	cont "you, kid!"
	
	para "C'mon, MAGMAR!"
	line "Let's go."
	done

MoltresText:
	text "MOLTRES: Gshya!"
	done
	
CinnabarMoltresNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, CINNABAR_VOLCANO_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 16, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarMoltresNestBlaine, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event  6, 12, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarMoltresNestMoltres, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	