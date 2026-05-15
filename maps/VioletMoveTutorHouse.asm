	object_const_def
	const VIOLETMOVETUTORHOUSE_GRAMPS
	const VIOLETMOVETUTORHOUSE_GRANNY

VioletMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VioletMoveTutor1Script:
	faceplayer
	opentext
	writetext VioletMoveTutorIcicleSpearText
	waitbutton
	special PlaceMoneyTopRight
	writetext VioletMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, .NotEnough
	setval ICICLE_SPEAR
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend VioletMoveTutorRefused
	
.TeachMove
	writetext VioletMoveTutorPayment
	takemoney YOUR_MONEY, 2500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend VioletMoveTutorIcicleSpearTaught

.NotEnough
	writetextend VioletMoveTutorNotEnough

VioletMoveTutor2Script:
	faceplayer
	opentext
	writetext VioletMoveTutorSandTombText
	waitbutton
	special PlaceMoneyTopRight
	writetext VioletMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, .NotEnough
	setval SAND_TOMB
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend VioletMoveTutorRefused
	
.TeachMove
	writetext VioletMoveTutorPayment
	takemoney YOUR_MONEY, 2500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend VioletMoveTutorSandTombTaught

.NotEnough
	writetextend VioletMoveTutorNotEnough

VioletMoveTutorIcicleSpearText:
	ntag "Move Tutor"
	text "Hello, young one."
	
	para "I specialise in"
	line "the multi-hit"
	cont "move, Icicle"
	cont "Spear."
	done

VioletMoveTutorIcicleSpearTaught:
	ntag "Move Tutor"
	text "It can hit a few"
	line "times and deal a"
	cont "lot of damage."
	
	para "It can also only"
	line "hit once or twice"
	cont "for little damage."
	
	para "Life is all about"
	line "balance. Hehehe."
	done

VioletMoveTutorSandTombText:
	ntag "Move Tutor"
	text "Hello, dear."
	
	para "I specialise in"
	line "the useful trap-"
	cont "ping move, Sand"
	cont "Tomb."
	done

VioletMoveTutorSandTombTaught:
	ntag "Move Tutor"
	text "It traps your foe"
	line "and deals it extra"
	cont "damage each turn."
	
	para "But, it can't hit"
	line "Flying types."

	para "Life is all about"
	line "balance. Hohoho."
	done

VioletMoveTutorAskTeachText:
	ntag "Move Tutor"
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥2,500?"
	done

VioletMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥2,500."
	done

VioletMoveTutorRefused:
	ntag "Move Tutor"
	text "Please return when"
	line "you see fit."
	done

VioletMoveTutorNotEnough:
	ntag "Move Tutor"
	text "Sorry, you can't"
	line "afford it."
	done

VioletMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 13
	warp_event  4,  7, VIOLET_CITY, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletMoveTutor1Script, -1
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletMoveTutor2Script, -1
