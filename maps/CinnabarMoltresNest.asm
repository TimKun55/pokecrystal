	object_const_def
	const CINNABARMOLTRESNEST_MOLTRES

CinnabarMoltresNest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CinnabarMoltresNestMoltresCallback
	
CinnabarMoltresNestMoltresCallback:
	checkevent EVENT_MOLTRES_NEST_MOLTRES
	iftrue .NoAppear
	checkevent EVENT_LEGENDARY_BIRDS_ACTIVE
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear CINNABARMOLTRESNEST_MOLTRES
	endcallback

.NoAppear:
	disappear CINNABARMOLTRESNEST_MOLTRES
	endcallback

CinnabarMoltresNestMoltres:
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_MOLTRES_NEST_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MOLTRES, 60
	startbattle
	disappear CINNABARMOLTRESNEST_MOLTRES
	reloadmapafterbattle
	end

MoltresText:
	text "Gshya!"
	done
	
CinnabarMoltresNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, CINNABAR_VOLCANO_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6, 12, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarMoltresNestMoltres, EVENT_LEGENDARY_BIRDS_ACTIVE
	