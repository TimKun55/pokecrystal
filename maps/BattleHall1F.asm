	object_const_def
	const BATTLEHALL1F_RECEPTIONIST
	const BATTLEHALL1F_GRAMPS
	const BATTLEHALL1F_MACHOP
	const BATTLEHALL1F_INVER
	const BATTLEHALL1F_THORTON
	const BATTLEHALL1F_YOUNGSTER
	const BATTLEHALL1F_BEAUTY
	const BATTLEHALL1F_COOLTRAINERF
	const BATTLEHALL1F_SCIENTIST

BattleHall1F_MapScripts:
	def_scene_scripts
	scene_script BattleHall1FNoopScene,               SCENE_BATTLEHALL1F_NOOP
	scene_script BattleHall1FAfterInverBattleScene,   SCENE_BATTLEHALL1F_AFTERINVERBATTLE
	scene_script BattleHall1FAfterThortonBattleScene, SCENE_BATTLEHALL1F_AFTERTHORTONBATTLE	

	def_callbacks

BattleHall1FNoopScene:
	end

BattleHall1FAfterInverBattleScene:
	sdefer BattleHall1FAfterInverBattleScript
	end

BattleHall1FAfterThortonBattleScene:
	sdefer BattleHall1FAfterThortonBattleScript
	end

BattleHall1FAfterInverBattleScript:
	opentext
	readmem wInverPoints
	ifequal 7, .SevenPoints
.FinishInverScene:
	writetext BattleHall1FInverBattleAgainText
	waitbutton
	closetext
	turnobject BATTLEHALL1F_INVER, UP
	applymovement BATTLEHALL1F_RECEPTIONIST, BattleHall1FReceptionistInverThortonMovement
	applymovement BATTLEHALL1F_INVER, BattleHall1FInverThortonLeaveMovement
	disappear BATTLEHALL1F_INVER
	applymovement BATTLEHALL1F_RECEPTIONIST, BattleHall1FReceptionistAfterInverThortonMovement
	setscene SCENE_BATTLEHALL1F_NOOP
	refreshscreen
	end

.SevenPoints:
	checkevent EVENT_BATTLE_HALL_FIRST_TIME_MAX_INVER_POINTS
	iffalse .FirstTime
.ContinuePoints
	writetext BattleHall1FInverSevenPointsText
	waitbutton
	giveitem FULL_RESTORE, 10
	giveitem REVIVE, 10
	iffalse .BagFull
	writetext BattleHall1FInverPrizeText
	playsound SFX_ITEM
	waitsfx
	writetext BattleHall1FInversPrizeText
	waitbutton
	readmem wInverPoints
	addval -7
	writemem wInverPoints
	sjump .FinishInverScene

.FirstTime
	setevent EVENT_BATTLE_HALL_FIRST_TIME_MAX_INVER_POINTS
	sjump .ContinuePoints

.BagFull:
	writetext BattleHall1FBagFullText
	waitbutton
	setevent EVENT_BATTLE_HALL_PICK_UP_INVER_PRIZE
	sjump .FinishInverScene

BattleHall1FAfterThortonBattleScript:
	opentext
	readmem wThortonPoints
	ifequal 7, .SevenPoints
.FinishThortonScene:
	writetext BattleHall1FThortonBattleAgainText
	waitbutton
	closetext
	turnobject BATTLEHALL1F_THORTON, UP
	applymovement BATTLEHALL1F_RECEPTIONIST, BattleHall1FReceptionistInverThortonMovement
	applymovement BATTLEHALL1F_THORTON, BattleHall1FInverThortonLeaveMovement
	disappear BATTLEHALL1F_THORTON
	applymovement BATTLEHALL1F_RECEPTIONIST, BattleHall1FReceptionistAfterInverThortonMovement
	setscene SCENE_BATTLEHALL1F_NOOP
	refreshscreen
	end

.SevenPoints:
	checkevent EVENT_BATTLE_HALL_FIRST_TIME_MAX_THORTON_POINTS
	iffalse .FirstTime
.ContinuePoints
	writetext BattleHall1FThortonSevenPointsText
	waitbutton
	giveitem STAR_PIECE, 5
	giveitem RARE_CANDY, 10
	iffalse .BagFull
	writetext BattleHall1FThortonPrizeText
	playsound SFX_ITEM
	waitsfx
	writetext BattleHall1FThortonsPrizeText
	waitbutton
	readmem wThortonPoints
	addval -7
	writemem wThortonPoints
	sjump .FinishThortonScene

.FirstTime
	setevent EVENT_BATTLE_HALL_FIRST_TIME_MAX_THORTON_POINTS
	sjump .ContinuePoints

.BagFull:
	writetext BattleHall1FBagFullText
	waitbutton
	setevent EVENT_BATTLE_HALL_PICK_UP_THORTON_PRIZE
	sjump .FinishThortonScene

BattleHall1FReceptionistScript:
	opentext
	checkevent EVENT_BATTLE_HALL_PICK_UP_INVER_PRIZE
	iftrue .PickUpInverPrize
	checkevent EVENT_BATTLE_HALL_PICK_UP_THORTON_PRIZE
	iftrue .PickUpThortonPrize
	writetext BattleHall1FReceptionistWelcomeText
	yesorno
	iffalse .NoBattle
.EnterBattleRoom
	writetext BattleHall1FReceptionistThisWayText
	waitbutton
	closetext
	setmapscene BATTLE_HALL_BATTLE_ROOM, SCENE_BATTLEHALLBATTLEROOM_ENTER
	follow BATTLEHALL1F_RECEPTIONIST, PLAYER
	applymovement BATTLEHALL1F_RECEPTIONIST, BattleHall1FReceptionistMovement
	stopfollow
	turnobject PLAYER, LEFT
	opentext
	writetext BattleHall1FReceptionistGoodLuckText
	waitbutton
	closetext
	applymovement PLAYER, BattleHall1FPlayerMovement
	warpcheck
	end

.PickUpInverPrize:
	writetext BattleHall1FReceptionistPickUpPrizeText
	waitbutton
	giveitem FULL_RESTORE, 10
	giveitem REVIVE, 10
	iffalse .BagFull
	writetext BattleHall1FInverPrizeText
	playsound SFX_ITEM
	waitsfx
	readmem wInverPoints
	addval -7
	writemem wInverPoints
	clearevent EVENT_BATTLE_HALL_PICK_UP_INVER_PRIZE
	sjump .EndConversation

.PickUpThortonPrize:
	writetext BattleHall1FReceptionistPickUpPrizeText
	waitbutton
	giveitem STAR_PIECE, 5
	giveitem RARE_CANDY, 10
	iffalse .BagFull
	writetext BattleHall1FThortonPrizeText
	playsound SFX_ITEM
	waitsfx
	readmem wThortonPoints
	addval -7
	writemem wThortonPoints
	clearevent EVENT_BATTLE_HALL_PICK_UP_THORTON_PRIZE
	sjump .EndConversation

.NoBattle:
	writetext BattleHall1FReceptionistAskCurrentStreakText
	yesorno
	iffalse .EndConversation
	writetext BattleHall1FReceptionistCurrentInverStreakText
	waitbutton
	writetext BattleHall1FReceptionistCurrentThortonStreakText
	waitbutton
	writetext BattleHall1FReceptionistEnterBattleRoomText
	yesorno
	iffalse .EndConversation
	sjump .EnterBattleRoom

.BagFull:
	writetext BattleHall1FReceptionistBagFullText
	waitbutton
.EndConversation:
	writetext BattleHall1FReceptionistComeBackSoonText
	waitbutton
	closetext
	end

BattleHall1FComputer:
	opentext
	checkevent EVENT_BATTLE_HALL_TYPELESS_MODE
	iffalse .IsInverse
	farwritetext BattleHall1FComputerCurrentTypelessText
	yesorno
	iffalse .NoChange
	clearevent EVENT_BATTLE_HALL_TYPELESS_MODE
	setevent EVENT_BATTLE_HALL_INVERSE_MODE
	writetext BattleHall1FComputerChangedToIversedText
	waitbutton
	closetext
	end
	
.NoChange:
	farwritetext BattleHall1FComputerModeNotChangedText
	waitbutton
	closetext
	end

.IsInverse:
	farwritetext BattleHall1FComputerCurrentInverseText
	yesorno
	iffalse BattleHall1FComputer.NoChange
	clearevent EVENT_BATTLE_HALL_INVERSE_MODE
	setevent EVENT_BATTLE_HALL_TYPELESS_MODE
	writetext BattleHall1FComputerChangedToTypelessText
	waitbutton
	closetext
	end

BattleHall1FOwnerScript:
	jumptextfaceplayer BattleHall1FOwnerText

BattleHall1FMachopScript:
	opentext
	writetext BattleHall1FMachopText
	cry MACHOP	
	waitbutton
	refreshscreen
	pokepic MACHOP
	waitbutton
	closepokepic
	closetext
	end      

BattleHall1FScientistScript:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_HALL_FIRST_TIME_MAX_INVER_POINTS
	iffalse .ScientistContinue
	checkevent EVENT_BATTLE_HALL_FIRST_TIME_MAX_THORTON_POINTS
	iffalse .ScientistContinue
	writetext BattleHall1FScientistBattleTypesUnlockedText
	waitbutton
	closetext
	setevent EVENT_BATTLE_TOWER_TYPE_MODES_UNLOCKED
	readvar VAR_FACING
	ifequal RIGHT, .ScientistLeaveRight
	applymovement BATTLEHALL1F_SCIENTIST, BattleHall1FScientistLeaveMovement
	disappear BATTLEHALL1F_SCIENTIST
	end

.ScientistContinue
	writetext BattleHall1FScientistBattleTypesText
	waitbutton
	closetext
	end

.ScientistLeaveRight
	applymovement BATTLEHALL1F_SCIENTIST, BattleHall1FScientistLeaveRightMovement
	disappear BATTLEHALL1F_SCIENTIST
	end

BattleHall1FYoungsterScript:
	jumptextfaceplayer BattleHall1FYoungsterText

BattleHall1FBeautyScript:
	jumptextfaceplayer BattleHall1FBeautyText

BattleHall1FCooltrainerFScript:
	faceplayer
	opentext
	writetext BattleHall1FCooltrainerFText
	waitbutton
	closetext
	turnobject BATTLEHALL1F_COOLTRAINERF, UP
	end

BattleHallRulesSign:
	opentext
	writetext ReadBattleHallRulesText
	yesorno
	iffalse .skip
	writetext BattleHallRulesText
	waitbutton
.skip:
	closetext
	end

BattleHall1FReceptionistMovement:
	step UP
	step UP
	step UP
	step LEFT
	turn_head RIGHT
	step_end

BattleHall1FReceptionistInverThortonMovement:
	step UP
	step RIGHT
	turn_head LEFT
	step_end

BattleHall1FReceptionistAfterInverThortonMovement:
	step LEFT
	step DOWN
	step_end

BattleHall1FInverThortonLeaveMovement:
	step UP
	step UP
	step UP
BattleHall1FPlayerMovement:
	step UP
	step_end

BattleHall1FScientistLeaveMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

BattleHall1FScientistLeaveRightMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

BattleHall1FReceptionistWelcomeText:
	text "Hello and welcome"
	line "to Battle Hall!"
	
	para "The rules are on"
	line "the sign to the"
	cont "right and you can"

	para "change the battle"
	line "type on the com-"
	cont "puter to the left."

	para "Would you like to"
	line "enter the Battle"
	cont "Room?"
	done

BattleHall1FReceptionistThisWayText:
	text "Fantastic."
	line "Please follow me."
	done

BattleHall1FReceptionistGoodLuckText:
	text "Best of luck"
	line "to you!"
	done

BattleHall1FReceptionistPickUpPrizeText:
	text "Hello, there!"
	line "I've been holding"
	cont "on to your prizes."
	done

BattleHall1FReceptionistAskCurrentStreakText:
	text "Would you like to"
	line "know your current"
	cont "win count?"
	done

BattleHall1FReceptionistCurrentInverStreakText:
	text "You have @"
	text_decimal wInverPoints, 1, 1
	text " wins"
	line "against Inver."
	done

BattleHall1FReceptionistCurrentThortonStreakText:
	text "You have @"
	text_decimal wThortonPoints, 1, 1
	text " wins"
	line "against Thorton."
	done

BattleHall1FReceptionistEnterBattleRoomText:
	text "Would you like to"
	line "enter the Battle"
	cont "Room?"
	done

BattleHall1FReceptionistBagFullText:
	text "Oh dear, your"
	line "bag is full."
	
	para "I'll hold on to"
	line "these until you've"
	cont "made room."
	done

BattleHall1FReceptionistComeBackSoonText:
	text "Thanks for"
	line "visiting and"
	cont "Come back soon!"
	done

BattleHall1FComputerCurrentTypelessText:
	text "Current Mode:"
	line "Typeless."
	
	para "Change to"
	line "Inverse?"
	done

BattleHall1FComputerChangedToIversedText:
	text "Battle Mode"
	line "changed to:"
	cont "Inverse."

	para "Good luck,"
	line "challenger."
	done

BattleHall1FComputerCurrentInverseText:
	text "Current Mode:"
	line "Inverse."
	
	para "Change to"
	line "Typeless?"
	done

BattleHall1FComputerChangedToTypelessText:
	text "Battle Mode"
	line "changed to:"
	cont "Typeless."

	para "Good luck,"
	line "challenger."
	done

BattleHall1FComputerModeNotChangedText:
	text "Battle Mode"
	line "has not"
	cont "been changed."
	
	para "Good luck,"
	line "challenger."
	done

BattleHall1FOwnerText:
	text "Welcome to Battle"
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

BattleHall1FMachopText:
	text "Machop: Guooh"
	line "gogogoh!"
	done

BattleHall1FInverSevenPointsText:
	text "Well, this was"
	line "your seventh"
	cont "victory."
	
	para "Please accept"
	line "your prize."
	done

BattleHall1FThortonSevenPointsText:
	text "Bzweeeeep!"
	
	para "My data-analysing"
	line "machine says this"
	cont "is your seventh"
	cont "victory."
	
	para "Here's your prize."
	done

BattleHall1FInverPrizeText:
	text "<PLAYER> recieved"
	line "10 Revives and"
	cont "10 Full Restores."
	done

BattleHall1FThortonPrizeText:
	text "<PLAYER> recieved"
	line "5 Star Pieces and"
	cont "10 Rare Candies."
	done

BattleHall1FBagFullText:
	text "Oh, your bag"
	line "is full."
	
	para "I'll leave your"
	line "prize here with"
	cont "Sandra."
	done

BattleHall1FInversPrizeText:
	text "Inver: I find"
	line "these items to be"
	cont "the most useful"
	cont "for battle."
	done

BattleHall1FThortonsPrizeText:
	text "Thorton: I find"
	line "these items to be"
	cont "very useful."
	done

BattleHall1FInverBattleAgainText:
	text "I hope to battle"
	line "you again soon."
	
	para "Good day to you."
	done

BattleHall1FThortonBattleAgainText:
	text "Come back again,"
	line "I'm gathering some"
	cont "great data."
	
	para "Bye!"
	done

BattleHall1FScientistBattleTypesText:
	text "Hello."
	line "I'm from Johto's"
	cont "Battle Tower."
	
	para "I'm observing the"
	line "types of battles"
	cont "being offered here"
	cont "and if it would"
	cont "be worth intro-"
	cont "ducing them at"
	cont "the Battle Tower."
	
	para "If you manage to"
	line "win both types of"
	cont "prizes, please"
	cont "let me know."
	done

BattleHall1FScientistBattleTypesUnlockedText:
	text "Hello, again."

	para "Oh, you did it!"
	line "You've won both"
	cont "sets of prizes!"

	para "Typeless and"
	line "Inverse battles"
	cont "seem to be very"
	cont "fun."
	
	para "I think these"
	line "types of battles"
	cont "will be popular!"
	
	para "I'll return to"
	line "the Battle Tower"
	cont "to introduce them"
	cont "there!"
	
	para "I hope you take"
	line "part in them!"
	
	para "Thank you for all"
	line "of your hard work."
	done

BattleHall1FYoungsterText:
	text "I love it here,"
	line "but I can't get"
	
	para "the hang of the"
	line "rules - I keep"
	cont "losing!"
	done

BattleHall1FBeautyText:
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

BattleHall1FCooltrainerFText:
	text "I'm glad they"
	line "have footage of"
	cont "the battles!"
	
	para "It's great for"
	line "research!"
	done

ReadBattleHallRulesText:
	text "The rules for"
	line "Inverse and"
	cont "Typeless Battles"
	cont "are written here."

	para "Read them?"
	done

BattleHallRulesText:
	text "Inverse Battles:"

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
	
	para "Typeless Battles:"

	para "All damaging moves"
	line "will hit for"
	cont "neutral damage."

	para "There are no"
	line "Type immunities."
	
	para "Other than that,"
	line "these are regular"
	cont "battles."
	
	para "Be careful, good"
	line "luck and have fun!"
	done

BattleHall1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 13, VERMILION_CITY, 11
	warp_event 13, 13, VERMILION_CITY, 11
	warp_event 12,  1, BATTLE_HALL_BATTLE_ROOM, 1
	warp_event 13,  1, BATTLE_HALL_BATTLE_ROOM, 2

	def_coord_events

	def_bg_events
	bg_event 11,  5, BGEVENT_READ, BattleHall1FComputer
	bg_event 13,  5, BGEVENT_READ, BattleHallRulesSign

	def_object_events
	object_event 12,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleHall1FReceptionistScript, -1
	object_event  8,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleHall1FOwnerScript, -1
	object_event  9,  6, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, BattleHall1FMachopScript, -1
	object_event 12,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_HALL_1F_INVER
	object_event 12,  6, SPRITE_THORTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_HALL_1F_THORTON
	object_event  3,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleHall1FYoungsterScript, -1
	object_event 21,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleHall1FBeautyScript, -1
	object_event 22,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleHall1FCooltrainerFScript, -1
	object_event 15,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleHall1FScientistScript, EVENT_BATTLE_HALL_1F_SCIENTIST
