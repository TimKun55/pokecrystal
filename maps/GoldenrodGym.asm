	object_const_def
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_MILTANK
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BEAUTY1
	const GOLDENRODGYM_BEAUTY2
	const GOLDENRODGYM_GYM_GUIDE

GoldenrodGym_MapScripts:
	def_scene_scripts
	scene_script GoldenrodGymNoop1Scene, SCENE_GOLDENRODGYM_NOOP
	scene_script GoldenrodGymNoop2Scene, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

GoldenrodGymNoop1Scene:
	end

GoldenrodGymNoop2Scene:
	end

GoldenrodGymWhitneyScript:
	faceplayer	
	readvar VAR_BADGES
	ifequal 16, .WhitneyScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .WhitneyScript_Rematch
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	opentext
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	opentext
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	setevent EVENT_VIOLET_GYM_HOOTHOOT
	clearevent EVENT_VIOLET_GYM_NOCTOWL
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	opentext
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	opentext
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end
	
.WhitneyScript_16Badges
	opentext
	writetext Whitney16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext WhitneyWinLossRematchText, 0
	loadtrainer WHITNEY, WHITNEY3
	startbattle
	reloadmapafterbattle
	opentext
	writetext Whitney16AfterBattleText
	waitbutton
	closetext
	end

.WhitneyScript_Rematch
	opentext
	writetext WhitneyRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext WhitneyWinLossRematchText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	opentext
	writetext WhitneyRematchAfterBattleText
	waitbutton
	closetext
	end

.EndRematch
	writetext WhitneyNextTimeText
	waitbutton
	closetext
	end
	
GoldenrodGymMiltank:
	opentext
	writetext MiltankText
	cry MILTANK
	waitbutton
	refreshscreen
	pokepic MILTANK
	waitbutton
	closepokepic
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideText
	waitbutton
	closetext
	end

.GoldenrodGymGuideWinScript:
	opentext
	writetext GoldenrodGymGuideWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	readvar VAR_BADGES
	ifgreater 10, .LyraToo
	jumpstd GymStatue2Script
.LyraToo
	jumpstd GymStatue3Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Hi! I'm Whitney!"

	para "Everyone was into"
	line "#mon, so I got"
	cont "into it too!"

	para "#mon are"
	line "super-cute!"

	para "You want to bat-"
	line "tle? I'm warning"
	cont "you--I'm good!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Sob…"

	para "…Waaaaaaah!"
	line "You're mean!"

	para "You shouldn't be"
	line "so serious! You…"
	cont "you child, you!"
	done

WhitneyYouMeanieText:
	text "Waaaaah!"

	para "Waaaaah!"

	para "…Snivel, hic…"
	line "…You meanie!"
	done

WhitneyWhatDoYouWantText:
	text "…Sniff…"

	para "What? What do you"
	line "want? A Badge?"

	para "Oh, right."
	line "I forgot. Here's"
	cont "the PlainBadge."
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> received"
	line "the PlainBadge."
	done

WhitneyPlainBadgeText:
	text "The PlainBadge"
	line "lets your #mon"

	para "use Strength out"
	line "of battle."

	para "Oh, you can have"
	line "this too!"
	done

WhitneyAttractText:
	text "It's Attract!"
	line "It makes full use"

	para "of a #mon's"
	line "charm."

	para "Isn't it just per-"
	line "fect for a cutie"
	cont "like me?"
	done

WhitneyGoodCryText:
	text "Ah, that was a"
	line "good cry!"

	para "Come for a visit"
	line "again! Bye-bye!"
	done

WhitneyRematchIntroText:
	text "Oh, hi <PLAYER>!"
	line "Good to see"
	cont "you again."
	
	para "Feel like having"
	line "a rematch?"
	done
	
WhitneyWinLossRematchText:
	text "You really"
	line "are strong!"
	done
	
WhitneyRematchAfterBattleText:
	text "I'm going to get"
	line "even stronger,"
	
	para "Just you watch!"
	
	para "Feel free to"
	line "come back for"
	cont "a rematch!"
	done
	
Whitney16IntroText:
	text "Wow, <PLAYER>!"
	line "You did it!"
	
	para "You beat all"
	line "the Kanto Gym"
	cont "Leaders!"
	
	para "I'm going to use"
	line "my strongest team"
	cont "against you!"
	
	para "Want a rematch?"
	done
	
Whitney16AfterBattleText:
	text "Wow!"
	line "That was an"
	cont "amazing battle!"
	
	para "Come back for"
	line "a rematch soon!"
	done
	
WhitneyNextTimeText:
	text "Aww, well come"
	line "back soon."
	done

LassCarrieSeenText:
	text "Don't let my"
	line "#mon's cute"

	para "looks fool you."
	line "They can whip you!"
	done

LassCarrieBeatenText:
	text "Darn… I thought"
	line "you were weak…"
	done

LassCarrieAfterBattleText:
	text "Do my #mon"
	line "think I'm cute?"
	done

LassBridgetSeenText:
	text "I like cute #-"
	line "mon better than"
	cont "strong #mon."

	para "But I have strong"
	line "and cute #mon!"
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "I'm trying to beat"
	line "Whitney, but…"
	cont "It's depressing."

	para "I'm okay! If I"
	line "lose, I'll just"

	para "try harder next"
	line "time!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. You made"
	line "Whitney cry."

	para "It's OK. She'll"
	line "stop soon. She"

	para "always cries when"
	line "she loses."
	done

BeautyVictoriaSeenText:
	text "Oh, you are a cute"
	line "little trainer! "

	para "I like you, but I"
	line "won't hold back!"
	done

BeautyVictoriaBeatenText:
	text "Let's see… Oops,"
	line "it's over?"
	done

BeautyVictoriaAfterBattleText:
	text "Wow, you must be"
	line "good to beat me!"
	cont "Keep it up!"
	done

BeautySamanthaSeenText:
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, Meowth,"
	line "I'm so sorry!"
	done

BeautySamanthaAfterBattleText:
	text "I taught Meowth"
	line "moves for taking"
	cont "on any type…"
	done

GoldenrodGymGuideText:
	text "Yo! Champ in"
	line "making!"

	para "This Gym is home"
	line "to normal-type"
	cont "#mon trainers."

	para "I recommend you"
	line "use fighting-type"
	cont "#mon."
	done

GoldenrodGymGuideWinText:
	text "You won? Great! I"
	line "was busy admiring"
	cont "the ladies here."
	done
	
MiltankText:
	text "Miltank: Mooo!!"
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9,  3, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymMiltank, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuideScript, -1
