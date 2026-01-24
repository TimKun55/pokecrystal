DEF ROUTE39FARMHOUSE_MILK_PRICE_SINGLE EQU 500
DEF ROUTE39FARMHOUSE_MILK_PRICE_DOZEN EQU 6000

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO	
	writetextend FarmerMText_SickCow

FarmerMScript_SellMilk:
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale

.loop
	writetext FarmerMText_WhatCanIGetcha
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy1Bottle
	ifequal 2, .Buy1Dozen
	sjump FarmerMScript_NoSale

.Buy1Bottle:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE_SINGLE
	ifequal HAVE_LESS, FarmerMText_NoMoney
	verbosegiveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, 500
	waitsfx
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext FarmerMText_GotMilk
	waitbutton
	writetext FarmerMText_BuyMore
	yesorno
	iffalse FarmerMScript_NoSale
	sjump .loop

.Buy1Dozen:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE_DOZEN
	ifequal HAVE_LESS, FarmerMText_NoMoney
	verbosegiveitem MOOMOO_MILK, 13
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, 6000
	waitsfx
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext FarmerMText_GotMilk
	waitbutton
	writetext FarmerMText_BuyMore
	yesorno
	iffalse FarmerMScript_NoSale
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 18, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "1 Bottle:  ¥500@"
	db "1 Dozen : ¥6000@"
	db "Cancel@"

FarmerMScript_NoMoney:
	writetextend FarmerMText_NoMoney

FarmerMScript_NoRoom:
	writetextend FarmerMText_NoRoom

FarmerMScript_NoSale:
	writetextend FarmerMText_NoSale

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetextend FarmerFText_InTrouble

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetextend FarmerFText_SnoreSpeech

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "My Miltank ain't"
	line "givin' me milk"
	cont "n'more."

	para "This here Farm's"
	line "got famous milk."

	para "Most everyone"
	line "wants a drink."

	para "It'll give me lots"
	line "o' milk if'n I"
	cont "feed it lots o'"
	cont "Berries, I reckon."
	done

FarmerMText_BuyMilk:
	text "How'd you like my"
	line "Moomoo Milk?"

	para "It's my pride and"
	line "joy, there."

	para "Give it to #mon"
	line "to restore HP!"

	para "I'll give ya some"
	line "fer just ¥{d:ROUTE39FARMHOUSE_MILK_PRICE_SINGLE}."
	done

FarmerMText_GotMilk:
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done

FarmerMText_WhatCanIGetcha:
	text "What can I getcha?"
	done

FarmerMText_BuyMore:
	text "You fancy some"
	line "more?"
	done

FarmerMText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

FarmerMText_NoRoom:
	text "I reckon yer"
	line "Pack's full."
	done

FarmerMText_NoSale:
	text "You don't want"
	line "any milk?"
	cont "Come again, hear?"
	done

FarmerFText_InTrouble:
	text "Our milk even goes"
	line "out to Kanto."

	para "So if our own"
	line "Miltank won't give"
	cont "us any milk, we're"
	cont "in trouble."
	done

FarmerFText_HealedMiltank:
	text "You fixed our"
	line "Miltank, hon. Now"

	para "it gives Moomoo"
	line "Milk again."

	para "Here's somethin'"
	line "fer your trouble."
	done

FarmerFText_SnoreSpeech:
	text "That there's"
	line "Snore."

	para "It's a rare move"
	line "that only works"
	cont "while the #mon"
	cont "is asleep."

	para "You best think how"
	line "you ought to use"
	cont "it, hon."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 3
	warp_event  3,  7, ROUTE_39, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
