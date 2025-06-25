	object_const_def
	const TINTOWERROOF_HO_OH

TinTowerRoof_MapScripts:
	def_scene_scripts
	scene_script TinTowerRoofNoop1Scene, SCENE_TINTOWERROOF_RAINBOW_WING_CHECK
	scene_script TinTowerRoofNoop2Scene, SCENE_TINTOWERROOF_HO_OH_APPEAR	
	scene_script TinTowerRoofNoop3Scene, SCENE_TINTOWERROOF_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTowerRoofHoOhCallback

TinTowerRoofNoop1Scene:
	end

TinTowerRoofNoop2Scene:
	end

TinTowerRoofNoop3Scene:
	end

TinTowerRoofRainbowWingCheck:
	checkitem RAINBOW_WING
	iffalse .NoWing
	playsound SFX_TWINKLE
	pause 5
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext RainbowWingGlimmerText
	waitbutton
	closetext
	setscene SCENE_TINTOWERROOF_HO_OH_APPEAR
	end
	
.NoWing
	end
	
TinTowerRoofHoohAppear:
	checkitem RAINBOW_WING
	iffalse .NoWing
	earthquake 72
	playsound SFX_EMBER
	waitsfx
	playsound SFX_FLY
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	pause 15
	cry HO_OH
	pause 15
	opentext
	writetext TowerShookText
	waitbutton
	closetext
	setscene SCENE_WHIRLISLANDLUGIACHAMBER_NOOP
	end

.NoWing
	end

TinTowerRoofHoOhCallback:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .NoAppear
	checkitem RAINBOW_WING
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear TINTOWERROOF_HO_OH
	endcallback

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	endcallback

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	loadvar VAR_BATTLETYPE, BATTLETYPE_HO_OH
	loadwildmon HO_OH, 75
	startbattle
	disappear TINTOWERROOF_HO_OH
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_HO_OH
.nocatch
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	end

HoOhStatueSign:
	jumptext HoOhStatueSignText

RainbowWingGlimmerText:
	text "The Rainbow Wing"
	line "is glowing!"
	done
	
TowerShookText:
	text "The whole Tower"
	line "just shook!"
	
	para "Did something"
	line "land on it?"
	done

HoOhText:
	text "Shaoooh!"
	done

HoOhStatueSignText:
	text "A statue dedicated"
	line "to the Rainbow"
	cont "#mon."
	done

TinTowerRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 17, TIN_TOWER_9F, 4

	def_coord_events
	coord_event  6, 16, SCENE_TINTOWERROOF_RAINBOW_WING_CHECK, TinTowerRoofRainbowWingCheck
	coord_event  7, 16, SCENE_TINTOWERROOF_RAINBOW_WING_CHECK, TinTowerRoofRainbowWingCheck
	coord_event  6, 12, SCENE_TINTOWERROOF_HO_OH_APPEAR, TinTowerRoofHoohAppear
	coord_event  7, 12, SCENE_TINTOWERROOF_HO_OH_APPEAR, TinTowerRoofHoohAppear

	def_bg_events
	bg_event 6, 11, BGEVENT_READ, HoOhStatueSign
	bg_event 7, 11, BGEVENT_READ, HoOhStatueSign

	def_object_events
	object_event  7,  5, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
