	object_const_def
	const ROUTE39BARN_TWIN1
	const ROUTE39BARN_TWIN2
	const ROUTE39BARN_MOOMOO
	const ROUTE39BARN_MILTANK1
	const ROUTE39BARN_MILTANK2
	const ROUTE39BARN_MILTANK3
	const ROUTE39BARN_MILTANK4

Route39Barn_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route39BarnFarmPokemon

Route39BarnFarmPokemon:
	checktime NITE
	iffalse .MiltankDisappear
	appear ROUTE39BARN_MILTANK1
	appear ROUTE39BARN_MILTANK2
	appear ROUTE39BARN_MILTANK3
	appear ROUTE39BARN_MILTANK4
	endcallback	

.MiltankDisappear
	disappear ROUTE39BARN_MILTANK1
	disappear ROUTE39BARN_MILTANK2
	disappear ROUTE39BARN_MILTANK3
	disappear ROUTE39BARN_MILTANK4
	endcallback

Route39BarnTwin1Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route39BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN1, RIGHT
	end

.FeedingMooMoo:
	writetext Route39BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN1, RIGHT
	end

Route39BarnTwin2Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route39BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN2, LEFT
	end

.FeedingMooMoo:
	writetext Route39BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN2, LEFT
	end

MoomooScript:
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .HappyCow
	writetext MoomooWeakMooText
	setval MILTANK
	special PlaySlowCry
	promptbutton
	writetext Route39BarnItsCryIsWeakText
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftrue .GiveBerry
	waitbutton
	closetext
	end

.GiveBerry:
	promptbutton
	writetext Route39BarnAskGiveBerryText
	yesorno
	iffalse .Refused
	checkitem ORAN_BERRY
	iffalse .NoBerriesInBag
	takeitem ORAN_BERRY
	readmem wMooMooBerries
	addval 1
	writemem wMooMooBerries
	ifequal 3, .ThreeBerries
	ifequal 5, .FiveBerries
	ifequal 7, .SevenBerries
	writetextend Route39BarnGaveBerryText

.ThreeBerries:
	writetext Route39BarnGaveBerryText
	promptbutton
	writetextend Route39BarnLittleHealthierText

.FiveBerries:
	writetext Route39BarnGaveBerryText
	promptbutton
	writetextend Route39BarnQuiteHealthyText

.SevenBerries:
	playmusic MUSIC_HEAL
	writetext Route39BarnGaveBerryText
	pause 60
	promptbutton
	special RestartMapMusic
	setevent EVENT_HEALED_MOOMOO
	writetextend Route39BarnTotallyHealthyText

.NoBerriesInBag:
	writetextend Route39BarnNoBerriesText

.Refused:
	writetextend Route39BarnRefusedBerryText

.HappyCow:
	writetext MoomooHappyMooText
	cry MILTANK
	waitbutton
	closetext
	end

Route39BarnMiltank:
	opentext
	writetext Route39BarnMiltankText
	cry MILTANK
	waitbutton
	refreshscreen
	pokepic MILTANK
	waitbutton
	closepokepic
	closetext
	end

Route39BarnTwinMoomooIsSickText:
	text "Moomoo is sick…"

	para "She needs lots of"
	line "Oran Berries."
	done

Route39BarnTwinWereFeedingMoomooText:
	text "We're feeding"
	line "Moomoo!"
	done

MoomooWeakMooText:
	text "Miltank: …Moo…"
	done

Route39BarnItsCryIsWeakText:
	text "Its cry is weak…"
	done

MoomooHappyMooText:
	text "Miltank: Mooo!"
	done

Route39BarnAskGiveBerryText:
	text "Give an Oran Berry"
	line "to Miltank?"
	done

Route39BarnGaveBerryText:
	text "<PLAYER> gave a"
	line "Berry to Miltank."
	done

Route39BarnLittleHealthierText:
	text "Miltank became a"
	line "little healthier!"
	done

Route39BarnQuiteHealthyText:
	text "Miltank became"
	line "quite healthy!"
	done

Route39BarnTotallyHealthyText:
	text "Miltank became"
	line "totally healthy!"
	done

Route39BarnNoBerriesText:
	text "<PLAYER> has no"
	line "Oran Berries…"
	done

Route39BarnRefusedBerryText:
	text "<PLAYER> wouldn't"
	line "give a Berry."

	para "Miltank looks sad."
	done

Route39BarnMiltankText:
	text "Miltank: Mooo!"
	done

Route39Barn_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, ROUTE_39, 1
	warp_event  7,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin1Script, -1
	object_event  7,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin2Script, -1
	object_event  6,  3, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoomooScript, -1
	object_event  0,  2, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMiltank, EVENT_ROUTE_39_FARM_MON
	object_event  2,  3, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMiltank, EVENT_ROUTE_39_FARM_MON
	object_event 11,  4, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMiltank, EVENT_ROUTE_39_FARM_MON
	object_event 12,  3, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMiltank, EVENT_ROUTE_39_FARM_MON
