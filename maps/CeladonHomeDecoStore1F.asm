	object_const_def
	const CELADONHOMEDECOSTORE1F_CLERK1
	const CELADONHOMEDECOSTORE1F_CLERK2
	const CELADONHOMEDECOSTORE1F_POKEFANF

CeladonHomeDecoStore1F_MapScripts:
	def_scene_scripts

	def_callbacks
	
CeladonHomeDecoStore1FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecoStore1FClerk1Text
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader1
	verticalmenu
	closewindow
	ifequal 1, .MagnaPlant
	ifequal 2, .TropicPlant
	ifequal 3, .JumboPlant
	sjump .Refused

.MagnaPlant:
	checkmoney YOUR_MONEY, 30000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 30000
	setevent EVENT_DECO_PLANT_1
	writetext BoughtMagnaPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext MagnaPlantSentText
	waitbutton
	jump .Start

.TropicPlant:
	checkmoney YOUR_MONEY, 40000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 40000
	setevent EVENT_DECO_PLANT_2
	writetext BoughtTropicPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext TropicPlantSentText
	waitbutton
	jump .Start

.JumboPlant:
	checkmoney YOUR_MONEY, 80000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 80000
	setevent EVENT_DECO_PLANT_3
	writetext BoughtJumboPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext JumboPlantSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecoStore1FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecoStore1FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetextend CeladonHomeDecoStore1FNextTimeText

.MoveMenuHeader1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData1
	db 1 ; default option

.MenuData1:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Magna     ¥30000@"
	db "Tropic    ¥40000@"
	db "Jumbo     ¥80000@"
	db "Cancel@"

CeladonHomeDecoStore1FClerk2Script:
	faceplayer
	opentext
	writetext CeladonHomeDecoStore1FClerk2Text
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader2
	verticalmenu
	closewindow
	ifequal 1, .PikachuPoster
	ifequal 2, .ClefairyPoster
	ifequal 3, .MarillPoster
	sjump .Refused

.PikachuPoster:
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_2
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 20000
	setevent EVENT_DECO_POSTER_2
	writetext BoughtPikachuPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PikachuPosterSentText
	waitbutton
	jump .Start

.ClefairyPoster:
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_3
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 10000
	setevent EVENT_DECO_POSTER_3
	writetext BoughtClefairyPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext ClefairyPosterSentText
	waitbutton
	jump .Start

.MarillPoster:
	checkmoney YOUR_MONEY, 40000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_4
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 40000
	setevent EVENT_DECO_POSTER_4
	writetext BoughtMarillPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext MarillPosterSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecoStore1FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecoStore1FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetextend CeladonHomeDecoStore1FNextTimeText

.MoveMenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Pikachu   ¥20000@"
	db "Clefairy  ¥10000@"
	db "Marill    ¥40000@"
	db "Cancel@"

CeladonHomeDecoStore1FPokefanfScript:
	jumptextfaceplayer CeladonHomeDecoStore1FPokefanfText

CeladonHomeDecoStore1FClefairyPoster:
	jumptext CeladonHomeDecoStore1FClefairyPosterText
	
CeladonHomeDecoStore1FMarillPoster:
	jumptext CeladonHomeDecoStore1FMarillPosterText

CeladonHomeDecoStore1FPikachuPoster:
	jumptext CeladonHomeDecoStore1FPikachuPosterText

CeladonHomeDecoStore1FMagnaPlant:
	jumptext CeladonHomeDecoStore1FMagnaText

CeladonHomeDecoStore1FJumboPlant:
	jumptext CeladonHomeDecoStore1FJumboPlantText

CeladonHomeDecoStore1FTropicPlant:
	jumptext CeladonHomeDecoStore1FTropicPlantText

CeladonHomeDecoStore1FClerk1Text:
	text "Welcome! Are you"
	line "in the market for"
	cont "a new plant?"
	done

BoughtMagnaPlantText:
	text "<PLAYER> bought"
	line "Magna Plant."
	done

MagnaPlantSentText:
	text "Magna Plant"
	line "was sent home."
	done

BoughtTropicPlantText:
	text "<PLAYER> bought"
	line "Tropic Plant."
	done

TropicPlantSentText:
	text "Tropic Plant"
	line "was sent home."
	done

BoughtJumboPlantText:
	text "<PLAYER> bought"
	line "Jumbo Plant."
	done

JumboPlantSentText:
	text "Jumbo Plant"
	line "was sent home."
	done
	
CeladonHomeDecoStore1FClerk2Text:
	text "Welcome! Are you"
	line "in the market for"
	cont "a new poster?"
	done

BoughtPikachuPosterText:
	text "<PLAYER> bought"
	line "Pikachu Poster."
	done

PikachuPosterSentText:
	text "Pikachu Poster"
	line "was sent home."
	done

BoughtClefairyPosterText:
	text "<PLAYER> bought"
	line "Clefairy Poster."
	done

ClefairyPosterSentText:
	text "Clefairy Poster"
	line "was sent home."
	done

BoughtMarillPosterText:
	text "<PLAYER> bought"
	line "Marill Poster."
	done

MarillPosterSentText:
	text "Marill Poster"
	line "was sent home."
	done

CeladonHomeDecoStore1FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

CeladonHomeDecoStore1FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
CeladonHomeDecoStore1FNextTimeText:
	text "See you next time!"
	done

CeladonHomeDecoStore1FPokefanfText:
	text "My son's room is"
	line "too dark and dank"
	cont "so I'm getting him"
	cont "some new posters"
	cont "and plants."
	done
	
CeladonHomeDecoStore1FClefairyPosterText:
	text "A Clefairy Poster."
	line "It's super cute!"
	done

CeladonHomeDecoStore1FMarillPosterText:
	text "A Marill Poster."
	line "It's so dynamic!"
	done

CeladonHomeDecoStore1FPikachuPosterText:
	text "A Pikachu Poster."
	line "It's so cool!"
	done

CeladonHomeDecoStore1FMagnaText:
	text "It's a lush"
	line "Magna Plant."
	done

CeladonHomeDecoStore1FJumboPlantText:
	text "It's a huge"
	line "Jumbo Plant."
	done

CeladonHomeDecoStore1FTropicPlantText:
	text "It's a leafy"
	line "Tropic Plant."
	done

CeladonHomeDecoStore1F_MapEvents:
	db 0, 0 ; filler
	
	def_warp_events
	warp_event  5,  7, CELADON_CITY, 12
	warp_event  6,  7, CELADON_CITY, 12
	warp_event  6,  0, CELADON_HOME_DECO_STORE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  1,  5, BGEVENT_READ, CeladonHomeDecoStore1FClefairyPoster
	bg_event  2,  5, BGEVENT_READ, CeladonHomeDecoStore1FMarillPoster
	bg_event  3,  5, BGEVENT_READ, CeladonHomeDecoStore1FPikachuPoster
	bg_event  8,  4, BGEVENT_READ, CeladonHomeDecoStore1FMagnaPlant
	bg_event  8,  5, BGEVENT_READ, CeladonHomeDecoStore1FMagnaPlant
	bg_event  9,  4, BGEVENT_READ, CeladonHomeDecoStore1FMagnaPlant
	bg_event  9,  5, BGEVENT_READ, CeladonHomeDecoStore1FMagnaPlant
	bg_event  8,  6, BGEVENT_READ, CeladonHomeDecoStore1FJumboPlant
	bg_event  8,  7, BGEVENT_READ, CeladonHomeDecoStore1FJumboPlant
	bg_event 10,  6, BGEVENT_READ, CeladonHomeDecoStore1FTropicPlant
	bg_event 11,  6, BGEVENT_READ, CeladonHomeDecoStore1FTropicPlant

	def_object_events
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStore1FClerk1Script, -1
	object_event  2,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStore1FClerk2Script, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStore1FPokefanfScript, -1

	