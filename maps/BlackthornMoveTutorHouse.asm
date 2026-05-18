	object_const_def
	const BLACKTHORNMOVETUTORHOUSE_GRANNY
	const BLACKTHORNMOVETUTORHOUSE_YOUNGSTER

BlackthornMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BlackthornMoveTutorScript:
	faceplayer
	opentext
	writetext BlackthornAskTeachAMoveText
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnough
	writetext BlackthornAskYesNo
	yesorno
	iffalse .Refused
	writetext BlackthornMoveTutorWontRegretText
	waitbutton
.TutorLoop:
	writetext BlackthornMoveTutorWhichMoveText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Acrobatics
	ifequal 2, .SignalBeam
	ifequal 3, .ZenHeadbutt
	sjump .Refused

.Acrobatics:
	setval ACROBATICS
	writetext BlackthornMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.SignalBeam:
	setval SIGNAL_BEAM
	writetext BlackthornMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.ZenHeadbutt:
	setval ZEN_HEADBUTT
	writetext BlackthornMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop
	
.Refused:
	writetextend BlackthornMoveTutorRefusalText
	
.NotEnough:
	writetextend BlackthornMoveTutorNotEnough

.TeachMove:
	writetext BlackthornMoveTutorPayment
	takemoney YOUR_MONEY, 10000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend BlackthornMoveTutorUseWisely
	
.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Acrobatics@"
	db "Signal Beam@"
	db "Zen Headbutt@"
	db "Cancel@"

BlackthornMoveTutorHouseYoungster:
	jumptextfaceplayer BlackthornMoveTutorHouseYoungsterText

BlackthornAskTeachAMoveText:
	ntag "Move Tutor"
	text "Hello, dear."
	line "Have you come to"
	cont "learn a new move?"
	
	para "For ¥10,000, I can"
	line "teach your #mon"
	cont "one of three:"

	para "Acrobatics,"
	line "Signal Beam, or"
	cont "Zen Headbutt."
	done
	
BlackthornAskYesNo:
	ntag "Move Tutor"
	text "Should I teach"
	line "them a move, dear?"
	done

BlackthornMoveTutorRefusalText:
	ntag "Move Tutor"
	text "Come back if you"
	line "want a new move,"
	cont "dear."
	done

BlackthornMoveTutorWontRegretText:
	ntag "Move Tutor"
	text "Very good. You"
	line "won't regret it,"
	cont "dear."
	done

BlackthornMoveTutorWhichMoveText:
	ntag "Move Tutor"
	text "Which move should"
	line "I teach, dear?"
	done

BlackthornMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥10,000."
	done
	
BlackthornMoveTutorNotEnough:
	ntag "Move Tutor"
	text "Ooh, I'm sorry,"
	line "dear, you don't"
	cont "have enough…"
	done

BlackthornMoveTutorUseWisely:
	ntag "Move Tutor"
	text "Bye-bye, dear."
	
	para "good luck on your"
	line "journey and stay"
	cont "safe out there."
	done

BlackthornMoveTutorMoveText:
	text_start
	done

BlackthornMoveTutorHouseYoungsterText:
	text "Oh, I'm not a"
	line "Tutor, but I want"
	cont "to be like Granny"
	cont "when I grow up!"
	done

BlackthornMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 9
	warp_event  3,  7, BLACKTHORN_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMoveTutorScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMoveTutorHouseYoungster, -1
