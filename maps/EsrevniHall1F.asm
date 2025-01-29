	object_const_def
	const ESREVNIHALL1F_NURSE
	const ESREVNIHALL1F_CHANSEY
	const ESREVNIHALL1F_RECEPTIONIST
	const ESREVNIHALL1F_GRAMPS
	const ESREVNIHALL1F_MACHOP
	const ESREVNIHALL1F_YOUNGSTER
	const ESREVNIHALL1F_INVER
	const ESREVNIHALL1F_BEAUTY
	const ESREVNIHALL1F_COOLTRAINERF

EsrevniHall1F_MapScripts:
	def_scene_scripts
	scene_script EsrevniHall1FNoopScene,        SCENE_ESREVNIHALL1F_NOOP
	scene_script EsrevniHall1FAfterBattleScene, SCENE_ESREVNIHALL1F_AFTERBATTLE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, EsrevniHall1FReceptionistPlaceCallback

EsrevniHall1FNoopScene:
	end

EsrevniHall1FAfterBattleScene:
	sdefer EsrevniHall1FAfterBattleScript
	end

EsrevniHall1FReceptionistPlaceCallback:
	checkevent EVENT_ESREVNI_HALL_AFTER_BATTLE
	iffalse .end
	moveobject ESREVNIHALL1F_RECEPTIONIST, 14,  8
	clearevent EVENT_ESREVNI_HALL_AFTER_BATTLE
.end
	endcallback

EsrevniHall1FAfterBattleScript:
	opentext
	readmem wInverPoints
	ifequal 7, .SevenPoints
.FinishInverScene:
	writetext EsrevniHall1FInverBattleAgainText
	waitbutton
	closetext
	applymovement ESREVNIHALL1F_INVER, EsrevniHall1FInverLeaveMovement
	disappear ESREVNIHALL1F_INVER
	applymovement ESREVNIHALL1F_RECEPTIONIST, EsrevniHall1FReceptionistMoveforInver
	setscene SCENE_ESREVNIHALL1F_NOOP
	end

.SevenPoints:
	writetext EsrevniHall1FInverSevenPointsText
	waitbutton
	giveitem FULL_RESTORE, 10
	giveitem REVIVE, 10
	iffalse .BagFull
	writetext EsrevniHall1FPrizeText
	playsound SFX_ITEM
	waitsfx
	writetext EsrevniHall1FInverPrizeText
	waitbutton
	readmem wInverPoints
	addval -7
	writemem wInverPoints
	sjump .FinishInverScene

.BagFull:
	writetext EsrevniHall1FInverBagFullText
	waitbutton
	setevent EVENT_ESREVNI_HALL_PICK_UP_PRIZE
	sjump .FinishInverScene

EsrevniHall1FNurseScript:
	jumpstd PokecenterNurseScript

EsrevniHall1FChansey:
	jumpstd PokecenterChanseyScript

EsrevniHall1FReceptionistScript:
	opentext
	checkevent EVENT_ESREVNI_HALL_PICK_UP_PRIZE
	iftrue .PickUpPrize
	writetext EsrevniHall1FReceptionistWelcomeText
	yesorno
	iffalse .NoBattle
.EnterBattleRoom
	writetext EsrevniHall1FReceptionistThisWayText
	waitbutton
	closetext
	setmapscene ESREVNI_HALL_BATTLE_ROOM, SCENE_ESREVNIHALLBATTLEROOM_ENTER
	follow ESREVNIHALL1F_RECEPTIONIST, PLAYER
	applymovement ESREVNIHALL1F_RECEPTIONIST, EsrevniHall1FReceptionistMovement
	stopfollow
	turnobject ESREVNIHALL1F_RECEPTIONIST, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext EsrevniHall1FReceptionistGoodLuckText
	waitbutton
	closetext
	applymovement PLAYER, EsrevniHall1FPlayerMovement
	warpcheck
	end

.PickUpPrize:
	writetext EsrevniHall1FReceptionistPickUpPrizeText
	waitbutton
	giveitem FULL_RESTORE, 10
	giveitem REVIVE, 10
	iffalse .BagFull
	writetext EsrevniHall1FPrizeText
	playsound SFX_ITEM
	waitsfx
	readmem wInverPoints
	addval -7
	writemem wInverPoints
	clearevent EVENT_ESREVNI_HALL_PICK_UP_PRIZE
	sjump .EndConversation

.NoBattle:
	writetext EsrevniHall1FReceptionistAskCurrentStreakText
	yesorno
	iffalse .EndConversation
	writetext EsrevniHall1FReceptionistCurrentStreakText
	yesorno
	iffalse .EndConversation
	sjump .EnterBattleRoom

.BagFull:
	writetext EsrevniHall1FReceptionistBagFullText
	waitbutton
.EndConversation:
	writetext EsrevniHall1FReceptionistComeBackSoonText
	waitbutton
	closetext
	end

EsrevniHall1FOwnerScript:
	opentext
	writetext EsrevniHall1FOwnerText
	waitbutton
	closetext
	end

EsrevniHall1FMachopScript:
	opentext
	writetext EsrevniHall1FMachopText
	cry MACHOP	
	waitbutton
	refreshscreen
	pokepic MACHOP
	waitbutton
	closepokepic
	closetext
	end

EsrevniHall1FYoungsterScript:
	jumptextfaceplayer EsrevniHall1FYoungsterText

EsrevniHall1FBeautyScript:
	jumptextfaceplayer EsrevniHall1FBeautyText

EsrevniHall1FCooltrainerFScript:
	faceplayer
	opentext
	writetext EsrevniHall1FCooltrainerFText
	waitbutton
	closetext
	turnobject ESREVNIHALL1F_COOLTRAINERF, UP
	end

EsrevniHall1FRulesSign:
	opentext
	writetext ReadEsrevniHallRulesText
	yesorno
	iffalse .skip
	writetext EsrevniHallRulesText
	waitbutton
.skip:
	closetext
	end

EsrevniHall1FReceptionistMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

EsrevniHall1FReceptionistMoveforInver:
	step LEFT
	step DOWN
	step_end

EsrevniHall1FInverLeaveMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

EsrevniHall1FPlayerMovement:
	step UP
	step_end

EsrevniHall1FReceptionistWelcomeText:
	text "Hello and welcome"
	line "to Esrevni Hall!"
	
	para "The rules are on"
	line "the sign to the"
	cont "left."
	
	para "Would you like to"
	line "enter the Battle"
	cont "Room?"
	done

EsrevniHall1FReceptionistThisWayText:
	text "Fantastic."
	line "Please follow me."
	done

EsrevniHall1FReceptionistGoodLuckText:
	text "Best of luck"
	line "to you!"
	done

EsrevniHall1FReceptionistPickUpPrizeText:
	text "Hello, there!"
	line "I've been holding"
	cont "on to your prizes."
	done

EsrevniHall1FReceptionistAskCurrentStreakText:
	text "Would you like to"
	line "know your current"
	cont "win count?"
	done

EsrevniHall1FReceptionistCurrentStreakText:
	text "Your current win"
	line "count is @"
	text_decimal wInverPoints, 1, 1
	text " wins."
	
	para "Would you like to"
	line "enter the Battle"
	cont "Room?"
	done

EsrevniHall1FReceptionistBagFullText:
	text "Oh dear, your"
	line "bag is full."
	
	para "I'll hold on to"
	line "these until you've"
	cont "made room."
	done

EsrevniHall1FReceptionistComeBackSoonText:
	text "Thanks for"
	line "visiting and"
	cont "Come back soon!"
	done

EsrevniHall1FOwnerText:
	text "Welcome to Esrevni"
	line "Hall!"
	
	para "After many years"
	line "of fundraising and"
	cont "thanks to the"
	
	para "amazing work done"
	line "by Machop, my"
	cont "project has been"
	cont "completed!"
	
	para "Please enjoy the"
	line "unique battles"
	cont "we have here!"
	done

EsrevniHall1FMachopText:
	text "Machop: Guooh"
	line "gogogoh!"
	done

EsrevniHall1FInverSevenPointsText:
	text "Well, this was"
	line "your seventh"
	cont "victory."
	
	para "Please accept"
	line "your prize."
	done

EsrevniHall1FPrizeText:
	text "<PLAYER> recieved"
	line "10 Revives and"
	cont "10 Full Restores."
	done

EsrevniHall1FInverBagFullText:
	text "Oh, your bag"
	line "is full."
	
	para "I'll leave your"
	line "prize here with"
	cont "Sandra."
	done

EsrevniHall1FInverPrizeText:
	text "Inver: I find"
	line "these items to be"
	cont "the most useful"
	cont "for battle."
	done

EsrevniHall1FInverBattleAgainText:
	text "I hope to battle"
	line "again soon."
	
	para "Good day to you."
	done

EsrevniHall1FYoungsterText:
	text "I love it here,"
	line "but I can't get"
	
	para "the hang of the"
	line "rules - I keep"
	cont "losing!"
	done

EsrevniHall1FBeautyText:
	text "I hear that"
	line "there's a prize"
	cont "for winning a"
	
	para "certain number"
	line "of times."
	
	para "I've managed to"
	line "win 4 times, so"
	cont "it's more than"
	cont "that…"
	done

EsrevniHall1FCooltrainerFText:
	text "I'm glad they"
	line "have footage of"
	cont "the battles!"
	
	para "It's great for"
	line "research!"
	done

ReadEsrevniHallRulesText:
	text "Esrevni Hall rules"
	line "are written here."

	para "Read the rules?"
	done

EsrevniHallRulesText:
	text "Type matchups are"
	line "inversed:"

	para "Moves that have no"
	line "effect, and not"
	cont "very effective"
	cont "moves will be"
	cont "super effective."

	para "Super effective"
	line "moves will be not"
	cont "very effective."
	
	para "There are no"
	line "Type immunities."
	
	para "Other than that,"
	line "these are regular"
	cont "battles."
	
	para "Be careful, good"
	line "luck and have fun!"
	done

EsrevniHall1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 15, VERMILION_CITY, 11
	warp_event 13, 15, VERMILION_CITY, 11
	warp_event 13,  3, ESREVNI_HALL_BATTLE_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event 12,  9, BGEVENT_READ, EsrevniHall1FRulesSign

	def_object_events
	object_event  8, 10, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FNurseScript, -1
	object_event  9, 10, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FChansey, -1
	object_event 13,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FReceptionistScript, -1
	object_event 18, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FOwnerScript, -1
	object_event 19, 10, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FMachopScript, -1
	object_event  3, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FYoungsterScript, -1
	object_event 13, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ESREVNI_HALL_1F_INVER
	object_event 15, 14, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FBeautyScript, -1
	object_event 24, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EsrevniHall1FCooltrainerFScript, -1
