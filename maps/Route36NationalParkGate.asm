	object_const_def
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route36NationalParkGateNoop1Scene,             SCENE_ROUTE36NATIONALPARKGATE_NOOP
	scene_script Route36NationalParkGateNoop2Scene,             SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script Route36NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route36NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route36NationalParkGateCheckIfContestAvailableCallback

Route36NationalParkGateLeaveContestEarlyScene:
	sdefer Route36NationalParkGateLeavingContestEarlyScript
Route36NationalParkGateNoop1Scene:
Route36NationalParkGateNoop2Scene:
	end

Route36NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	endcallback

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route36NationalParkGateCheckIfContestAvailableCallback:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	endcallback

Route36NationalParkGateLeavingContestEarlyScript:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route36NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	special FadeInFromBlack
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext Route36NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 35, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext Route36NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route36NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route36NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route36NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 35, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext Route36NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route36NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route36NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetextend Route36NationalParkGateOfficer1TakePartInFutureText

.RefusedToLeaveMons:
	writetextend Route36NationalParkGateOfficer1ChooseMonAndComeBackText

.FirstMonIsFainted:
	writetextend Route36NationalParkGateOfficer1FirstMonCantBattleText

.BoxFull:
	writetextend Route36NationalParkGateOfficer1MakeRoomText

.FirstMonIsEgg:
	writetextend Route36NationalParkGateOfficer1EggAsFirstMonText

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_SITRUS_BERRY
	iftrue .SitrusBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_ORAN_BERRY
	iftrue .OranBerry
	writetextend Route36NationalParkGateOfficer1ContestIsOverText

.Sunstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.SitrusBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem SITRUS_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SITRUS_BERRY
	closetext
	end

.OranBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem ORAN_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_ORAN_BERRY
	closetext
	end

.BagFull:
	writetextend Route36NationalParkGateOfficer1WellHoldPrizeText

_ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetextend Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant1BText

.StillCompeting:
	writetextend BugCatchingContestant1BStillCompetingText

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant2BText

.StillCompeting:
	writetextend BugCatchingContestant2BStillCompetingText

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant3BText

.StillCompeting:
	writetextend BugCatchingContestant3BStillCompetingText

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant4BText

.StillCompeting:
	writetextend BugCatchingContestant4BStillCompetingText

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant5BText

.StillCompeting:
	writetextend BugCatchingContestant5BStillCompetingText

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant6BText

.StillCompeting:
	writetextend BugCatchingContestant6BStillCompetingText

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant7BText

.StillCompeting:
	writetextend BugCatchingContestant7BStillCompetingText

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant8BText

.StillCompeting:
	writetextend BugCatchingContestant8BStillCompetingText

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant9BText

.StillCompeting:
	writetextend BugCatchingContestant9BStillCompetingText

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetextend BugCatchingContestant10BText

.StillCompeting:
	writetextend BugCatchingContestant10BStillCompetingText

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "Today's @"
	text_ram wStringBuffer3
	text "."
	line "That means the"
	cont "Bug-Catching Con-"
	cont "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#mon, catch a"
	cont "bug #mon to be"
	cont "judged."

	para "Would you like to"
	line "give it a try?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Here are the Park"
	line "Balls for the"
	cont "Contest."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> received"
	line "{d:BUG_CONTEST_BALLS} Park Balls."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "The person who"
	line "gets the strong-"
	cont "est bug #mon"
	cont "is the winner."

	para "You have {d:BUG_CONTEST_MINUTES}"
	line "minutes."

	para "If you run out of"
	line "Park Balls, you're"
	cont "done."

	para "You can keep the"
	line "last #mon you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"
	cont "#mon you can"
	cont "find!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Uh-oh…"

	para "You have more than"
	line "one #mon."

	para "You'll have to use"
	line "@"
	text_ram wStringBuffer3
	text ", the"
	cont "first #mon in"
	cont "your party."

	para "Is that OK with"
	line "you?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "Fine, we'll hold"
	line "your other #mon"
	cont "while you compete."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>'s #mon"
	line "were left with the"
	cont "Contest Helper."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Please choose the"
	line "#mon to be used"
	cont "in the Contest,"
	cont "then come see me."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "The first #mon"
	cont "in your party"
	cont "can't battle."

	para "Please switch it"
	line "with the #mon"
	cont "you want to use,"
	cont "then come see me."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Uh-oh…"
	line "Both your party"
	cont "and your PC Box"
	cont "are full."

	para "You have no room"
	line "to put the bug"
	cont "#mon you catch."

	para "Please make room"
	line "in your party or"
	cont "your PC Box, then"
	cont "come see me."
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "You have an Egg as"
	cont "the first #mon"
	cont "in your party."

	para "Please switch it"
	line "with the #mon"
	cont "you want to use,"
	cont "then come see me."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "You still have @"
	text_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "OK. Please wait"
	line "here for the"
	cont "announcement of"
	cont "the winners."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "OK. Please go back"
	line "outside and finish"
	cont "up."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "Today's Contest is"
	line "over. We hope you"
	cont "will participate"
	cont "in the future."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Some #mon can"
	line "only be seen in"
	cont "the Park."
	done

BugCatchingContestant1BText:
	text "Don: Wow, you beat"
	line "me. You're pretty"
	cont "good."
	done

BugCatchingContestant1BStillCompetingText:
	text "Don: Luck plays a"
	line "big part in this."

	para "You never know"
	line "what #mon will"
	cont "appear."
	done

BugCatchingContestant2BText:
	text "Ed: I envy you."
	line "I just couldn't"
	cont "do it this time."
	done

BugCatchingContestant2BStillCompetingText:
	text "Ed: Maybe you win"
	line "with big #mon?"
	done

BugCatchingContestant3BText:
	text "Nick: Well done!"
	line "I'm going to raise"
	cont "my #mon better."
	done

BugCatchingContestant3BStillCompetingText:
	text "Nick: Maybe you"
	line "get a higher score"
	cont "for a #mon of"
	cont "an unusual color."
	done

BugCatchingContestant4BText:
	text "William: You're"
	line "the winner? What"
	cont "did you catch?"
	done

BugCatchingContestant4BStillCompetingText:
	text "William: Well, I'm"
	line "satisfied because"
	cont "I caught a #mon"
	cont "that I wanted."
	done

BugCatchingContestant5BText:
	text "Benny: Congrats!"
	line "You have earned my"
	cont "respect!"
	done

BugCatchingContestant5BStillCompetingText:
	text "Benny: I caught a"
	line "Scyther before,"
	cont "but I didn't win."
	done

BugCatchingContestant6BText:
	text "Barry: That #-"
	line "mon you caught…"
	cont "it's awesome!"
	done

BugCatchingContestant6BStillCompetingText:
	text "Barry: It's easier"
	line "to win if you get"
	cont "a high-level bug"
	cont "#mon."

	para "But I think they"
	line "also consider some"
	cont "other points."
	done

BugCatchingContestant7BText:
	text "Cindy: You won?"
	line "That's great!"

	para "Do you feel like"
	line "looking for bug"
	cont "#mon with me?"
	done

BugCatchingContestant7BStillCompetingText:
	text "Cindy: I really"
	line "love bug #mon!"
	done

BugCatchingContestant8BText:
	text "Josh: I… I can't"
	line "believe I lost at"
	cont "bug-catching…"
	done

BugCatchingContestant8BStillCompetingText:
	text "Josh: I heard that"
	line "somebody won with"
	cont "a Caterpie!"
	done

BugCatchingContestant9BText:
	text "Samuel: Next time,"
	line "I'm going to win."
	done

BugCatchingContestant9BStillCompetingText:
	text "Samuel: Darn."
	line "I thought I would"
	cont "score higher…"
	done

BugCatchingContestant10BText:
	text "Kipp: Could you"
	line "give me some tips?"

	para "I want to study"
	line "your style."
	done

BugCatchingContestant10BStillCompetingText:
	text "Kipp: I study a"
	line "lot, but that's"

	para "not good enough to"
	line "win."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Uh-oh… Your Pack"
	line "is full."

	para "We'll hold on to"
	line "your prize, but"
	cont "only for today."

	para "Please make room,"
	line "then come see me."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"

	para "Here's the prize"
	line "we were holding"
	cont "for you."
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	def_object_events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
