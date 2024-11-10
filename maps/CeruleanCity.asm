	object_const_def
	const CERULEANCITY_COOLTRAINER_M1
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWBRO
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_BIRD_KEEPER
	const CERULEANCITY_YOUNGSTER
	const CERULEANCITY_COOLTRAINER_M2

CeruleanCity_MapScripts:
	def_scene_scripts
	scene_script CeruleanCityNoop1Scene, SCENE_CERULEANCITY_NOOP
	scene_script CeruleanCityNoop2Scene, SCENE_CERULEANCITY_DISGUISED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlypointCallback

CeruleanCityNoop1Scene:
	end

CeruleanCityNoop2Scene:
	end

CeruleanCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCityDisguisedLeft:
	readvar VAR_FACING
	ifequal UP, .continueappearleft
	end
	
.continueappearleft
	moveobject CERULEANCITY_COOLTRAINER_M2, 21, 29
	appear CERULEANCITY_COOLTRAINER_M2
	pause 5
	applymovement CERULEANCITY_COOLTRAINER_M2, CeruleanDisguisedMovement
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	pause 15
	turnobject CERULEANCITY_COOLTRAINER_M2, UP
	pause 15
	showemote EMOTE_SHOCK, CERULEANCITY_COOLTRAINER_M2, 15
	applymovement CERULEANCITY_COOLTRAINER_M2, CeruleanDisguisedFastMovement
	disappear CERULEANCITY_COOLTRAINER_M2
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_CERULEANCITY_NOOP
	setmapscene SAFFRON_CITY, SCENE_SAFFRONCITY_DISGUISED
	end

CeruleanCityDisguisedRight:
	readvar VAR_FACING
	ifequal UP, .continueappearright
	end
	
.continueappearright
	moveobject CERULEANCITY_COOLTRAINER_M2, 22, 29
	appear CERULEANCITY_COOLTRAINER_M2
	pause 5
	applymovement CERULEANCITY_COOLTRAINER_M2, CeruleanDisguisedMovement
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	pause 15
	turnobject CERULEANCITY_COOLTRAINER_M2, UP
	pause 15
	showemote EMOTE_SHOCK, CERULEANCITY_COOLTRAINER_M2, 15
	applymovement CERULEANCITY_COOLTRAINER_M2, CeruleanDisguisedFastMovement
	disappear CERULEANCITY_COOLTRAINER_M2
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_CERULEANCITY_NOOP
	setmapscene SAFFRON_CITY, SCENE_SAFFRONCITY_DISGUISED
	end

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	refreshscreen
	pokepic SLOWBRO
	waitbutton
	closepokepic
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityBirdKeeperScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityBirdKeeperText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityBirdKeeperRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd PokecenterSignScript

CeruleanCityMartSign:
	jumpstd MartSignScript

CeruleanDisguisedMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

CeruleanDisguisedFastMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "Kanto's Power"
	line "Plant?"

	para "It's near the end"
	line "of Route 9, the"

	para "road that heads"
	line "east from here."

	para "I think there was"
	line "an accident of"
	cont "some sort there."
	done

CeruleanCityCooltrainerMText2:
	text "You're collecting"
	line "every single kind"
	cont "of #mon?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done

CeruleanCitySuperNerdText:
	text "The Cape in the"
	line "north is a good"

	para "place for dates."
	line "Girls like it!"
	done

CeruleanCitySlowbroText:
	text "Slowbro: Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "My Slowbro and I"
	line "make an awesome"
	cont "combination!"
	done

CeruleanCityCooltrainerFText2:
	text "Slowbro, show me"
	line "your Confusion!"
	done

CeruleanCityCooltrainerFText3:
	text "…"
	done

CeruleanCityBirdKeeperText:
	text "I'm a huge fan of"
	line "Cerulean Gym's"
	cont "Misty."
	done

CeruleanCityBirdKeeperRocketTipText:
	text "I saw this shady"
	line "guy go off toward"
	cont "Cerulean's Cape."
	done

CeruleanCityYoungsterText1:
	text "There used to be a"
	line "cave here that had"

	para "horribly powerful"
	line "#mon in it."
	done

CeruleanCityYoungsterText2:
	text "Ayuh?"

	para "My Itemfinder is"
	line "responding…"
	done

CeruleanCitySignText:
	text "Cerulean City"

	para "A Mysterious Blue"
	line "Aura Surrounds It"
	done

CeruleanGymSignText:
	text "Cerulean City"
	line "#mon Gym"
	cont "Leader: Misty"

	para "The Tomboyish"
	line "Mermaid"
	done

CeruleanBikeShopSignText:
	text "There's a notice"
	line "here…"

	para "The Bike Shop has"
	line "moved to Goldenrod"
	cont "City in Johto…"
	done

CeruleanPoliceSignText:
	text "There's a notice"
	line "here…"

	para "Stamp out thievery"
	line "and make the city"

	para "a friendlier, more"
	line "cheerful place!"

	para "Cerulean Police"
	done

CeruleanCapeSignText:
	text "Cerulean Cape"
	line "ahead"
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 31, 13, CERULEAN_POLICE_STATION, 1
	warp_event 15, 21, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 28, 21, CERULEAN_GYM, 1
	warp_event 19, 27, CERULEAN_MART, 2
	warp_event  9, 15, CERULEAN_EMPTY_HOUSE, 1

	def_coord_events
	coord_event 26, 27, SCENE_CERULEANCITY_DISGUISED, CeruleanCityDisguisedLeft
	coord_event 27, 27, SCENE_CERULEANCITY_DISGUISED, CeruleanCityDisguisedRight

	def_bg_events
	bg_event 28, 24, BGEVENT_READ, CeruleanCitySign
	bg_event 26, 21, BGEVENT_READ, CeruleanGymSign
	bg_event  9, 27, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 29, 13, BGEVENT_READ, CeruleanPoliceSign
	bg_event 22,  8, BGEVENT_READ, CeruleanCapeSign
	bg_event 11, 27, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 20, 27, BGEVENT_READ, CeruleanCityMartSign
	bg_event  3, 10, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	def_object_events
	object_event  9, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 29, 26, SPRITE_SLOWBRO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 30, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 15, 27, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityBirdKeeperScript, -1
	object_event  8, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 39,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_POWER_PLANT_GIOVANNI
