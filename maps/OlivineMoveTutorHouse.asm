	object_const_def
	const OLIVINEMOVETUTORHOUSE_SAILOR
	const OLIVINEMOVETUTORHOUSE_PHARMACIST
	const OLIVINEMOVETUTORHOUSE_COOLTRAINER_M

OlivineMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineMoveTutor1Script:
	faceplayer
	opentext
	writetext OlivineMoveTutorAquaTailText
	waitbutton
	special PlaceMoneyTopRight
	writetext OlivineMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 6500
	ifequal HAVE_LESS, .NotEnough
	setval AQUA_TAIL
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend OlivineMoveTutorRefused
	
.TeachMove
	writetext OlivineMoveTutorPayment
	takemoney YOUR_MONEY, 6500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend OlivineMoveTutorAquaTailTaught

.NotEnough
	writetextend OlivineMoveTutorNotEnough

OlivineMoveTutor2Script:
	faceplayer
	opentext
	writetext OlivineMoveTutorPoisonJabText
	waitbutton
	special PlaceMoneyTopRight
	writetext OlivineMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 6500
	ifequal HAVE_LESS, .NotEnough
	setval POISON_JAB
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend OlivineMoveTutorRefused
	
.TeachMove
	writetext OlivineMoveTutorPayment
	takemoney YOUR_MONEY, 6500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend OlivineMoveTutorPoisonJabTaught

.NotEnough
	writetextend OlivineMoveTutorNotEnough

OlivineMoveTutor3Script:
	faceplayer
	opentext
	writetext OlivineMoveTutorNightSlashText
	waitbutton
	special PlaceMoneyTopRight
	writetext OlivineMoveTutorAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 6500
	ifequal HAVE_LESS, .NotEnough
	setval NIGHT_SLASH
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend OlivineMoveTutorRefused
	
.TeachMove
	writetext OlivineMoveTutorPayment
	takemoney YOUR_MONEY, 6500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend OlivineMoveTutorNightSlashTaught

.NotEnough
	writetextend OlivineMoveTutorNotEnough

OlivineMoveTutorAquaTailText:
	ntag " Move Tutor "
	text "Ho, there, young"
	line "trainer!"
	
	para "How would you like"
	line "your #mon to"
	cont "learn Aqua Tail?"
	done

OlivineMoveTutorAquaTailTaught:
	ntag " Move Tutor "
	text "It's a powerful"
	line "move that has a"
	cont "chance to lower"
	cont "the foe's Defense."
	
	para "Relentless as"
	line "the sea!"
	done

OlivineMoveTutorPoisonJabText:
	ntag " Move Tutor "
	text "Hehehe."
	
	para "I can teach your"
	line "#mon how to use"
	cont "Poison Jab."
	done

OlivineMoveTutorPoisonJabTaught:
	ntag " Move Tutor "
	text "It hits hard and"
	line "has a good chance"
	cont "to poison."
	
	para "Hehehe."
	done

OlivineMoveTutorNightSlashText:
	ntag " Move Tutor "
	text "Night Slash."
	
	para "The user slashes"
	line "the foe the moment"
	cont "a chance arises."
	done

OlivineMoveTutorNightSlashTaught:
	ntag " Move Tutor "
	text "It's a wicked move"
	line "with a high crit-"
	cont "rate."
	done

OlivineMoveTutorAskTeachText:
	ntag " Move Tutor "
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥6,500?"
	done

OlivineMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥6,500."
	done

OlivineMoveTutorRefused:
	ntag " Move Tutor "
	text "Come back when"
	line "you like."
	done

OlivineMoveTutorNotEnough:
	ntag " Move Tutor "
	text "Sorry, you can't"
	line "afford it."
	done

OlivineMoveTutorHouse_MapEvents:

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 12
	warp_event  3,  7, OLIVINE_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMoveTutor1Script, -1
	object_event  3,  1, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, OlivineMoveTutor2Script, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMoveTutor3Script, -1
