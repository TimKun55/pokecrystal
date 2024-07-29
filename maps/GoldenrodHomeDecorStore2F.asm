	object_const_def
	const GOLDENRODHOMEDECORSTORE2F_CLERK
	const GOLDENRODHOMEDECORSTORE2F_POKEFANF

GoldenrodHomeDecorStore2F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHomeDecorStore2FClerkScript:
	faceplayer
	opentext
	writetext GoldenrodHomeDecorStore2FClerkText
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
	waitbutton
	writetext PikachuBedSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecorStore2FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecorStore2FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext GoldenrodHomeDecorStore2FNextTimeText
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
	db "Pink      ¥62000@"
	db "Polkadot  ¥94000@"
	db "Pikachu  ¥126000@"
	db "Cancel@"

GoldenrodHomeDecorStore2FPokefanfScript:
	jumptextfaceplayer GoldenrodHomeDecorStore2FPokefanfText

GoldenrodHomeDecorStore2FDirectory:
	jumptext GoldenrodHomeDecorStore2FDirectoryText

GoldenrodHomeDecorStore2FClerkText:
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

GoldenrodHomeDecorStore2FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

GoldenrodHomeDecorStore2FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
GoldenrodHomeDecorStore2FNextTimeText:
	text "See you next time!"
	done

GoldenrodHomeDecorStore2FPokefanfText:
	text "Brand-name items"
	line "cost more than"
	cont "generic ones."

	para "But the Pikachu"
	line "Bed is so cute…"
	done
	
GoldenrodHomeDecorStore2FDirectoryText:
	text "Soft and Fluffy!"

	para "2F: Beds"
	done

GoldenrodHomeDecorStore2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, GOLDENROD_HOME_DECOR_STORE_1F, 3
	warp_event  6,  0, GOLDENROD_HOME_DECOR_STORE_3F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, GoldenrodHomeDecorStore2FDirectory

	def_object_events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore2FClerkScript, -1
	object_event  3,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecorStore2FPokefanfScript, -1
