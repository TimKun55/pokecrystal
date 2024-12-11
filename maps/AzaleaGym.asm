	object_const_def
	const AZALEAGYM_BUGSY
	const AZALEAGYM_SCYTHER
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_BUG_MANIAC
	const AZALEAGYM_GYM_GUIDE

AzaleaGym_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal 16, .BugsyScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BugsyScript_Rematch
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	promptbutton
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end
	
.BugsyScript_16Badges
	checkflag ENGINE_DAILY_BUGSY_REMATCH
	iftrue .skip_rematch
	writetext Bugsy16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext BugsyWinLossRematchText, 0
	loadtrainer BUGSY, BUGSY3
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_BUGSY_REMATCH
	opentext
	writetext Bugsy16AfterBattleText
	waitbutton
	closetext
	end

.BugsyScript_Rematch
	checkflag ENGINE_DAILY_BUGSY_REMATCH
	iftrue .skip_rematch
	writetext BugsyRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext BugsyWinLossRematchText, 0
	loadtrainer BUGSY, BUGSY2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_BUGSY_REMATCH
	opentext
	writetext BugsyRematchAfterBattleText
	waitbutton
	closetext
	end

.skip_rematch
	writetext BugsyComeBackTomorrowText
	waitbutton
	closetext
	end

.EndRematch
	writetext BugsyNextTimeText
	waitbutton
	closetext
	end

AzaleaGymScyther:
	opentext
	writetext ScytherText
	cry SCYTHER
	waitbutton
	refreshscreen
	pokepic SCYTHER
	waitbutton
	closepokepic
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBugManiacXander:
	trainer BUG_MANIAC, XANDER, EVENT_BEAT_BUG_MANIAC_XANDER, BugManiacXanderSeenText, BugManiacXanderBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugManiacXanderAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuideWinScript
	opentext
	writetext AzaleaGymGuideText
	waitbutton
	closetext
	end

.AzaleaGymGuideWinScript:
	opentext
	writetext AzaleaGymGuideWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	readvar VAR_BADGES
	ifgreater 9, .LyraToo
	jumpstd GymStatue2Script
.LyraToo
	jumpstd GymStatue3Script

BugsyText_INeverLose:
	text "I'm Bugsy!"
	line "I never lose when"

	para "it comes to bug"
	line "#mon."

	para "My research is"
	line "going to make me"

	para "the authority on"
	line "bug #mon!"

	para "Let me demonstrate"
	line "what I've learned"
	cont "from my studies."
	done

BugsyText_ResearchIncomplete:
	text "Whoa, amazing!"
	line "You're an expert"
	cont "on #mon!"

	para "My research isn't"
	line "complete yet."

	para "OK, you win. Take"
	line "this Badge."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> received"
	line "the HiveBadge."
	done

BugsyText_HiveBadgeSpeech:
	text "Do you know the"
	line "benefits of the"
	cont "HiveBadge?"

	para "If you have it,"
	line "#mon up to L30"

	para "will obey you,"
	line "even traded ones."

	para "#mon that know"
	line "Cut will be able"

	para "to use it outside"
	line "of battle too."

	para "Here, I also want"
	line "you to have this."
	done

BugsyText_FuryCutterSpeech:
	text "TM49 contains"
	line "Fury Cutter."

	para "If you don't miss,"
	line "it gets stronger"
	cont "every turn."

	para "The longer your"
	line "battle goes, the"
	cont "better it gets."

	para "Isn't that great?"
	line "I discovered it!"
	done

BugsyText_BugMonsAreDeep:
	text "Bug #mon are"
	line "deep. There are"

	para "many mysteries to"
	line "be explored."

	para "Study your favor-"
	line "ites thoroughly."
	done
	
BugsyRematchIntroText:
	text "Oh, <PLAYER>!"
	line "You're here!"
	
	para "Feel like having"
	line "a rematch?"
	done
	
BugsyWinLossRematchText:
	text "Aww, that's the"
	line "end of it…"
	done
	
BugsyRematchAfterBattleText:
	text "Woah, I thought"
	line "I had done enough"
	cont "research!"
	
	para "I need to do more!"
	
	para "Feel free to"
	line "come back for"
	cont "a rematch!"
	done
	
Bugsy16IntroText:
	text "It's <PLAYER>!"
	
	para "You've been doing"
	line "a lot of your own"
	cont "research, haven't"
	cont "you?"
	
	para "You've beaten all"
	line "the Kanto Gym"
	cont "Leaders!"
	
	para "I'm going to use"
	line "my strongest team"
	cont "against you!"
	
	para "Want a rematch?"
	done
	
Bugsy16AfterBattleText:
	text "Wow!"
	line "I learned a lot"
	cont "from that battle!"
	
	para "Feel free to"
	line "come back for"
	cont "a rematch!"
	done

BugsyComeBackTomorrowText:
	text "We just battled"
	line "today, come back"
	cont "tomorrow, ok?"
	done
	
BugsyNextTimeText:
	text "You can come"
	line "back anytime!"
	done

BugCatcherBennySeenText:
	text "Bug #mon evolve"
	line "young. So they get"

	para "stronger that much"
	line "faster."
	done

BugCatcherBennyBeatenText:
	text "Just evolving"
	line "isn't enough!"
	done

BugCatcherBennyAfterBattleText:
	text "#mon become"
	line "stronger if they"
	cont "evolve. Really!"
	done

BugCatcherAlSeenText:
	text "Bug #mon are"
	line "cool and tough!"

	para "I'll prove it to"
	line "you!"
	done

BugCatcherAlBeatenText:
	text "You proved how"
	line "tough you are…"
	done

BugCatcherAlAfterBattleText:
	text "They're so cool,"
	line "but most girls"

	para "don't like bug"
	line "#mon."

	para "I don't know why…"
	done

BugCatcherJoshSeenText:
	text "You saved all the"
	line "Slowpoke? Whew,"
	cont "you're mighty!"

	para "But my grown-up"
	line "#mon are pretty"
	cont "tough too!"
	done

BugCatcherJoshBeatenText:
	text "Urrgggh!"
	done

BugCatcherJoshAfterBattleText:
	text "I guess I should"
	line "teach them better"
	cont "moves…"
	done
	
BugManiacXanderSeenText:
	text "People tend to"
	line "think bug #mon"
	cont "are weak!"

	para "I love proving"
	line "them wrong!"
	done

BugManiacXanderBeatenText:
	text "Aahhhh!"
	done

BugManiacXanderAfterBattleText:
	text "They're not weak"
	line "but you're"
	cont "definitely strong!"
	done

TwinsAmyandmay1SeenText:
	text "Amy: Hi! Are you"
	line "challenging the"
	cont "Leader? No way!"
	done

TwinsAmyandmay1BeatenText:
	text "Amy & May: Oh,"
	line "double goodness!"
	done

TwinsAmyandmay1AfterBattleText:
	text "Amy: You're"
	line "really strong!"
	done

TwinsAmyandmay2SeenText:
	text "May: You want to"
	line "see the Leader?"
	cont "We come first!"
	done

TwinsAmyandmay2BeatenText:
	text "Amy & May: Oh,"
	line "double goodness!"
	done

TwinsAmyandmay2AfterBattleText:
	text "May: Our bug #-"
	line "mon lost! Oh, what"
	cont "a shame."
	done

AzaleaGymGuideText:
	text "Yo, challenger!"

	para "Bugsy's young, but"
	line "his knowledge of"

	para "bug #mon is for"
	line "real."

	para "It's going to be"
	line "tough without my"
	cont "advice."

	para "Let's see… Bug"
	line "#mon don't like"
	cont "fire."

	para "Flying-type moves"
	line "are super-effec-"
	cont "tive too."
	done

AzaleaGymGuideWinText:
	text "Well done! That"
	line "was a great clash"

	para "of talented young"
	line "trainers."

	para "With people like"
	line "you, the future of"
	cont "#mon is bright!"
	done
	
ScytherText:
	text "Scyther: Scyth!"
	line "Scytherrrr!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  4,  3, SPRITE_SCYTHER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymScyther, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  1,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  7,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  8,  8, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBugManiacXander, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuideScript, -1
