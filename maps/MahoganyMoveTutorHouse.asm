	object_const_def
	const MAHOGANYMOVETUTORHOUSE_BLACK_BELT
	const MAHOGANYMOVETUTORHOUSE_GRAMPS

MahoganyMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyMoveTutor1Script:
	faceplayer
	opentext
	writetext AskTeachAMoveText
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnough
	writetext AskTeachAMoveTextYesNo
	yesorno
	iffalse .Refused
	writetext MahoganyMoveTutor1WhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .EnergyBall
	ifequal 2, .DarkPulse
	ifequal 3, .AirSlash
	sjump .Refused

.EnergyBall:
	setval ENERGY_BALL
	writetext MahoganyMoveTutor1MoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.DarkPulse:
	setval DARK_PULSE
	writetext MahoganyMoveTutor1MoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.AirSlash:
	setval AIR_SLASH
	writetext MahoganyMoveTutor1MoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext MahoganyMoveTutorRefusalText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext MahoganyMoveTutorIncompatibleText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext MahoganyMoveTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext MahoganyMoveTutor1Payment
	takemoney YOUR_MONEY, 8000
	waitbutton
	writetext MahoganyMoveTutor1TutorUseWisely
	waitbutton
	writetext MahoganyMoveTutor1FarewellKidText
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
	db "ENERGY BALL@"
	db "DARK PULSE@"
	db "AIR SLASH@"
	db "CANCEL@"
	
MahoganyMoveTutorHailScript:
	faceplayer
	opentext
	writetext TutorHailText
	waitbutton
	writetext TutorHailText2
	yesorno
	iffalse .TutorRefused
	setval HAIL
	writetext TutorHailClear
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext TutorHailRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext TutorHailTaught
	waitbutton
	closetext
	end

AskTeachAMoveText:
	text "Hi there!"
	line "For ¥8,000, I can"
	cont "teach your #MON"

	para "amazing moves if"
	line "you'd like."
	done
	
AskTeachAMoveTextYesNo:
	text "Should I teach"
	line "them a move?"
	done

MahoganyMoveTutorRefusalText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#MON a new"
	cont "move!"
	done

MahoganyMoveTutor1WhichMoveShouldITeachText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

MahoganyMoveTutor1Payment:
	text "<PLAYER> gave the"
	line "Tutor ¥8,000."
	done
	
MahoganyMoveTutorNotEnough:
	text "Ooh, sorry, you"
	line "don't have enough…"
	done

MahoganyMoveTutor1TutorUseWisely:
	text "Use these wisely"
	line "to your advantage"
	cont "in battle."
	done

MahoganyMoveTutor1FarewellKidText:
	text "See ya and"
	line "good luck on"
	cont "your journey!"
	done

MahoganyMoveTutorIncompatibleText:
	text "I'm sorry, your"
	line "#MON can't"
	cont "learn this move…"
	done

MahoganyMoveTutor1MoveText:
	text_start
	done
	
TutorHailText:
	text "Hello there!"
	line "I've been making a"
	cont "new weather move!"

	para "PRYCE wanted a"
	line "move that ICE"
	cont "TYPES love."
	
	para "I can teach your"
	line "#MON how to use"
	
	para "HAIL if you'd"
	line "like me to?"	
	done

TutorHailText2:
	para "Should I teach"
	line "them to use HAIL?"
	done

TutorHailRefused:
	text "OK then."
	done
	
TutorHailClear:
	text_start
	done

TutorHailTaught:
	text "For 5 turns non-"
	line "ICE TYPE #MON"

	para "will be damaged"
	line "by ice."
	
	para "It also gives a"
	line "DEF boost to"
	cont "ICE TYPEs!"
	done

MahoganyMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 6
	warp_event  3,  7, MAHOGANY_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor1Script, -1
	object_event  5,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutorHailScript, -1
