	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA
	const GOLDENRODFLOWERSHOP_BELLOSSOM

GoldenrodFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, FlowerShopCheckUnlockedDoorCallback

FlowerShopCheckUnlockedDoorCallback:
	checkevent EVENT_FLOWER_SHOP_UNLOCKED_DOOR
	iffalse .LockDoor
	endcallback

.LockDoor
	changeblock 6, 0, $72 ; locked door
	endcallback

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .EVBerry
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.EVBerry
	checkevent EVENT_FLOWER_SHOP_UNLOCKED_DOOR
	iftrue .SellMulch
	faceplayer
	opentext
	writetext FlowerShopHiddenGardenText
	waitbutton
	closetext
	applymovement PLAYER, FlowerShopPlayerMovement
	turnobject PLAYER, UP
	applymovement GOLDENRODFLOWERSHOP_TEACHER, FlowerShopTeacherMovementToDoor
	pause 15
	playsound SFX_BUMP
	pause 15
	applymovement GOLDENRODFLOWERSHOP_TEACHER, FlowerShopTeacherMovementFromDoor
	opentext
	writetext FlowerShopHiddenGardenUseText
	waitbutton
	closetext
	applymovement GOLDENRODFLOWERSHOP_TEACHER, FlowerShopTeacherMovementLast
	changeblock 6, 0, $71 ; unlocked door
	reloadmappart
	setevent EVENT_FLOWER_SHOP_UNLOCKED_DOOR
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText

.NoPlainBadge:
	jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText

.HaventMetFloria:
	jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text

.SellMulch:
	faceplayer
	opentext
	writetext WouldYouLikeMulchText
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy1
	ifequal 2, .Buy10
	sjump .Refused

.Buy1:
	checkmoney YOUR_MONEY, 200
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem MULCH
	iffalse .NoRoomForMulch
	takemoney YOUR_MONEY, 200
	sjump .Done

.Buy10:
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem MULCH, 10
	iffalse .NoRoomForMulch
	takemoney YOUR_MONEY, 2000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoughtMulchText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext NotEnoughMulchMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext DontBuyMulchText
	waitbutton
	closetext
	end

.NoRoomForMulch:
	writetext NoRoomForMulchText
	waitbutton
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 18, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "× 1 Bag    ¥200@"
	db "×10 Bags  ¥2000@"
	db "Cancel@"

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext GoldenrodFlowerShopFloriaYouBeatWhitneyText
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	checkitem MULCH
	iftrue .MulchDescription
	writetext GoldenrodFlowerShopFloriaItReallyWasAMonText
	waitbutton
	closetext
	end

.MulchDescription:
	writetext DescribeMulchText
	waitbutton
	closetext
	end

FlowerShopBellossomScript:
	opentext
	writetext FlowerShopBellossomText
	cry BELLOSSOM	
	waitbutton
	refreshscreen
	pokepic BELLOSSOM
	waitbutton
	closepokepic
	closetext
	end

FlowerShopPlayerMovement:
	step DOWN
	step_end

FlowerShopTeacherMovementToDoor:
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

FlowerShopTeacherMovementFromDoor:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end
	
FlowerShopTeacherMovementLast:
	step LEFT
	step_end

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "Have you seen that"
	line "wiggly tree that's"

	para "growing on Route"
	line "36?"

	para "My little sister"
	line "got all excited"

	para "and went to see"
	line "it…"

	para "I'm worried… Isn't"
	line "it dangerous?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Do you want to"
	line "borrow the water"

	para "bottle too?"
	line "I don't want you"

	para "doing anything"
	line "dangerous with it."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, you're better"
	line "than Whitney…"

	para "You'll be OK,"
	line "then. Here's the"
	cont "SquirtBottle!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Don't do anything"
	line "too dangerous!"
	done

FlowerShopHiddenGardenText:
	text "You're such a"
	line "helpful young"
	
	para "person, I'd like"
	line "to reward you."
	
	para "I grow some very"
	line "rare Berries in"
	
	para "my garden, feel"
	line "free to pick them"
	cont "when you want!"
	
	para "I'll unlock the"
	line "door for you."
	done

FlowerShopHiddenGardenUseText:
	text "I hope you find"
	line "a good use for"
	cont "them all!"
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Have plenty of"
	cont "water, my lovely!"
	done

WouldYouLikeMulchText:
	text "Care to buy some"
	line "Mulch?"

	para "It makes Berries"
	line "grow faster!"
	done

BoughtMulchText:
	text "Thank you!"
	line "Please come again!"
	done

DontBuyMulchText:
	text "Please come again!"
	done

NotEnoughMulchMoneyText:
	text "Well… Excuse me,"
	line "but you're short"
	cont "of money."
	done

NoRoomForMulchText:
	text "Oh no, your Bag"
	line "is full!"
	done

DescribeMulchText:
	text "Our Mulch is a"
	line "mix of high-"

	para "quality soil and"
	line "#mon's … er…"

	para "you know. It's"
	line "full of nutrients!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she told me"
	line "it's dangerous."

	para "If I beat Whitney,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Wow, you beat"
	line "Whitney? Cool!"
	done

GoldenrodFlowerShopFloriaItReallyWasAMonText:
	text "So it really was a"
	line "#mon!"
	done
	
FlowerShopBellossomText:
	text "Bellossom: Bel!"
	line "Lossom!!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6
	warp_event  7,  0, GOLDENROD_FLOWER_SHOP_GARDEN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  6,  1, SPRITE_BELLOSSOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FlowerShopBellossomScript, -1
	