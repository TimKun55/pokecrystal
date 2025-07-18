	object_const_def
	const MAHOGANYMOVETUTORHOUSE_BLACK_BELT
	const MAHOGANYMOVETUTORHOUSE_SUPER_NERD1
	const MAHOGANYMOVETUTORHOUSE_SUPER_NERD2

MahoganyMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyMoveTutor1Script:
	faceplayer
	opentext
	writetext AskTeachAMove1Text
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 8000
	ifequal HAVE_LESS, .NotEnough
	writetext AskTeachAMoveTextYesNo
	yesorno
	iffalse .Refused
	writetext MahoganyMoveTutorWontRegretText
	waitbutton
.TutorLoop:
	writetext MahoganyMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .EnergyBall
	ifequal 2, .DarkPulse
	ifequal 3, .AirSlash
	sjump .Refused

.EnergyBall:
	setval ENERGY_BALL
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.DarkPulse:
	setval DARK_PULSE
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.AirSlash:
	setval AIR_SLASH
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop
	
.Refused:
	writetext MahoganyMoveTutorRefusalText
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
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext MahoganyMoveTutor1TutorUseWisely
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
	db "Energy Ball@"
	db "Dark Pulse@"
	db "Air Slash@"
	db "Cancel@"
	
MahoganyMoveTutor2:
	faceplayer
	opentext
	writetext AskTeachAMoveWeather1Text
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, .NotEnough
	writetext AskTeachAMoveTextYesNo
	yesorno
	iffalse .Refused
	writetext MahoganyMoveTutorWontRegretText
	waitbutton
.TutorLoop:
	writetext MahoganyMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Hail
	ifequal 2, .Sandstorm
	sjump .Refused

.Hail:
	setval HAIL
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.Sandstorm:
	setval SANDSTORM
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.Refused:
	writetext MahoganyMoveTutorRefusalText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext MahoganyMoveTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext MahoganyMoveTutorWeather1Payment
	takemoney YOUR_MONEY, 2000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext MahoganyMoveTutorWeatherTutorUseWisely
	waitbutton
	closetext
	end
	
.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Hail@"
	db "Sandstorm@"
	db "Cancel@"

MahoganyMoveTutor3:
	faceplayer
	opentext
	writetext AskTeachAMoveWeather2Text
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, .NotEnough
	writetext AskTeachAMoveTextYesNo
	yesorno
	iffalse .Refused
	writetext MahoganyMoveTutorWontRegretText
	waitbutton
.TutorLoop:
	writetext MahoganyMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RainDance
	ifequal 2, .SunnyDay
	sjump .Refused

.RainDance:
	setval RAIN_DANCE
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.SunnyDay:
	setval SUNNY_DAY
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.Refused:
	writetext MahoganyMoveTutorRefusalText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext MahoganyMoveTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext MahoganyMoveTutorWeather2Payment
	takemoney YOUR_MONEY, 1500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext MahoganyMoveTutorWeatherTutorUseWisely
	waitbutton
	closetext
	end
	
.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Rain Dance@"
	db "Sunny Day@"
	db "Cancel@"

TutorHouseBookshelfLeft:
	jumptext TutorHouseBookshelfLeftText

TutorHouseBookshelfRight:
	jumptext TutorHouseBookshelfRightText

AskTeachAMove1Text:
	text "Hi there!"
	line "For ¥8,000, I can"
	cont "teach your #mon"

	para "amazing moves if"
	line "you'd like."
	done
	
AskTeachAMoveTextYesNo:
	text "Should I teach"
	line "them a move?"
	done

MahoganyMoveTutorRefusalText:
	text "Come back if"
	line "you want to"
	
	para "teach your"
	line "#mon a new"
	cont "move!"
	done

MahoganyMoveTutorWontRegretText:
	text "Great! You won't"
	line "regret it!"
	done

MahoganyMoveTutorWhichMoveShouldITeachText:
	text "Which move should"
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

	para "See ya and"
	line "good luck on"
	cont "your journey!"
	done

MahoganyMoveTutorMoveText:
	text_start
	done

AskTeachAMoveWeather1Text:
	text "Hi there!"
	line "How's the weather?"
	
	para "I teach damaging"
	line "Weather Moves to"
	cont "#mon for"
	cont "¥2,000."
	done

AskTeachAMoveWeather2Text:
	text "Hi there!"
	line "How's the weather?"
	
	para "I teach Weather"
	line "Moves to #mon"
	cont "for ¥1,500."
	done

MahoganyMoveTutorWeather1Payment:
	text "<PLAYER> gave the"
	line "Tutor ¥2,000."
	done

MahoganyMoveTutorWeather2Payment:
	text "<PLAYER> gave the"
	line "Tutor ¥1,500."
	done

MahoganyMoveTutorWeatherTutorUseWisely:
	text "If you'd like to"
	line "learn more about"
	cont "these moves,"
	
	para "check out our"
	line "bookshelf!"

	para "Good luck"
	line "out there!"
	done

TutorHouseBookshelfLeftText:
	text "Rain Dance makes"
	line "Water moves stron-"
	cont "ger and Fire moves"
	cont "weaker."
	
	para "It also gives"
	line "Thunder full"
	cont "accuracy, as well"
	cont "as Hurricane."
	
	para "It also weakens"
	line "Solarbeam."
	
	para "Sunny Day makes"
	line "Fire moves stron-"
	cont "get and Water"
	cont "moves weaker."
	
	para "Solarbeam fires"
	line "off without a"
	cont "charge up turn."
	done

TutorHouseBookshelfRightText:
	text "Sandstorm damages"
	line "all Types each"
	
	para "turn except for"
	line "Ground, Rock"
	cont "and Steel Types."
	
	para "Increases the"
	line "Special Defense of"
	
	para "Rock Types by"
	line "1.5x while active."

	para "Hail damages all"
	line "Types each turn"
	
	para "except for"
	line "Ice Types."
	
	para "Increases the"
	line "Defense of"
	
	para "Ice Types by"
	line "1.5x while active."
	
	para "It also weakens"
	line "Solarbeam."
	done

MahoganyMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 7
	warp_event  3,  7, MAHOGANY_TOWN, 7

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, TutorHouseBookshelfLeft
	bg_event  7,  1, BGEVENT_READ, TutorHouseBookshelfRight

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor1Script, -1
	object_event  5,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor2, -1
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor3, -1
