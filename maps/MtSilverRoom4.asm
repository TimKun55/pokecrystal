	object_const_def
	const MTSILVERROOM4_MEWTWO

MtSilverRoom4_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MtSilverRoom4MewtwoCallback

MtSilverRoom4MewtwoCallback:
	checkevent EVENT_MT_SILVER_ROOM_4_MEWTWO
	iftrue .NoAppear
;	checkitem DNA_SAMPLE
;	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear MTSILVERROOM4_MEWTWO
	endcallback

.NoAppear:
	disappear MTSILVERROOM4_MEWTWO
	endcallback

Mewtwo:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_MT_SILVER_ROOM_4_MEWTWO
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MEWTWO, 85
	startbattle
	disappear MTSILVERROOM4_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "Twoooooo!"
	done

MtSilverRoom4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 13, MT_SILVER_ROOM_3, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  5, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_MT_SILVER_ROOM_4_MEWTWO
