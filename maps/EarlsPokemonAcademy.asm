	object_const_def
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX
	const EARLSPOKEMONACADEMY_YOUNGSTER3
	const EARLSPOKEMONACADEMY_BUG_CATCHER
	const EARLSPOKEMONACADEMY_LASS
	const EARLSPOKEMONACADEMY_TEACHER
	const EARLSPOKEMONACADEMY_RECEPTIONIST

EarlsPokemonAcademy_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, EarlsPokemonAcademyStairsCallback

EarlsPokemonAcademyStairsCallback:
	checkevent EVENT_BEAT_FALKNER
	iffalse .NoStairs
	endcallback

.NoStairs:
	changeblock 16, 10, $3c ; no stairs
	endcallback

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text
	
TrainerYoungsterGabe:
	trainer YOUNGSTER, GABE, EVENT_BEAT_YOUNGSTER_GABE, YoungsterGabeSeenText, YoungsterGabeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGabeAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJon:
	trainer BUG_CATCHER, JON, EVENT_BEAT_BUG_CATCHER_JON, BugCatcherJonSeenText, BugCatcherJonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherJonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLassMai:
	trainer LASS, MAI, EVENT_BEAT_LASS_MAI, LassMaiSeenText, LassMaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMaiAfterBattleText
	waitbutton
	closetext
	end
	
TeacherEnomotoScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_TEACHER_ENOMOTO
	iftrue .FightDone
	writetext TeacherEnomotoIntroText
	waitbutton
	yesorno
	iffalse .EnomotoEnd
	checkevent EVENT_BEAT_YOUNGSTER_GABE
	iffalse .battlemore
	checkevent EVENT_BEAT_BUG_CATCHER_JON
	iffalse .battlemore
	checkevent EVENT_BEAT_LASS_MAI
	iffalse .battlemore
	writetext TeacherEnomotoLetsBattleText
	waitbutton
	closetext
	winlosstext EnomotoText_WellDone, 0
	loadtrainer TEACHER, ENOMOTO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TEACHER_ENOMOTO
	opentext
	writetext TeacherEnomotoTakeThisText
	waitbutton
	verbosegiveitem EVIOLITE
	setevent EVENT_GOT_EVIOLITE
.FightDone
	writetext TeacherEnomotoStrongerText
	waitbutton
	closetext
	end

.EnomotoEnd
	writetext TeacherEnomotoEndText
	waitbutton
	closetext
	end

.battlemore
	writetext TeacherEnomotoBattleMoreText
	waitbutton
	closetext
	end

AcademyReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iffalse .NoStairsText
	writetext AcademyReceptionistTextStairs
	waitbutton
	closetext
	end

.NoStairsText
	writetext AcademyReceptionistTextNoStairs
	waitbutton
	closetext
	end

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Frostbite
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Frostbite:
	writetext AcademyFrostbiteText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "Psn@"
	db "Par@"
	db "Slp@"
	db "Brn@"
	db "Frz@"
	db "Quit@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyBookshelf:
	opentext
	writetext AcademyBookshelfText
	waitbutton
	closetext
	end

AcademyVendingMachine:
	jumpstd VendingMachineScript

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "Earl, I am!"

	para "Wonderful are"
	line "#mon, yes!"

	para "Teach you I will"
	line "to be a better"
	cont "trainer!"

	para "What you want to"
	line "know? Want to be"
	cont "a winner is you?"
	done

AcademyEarlTeachHowToWinText:
	text "Good! Teach you,"
	line "I will!"

	para "In battle, #mon"
	line "top on list jump"
	cont "out first!"

	para "Change order in"
	line "list, make battle"
	cont "easy, maybe!"

	para "More from me you"
	line "want to hear?"
	done

AcademyEarlTeachMoreText:
	text "So, want to know"
	line "how to raise"
	cont "#mon well?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Fine! Teach you,"
	line "I will!"

	para "If #mon come"
	line "out in battle even"

	para "briefly, some Exp."
	line "Points it gets."

	para "At top of list put"
	line "weak #mon."

	para "Switch in battle"
	line "quick!"

	para "This way, weak"
	line "#mon strong"
	cont "become!"
	done

AcademyEarlNoMoreToTeachText:
	text "Oh! Smart student"
	line "you are! Nothing"
	cont "more do I teach!"

	para "Good to #mon"
	line "you must be!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "I'm taking notes"
	line "of the teacher's"
	cont "lecture."

	para "I'd better copy"
	line "the stuff on the"
	cont "blackboard too."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "I traded my best"
	line "#mon to the"
	cont "guy beside me."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Huh? The #mon I"
	line "just got is hold-"
	cont "ing something!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "A #mon holding"
	line "an Oran Berry"
	cont "will heal itself"
	cont "in battle."

	para "Many other items"
	line "can be held by"
	cont "#mon…"

	para "It sure is tough"
	line "taking notes…"
	done

AcademyBlackboardText:
	text "The blackboard"
	line "describes #mon"

	para "status changes in"
	line "battle."
	done

AcademyPoisonText:
	text "If poisoned, a"
	line "#mon steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "Antidote."
	done

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a Parlyz Heal."
	done

AcademySleepText:
	text "If asleep, your"
	line "#mon can't make"
	cont "a move."

	para "A sleeping #mon"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an Awakening."
	done

AcademyBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a Burn Heal as"
	line "the cure."
	done

AcademyFrostbiteText:
	text "If your #mon is"
	line "frostbitten, it'll"
	cont "gradually lose HP."

	para "Its Spcl.Atk will"
	line "also be halved."

	para "Thaw it out with"
	line "an Ice Heal."
	done

AcademyNotebookText:
	text "It's this kid's"
	line "notebook…"

	para "Catch #mon"
	line "using # Balls."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done

AcademyNotebookText1:
	text "Before throwing a"
	line "# Ball, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #mon is"
	cont "easier to catch."

	para "Keep reading?"
	done

AcademyNotebookText2:
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #mon attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #mon"

	para "in battle are"
	line "#mon trainers."

	para "They are expected"
	line "to visit #mon"

	para "Gyms and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"

	para "Boy: E-he-he…"

	para "I haven't written"
	line "anymore…"
	done

AcademyBookshelfText:
	text "Developer Notes"
	
	para "Your #mon"
	line "don't need to"
	cont "learn HMs or"
	
	para "certain TMs to"
	line "use them in"
	cont "the overworld."
	
	para "As long as you"
	line "have the TM or HM,"
	cont "a #mon who CAN"
	
	para "learn the move"
	line "and the correct"
	cont "Badge (for HMs)"
	
	para "your #mon will"
	line "be able to use"
	cont "the move to"
	cont "get around!"
	done

YoungsterGabeSeenText:
	text "We're helping"
	line "Enomoto Sensei!"
	done

YoungsterGabeBeatenText:
	text "Oh, you're"
	line "strong."
	done

YoungsterGabeAfterBattleText:
	text "Status conditions"
	line "can be scary"
	cont "if you're not"
	cont "ready for them."
	done

BugCatcherJonSeenText:
	text "I've got some"
	line "free time."

	para "Battle me!"
	done

BugCatcherJonBeatenText:
	text "I should have"
	line "just studied."
	done

BugCatcherJonAfterBattleText:
	text "Watch out for"
	line "your #mon"
	cont "being poisoned."

	para "If it's regular"
	line "poison, it'll take"
	cont "damage over time."

	para "If it's bad"
	line "poison, the damage"
	cont "it takes increases"
	cont "over time."
	done
	
LassMaiSeenText:
	text "Do you know"
	line "just how scary"
	cont "sleep can be?"
	done

LassMaiBeatenText:
	text "Aww, losing"
	line "was scarier."
	done

LassMaiAfterBattleText:
	text "Most moves that"
	line "put a #mon"
	cont "to sleep are"

	para "not very accurate."

	para "But there is ONE"
	line "move that has"
	cont "100 percent"
	cont "accuracy."
	done
	
TeacherEnomotoIntroText:
	text "Welcome to my"
	line "Battle Course!"

	para "I'm Enomoto."

	para "I've been hired"
	line "by Earl to teach"

	para "the practical"
	line "side of status"
	cont "conditions."

	para "Are you ready"
	line "for your test?"
	done

TeacherEnomotoEndText:
	text "Hmm, best to make"
	line "sure you're fully"
	cont "prepared."
	done

TeacherEnomotoBattleMoreText:
	text "Hmm, I think you"
	line "need to battle the"
	cont "others first."
	done

TeacherEnomotoLetsBattleText:
	text "You seem well"
	line "prepared."

	para "Let's begin."
	done

EnomotoText_WellDone:
	text "Oh, my!"
	line "You've done"
	cont "very well!"
	done

TeacherEnomotoTakeThisText:
	text "As a reward,"
	line "take this item"
	
	para "I found it while"
	line "overseas in Unova."
	done

TeacherEnomotoStrongerText:
	text "The Eviolite will"
	line "increase the"
	cont "Defense stats of"

	para "a #mon that"
	line "can still evolve"
	cont "by 50 percent"
	cont "each."

	para "Put it to"
	line "good use!"
	done

AcademyReceptionistTextStairs:
	text "Welcome to Earl's"
	line "Academy!"
	
	para "To the right is"
	line "the theory course."
	
	para "To the left is"
	line "the battle course."
	
	para "Downstairs is the"
	line "Advanced course."
	done

AcademyReceptionistTextNoStairs:
	text "Welcome to Earl's"
	line "Academy!"
	
	para "To the right is"
	line "the theory course."
	
	para "To the left is"
	line "the battle course."
	
	para "<……>"
	line "<……>"
	
	para "There's another,"
	line "secret, course"
	
	para "but you'll have to"
	line "come back when"
	
	para "you have at least"
	line "one Gym Badge."
	
	para "Shh!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 15, VIOLET_CITY, 3
	warp_event 16, 15, VIOLET_CITY, 3
	warp_event 16, 10, EARLS_POKEMON_ACADEMY_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 22,  1, BGEVENT_READ, AcademyBookshelf
	bg_event 23,  1, BGEVENT_READ, AcademyBookshelf
	bg_event 25,  0, BGEVENT_READ, AcademyBlackboard
	bg_event 26,  0, BGEVENT_READ, AcademyBlackboard
	bg_event 10, 11, BGEVENT_READ, AcademyVendingMachine
	bg_event 11, 11, BGEVENT_READ, AcademyVendingMachine
	bg_event 20, 11, BGEVENT_READ, AcademyVendingMachine
	bg_event 21, 11, BGEVENT_READ, AcademyVendingMachine

	def_object_events
	object_event 26,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event 24,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event 25, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event 26, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event 26,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event 24,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterGabe, -1
	object_event  7, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherJon, -1
	object_event  4,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerLassMai, -1
	object_event  5,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeacherEnomotoScript, -1
	object_event 14, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AcademyReceptionistScript, -1
