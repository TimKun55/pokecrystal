	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_HOOTHOOT
	const VIOLETGYM_NOCTOWL
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks
	
VioletGymFalknerScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal 16, .FalknerScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .FalknerScript_Rematch
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

.FalknerScript_16Badges
	checkflag ENGINE_DAILY_FALKNER_REMATCH
	iftrue .skip_rematch
	writetext Falkner16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext FalknerWinLossRematchText, 0
	loadtrainer FALKNER, FALKNER3
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_FALKNER_REMATCH
	opentext
	writetext Falkner16AfterBattleText
	waitbutton
	closetext
	end

.FalknerScript_Rematch
	checkflag ENGINE_DAILY_FALKNER_REMATCH
	iftrue .skip_rematch
	writetext FalknerRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext FalknerWinLossRematchText, 0
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_FALKNER_REMATCH
	opentext
	writetext FalknerRematchAfterBattleText
	waitbutton
	closetext
	end

.skip_rematch
	writetext FalknerComeBackTomorrowText
	waitbutton
	closetext
	end

.EndRematch
	writetext FalknerNextTimeText
	waitbutton
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymHoothoot:
	opentext
	writetext HoothootText
	cry HOOTHOOT
	waitbutton
	refreshscreen
	pokepic HOOTHOOT
	waitbutton
	closepokepic
	closetext
	end
	
VioletGymNoctowl:
	opentext
	writetext NoctowlText
	cry NOCTOWL
	waitbutton
	refreshscreen
	pokepic NOCTOWL
	waitbutton
	closepokepic
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	readvar VAR_BADGES
	ifgreater 8, .LyraToo
	jumpstd GymStatue2Script
.LyraToo
	jumpstd GymStatue3Script

FalknerIntroText:
	text "I'm Falkner, the"
	line "Violet #mon Gym"
	cont "leader!"

	para "People say you can"
	line "clip flying-type"

	para "#mon's wings"
	line "with a jolt of"
	cont "electricity…"

	para "I won't allow such"
	line "insults to bird"
	cont "#mon!"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#mon!"
	done

FalknerWinLossText:
	text "…Darn! My dad's"
	line "cherished bird"
	cont "#mon…"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#mon League"
	cont "ZephyrBadge."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "the ZephyrBadge."
	done

FalknerZephyrBadgeText:
	text "The ZephyrBadge"
	line "will enable"
	cont "#mon to use"

	para "Flash, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "By using a TM, a"
	line "#mon will"

	para "instantly learn a"
	line "new move."

	para "A TM can be used"
	line "as many times as"
	cont "you like."

	para "TM31 contains"
	line "Mud-Slap."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done

FalknerFightDoneText:
	text "There are #mon"
	line "Gyms in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these Gyms."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done
	
FalknerRematchIntroText:
	text "<PLAYER>!"
	line "You're back!"
	
	para "Feel like having"
	line "a rematch?"
	done
	
FalknerWinLossRematchText:
	text "Soaring high!"
	done
	
FalknerRematchAfterBattleText:
	text "You're as strong"
	line "as ever!"
	
	para "Feel free to"
	line "come back tomorrow"
	cont "for a rematch!"
	done
	
Falkner16IntroText:
	text "<PLAYER>!"
	line "You did it!"
	
	para "You've beaten all"
	line "the Kanto Gym"
	cont "Leaders!"
	
	para "I can finally use"
	line "my strongest team"
	cont "against you!"
	
	para "Want a rematch?"
	done
	
Falkner16AfterBattleText:
	text "Wow!"
	line "That was an"
	cont "amazing battle!"
	
	para "Feel free to"
	line "come back tomorrow"
	cont "for a rematch!"
	done

FalknerComeBackTomorrowText:
	text "We already battled"
	line "today, but come"
	cont "back tomorrow."
	done

FalknerNextTimeText:
	text "Come back"
	line "anytime!"
	done

FalknerComeBackTomorrow:
	text "Battle again?"
	line "Haha, we need a"
	
	para "rest! Come back"
	line "tomorrow!"
	done

BirdKeeperRodSeenText:
	text "The keyword is"
	line "guts!"

	para "Those here are"
	line "training night and"

	para "day to become bird"
	line "#mon masters."

	para "Come on!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "Falkner's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

BirdKeeperAbeSeenText:
	text "Let me see if you"
	line "are good enough to"
	cont "face Falkner!"
	done

BirdKeeperAbeBeatenText:
	text "This can't be"
	line "true!"
	done

BirdKeeperAbeAfterBattleText:
	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
	done

VioletGymGuideText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "The grass-type is"
	line "weak against the"

	para "flying-type. Keep"
	line "this in mind."
	done

VioletGymGuideWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the Champ in no"
	line "time at all!"
	done
	
HoothootText:
	text "Hoothoot: Hoo!!"
	line "Hoohoo!"
	done
	
NoctowlText:
	text "Noctowl: Noc!!"
	line "Towwwwl!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 15, VIOLET_CITY, 2
	warp_event  7, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  5, 13, BGEVENT_READ, VioletGymStatue
	bg_event  8, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  7,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  6,  1, SPRITE_HOOTHOOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletGymHoothoot, EVENT_VIOLET_GYM_HOOTHOOT
	object_event  6,  1, SPRITE_NOCTOWL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletGymNoctowl, EVENT_VIOLET_GYM_NOCTOWL
	object_event  9,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  4, 10, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  9, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
