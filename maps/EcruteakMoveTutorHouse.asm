	object_const_def
	const ECRUTEAKMOVETUTORHOUSE_HIKER
	const ECRUTEAKMOVETUTORHOUSE_BLACKBELT_T
	const ECRUTEAKMOVETUTORHOUSE_FIREBREATHER

EcruteakMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakMoveTutor1Script:
	faceplayer
	opentext
	writetext EcruteakMoveTutorRockBlastText
	waitbutton
	special PlaceMoneyTopRight
	writetext EcruteakMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnough
	setval ROCK_BLAST
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend EcruteakMoveTutorRefused
	
.TeachMove
	writetext EcruteakMoveTutorPayment
	takemoney YOUR_MONEY, 4000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend EcruteakMoveTutorRockBlastTaught

.NotEnough
	writetextend EcruteakMoveTutorNotEnough

EcruteakMoveTutor2Script:
	faceplayer
	opentext
	writetext EcruteakMoveTutorGrowthPunchText
	waitbutton
	special PlaceMoneyTopRight
	writetext EcruteakMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnough
	setval GROWTH_PUNCH
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend EcruteakMoveTutorRefused
	
.TeachMove
	writetext EcruteakMoveTutorPayment
	takemoney YOUR_MONEY, 4000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend EcruteakMoveTutorGrowthPunchTaught

.NotEnough
	writetextend EcruteakMoveTutorNotEnough

EcruteakMoveTutor3Script:
	faceplayer
	opentext
	writetext EcruteakMoveTutorFlameChargeText
	waitbutton
	special PlaceMoneyTopRight
	writetext EcruteakMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnough
	setval FLAME_CHARGE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend EcruteakMoveTutorRefused
	
.TeachMove
	writetext EcruteakMoveTutorPayment
	takemoney YOUR_MONEY, 4000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend EcruteakMoveTutorFlameChargeTaught

.NotEnough
	writetextend EcruteakMoveTutorNotEnough

EcruteakMoveTutorRockBlastText:
	ntag " Move Tutor "
	text "URAHHH!"
	
	para "Firing off rocks"
	line "one after another"
	cont "at your foe!"
	
	para "That's Rock Blast!"
	done

EcruteakMoveTutorRockBlastTaught:
	ntag " Move Tutor "
	text "It can hit 2-5"
	line "times per attack!"

	para "Rocks rock!"
	done

EcruteakMoveTutorGrowthPunchText:
	ntag " Move Tutor "
	text "Hi-ya!"
	
	para "Damage your foe"
	line "and make yourself"
	cont "stronger."

	para "That is the power"
	line "of Growth Punch."
	done

EcruteakMoveTutorGrowthPunchTaught:
	ntag " Move Tutor "
	text "Everytime you use"
	line "it, your #mon's"
	cont "attack will rise!"
	done

EcruteakMoveTutorFlameChargeText:
	ntag " Move Tutor "
	text "Fwoosh!"
	
	para "Using flames to"
	line "attack and raise"
	cont "your speed!"

	para "The red-hot power"
	line "of Flame Charge!"
	done

EcruteakMoveTutorFlameChargeTaught:
	ntag " Move Tutor "
	text "It might not hit"
	line "the hardest, but"
	cont "boosting speed can"
	cont "help in a pinch!"
	done

EcruteakMoveTutorAskTeachText:
	ntag " Move Tutor "
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥4,000?"
	done

EcruteakMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥4,000."
	done

EcruteakMoveTutorRefused:
	ntag " Move Tutor "
	text "Come back when"
	line "you like."
	done

EcruteakMoveTutorNotEnough:
	ntag " Move Tutor "
	text "Sorry, you can't"
	line "afford it."
	done

EcruteakMoveTutorHouse_MapEvents:

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 18
	warp_event  4,  7, ECRUTEAK_CITY, 18

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakMoveTutor1Script, -1
	object_event  3,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMoveTutor2Script, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakMoveTutor3Script, -1
