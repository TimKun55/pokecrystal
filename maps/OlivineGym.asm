	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_STEELIX
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal 16, .JasmineScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .JasmineScript_Rematch	
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end
	
.JasmineScript_16Badges
	writetext Jasmine16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext JasmineWinLossRematchText, 0
	loadtrainer JASMINE, JASMINE3
	startbattle
	reloadmapafterbattle
	opentext
	writetext Jasmine16AfterBattleText
	waitbutton
	closetext
	end

.JasmineScript_Rematch
	writetext JasmineRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext JasmineWinLossRematchText, 0
	loadtrainer JASMINE, JASMINE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext JasmineRematchAfterBattleText
	waitbutton
	closetext
	end

.EndRematch
	writetext JasmineNextTimeText
	waitbutton
	closetext
	end
	
OlivineGymSteelix:
	opentext
	writetext SteelixText
	cry STEELIX
	waitbutton
	refreshscreen
	pokepic STEELIX
	waitbutton
	closepokepic
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Thank you for"
	line "your help at the"
	cont "LIGHTHOUSE…"

	para "But this is dif-"
	line "ferent. Please"

	para "allow me to intro-"
	line "duce myself."

	para "I am JASMINE, a"
	line "GYM LEADER. I use"
	cont "the steel-type."

	para "…Do you know about"
	line "the steel-type?"

	para "It's a type that"
	line "was only recently"
	cont "discovered."

	para "…Um… May I begin?"
	done

Jasmine_BetterTrainer:
	text "…You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "the MINERALBADGE."
	done

Jasmine_BadgeSpeech:
	text "…Um… Please take"
	line "this too…"
	done

Jasmine_IronTailSpeech:
	text "…You could use"
	line "that TM to teach"
	cont "IRON TAIL."
	done

Jasmine_GoodLuck:
	text "Um… I don't know"
	line "how to say this,"
	cont "but good luck…"
	done
	
JasmineRematchIntroText:
	text "Oh, <PLAYER>!"
	line "Hello, good to"
	cont "see you again."
	
	para "Feel like having"
	line "a rematch?"
	done
	
JasmineWinLossRematchText:
	text "Well done…"
	done
	
JasmineRematchAfterBattleText:
	text "Properly tempered"
	line "steel won't be"
	cont "made rusty by"
	cont "things like this!"
	
	para "Keep training"
	line "without giving up,"
	
	para "I'll do the same,"
	line "and be sure"
	cont "to back for" 
	cont "a rematch!"
	done
	
Jasmine16IntroText:
	text "<PLAYER>!"
	line "You're back, and"
	cont "you've done it!"
	
	para "You've beaten all"
	line "the KANTO GYM"
	cont "LEADERS!"
	
	para "I'm going to use"
	line "my strongest team"
	cont "against you!"
	
	para "Want a rematch?"
	done
	
Jasmine16AfterBattleText:
	text "As strong as the"
	line "strongest steel!"
	
	para "You're as strong"
	line "as you are kind!"
	
	para "Feel free to"
	line "come back for"
	cont "a rematch!"
	done
	
JasmineNextTimeText:
	text "You can come"
	line "back anytime!"
	done

OlivineGymGuideText:
	text "JASMINE uses the"
	line "newly discovered"
	cont "steel-type."

	para "I don't know very"
	line "much about it."
	done

OlivineGymGuideWinText:
	text "That was awesome."

	para "The steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done

OlivineGymGuidePreText:
	text "JASMINE, the GYM"
	line "LEADER, is at the"
	cont "LIGHTHOUSE."

	para "She's been tending"
	line "to a sick #MON."

	para "A strong trainer"
	line "has to be compas-"
	cont "sionate."
	done
	
SteelixText:
	text "STEELIX: Stee!!"
	line "LixSteelix!"
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  2, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  4,  2, SPRITE_STEELIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, OlivineGymSteelix, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
