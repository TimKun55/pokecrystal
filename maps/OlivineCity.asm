	object_const_def
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_RIVAL
	const OLIVINECITY_SAILOR3
	const OLIVINECITY_CLERK1
	const OLIVINECITY_CLERK2
	const OLIVINECITY_CLERK3
	const OLIVINECITY_POKEFAN_M
	const OLIVINECITY_POKEFAN_F

OlivineCity_MapScripts:
	def_scene_scripts
	scene_script OlivineCityNoop1Scene, SCENE_OLIVINECITY_RIVAL_ENCOUNTER
	scene_script OlivineCityNoop2Scene, SCENE_OLIVINECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, OlivineCityMarketPlacePeople
	callback MAPCALLBACK_TILES, OlivineCityLighthouseNiteMarketPlaceStalls

OlivineCityNoop1Scene:
	end

OlivineCityNoop2Scene:
	end

OlivineCityFlypointCallback:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

OlivineCityMarketPlacePeople:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MarketPlacePeopleAppear
	ifequal SATURDAY, .MarketPlacePeopleAppear
	ifequal SUNDAY, .MarketPlacePeopleAppear
	disappear OLIVINECITY_CLERK1
	disappear OLIVINECITY_CLERK2
	disappear OLIVINECITY_CLERK3
	disappear OLIVINECITY_POKEFAN_M
	disappear OLIVINECITY_POKEFAN_F
	endcallback

.MarketPlacePeopleAppear:
	appear OLIVINECITY_CLERK1
	appear OLIVINECITY_CLERK2
	appear OLIVINECITY_CLERK3
	appear OLIVINECITY_POKEFAN_M
	appear OLIVINECITY_POKEFAN_F
	endcallback

OlivineCityLighthouseNiteMarketPlaceStalls:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MarketPlaceAppear
	ifequal SATURDAY, .MarketPlaceAppear
	ifequal SUNDAY, .MarketPlaceAppear
.continuecheck
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .end
	checktime EVE
	iftrue .LighthouseNite
	checktime NITE
	iftrue .LighthouseNite
.end
	endcallback

.MarketPlaceAppear:
	changeblock 10, 20, $d7 ; Market
	changeblock 16, 20, $d7 ; Market
	changeblock 20, 20, $d8 ; Market
	sjump .continuecheck

.LighthouseNite:
	changeblock 30, 16, $d5 ; Lighthouse nite, left
	changeblock 32, 16, $d6 ; Lighthouse nite, right
	endcallback

OlivineCityRivalSceneTop:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_RIVAL
	waitsfx
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalApproachesTopMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	applymovement PLAYER, OlivineCityPlayerStepsAsideTopMovement
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalLeavesTopMovement
	setscene SCENE_OLIVINECITY_NOOP
	disappear OLIVINECITY_RIVAL
	special RestartMapMusic
	end

OlivineCityRivalSceneBottom:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_RIVAL
	waitsfx
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalApproachesBottomMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalText
	waitbutton
	closetext
	applymovement PLAYER, OlivineCityPlayerStepsAsideBottomMovement
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalLeavesBottomMovement
	disappear OLIVINECITY_RIVAL
	setscene SCENE_OLIVINECITY_NOOP
	special RestartMapMusic
	end

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext OlivineCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySailorTutorScript:
	faceplayer
	opentext
	writetext OlivineCitySailorTutorAquaTailText
	waitbutton
	special PlaceMoneyTopRight
	writetext OlivineCitySailorTutorAquaTailText2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, .NotEnough
	yesorno
	iffalse .TutorRefused
	setval AQUA_TAIL
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext OlivineCitySailorTutorAquaTailRefused
	waitbutton
	closetext
	end
	
.TeachMove
	writetext OlivineCitySailorTutorPayment
	takemoney YOUR_MONEY, 5000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext OlivineCitySailorTutorAquaTailTaught
	waitbutton
	closetext
	end

.NotEnough
	writetext OlivineCitySailorTutorNotEnough
	waitbutton
	closetext
	end
	
OlivineCityMarketPlaceClerk1:
	faceplayer
	opentext
	pokemart MARTTYPE_MARKET1, 0
	closetext
	end

OlivineCityMarketPlaceClerk2:
	faceplayer
	opentext
	pokemart MARTTYPE_MARKET2, 0
	closetext
	end

OlivineCityMarketPlaceClerk3:
	faceplayer
	opentext
	pokemart MARTTYPE_MARKET3, 0
	closetext
	end

OlivineCityMarketPlacePokefanM:
	jumptextfaceplayer OlivineCityMarketPlacePokefanMText

OlivineCityMarketPlacePokefanF:
	jumptextfaceplayer OlivineCityMarketPlacePokefanFText

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokecenterSign:
	jumpstd PokecenterSignScript

OlivineCityMartSign:
	jumpstd MartSignScript

OlivineCityRivalApproachesTopMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step_end

OlivineCityRivalApproachesBottomMovement:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step_end

OlivineCityRivalLeavesTopMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OlivineCityRivalLeavesBottomMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OlivineCityPlayerStepsAsideTopMovement:
	step DOWN
	turn_head UP
	step_end

OlivineCityPlayerStepsAsideBottomMovement:
	step UP
	turn_head DOWN
	step_end

OlivineCityRivalText:
	text "…"

	para "You again?"

	para "There's no need to"
	line "panic. I don't"

	para "bother with wimps"
	line "like you."

	para "Speaking of weak-"
	line "lings, the city's"

	para "Gym Leader isn't"
	line "here."

	para "Supposedly taking"
	line "care of a sick"

	para "#mon at the"
	line "Lighthouse."

	para "Humph! Boo-hoo!"
	line "Just let sick"
	cont "#mon go!"

	para "A #mon that"
	line "can't battle is"
	cont "worthless!"

	para "Why don't you go"
	line "train at the"
	cont "Lighthouse?"

	para "Who knows. It may"
	line "make you a bit"
	cont "less weak!"
	done

OlivineCitySailor1Text:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the Lighthouse"

	para "to guide it, no"
	line "ship can sail."
	done

OlivineCityStandingYoungsterPokegearText:
	text "That thing you"
	line "have--it's a #-"
	cont "gear, right? Wow,"
	cont "that's cool."
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, you have a"
	line "#dex!"

	para "That is just so"
	line "awesome."
	done

OlivineCitySailor2Text:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done

OlivineCityMarketPlacePokefanMText:
	text "I love it when"
	line "it's Market Time!"
	done

OlivineCityMarketPlacePokefanFText:
	text "I always make the"
	line "journey here for"
	cont "the Market!"
	done

OlivineCitySignText:
	text "Olivine City"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "Olivin Port"
	line "Fast Ship Pier"
	done

OlivineGymSignText:
	text "Olivine City"
	line "#mon Gym"
	cont "Leader: Jasmine"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "Olivine Lighthouse"
	line "Also known as the"
	cont "Glitter Lighthouse"
	done

OlivineCityBattleTowerSignText:
	text "Battle Tower ahead"
	line "Opening Now!"
	done

OlivineCitySailorTutorAquaTailText:
	text "Ho, there, young"
	line "trainer!"
	
	para "In my travels,"
	line "I've come across"
	
	para "a useful water-"
	line "type move that I"
	
	para "can teach to your"
	line "#mon for a fee."
	done

OlivineCitySailorTutorAquaTailText2:
	text "Should I teach"
	line "Aqua Tail for"
	cont "¥5,000?"
	done

OlivineCitySailorTutorAquaTailRefused:
	text "Come back when"
	line "you like."
	done

OlivineCitySailorTutorAquaTailClear:
	text_start
	done
	
OlivineCitySailorTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥5000."
	done

OlivineCitySailorTutorAquaTailTaught:
	text "It does great"
	line "damage and can"
	
	para "lower the target's"
	line "defense stat!"
	done
	
OlivineCitySailorTutorNotEnough:
	text "Sorry, you can't"
	line "afford it."
	done
	
OlivineCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 21, OLIVINE_POKECENTER_1F, 1
	warp_event 10,  9, OLIVINE_GYM, 1
	warp_event 25, 12, OLIVINE_TIMS_HOUSE, 1
	warp_event 11, 14, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 17, 14, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 21, OLIVINE_CAFE, 1
	warp_event 23, 21, OLIVINE_MART, 2
	warp_event 31, 21, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 31, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 31, OLIVINE_PORT_PASSAGE, 2

	def_coord_events
	coord_event 13, 10, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalSceneTop
	coord_event 13, 11, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalSceneBottom

	def_bg_events
	bg_event 16,  8, BGEVENT_READ, OlivineCitySign
	bg_event 17, 25, BGEVENT_READ, OlivineCityPortSign
	bg_event  8,  9, BGEVENT_READ, OlivineGymSign
	bg_event 32, 26, BGEVENT_READ, OlivineLighthouseSign
	bg_event  4, 24, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 14, 21, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 24, 21, BGEVENT_READ, OlivineCityMartSign

	def_object_events
	object_event 25, 25, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 19, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, -1
	object_event 19, 26, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 10,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event  6, 25, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailorTutorScript, -1
	object_event 10, 20, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityMarketPlaceClerk1, EVENT_OLIVINE_MARKET_CLERK_1
	object_event 16, 20, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityMarketPlaceClerk2, EVENT_OLIVINE_MARKET_CLERK_2
	object_event 21, 20, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityMarketPlaceClerk3, EVENT_OLIVINE_MARKET_CLERK_3
	object_event 11, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivineCityMarketPlacePokefanM, EVENT_OLIVINE_MARKET_CUSTOMERS
	object_event 15, 17, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, OlivineCityMarketPlacePokefanF, EVENT_OLIVINE_MARKET_CUSTOMERS
