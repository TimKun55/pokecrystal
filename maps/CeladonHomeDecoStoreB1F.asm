	object_const_def
	const CELADONHOMEDECOSTOREB1F_CLERK1
	const CELADONHOMEDECOSTOREB1F_CLERK2
	const CELADONHOMEDECOSTOREB1F_BEAUTY
	const CELADONHOMEDECOSTOREB1F_DIGLETT
	const CELADONHOMEDECOSTOREB1F_SHELLDER
	const CELADONHOMEDECOSTOREB1F_GRIMER
	const CELADONHOMEDECOSTOREB1F_SNUBBULL
	const CELADONHOMEDECOSTOREB1F_GENGAR
	const CELADONHOMEDECOSTOREB1F_SURFING_PIKACHU

CeladonHomeDecoStoreB1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonHomeDecoStoreB1FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecoStoreB1FClerkText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader1
	verticalmenu
	closewindow
	ifequal 1, .DiglettDoll
	ifequal 2, .ShellderDoll
	ifequal 3, .GrimerDoll
	sjump .Refused

.DiglettDoll:
	checkmoney YOUR_MONEY, 14000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_DIGLETT_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 14000
	setevent EVENT_DECO_DIGLETT_DOLL
	writetext BoughtDiglettDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext DiglettDollSentText
	waitbutton
	jump .Start

.ShellderDoll:
	checkmoney YOUR_MONEY, 14000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SHELLDER_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 14000
	setevent EVENT_DECO_SHELLDER_DOLL
	writetext BoughtShellderDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext ShellderDollSentText
	waitbutton
	jump .Start

.GrimerDoll:
	checkmoney YOUR_MONEY, 14000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_GRIMER_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 14000
	setevent EVENT_DECO_GRIMER_DOLL
	writetext BoughtGrimerDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GrimerDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecoStoreB1FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecoStoreB1FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecoStoreB1FNextTimeText
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
	db "Diglett    ¥14000@"
	db "Shellder   ¥14000@"
	db "Grimer     ¥14000@"
	db "Cancel@"

CeladonHomeDecoStoreB1FClerk2Script:
	faceplayer
	opentext
	writetext CeladonHomeDecoStoreB1FClerkText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader2
	verticalmenu
	closewindow
	ifequal 1, .SnubbullDoll
	ifequal 2, .GengarDoll
	ifequal 3, .SurfPikachuDoll
	sjump .Refused

.SnubbullDoll:
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SNUBBULL_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 25000
	setevent EVENT_DECO_SNUBBULL_DOLL
	writetext BoughtSnubbullDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext SnubbullDollSentText
	waitbutton
	jump .Start

.GengarDoll:
	checkmoney YOUR_MONEY, 50000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_GENGAR_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 50000
	setevent EVENT_DECO_GENGAR_DOLL
	writetext BoughtGengarDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GengarDollSentText
	waitbutton
	jump .Start

.SurfPikachuDoll:
	checkmoney YOUR_MONEY, 90000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SURFING_PIKACHU_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 90000
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	writetext BoughtSurfPikachuDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext SurfPikachuDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecoStoreB1FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecoStoreB1FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecoStoreB1FNextTimeText
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
	db "Snubbull   ¥25000@"
	db "Gengar     ¥50000@"
	db "Surf Pika  ¥90000@"
	db "Cancel@"
	
CeladonHomeDecoStoreB1FBeautyScript:
	jumptextfaceplayer CeladonHomeDecoStoreB1FBeautyText
	
CeladonHomeDecoStoreB1FDiglettDollScript:
	jumptext CeladonHomeDecoStoreB1FDiglettDollText
	
CeladonHomeDecoStoreB1FShellderDollScript:
	jumptext CeladonHomeDecoStoreB1FShellderDollText
	
CeladonHomeDecoStoreB1FGrimerDollScript:
	jumptext CeladonHomeDecoStoreB1FGrimerDollText
	
CeladonHomeDecoStoreB1FSnubbullDollScript:
	jumptext CeladonHomeDecoStoreB1FSnubbullDollText
	
CeladonHomeDecoStoreB1FGengarDollScript:
	jumptext CeladonHomeDecoStoreB1FGengarDollText
	
CeladonHomeDecoStoreB1FSurfingPikachuDollScript:
	jumptext CeladonHomeDecoStoreB1FSurfingPikachuDollText
	
CeladonHomeDecoStoreB1FBeautyText:
	text "I love the"
	line "selection of dolls"
	cont "they have here!"
	done

CeladonHomeDecoStoreB1FClerkText:
	text "Hi there!"
	line "Would you like"
	cont "a cute doll?"
	done

BoughtDiglettDollText:
	text "<PLAYER> bought"
	line "Diglett Doll."
	done

DiglettDollSentText:
	text "Diglett Doll"
	line "was sent home."
	done

BoughtShellderDollText:
	text "<PLAYER> bought"
	line "Shellder Doll."
	done

ShellderDollSentText:
	text "Shellder Doll"
	line "was sent home."
	done

BoughtGrimerDollText:
	text "<PLAYER> bought"
	line "Grimer Doll."
	done

GrimerDollSentText:
	text "Grimer Doll"
	line "was sent home."
	done

BoughtSnubbullDollText:
	text "<PLAYER> bought"
	line "Snubbull Doll."
	done

SnubbullDollSentText:
	text "Snubbull Doll"
	line "was sent home."
	done

BoughtGengarDollText:
	text "<PLAYER> bought"
	line "Gengar Doll."
	done

GengarDollSentText:
	text "Gengar Doll"
	line "was sent home."
	done

BoughtSurfPikachuDollText:
	text "<PLAYER> bought"
	line "Surfing Pikachu"
	cont "Doll."
	done

SurfPikachuDollSentText:
	text "Surfing Pikachu"
	line "Doll was"
	cont "sent home."
	done

CeladonHomeDecoStoreB1FNoMoneyText:
	text "Sorry, you can't"
	line "afford it!"
	done

CeladonHomeDecoStoreB1FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done

CeladonHomeDecoStoreB1FNextTimeText:
	text "See you next time!"
	done

CeladonHomeDecoStoreB1FDiglettDollText:
	text "It's a cute"
	line "Diglett Doll!"
	done
	
CeladonHomeDecoStoreB1FShellderDollText:
	text "It's a cute"
	line "Shellder Doll!"
	done

CeladonHomeDecoStoreB1FGrimerDollText:
	text "It's a cute"
	line "Grimer Doll!"
	done

CeladonHomeDecoStoreB1FSnubbullDollText:
	text "A Snubbull Doll."
	line "It's cute…?"
	done

CeladonHomeDecoStoreB1FGengarDollText:
	text "A spooky"
	line "Gengar Doll!"
	done

CeladonHomeDecoStoreB1FSurfingPikachuDollText:
	text "A super cool Surf-"
	line "ing Pikachu Doll!"
	done

CeladonHomeDecoStoreB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, CELADON_HOME_DECO_STORE_1F, 3
	warp_event  5,  0, CELADON_HOME_DECO_STORE_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FClerk1Script, -1
	object_event  8,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FClerk2Script, -1
	object_event  2,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FBeautyScript, -1
	object_event  2,  4, SPRITE_DIGLETT, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FDiglettDollScript, -1
	object_event  3,  4, SPRITE_SHELLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FShellderDollScript, -1
	object_event  5,  6, SPRITE_GRIMER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FGrimerDollScript, -1
	object_event  8,  4, SPRITE_SNUBBULL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FSnubbullDollScript, -1
	object_event  9,  4, SPRITE_GENGAR, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FGengarDollScript, -1
	object_event  6,  6, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB1FSurfingPikachuDollScript, -1
