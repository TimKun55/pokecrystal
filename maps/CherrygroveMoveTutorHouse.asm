	object_const_def
	const CHERRYGROVEMOVETUTORHOUSE_COOLTRAINER_M1
	const CHERRYGROVEMOVETUTORHOUSE_COOLTRAINER_F
	const CHERRYGROVEMOVETUTORHOUSE_COOLTRAINER_M2

CherrygroveMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveMoveTutor1Script:
	faceplayer
	opentext
	writetext CherrygroveMoveTutorStoneEdgeText
	waitbutton
	special PlaceMoneyTopRight
	writetext CherrygroveMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnough
	setval STONE_EDGE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend CherrygroveMoveTutorRefused
	
.TeachMove
	writetext CherrygroveMoveTutorPayment
	takemoney YOUR_MONEY, 20000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CherrygroveMoveTutorStoneEdgeTaught

.NotEnough
	writetextend CherrygroveMoveTutorNotEnough

CherrygroveMoveTutor2Script:
	faceplayer
	opentext
	writetext CherrygroveMoveTutorGunkShotText
	waitbutton
	special PlaceMoneyTopRight
	writetext CherrygroveMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnough
	setval GUNK_SHOT
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend CherrygroveMoveTutorRefused
	
.TeachMove
	writetext CherrygroveMoveTutorPayment
	takemoney YOUR_MONEY, 20000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CherrygroveMoveTutorGunkShotTaught

.NotEnough
	writetextend CherrygroveMoveTutorNotEnough

CherrygroveMoveTutor3Script:
	faceplayer
	opentext
	writetext CherrygroveMoveTutorFocusBlastText
	waitbutton
	special PlaceMoneyTopRight
	writetext CherrygroveMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnough
	setval FOCUS_BLAST
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend CherrygroveMoveTutorRefused
	
.TeachMove
	writetext CherrygroveMoveTutorPayment
	takemoney YOUR_MONEY, 20000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CherrygroveMoveTutorFocusBlastTaught

.NotEnough
	writetextend CherrygroveMoveTutorNotEnough

CherrygroveMoveTutorStoneEdgeText:
	ntag "Move Tutor"
	text "Trainer!"
	
	para "I have mastered"
	line "the powerful move"
	cont "Stone Edge."
	done

CherrygroveMoveTutorStoneEdgeTaught:
	ntag "Move Tutor"
	text "It's a powerful"
	line "move that has a"
	cont "high critical-hit"
	cont "rate. Use it well."
	done

CherrygroveMoveTutorGunkShotText:
	ntag "Move Tutor"
	text "Hello there."
	
	para "I have mastered"
	line "the powerful move"
	cont "Gunk Shot."
	done

CherrygroveMoveTutorGunkShotTaught:
	ntag "Move Tutor"
	text "It might miss"
	line "sometimes, but"
	cont "it hits hard."
	
	para "And, of course, it"
	line "might poison your"
	cont "foe, too."
	done

CherrygroveMoveTutorFocusBlastText:
	ntag "Move Tutor"
	text "Hello, young"
	line "trainer!"
	
	para "Through intense"
	line "training, I have"
	cont "mastered the move"
	cont "Focus Blast."
	done

CherrygroveMoveTutorFocusBlastTaught:
	ntag "Move Tutor"
	text "It might miss"
	line "sometimes, but"
	cont "it hits hard."
	
	para "It might also drop"
	line "your foe's Special"
	cont "Defense."
	done

CherrygroveMoveTutorAskTeachText:
	ntag "Move Tutor"
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥20,000?"
	done

CherrygroveMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥20,000."
	done

CherrygroveMoveTutorRefused:
	ntag "Move Tutor"
	text "Come back when"
	line "you like."
	done

CherrygroveMoveTutorNotEnough:
	ntag "Move Tutor"
	text "Sorry, you can't"
	line "afford it."
	done

CherrygroveMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 6
	warp_event  3,  7, CHERRYGROVE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CherrygroveMoveTutor1Script, -1
	object_event  3,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CherrygroveMoveTutor2Script, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CherrygroveMoveTutor3Script, -1
