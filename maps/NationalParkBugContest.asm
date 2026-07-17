	object_const_def
	const NATIONALPARKBUGCONTEST_YOUNGSTER1
	const NATIONALPARKBUGCONTEST_YOUNGSTER2
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_YOUNGSTER3
	const NATIONALPARKBUGCONTEST_YOUNGSTER4
	const NATIONALPARKBUGCONTEST_LASS
	const NATIONALPARKBUGCONTEST_YOUNGSTER5
	const NATIONALPARKBUGCONTEST_YOUNGSTER6
	const NATIONALPARKBUGCONTEST_YOUNGSTER7
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2

NationalParkBugContest_MapScripts:
	def_scene_scripts

	def_callbacks

BugCatchingContestant1AScript:
	jumptextfaceplayer BugCatchingContestant1AText

BugCatchingContestant2AScript:
	jumptextfaceplayer BugCatchingContestant2AText

BugCatchingContestant3AScript:
	jumptextfaceplayer BugCatchingContestant3AText

BugCatchingContestant4AScript:
	jumptextfaceplayer BugCatchingContestant4AText

BugCatchingContestant5AScript:
	jumptextfaceplayer BugCatchingContestant5AText

BugCatchingContestant6AScript:
	jumptextfaceplayer BugCatchingContestant6AText

BugCatchingContestant7AScript:
	jumptextfaceplayer BugCatchingContestant7AText

BugCatchingContestant8AScript:
	jumptextfaceplayer BugCatchingContestant8AText

BugCatchingContestant9AScript:
	jumptextfaceplayer BugCatchingContestant9AText

BugCatchingContestant10AScript:
	jumptextfaceplayer BugCatchingContestant10AText

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestBattleNoticeSign:
	jumptext NationalParkBugContestBattleNoticeText

NationalParkBugContestTrainerTipsSign:
	jumptext NationalParkBugContestTrainerTipsText

NationalParkBugContestParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkBugContestTMDig:
	itemball TM_DIG

NationalParkBugContestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

BugCatchingContestant1AText:
	ntag " Don "
	text "I'm going to win!"
	line "Don't bother me."
	done

BugCatchingContestant2AText:
	ntag " Ed "
	text "My Parasect puts"
	line "#mon to sleep"
	cont "with Spore."
	done

BugCatchingContestant3AText:
	ntag " Nick "
	text "I'm raising fast"
	line "#mon for"
	cont "battles."
	done

BugCatchingContestant4AText:
	ntag " William "
	text "I'm not concerned"
	line "about winning."

	para "I'm just looking"
	line "for rare #mon."
	done

BugCatchingContestant5AText:
	ntag " Benny "
	text "Ssh! You'll scare"
	line "off Scyther."

	para "I'll talk to you"
	line "later."
	done

BugCatchingContestant6AText:
	ntag " Barry "
	text "You should weaken"
	line "bug #mon first,"
	cont "then throw a Ball."
	done

BugCatchingContestant7AText:
	ntag " Cindy "
	text "I love bug"
	line "#mon."

	para "I guess you must"
	line "like them too."
	done

BugCatchingContestant8AText:
	ntag " Josh "
	text "I've been"
	line "collecting bug"
	cont "#mon since I"
	cont "was just a baby."

	para "There's no way I'm"
	line "going to lose!"
	done

BugCatchingContestant9AText:
	ntag " Samuel "
	text "If you've got the"
	line "time to chat, go"
	cont "find some bug"
	cont "#mon."
	done

BugCatchingContestant10AText:
	ntag " Kipp "
	text "I've studied about"
	line "bug #mon a lot."

	para "I'm going to win"
	line "for sure."
	done

NationalParkBugContestRelaxationSquareText:
	text "Relaxation Square"
	line "National Park"
	done

NationalParkBugContestBattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "National Park"
	line "Warden's Office"
	done

NationalParkBugContestTrainerTipsText:
	text "Trainer Tips"

	para "Visit Route 39's"
	line "Moomoo Farm for"
	cont "some delicious"
	cont "Moomoo Milk."
	done

NationalParkBugContest_MapEvents:

	def_warp_events
	warp_event 35, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 35, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 12, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 13, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 16, 44, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event 29, 31, BGEVENT_READ, NationalParkBugContestBattleNoticeSign
	bg_event  8, 47, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal
	bg_event 14,  4, BGEVENT_READ, NationalParkBugContestTrainerTipsSign

	def_object_events
	object_event 21, 29, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 30, 22, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event 11, 18, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  9, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 25,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 29, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  9, 23, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 13, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 18,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 19, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 37, 12, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event  3, 43, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_DIG
