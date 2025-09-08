	object_const_def
	const GOLDENRODHOMEDECOSTORE2_CLERK1
	const GOLDENRODHOMEDECOSTORE2_CLERK2
	const GOLDENRODHOMEDECOSTORE2_YOUNGSTER
	const GOLDENRODHOMEDECOSTORE2_BEAUTY

GoldenrodHomeDecoStore2_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHomeDecoStore2Clerk1Script:
	faceplayer
	opentext
	writetext GoldenrodHomeDecoStore2Clerk1Text
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RedCarpet
	ifequal 2, .YellowCarpet
	ifequal 3, .GreenCarpet
	sjump .Refused

.RedCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_1
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_1
	writetext BoughtRedCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext RedCarpetSentText
	waitbutton
	jump .Start

.YellowCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_3
	writetext BoughtYellowCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext YellowCarpetSentText
	waitbutton
	jump .Start

.GreenCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_4
	writetext BoughtGreenCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GreenCarpetSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecoStore2NoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecoStore2AlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetextend GoldenrodHomeDecoStore2NextTimeText

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Red C.    ¥45000@"
	db "Yellow C. ¥45000@"
	db "Green C.  ¥45000@"
	db "Cancel@"

GoldenrodHomeDecoStore2Clerk2Script:
	checkevent EVENT_DECO_CARPET_2
	iftrue .CarpetAlreadyPurchased
	faceplayer
	opentext
	special PlaceMoneyTopRight
	writetext GoldenrodHomeDecoStore2Clerk2SaleText
	yesorno
	iffalse .ClerkNoText
	checkmoney YOUR_MONEY, 35000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 35000
	setevent EVENT_DECO_CARPET_2
	writetext BoughtBlueCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext BlueCarpetSentText
	waitbutton
	writetextend GoldenrodHomeDecoStore2Clerk2YesText
	
.CarpetAlreadyPurchased:
	writetextend GoldenrodHomeDecoStore2Clerk2Text

.NotEnoughMoney:
	writetextend GoldenrodHomeDecoStore2NoMoneyText
	
.ClerkNoText:
	writetextend GoldenrodHomeDecoStore2Clerk2NoText

GoldenrodHomeDecoStore2YoungsterScript:
	jumptextfaceplayer GoldenrodHomeDecoStore2YoungsterText
	
GoldenrodHomeDecoStore2BeautyScript:
	jumptextfaceplayer GoldenrodHomeDecoStore2BeautyText
	
GoldenrodHomeDecoStore2Clerk1Text:
	text "Welcome! Would"
	line "you like a carpet?"
	done
	
GoldenrodHomeDecoStore2NextTimeText:
	text "See you next time!"
	done

GoldenrodHomeDecoStore2Clerk2Text:
	text "Doesn't a carpet"
	line "really tie your"
	cont "room together?"
	done

GoldenrodHomeDecoStore2Clerk2SaleText:
	text "Our imported"
	line "Royal Blue Carpet"
	cont "is on sale right"
	cont "now for ¥35,000."

	para "Would you like to"
	line "buy one?"
	done

GoldenrodHomeDecoStore2Clerk2YesText:
	text "Thank you!"
	line "Have a nice day!"
	done

GoldenrodHomeDecoStore2Clerk2NoText:
	text "Have a nice day!"
	done

BoughtRedCarpetText:
	text "<PLAYER> bought"
	line "Red Carpet."
	done

RedCarpetSentText:
	text "Red Carpet"
	line "was sent home."
	done

BoughtBlueCarpetText:
	text "<PLAYER> bought"
	line "Blue Carpet."
	done

BlueCarpetSentText:
	text "Blue Carpet"
	line "was sent home."
	done

BoughtYellowCarpetText:
	text "<PLAYER> bought"
	line "Yellow Carpet."
	done

YellowCarpetSentText:
	text "Yellow Carpet"
	line "was sent home."
	done

BoughtGreenCarpetText:
	text "<PLAYER> bought"
	line "Green Carpet."
	done

GreenCarpetSentText:
	text "Green Carpet"
	line "was sent home."
	done

GoldenrodHomeDecoStore2NoMoneyText:
	text "You can't afford"
	line "that!"
	done

GoldenrodHomeDecoStore2AlreadyBoughtText:
	text "You already have"
	line "that!"
	done

GoldenrodHomeDecoStore2YoungsterText:
	text "This carpet feels"
	line "so plush!"
	done

GoldenrodHomeDecoStore2BeautyText:
	text "Some of these"
	line "carpets are im-"
	cont "ported from Kalos!"
	done

GoldenrodHomeDecoStore2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_UNDERGROUND,  9
	warp_event  4,  7, GOLDENROD_UNDERGROUND, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore2Clerk1Script, -1
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore2Clerk2Script, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore2YoungsterScript, -1
	object_event  7,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore2BeautyScript, -1
