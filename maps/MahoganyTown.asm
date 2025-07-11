DEF MAHOGANYTOWN_RAGECANDYBAR_PRICE EQU 300

	object_const_def
	const MAHOGANYTOWN_HIKER
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS

MahoganyTown_MapScripts:
	def_scene_scripts
	scene_script MahoganyTownNoop1Scene, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR
	scene_script MahoganyTownNoop2Scene, SCENE_MAHOGANYTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlypointCallback

MahoganyTownNoop1Scene:
	end

MahoganyTownNoop2Scene:
	end

MahoganyTownFlypointCallback:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_HIKER, 15
	applymovement MAHOGANYTOWN_HIKER, MahoganyTownRageCandyBarMerchantBlocksYouMovement
	follow PLAYER, MAHOGANYTOWN_HIKER
	applymovement PLAYER, MahoganyTownPlayerStepLeftMovement
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_HIKER, MahoganyTownRageCandyBarMerchantReturnsMovement
	end

MahoganyTownHikerScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	scall .SellRageCandyBars
	end

.ClearedRocketHideout:
	opentext
	writetext RageCandyBarMerchantSoldOutText
	waitbutton
	closetext
	end

.SellRageCandyBars:
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	special PlaceMoneyTopRight
	writetext RageCandyBarMerchantSavorItText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext RageCandyBarMerchantNotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext RageCandyBarMerchantRefusedText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RageCandyBarMerchantNoRoomText
	waitbutton
	closetext
	end

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText
	
MahoganyMoveTutorHouseSign:
	jumptext MahoganyMoveTutorHouseSignText
	
MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd PokecenterSignScript

MahoganyTownPlayerStepLeftMovement:
	step LEFT
	step_end

MahoganyTownRageCandyBarMerchantBlocksYouMovement:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MahoganyTownRageCandyBarMerchantReturnsMovement:
	step UP
	turn_head DOWN
	step_end

RageCandyBarMerchantTryOneText:
	text "Hiya, kid!"

	para "I see you're new"
	line "in Mahogany Town."

	para "Since you're new,"
	line "you should try a"

	para "yummy RageCandy-"
	line "Bar!"

	para "Right now, it can"
	line "be yours for just"
	cont "¥300! Want one?"
	done

RageCandyBarMerchantSavorItText:
	text "Good! Savor it!"
	done

RageCandyBarMerchantNotEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

RageCandyBarMerchantRefusedText:
	text "Oh, fine then…"
	done

RageCandyBarMerchantNoRoomText:
	text "You don't have"
	line "room for this."
	done

RageCandyBarMerchantSoldOutText:
	text "RageCandyBar's"
	line "sold out."

	para "I'm packing up."
	line "Don't bother me,"
	cont "kiddo."
	done

MahoganyTownGrampsText:
	text "Are you off to see"
	line "the Gyarados ram-"
	cont "page at the Lake?"
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "Magikarp have"
	line "returned to Lake"
	cont "Of Rage."

	para "That should be"
	line "good news for the"
	cont "anglers there."
	done

MahoganyTownFisherText:
	text "Since you came"
	line "this far, take the"

	para "time to do some"
	line "sightseeing."

	para "You should head"
	line "north and check"

	para "out Lake Of Rage"
	line "right now."
	done

MahoganyTownLassText:
	text "Visit Grandma's"
	line "shop. She sells"

	para "stuff that nobody"
	line "else has."
	done

MahoganyTownSignText:
	text "Mahogany Town"

	para "Welcome to the"
	line "Home of the Ninja"
	done

MahoganyTownRagecandybarSignText:
	text "While visiting"
	line "Mahogany Town, try"
	cont "a RageCandyBar!"
	done
	
MahoganyMoveTutorHouseSignText:
	text "Mahogany Move"
	line "Tutor's House"
	done

MahoganyGymSignText:
	text "Mahogany Town"
	line "#mon Gym"
	cont "Leader: Pryce"

	para "The Teacher of"
	line "Winter's Harshness"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3
	warp_event 10,  1, ROUTE_43_MAHOGANY_GATE, 4
	warp_event  3,  5, MAHOGANY_MOVE_TUTOR_HOUSE, 1

	def_coord_events
	coord_event 19,  8, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript

	def_bg_events
	bg_event  7,  4, BGEVENT_READ, MahoganyTownSign
	bg_event 11,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  4, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign
	bg_event  1,  5, BGEVENT_READ, MahoganyMoveTutorHouseSign

	def_object_events
	object_event 19,  8, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownHikerScript, EVENT_MAHOGANY_TOWN_HIKER_BLOCKS_EAST
	object_event  5,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_FISHER_BLOCKS_GYM
	object_event 14,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
