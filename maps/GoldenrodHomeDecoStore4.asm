	object_const_def
	const GOLDENRODHOMEDECOSTORE4_CLERK
	const GOLDENRODHOMEDECOSTORE4_TWIN
	const GOLDENRODHOMEDECOSTORE4_BULBASAUR
	const GOLDENRODHOMEDECOSTORE4_CHARMANDER
	const GOLDENRODHOMEDECOSTORE4_SQUIRTLE
	const GOLDENRODHOMEDECOSTORE4_MAGIKARP
	const GOLDENRODHOMEDECOSTORE4_JIGGLYPUFF
	
GoldenrodHomeDecoStore4_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHomeDecoStore4ClerkScript:
	faceplayer
	opentext
	writetext GoldenrodHomeDecoStore4ClerkText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .BulbasaurDoll
	ifequal 2, .CharmanderDoll
	ifequal 3, .SquirtleDoll
	sjump .Refused

.BulbasaurDoll:
	checkmoney YOUR_MONEY, 16000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_BULBASAUR_DOLL
	writetext BoughtBulbasaurDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext BulbasaurDollSentText
	waitbutton
	jump .Start

.CharmanderDoll:
	checkmoney YOUR_MONEY, 16000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_CHARMANDER_DOLL
	writetext BoughtCharmanderDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext CharmanderDollSentText
	waitbutton
	jump .Start

.SquirtleDoll:
	checkmoney YOUR_MONEY, 16000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_SQUIRTLE_DOLL
	writetext BoughtSquirtleDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext SquirtleDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext GoldenrodHomeDecoStore4NoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext GoldenrodHomeDecoStore4AlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetextend GoldenrodHomeDecoStore4NextTimeText

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Bulbasaur  ¥16000@"
	db "Charmander ¥16000@"
	db "Squirtle   ¥16000@"
	db "Cancel@"

GoldenrodHomeDecoStore4MagikarpDollScript:
	opentext
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .MagikarpDollPurchased 
	writetext ClerkSellMagikarpDollText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusePurchase
	checkmoney YOUR_MONEY, 90000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 90000
	setevent EVENT_DECO_MAGIKARP_DOLL
	writetext BoughtMagikarpDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetextend MagikarpDollSentText

.NotEnoughMoney:
	writetextend DollClerkNoMoneyText

.RefusePurchase
	writetextend DollClerkNoSaleText

.MagikarpDollPurchased:
	writetextend MagikarpDollText
	
GoldenrodHomeDecoStore4JigglypuffDollScript:
	opentext
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .JigglypuffDollPurchased 
	writetext ClerkSellJigglypuffDollText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusePurchase
	checkmoney YOUR_MONEY, 120000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 120000
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	writetext BoughtJigglypuffDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext JigglypuffDollSentText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetextend DollClerkNoMoneyText

.RefusePurchase
	writetextend DollClerkNoSaleText

.JigglypuffDollPurchased:
	writetextend JigglypuffDollText

GoldenrodHomeDecoStore4TwinScript:
	jumptextfaceplayer GoldenrodHomeDecoStore4TwinText

GoldenrodHomeDecoStore4BulbasaurDollScript:
	jumptext GoldenrodHomeDecoStore4BulbasaurDollText
	
GoldenrodHomeDecoStore4CharmanderDollScript:
	jumptext GoldenrodHomeDecoStore4CharmanderDollText
	
GoldenrodHomeDecoStore4SquirtleDollScript:
	jumptext GoldenrodHomeDecoStore4SquirtleDollText

GoldenrodHomeDecoStore4ClerkText:
	text "Welcome!"
	line "Would you like"
	cont "to buy a Doll?"
	done

BoughtBulbasaurDollText:
	text "<PLAYER> bought"
	line "Bulbasaur Doll."
	done

BulbasaurDollSentText:
	text "Bulbasaur Doll"
	line "was sent home."
	done

BoughtCharmanderDollText:
	text "<PLAYER> bought"
	line "Charmander Doll."
	done

CharmanderDollSentText:
	text "Charmander Doll"
	line "was sent home."
	done

BoughtSquirtleDollText:
	text "<PLAYER> bought"
	line "Squirtle Doll."
	done

SquirtleDollSentText:
	text "Squirtle Doll"
	line "was sent home."
	done

GoldenrodHomeDecoStore4NoMoneyText:
	text "You can't afford"
	line "that!"
	done

GoldenrodHomeDecoStore4AlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
GoldenrodHomeDecoStore4NextTimeText:
	text "See you next time!"
	done

ClerkSellMagikarpDollText:
	text "Clerk: You like"
	line "the Magikarp Doll?"

	para "I'm selling it"
	line "for ¥90,000."
	done

ClerkSellJigglypuffDollText:
	text "Clerk: Do you"
	line "like the"
	cont "Jigglypuff Doll?"

	para "I'm selling it"
	line "for ¥120,000."
	done
	
BoughtMagikarpDollText:
	text "<PLAYER> bought"
	line "Magikarp Doll."
	done

MagikarpDollSentText:
	text "Magikarp Doll"
	line "was sent home."
	done
	
BoughtJigglypuffDollText:
	text "<PLAYER> bought"
	line "Jigglypuff Doll."
	done

JigglypuffDollSentText:
	text "Jigglypuff Doll"
	line "was sent home."
	done
	
MagikarpDollText:
	text "It's a very cute"
	line "Magikarp Doll."
	done
	
JigglypuffDollText:
	text "It's a cute"
	line "Jigglypuff Doll."
	done
	
DollClerkNoSaleText:
	text "Clerk: Well, if"
	line "you say so."
	done

DollClerkNoMoneyText:
	text "Clerk: You can't"
	line "afford it!"
	done

GoldenrodHomeDecoStore4TwinText:
	text "All these dolls"
	line "are so cute,"
	cont "but I can't afford"
	cont "any of them!"
	done

GoldenrodHomeDecoStore4BulbasaurDollText:
	text "It's a cute"
	line "Bulbasaur doll!"
	done

GoldenrodHomeDecoStore4CharmanderDollText:
	text "It's a tough"
	line "Charmander doll!"
	done

GoldenrodHomeDecoStore4SquirtleDollText:
	text "It's a cool"
	line "Squirtle doll!"
	done

GoldenrodHomeDecoStore4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_UNDERGROUND, 13
	warp_event  4,  7, GOLDENROD_UNDERGROUND, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4ClerkScript, -1
	object_event  6,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4TwinScript, -1
	object_event  0,  4, SPRITE_BULBASAUR, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4BulbasaurDollScript, -1
	object_event  1,  4, SPRITE_CHARMANDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4CharmanderDollScript, -1
	object_event  2,  4, SPRITE_SQUIRTLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4SquirtleDollScript, -1
	object_event  7,  2, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4JigglypuffDollScript, -1
	object_event  6,  2, SPRITE_MAGIKARP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHomeDecoStore4MagikarpDollScript, -1
