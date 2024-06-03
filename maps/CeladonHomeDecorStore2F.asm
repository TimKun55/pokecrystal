	object_const_def
	const CELADONHOMEDECORSTORE2F_CLERK1
	const CELADONHOMEDECORSTORE2F_CLERK2
	const CELADONHOMEDECORSTORE2F_POKEFANF

CeladonHomeDecorStore2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonHomeDecorStore2FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore2FClerk1Text
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
	waitbutton
	writetext JumboPlantSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore2FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore2FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecorStore2FNextTimeText
	waitbutton
	closetext
	end

.MoveMenuHeader1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData1
	db 1 ; default option

.MenuData1:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MAGNA     ¥30000@"
	db "TROPIC    ¥40000@"
	db "JUMBO     ¥80000@"
	db "CANCEL@"

CeladonHomeDecorStore2FClerk2Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore2FClerk2Text
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
	waitbutton
	writetext MarillPosterSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore2FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore2FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecorStore2FNextTimeText
	waitbutton
	closetext
	end

.MoveMenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU   ¥20000@"
	db "CLEFAIRY  ¥10000@"
	db "MARILL    ¥40000@"
	db "CANCEL@"

CeladonHomeDecorStore2FPokefanfScript:
	jumptextfaceplayer CeladonHomeDecorStore2FPokefanfText

CeladonHomeDecorStore2FDirectory:
	jumptext CeladonHomeDecorStore2FDirectoryText

CeladonHomeDecorStore2FClefairyPoster:
	jumptext CeladonHomeDecorStore2FClefairyPosterText
	
CeladonHomeDecorStore2FMarillPoster:
	jumptext CeladonHomeDecorStore2FMarillPosterText

CeladonHomeDecorStore2FPikachuPoster:
	jumptext CeladonHomeDecorStore2FPikachuPosterText

CeladonHomeDecorStore2FClerk1Text:
	text "Welcome! Are you"
	line "in the market for"
	cont "a new plant?"
	done

BoughtMagnaPlantText:
	text "<PLAYER> bought"
	line "MAGNA PLANT."
	done

MagnaPlantSentText:
	text "MAGNA PLANT"
	line "was sent home."
	done

BoughtTropicPlantText:
	text "<PLAYER> bought"
	line "TROPIC PLANT."
	done

TropicPlantSentText:
	text "TROPIC PLANT"
	line "was sent home."
	done

BoughtJumboPlantText:
	text "<PLAYER> bought"
	line "JUMBO PLANT."
	done

JumboPlantSentText:
	text "JUMBO PLANT"
	line "was sent home."
	done
	
CeladonHomeDecorStore2FClerk2Text:
	text "Welcome! Are you"
	line "in the market for"
	cont "a new poster?"
	done

BoughtPikachuPosterText:
	text "<PLAYER> bought"
	line "PIKACHU POSTER."
	done

PikachuPosterSentText:
	text "PIKACHU POSTER"
	line "was sent home."
	done

BoughtClefairyPosterText:
	text "<PLAYER> bought"
	line "CLEFAIRY POSTER."
	done

ClefairyPosterSentText:
	text "CLEFAIRY POSTER"
	line "was sent home."
	done

BoughtMarillPosterText:
	text "<PLAYER> bought"
	line "MARILL POSTER."
	done

MarillPosterSentText:
	text "MARILL POSTER"
	line "was sent home."
	done

CeladonHomeDecorStore2FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

CeladonHomeDecorStore2FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
CeladonHomeDecorStore2FNextTimeText:
	text "See you next time!"
	done

CeladonHomeDecorStore2FPokefanfText:
	text "My son's room is"
	line "too dark and dank"
	cont "so I'm getting him"

	para "some new posters"
	line "and plants."
	done
	
CeladonHomeDecorStore2FDirectoryText:
	text "Lush and Cute!"

	para "2F: Plants"
	line "    & Posters"
	done
	
CeladonHomeDecorStore2FClefairyPosterText:
	text "A CLEFAIRY Poster."
	line "It's super cute!"
	done

CeladonHomeDecorStore2FMarillPosterText:
	text "A MARILL Poster."
	line "It's so dynamic!"
	done

CeladonHomeDecorStore2FPikachuPosterText:
	text "A PIKACHU Poster."
	line "It's so cool!"
	done

CeladonHomeDecorStore2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_1F, 3
	warp_event  6,  0, CELADON_HOME_DECOR_STORE_3F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, CeladonHomeDecorStore2FDirectory
	bg_event  0,  5, BGEVENT_READ, CeladonHomeDecorStore2FClefairyPoster
	bg_event  1,  5, BGEVENT_READ, CeladonHomeDecorStore2FMarillPoster
	bg_event  2,  5, BGEVENT_READ, CeladonHomeDecorStore2FPikachuPoster

	def_object_events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore2FClerk1Script, -1
	object_event  3,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore2FClerk2Script, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore2FPokefanfScript, -1
