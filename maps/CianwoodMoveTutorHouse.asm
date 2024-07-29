	object_const_def
	const CIANWOODMOVETUTORHOUSE_COOLTRAINER_F

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
	sjump .Incompatible

.DrainPunch:
	setval DRAIN_PUNCH
	writetext CianwoodMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.WaterPulse:
	setval WATER_PULSE
	writetext CianwoodMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext CianwoodMoveTutorRefusalText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext CianwoodMoveTutorIncompatibleText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext CianwoodMoveTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext CianwoodMoveTutorPayment
	takemoney YOUR_MONEY, 8000
	waitbutton
	writetext CianwoodMoveTutorUseWisely
	waitbutton
	writetext CianwoodMoveTutorFarewellKidText
	waitbutton
	closetext
	end
	
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

CianwoodTutorIntro:
	text "Hi there!"
	line "For ¥8000, I can"
	para "teach your #mon"

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

CianwoodMoveTutorWhichMoveText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
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
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

CianwoodMoveTutorFarewellKidText:
	text "See ya and"
	line "good luck on"
	cont "your journey!"
	done

CianwoodMoveTutorIncompatibleText:
	text "I'm sorry, your"
	line "#mon can't"
	cont "learn this move…"
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
