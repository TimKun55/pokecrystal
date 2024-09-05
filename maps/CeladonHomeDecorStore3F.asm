	object_const_def
	const CELADONHOMEDECORSTORE3F_CLERK1
	const CELADONHOMEDECORSTORE3F_CLERK2
	const CELADONHOMEDECORSTORE3F_YOUNGSTER
	const CELADONHOMEDECORSTORE3F_NES
	const CELADONHOMEDECORSTORE3F_SNES
	const CELADONHOMEDECORSTORE3F_N64
	const CELADONHOMEDECORSTORE3F_VIRTUALBOY


CeladonHomeDecorStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonHomeDecorStore3FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore3FClerk1Text
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
	writetext BoughtYellowCarpetText
	playsound SFX_TRANSACTION
	waitbutton
	writetext YellowCarpetSentText
	waitbutton
	jump .Start

.Nintendo64:
	checkmoney YOUR_MONEY, 180000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_N64
	iftrue .AlreadyBought
	takemoney YOUR_MONEY, 180000
	setevent EVENT_DECO_N64
	writetext BoughtGreenCarpetText
	playsound SFX_TRANSACTION
	waitbutton
	writetext GreenCarpetSentText
	waitbutton
	jump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore3FNoMoneyText
	waitbutton
	jump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore3FAlreadyBoughtText
	waitbutton
	jump .Start
	
.Refused:
	writetext CeladonHomeDecorStore3FNextTimeText
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

CeladonHomeDecorStore3FClerk2Script:
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .VirtualBoyAlreadyPurchased
	faceplayer
	opentext
	special PlaceMoneyTopRight
	writetext CeladonHomeDecorStore3FClerk2SaleText
	yesorno
	iffalse .ClerkNoText
	checkmoney YOUR_MONEY, 230000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 230000
	setevent EVENT_DECO_VIRTUAL_BOY
	writetext BoughtVirtualBoyText
	playsound SFX_TRANSACTION
	waitbutton
	writetext VirtualBoySentText
	waitbutton
	writetext CeladonHomeDecorStore3FClerk2YesText
	waitbutton
	closetext
	end
	
.VirtualBoyAlreadyPurchased:
	writetext CeladonHomeDecorStore3FClerk2Text
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext CeladonHomeDecorStore3FNoMoneyText
	waitbutton
	closetext
	end
	
.ClerkNoText:
	writetext CeladonHomeDecorStore3FClerk2NoText
	waitbutton
	closetext
	end

CeladonHomeDecorStore3FYoungsterScript:
	jumptextfaceplayer CeladonHomeDecorStore3FYoungsterText
	
CeladonHomeDecorStore3FNESScript:
	jumptext CeladonHomeDecorStore3FNESText
	
CeladonHomeDecorStore3FSNESScript:
	jumptext CeladonHomeDecorStore3FSNESText
	
CeladonHomeDecorStore3FN64Script:
	jumptext CeladonHomeDecorStore3FN64Text
	
CeladonHomeDecorStore3FVirtualBoyScript:
	jumptext CeladonHomeDecorStore3FVirtualBoyText
	
CeladonHomeDecorStore3FDirectory:
	jumptext CeladonHomeDecorStore3FDirectoryText

CeladonHomeDecorStore3FClerk1Text:
	text "Welcome! Would"
	line "you like a"
	cont "gaming console?"
	done
	
CeladonHomeDecorStore3FNextTimeText:
	text "See you next time!"
	done

CeladonHomeDecorStore3FClerk2Text:
	text "Gaming consoles"
	line "are a great way"
	cont "to relax!"
	done

CeladonHomeDecorStore3FClerk2SaleText:
	text "Our very rare"
	line "Virtual Boy"

	para "is on sale right"
	line "now for ¥230,000."

	para "Would you like to"
	line "buy one?"
	done

CeladonHomeDecorStore3FClerk2YesText:
	text "Thank you!"
	line "Have a nice day!"
	done

CeladonHomeDecorStore3FClerk2NoText:
	text "Have a nice day!"
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

CeladonHomeDecorStore3FNoMoneyText:
	text "You can't afford"
	line "that!"
	done

CeladonHomeDecorStore3FAlreadyBoughtText:
	text "You already have"
	line "that!"
	done

CeladonHomeDecorStore3FYoungsterText:
	text "Aww, I wanna buy"
	line "something, but"
	cont "they're all so"
	cont "expensive!"
	
	para "Maybe for my"
	line "birthday…"
	done
	
CeladonHomeDecorStore3FNESText:
	text "It's a Nintendo"
	line "Entertainment"
	cont "System!"
	done
	
CeladonHomeDecorStore3FSNESText:
	text "It's a Super Nint-"
	line "endo Entertainment"
	cont "System!"
	done
	
CeladonHomeDecorStore3FN64Text:
	text "It's a Nintendo64!"
	done
	
CeladonHomeDecorStore3FVirtualBoyText:
	text "It's a Virtual"
	line "Boy!!"
	done

CeladonHomeDecorStore3FDirectoryText:
	text "Digital Enjoyment"

	para "3F: Electronics"
	done

CeladonHomeDecorStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, CELADON_HOME_DECOR_STORE_2F, 2
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_4F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, CeladonHomeDecorStore3FDirectory

	def_object_events
	object_event  2,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FClerk1Script, -1
	object_event  3,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FClerk2Script, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FYoungsterScript, -1
	object_event  0,  6, SPRITE_FAMICOM, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FNESScript, -1
	object_event  4,  4, SPRITE_SNES, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FSNESScript, -1
	object_event  8,  2, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FN64Script, -1
	object_event  8,  6, SPRITE_VIRTUAL_BOY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FVirtualBoyScript, -1
