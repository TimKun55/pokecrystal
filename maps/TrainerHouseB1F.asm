	object_const_def
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_ETHAN
	const TRAINERHOUSEB1F_AGATHA
	const TRAINERHOUSEB1F_LORELEI
	const TRAINERHOUSEB1F_OAK

TrainerHouseB1F_MapScripts:
	def_scene_scripts
	scene_script TrainerHouseB1FNoopScene, SCENE_TRAINERHOUSEB1F_ASK_BATTLE

	def_callbacks

TrainerHouseB1FNoopScene:
	end

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
	ifequal MONDAY, .MaybeAgathaFight
	ifequal TUESDAY, .MaybeLoreleiFight
	ifequal WEDNESDAY, .MaybeAgathaFight
	ifequal THURSDAY, .MaybeLoreleiFight
	ifequal FRIDAY, .MaybeOakFight
	ifequal SATURDAY, .Cal1Fight
	ifequal SUNDAY, .Cal2Fight
.Cal1Fight:
	disappear TRAINERHOUSEB1F_AGATHA
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
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

.MaybeAgathaFight:
	checkevent EVENT_BEAT_GUARDIAN_AGATHA
	iffalse .Cal1Fight
	disappear TRAINERHOUSEB1F_ETHAN
	disappear TRAINERHOUSEB1F_LORELEI
	disappear TRAINERHOUSEB1F_OAK
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
	step LEFT
	step LEFT
	step LEFT
	step DOWN
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
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
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
	text "I traveled out"
	line "here just so I"
	cont "could battle you."
	done

TrainerHouseB1FAgathaBeforeText:
	text "Ah, you're here,"
	line "<PLAYER>."
	
	para "Time to battle."
	done

TrainerHouseB1FAgathaBeatenText:
	text "I lost again."
	done

TrainerHouseB1FAgathaAfterText:
	text "It may sound odd,"
	line "but I'm almost"
	cont "glad I lost;"
	
	para "It shows you're"
	line "continuing your"
	cont "training."
	
	para "Unlike a certain"
	line "Professor…"
	
	para "Anyway, keep"
	line "it up."
	done

TrainerHouseB1FLoreleiBeforeText:
	text "Ah, you're here."
	
	para "Let's battle."
	done

TrainerHouseB1FLoreleiBeatenText:
	text "Still powerful."
	done

TrainerHouseB1FLoreleiAfterText:
	text "I'm happy to see"
	line "you're still"
	cont "training so"
	cont "seriously."
	done

TrainerHouseB1FOakBeforeText:
	text "<PLAYER>!"
	
	para "Time to test"
	line "my training!"
	done

TrainerHouseB1FOakBeatenText:
	text "Wow, that was fun!"
	done

TrainerHouseB1FOakAfterText:
	text "I'm glad I decided"
	line "to start battling"
	cont "again - it's so"
	cont "much fun."
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	def_coord_events
	coord_event  7,  3, SCENE_TRAINERHOUSEB1F_ASK_BATTLE, TrainerHouseReceptionistScript

	def_bg_events

	def_object_events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_ETHAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_CAL
	object_event  6, 11, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_AGATHA
	object_event  6, 11, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_LORELEI
	object_event  6, 11, SPRITE_OAK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAINER_HALL_OAK
