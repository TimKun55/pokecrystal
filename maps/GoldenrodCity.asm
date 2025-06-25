	object_const_def
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_MOVETUTOR
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET_GIRL1
	const GOLDENRODCITY_ROCKET_GIRL2

GoldenrodCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodCityFlypointAndFloriaCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodCityMoveTutorCallback
	callback MAPCALLBACK_TILES, GoldenrodCityRocketTakeover

GoldenrodCityFlypointAndFloriaCallback:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	endcallback

GoldenrodCityMoveTutorCallback:
	checkevent EVENT_TEAM_ROCKET_DISBANDED
	iffalse .MoveTutorDisappear
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MoveTutorAppear
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	endcallback

.MoveTutorAppear:
	appear GOLDENRODCITY_MOVETUTOR
	endcallback

GoldenrodCityRocketTakeover:
	checkevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	iffalse .RocketTakeover
	endcallback

.RocketTakeover:
	changeblock 6,  4, $b7 ; rocket takeover
	changeblock 6,  6, $bb ; rocket takeover
	changeblock 6,  8, $bf ; rocket takeover	
	changeblock 6, 10, $c3 ; rocket takeover
	changeblock 4, 12, $c8 ; rocket takeover
	changeblock 6, 12, $c9 ; rocket takeover
	changeblock 8, 12, $ca ; rocket takeover
	endcallback

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWontRegretText
	waitbutton
.TutorLoop:
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Refused

.Flamethrower:
	setval MT01_MOVE
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.Thunderbolt:
	setval MT02_MOVE
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.IceBeam:
	setval MT03_MOVE
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Flamethrower@"
	db "Thunderbolt@"
	db "Ice Beam@"
	db "Cancel@"

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocketGirl1Script:
	faceplayer
	opentext
	writetext GoldenrodCityRocketGirl1Text
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .RocketGirlPushDown
	ifequal LEFT, .RocketGirlPushRight
	playsound SFX_TACKLE
	applymovement PLAYER, GoldenrodCity_RocketGirlPushesYouLeft
.finishRocketGirl
	turnobject GOLDENRODCITY_ROCKET_GIRL1, UP
	end
	
.RocketGirlPushDown
	playsound SFX_TACKLE
	applymovement PLAYER, GoldenrodCity_RocketGirlPushesYouDown
	sjump .finishRocketGirl

.RocketGirlPushRight
	playsound SFX_TACKLE
	applymovement PLAYER, GoldenrodCity_RocketGirlPushesYouRight
	sjump .finishRocketGirl

GoldenrodCityRocketGirl2Script:
	jumptextfaceplayer GoldenrodCityRocketGirl2Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd PokecenterSignScript

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCity_RocketGirlPushesYouLeft:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

GoldenrodCity_RocketGirlPushesYouDown:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

GoldenrodCity_RocketGirlPushesYouRight:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

GoldenrodCityPokefanMText:
	text "They built the new"
	line "Radio Tower to"

	para "replace the old,"
	line "creaky one."
	done

GoldenrodCityYoungster1Text:
	text "I know there's a"
	line "new Bike Shop, but"

	para "I can't find it"
	line "anywhere."
	done

GoldenrodCityCooltrainerF1Text:
	text "Is that man in"
	line "black dressed up"

	para "like a Team Rocket"
	line "member? How silly!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "Was that man in"
	line "black really part"

	para "of Team Rocket? I"
	line "can't believe it!"
	done

GoldenrodCityCooltrainerF2Text:
	text "The Radio Tower in"
	line "Goldenrod City is"
	cont "a landmark."

	para "They're running a"
	line "promotional cam- "
	cont "paign right now."

	para "They'll modify"
	line "your #gear,"

	para "so it can also"
	line "serve as a radio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "Oh, your #gear"
	line "works as a radio!"
	done

GoldenrodCityYoungster2Text:
	text "E-he-he-he…"

	para "I got in trouble"
	line "for playing in the"

	para "basement of the"
	line "Dept.Store."
	done

GoldenrodCityLassText:
	text "The man at that"
	line "house rates your"
	cont "#mon names."

	para "He can even rename"
	line "your #mon."
	done

GoldenrodCityGrampsText:
	text "Whew! This is one"
	line "big town. I don't"

	para "know where any-"
	line "thing is."
	done

GoldenrodCityRocketScoutText1:
	text "So this is the"
	line "Radio Tower…"
	done

GoldenrodCityRocketScoutText2:
	text "What do you want,"
	line "you pest? Scram!"
	done

GoldenrodCityRocket1Text:
	text "Stay out of the"
	line "way! Beat it!"
	done

GoldenrodCityRocket2Text:
	text "Take over the"
	line "Radio Tower…"

	para "What? It's none of"
	line "your business!"
	done

GoldenrodCityRocket3Text:
	text "#mon? They're"
	line "nothing more than"

	para "tools for making"
	line "money!"
	done

GoldenrodCityRocketGirl1Text:
	text "What? What do"
	line "you want?"
	
	para "Can't you see"
	line "we're busy with"
	cont "the Gym Leader?"
	
	para "She's so tough…"
	done

GoldenrodCityRocketGirl2Text:
	text "Hehe, this city"
	line "belongs to us now!"
	done

GoldenrodCityStationSignText:
	text "Goldenrod City"
	line "Station"
	done

GoldenrodCityRadioTowerSignText:
	text "Goldenrod City"
	line "Radio Tower"
	done

GoldenrodDeptStoreSignText:
	text "Full Selection of"
	line "#mon Goods!"

	para "Goldenrod City"
	line "Dept.Store"
	done

GoldenrodGymSignText:
	text "Goldenrod Gym"
	line "#mon Gym"
	cont "Leader: Whitney"

	para "The Incredibly"
	line "Pretty Girl!"
	done

GoldenrodCitySignText:
	text "Goldenrod City"

	para "The Festive City"
	line "of Opulent Charm"
	done

GoldenrodCityBikeShopSignText:
	text "The World is a"
	line "Cycle Path!"
	cont "Bike Shop"
	done

GoldenrodCityGameCornerSignText:
	text "Your Playground!"

	para "Goldenrod City"
	line "Game Corner"
	done

GoldenrodCityNameRaterSignText:
	text "Name Rater"

	para "Get Your #mon"
	line "Nicknames Rated"
	done

GoldenrodCityUndergroundSignNorthText:
	text "Underground"
	line "Entrance"
	done

GoldenrodCityUndergroundSignSouthText:
	text "Underground"
	line "Entrance"
	done

GoldenrodCityFlowerShopSignText:
	text "Blooming Beautiful"
	line "Flower Shop"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "I can teach your"
	line "#mon amazing"

	para "moves if you'd"
	line "like."

	para "Should I teach a"
	line "new move?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "It will cost you"
	line "4000 coins. Okay?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Aww… But they're"
	line "amazing…"
	done

GoldenrodCityMoveTutorWontRegretText:
	text "Wahahah! You won't"
	line "regret it!"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "Which move should"
	line "I teach?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "Wahahah!"
	line "Farewell, kid!"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "…You don't have"
	line "enough coins here…"
	done

GoldenrodCityMoveTutorMoveText:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  7, GOLDENROD_GYM, 1
	warp_event 31, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 29, 15, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  7, 27, BILLS_FAMILYS_HOUSE, 1
	warp_event 12, 15, GOLDENROD_MAGNET_TRAIN_STATION, 1
	warp_event 13, 15, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 31,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33, 21, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 17,  7, GOLDENROD_NAME_RATER, 1
	warp_event 26, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 27, 27, GOLDENROD_DEPT_STORE_1F, 2
	warp_event 16, 21, GOLDENROD_GAME_CORNER, 1
	warp_event 17, 21, GOLDENROD_GAME_CORNER, 2
	warp_event  6, 13, RADIO_TOWER_1F, 1
	warp_event  7, 13, RADIO_TOWER_1F, 2
	warp_event 21,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event 22,  1, ROUTE_35_GOLDENROD_GATE, 4
	warp_event 13,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 13, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 17, 27, GOLDENROD_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 16, 15, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  8, 14, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 24, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 29, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 24,  7, BGEVENT_READ, GoldenrodGymSign
	bg_event 26, 15, BGEVENT_READ, GoldenrodCitySign
	bg_event 30, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 14, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 15,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event 12,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 18, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	def_object_events
	object_event  7, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 25, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 23, 22, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 24, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 18,  9, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  7, 23, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 18, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 31, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  9, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 15, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 26,  8, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketGirl1Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 23, 28, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketGirl2Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
