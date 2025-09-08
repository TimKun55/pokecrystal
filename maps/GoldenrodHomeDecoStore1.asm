	object_const_def
	const GOLDENRODHOMEDECOSTORE1_CLERK1
	const GOLDENRODHOMEDECOSTORE1_CLERK2
	const GOLDENRODHOMEDECOSTORE1_CHIKORITA
	const GOLDENRODHOMEDECOSTORE1_CYNDAQUIL
	const GOLDENRODHOMEDECOSTORE1_TOTODILE
	const GOLDENRODHOMEDECOSTORE1_BUG_MANIAC
	const GOLDENRODHOMEDECOSTORE1_POKEFANF

GoldenrodHomeDecoStore1_MapScripts:
	def_scene_scripts

	def_callbacks
	
GoldenrodHomeDecoStore1Clerk1Script:
	faceplayer
	opentext
	writetext GoldenrodHomeDecoStore1Clerk1Text
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
	special PlaceMoneyTopRight
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
	special PlaceMoneyTopRight
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
	special PlaceMoneyTopRight
	waitbutton
	writetext TotodileDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecoStore1NoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecoStore1AlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetextend GoldenrodHomeDecoStore1NextTimeText

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Chikorita  ¥16000@"
	db "Cyndaquil  ¥16000@"
	db "Totodile   ¥16000@"
	db "Cancel@"	

GoldenrodHomeDecoStore1Clerk2Script:
	faceplayer
	opentext
	writetext GoldenrodHomeDecoStore1Clerk2Text
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PinkBed
	ifequal 2, .PolkaDotBed
	ifequal 3, .PikachuBed
	sjump .Refused

.PinkBed:
	checkmoney YOUR_MONEY, 62000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 62000
	setevent EVENT_DECO_BED_2
	writetext BoughtPinkBedText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PinkBedSentText
	waitbutton
	jump .Start

.PolkaDotBed:
	checkmoney YOUR_MONEY, 94000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 94000
	setevent EVENT_DECO_BED_3
	writetext BoughtPolkaDotBedText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PolkaDotBedSentText
	waitbutton
	jump .Start

.PikachuBed:
	checkmoney YOUR_MONEY, 126000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 126000
	setevent EVENT_DECO_BED_4
	writetext BoughtPikachuBedText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PikachuBedSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecoStore1NoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecoStore1AlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetextend GoldenrodHomeDecoStore1NextTimeText

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Pink      ¥62000@"
	db "Polkadot  ¥94000@"
	db "Pikachu  ¥126000@"
	db "Cancel@"
	
HomeDecorVendingMachine:
	jumpstd VendingMachineScript
	
GoldenrodHomeDecoStore1BugManiacScript:
	jumptextfaceplayer GoldenrodHomeDecoStore1BugManiacText

GoldenrodHomeDecoStore1PokefanfScript:
	jumptextfaceplayer GoldenrodHomeDecoStore1PokefanfText
	
GoldenrodHomeDecoStore1ChikoritaDollScript:
	jumptext GoldenrodHomeDecoStore1ChikoritaDollText
	
GoldenrodHomeDecoStore1CindaquilDollScript:
	jumptext GoldenrodHomeDecoStore1CindaquilDollText
	
GoldenrodHomeDecoStore1TotodileDollScript:
	jumptext GoldenrodHomeDecoStore1TotodileDollText

GoldenrodHomeDecoStore1ReceptionistText:
	text "Hello! Welcome to"
	line "Goldenrod City"
	cont "Home Decor Store!"

	para "The directory is"
	line "on the wall."
	done

GoldenrodHomeDecoStore1Clerk1Text:
	text "Welcome! Would you"
	line "like a cute Doll?"
	done

BoughtChikoritaDollText:
	text "<PLAYER> bought"
	line "Chikorita Doll."
	done

ChikoritaDollSentText:
	text "Chikorita Doll"
	line "was sent home."
	done

BoughtCindaquilDollText:
	text "<PLAYER> bought"
	line "Cyndaquil Doll."
	done

CindaquilDollSentText:
	text "Cyndaquil Doll"
	line "was sent home."
	done

BoughtTotodileDollText:
	text "<PLAYER> bought"
	line "Totodile Doll."
	done

TotodileDollSentText:
	text "Totodile Doll"
	line "was sent home."
	done

GoldenrodHomeDecoStore1Clerk2Text:
	text "Welcome! Are you"
	line "in the market for"
	cont "a new bed?"
	done

BoughtPinkBedText:
	text "<PLAYER> bought"
	line "Pink Bed."
	done

PinkBedSentText:
	text "Pink Bed"
	line "was sent home."
	done

BoughtPolkaDotBedText:
	text "<PLAYER> bought"
	line "Polkadot Bed."
	done

PolkaDotBedSentText:
	text "Polkadot Bed"
	line "was sent home."
	done

BoughtPikachuBedText:
	text "<PLAYER> bought"
	line "Pikachu Bed."
	done

PikachuBedSentText:
	text "Pikachu Bed"
	line "was sent home."
	done

GoldenrodHomeDecoStore1NoMoneyText:
	text "You can't afford"
	line "that!"
	done

GoldenrodHomeDecoStore1AlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
GoldenrodHomeDecoStore1NextTimeText:
	text "See you next time!"
	done
	
GoldenrodHomeDecoStore1ChikoritaDollText:
	text "It's a cute"
	line "Chikorita Doll!"
	done

GoldenrodHomeDecoStore1CindaquilDollText:
	text "It's a tough"
	line "Cyndaquil Doll!"
	done

GoldenrodHomeDecoStore1TotodileDollText:
	text "It's a cool"
	line "Totodile Doll!"
	done

GoldenrodHomeDecoStore1BugManiacText:
	text "This store opened"
	line "recently, but they"
	cont "don't have any"
	cont "Bug #mon Dolls."
	done

GoldenrodHomeDecoStore1PokefanfText:
	text "Brand-name items"
	line "cost more than"
	cont "generic ones."

	para "But the Pikachu"
	line "Bed is so cute…"
	done

GoldenrodHomeDecoStore1_MapEvents:
	db 0, 0 ; filler
	
	def_warp_events
	warp_event  3,  7, GOLDENROD_UNDERGROUND, 7
	warp_event  4,  7, GOLDENROD_UNDERGROUND, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1Clerk1Script, -1
	object_event  7,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1Clerk2Script, -1
	object_event  3,  1, SPRITE_CHIKORITA, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1ChikoritaDollScript, -1
	object_event  4,  1, SPRITE_CYNDAQUIL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1CindaquilDollScript, -1
	object_event  5,  1, SPRITE_TOTODILE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1TotodileDollScript, -1
	object_event  4,  3, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1BugManiacScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore1PokefanfScript, -1
	