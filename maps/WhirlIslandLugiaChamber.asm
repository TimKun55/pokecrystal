	object_const_def
	const WHIRLISLANDLUGIACHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScripts:
	def_scene_scripts
	scene_script WhirlIslandLugiaChamberNoop1Scene, SCENE_WHIRLISLANDLUGIACHAMBER_SILVER_WING_CHECK
	scene_script WhirlIslandLugiaChamberNoop2Scene, SCENE_WHIRLISLANDLUGIACHAMBER_LUGIA_APPEAR	
	scene_script WhirlIslandLugiaChamberNoop3Scene, SCENE_WHIRLISLANDLUGIACHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WhirlIslandLugiaChamberLugiaCallback

WhirlIslandLugiaChamberNoop1Scene:
	end

WhirlIslandLugiaChamberNoop2Scene:
	end

WhirlIslandLugiaChamberNoop3Scene:
	end

WhirlIslandLugiaChamberSilverWingCheck:
	checkitem SILVER_WING
	iffalse .NoWing
	playsound SFX_TWINKLE
	pause 5
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext SilverWingGlimmerText
	waitbutton
	closetext
	setscene SCENE_WHIRLISLANDLUGIACHAMBER_LUGIA_APPEAR
	end
	
.NoWing
	end
	
WhirlIslandLugiaChamberLugiaAppear:
	checkitem SILVER_WING
	iffalse .NoWing
	earthquake 72
	waitsfx
	playsound SFX_SURF
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	pause 15
	cry LUGIA
	pause 15
	opentext
	writetext WaterfallBurstText
	waitbutton
	closetext
	setscene SCENE_WHIRLISLANDLUGIACHAMBER_NOOP
	end

.NoWing
	end

WhirlIslandLugiaChamberLugiaCallback:
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .NoAppear
	checkitem SILVER_WING
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear WHIRLISLANDLUGIACHAMBER_LUGIA
	endcallback

.NoAppear:
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	endcallback
	
Lugia:
	faceplayer
	opentext
	writetext LugiaText
	cry LUGIA
	pause 15
	closetext
	setevent EVENT_FOUGHT_LUGIA
	loadvar VAR_BATTLETYPE, BATTLETYPE_LUGIA
	loadwildmon LUGIA, 75
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_LUGIA
.nocatch
	end

SilverWingGlimmerText:
	text "?!"
	
	para "The Silver Wing"
	line "is glowing!"
	done
	
WaterfallBurstText:
	text "Something just"
	line "burst out of the"
	cont "giant waterfall!"
	done
	
LugiaText:
	text "Gyaaas!"
	done

WhirlIslandLugiaChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 23, WHIRL_ISLAND_B2F, 3

	def_coord_events
	coord_event  9, 19, SCENE_WHIRLISLANDLUGIACHAMBER_SILVER_WING_CHECK, WhirlIslandLugiaChamberSilverWingCheck
	coord_event  9, 13, SCENE_WHIRLISLANDLUGIACHAMBER_LUGIA_APPEAR, WhirlIslandLugiaChamberLugiaAppear

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
