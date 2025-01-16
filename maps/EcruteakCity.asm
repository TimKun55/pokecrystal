	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlypointCallback

EcruteakCityFlypointCallback:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCitySchoolboyScript:
	jumptextfaceplayer EcruteakCitySchoolboyText

EcruteakCitySign:
	jumptext EcruteakCitySignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

TinTowerSign:
	jumptext TinTowerSignText

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

EcruteakCityGramps1Text:
	text "Ecruteak used to"
	line "have two towers:"

	para "one each in the"
	line "east and west."
	done

EcruteakCityGramps2Text:
	text "Ah, child."
	line "Have you learned"

	para "to dance like the"
	line "Kimono Girls?"

	para "If you go to their"
	line "Dance Theater, an"

	para "odd old man will"
	line "give you something"
	cont "nice, I hear."
	done

EcruteakCityLass1Text:
	text "I'm going to prac-"
	line "tice at the Dance"

	para "Theater. Care to"
	line "join me?"
	done

EcruteakCityLass2Text:
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Three big #mon"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

EcruteakCityFisherText:
	text "I heard a rumor"
	line "about Olivine"
	cont "Lighthouse."

	para "The #mon that"
	line "serves as the"

	para "beacon fell ill."
	line "Sounds like they"
	cont "are in trouble."
	done

EcruteakCityFisherText_JasmineReturned:
	text "The #mon at"
	line "Olivine Lighthouse"
	cont "has been cured."

	para "Boats can safely"
	line "sail out to sea at"
	cont "night again."
	done

EcruteakCitySchoolboyText:
	text "I hear #mon are"
	line "rampaging at the"

	para "Lake Of Rage. I'd"
	line "like to see that."
	done

EcruteakCityGramps3Text:
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #mon"
	line "perished in it."

	para "A rainbow-colored"
	line "#mon descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by Ecruteak"
	line "Gym Leaders."

	para "Me?"

	para "I was a trainer"
	line "way back when."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "Ecruteak City"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done

EcruteakGymSignText:
	text "Ecruteak City"
	line "#mon Gym"
	cont "Leader: Morty"

	para "The Mystic Seer of"
	line "the Future"
	done

EcruteakDanceTheaterSignText:
	text "Ecruteak Dance"
	line "Theater"
	done

BurnedTowerSignText:
	text "Burned Tower"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Please stay away,"
	line "as it is unsafe."
	done

TinTowerSignText:
	text "Tin Tower"

	para "A legendary #-"
	line "MON is said to"
	cont "roost here."
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 38, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 39, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 17, 19, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 23, 39, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 29, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 33, DANCE_THEATER, 1
	warp_event 29, 33, ECRUTEAK_MART, 2
	warp_event  6, 39, ECRUTEAK_GYM, 1
	warp_event 13, 39, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  6, 13, BURNED_TOWER_1F, 1
	warp_event 20,  4, WISE_TRIOS_ROOM, 1
	warp_event 20,  5, WISE_TRIOS_ROOM, 2
	warp_event 33, 13, TIN_TOWER_1F, 1
	warp_event  0, 30, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 31, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 13, 29, ECRUTEAK_FAIRY_FAMILY_HOUSE, 1
	warp_event 29, 39, ECRUTEAK_SWARM_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 33, BGEVENT_READ, EcruteakCitySign
	bg_event  4, 39, BGEVENT_READ, EcruteakGymSign
	bg_event 20, 33, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  8, 22, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 39, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 33, BGEVENT_READ, EcruteakCityMartSign
	bg_event 34, 14, BGEVENT_READ, TinTowerSign
	bg_event 15, 20, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 19, 33, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 41, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  4, 17, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  7, 32, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 26, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCitySchoolboyScript, -1
	object_event  8, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
