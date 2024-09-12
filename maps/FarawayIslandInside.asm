	object_const_def
	const FARAWAYISLANDINSIDE_MEW

FarawayIslandInside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FarawayIslandInsideMewCallback

FarawayIslandInsideMewCallback:
	checkevent EVENT_FOUGHT_MEW
	iftrue .NoAppear
	appear FARAWAYISLANDINSIDE_MEW
	endcallback

.NoAppear:
	disappear FARAWAYISLANDINSIDE_MEW
	endcallback

FarawayIslandMew:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	loadwildmon MEW, 60	
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	startbattle
	disappear FARAWAYISLANDINSIDE_MEW
	setevent EVENT_FOUGHT_MEW
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_MEW
.nocatch
	end

MewText:
	text "Mew: Mew!"
	done

FarawayIslandInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 19, FARAWAY_ISLAND_OUTSIDE, 1
	warp_event 11, 19, FARAWAY_ISLAND_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 11, SPRITE_MEW, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandMew, EVENT_FARAWAY_ISLAND_MEW
