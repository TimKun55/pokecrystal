	object_const_def
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F1
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2
	const SAFFRONCITY_COOLTRAINER_F2

SaffronCity_MapScripts:
	def_scene_scripts
	scene_script SaffronCityNoop1Scene, SCENE_SAFFRONCITY_NOOP
	scene_script SaffronCityNoop2Scene, SCENE_SAFFRONCITY_DISGUISED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlypointCallback

SaffronCityNoop1Scene:
	end

SaffronCityNoop2Scene:
	end

SaffronCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback
	
SaffronCityDisguisedLeft:
	readvar VAR_FACING
	ifequal LEFT, .continueappear
	end
	
.continueappear
	moveobject SAFFRONCITY_COOLTRAINER_F2, 21,  8
	appear SAFFRONCITY_COOLTRAINER_F2
	pause 5
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedSlowMovementLeft
	pause 10
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedSlowMovementLeft
	pause 10
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedSlowMovementLeft
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	pause 5
	showemote EMOTE_SHOCK, SAFFRONCITY_COOLTRAINER_F2, 15
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedFastMovement
	disappear SAFFRONCITY_COOLTRAINER_F2
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_SAFFRONCITY_NOOP
	setmapscene ROUTE_5, SCENE_ROUTE5_DISGUISED
	end

SaffronCityDisguisedRight:
	readvar VAR_FACING
	ifequal RIGHT, .continueappear
	end
	
.continueappear
	moveobject SAFFRONCITY_COOLTRAINER_F2, 15,  8
	appear SAFFRONCITY_COOLTRAINER_F2
	pause 5
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedSlowMovementRight
	pause 10
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedSlowMovementRight
	pause 10
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedSlowMovementRight
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	pause 5
	showemote EMOTE_SHOCK, SAFFRONCITY_COOLTRAINER_F2, 15
	applymovement SAFFRONCITY_COOLTRAINER_F2, SaffronDisguisedFastMovement
	disappear SAFFRONCITY_COOLTRAINER_F2
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_SAFFRONCITY_NOOP
	setmapscene ROUTE_5, SCENE_ROUTE5_DISGUISED
	end

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd PokecenterSignScript

SaffronCityMartSign:
	jumpstd MartSignScript
	
SaffronDisguisedSlowMovementLeft:
	slow_step LEFT 
	step_end

SaffronDisguisedSlowMovementRight:
	slow_step RIGHT 
	step_end

SaffronDisguisedFastMovement:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

SaffronCityLass1Text:
	text "A little girl who"
	line "is an expert at"

	para "mimicking people"
	line "lives here."

	para "She even mimics"
	line "the people she's"

	para "conversing with."
	line "It's confusing."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "The Copycat girl"
	line "looked unhappy."

	para "She said she lost"
	line "her favorite #"
	cont "Doll--Clefairy."
	done

SaffronCityPokefanMText:
	text "You came out from"
	line "Johto?"

	para "You can zip back"
	line "home if the Magnet"
	cont "Train's running."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "You came out from"
	line "Johto?"

	para "You can zip back"
	line "home by hopping on"
	cont "the Magnet Train."
	done

SaffronCityCooltrainerMText:
	text "I went to the Gym,"
	line "raring for battles"
	cont "against trainers…"

	para "It turns out, I"
	line "stumbled into the"

	para "unused Gym next"
	line "door."

	para "Boy, I was pretty"
	line "embarrassed."
	done

SaffronCityCooltrainerFText:
	text "This is Silph Co.,"
	line "famous for #mon"
	cont "merchandise."

	para "In the past, Team"
	line "Rocket wanted the"

	para "company because of"
	line "that."
	done

SaffronCityFisherText:
	text "Chew… Chew…"

	para "I hear there's big"
	line "trouble brewing at"
	cont "the Power Plant."

	para "Chew… Chew…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Chew… Chew…"

	para "I hear there was"
	line "big trouble at the"
	cont "Power Plant."

	para "Chew… Chew…"
	line "Haaah, I'm full!"
	done

SaffronCityYoungster1Text:
	text "Going into an"
	line "alley for the"

	para "first time makes"
	line "me sorta anxious."
	done

SaffronCityYoungster2Text:
	text "There's a place"
	line "called Trainer"

	para "House in Viridian"
	line "where trainers"

	para "gather from all"
	line "over the place."
	done

SaffronCityLass2Text:
	text "Our city was"
	line "featured on a"
	cont "radio program."

	para "It's nice to hear"
	line "praise for your"

	para "city, but it's a"
	line "bit embarrassing"
	cont "too."
	done

SaffronCitySignText:
	text "Saffron City"

	para "Shining, Golden"
	line "Land of Commerce"
	done

SaffronGymSignText:
	text "Saffron City"
	line "#mon Gym"
	cont "Leader: Sabrina"

	para "The Master of"
	line "Psychic #mon!"
	done

FightingDojoSignText:
	text "Everyone Welcome!"
	line "Fighting Dojo"
	done

SilphCoSignText:
	text "Silph Co."
	line "Office Building"
	done

MrPsychicsHouseSignText:
	text "Mr.Psychic's"
	line "House"
	done

SaffronCityMagnetTrainStationSignText:
	text "Saffron City"
	line "Magnet Train"
	cont "Station"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  7, FIGHTING_DOJO, 1
	warp_event 32,  7, SAFFRON_GYM, 1
	warp_event 27, 13, SAFFRON_MART, 2
	warp_event 11, 31, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 31, MR_PSYCHICS_HOUSE, 1
	warp_event  7,  5, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 19, 23, SILPH_CO_1F, 1
	warp_event 11, 13, COPYCATS_HOUSE_1F, 1
	warp_event 17,  1, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 26, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 27, ROUTE_7_SAFFRON_GATE, 4
	warp_event 17, 37, ROUTE_6_SAFFRON_GATE, 1
	warp_event 18, 37, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 26, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 27, ROUTE_8_SAFFRON_GATE, 2
	warp_event  7, 25, SAFFRON_AVICULTURAL_SOCIETY_1F, 1
	warp_event 15, 31, SAFFRON_ODDISH_DOLL_HOUSE, 1

	def_coord_events
	coord_event 15,  8, SCENE_SAFFRONCITY_DISGUISED, SaffronCityDisguisedLeft
	coord_event 15,  9, SCENE_SAFFRONCITY_DISGUISED, SaffronCityDisguisedLeft
	coord_event 20,  8, SCENE_SAFFRONCITY_DISGUISED, SaffronCityDisguisedRight
	coord_event 20,  9, SCENE_SAFFRONCITY_DISGUISED, SaffronCityDisguisedRight

	def_bg_events
	bg_event  6, 28, BGEVENT_READ, SaffronCitySign
	bg_event 30,  7, BGEVENT_READ, SaffronGymSign
	bg_event 22,  7, BGEVENT_READ, FightingDojoSign
	bg_event 18, 25, BGEVENT_READ, SilphCoSign
	bg_event 25, 31, BGEVENT_READ, MrPsychicsHouseSign
	bg_event  8,  6, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 12, 31, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 28, 13, BGEVENT_READ, SaffronCityMartSign

	def_object_events
	object_event  7, 15, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event  5, 32, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 29,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 16, 27, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 30, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 24, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
	object_event 39,  0, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_POWER_PLANT_GIOVANNI
