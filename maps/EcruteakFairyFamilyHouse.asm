	object_const_def
	const ECRUTEAKFAIRYFAMILYHOUSE_POKEFAN_M
	const ECRUTEAKFAIRYFAMILYHOUSE_POKEFAN_F
	const ECRUTEAKFAIRYFAMILYHOUSE_GRAMPS
	const ECRUTEAKFAIRYFAMILYHOUSE_GRANNY
	const ECRUTEAKFAIRYFAMILYHOUSE_SYLVEON

EcruteakFairyFamilyHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakFairyFamilyHouseMomScript:
	faceplayer
	opentext
	writetext FairyMomWelcomeText
	waitbutton
	checkevent EVENT_BEAT_SUE_BEA_MIA
	iffalse .NoMoves
	writetext DisarmVoiceText
	yesorno
	iffalse .TutorRefused
	setval DISARM_VOICE
	writetext DisarmVoiceClear
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext DisarmVoiceRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext DisarmVoiceTaught
	waitbutton
	closetext
	end
	
.NoMoves
	writetext MomNoMoves
	waitbutton
	closetext
	end
	
EcruteakFairyFamilyHouseDadScript:
	faceplayer
	opentext
	writetext FairyDadWelcomeText
	waitbutton
	checkevent EVENT_BEAT_KAT_ADA_MAE
	iffalse .NoMoves
	writetext DrainKissText
	yesorno
	iffalse .TutorRefused
	setval DRAIN_KISS
	writetext DrainKissClear
	special MoveTutor
	ifequal FALSE, .TeachMove
	
.TutorRefused
	writetext DrainKissRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext DrainKissTaught
	waitbutton
	closetext
	end
	
.NoMoves
	writetext DadNoMoves
	waitbutton
	closetext
	end

EcruteakFairyFamilyHouseGrampsScript:
	faceplayer
	opentext
	writetext FairyGrampsWelcomeText
	waitbutton
	checkevent EVENT_BEAT_KAI_AYA_GIA
	iffalse .NoMoves
	writetext DazzlingleamText
	yesorno
	iffalse .TutorRefused
	setval DAZZLINGLEAM
	writetext DazzlingleamClear
	special MoveTutor
	ifequal FALSE, .TeachMove
	
.TutorRefused
	writetext DazzlingleamRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext DazzlingleamTaught
	waitbutton
	closetext
	end
	
.NoMoves
	writetext GrampsNoMoves
	waitbutton
	closetext
	end
	
EcruteakFairyFamilyHouseGrannyScript:
	faceplayer
	opentext
	writetext FairyGrannyWelcomeText
	waitbutton
	checkevent EVENT_BEAT_LIA_ZOE_EVA
	iffalse .NoMoves
	writetext UltimateFairyMoveText
	yesorno
	iffalse .TutorRefused
	writetext UltimateFairyMoveWhichMoveText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Moonblast
	ifequal 2, .PlayRough
	sjump .TutorRefused
	
.Moonblast:
	setval MOONBLAST
	writetext EcruteakFairyFamilyHouseGrannyMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.PlayRough:
	setval PLAY_ROUGH
	writetext EcruteakFairyFamilyHouseGrannyMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.TutorRefused
	writetext UltimateFairyMoveRefusedText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext EcruteakFairyFamilyHouseIncompatibleText
	waitbutton
	closetext
	end

.TeachMove
	writetext UltimateFairyMoveTaughtText
	waitbutton
	closetext
	end
	
.NoMoves
	writetext GrannyNoMoves
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
	db 3 ; items
	db "MOONBLAST@"
	db "PLAY ROUGH@"
	db "CANCEL@"
	
EcruteakFairyFamilyHouseSylveonScript:
	opentext
	writetext FairySylveonText
	cry SYLVEON
	waitbutton
	refreshscreen
	pokepic SYLVEON
	waitbutton
	closepokepic
	closetext
	end

FairyMomWelcomeText:
	text "Welcome! If you're"
	line "visiting us, you"
	cont "must be interested"
	
	para "in FAIRY TYPES!"
	line "Have you been"
	cont "battling my"
	
	para "daughters?"
	done

DisarmVoiceText:
	text "Ooh, you have!"
	line "Shall I teach your"
	cont "#MON to use"
	
	para "DISARM VOICE?"
	done
	
MomNoMoves:
	text "Oh, I guess not."
	
	para "Look for them"
	line "somewhere south"
	cont "of ECRUTEAK."
	done

DisarmVoiceRefused:
	text "Aww, that's"
	line "a shame."
	done

DisarmVoiceClear:
	text_start
	done

DisarmVoiceTaught:
	text "Does damage and"
	line "it can't miss!"
	
	para "A pretty good move"
	line "if you ask me!"
	done

FairyDadWelcomeText:
	text "Hello! If you're"
	line "visiting us, you"
	cont "must be interested"
	
	para "in FAIRY TYPES!"
	line "Have you been"
	cont "battling my"
	
	para "daughters?"
	done

DrainKissText:
	text "Ooh, you have!"
	line "Shall I teach your"
	cont "#MON to use"
	
	para "DRAIN KISS?"
	done
	
DadNoMoves:
	text "Oh, I guess not."
	
	para "Look for them"
	line "somewhere west"
	cont "of ECRUTEAK."
	done

DrainKissRefused:
	text "Hmm, up to you."
	done

DrainKissClear:
	text_start
	done

DrainKissTaught:
	text "Does damage and"
	line "it can heal!"
	
	para "A pretty good move"
	line "if you ask me!"
	done
	
FairyGrampsWelcomeText:
	text "Hello there,"
	line "young'un! If you're"
	cont "visiting us, you"
	
	para "must be interested"
	line "in FAIRY TYPES!"
	
	para "Have you been"
	line "battling my"
	cont "granddaughters?"
	done

DazzlingleamText:
	text "Ooh, you have!"
	line "Shall I teach your"
	cont "#MON to use"
	
	para "DAZZLINGLEAM?"
	done
	
GrampsNoMoves:
	text "Oh, I guess not."
	
	para "Look for them"
	line "somewhere east"
	cont "of ECRUTEAK."
	done

DazzlingleamRefused:
	text "No problem."
	done

DazzlingleamClear:
	text_start
	done

DazzlingleamTaught:
	text "Does damage and"
	line "it's powerful!"
	
	para "A pretty good move"
	line "if you ask me!"
	done

FairyGrannyWelcomeText:
	text "Hello there, dear!"
	line "My family and I"
	cont "recently moved"

	para "from the HOENN"
	line "REGION and we've"
	cont "been looking for"

	para "an excuse to teach"
	line "TRAINERS about the"
	cont "FAIRY TYPE!"

	para "My granddaughters"
	line "love to battle."
	
	para "If you can"
	line "find, battle and"

	para "defeat them,"
	line "we will gladly"
	cont "teach your"
	
	para "#MON some FAIRY"
	line "TYPE moves!"
	
	para "Defeat them all"
	line "and I will teach"
	cont "you the ultimate"
	
	para "FAIRY TYPE moves!"
	done

UltimateFairyMoveText:
	text "Very well done!"
	
	para "Shall I teach your"
	line "#MON to use the"
	cont "ultimate moves?"
	done
	
UltimateFairyMoveWhichMoveText:
	text "Wonderful!"

	para "Which move should"
	line "I teach?"
	done
	
EcruteakFairyFamilyHouseIncompatibleText:
	text "I'm sorry, your"
	line "#MON can't"
	cont "learn this move…"
	done
	
GrannyNoMoves:
	text "Good luck out"
	line "there, dear!" 
	done

UltimateFairyMoveRefusedText:
	text "Oh, really? After"
	line "all your efforts?"
	
	para "Up to you, dear."
	done

MoonblastClear:
	text_start
	done

UltimateFairyMoveTaughtText:
	text "Use it well, dear!"
	done
	
EcruteakFairyFamilyHouseGrannyMoveText:
	text_start
	done
	
FairySylveonText:
	text "SYLVEON: Syl!"
	line "Veon! Syl!"
	done

EcruteakFairyFamilyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 13
	warp_event  4,  7, ECRUTEAK_CITY, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseDadScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseMomScript, -1
	object_event  0,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseGrampsScript, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseGrannyScript, -1
	object_event  4,  1, SPRITE_SYLVEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseSylveonScript, -1
