	object_const_def
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_CHANSEY
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER
	const OLIVINEPOKECENTER1F_TUTOR

OlivinePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
OlivinePokecenter1FChansey:
	jumpstd PokecenterChanseyScript

OlivinePokecenter1FFishingGuruScript:
	jumpstd HappinessCheckScript

OlivinePokecenter1FFisherScript:
	jumptextfaceplayer OlivinePokecenter1FFisherText

OlivinePokecenter1FTeacherScript:
	jumptextfaceplayer OlivinePokecenter1FTeacherText
	
OlivinePokecenter1FTutor:
	faceplayer
	opentext
	writetext OlivinePokecenter1FTutorIntro
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 6500
	ifequal HAVE_LESS, .NotEnough
	writetext OlivinePokecenter1FAskYesNo
	yesorno
	iffalse .Refused
	writetext OlivinePokecenter1FTutorWhichMoveText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PoisonJab
	ifequal 2, .SilverWind
	ifequal 3, .NightSlash
	sjump .Refused

.PoisonJab:
	setval POISON_JAB
	writetext OlivinePokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.SilverWind:
	setval SILVER_WIND
	writetext OlivinePokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.NightSlash:
	setval NIGHT_SLASH
	writetext OlivinePokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext OlivinePokecenter1FTutorRefusalText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext OlivinePokecenter1FTutorIncompatibleText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext OlivinePokecenter1FTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext OlivinePokecenter1FTutorPayment
	takemoney YOUR_MONEY, 6500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext OlivinePokecenter1FTutorUseWisely
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
	db "Poison Jab@"
	db "Silver Wind@"
	db "Night Slash@"
	db "Cancel@"

OlivinePokecenter1FFisherText:
	text "The Sailor in the"
	line "Olivine Cafe next"

	para "door is really"
	line "generous."

	para "He taught my"
	line "#mon Strength."

	para "Now it can move"
	line "big boulders."
	done

OlivinePokecenter1FTeacherText:
	text "There's a person"
	line "in Cianwood City"
	cont "across the sea."

	para "I heard him brag-"
	line "ging about his"
	cont "rare #mon."
	done
	
OlivinePokecenter1FTutorIntro:
	text "Hi there!"
	line "I'm a Move Tutor!"
	
	para "For ¥6,500,"
	line "I can teach your"
	cont "#mon a pretty"

	para "useful move if"
	line "you'd like."
	done
	
OlivinePokecenter1FAskYesNo:
	text "Should I teach"
	line "them a move?"
	done

OlivinePokecenter1FTutorRefusalText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#mon a new"
	cont "move!"
	done

OlivinePokecenter1FTutorWhichMoveText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

OlivinePokecenter1FTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥6,500."
	done
	
OlivinePokecenter1FTutorNotEnough:
	text "Oh, sorry, you"
	line "can't afford it."
	done

OlivinePokecenter1FTutorUseWisely:
	text "Use these wisely"
	line "to your advantage"
	cont "in battle."

	para "Goodbye and"
	line "good luck on"
	cont "your journey."
	done
	
OlivinePokecenter1FTutorIncompatibleText:
	text "I'm sorry, your"
	line "#mon can't"
	cont "learn this move…"
	done

OlivinePokecenter1FTutorMoveText:
	text_start
	done

OlivinePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, OLIVINE_CITY, 1
	warp_event  6,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FChansey, -1
	object_event  1,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFishingGuruScript, -1
	object_event  8,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFisherScript, -1
	object_event  3,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTeacherScript, -1
	object_event  8,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTutor, -1
