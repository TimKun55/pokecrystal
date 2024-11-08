	object_const_def
	const CELADONHOMEDECORSTORE1F_RECEPTIONIST
	const CELADONHOMEDECORSTORE1F_CLERK
	const CELADONHOMEDECORSTORE1F_BEAUTY
	const CELADONHOMEDECORSTORE1F_BULBASAUR
	const CELADONHOMEDECORSTORE1F_CHARMANDER
	const CELADONHOMEDECORSTORE1F_SQUIRTLE
	const CELADONHOMEDECORSTORE1F_MAGIKARP
	const CELADONHOMEDECORSTORE1F_JIGGLYPUFF

CeladonHomeDecorStore1F_MapScripts:
	def_scene_scripts

	def_callbacks
	
CeladonHomeDecorStore1FClerkScript:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore1FClerkText
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
	waitbutton
	writetext SquirtleDollSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore1FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore1FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecorStore1FNextTimeText
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
	db "Bulbasaur  ¥16000@"
	db "Charmander ¥16000@"
	db "Squirtle   ¥16000@"
	db "Cancel@"	
	
CeladonHomeDecorStore1FMagikarpDollScript:
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .MagikarpDollPurchased 
	opentext
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
	waitbutton
	writetext MagikarpDollSentText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext DollClerkNoMoneyText
	waitbutton
	closetext
	end

.RefusePurchase
	writetext DollClerkNoSaleText
	waitbutton
	closetext
	end
	
.MagikarpDollPurchased:
	opentext
	writetext MagikarpDollText
	waitbutton
	closetext
	end
	
CeladonHomeDecorStore1FJigglypuffDollScript:
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .JigglypuffDollPurchased 
	opentext
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
	waitbutton
	writetext JigglypuffDollSentText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext DollClerkNoMoneyText
	waitbutton
	closetext
	end

.RefusePurchase
	writetext DollClerkNoSaleText
	waitbutton
	closetext
	end

.JigglypuffDollPurchased:
	opentext
	writetext JigglypuffDollText
	waitbutton
	closetext
	end
	
CeladonHomeDecorStore1FReceptionistScript:
	jumptextfaceplayer CeladonHomeDecorStore1FReceptionistText
	
CeladonHomeDecorStore1FBeautyScript:
	jumptextfaceplayer CeladonHomeDecorStore1FBeautyText
	
CeladonHomeDecorStore1FBulbasaurDollScript:
	jumptext CeladonHomeDecorStore1FBulbasaurDollText
	
CeladonHomeDecorStore1FCharmanderDollScript:
	jumptext CeladonHomeDecorStore1FCharmanderDollText
	
CeladonHomeDecorStore1FSquirtleDollScript:
	jumptext CeladonHomeDecorStore1FSquirtleDollText

CeladonHomeDecorStore1FDirectory:
	jumptext CeladonHomeDecorStore1FDirectoryText

CeladonHomeDecorStore1FReceptionistText:
	text "Hello! Welcome to"
	line "Celadon City"
	cont "Home Decor Store!"

	para "The directory is"
	line "on the wall."
	done

CeladonHomeDecorStore1FClerkText:
	text "Welcome! Would you"
	line "like a Doll as a"
	cont "souvenir?"
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

CeladonHomeDecorStore1FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

CeladonHomeDecorStore1FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done
	
CeladonHomeDecorStore1FNextTimeText:
	text "See you next time!"
	done

ClerkSellMagikarpDollText:
	text "Clerk: You like"
	line "the Magikarp Doll?"

	para "It'll cost you"
	line "¥90,000."
	done

ClerkSellJigglypuffDollText:
	text "Clerk: You"
	line "like the"
	cont "Jigglypuff Doll?"

	para "It'll cost you"
	line "¥120,000."
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

CeladonHomeDecorStore1FBulbasaurDollText:
	text "It's a cute"
	line "Bulbasaur doll!"
	done

CeladonHomeDecorStore1FCharmanderDollText:
	text "It's a tough"
	line "Charmander doll!"
	done

CeladonHomeDecorStore1FSquirtleDollText:
	text "It's a cool"
	line "Squirtle doll!"
	done

CeladonHomeDecorStore1FBeautyText:
	text "I love the"
	line "selection of dolls"
	cont "on the top floor!"
	done


CeladonHomeDecorStore1FDirectoryText:
	text "1F: Lobby"

	para "2F: Plants"
	line "    & Posters"

	para "3F: Electronics"

	para "4F: Dolls"
	done

CeladonHomeDecorStore1F_MapEvents:
	db 0, 0 ; filler
	
	def_warp_events
	warp_event  3,  7, CELADON_CITY, 10
	warp_event  4,  7, CELADON_CITY, 10
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, CeladonHomeDecorStore1FDirectory

	def_object_events
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FReceptionistScript, -1
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FClerkScript, -1
	object_event  7,  5, SPRITE_BULBASAUR, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FBulbasaurDollScript, -1
	object_event  8,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FCharmanderDollScript, -1
	object_event  9,  5, SPRITE_SQUIRTLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FSquirtleDollScript, -1
	object_event  0,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FBeautyScript, -1
	object_event  0,  2, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FJigglypuffDollScript, -1
	object_event  1,  2, SPRITE_MAGIKARP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FMagikarpDollScript, -1
	