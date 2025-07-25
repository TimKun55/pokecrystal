	object_const_def
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_SCHOOLBOY
	const LAVENDERTOWN_OFFICER1
	const LAVENDERTOWN_OFFICER2

LavenderTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlypointCallback

LavenderTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownSchoolboyScript:
	jumptextfaceplayer LavenderTownSchoolboyText

LavenderTownOfficerScript:
	jumptextfaceplayer LavenderTownOfficerText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LavenderTownPokefanMText:
	text "That's quite some"
	line "building, eh?"

	para "It's Kanto's Radio"
	line "Tower."
	done

LavenderTownTeacherText:
	text "Kanto has many"
	line "good radio shows."
	done

LavenderTownGrampsText:
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #mon."
	done

LavenderTownSchoolboyText:
	text "You need a #"
	line "Flute to wake"
	cont "sleeping #mon."

	para "Every trainer has"
	line "to know that!"
	done

LavenderTownOfficerText:
	text "I'm sorry, we're"
	line "not letting anyone"
	cont "through until the"
	
	para "incident at the"
	line "Power Plant is"
	cont "resolved."
	done

LavenderTownSignText:
	text "Lavender Town"

	para "The Noble Purple"
	line "Town"
	done

KantoRadioStationSignText:
	text "Kanto Radio"
	line "Station"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "Lavender Volunteer"
	line "#mon House"
	done

SoulHouseSignText:
	text "Soul House"

	para "May the Souls of"
	line "#mon Rest Easy"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  7, 10, MR_FUJIS_HOUSE, 1
	warp_event  5, 15, LAVENDER_SPEECH_HOUSE, 1
	warp_event  9, 15, LAVENDER_NAME_RATER, 1
	warp_event  7,  5, LAVENDER_MART, 2
	warp_event 16, 13, SOUL_HOUSE, 1
	warp_event 16,  7, LAV_RADIO_TOWER_1F, 1
	warp_event  9, 19, ROUTE_12_LAVENDER_GATE, 1
	warp_event 10, 19, ROUTE_12_LAVENDER_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 11, 10, BGEVENT_READ, LavenderTownSign
	bg_event 13,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  5, 10, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 16, 15, BGEVENT_READ, SoulHouseSign
	bg_event  4,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  8,  5, BGEVENT_READ, LavenderMartSignText

	def_object_events
	object_event 15,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  4, 17, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 17, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  8, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTownSchoolboyScript, -1
	object_event  9, 18, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownOfficerScript, EVENT_ROUTE_5_6_OFFICER_BLOCKS_UNDERGROUND_PATH
	object_event 10, 18, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownOfficerScript, EVENT_ROUTE_5_6_OFFICER_BLOCKS_UNDERGROUND_PATH
