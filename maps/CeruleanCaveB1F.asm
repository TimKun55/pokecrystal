	object_const_def
	const CERULEANCAVEB1F_MEWTWO

CeruleanCaveB1F_MapScripts:
	def_scene_scripts
	scene_script CeruleanCaveB1FNoop1Scene, SCENE_CERULEANCAVEB1F_MEWTWO_APPEAR	
	scene_script CeruleanCaveB1FNoop2Scene, SCENE_CERULEANCAVEB1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CeruleanCaveB1FMewtwoCallback

CeruleanCaveB1FNoop1Scene:
	end

CeruleanCaveB1FNoop2Scene:
	end

CeruleanCaveB1FMewtwoAppear:
	playsound SFX_STRENGTH
	pause 5
	showemote EMOTE_SHOCK, PLAYER, 15
	earthquake 72
	waitsfx
	playsound SFX_PSYCHIC
	waitsfx
	cry MEWTWO
	waitsfx
	opentext
	writetext SomethingPowerfulText
	waitbutton
	closetext
	setscene SCENE_CERULEANCAVEB1F_NOOP
	end

CeruleanCaveB1FMewtwoCallback:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .NoAppear
	appear CERULEANCAVEB1F_MEWTWO
	endcallback

.NoAppear:
	disappear CERULEANCAVEB1F_MEWTWO
	endcallback

CeruleanCaveB1FMewtwo:
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MEWTWO, 85
	startbattle
	disappear CERULEANCAVEB1F_MEWTWO
	reloadmapafterbattle
	end

SomethingPowerfulText:
	text "… … …"
	
	para "There's something"
	line "powerful up ahead…"
	done

MewtwoText:
	text "Mewtwo: Twoooooo!"
	done

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CERULEAN_CAVE_1F, 5

	def_coord_events
	coord_event 17, 16, SCENE_CERULEANCAVEB1F_MEWTWO_APPEAR, CeruleanCaveB1FMewtwoAppear

	def_bg_events

	def_object_events
	object_event  6, 13, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeruleanCaveB1FMewtwo, EVENT_CERULEAN_CAVE_B1F_MEWTWO
