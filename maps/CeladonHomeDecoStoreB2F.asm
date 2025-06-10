	object_const_def
	const CELADONHOMEDECORSTOREB2F_CLERK1
	const CELADONHOMEDECORSTOREB2F_YOUNGSTER
	const CELADONHOMEDECORSTOREB2F_NES
	const CELADONHOMEDECORSTOREB2F_SNES
	const CELADONHOMEDECORSTOREB2F_N64
	const CELADONHOMEDECORSTOREB2F_VIRTUALBOY


CeladonHomeDecoStoreB2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonHomeDecoStoreB2FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecoStoreB2FClerk1Text
.Start:
	special PlaceMoneyTopRight
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .NES
	ifequal 2, .SNES
	ifequal 3, .Nintendo64
	sjump .Refused

.NES:
	checkmoney YOUR_MONEY, 80000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 80000
	setevent EVENT_DECO_FAMICOM
	writetext BoughtNESText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext NESSentText
	waitbutton
	jump .Start

.SNES:
	checkmoney YOUR_MONEY, 130000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 130000
	setevent EVENT_DECO_SNES
	writetext BoughtSNESText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext SNESSentText
	waitbutton
	jump .Start

.Nintendo64:
	checkmoney YOUR_MONEY, 180000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_N64
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 180000
	setevent EVENT_DECO_N64
	writetext BoughtN64Text
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext N64SentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecoStoreB2FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecoStoreB2FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecoStoreB2FNextTimeText
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
	db "NES       ¥80000@"
	db "SNES     ¥130000@"
	db "N64      ¥180000@"
	db "Cancel@"

CeladonHomeDecoStoreB2FVirtualBoyScript:
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .VirtualBoyAlreadyPurchased
	turnobject CELADONHOMEDECORSTOREB2F_CLERK1, DOWN
	opentext
	special PlaceMoneyTopRight
	writetext CeladonHomeDecoStoreB2FClerkSaleText
	yesorno
	iffalse .ClerkNoText
	checkmoney YOUR_MONEY, 230000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 230000
	setevent EVENT_DECO_VIRTUAL_BOY
	writetext BoughtVirtualBoyText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext VirtualBoySentText
	waitbutton
	writetext CeladonHomeDecoStoreB2FClerkYesText
	waitbutton
	closetext
	end
	
.VirtualBoyAlreadyPurchased:
	opentext
	writetext CeladonHomeDecoStoreB2FVirtualBoyText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext CeladonHomeDecoStoreB2FNoMoneyText
	waitbutton
	closetext
	end
	
.ClerkNoText:
	writetext CeladonHomeDecoStoreB2FNextTimeText
	waitbutton
	closetext
	end

CeladonHomeDecoStoreB2FYoungsterScript:
	jumptextfaceplayer CeladonHomeDecoStoreB2FYoungsterText
	
CeladonHomeDecoStoreB2FNESScript:
	jumptext CeladonHomeDecoStoreB2FNESText
	
CeladonHomeDecoStoreB2FSNESScript:
	jumptext CeladonHomeDecoStoreB2FSNESText
	
CeladonHomeDecoStoreB2FN64Script:
	jumptext CeladonHomeDecoStoreB2FN64Text
	
CeladonHomeDecoStoreB2FClerk1Text:
	text "Welcome! Would"
	line "you like a"
	cont "gaming console?"
	done
	
CeladonHomeDecoStoreB2FNextTimeText:
	text "See you next time!"
	done

CeladonHomeDecoStoreB2FClerk2Text:
	text "Gaming consoles"
	line "are a great way"
	cont "to relax!"
	done

CeladonHomeDecoStoreB2FClerkSaleText:
	text "Clerk: Our very"
	line "rare Virtual Boy"

	para "is on sale right"
	line "now for ¥230,000."

	para "Would you like to"
	line "buy one?"
	done

CeladonHomeDecoStoreB2FClerkYesText:
	text "Clerk: Thank you!"
	line "Have a nice day!"
	done

BoughtNESText:
	text "<PLAYER> bought"
	line "the NES."
	done

NESSentText:
	text "The NES"
	line "was sent home."
	done

BoughtVirtualBoyText:
	text "<PLAYER> bought"
	line "Virtual Boy."
	done

VirtualBoySentText:
	text "Virtual Boy"
	line "was sent home."
	done

BoughtSNESText:
	text "<PLAYER> bought"
	line "the SNES."
	done

SNESSentText:
	text "The SNES"
	line "was sent home."
	done

BoughtN64Text:
	text "<PLAYER> bought"
	line "the N64."
	done

N64SentText:
	text "The N64"
	line "was sent home."
	done

CeladonHomeDecoStoreB2FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

CeladonHomeDecoStoreB2FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done

CeladonHomeDecoStoreB2FYoungsterText:
	text "Aww, I wanna buy"
	line "something, but"
	cont "they're all so"
	cont "expensive!"
	
	para "Maybe for my"
	line "birthday…"
	done
	
CeladonHomeDecoStoreB2FNESText:
	text "It's a Nintendo"
	line "Entertainment"
	cont "System!"
	done
	
CeladonHomeDecoStoreB2FSNESText:
	text "It's a Super Nint-"
	line "endo Entertainment"
	cont "System!"
	done
	
CeladonHomeDecoStoreB2FN64Text:
	text "It's a Nintendo64!"
	done
	
CeladonHomeDecoStoreB2FVirtualBoyText:
	text "It's a Virtual"
	line "Boy!"
	done

CeladonHomeDecoStoreB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, CELADON_HOME_DECO_STORE_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB2FClerk1Script, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB2FYoungsterScript, -1
	object_event  0,  2, SPRITE_FAMICOM, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB2FNESScript, -1
	object_event  0,  4, SPRITE_SNES, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB2FSNESScript, -1
	object_event  4,  4, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB2FN64Script, -1
	object_event  8,  4, SPRITE_VIRTUAL_BOY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecoStoreB2FVirtualBoyScript, -1
