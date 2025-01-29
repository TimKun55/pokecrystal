	object_const_def
	const ECRUTEAKFAIRYFAMILYHOUSE_POKEFAN_M
	const ECRUTEAKFAIRYFAMILYHOUSE_POKEFAN_F
	const ECRUTEAKFAIRYFAMILYHOUSE_GRAMPS
	const ECRUTEAKFAIRYFAMILYHOUSE_GRANNY
	const ECRUTEAKFAIRYFAMILYHOUSE_SYLVEON

EcruteakFairyFamilyHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakFairyFamilyHouseMumScript:
	faceplayer
	opentext
	writetext FairyMumWelcomeText
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
	writetext MumNoMoves
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
	checkevent EVENT_BEAT_LIA_ZOE_EVA
	iftrue .GrannyTeachMove
	writetext FairyGrannyWelcomeText
	waitbutton
	closetext
	end

.GrannyTeachMove
	writetext UltimateFairyMoveText
	yesorno
	iffalse .TutorRefused
	writetext UltimateFairyMoveWonderfullText
	waitbutton
.TutorLoop:
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
	sjump .TutorLoop

.PlayRough:
	setval PLAY_ROUGH
	writetext EcruteakFairyFamilyHouseGrannyMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .TutorLoop
	
.TutorRefused
	writetext UltimateFairyMoveRefusedText
	waitbutton
	closetext
	end
	
.TeachMove
	writetext UltimateFairyMoveTaughtText
	waitbutton
	closetext
	end
	
.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 5, 15, TEXTBOX_Y
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Moonblast@"
	db "Play Rough@"
	db "Cancel@"
	
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

FairyMumWelcomeText:
	text "Welcome! If you're"
	line "visiting us, you"
	cont "must be interested"
	
	para "in fairy-types!"
	line "Have you been"
	cont "battling my"
	
	para "daughters?"
	done

DisarmVoiceText:
	text "Ooh, you have!"
	line "Shall I teach your"
	cont "#mon to use"
	
	para "Disarm Voice?"
	done
	
MumNoMoves:
	text "Oh, I guess not."
	
	para "Look for them"
	line "somewhere south"
	cont "of Ecruteak."
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
	
	para "in fairy-types!"
	line "Have you been"
	cont "battling my"
	
	para "daughters?"
	done

DrainKissText:
	text "Ooh, you have!"
	line "Shall I teach your"
	cont "#mon to use"
	
	para "Drain Kiss?"
	done
	
DadNoMoves:
	text "Oh, I guess not."
	
	para "Look for them"
	line "somewhere west"
	cont "of Ecruteak."
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
	line "in fairy-types!"
	
	para "Have you been"
	line "battling my"
	cont "granddaughters?"
	done

DazzlingleamText:
	text "Ooh, you have!"
	line "Shall I teach your"
	cont "#mon to use"
	
	para "DazzlinGleam?"
	done
	
GrampsNoMoves:
	text "Oh, I guess not."
	
	para "Look for them"
	line "somewhere east"
	cont "of Ecruteak."
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

	para "from the Hoenn"
	line "Region and we've"
	cont "been looking for"

	para "an excuse to teach"
	line "trainers about the"
	cont "fairy-type!"

	para "My granddaughters"
	line "love to battle."
	
	para "If you can"
	line "find, battle and"

	para "defeat them,"
	line "we will gladly"
	cont "teach your"
	
	para "#mon some fairy"
	line "-type moves!"
	
	para "Defeat them all"
	line "and I will teach"
	cont "you the ultimate"
	
	para "fairy-type moves!"
	done

UltimateFairyMoveText:
	text "Very well done!"
	line "You've defeated my"
	cont "granddaughters!"
	
	para "Shall I teach your"
	line "#mon to use the"
	cont "strongest Fairy"
	cont "moves?"
	done

UltimateFairyMoveWonderfullText:
	text "Wonderful!"
	done

UltimateFairyMoveWhichMoveText:
	text "Which move should"
	line "I teach?"
	done
	
UltimateFairyMoveRefusedText:
	text "Oh, really? After"
	line "all your efforts?"
	
	para "Up to you, dear."
	done

UltimateFairyMoveTaughtText:
	text "Use it well, dear!"
	done
	
EcruteakFairyFamilyHouseGrannyMoveText:
	text_start
	done
	
FairySylveonText:
	text "Sylveon: Syl!"
	line "Veon! Syl!"
	done

EcruteakFairyFamilyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 16
	warp_event  4,  7, ECRUTEAK_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseDadScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseMumScript, -1
	object_event  0,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseGrampsScript, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseGrannyScript, -1
	object_event  4,  1, SPRITE_SYLVEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakFairyFamilyHouseSylveonScript, -1
