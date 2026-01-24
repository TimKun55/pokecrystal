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
	scene_script AzaleaGymNoop1Scene, SCENE_AZALEAGYM_ROPE_WALKDEF
	scene_script AzaleaGymNoop2Scene, SCENE_AZALEAGYM_ROPE_WALKABC

	def_callbacks
	callback MAPCALLBACK_TILES, AzaleaGymRedBlueRopeActivationCallback

AzaleaGymNoop1Scene:
AzaleaGymNoop2Scene:
	end

AzaleaGymRedBlueRopeActivationCallback:
	checkevent EVENT_AZALEA_GYM_BLUE_LEVER
	iffalse .endcallback
	changeblock  2,  6, $90 ; deactivated blue lever
	changeblock  8,  6, $8e ; deactivated blue lever
	changeblock  8, 14, $8e ; deactivated blue lever
	changeblock  6, 10, $96 ; deactivated blue rope
	changeblock  8, 10, $97 ; deactivated blue rope
	changeblock 10, 10, $98 ; deactivated blue rope
	checkevent EVENT_AZALEA_GYM_RED_LEVER
	iffalse .endcallback
	changeblock  0, 14, $92 ; deactivated red lever
	changeblock  2,  8, $93 ; deactivated red rope
	changeblock  4,  8, $94 ; deactivated red rope
	changeblock  6,  8, $95 ; deactivated red rope
.endcallback:
	endcallback

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
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetextend BugsyText_FuryCutterSpeech

.GotFuryCutter:
	writetextend BugsyText_BugMonsAreDeep
	
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
	writetextend Bugsy16AfterBattleText

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
	writetextend BugsyRematchAfterBattleText

.skip_rematch
	writetextend BugsyComeBackTomorrowText

.EndRematch
	writetextend BugsyNextTimeText

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
	jumptext TwinsAmyandmay1AfterBattleText

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	jumptext TwinsAmyandmay2AfterBattleText

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	jumptext BugCatcherBennyAfterBattleText

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	jumptext BugCatcherAlAfterBattleText

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	jumptext BugCatcherJoshAfterBattleText
	
TrainerBugManiacXander:
	trainer BUG_MANIAC, XANDER, EVENT_BEAT_BUG_MANIAC_XANDER, BugManiacXanderSeenText, BugManiacXanderBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	jumptext BugManiacXanderAfterBattleText

AzaleaGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuideWinScript
	opentext
	writetextend AzaleaGymGuideText

.AzaleaGymGuideWinScript:
	jumptext AzaleaGymGuideWinText

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

AzaleaGymBlueLever:
	opentext
	checkevent EVENT_AZALEA_GYM_BLUE_LEVER
	iftrue .BlueReset
	writetext AzaleaGymBlueLeverText
	waitbutton
	closetext
	setevent EVENT_AZALEA_GYM_BLUE_LEVER	
	pause 15
	playsound SFX_STRENGTH
	changeblock  2,  6, $90 ; deactivated blue lever
	changeblock  8,  6, $8e ; deactivated blue lever
	changeblock  8, 14, $8e ; deactivated blue lever
	changeblock  6, 10, $96 ; deactivated blue rope
	changeblock  8, 10, $97 ; deactivated blue rope
	changeblock 10, 10, $98 ; deactivated blue rope
	reloadmappart
	end

.BlueReset:
	writetext AzaleaGymBlueLeverText
	waitbutton
	closetext
	clearevent EVENT_AZALEA_GYM_BLUE_LEVER
	pause 15
	playsound SFX_STRENGTH
	changeblock  2,  6, $8f ; activated blue lever
	changeblock  8,  6, $8d ; activated blue lever
	changeblock  8, 14, $8d ; activated blue lever
	changeblock  6, 10, $82 ; activated blue rope
	changeblock  8, 10, $83 ; activated blue rope
	changeblock 10, 10, $84 ; activated blue rope
	reloadmappart
	end

AzaleaGymRedLever:
	opentext
	checkevent EVENT_AZALEA_GYM_RED_LEVER
	iftrue .RedReset
	writetext AzaleaGymRedLeverText
	waitbutton
	closetext
	setevent EVENT_AZALEA_GYM_RED_LEVER
	pause 15
	playsound SFX_STRENGTH
	changeblock  0, 14, $92 ; deactivated red lever
	changeblock  2,  8, $93 ; deactivated red rope
	changeblock  4,  8, $94 ; deactivated red rope
	changeblock  6,  8, $95 ; deactivated red rope
	reloadmappart
	end

.RedReset:
	writetext AzaleaGymRedLeverText
	waitbutton
	closetext
	clearevent EVENT_AZALEA_GYM_RED_LEVER
	pause 15
	playsound SFX_STRENGTH
	changeblock  0, 14, $91 ; activated red lever
	changeblock  2,  8, $7c ; activated red rope
	changeblock  4,  8, $7d ; activated red rope
	changeblock  6,  8, $7e ; activated red rope
	reloadmappart
	end

AzaleaGymPit2SetUpScript:
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit1SetUpScript:
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

AzaleaGymPit1AScript:
	applymovement PLAYER, AzaleaGymPit1AMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit1BScript:
	applymovement PLAYER, AzaleaGymPit1BMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit1CScript:
	applymovement PLAYER, AzaleaGymPit1CMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit1DScript:
	applymovement PLAYER, AzaleaGymPit1DMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

AzaleaGymPit1EScript:
	applymovement PLAYER, AzaleaGymPit1EMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

AzaleaGymPit1FScript:
	applymovement PLAYER, AzaleaGymPit1FMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

AzaleaGymPit2AScript:
	checkevent EVENT_AZALEA_GYM_BLUE_LEVER
	iftrue .Pit2ANoBlue
	applymovement PLAYER, AzaleaGymPit2AMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

.Pit2ANoBlue:
	applymovement PLAYER, AzaleaGymPit2ANoBlueMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit2BScript:
	checkevent EVENT_AZALEA_GYM_BLUE_LEVER
	iftrue .Pit2BNoBlue
	applymovement PLAYER, AzaleaGymPit2BMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

.Pit2BNoBlue:
	applymovement PLAYER, AzaleaGymPit2BNoBlueMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit2CScript:
	applymovement PLAYER, AzaleaGymPit2CMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKDEF
	end

AzaleaGymPit2DScript:
	checkevent EVENT_AZALEA_GYM_RED_LEVER
	iftrue .Pit2BNoRed
	applymovement PLAYER, AzaleaGymPit2DMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

.Pit2BNoRed:
	applymovement PLAYER, AzaleaGymPit2DNoRedMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

AzaleaGymPit2EScript:
	checkevent EVENT_AZALEA_GYM_BLUE_LEVER
	iftrue .Pit2ENoBlue
	checkevent EVENT_AZALEA_GYM_RED_LEVER
	iftrue .Pit2ENoRed
	applymovement PLAYER, AzaleaGymPit2EMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

.Pit2ENoBlue:
	applymovement PLAYER, AzaleaGymPit2ENoBlueMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

.Pit2ENoRed
	applymovement PLAYER, AzaleaGymPit2ENoRedMovement
	setscene SCENE_AZALEAGYM_ROPE_WALKABC
	end

AzaleaGymPit1AMovement:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

AzaleaGymPit1BMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

AzaleaGymPit1CMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

AzaleaGymPit1DMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

AzaleaGymPit1EMovement:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

AzaleaGymPit1FMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

AzaleaGymPit2AMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

AzaleaGymPit2ANoBlueMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

AzaleaGymPit2BMovement:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

AzaleaGymPit2BNoBlueMovement:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

AzaleaGymPit2CMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

AzaleaGymPit2DMovement:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

AzaleaGymPit2DNoRedMovement:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

AzaleaGymPit2EMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

AzaleaGymPit2ENoBlueMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

AzaleaGymPit2ENoRedMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

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
	text "Bugsy: TM49 con-"
	line "tains Fury Cutter."

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

AzaleaGymBlueLeverText:
	text "It's a blue lever."
	
	para "<PLAYER> pulled"
	line "the lever."
	done

AzaleaGymRedLeverText:
	text "It's a red lever."
	
	para "<PLAYER> pulled"
	line "the lever."
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 31, AZALEA_TOWN, 5
	warp_event  7, 31, AZALEA_TOWN, 5

	def_coord_events
	coord_event  2, 25, SCENE_AZALEAGYM_ROPE_WALKDEF, AzaleaGymPit1DScript
	coord_event  6, 25, SCENE_AZALEAGYM_ROPE_WALKDEF, AzaleaGymPit1EScript
	coord_event 11, 25, SCENE_AZALEAGYM_ROPE_WALKDEF, AzaleaGymPit1FScript
	coord_event  2, 20, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit1AScript
	coord_event  6, 20, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit1BScript
	coord_event 11, 20, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit1CScript
	coord_event  2, 13, SCENE_AZALEAGYM_ROPE_WALKDEF, AzaleaGymPit2DScript
	coord_event  6, 13, SCENE_AZALEAGYM_ROPE_WALKDEF, AzaleaGymPit2EScript
	coord_event  2,  8, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit2AScript
	coord_event  6,  8, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit2BScript
	coord_event 11,  8, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit2CScript
	coord_event  6, 14, SCENE_AZALEAGYM_ROPE_WALKABC, AzaleaGymPit2SetUpScript
	coord_event  6, 19, SCENE_AZALEAGYM_ROPE_WALKDEF, AzaleaGymPit1SetUpScript

	def_bg_events
	bg_event  5, 29, BGEVENT_READ, AzaleaGymStatue
	bg_event  8, 29, BGEVENT_READ, AzaleaGymStatue
	bg_event  3,  6, BGEVENT_READ, AzaleaGymBlueLever
	bg_event  8,  7, BGEVENT_READ, AzaleaGymBlueLever
	bg_event  8, 15, BGEVENT_READ, AzaleaGymBlueLever
	bg_event  1, 14, BGEVENT_READ, AzaleaGymRedLever

	def_object_events
	object_event  7,  3, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  6,  3, SPRITE_SCYTHER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymScyther, -1
	object_event  5, 17, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherBenny, -1
	object_event  2, 18, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherAl, -1
	object_event 11,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherJosh, -1
	object_event  1,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event 11, 18, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBugManiacXander, -1
	object_event  9, 29, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuideScript, -1
