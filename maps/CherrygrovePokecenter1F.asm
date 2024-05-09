	object_const_def
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEPOKECENTER1F_CHANSEY
	const CHERRYGROVEPOKECENTER1F_FISHER
	const CHERRYGROVEPOKECENTER1F_GENTLEMAN
	const CHERRYGROVEPOKECENTER1F_TEACHER
	const CHERRYGROVEPOKECENTER1F_TUTOR

CherrygrovePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygrovePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CherrygrovePokecenter1FChansey:
	jumpstd PokecenterChanseyScript

CherrygrovePokecenter1FFisherScript:
	jumptextfaceplayer CherrygrovePokecenter1FFisherText

CherrygrovePokecenter1FGentlemanScript:
	jumptextfaceplayer CherrygrovePokecenter1FGentlemanText

CherrygrovePokecenter1FTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CommCenterOpen
	writetext CherrygrovePokecenter1FTeacherText
	waitbutton
	closetext
	end

.CommCenterOpen:
	writetext CherrygrovePokecenter1FTeacherText_CommCenterOpen
	waitbutton
	closetext
	end
	
CherrygrovePokecenter1FTutorScript:
	faceplayer
	opentext
	writetext CherrygrovePokecenter1FTutorIntro
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnough
	writetext CherrygrovePokecenter1FAskYesNo
	yesorno
	iffalse .Refused
	writetext CherrygrovePokecenter1FTutorWhichMoveText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .StoneEdge
	ifequal 2, .GunkShot
	ifequal 3, .FocusBlast
	sjump .Refused

.StoneEdge:
	setval STONE_EDGE
	writetext CherrygrovePokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.GunkShot:
	setval GUNK_SHOT
	writetext CherrygrovePokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.FocusBlast:
	setval FOCUS_BLAST
	writetext CherrygrovePokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext CherrygrovePokecenter1FTutorRefusalText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext CherrygrovePokecenter1FTutorIncompatibleText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext CherrygrovePokecenter1FTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext CherrygrovePokecenter1FTutorPayment
	takemoney YOUR_MONEY, 20000
	waitbutton
	writetext CherrygrovePokecenter1FTutorUseWisely
	waitbutton
	writetext CherrygrovePokecenter1FFarewellKidText
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
	db "STONE EDGE@"
	db "GUNK SHOT@"
	db "FOCUS BLAST@"
	db "CANCEL@"

CherrygrovePokecenter1FFisherText:
	text "It's great. I can"
	line "store any number"

	para "of #MON, and"
	line "it's all free."
	done

CherrygrovePokecenter1FGentlemanText:
	text "That PC is free"
	line "for any trainer"
	cont "to use."
	done

CherrygrovePokecenter1FTeacherText:
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "But they're still"
	line "finishing it up."
	done

CherrygrovePokecenter1FTeacherText_CommCenterOpen:
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "I traded #MON"
	line "there already!"
	done
	
CherrygrovePokecenter1FTutorIntro:
	text "Hi there!"
	line "I'm a MOVE TUTOR!"
	
	para "For ¥20,000,"
	line "I can teach your"
	cont "#MON an"

	para "amazing move if"
	line "you'd like."
	done
	
CherrygrovePokecenter1FAskYesNo:
	text "Should I teach"
	line "them a move?"
	done

CherrygrovePokecenter1FTutorRefusalText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#MON a new"
	cont "move!"
	done

CherrygrovePokecenter1FTutorWhichMoveText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

CherrygrovePokecenter1FTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥20,000."
	done
	
CherrygrovePokecenter1FTutorNotEnough:
	text "Ooh, sorry, you"
	line "don't have enough…"
	done

CherrygrovePokecenter1FTutorUseWisely:
	text "Use these wisely"
	line "to your advantage"
	cont "in battle!"
	done

CherrygrovePokecenter1FFarewellKidText:
	text "See ya and"
	line "good luck on"
	cont "your journey!"
	done

CherrygrovePokecenter1FTutorIncompatibleText:
	text "I'm sorry, your"
	line "#MON can't"
	cont "learn this move…"
	done

CherrygrovePokecenter1FTutorMoveText:
	text_start
	done

CherrygrovePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_CITY, 2
	warp_event  6,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FChansey, -1
	object_event  4,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FFisherScript, -1
	object_event  9,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FTeacherScript, -1
	object_event  8,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FTutorScript, -1
