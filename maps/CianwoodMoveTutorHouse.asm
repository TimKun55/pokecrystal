	object_const_def
	const CIANWOODMOVETUTORHOUSE_COOLTRAINER_F
	const CIANWOODMOVETUTORHOUSE_YOUNGSTER

CianwoodMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodMoveTutorScript:
	faceplayer
	opentext
	writetext CianwoodTutorIntro
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnough
	writetext CianwoodAskYesNo
	yesorno
	iffalse .Refused
	writetext CianwoodMoveTutorWontRegretText
	waitbutton
.TutorLoop:
	writetext CianwoodMoveTutorWhichMoveText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .XScissor
	ifequal 2, .DrainPunch
	ifequal 3, .WaterPulse
	sjump .Refused

.XScissor:
	setval X_SCISSOR
	writetext CianwoodMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.DrainPunch:
	setval DRAIN_PUNCH
	writetext CianwoodMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.WaterPulse:
	setval WATER_PULSE
	writetext CianwoodMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop
	
.Refused:
	writetextend CianwoodMoveTutorRefusalText
	
.NotEnough:
	writetextend CianwoodMoveTutorNotEnough

.TeachMove:
	writetext CianwoodMoveTutorPayment
	takemoney YOUR_MONEY, 8000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend CianwoodMoveTutorUseWisely
	
.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "X-Scissor@"
	db "Drain Punch@"
	db "Water Pulse@"
	db "Cancel@"

Kai:
	faceplayer
	opentext
	trade NPC_TRADE_KAI
	waitbutton
	closetext
	end

CianwoodTutorIntro:
	text "Hi there!"
	line "For ¥8000, I can"
	cont "teach your #mon"

	para "amazing moves if"
	line "you'd like."
	done
	
CianwoodAskYesNo:
	text "Should I teach"
	line "them a move?"
	done

CianwoodMoveTutorRefusalText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#mon a new"
	cont "move!"
	done

CianwoodMoveTutorWontRegretText:
	text "Great! You won't"
	line "regret it!"
	done

CianwoodMoveTutorWhichMoveText:
	text "Which move should"
	line "I teach?"
	done

CianwoodMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥8000."
	done
	
CianwoodMoveTutorNotEnough:
	text "Ooh, sorry, you"
	line "don't have enough…"
	done

CianwoodMoveTutorUseWisely:
	para "See ya and"
	line "good luck on"
	cont "your journey!"
	done

CianwoodMoveTutorMoveText:
	text_start
	done

CianwoodMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodMoveTutorScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Kai, -1
