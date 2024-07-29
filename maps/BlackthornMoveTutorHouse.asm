	object_const_def
	const BLACKTHORNMOVETUTORHOUSE_GRANNY
	const BLACKTHORNMOVETUTORHOUSE_COOLTRAINER_M

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
	sjump .Incompatible

.SignalBeam:
	setval SIGNAL_BEAM
	writetext BlackthornMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.ZenHeadbutt:
	setval ZEN_HEADBUTT
	writetext BlackthornMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext BlackthornMoveTutorRefusalText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext BlackthornMoveTutorIncompatibleText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext BlackthornMoveTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext BlackthornMoveTutorPayment
	takemoney YOUR_MONEY, 10000
	waitbutton
	writetext BlackthornMoveTutorUseWisely
	waitbutton
	writetext BlackthornMoveTutorFarewellKidText
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
	db "Acrobatics@"
	db "Signal Beam@"
	db "Zen Headbutt@"
	db "Cancel@"

BlackthornAskTeachAMoveText:
	text "Hi there!"
	line "For ¥10,000, I can"
	cont "teach your #mon"

	para "amazing moves if"
	line "you'd like."
	done
	
BlackthornAskYesNo:
	text "Should I teach"
	line "them a move?"
	done

BlackthornMoveTutorRefusalText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#mon a new"
	cont "move!"
	done

BlackthornMoveTutorWhichMoveText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

BlackthornMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥10,000."
	done
	
BlackthornMoveTutorNotEnough:
	text "Ooh, sorry, you"
	line "don't have enough…"
	done

BlackthornMoveTutorUseWisely:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

BlackthornMoveTutorFarewellKidText:
	text "See ya and"
	line "good luck on"
	cont "your journey!"
	done

BlackthornMoveTutorIncompatibleText:
	text "I'm sorry, your"
	line "#mon can't"
	cont "learn this move…"
	done

BlackthornMoveTutorMoveText:
	text_start
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
