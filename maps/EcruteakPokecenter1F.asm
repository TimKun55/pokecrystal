	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_CHANSEY
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE
	const ECRUTEAKPOKECENTER1F_BILL
	const ECRUTEAKPOKECENTER1F_TUTOR

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script EcruteakPokecenter1FMeetBillScene, SCENE_ECRUTEAKPOKECENTER1F_MEET_BILL
	scene_script EcruteakPokecenter1FNoopScene,     SCENE_ECRUTEAKPOKECENTER1F_NOOP

	def_callbacks

EcruteakPokecenter1FMeetBillScene:
	sdefer EcruteakPokcenter1FBillMeetsPlayer
	end

EcruteakPokecenter1FNoopScene:
	end

EcruteakPokcenter1FBillMeetsPlayer:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setscene SCENE_ECRUTEAKPOKECENTER1F_NOOP
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
EcruteakPokecenter1FChansey:
	jumpstd PokecenterChanseyScript
	
EcruteakPokecenter1FTutor:
	faceplayer
	opentext
	writetext EcruteakPokecenter1FTutorIntro
	waitbutton
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnough
	writetext EcruteakPokecenter1FAskYesNo
	yesorno
	iffalse .Refused
	writetext EcruteakPokecenter1FTutorWhichMoveText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RockBlast
	ifequal 2, .GrowthPunch
	ifequal 3, .FlameCharge
	sjump .Refused

.RockBlast:
	setval ROCK_BLAST
	writetext EcruteakPokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.GrowthPunch:
	setval GROWTH_PUNCH
	writetext EcruteakPokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.FlameCharge:
	setval FLAME_CHARGE
	writetext EcruteakPokecenter1FTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext EcruteakPokecenter1FTutorRefusalText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext EcruteakPokecenter1FTutorIncompatibleText
	waitbutton
	closetext
	end
	
.NotEnough:
	writetext EcruteakPokecenter1FTutorNotEnough
	waitbutton
	closetext
	end

.TeachMove:
	writetext EcruteakPokecenter1FTutorPayment
	takemoney YOUR_MONEY, 4000
	waitbutton
	writetext EcruteakPokecenter1FTutorUseWisely
	waitbutton
	writetext EcruteakPokecenter1FFarewellKidText
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
	db "Rock Blast@"
	db "Growth Punch@"
	db "Flame Charge@"
	db "Cancel@"

EcruteakPokecenter1FPokefanMScript:
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Hi, I'm Bill. And"
	line "who are you?"

	para "Hmm, <PLAYER>, huh?"
	line "Nice to meet you."
	done

EcruteakPokecenter1F_BillText2:
	text "I just finished"
	line "visiting my"
	cont "friends."
	
	para "You probably know"
	line "them as the"
	
	para "Move Deleter and"
	line "Move Relearner."

	para "Whenever I'm in"
	line "Goldenrod to see"
	cont "family, I make"
	
	para "sure to come to"
	line "Ecruteak, too!"

	para "Anyway, I should"
	line "head back to"
	cont "Goldenrod and"
	cont "see my folks."

	para "Buh-bye!"
	done
	
EcruteakPokecenter1FTutorIntro:
	text "Hi there!"
	line "I'm a Move Tutor!"
	
	para "For ¥4000,"
	line "I can teach your"
	cont "#mon a pretty"

	para "useful move if"
	line "you'd like."
	done
	
EcruteakPokecenter1FAskYesNo:
	text "Should I teach"
	line "them a move?"
	done

EcruteakPokecenter1FTutorRefusalText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#mon a new"
	cont "move!"
	done

EcruteakPokecenter1FTutorWhichMoveText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

EcruteakPokecenter1FTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥4000."
	done
	
EcruteakPokecenter1FTutorNotEnough:
	text "Oh, sorry, you"
	line "can't afford it."
	done

EcruteakPokecenter1FTutorUseWisely:
	text "Use these wisely"
	line "to your advantage"
	cont "in battle."
	done

EcruteakPokecenter1FFarewellKidText:
	text "Goodbye and"
	line "good luck on"
	cont "your journey."
	done
	
EcruteakPokecenter1FTutorIncompatibleText:
	text "I'm sorry, your"
	line "#mon can't"
	cont "learn this move…"
	done

EcruteakPokecenter1FTutorMoveText:
	text_start
	done

EcruteakPokecenter1FPokefanMText:
	text "The way the Kimono"
	line "Girls dance is"

	para "marvelous. Just"
	line "like the way they"
	cont "use their #mon."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "Olivine City."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "Morty, the Gym"
	line "Leader, is soooo"
	cont "cool."

	para "His #mon are"
	line "really tough too."
	done

EcruteakPokecenter1FGymGuideText:
	text "Lake Of Rage…"

	para "The appearance of"
	line "a Gyarados swarm…"

	para "I smell a conspir-"
	line "acy. I know it!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ECRUTEAK_CITY, 4
	warp_event  6,  7, ECRUTEAK_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FChansey, -1
	object_event 10,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  2,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  8,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
	object_event  8,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FTutor, -1