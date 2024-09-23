	object_const_def
	const SEAFOAMISLANDSB4F_ARTICUNO
	const SEAFOAMISLANDSB4F_POKE_BALL1
	const SEAFOAMISLANDSB4F_POKE_BALL2

SeafoamIslandsB4F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SeafoamIslandsB4FArticunoCallback

SeafoamIslandsB4FArticunoCallback:
	checkflag ENGINE_PLAYER_CAUGHT_ARTICUNO
	iftrue .NoAppear
	checkevent EVENT_LORELEI_IN_SAFFRON
	iftrue .Appear
	sjump .NoAppear
	
.Appear:
	appear SEAFOAMISLANDSB4F_ARTICUNO
	endcallback

.NoAppear:
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	endcallback

SeafoamIslandsB4Articuno:
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
	end
	
.end
	end

SeafoamIslandsB4FUltraBall:
	itemball ULTRA_BALL

SeafoamIslandsB4FZinc:
	itemball ZINC

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
	warp_event 32, 13, SEAFOAM_ISLANDS_B3F,  9
	warp_event 28, 15, SEAFOAM_ISLANDS_B3F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18, 15, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4Articuno, EVENT_ARTICUNO_NEST_ARTICUNO
	object_event 20,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FUltraBall, EVENT_SEAFOAM_ISLANDS_B4F_ULTRA_BALL
	object_event 30,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FZinc, EVENT_SEAFOAM_ISLANDS_B4F_ZINC
	