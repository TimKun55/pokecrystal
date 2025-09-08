	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	jumptextfaceplayer PewterCityGrampsText

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityRawstTree:
	fruittree FRUITTREE_PEWTER_CITY_RAWST

PewterCityChestoTree:
	fruittree FRUITTREE_PEWTER_CITY_CHESTO

PewterCityCooltrainerFText:
	text "Have you visited"
	line "Pewter Gym?"

	para "The Leader uses"
	line "rock-type #mon."
	done

PewterCityBugCatcherText:
	text "At night, Clefairy"
	line "come out to play"
	cont "at Mt.Moon."

	para "But not every"
	line "night."
	done

PewterCityGrampsText:
	text "Ah, you came all"
	line "the way out here"
	cont "from Johto?"

	para "Did you come via"
	line "the Magnet Train,"
	cont "the S.S.Aqua or"
	cont "from Route 22?"

	para "It's amazing how"
	line "connected we are!"
	done

PewterCitySignText:
	text "Pewter City"
	line "A Stone Gray City"
	done

PewterGymSignText:
	text "Pewter City"
	line "#mon Gym"
	cont "Leader: Brock"

	para "The Rock Solid"
	line "#mon Trainer"
	done

PewterMuseumSignText:
	text "Pewter Museum"
	line "of Science."
	done

PewterCityMtMoonGiftShopSignText:
	text "There's a notice"
	line "here…"

	para "Mt.Moon Gift Shop"
	line "Now open!"
	done

PewterCityWelcomeSignText:
	text "Welcome to"
	line "Pewter City!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25, 12, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 10, 15, PEWTER_GYM, 1
	warp_event 21, 19, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 28, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 18,  6, PEWTER_MUSEUM_1F, 1

	def_coord_events

	def_bg_events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event  8, 15, BGEVENT_READ, PewterGymSign
	bg_event 21,  8, BGEVENT_READ, PewterMuseumSign
	bg_event 35, 16, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 16, 25, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 22, 19, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 30, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 15, 28, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 28, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 31,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityRawstTree, -1
	object_event 26,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityChestoTree, -1
