DEF SAFFRONMAGNETTRAINSTATION_FRESH_WATER_PRICE EQU 200
DEF SAFFRONMAGNETTRAINSTATION_SODA_POP_PRICE    EQU 300
DEF SAFFRONMAGNETTRAINSTATION_LEMONADE_PRICE    EQU 350

	object_const_def
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUIDE
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS

SaffronMagnetTrainStation_MapScripts:
	def_scene_scripts
	scene_script SaffronMagnetTrainStationNoopScene, SCENE_SAFFRONMAGNETTRAINSTATION_ARRIVE_FROM_GOLDENROD

	def_callbacks

SaffronMagnetTrainStationNoopScene:
	end

SaffronMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval TRUE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuideText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText
	
SaffronMagnetTrainStationVendingMachine:
	opentext
	writetext SaffronMagnetTrainStationVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, SAFFRONMAGNETTRAINSTATION_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, SAFFRONMAGNETTRAINSTATION_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, SAFFRONMAGNETTRAINSTATION_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, SAFFRONMAGNETTRAINSTATION_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, SAFFRONMAGNETTRAINSTATION_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, SAFFRONMAGNETTRAINSTATION_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext SaffronMagnetTrainStationClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext SaffronMagnetTrainStationVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext SaffronMagnetTrainStationVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Fresh Water  ¥{d:SAFFRONMAGNETTRAINSTATION_FRESH_WATER_PRICE}@"
	db "Soda Pop     ¥{d:SAFFRONMAGNETTRAINSTATION_SODA_POP_PRICE}@"
	db "Lemonade     ¥{d:SAFFRONMAGNETTRAINSTATION_LEMONADE_PRICE}@"
	db "Cancel@"

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "I'm sorry, but the"
	line "Magnet Train isn't"
	cont "operating now."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "We'll soon depart"
	line "for Goldenrod."

	para "Are you coming on"
	line "board?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "May I see your"
	line "rail Pass, please?"

	para "OK. Right this"
	line "way, please."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Sorry, but you"
	line "don't have a Pass."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "We hope to see you"
	line "again."
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "We have arrived in"
	line "Saffron."

	para "We hope to see you"
	line "again."
	done

SaffronMagnetTrainStationGymGuideText:
	text "The Magnet Train"
	line "is a super-modern"

	para "rail liner that"
	line "uses electricity"

	para "and magnets to"
	line "attain incredible"
	cont "speed."

	para "However, if there"
	line "isn't any elec-"
	cont "tricity…"
	done

SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart:
	text "Whew…"

	para "How many times"
	line "have I gone back"

	para "and forth between"
	line "Kanto and Johto?"
	done

SaffronMagnetTrainStationTeacherText:
	text "Before the Magnet"
	line "Train Station was"

	para "built, there was a"
	line "house there."

	para "A little girl"
	line "named Copycat used"
	cont "to live there."
	done

SaffronMagnetTrainStationLassText:
	text "Hi. Do you have a"
	line "rail Pass? I have"

	para "one. All the peo-"
	line "ple in Saffron who"

	para "ride the Magnet"
	line "Train have Passes."
	done
	
SaffronMagnetTrainStationVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

SaffronMagnetTrainStationClangText:
	text "Clang! A can of"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "popped out!"
	done

SaffronMagnetTrainStationVendingNoMoneyText:
	text "Oops, not enough"
	line "money."
	done

SaffronMagnetTrainStationVendingNoSpaceText:
	text "There's no more"
	line "room for stuff."
	done

SaffronMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_SAFFRONMAGNETTRAINSTATION_ARRIVE_FROM_GOLDENROD, Script_ArriveFromGoldenrod

	def_bg_events
	bg_event  4, 15, BGEVENT_UP, SaffronMagnetTrainStationVendingMachine
	bg_event  5, 15, BGEVENT_UP, SaffronMagnetTrainStationVendingMachine
	bg_event 12, 15, BGEVENT_UP, SaffronMagnetTrainStationVendingMachine
	bg_event 13, 15, BGEVENT_UP, SaffronMagnetTrainStationVendingMachine

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuideScript, -1
	object_event  6, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  7, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
