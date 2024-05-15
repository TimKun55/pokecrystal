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

EarlsPokemonAcademy_MapScripts:
	def_scene_scripts

	def_callbacks

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
	ifequal 5, .Freeze
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

.Freeze:
	writetext AcademyFreezeText
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
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

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
	jumpstd DifficultBookshelfScript

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
	text "EARL, I am!"

	para "Wonderful are"
	line "#MON, yes!"

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

	para "In battle, #MON"
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
	cont "#MON well?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Fine! Teach you,"
	line "I will!"

	para "If #MON come"
	line "out in battle even"

	para "briefly, some EXP."
	line "Points it gets."

	para "At top of list put"
	line "weak #MON."

	para "Switch in battle"
	line "quick!"

	para "This way, weak"
	line "#MON strong"
	cont "become!"
	done

AcademyEarlNoMoreToTeachText:
	text "Oh! Smart student"
	line "you are! Nothing"
	cont "more do I teach!"

	para "Good to #MON"
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
	line "#MON to the"
	cont "guy beside me."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Huh? The #MON I"
	line "just got is hold-"
	cont "ing something!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "A #MON holding"
	line "an ORAN BERRY"
	cont "will heal itself"
	cont "in battle."

	para "Many other items"
	line "can be held by"
	cont "#MON…"

	para "It sure is tough"
	line "taking notes…"
	done

AcademyBlackboardText:
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."
	done

AcademyPoisonText:
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

AcademySleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

AcademyBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

AcademyFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done

AcademyNotebookText:
	text "It's this kid's"
	line "notebook…"

	para "Catch #MON"
	line "using # BALLS."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done

AcademyNotebookText1:
	text "Before throwing a"
	line "# BALL, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #MON is"
	cont "easier to catch."

	para "Keep reading?"
	done

AcademyNotebookText2:
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #MON attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #MON"

	para "in battle are"
	line "#MON trainers."

	para "They are expected"
	line "to visit #MON"

	para "GYMS and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"

	para "Boy: E-he-he…"

	para "I haven't written"
	line "anymore…"
	done

YoungsterGabeSeenText:
	text "We're helping"
	line "ENOMOTO Sensei!"
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
	line "your #MON"
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
	line "put a #MON"
	cont "to sleep are"

	para "not very accurate."

	para "But there is ONE"
	line "move that has"
	cont "100% accuracy."
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
	line "overseas in UNOVA."
	done

TeacherEnomotoStrongerText:
	text "The EVIOLITE will"
	line "increase the"
	cont "Defense stats of"

	para "a #MON that"
	line "can still evolve"
	cont "by 50% each."

	para "Put it to"
	line "good use!"
	done

AcademyStickerMachineText:
	text "This super machine"
	line "prints data out as"

	para "stickers!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, VIOLET_CITY, 3
	warp_event  6, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event 14,  1, BGEVENT_READ, AcademyBookshelf
	bg_event 15,  1, BGEVENT_READ, AcademyBookshelf
	bg_event 17,  0, BGEVENT_READ, AcademyBlackboard
	bg_event 18,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event 18,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event 16,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event 17, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event 18, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event 18,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event 16,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterGabe, -1
	object_event  7, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherJon, -1
	object_event  4,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerLassMai, -1
	object_event  5,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeacherEnomotoScript, -1
