DEF GOLDENRODGAMECORNER_TM25_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_TM14_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_TM38_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_ABRA_COINS      EQU 100
DEF GOLDENRODGAMECORNER_CUBONE_COINS    EQU 800
DEF GOLDENRODGAMECORNER_WOBBUFFET_COINS EQU 1500

EXPORT GOLDENRODGAMECORNER_ABRA_COINS
EXPORT GOLDENRODGAMECORNER_CUBONE_COINS
EXPORT GOLDENRODGAMECORNER_WOBBUFFET_COINS

	object_const_def
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_PORYGONFAN

GoldenrodGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, GoldenrodGameCornerPorygonFanCallback

GoldenrodGameCornerPorygonFanCallback:
	checkitem COIN_CASE
	iffalse .PorygonFanDisappear
	readvar VAR_WEEKDAY
	ifequal MONDAY, .PorygonFanDisappear
	ifequal WEDNESDAY, .PorygonFanDisappear
	ifequal SATURDAY, .PorygonFanDisappear
	appear GOLDENRODGAMECORNER_PORYGONFAN
	endcallback

.PorygonFanDisappear
	disappear GOLDENRODGAMECORNER_PORYGONFAN
	endcallback

GoldenrodGameCornerPorygonFanScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_GAME_CORNER_GOT_PORYGON
	iftrue .LoveTravelText
	writetext GoldenrodGameCornerPorygonFanRareMonText
	yesorno
	iffalse .Refused
	refreshscreen
	pokepic PORYGON
	cry PORYGON
	waitbutton
	closepokepic
	special DisplayCoinCaseBalance
	writetext GoldenrodGameCornerPorygonFanAsk6000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 6000
	ifequal HAVE_LESS, .NotEnoughMoney
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	takecoins 6000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodGameCornerPlayerReceivedPorygonText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke PORYGON, 15
	setevent EVENT_GOLDENROD_GAME_CORNER_GOT_PORYGON
	writetext GoldenrodGameCornerPorygonFanEvolutionRumourText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_PORYGONFAN, RIGHT
	end

.Refused:
	writetext GoldenrodGameCornerPorygonFanAwwButSoCoolText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_PORYGONFAN, RIGHT
	end

.Refused2:
	writetext GoldenrodGameCornerPorygonFanHmmTooBadText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_PORYGONFAN, RIGHT
	end

.partyfull
	writetext GoldenrodGameCornerPorygonFanNoRoomText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_PORYGONFAN, RIGHT
	end

.NotEnoughMoney:
	writetext GoldenrodGameCornerPorygonFanNotEnoughText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_PORYGONFAN, RIGHT
	end

.LoveTravelText:
	writetext GoldenrodGameCornerPorygonFanLoveTravelText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_PORYGONFAN, RIGHT
	end

GoldenrodGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkitem TM_THUNDER
	iftrue GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM25_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.Blizzard:
	checkitem TM_BLIZZARD
	iftrue GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM14_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.FireBlast:
	checkitem TM_FIRE_BLAST
	iftrue GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM38_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript
	
GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript:
	writetext GoldenrodGameCornerPrizeVendorAlreadyHaveTMText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetextend GoldenrodGameCornerPrizeVendorNeedMoreCoinsText

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetextend GoldenrodGameCornerPrizeVendorNoMoreRoomText

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetextend GoldenrodGameCornerPrizeVendorQuitText

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetextend GoldenrodGameCornerPrizeVendorNoCoinCaseText

GoldenrodGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "Cancel@"

GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Abra
	ifequal 2, .Cubone
	ifequal 3, .Wobbuffet
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Abra:
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .loop

.Cubone:
	checkcoins GOLDENRODGAMECORNER_CUBONE_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, CUBONE
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins GOLDENRODGAMECORNER_CUBONE_COINS
	sjump .loop

.Wobbuffet:
	checkcoins GOLDENRODGAMECORNER_WOBBUFFET_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, WOBBUFFET
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval WOBBUFFET
	special GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
	takecoins GOLDENRODGAMECORNER_WOBBUFFET_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Abra        100@"
	db "Cubone      800@"
	db "Wobbuffet  1500@"
	db "Cancel@"

GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerCooltrainerFText

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerLeftTheirDrinkScript:
	jumptext GoldenrodGameCornerLeftTheirDrinkText

GoldenrodGameCornerSlotsMachineScript:
	random 6
	ifequal 0, GoldenrodGameCornerLuckySlotsMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerVoltorbFlipScript:
	opentext
	checkitem COIN_CASE
	iftrue .GoldenrodGameCornerWanttoPlayVoltorbFlip
	writetext GoldenrodGameCornerNoCoinCaseText
	waitbutton
	closetext
	end

.GoldenrodGameCornerWanttoPlayVoltorbFlip
	special DisplayCoinCaseBalance
	writetext GoldenrodGameCornerPlayVoltorbFlipText
	yesorno
	iftrue .PlayVoltorbFlip
	closetext
	end

.PlayVoltorbFlip
	refreshscreen
	special _VoltorbFlip
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end

GoldenrodGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done
	
GoldenrodGameCornerPrizeVendorAlreadyHaveTMText:
	text "But you already"
	line "have that TM!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a Coin Case."
	done

GoldenrodGameCornerPharmacistText:
	text "I always play this"
	line "slot machine. It"
	cont "pays out more than"
	cont "others, I think."
	done

GoldenrodGameCornerPokefanM1Text:
	text "I just love this"
	line "new Voltorb Flip"
	cont "Game they added!"

	para "It's more fun than"
	line "the Slot Machines"
	cont "or Card Flip."
	done

GoldenrodGameCornerCooltrainerMText:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

GoldenrodGameCornerPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"
	cont "it's easier to"
	cont "figure the odds."

	para "But the payout is"
	line "much lower."
	done

GoldenrodGameCornerCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

GoldenrodGameCornerGentlemanText:
	text "I taught Blizzard"
	line "to my #mon."

	para "It was hard to get"
	line "enough coins for"
	cont "it, but it was"
	cont "worth it."
	done

GoldenrodGameCornerPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"
	cont "blew it on card"
	cont "flipping…"

	para "I got so furious,"
	line "I tossed out my"
	cont "Coin Case in the"
	cont "Underground."
	done

GoldenrodGameCornerPorygonFanRareMonText:
	text "Hello there!"
	
	para "I'm from Kanto"
	line "showing off rare"
	cont "#mon."
	
	para "Oh! you're a"
	line "trainer and"
	cont "collecting badges?"
	
	para "Would you like to"
	line "see this #mon"
	cont "from Kanto?"
	done

GoldenrodGameCornerPorygonFanAsk6000CoinsOkayText:
	text "If you'd like it,"
	line "I can part with it"
	cont "for 6,000 coins."
	
	para "Is that OK?"
	done

GoldenrodGameCornerPlayerReceivedPorygonText:
	text "<PLAYER> received"
	line "a Porygon."
	done

GoldenrodGameCornerPorygonFanLoveTravelText:
	text "I love traveling"
	line "between Johto and"
	cont "Kanto."
	
	para "I get to show off"
	line "some cool #mon"
	cont "to people who have"
	cont "never seen them!"
	done

GoldenrodGameCornerPorygonFanEvolutionRumourText:
	text "It's so cool!"
	
	para "I've also heard"
	line "a rumour that"
	cont "Porygon can evolve"
	cont "but I've not seen"
	cont "it or know what"
	cont "causes it."
	done

GoldenrodGameCornerPorygonFanAwwButSoCoolText:
	text "Aww, but it's"
	line "so cool…"
	done

GoldenrodGameCornerPorygonFanHmmTooBadText:
	text "Hmm, too bad…"
	done

GoldenrodGameCornerPorygonFanNoRoomText:
	text "Sorry, you don't"
	line "have enough room"
	cont "in your Party."
	done

GoldenrodGameCornerPorygonFanNotEnoughText:
	text "Sorry, you don't"
	line "have enough coins."
	done

GoldenrodGameCornerLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

GoldenrodGameCornerNoCoinCaseText:
	text "You don't have a"
	line "Coin Case."
	done

GoldenrodGameCornerPlayVoltorbFlipText:
	text "Play Voltorb Flip?"
	done

GoldenrodGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, GOLDENROD_CITY, 12
	warp_event 10, 13, GOLDENROD_CITY, 13

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event  1,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  1,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  1,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  1,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  1, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  1, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event  7,  7, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event  7,  8, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event  7,  9, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event  7, 10, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event  7, 11, BGEVENT_LEFT, GoldenrodGameCornerVoltorbFlipScript
	bg_event 12,  6, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event 12,  7, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event 12,  8, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event 12,  9, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerVoltorbFlipScript
	bg_event 13,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, GoldenrodGameCornerLeftTheirDrinkScript

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCoinVendorScript, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event  2,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event  2,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event  3, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
	object_event 10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPorygonFanScript, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
