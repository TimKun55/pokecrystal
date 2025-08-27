	object_const_def
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_ETHAN
	const TRAINERHOUSEB1F_AGATHA
	const TRAINERHOUSEB1F_LORELEI
	const TRAINERHOUSEB1F_OAK
	const TRAINERHOUSEB1F_INVER
	const TRAINERHOUSEB1F_THORTON

TrainerHouseB1F_MapScripts:
	def_scene_scripts
	scene_script TrainerHouseB1FNoopScene, SCENE_TRAINERHOUSEB1F_ASK_BATTLE

	def_callbacks
	callback MAPCALLBACK_TILES, TrainerHouseB1FBattleMachinesOnOff

TrainerHouseB1FNoopScene:
	end

TrainerHouseB1FBattleMachinesOnOff:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .InverseMachines
	ifequal THURSDAY, .TypelessMachines
	changeblock 0,  6, $40 ; Machine Off
	changeblock 8,  6, $40 ; Machine Off
	changeblock 0, 10, $40 ; Machine Off
	changeblock 8, 10, $40 ; Machine Off
	endcallback

.InverseMachines:
	changeblock 0,  6, $41 ; Machine Inverse
	changeblock 8,  6, $41 ; Machine Inverse
	changeblock 0, 10, $41 ; Machine Inverse
	changeblock 8, 10, $41 ; Machine Inverse
	endcallback

.TypelessMachines:
	changeblock 0,  6, $42 ; Machine Typeless
	changeblock 8,  6, $42 ; Machine Typeless
	changeblock 0, 10, $42 ; Machine Typeless
	changeblock 8, 10, $42 ; Machine Typeless
	endcallback

TrainerHouseReceptionistScript:
	turnobject PLAYER, UP
	opentext
	writetext TrainerHouseB1FIntroText
	promptbutton
	writetext TrainerHouseB1FAskWantToBattleText
	yesorno
	iffalse .Declined
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	readvar VAR_WEEKDAY
	ifequal MONDAY, .InverFight
	ifequal TUESDAY, .MaybeLoreleiFight
	ifequal WEDNESDAY, .MaybeAgathaFight
	ifequal THURSDAY, .ThortonFight
	ifequal FRIDAY, .MaybeOakFight
	ifequal SATURDAY, .Cal1Fight
	ifequal SUNDAY, .Cal2Fight
.Cal1Fight:
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
	disappear TRAINERHOUSEB1F_INVER
	disappear TRAINERHOUSEB1F_THORTON
	appear TRAINERHOUSEB1F_ETHAN
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_ETHAN
	loadtrainer CAL, CAL1
	startbattle
	reloadmapafterbattle
	sjump .End
	
.Cal2Fight:
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
	disappear TRAINERHOUSEB1F_INVER
	disappear TRAINERHOUSEB1F_THORTON
	appear TRAINERHOUSEB1F_ETHAN
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_ETHAN
	loadtrainer CAL, CAL2
	startbattle
	reloadmapafterbattle
.End:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	end

.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.InverFight:
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
	disappear TRAINERHOUSEB1F_ETHAN
	disappear TRAINERHOUSEB1F_THORTON
	appear TRAINERHOUSEB1F_INVER
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FInverBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FInverBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_INVER
	random 4
	ifequal 1, .Inver1
	ifequal 2, .Inver2
	ifequal 3, .Inver3
	ifequal 4, .Inver4
.Inver1:
	loadtrainer INVER, INVER_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	jump .ContinueInver

.Inver2:
	loadtrainer INVER, INVER_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	jump .ContinueInver

.Inver3:
	loadtrainer INVER, INVER_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	jump .ContinueInver

.Inver4:
	loadtrainer INVER, INVER_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
.ContinueInver:
	opentext
	writetext TrainerHouseB1FInverAfterText
	waitbutton
	closetext
	checkevent EVENT_BEAT_INVER_FIRST_TIME
	iffalse .InverFirstTimeSet
	sjump .End

.InverFirstTimeSet:
	setevent EVENT_BEAT_INVER_FIRST_TIME
	sjump .End

.ThortonFight:
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
	disappear TRAINERHOUSEB1F_ETHAN
	disappear TRAINERHOUSEB1F_INVER
	appear TRAINERHOUSEB1F_THORTON
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FThortonBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FThortonBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_THORTON
	random 4
	ifequal 1, .Thorton1
	ifequal 2, .Thorton2
	ifequal 3, .Thorton3
	ifequal 4, .Thorton4
.Thorton1:
	loadtrainer THORTON, THORTON_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmapafterbattle
	jump .ContinueThorton

.Thorton2:
	loadtrainer THORTON, THORTON_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmapafterbattle
	jump .ContinueThorton

.Thorton3:
	loadtrainer THORTON, THORTON_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmapafterbattle
	jump .ContinueThorton

.Thorton4:
	loadtrainer THORTON, THORTON_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmapafterbattle
.ContinueThorton:
	opentext
	writetext TrainerHouseB1FThortonAfterText
	waitbutton
	checkevent EVENT_BEAT_THORTON_FIRST_TIME
	iffalse .ThortonFirstTimeSet
	sjump .End

.ThortonFirstTimeSet:
	setevent EVENT_BEAT_THORTON_FIRST_TIME
	sjump .End

.MaybeAgathaFight:
	checkevent EVENT_BEAT_GUARDIAN_AGATHA
	iffalse .Cal1Fight
	disappear TRAINERHOUSEB1F_ETHAN
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
	disappear TRAINERHOUSEB1F_INVER
	disappear TRAINERHOUSEB1F_THORTON
	appear TRAINERHOUSEB1F_AGATHA
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FAgathaBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FAgathaBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_AGATHA
	loadtrainer AGATHA, AGATHA2
	startbattle
	reloadmapafterbattle
	opentext
	writetext TrainerHouseB1FAgathaAfterText
	waitbutton
	closetext
	sjump .End

.MaybeLoreleiFight:
	checkevent EVENT_BEAT_GUARDIAN_LORELEI
	iffalse .Cal2Fight
	disappear TRAINERHOUSEB1F_ETHAN
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_OAK
	disappear TRAINERHOUSEB1F_INVER
	disappear TRAINERHOUSEB1F_THORTON
	appear TRAINERHOUSEB1F_LORELEI
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FLoreleiBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FLoreleiBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_LORELEI
	loadtrainer LORELEI, LORELEI2
	startbattle
	reloadmapafterbattle
	opentext
	writetext TrainerHouseB1FLoreleiAfterText
	waitbutton
	closetext
	sjump .End

.MaybeOakFight:
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Cal2Fight
	disappear TRAINERHOUSEB1F_ETHAN
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_INVER
	disappear TRAINERHOUSEB1F_THORTON
	appear TRAINERHOUSEB1F_OAK
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FOakBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FOakBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_OAK
	loadtrainer POKEMON_PROF, OAK
	startbattle
	reloadmapafterbattle
	opentext
	writetext TrainerHouseB1FOakAfterText
	waitbutton
	closetext
	sjump .End

Movement_EnterTrainerHouseBattleRoom:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

Movement_TrainerHouseTurnBack:
	step RIGHT
	step_end

TrainerHouseB1FIntroText:
	text "Hi and welcome to"
	line "the Training Hall."

	para "Go through and"
	line "battle a powerful"
	cont "trainer."
	done

TrainerHouseB1FAskWantToBattleText:
	text "Would you like to"
	line "battle?"
	done

TrainerHouseB1FGoRightInText:
	text "Please go right"
	line "through."

	para "You may begin"
	line "right away."
	done

TrainerHouseB1FPleaseComeAgainText:
	text "Sorry. Only those"
	line "trainers who will"

	para "be battling are"
	line "allowed to go in."
	done

TrainerHouseB1FCalBeatenText:
	text "I lost…"
	line "Darn…"
	done

TrainerHouseB1FCalBeforeText:
	text "Cal: I traveled"
	line "here just so I"
	cont "could battle you."
	done

TrainerHouseB1FInverBeforeText:
	text "Inver: How wonder-"
	line "ful to have ano-"
	cont "ther challenger."
	
	para "Let's begin."
	done

TrainerHouseB1FInverBeatenText:
	text "A wonderful job."
	done

TrainerHouseB1FInverAfterText:
	text "Inver: I look for-"
	line "ward to battling"
	cont "you again."
	done

TrainerHouseB1FThortonBeforeText:
	text "Bzweeeeep!"
	
	para "Thorton: Sorry,"
	line "don't mind me."
	
	para "I'm using an"
	line "invention of mine."
	
	para "It's my data-"
	line "analysing machine."
	
	para "It's calculating"
	line "your chance of"
	cont "winning."
	
	para "Oh!"
	
	para "Interesting."
	
	para "Oh, don't worry"
	line "about that number."
	
	para "Let's get going!"
	done

TrainerHouseB1FThortonBeatenText:
	text "Woah! You sure"
	line "showed me!"
	done

TrainerHouseB1FThortonAfterText:
	text "Thorton: I can't"
	line "wait to gather"
	cont "even more data."
	done

TrainerHouseB1FAgathaBeforeText:
	text "Agatha: Ah, you're"
	line "here, <PLAYER>."
	
	para "Time to battle."
	done

TrainerHouseB1FAgathaBeatenText:
	text "I lost again."
	done

TrainerHouseB1FAgathaAfterText:
	text "Agatha: It may"
	line "sound odd, but"
	cont "I'm almost glad"
	cont "I lost."
	
	para "It shows you're"
	line "continuing your"
	cont "training."
	
	para "Unlike a certain"
	line "Professor…"
	
	para "Anyway, keep"
	line "it up."
	done

TrainerHouseB1FLoreleiBeforeText:
	text "Lorelei: Ah,"
	line "you're here."
	
	para "Let's battle."
	done

TrainerHouseB1FLoreleiBeatenText:
	text "Still powerful."
	done

TrainerHouseB1FLoreleiAfterText:
	text "Lorelei: I'm happy"
	line "to see you're"
	cont "still training"
	cont "so seriously."
	done

TrainerHouseB1FOakBeforeText:
	text "Oak: <PLAYER>!"
	
	para "Time to test"
	line "my training!"
	done

TrainerHouseB1FOakBeatenText:
	text "Wow, that was fun!"
	done

TrainerHouseB1FOakAfterText:
	text "Oak: I'm glad"
	line "I decided to start"
	cont "battling again."
	
	para "It's so much fun!"
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  1, TRAINER_HOUSE_1F, 3

	def_coord_events
	coord_event  4,  4, SCENE_TRAINERHOUSEB1F_ASK_BATTLE, TrainerHouseReceptionistScript

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_ETHAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_CAL
	object_event  6, 11, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_AGATHA
	object_event  6, 11, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_LORELEI
	object_event  6, 11, SPRITE_OAK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_OAK
	object_event  6, 11, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_INVER
	object_event  6, 11, SPRITE_THORTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_THORTON
