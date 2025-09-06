	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWRATH
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS
	const CELADONCITY_COOLTRAINER_M
	const CELADONCITY_FRUIT_TREE1
	const CELADONCITY_FRUIT_TREE2

CeladonCity_MapScripts:
	def_scene_scripts
	scene_script CeladonCityNoop1Scene, SCENE_CELADONCITY_NOOP
	scene_script CeladonCityNoop2Scene, SCENE_CELADONCITY_DISGUISED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlypointCallback

CeladonCityNoop1Scene:
	; fallthrough
CeladonCityNoop2Scene:
	end

CeladonCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityDisguisedLeft:
	readvar VAR_FACING
	ifnotequal DOWN, .end
	moveobject CELADONCITY_COOLTRAINER_M, 25, 18
	appear CELADONCITY_COOLTRAINER_M
	pause 5
	applymovement CELADONCITY_COOLTRAINER_M, CeladonDisguisedLeftMovement
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	turnobject CELADONCITY_COOLTRAINER_M, UP
	pause 15
	showemote EMOTE_SHOCK, CELADONCITY_COOLTRAINER_M, 15
	applymovement CELADONCITY_COOLTRAINER_M, CeruleanDisguisedFastLeftMovement
	disappear CELADONCITY_COOLTRAINER_M
	turnobject PLAYER, UP
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_CELADONCITY_NOOP
	setmapscene SAFFRON_CITY, SCENE_SAFFRONCITY_DISGUISED
.end
	end

CeladonCityDisguisedRight:
	readvar VAR_FACING
	ifnotequal DOWN, .end
	moveobject CELADONCITY_COOLTRAINER_M, 26, 18
	appear CELADONCITY_COOLTRAINER_M
	pause 5
	applymovement CELADONCITY_COOLTRAINER_M, CeladonDisguisedRightMovement
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	turnobject CELADONCITY_COOLTRAINER_M, UP
	pause 15
	showemote EMOTE_SHOCK, CELADONCITY_COOLTRAINER_M, 15
	applymovement CELADONCITY_COOLTRAINER_M, CeruleanDisguisedFastRightMovement
	disappear CELADONCITY_COOLTRAINER_M
	turnobject PLAYER, UP
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_CELADONCITY_NOOP
	setmapscene SAFFRON_CITY, SCENE_SAFFRONCITY_DISGUISED
.end
	end

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	refreshscreen
	pokepic POLIWRATH
	waitbutton
	closepokepic
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHotelSign:
	jumptext CeladonCityHotelSignText

CeladonDisguisedLeftMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

CeladonDisguisedRightMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

CeruleanDisguisedFastLeftMovement:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

CeruleanDisguisedFastRightMovement:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

CeladonCityGrepaTree:
	fruittree FRUITTREE_CELADON_CITY_GREPA

CeladonCityTamatoTree:
	fruittree FRUITTREE_CELADON_CITY_TAMATO

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "This Poliwrath is"
	line "my partner."

	para "I wonder if it'll"
	line "ever evolve into a"
	cont "frog #mon."
	done

CeladonCityPoliwrathText:
	text "Poliwrath: Croak!"
	done

CeladonCityTeacher1Text:
	text "I lost at the slot"
	line "machines again…"

	para "I've got to work"
	line "hard to make more"
	cont "money so I can"
	cont "keep playing…"
	done

CeladonCityGramps1Text:
	text "Grimer have been"
	line "appearing lately."

	para "See that pond out"
	line "in front of the"
	cont "house? Grimer live"
	cont "there now."

	para "Where did they"
	line "come from? This is"
	cont "a serious problem…"
	done

CeladonCityGramps2Text:
	text "Nihihi! This Gym"
	line "is great!"

	para "Only girls are"
	line "allowed here!"
	done

CeladonCityYoungster1Text:
	text "Want to know a"
	line "secret?"

	para "Celadon Mansion"
	line "has a hidden back"
	cont "door."
	done

CeladonCityYoungster2Text:
	text "They're holding an"
	line "eating contest at"
	cont "the restaurant."

	para "Just watching them"
	line "go at it makes me"
	cont "feel bloated…"
	done

CeladonCityTeacher2Text:
	text "Celadon Dept.Store"
	line "has the biggest"
	cont "and best selection"
	cont "of merchandise."

	para "If you can't get"
	line "it there, you"
	cont "can't get it any-"
	cont "where."

	para "Gee… I sound like"
	line "a sales clerk."
	done

CeladonCityLassText:
	text "Looking at the"
	line "ground while I was"
	cont "walking made me"
	cont "dizzy."
	done

CeladonCitySignText:
	text "Celadon City"

	para "The City of"
	line "Rainbow Dreams"
	done

CeladonGymSignText:
	text "Celadon City"
	line "#mon Gym"
	cont "Leader: Erika"

	para "The Nature-Loving"
	line "Princess"
	done

CeladonCityDeptStoreSignText:
	text "Find What You"
	line "Need at Celadon"
	cont "Dept.Store!"
	done

CeladonCityMansionSignText:
	text "Celadon Mansion"
	done

CeladonCityGameCornerSignText:
	text "The Playground for"
	line "Everybody--Celadon"
	cont "Game Corner"
	done

CeladonCityTrainerTipsText:
	text "Trainer Tips"

	para "Guard Spec."
	line "protects #mon"
	cont "from having their"
	cont "stats lowered!"

	para "Get your items at"
	line "Celadon Dept."
	cont "Store!"
	done

CeladonCityHotelSignText:
	text "Celadon Hotel"

	para "Relax in our"
	line "swimming pool!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 11,  9, CELADON_DEPT_STORE_1F, 2
	warp_event 20,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 33,  9, CELADON_POKECENTER_1F, 1
	warp_event 22, 17, CELADON_GAME_CORNER, 1
	warp_event 23, 17, CELADON_GAME_CORNER, 2
	warp_event 27, 17, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 28, 17, CELADON_GAME_CORNER_PRIZE_ROOM, 2
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 29, 25, CELADON_CAFE, 1
	warp_event 25, 25, CELADON_HOME_DECO_STORE_1F, 1
	warp_event  0, 22, ROUTE_16_GATE, 3
	warp_event  0, 23, ROUTE_16_GATE, 4
	warp_event 33, 17, CELADON_CURSE_HOUSE, 1
	warp_event 36, 25, CELADON_HOTEL_1F, 1
	warp_event 29,  9, EUSINES_HOUSE, 1

	def_coord_events
	coord_event 30, 14, SCENE_CELADONCITY_DISGUISED, CeladonCityDisguisedLeft
	coord_event 31, 14, SCENE_CELADONCITY_DISGUISED, CeladonCityDisguisedRight

	def_bg_events
	bg_event 10, 20, BGEVENT_READ, CeladonCitySign
	bg_event  8, 29, BGEVENT_READ, CeladonGymSign
	bg_event  8,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 17,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 24, 19, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 36, 19, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 34,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 33, 25, BGEVENT_READ, CeladonCityHotelSign
	bg_event 39,  8, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 12, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 31, 21, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event 12, 30, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 22, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 22, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event 10, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event 12, 21, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
	object_event  0,  0, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKETS_IN_KANTO
	object_event 34, 31, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityGrepaTree, -1
	object_event 36, 31, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityTamatoTree, -1
