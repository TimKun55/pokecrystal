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
	sjump .Incompatible

.DarkPulse:
	setval DARK_PULSE
	writetext MahoganyMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.AirSlash:
	setval AIR_SLASH
	writetext MahoganyMoveTutorMoveText
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
	sjump .Incompatible

.Sandstorm:
	setval SANDSTORM
	writetext MahoganyMoveTutorMoveText
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
	writetext MahoganyMoveTutorWeather1Payment
	takemoney YOUR_MONEY, 2000
	waitbutton
	writetext MahoganyMoveTutorWeatherTutorUseWisely
	waitbutton
	writetext MahoganyMoveTutorWeatherGoodluckText
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
	db "HAIL@"
	db "SANDSTORM@"
	db "CANCEL@"

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
	sjump .Incompatible

.SunnyDay:
	setval SUNNY_DAY
	writetext MahoganyMoveTutorMoveText
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
	writetext MahoganyMoveTutorWeather2Payment
	takemoney YOUR_MONEY, 1500
	waitbutton
	writetext MahoganyMoveTutorWeatherTutorUseWisely
	waitbutton
	writetext MahoganyMoveTutorWeatherGoodluckText
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
	db "RAIN DANCE@"
	db "SUNNY DAY@"
	db "CANCEL@"

TutorHouseBookshelfLeft:
	jumptext TutorHouseBookshelfLeftText

TutorHouseBookshelfRight:
	jumptext TutorHouseBookshelfRightText

AskTeachAMove1Text:
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
	text "Come back if"
	line "you want to"
	
	para "teach your"
	line "#MON a new"
	cont "move!"
	done

MahoganyMoveTutorWhichMoveShouldITeachText:
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

MahoganyMoveTutorMoveText:
	text_start
	done

AskTeachAMoveWeather1Text:
	text "Hi there!"
	line "How's the weather?"
	
	para "I teach damaging"
	line "weather MOVES to"
	cont "#MON for"
	cont "¥2,000."
	done

AskTeachAMoveWeather2Text:
	text "Hi there!"
	line "How's the weather?"
	
	para "I teach weather"
	line "MOVES to #MON"
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
	done

MahoganyMoveTutorWeatherGoodluckText:
	text "Good luck"
	line "out there!"
	done

TutorHouseBookshelfLeftText:
	text "RAIN DANCE makes"
	line "WATER moves stron-"
	cont "ger and FIRE moves"
	cont "weaker."
	
	para "It also gives"
	line "THUNDER full"
	cont "accuracy, as well"
	cont "as HURRICANE."
	
	para "It also weakens"
	line "SOLARBEAM."
	
	para "SUNNY DAY makes"
	line "FIRE moves stron-"
	cont "get and WATER"
	cont "moves weaker."
	
	para "SOLARBEAM fires"
	line "off without a"
	cont "charge up turn."
	done

TutorHouseBookshelfRightText:
	text "SANDSTORM damages"
	line "all TYPES each"
	
	para "turn except for"
	line "GROUND, ROCK"
	cont "and STEEL TYPES."
	
	para "Increases the"
	line "SPCL.DEF of"
	
	para "ROCK TYPES by"
	line "1.5x while active."

	para "HAIL damages all"
	line "TYPES each turn"
	
	para "except for"
	line "ICE TYPES."
	
	para "Increases the"
	line "DEFENSE of"
	
	para "ICE TYPES by"
	line "1.5x while active."
	
	para "It also weakens"
	line "SOLARBEAM."
	done	

MahoganyMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 6
	warp_event  3,  7, MAHOGANY_TOWN, 6

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, TutorHouseBookshelfLeft
	bg_event  7,  1, BGEVENT_READ, TutorHouseBookshelfRight

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor1Script, -1
	object_event  5,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor2, -1
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMoveTutor3, -1
