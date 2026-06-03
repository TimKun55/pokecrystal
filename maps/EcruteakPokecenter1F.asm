	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_CHANSEY
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakPokecenter1FBill:
	showemote EMOTE_SHOCK, ECRUTEAKPOKECENTER1F_BILL, 15
	pause 15
	faceplayer
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .BillWalkAroundPlayer
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovementOneStepDown
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovementThreeStepsDown
	sjump .FinishBill

.BillWalkAroundPlayer
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovementLongExit
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovementTwoStepsDown
.FinishBill
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
EcruteakPokecenter1FChansey:
	jumpstd PokecenterChanseyScript
	
EcruteakPokecenter1FPokefanMScript:
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FBillMovementLongExit:
	step RIGHT
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FBillMovementThreeStepsDown:
	step DOWN
EcruteakPokecenter1FBillMovementTwoStepsDown:
	step DOWN
EcruteakPokecenter1FBillMovementOneStepDown:
	step DOWN
	step_end

EcruteakPokecenter1F_BillText1:
	ntag " Bill "
	text "Hi, I'm Bill. And"
	line "who are you?"

	para "Hmm, <PLAYER>, huh?"
	line "Nice to meet you."
	done

EcruteakPokecenter1F_BillText2:
	ntag " Bill "
	text "I just finished"
	line "visiting my"
	cont "friends upstairs."
	
	para "You probably know"
	line "them as the"
	cont "Move Deleter and"
	cont "Move Relearner."

	para "Whenever I'm in"
	line "Goldenrod to see"
	cont "family, I make"
	cont "sure to come to"
	cont "Ecruteak, too!"

	para "Anyway, I should"
	line "head back to"
	cont "Goldenrod and"
	cont "see my folks."

	para "Buh-bye!"
	done
	
EcruteakPokecenter1FPokefanMText:
	text "The way the Kimono"
	line "Girls dance is"
	cont "marvelous. Just"
	cont "like the way they"
	cont "use their #mon."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"
	cont "people, right?"
	
	para "There's apparently"
	line "some place where"
	cont "trainers gather."

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
	warp_event  6,  7, ECRUTEAK_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1
	warp_event 11,  7, ECRUTEAK_MART, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FChansey, -1
	object_event 10,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  2,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  8,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1
	object_event  5,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FBill, EVENT_ECRUTEAK_POKE_CENTER_BILL
