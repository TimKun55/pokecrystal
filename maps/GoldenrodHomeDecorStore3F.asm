	object_const_def
	const GOLDENRODHOMEDECORSTORE3F_CLERK1
	const GOLDENRODHOMEDECORSTORE3F_CLERK2
	const GOLDENRODHOMEDECORSTORE3F_YOUNGSTER
	const GOLDENRODHOMEDECORSTORE3F_BEAUTY

GoldenrodHomeDecorStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHomeDecorStore3FClerk1Script:
	faceplayer
	opentext
	writetext GoldenrodHomeDecorStore3FClerk1Text
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
	waitbutton
	writetext GreenCarpetSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecorStore3FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecorStore3FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext GoldenrodHomeDecorStore3FNextTimeText
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
	db "RED C.    ¥45000@"
	db "YELLOW C. ¥45000@"
	db "GREEN C.  ¥45000@"
	db "CANCEL@"

GoldenrodHomeDecorStore3FClerk2Script:
	checkevent EVENT_DECO_CARPET_2
	iftrue .CarpetAlreadyPurchased
	faceplayer
	opentext
	special PlaceMoneyTopRight
	writetext GoldenrodHomeDecorStore3FClerk2SaleText
	yesorno
	iffalse .ClerkNoText
	checkmoney YOUR_MONEY, 35000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 35000
	setevent EVENT_DECO_CARPET_2
	writetext BoughtBlueCarpetText
	playsound SFX_TRANSACTION
	waitbutton
	writetext BlueCarpetSentText
	waitbutton
	writetext GoldenrodHomeDecorStore3FClerk2YesText
	waitbutton
	closetext
	end
	
.CarpetAlreadyPurchased:
	writetext GoldenrodHomeDecorStore3FClerk2Text
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodHomeDecorStore3FNoMoneyText
	waitbutton
	closetext
	end
	
.ClerkNoText:
	writetext GoldenrodHomeDecorStore3FClerk2NoText
	waitbutton
	closetext
	end

GoldenrodHomeDecorStore3FYoungsterScript:
	jumptextfaceplayer GoldenrodHomeDecorStore3FYoungsterText
	
GoldenrodHomeDecorStore3FBeautyScript:
	jumptextfaceplayer GoldenrodHomeDecorStore3FBeautyText
	
GoldenrodHomeDecorStore3FDirectory:
	jumptext GoldenrodHomeDecorStore3FDirectoryText

GoldenrodHomeDecorStore3FClerk1Text:
	text "Welcome! Would"
	line "you like a carpet?"
	done
	
GoldenrodHomeDecorStore3FNextTimeText:
	text "See you next time!"
	done

GoldenrodHomeDecorStore3FClerk2Text:
	text "Doesn't a carpet"
	line "really tie your"
	cont "room together?"
	done

GoldenrodHomeDecorStore3FClerk2SaleText:
	text "Our imported"
	line "ROYAL BLUE Carpet"

	para "is on sale right"
	line "now for ¥35,000."

	para "Would you like to"
	line "buy one?"
	done

GoldenrodHomeDecorStore3FClerk2YesText:
	text "Thank you!"
	line "Have a nice day!"
	done

GoldenrodHomeDecorStore3FClerk2NoText:
	text "Have a nice day!"
	done

BoughtRedCarpetText:
	text "<PLAYER> bought"
	line "RED CARPET."
	done

RedCarpetSentText:
	text "RED CARPET"
	line "was sent home."
	done

BoughtBlueCarpetText:
	text "<PLAYER> bought"
	line "BLUE CARPET."
	done

BlueCarpetSentText:
	text "BLUE CARPET"
	line "was sent home."
	done

BoughtYellowCarpetText:
	text "<PLAYER> bought"
	line "YELLOW CARPET."
	done

YellowCarpetSentText:
	text "YELLOW CARPET"
	line "was sent home."
	done

BoughtGreenCarpetText:
	text "<PLAYER> bought"
	line "GREEN CARPET."
	done

GreenCarpetSentText:
	text "GREEN CARPET"
	line "was sent home."
	done

GoldenrodHomeDecorStore3FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

GoldenrodHomeDecorStore3FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done

GoldenrodHomeDecorStore3FYoungsterText:
	text "This carpet feels"
	line "so plush!"
	done

GoldenrodHomeDecorStore3FBeautyText:
	text "Some of these"
	line "carpets are im-"
	cont "ported from KALOS!"
	done

GoldenrodHomeDecorStore3FDirectoryText:
	text "Colorful Elegance"

	para "3F: Carpets"
	done

GoldenrodHomeDecorStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, GOLDENROD_HOME_DECOR_STORE_2F, 2
	warp_event  9,  0, GOLDENROD_HOME_DECOR_STORE_4F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, GoldenrodHomeDecorStore3FDirectory

	def_object_events
	object_event  7,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore3FClerk1Script, -1
	object_event  8,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore3FClerk2Script, -1
	object_event  3,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore3FYoungsterScript, -1
	object_event  9,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore3FBeautyScript, -1
