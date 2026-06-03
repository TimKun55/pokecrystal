	object_const_def
	const CIANWOODMOVETUTORHOUSE_BUG_MANIAC
	const CIANWOODMOVETUTORHOUSE_BLACK_BELT
	const CIANWOODMOVETUTORHOUSE_SAILOR

CianwoodMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodMoveTutor1Script:
	faceplayer
	opentext
	writetext CianwoodMoveTutorXScissorText
	waitbutton
	special PlaceMoneyTopRight
	writetext CianwoodMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnough
	setval X_SCISSOR
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend CianwoodMoveTutorRefused

.TeachMove
	writetext CianwoodMoveTutorPayment
	takemoney YOUR_MONEY, 8000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CianwoodMoveTutorXScissorTaught

.NotEnough
	writetextend CianwoodMoveTutorNotEnough

CianwoodMoveTutor2Script:
	faceplayer
	opentext
	writetext CianwoodMoveTutorDrainPunchText
	waitbutton
	special PlaceMoneyTopRight
	writetext CianwoodMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnough
	setval DRAIN_PUNCH
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend CianwoodMoveTutorRefused

.TeachMove
	writetext CianwoodMoveTutorPayment
	takemoney YOUR_MONEY, 8000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CianwoodMoveTutorDrainPunchTaught

.NotEnough
	writetextend CianwoodMoveTutorNotEnough

CianwoodMoveTutor3Script:
	faceplayer
	opentext
	writetext CianwoodMoveTutorWaterPulseText
	waitbutton
	special PlaceMoneyTopRight
	writetext CianwoodMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnough
	setval WATER_PULSE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend CianwoodMoveTutorRefused

.TeachMove
	writetext CianwoodMoveTutorPayment
	takemoney YOUR_MONEY, 8000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CianwoodMoveTutorWaterPulseTaught

.NotEnough
	writetextend CianwoodMoveTutorNotEnough
	
CianwoodMoveTutorXScissorText:
	ntag " Move Tutor "
	text "Hi there!"

	para "I've been working"
	line "on a new move;"
	cont "X-Scissor!"
	done
	
CianwoodMoveTutorXScissorTaught:
	ntag " Move Tutor "
	text "Nothing fancy."
	line "Just a hard-hit-"
	cont "ting move!"
	
	para "Bugsy helped me"
	line "develop it."
	done

CianwoodMoveTutorDrainPunchText:
	ntag " Move Tutor "
	text "Damage and healing"
	line "in one attack."
	
	para "That is the move"
	line "Drain Punch."
	done

CianwoodMoveTutorDrainPunchTaught:
	ntag " Move Tutor "
	text "Punch your way to"
	line "victory!"
	done

CianwoodMoveTutorWaterPulseText:
	ntag " Move Tutor "
	text "After all my years"
	line "at sea, I can pass"
	cont "on what I have"
	cont "learned out there."
	
	para "Water Pulse!"
	done

CianwoodMoveTutorWaterPulseTaught:
	ntag " Move Tutor "
	text "Good damage and a"
	line "chance to inflict"
	cont "confusion."
	
	para "Just as wild as"
	line "the sea!"
	done

CianwoodMoveTutorAskTeachText:
	ntag " Move Tutor "
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥8,000?"
	done

CianwoodMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥8,000."
	done

CianwoodMoveTutorRefused:
	ntag " Move Tutor "
	text "Come back when"
	line "you like."
	done

CianwoodMoveTutorNotEnough:
	ntag " Move Tutor "
	text "Sorry, you can't"
	line "afford it."
	done

CianwoodMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 8
	warp_event  3,  7, CIANWOOD_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodMoveTutor1Script, -1
	object_event  4,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodMoveTutor2Script, -1
	object_event  5,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodMoveTutor3Script, -1
