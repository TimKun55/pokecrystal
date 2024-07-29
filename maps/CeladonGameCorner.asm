DEF CELADONGAMECORNER_VOLTORB_DOLL_COINS    EQU 6500
DEF CELADONGAMECORNER_TENTACOOL_DOLL_COINS  EQU 6500
DEF CELADONGAMECORNER_EEVEE_DOLL_COINS      EQU 7500

	object_const_def
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M1
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUIDE
	const CELADONGAMECORNER_GRAMPS
	const CELADONGAMECORNER_POKEFAN_M2

CeladonGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerClerkScript:
	jumpstd GameCornerCoinVendorScript

CeladonGameCornerReceptionistScript:
	jumptextfaceplayer CeladonGameCornerReceptionistText

CeladonGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext CeladonGameCornerPokefanMText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_POKEFAN_M1, LEFT
	end

CeladonGameCornerTeacherScript:
	faceplayer
	opentext
	writetext CeladonGameCornerTeacherText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_TEACHER, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext CeladonGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext CeladonGameCornerFisherText1
	promptbutton
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	getstring STRING_BUFFER_4, .coinname
	scall .GiveCoins
	givecoins 250
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext CeladonGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "Coin@"

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGymGuideScript:
	jumptextfaceplayer CeladonGymGuideText

CeladonGameCornerGrampsScript:
	faceplayer
	opentext
	writetext CeladonGameCornerGrampsText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_GRAMPS, LEFT
	end

CeladonGameCornerPokefanMDollScript:
	faceplayer
	opentext
	writetext CeladonGameCorner_PokefanMDollIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonGameCorner_NoCoinCase
	writetext CeladonGameCorner_AskWhichDollText
CeladonGameCorner_dollloop:
	special DisplayCoinCaseBalance
	loadmenu CeladonGameCorner_DollMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Voltorb
	ifequal 2, .Tentacool
	ifequal 3, .Eevee
	sjump CeladonGameCorner_CancelPurchaseScript

.Voltorb:
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue CeladonGameCorner_alreadyhavedoll
	checkcoins CELADONGAMECORNER_VOLTORB_DOLL_COINS
	ifequal HAVE_LESS, CeladonGameCorner_notenoughcoins
	getitemname STRING_BUFFER_3, DECO_VOLTORB_DOLL
	scall CeladonGameCorner_askbuy
	iffalse CeladonGameCorner_CancelPurchaseScript
	giveitem DECO_VOLTORB_DOLL
	takecoins CELADONGAMECORNER_VOLTORB_DOLL_COINS
	setevent EVENT_DECO_VOLTORB_DOLL
	sjump CeladonGameCorner_purchased

.Tentacool:
	checkevent EVENT_DECO_TENTACOOL_DOLL
	iftrue CeladonGameCorner_alreadyhavedoll
	checkcoins CELADONGAMECORNER_TENTACOOL_DOLL_COINS
	ifequal HAVE_LESS, CeladonGameCorner_notenoughcoins
	getitemname STRING_BUFFER_3, DECO_TENTACOOL_DOLL
	scall CeladonGameCorner_askbuy
	iffalse CeladonGameCorner_CancelPurchaseScript
	giveitem DECO_TENTACOOL_DOLL
	takecoins CELADONGAMECORNER_TENTACOOL_DOLL_COINS
	setevent EVENT_DECO_TENTACOOL_DOLL
	sjump CeladonGameCorner_purchased

.Eevee:
	checkevent EVENT_DECO_EEVEE_DOLL
	iftrue CeladonGameCorner_alreadyhavedoll
	checkcoins CELADONGAMECORNER_EEVEE_DOLL_COINS
	ifequal HAVE_LESS, CeladonGameCorner_notenoughcoins
	getitemname STRING_BUFFER_3, DECO_EEVEE_DOLL
	scall CeladonGameCorner_askbuy
	iffalse CeladonGameCorner_CancelPurchaseScript
	giveitem DECO_EEVEE_DOLL
	takecoins CELADONGAMECORNER_EEVEE_DOLL_COINS
	setevent EVENT_DECO_EEVEE_DOLL
	sjump CeladonGameCorner_purchased

CeladonGameCorner_askbuy:
	writetext CeladonGameCorner_ConfirmPurchaseText
	yesorno
	end

CeladonGameCorner_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonGameCorner_HereYouGoText
	waitbutton
	sjump CeladonGameCorner_dollloop
	
CeladonGameCorner_alreadyhavedoll:
	writetext CeladonGameCorner_AlreadyHaveDollText
	waitbutton
	sjump CeladonGameCorner_dollloop

CeladonGameCorner_notenoughcoins:
	writetext CeladonGameCorner_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonGameCorner_CancelPurchaseScript:
	writetext CeladonGameCorner_ComeAgainText
	waitbutton
	closetext
	end

CeladonGameCorner_NoCoinCase:
	writetext CeladonGameCorner_NoCoinCaseText
	waitbutton
	closetext
	end

CeladonGameCorner_DollMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Voltorb    {d:CELADONGAMECORNER_VOLTORB_DOLL_COINS}@"
	db "Tentacool  {d:CELADONGAMECORNER_TENTACOOL_DOLL_COINS}@"
	db "Eevee      {d:CELADONGAMECORNER_EEVEE_DOLL_COINS}@"
	db "Cancel@"

CeladonGameCornerPoster1Script:
	jumptext CeladonGameCornerPoster1Text

CeladonGameCornerPoster2Script:
	jumptext CeladonGameCornerPoster2Text

CeladonGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, CeladonGameCornerSlotMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	refreshscreen
	special CardFlip
	closetext
	end

CeladonGameCornerLighterScript:
	jumptext CeladonGameCornerLighterText

CeladonGameCornerSodaCanScript:
	opentext
	writetext CeladonGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end

CeladonGameCornerReceptionistText:
	text "Welcome!"

	para "You may exchange"
	line "your coins for"

	para "fabulous prizes"
	line "next door."
	done

CeladonGameCornerPokefanMText:
	text "The slot machines"
	line "are all state of"
	cont "the art."
	done

CeladonGameCornerTeacherText:
	text "It's this machine"
	line "I want."

	para "It cleaned me out"
	line "yesterday, so it"

	para "should pay out"
	line "today."
	done

CeladonGameCornerFishingGuruText:
	text "I think this slot"
	line "machine will pay"
	cont "out…"

	para "The odds vary"
	line "among machines."
	done

CeladonGameCornerFisherText1:
	text "Gahahaha!"

	para "The coins just"
	line "keep popping out!"

	para "Hm? What, kid? You"
	line "want to play?"

	para "I'll share my luck"
	line "with you!"
	done

CeladonGameCornerFisherText2:
	text "Gahahaha!"

	para "It makes me feel"
	line "good to do nice"

	para "things for other"
	line "people!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	text "Hey, you don't"
	line "have a Coin Case."

	para "How am I supposed"
	line "to give you any"
	cont "coins, kid?"
	done

CeladonGameCornerFisherFullCoinCaseText:
	text "Hey, your Coin"
	line "Case is full, kid."

	para "You must be riding"
	line "a winning streak"
	cont "too."
	done

CeladonGymGuideText:
	text "Hey! Champ in"
	line "making!"

	para "Are you playing"
	line "the slots too?"

	para "I'm trying to get"
	line "enough coins for a"
	cont "prize #mon."

	para "But I don't have"
	line "enough coins yet…"
	done

CeladonGameCornerGrampsText:
	text "Hmmm… The odds are"
	line "surely better for"

	para "Pikachu's line,"
	line "but… What to do?"
	done

CeladonGameCornerPoster1Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

CeladonGameCornerPoster2Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

CeladonGameCornerLighterText:
	text "There's a lighter"
	line "here."
	done

CeladonGameCornerSodaCanText:
	text "A can of soda…"

	para "Someone must be"
	line "coming back…"

	para "Huh? It's empty!"
	done

CeladonGameCorner_PokefanMDollIntroText:
	text "Hello!"
	
	para "I've got a few"
	line "Dolls I can"
	cont "trade for coins."
	
	para "Just don't tell"
	line "the clerks!"
	done

CeladonGameCorner_AskWhichDollText:
	text "Which Doll would"
	line "you like?"
	done

CeladonGameCorner_ConfirmPurchaseText:
	text "OK, so you wanted"
	line "a @"
	text_ram wStringBuffer3
	text "?"
	done

CeladonGameCorner_HereYouGoText:
	text "Here you go!"
	done
	
CeladonGameCorner_AlreadyHaveDollText:
	text "You already have"
	line "that Doll."
	done

CeladonGameCorner_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CeladonGameCorner_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

CeladonGameCorner_NoCoinCaseText:
	text "Oh? You don't have"
	line "a Coin Case."
	done

CeladonGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 13, CELADON_CITY, 6
	warp_event 15, 13, CELADON_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  1,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  9, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 11, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  9, BGEVENT_READ, CeladonGameCornerSodaCanScript
	bg_event  6, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6, 11, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event  7,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7, 10, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event  7, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 18,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  0, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event  9,  0, BGEVENT_READ, CeladonGameCornerPoster2Script

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event  3,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 17,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 11,  7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 11,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuideScript, -1
	object_event  2,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
	object_event 19,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMDollScript, -1
