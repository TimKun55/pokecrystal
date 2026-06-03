	object_const_def
	const GOLDENRODMOVETUTORHOUSE_POKEFAN_M
	const GOLDENRODMOVETUTORHOUSE_TWIN
	const GOLDENRODMOVETUTORHOUSE_BUG_CATCHER

GoldenrodMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodMoveTutorHouseTutorScript:
	faceplayer
	opentext
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkevent EVENT_TEAM_ROCKET_DISBANDED
	iffalse .NotTeachingMoves
	writetext GoldenrodMoveTutorHouseAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodMoveTutorHouseAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodMoveTutorHouseWontRegretText
	waitbutton
.TutorLoop:
	writetext GoldenrodMoveTutorHouseWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Refused

.Flamethrower:
	setval MT01_MOVE
	writetext GoldenrodMoveTutorHouseMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.Thunderbolt:
	setval MT02_MOVE
	writetext GoldenrodMoveTutorHouseMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.IceBeam:
	setval MT03_MOVE
	writetext GoldenrodMoveTutorHouseMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Flamethrower@"
	db "Thunderbolt@"
	db "Ice Beam@"
	db "Cancel@"

.Refused:
	writetextend GoldenrodMoveTutorHouseAwwButTheyreAmazingText

.Refused2:
	writetextend GoldenrodMoveTutorHouseHmTooBadText

.TeachMove:
	writetext GoldenrodMoveTutorHouseIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetextend GoldenrodMoveTutorHouseFarewellKidText

.NotEnoughMoney:
	writetextend GoldenrodMoveTutorHouseYouDontHaveEnoughCoinsText

.NotTeachingMoves:
	writetextend GoldenrodMoveTutorHouseNotTeachingText

.NoCoinCase:
	writetextend GoldenrodMoveTutorHouseNoCoinCaseText

GoldenrodMoveTutorHouseTwinScript:
	checkevent EVENT_TEAM_ROCKET_DISBANDED
	iffalse .TwinMad
	jumptextfaceplayer GoldenrodMoveTutorHouseTwinText

.TwinMad:
	jumptextfaceplayer GoldenrodMoveTutorHouseTwinMadText

GoldenrodMoveTutorHouseBugCatcherScript:
	checkevent EVENT_TEAM_ROCKET_DISBANDED
	iffalse .BugCatcherSad
	jumptextfaceplayer GoldenrodMoveTutorHouseBugCatcherText

.BugCatcherSad:
	jumptextfaceplayer GoldenrodMoveTutorHouseBugCatcherSadText

GoldenrodMoveTutorHouseBookshelf:
	jumpstd DifficultBookshelfScript

GoldenrodMoveTutorHouseRadio:
	jumpstd Radio2Script

GoldenrodMoveTutorHouseAskTeachAMoveText:
	ntag " Move Tutor "
	text "Flamethrower,"
	line "Thunderbolt,"
	cont "Ice Beam."

	para "I can teach your"
	line "#mon these in-"
	cont "credible moves if"
	cont "you'd like."

	para "Should I teach a"
	line "new move?"
	done

GoldenrodMoveTutorHouseAsk4000CoinsOkayText:
	ntag " Move Tutor "
	text "It will cost you"
	line "4,000 coins. Okay?"
	done

GoldenrodMoveTutorHouseAwwButTheyreAmazingText:
	ntag " Move Tutor "
	text "Aww… But they're"
	line "amazing…"
	done

GoldenrodMoveTutorHouseWontRegretText:
	ntag " Move Tutor "
	text "Wahahah! You won't"
	line "regret it!"
	done

GoldenrodMoveTutorHouseWhichMoveShouldITeachText:
	ntag " Move Tutor "
	text "Which move should"
	line "I teach?"
	done

GoldenrodMoveTutorHouseHmTooBadText:
	ntag " Move Tutor "
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

GoldenrodMoveTutorHouseIfYouUnderstandYouveMadeItText:
	ntag " Move Tutor "
	text "If you understand"
	line "what's so amazing"
	cont "about this move,"
	cont "you've made it as"
	cont "a trainer."
	done

GoldenrodMoveTutorHouseFarewellKidText:
	ntag " Move Tutor "
	text "Wahahah!"
	line "Farewell, kid!"
	done

GoldenrodMoveTutorHouseYouDontHaveEnoughCoinsText:
	ntag " Move Tutor "
	text "…You don't have"
	line "enough coins here…"
	done

GoldenrodMoveTutorHouseNotTeachingText:
	ntag " Move Tutor "
	text "I can teach your"
	line "#mon powerful"
	cont "moves-"

	para "…sigh…"
	line "……"

	para "I'm not really in"
	line "the teaching mood"
	cont "right now, though."
	
	para "Come back later."
	done

GoldenrodMoveTutorHouseNoCoinCaseText:
	ntag " Move Tutor "
	text "I can teach your"
	line "#mon powerful"
	cont "moves-"
	
	para "Oh!"
	
	para "You don't have a"
	line "Coin Case."
	
	para "Come back when you"
	line "get one and have"
	cont "some Coins."
	done

GoldenrodMoveTutorHouseMoveText:
	text_start
	done

GoldenrodMoveTutorHouseTwinText:
	text "Yay!"
	line "I finally got my"
	cont "#mon to learn"
	cont "Ice Beam!"
	done

GoldenrodMoveTutorHouseTwinMadText:
	text "Ahh, I really"
	line "want my #mon"
	cont "to learn Ice"
	cont "Beam!"
	
	para "But he won't teach"
	line "anything!"
	cont "Argh!"
	done

GoldenrodMoveTutorHouseBugCatcherText:
	text "Alright!"
	line "Now my #mon can"
	cont "use Thunderbolt!"
	
	para "Awesome!"
	done

GoldenrodMoveTutorHouseBugCatcherSadText:
	text "Sigh, I came all"
	line "the way here to"
	cont "learn a new move."
	
	para "This guy isn't in"
	line "the mood to teach"
	cont "anyone anything."
	
	para "Sigh…"
	done

GoldenrodMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 22
	warp_event  3,  7, GOLDENROD_CITY, 22

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GoldenrodMoveTutorHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GoldenrodMoveTutorHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, GoldenrodMoveTutorHouseRadio

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodMoveTutorHouseTutorScript, -1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMoveTutorHouseTwinScript, -1
	object_event  5,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMoveTutorHouseBugCatcherScript, -1
