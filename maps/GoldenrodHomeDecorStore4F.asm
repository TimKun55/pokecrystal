	object_const_def
	const GOLDENRODHOMEDECORSTORE4F_CLERK
	const GOLDENRODHOMEDECORSTORE4F_BIG_SNORLAX
	const GOLDENRODHOMEDECORSTORE4F_BIG_LAPRAS
	
GoldenrodHomeDecorStore4F_MapScripts:
	def_scene_scripts

	def_callbacks

BigLaprasDollScript:
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue .BigLaprasDollPurchased 
	opentext
	writetext BigDollClerkSellLaprasText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusePurchase
	checkmoney YOUR_MONEY, 300000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 300000
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	writetext BoughtBigLaprasDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext BigLaprasDollSentText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext BigDollClerkNoMoneyText
	waitbutton
	closetext
	end

.RefusePurchase
	writetext BigDollClerkNoSaleText
	waitbutton
	closetext
	end
	
.BigLaprasDollPurchased:
	opentext
	writetext BigLaprasDollText
	waitbutton
	closetext
	end

BigSnorlaxDollScript:
	checkevent EVENT_DECO_BIG_SNORLAX_DOLL
	iftrue .BigSnorlaxDollPurchased
	opentext
	writetext BigDollClerkSellSnorlaxText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusePurchase
	checkmoney YOUR_MONEY, 200000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 200000
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	writetext BoughtBigSnorlaxDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext BigSnorlaxDollSentText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext BigDollClerkNoMoneyText
	waitbutton
	closetext
	end

.RefusePurchase
	writetext BigDollClerkNoSaleText
	waitbutton
	closetext
	end
	
.BigSnorlaxDollPurchased:
	opentext
	writetext BigSnorlaxDollText
	waitbutton
	closetext
	end

BigOnixDollScript:
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue .BigOnixDollPurchased
	opentext
	writetext BigDollClerkSellOnixText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusePurchase
	checkmoney YOUR_MONEY, 250000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 250000
	setevent EVENT_DECO_BIG_ONIX_DOLL
	writetext BoughtBigOnixDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext BigOnixDollSentText
	waitbutton
	closetext
	end
	
.BigOnixDollPurchased:
	opentext
	writetext BigOnixDollText
	waitbutton
	closetext
	end
	
.RefusePurchase
	writetext BigDollClerkNoSaleText
	waitbutton
	closetext
	end
	
.NotEnoughMoney:
	writetext BigDollClerkNoMoneyText
	waitbutton
	closetext
	end
	
BigDollClerkScript:
	jumptextfaceplayer BigDollClerkText
	
GoldenrodHomeDecorStore4FDirectory:
	jumptext GoldenrodHomeDecorStore4FDirectoryText
	
BigDollClerkText:
	text "Aren't our jumbo"
	line "dolls impressive?"

	para "They're so big,"
	line "we can barely fit"
	cont "them in the room."
	done

BigDollClerkNoSaleText:
	text "Clerk: Well, if"
	line "you say so."
	done

BigDollClerkNoMoneyText:
	text "Clerk: You can't"
	line "afford it!"
	done

BigDollClerkSellLaprasText:
	text "Clerk: You like"
	line "the Lapras Doll?"

	para "It'll cost you"
	line "¥300,000."
	done

BigDollClerkSellSnorlaxText:
	text "Clerk: You like"
	line "the Snorlax Doll?"

	para "It'll cost you"
	line "¥200,000."
	done

BigDollClerkSellOnixText:
	text "Clerk: You like"
	line "the Onix Doll?"

	para "It'll cost you"
	line "¥250,000."
	done

BoughtBigLaprasDollText:
	text "<PLAYER> bought"
	line "Big Lapras Doll."
	done

BigLaprasDollSentText:
	text "Big Lapras Doll"
	line "was sent home."
	done

BoughtBigSnorlaxDollText:
	text "<PLAYER> bought"
	line "Big Snorlax Doll."
	done

BigSnorlaxDollSentText:
	text "Big Snorlax Doll"
	line "was sent home."
	done

BoughtBigOnixDollText:
	text "<PLAYER> bought"
	line "Big Onix Doll."
	done

BigOnixDollSentText:
	text "Big Onix Doll"
	line "was sent home."
	done

BigLaprasDollText:
	text "It's a jumbo-size"
	line "Lapras Doll!"
	done

BigSnorlaxDollText:
	text "It's a jumbo-size"
	line "Snorlax Doll!"
	done

BigOnixDollText:
	text "It's a jumbo-size"
	line "Onix Doll!"
	done

GoldenrodHomeDecorStore4FDirectoryText:
	text "A Stuffed"
	line "Companion!"

	para "4F: Jumbo Dolls"
	done

GoldenrodHomeDecorStore4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, GOLDENROD_HOME_DECOR_STORE_3F, 2

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_READ, GoldenrodHomeDecorStore4FDirectory
	bg_event  2,  5, BGEVENT_READ, BigOnixDollScript
	bg_event  3,  5, BGEVENT_READ, BigOnixDollScript
	bg_event  2,  6, BGEVENT_READ, BigOnixDollScript
	bg_event  3,  6, BGEVENT_READ, BigOnixDollScript

	def_object_events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BigDollClerkScript, -1
	object_event  1,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  4,  3, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigLaprasDollScript, -1
