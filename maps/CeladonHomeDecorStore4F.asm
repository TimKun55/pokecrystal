	object_const_def
	const CELADONHOMEDECORSTORE4F_CLERK1
	const CELADONHOMEDECORSTORE4F_CLERK2
	const CELADONHOMEDECORSTORE4F_POLIWAG
	const CELADONHOMEDECORSTORE4F_DIGLETT
	const CELADONHOMEDECORSTORE4F_STARYU
	const CELADONHOMEDECORSTORE4F_MAGIKARP
	const CELADONHOMEDECORSTORE4F_SHELLDER
	const CELADONHOMEDECORSTORE4F_GRIMER
	
CeladonHomeDecorStore4F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonHomeDecorStore4FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore4FClerkText
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
	waitbutton
	writetext GrimerDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore4FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore4FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecorStore4FNextTimeText
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
	db "DIGLETT    ¥14000@"
	db "SHELLDER   ¥14000@"
	db "GRIMER     ¥14000@"
	db "CANCEL@"
	
CeladonHomeDecorStore4FClerk2Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore4FClerkText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader2
	verticalmenu
	closewindow
	ifequal 1, .UnownDoll
	ifequal 2, .GengarDoll
	ifequal 3, .SurfPikachuDoll
	sjump .Refused

.UnownDoll:
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_UNOWN_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 25000
	setevent EVENT_DECO_UNOWN_DOLL
	writetext BoughtUnownDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext UnownDollSentText
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
	waitbutton
	writetext SurfPikachuDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore4FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore4FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecorStore4FNextTimeText
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
	db "UNOWN      ¥25000@"
	db "GENGAR     ¥50000@"
	db "SURF PIKA  ¥90000@"
	db "CANCEL@"

CeladonHomeDecorStore4FDiglettDollScript:
	jumptext CeladonHomeDecorStore4FDiglettDollText
	
CeladonHomeDecorStore4FShellderDollScript:
	jumptext CeladonHomeDecorStore4FShellderDollText
	
CeladonHomeDecorStore4FGrimerDollScript:
	jumptext CeladonHomeDecorStore4FGrimerDollText
	
CeladonHomeDecorStore4FUnownDollScript:
	jumptext CeladonHomeDecorStore4FUnownDollText
	
CeladonHomeDecorStore4FGengarDollScript:
	jumptext CeladonHomeDecorStore4FGengarDollText
	
CeladonHomeDecorStore4FSurfingPikachuDollScript:
	jumptext CeladonHomeDecorStore4FSurfingPikachuDollText
	
CeladonHomeDecorStore4FDirectory:
	jumptext CeladonHomeDecorStore4FDirectoryText
	
CeladonHomeDecorStore4FClerkText:
	text "Hi there!"
	line "Would you like"
	cont "a cute doll?"
	done

BoughtDiglettDollText:
	text "<PLAYER> bought"
	line "DIGLETT DOLL."
	done

DiglettDollSentText:
	text "DIGLETT DOLL"
	line "was sent home."
	done

BoughtShellderDollText:
	text "<PLAYER> bought"
	line "SHELLDER DOLL."
	done

ShellderDollSentText:
	text "SHELLDER DOLL"
	line "was sent home."
	done

BoughtGrimerDollText:
	text "<PLAYER> bought"
	line "GRIMER DOLL."
	done

GrimerDollSentText:
	text "GRIMER DOLL"
	line "was sent home."
	done

CeladonHomeDecorStore4FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

CeladonHomeDecorStore4FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
CeladonHomeDecorStore4FNextTimeText:
	text "See you next time!"
	done
	
BoughtUnownDollText:
	text "<PLAYER> bought"
	line "UNOWN DOLL."
	done

UnownDollSentText:
	text "UNOWN DOLL"
	line "was sent home."
	done

BoughtGengarDollText:
	text "<PLAYER> bought"
	line "GENGAR DOLL."
	done

GengarDollSentText:
	text "GENGAR DOLL"
	line "was sent home."
	done

BoughtSurfPikachuDollText:
	text "<PLAYER> bought"
	line "SURFING PIKACHU"
	cont "DOLL."
	done

SurfPikachuDollSentText:
	text "SURFING PIKACHU"
	line "DOLL was"
	cont "sent home."
	done

CeladonHomeDecorStore4FDiglettDollText:
	text "It's a cute"
	line "DIGLETT DOLL!"
	done
	
CeladonHomeDecorStore4FShellderDollText:
	text "It's a cute"
	line "SHELLDER DOLL!"
	done

CeladonHomeDecorStore4FGrimerDollText:
	text "It's a cute"
	line "GRIMER DOLL!"
	done

CeladonHomeDecorStore4FUnownDollText:
	text "An UNOWN DOLL."
	line "It's cute…?"
	done

CeladonHomeDecorStore4FGengarDollText:
	text "A spooky"
	line "GENGAR DOLL!"
	done

CeladonHomeDecorStore4FSurfingPikachuDollText:
	text "A super cool SURF-"
	line "ING PIKACHU DOLL!"
	done

CeladonHomeDecorStore4FDirectoryText:
	text "Many Stuffed"
	line "Companions!"

	para "4F: Dolls"
	done

CeladonHomeDecorStore4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_3F, 2

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, GoldenrodHomeDecorStore4FDirectory

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FClerk1Script, -1
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FClerk2Script, -1
	object_event  1,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FDiglettDollScript, -1
	object_event  2,  4, SPRITE_SHELLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FShellderDollScript, -1
	object_event  3,  4, SPRITE_GRIMER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FGrimerDollScript, -1
	object_event  4,  4, SPRITE_UNOWN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FUnownDollScript, -1
	object_event  5,  5, SPRITE_GENGAR, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FGengarDollScript, -1
	object_event  3,  6, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore4FSurfingPikachuDollScript, -1
