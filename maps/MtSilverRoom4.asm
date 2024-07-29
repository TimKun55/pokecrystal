	object_const_def
	const MTSILVERROOM4_MEWTWO

MtSilverRoom4_MapScripts:
	def_scene_scripts
	scene_script MtSilverRoom4Noop1Scene, SCENE_MTSILVERROOM4_MEWTWO_APPEAR	
	scene_script MtSilverRoom4Noop2Scene, SCENE_MTSILVERROOM4_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MtSilverRoom4MewtwoCallback

MtSilverRoom4Noop1Scene:
	end

MtSilverRoom4Noop2Scene:
	end

MtSilverRoom4MewtwoAppear:
	playsound SFX_STRENGTH
	pause 5
	showemote EMOTE_SHOCK, PLAYER, 15
	earthquake 72
	waitsfx
	playsound SFX_PSYCHIC
	pause 15
	cry MEWTWO
	pause 15	
	opentext
	writetext SomethingPowerfulText
	waitbutton
	closetext
	setscene SCENE_MTSILVERROOM4_NOOP
	end

MtSilverRoom4MewtwoCallback:
	checkevent EVENT_MT_SILVER_ROOM_4_MEWTWO
	iftrue .NoAppear
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

SomethingPowerfulText:
	text "… … …"
	
	para "There's something"
	line "powerful up ahead…"
	done

MewtwoText:
	text "Twoooooo!"
	done

MtSilverRoom4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 13, MT_SILVER_ROOM_3, 2

	def_coord_events
	coord_event  9, 10, SCENE_MTSILVERROOM4_MEWTWO_APPEAR, MtSilverRoom4MewtwoAppear

	def_bg_events

	def_object_events
	object_event  9,  5, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_MT_SILVER_ROOM_4_MEWTWO
