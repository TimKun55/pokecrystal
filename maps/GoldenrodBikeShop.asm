	object_const_def
	const GOLDENRODBIKESHOP_CLERK
	const GOLDENRODBIKESHOP_YOUNGSTER
	const GOLDENRODBIKESHOP_SCHOOLBOY
	const GOLDENRODBIKESHOP_TWIN
	const GOLDENRODBIKESHOP_ROCKER
	const GOLDENRODBIKESHOP_TEACHER

GoldenrodBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_BIKE_SHOP_CUSTOMERS
	iffalse .SoBusy
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetextend GoldenrodBikeShopClerkFirstRateBikesText

.SoBusy
	writetextend GoldenrodBikeShopClerkSoBusyText

.Refused:
	writetextend GoldenrodBikeShopClerkRefusedText

GoldenrodBikeShopYoungsterScript:
	jumptextfaceplayer GoldenrodBikeShopYoungsterText

GoldenrodBikeShopSchoolboyScript:
	jumptextfaceplayer GoldenrodBikeShopSchoolboyText

GoldenrodBikeShopTwinScript:
	jumptextfaceplayer GoldenrodBikeShopTwinText

GoldenrodBikeShopRockerScript:
	jumptextfaceplayer GoldenrodBikeShopRockerText

GoldenrodBikeShopTeacherScript:
	jumptextfaceplayer GoldenrodBikeShopTeacherText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "…sigh… I moved"
	line "here, but I can't"
	cont "sell my Bicycles."
	
	para "Why is that?"

	para "Could you ride a"
	line "Bicycle and adver-"
	cont "tise for me?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"
	cont "and I'll loan you"
	cont "a Bicycle."
	done

BorrowedABicycleText:
	text "<PLAYER> borrowed a"
	line "Bicycle."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "My Bicycles are"
	line "first-rate! You"
	cont "can ride them"
	cont "anywhere."
	done

GoldenrodBikeShopClerkSoBusyText:
	text "<PLAYER>!"
	
	para "Look at how busy"
	line "it is in here!"
	
	para "This is all thanks"
	line "to you - we've"
	cont "been selling so"
	cont "many bikes."
	
	para "Thank you so much!"
	done

GoldenrodBikeShopClerkRefusedText:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Just released!"

	para "First-rate compact"
	line "Bicycles!"
	done

GoldenrodBikeShopYoungsterText:
	text "Just released!"

	para "They're first-rate"
	line "compact Bikes!"
	done

GoldenrodBikeShopSchoolboyText:
	text "I had no idea"
	line "this place had"
	cont "opened up!"
	
	para "I love all"
	line "these bikes!"
	done

GoldenrodBikeShopTwinText:
	text "So shiny!"
	done

GoldenrodBikeShopRockerText:
	text "I remember when"
	line "skateboards were"
	cont "all the rage."
	
	para "I feel old…"
	done

GoldenrodBikeShopTeacherText:
	text "I needed to get my"
	line "kid a new bike"
	cont "and this place is"
	cont "just perfect."
	done

GoldenrodBikeShopBicycleText:
	text "It's a shiny new"
	line "Bicycle!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
	object_event  3,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopYoungsterScript, EVENT_GOLDENROD_BIKE_SHOP_CUSTOMERS
	object_event  2,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopSchoolboyScript, EVENT_GOLDENROD_BIKE_SHOP_CUSTOMERS	
	object_event  6,  7, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopTwinScript, EVENT_GOLDENROD_BIKE_SHOP_CUSTOMERS
	object_event  7,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopRockerScript, EVENT_GOLDENROD_BIKE_SHOP_CUSTOMERS
	object_event  0,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopTeacherScript, EVENT_GOLDENROD_BIKE_SHOP_CUSTOMERS
