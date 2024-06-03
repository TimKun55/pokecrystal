DEF GOLDENRODHOMEDECORSTORE1F_FRESH_WATER_PRICE EQU 200
DEF GOLDENRODHOMEDECORSTORE1F_SODA_POP_PRICE    EQU 300
DEF GOLDENRODHOMEDECORSTORE1F_LEMONADE_PRICE    EQU 350

	object_const_def
	const GOLDENRODHOMEDECORSTORE1F_RECEPTIONIST
	const GOLDENRODHOMEDECORSTORE1F_CLERK
	const GOLDENRODHOMEDECORSTORE1F_BUG_MANIAC

GoldenrodHomeDecorStore1F_MapScripts:
	def_scene_scripts

	def_callbacks
	
GoldenrodHomeDecorStore1FClerkScript:
	faceplayer
	opentext
	writetext GoldenrodHomeDecorStore1FClerkText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .ChikoritaDoll
	ifequal 2, .CindaquilDoll
	ifequal 3, .TotodileDoll
	sjump .Refused

.ChikoritaDoll:
	checkmoney YOUR_MONEY, 16000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CHIKORITA_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_CHIKORITA_DOLL
	writetext BoughtChikoritaDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext ChikoritaDollSentText
	waitbutton
	jump .Start

.CindaquilDoll:
	checkmoney YOUR_MONEY, 16000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CYNDAQUIL_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_CYNDAQUIL_DOLL
	writetext BoughtCindaquilDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext CindaquilDollSentText
	waitbutton
	jump .Start

.TotodileDoll:
	checkmoney YOUR_MONEY, 16000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_TOTODILE_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_TOTODILE_DOLL
	writetext BoughtTotodileDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext TotodileDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecorStore1FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecorStore1FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext GoldenrodHomeDecorStore1FNextTimeText
	waitbutton
	closetext
	end

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "CHIKORITA  ¥16000@"
	db "CYNDAQUIL  ¥16000@"
	db "TOTODILE   ¥16000@"
	db "CANCEL@"	
	
HomeDecorVendingMachine:
	opentext
	writetext HomeDecorVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, GOLDENRODHOMEDECORSTORE1F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODHOMEDECORSTORE1F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, GOLDENRODHOMEDECORSTORE1F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODHOMEDECORSTORE1F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, GOLDENRODHOMEDECORSTORE1F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODHOMEDECORSTORE1F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext HomeDecorClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext HomeDecorVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext HomeDecorVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FRESH WATER  ¥{d:GOLDENRODHOMEDECORSTORE1F_FRESH_WATER_PRICE}@"
	db "SODA POP     ¥{d:GOLDENRODHOMEDECORSTORE1F_SODA_POP_PRICE}@"
	db "LEMONADE     ¥{d:GOLDENRODHOMEDECORSTORE1F_LEMONADE_PRICE}@"
	db "CANCEL@"
	
GoldenrodHomeDecorStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodHomeDecorStore1FReceptionistText
	
GoldenrodHomeDecorStore1FBugManiacScript:
	jumptextfaceplayer GoldenrodHomeDecorStore1FBugManiacText
	
GoldenrodHomeDecorStore1FChikoritaDollScript:
	jumptext GoldenrodHomeDecorStore1FChikoritaDollText
	
GoldenrodHomeDecorStore1FCindaquilDollScript:
	jumptext GoldenrodHomeDecorStore1FCindaquilDollText
	
GoldenrodHomeDecorStore1FTotodileDollScript:
	jumptext GoldenrodHomeDecorStore1FTotodileDollText

GoldenrodHomeDecorStore1FDirectory:
	jumptext GoldenrodHomeDecorStore1FDirectoryText

GoldenrodHomeDecorStore1FReceptionistText:
	text "Hello! Welcome to"
	line "GOLDENROD CITY"
	cont "HOME DECOR STORE!"

	para "The directory is"
	line "on the wall."
	done

GoldenrodHomeDecorStore1FClerkText:
	text "Welcome! Would you"
	line "like a DOLL as a"
	cont "souvenir?"
	done

BoughtChikoritaDollText:
	text "<PLAYER> bought"
	line "CHIKORITA DOLL."
	done

ChikoritaDollSentText:
	text "CHIKORITA DOLL"
	line "was sent home."
	done

BoughtCindaquilDollText:
	text "<PLAYER> bought"
	line "CYNDAQUIL DOLL."
	done

CindaquilDollSentText:
	text "CINDAQUIL DOLL"
	line "was sent home."
	done

BoughtTotodileDollText:
	text "<PLAYER> bought"
	line "TOTODILE DOLL."
	done

TotodileDollSentText:
	text "TOTODILE DOLL"
	line "was sent home."
	done

GoldenrodHomeDecorStore1FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

GoldenrodHomeDecorStore1FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
GoldenrodHomeDecorStore1FNextTimeText:
	text "See you next time!"
	done
	
HomeDecorVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

HomeDecorClangText:
	text "Clang! A can of"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "popped out!"
	done

HomeDecorVendingNoMoneyText:
	text "Oops, not enough"
	line "money."
	done

HomeDecorVendingNoSpaceText:
	text "There's no more"
	line "room for stuff."
	done

GoldenrodHomeDecorStore1FChikoritaDollText:
	text "It's a cute"
	line "CHIKORITA DOLL!"
	done

GoldenrodHomeDecorStore1FCindaquilDollText:
	text "It's a tough"
	line "CYNDAQUIL DOLL!"
	done

GoldenrodHomeDecorStore1FTotodileDollText:
	text "It's a cool"
	line "TOTODILE DOLL!"
	done

GoldenrodHomeDecorStore1FBugManiacText:
	text "This store opened"
	line "recently, but they"

	para "don't have any"
	line "BUG #MON DOLLS."
	done

GoldenrodHomeDecorStore1FDirectoryText:
	text "1F: Lobby"

	para "2F: Beds"

	para "3F: Carpets"

	para "4F: Jumbo Dolls"
	done

GoldenrodHomeDecorStore1F_MapEvents:
	db 0, 0 ; filler
	
	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 16
	warp_event  4,  7, GOLDENROD_CITY, 16
	warp_event  9,  0, GOLDENROD_HOME_DECOR_STORE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, GoldenrodHomeDecorStore1FDirectory
	bg_event  0,  1, BGEVENT_UP, HomeDecorVendingMachine
	bg_event  1,  1, BGEVENT_UP, HomeDecorVendingMachine

	def_object_events
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore1FReceptionistScript, -1
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore1FClerkScript, -1
	object_event  7,  5, SPRITE_CHIKORITA, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore1FChikoritaDollScript, -1
	object_event  8,  5, SPRITE_CYNDAQUIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore1FCindaquilDollScript, -1
	object_event  9,  5, SPRITE_TOTODILE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore1FTotodileDollScript, -1
	object_event  0,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore1FBugManiacScript, -1
	