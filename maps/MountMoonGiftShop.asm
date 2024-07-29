	object_const_def
	const MOUNTMOONGIFTSHOP_GRAMPS1 ; morning only
	const MOUNTMOONGIFTSHOP_GRAMPS2 ; day only
	const MOUNTMOONGIFTSHOP_LASS1 ; morning only
	const MOUNTMOONGIFTSHOP_LASS2 ; day only
	const MOUNTMOONGIFTSHOP_CLEFAIRY1 ; morning only
	const MOUNTMOONGIFTSHOP_CLEFAIRY2 ; day only 

MountMoonGiftShop_MapScripts:
	def_scene_scripts

	def_callbacks

MountMoonGiftShopClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MT_MOON
	closetext
	end

MountMoonGiftShopLassScript:
	jumptextfaceplayer MountMoonGiftShopLassText

MountMoonGiftShopClefairyDollScript:
	opentext
	checkevent EVENT_DECO_CLEFAIRY_DOLL
	iftrue .ClefairyDollPurchased 
	writetext ClefairyDollPriceText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusePurchase
	checkmoney YOUR_MONEY, 12000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 12000
	setevent EVENT_DECO_CLEFAIRY_DOLL
	writetext BoughtClefairyDollText
	playsound SFX_TRANSACTION
	waitbutton
	writetext ClefairyDollSentText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext ClefairyDollNoMoneyText
	waitbutton
	closetext
	end

.RefusePurchase
	writetext ClefairyDollNoSaleText
	waitbutton
	closetext
	end
	
.ClefairyDollPurchased:
	writetext ClefairyDollText
	waitbutton
	closetext
	end

MountMoonGiftShopLassText:
	text "When the sun goes"
	line "down, Clefairy"
	cont "come out to play."
	done
	
ClefairyDollText:
	text "It's a super cute"
	line "Clefairy Doll."
	done

ClefairyDollNoSaleText:
	text "Maybe next time."
	done

ClefairyDollNoMoneyText:
	text "Not enough money…"
	done

ClefairyDollPriceText:
	text "It's a super cute"
	line "Clefairy Doll."
	
	para "The price is"
	line "¥12,000."
	
	para "Buy it?"
	done
	
BoughtClefairyDollText:
	text "<PLAYER> bought"
	line "the Clefairy Doll."
	done

ClefairyDollSentText:
	text "The Clefairy Doll"
	line "was sent home."
	done

MountMoonGiftShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MOUNT_MOON_SQUARE, 3
	warp_event  4,  7, MOUNT_MOON_SQUARE, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClerkScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClerkScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
	object_event  2,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClefairyDollScript, -1
	object_event  2,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClefairyDollScript, -1
