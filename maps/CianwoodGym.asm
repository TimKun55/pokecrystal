	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_POLIWRATH
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CianwoodGymWaterfallButtonCallback

CianwoodGymWaterfallButtonCallback:
	checkevent EVENT_BUTTON_2_IN_CIANWOOD_GYM
	iftrue .NoWaterfall
	checkevent EVENT_BUTTON_1_IN_CIANWOOD_GYM
	iftrue .Button1Pushed
	endcallback	

.NoWaterfall
	changeblock 12,  2, $d7
	changeblock  6,  2, $d3
	changeblock  8,  4, $ca
	changeblock  8,  6, $cb
	changeblock  8,  8, $cb
	changeblock  8, 10, $da
	endcallback

.Button1Pushed
	changeblock 12,  2, $d7
	endcallback

CianwoodGymChuckScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal 16, .ChuckScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .ChuckScript_Rematch
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	checkevent EVENT_BUTTON_2_IN_CIANWOOD_GYM
	iffalse .ChuckWaterfallTraining
	writetext ChuckIntroText
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetextend ChuckExplainTMText

.AlreadyGotTM:
	writetextend ChuckAfterText

.ChuckScript_16Badges
	checkflag ENGINE_DAILY_CHUCK_REMATCH
	iftrue .skip_rematch
	writetext Chuck16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ChuckWinLossRematchText, 0
	loadtrainer CHUCK, CHUCK3
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_CHUCK_REMATCH
	opentext
	writetextend Chuck16AfterBattleText

.ChuckScript_Rematch
	checkflag ENGINE_DAILY_CHUCK_REMATCH
	iftrue .skip_rematch
	writetext ChuckRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ChuckWinLossRematchText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_CHUCK_REMATCH
	opentext
	writetextend ChuckRematchAfterBattleText

.skip_rematch
	writetextend ChuckComeBackTomorrowText

.EndRematch
	writetextend ChuckNextTimeText

.ChuckWaterfallTraining
	writetextend WaterfallTrainingText
	
CianwoodGymPoliwrath:
	opentext
	checkevent EVENT_BUTTON_2_IN_CIANWOOD_GYM
	iffalse .PoliwrathWaterfallTraining
	writetext PoliwrathText
	cry POLIWRATH
	waitbutton
	refreshscreen
	pokepic POLIWRATH
	waitbutton
	closepokepic
	closetext
	end

.PoliwrathWaterfallTraining
	writetextend WaterfallTrainingText

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BlackbeltYoshiAfterText

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BlackbeltLaoAfterText

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BlackbeltNobAfterText

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BlackbeltLungAfterText

CianwoodWaterfallButton1:
	opentext
	checkevent EVENT_BUTTON_1_IN_CIANWOOD_GYM
	iftrue CianwoodWaterfallButton2.Pushed
	writetext CianwoodGymButtonPressText
	waitbutton
	closetext
	setevent EVENT_BUTTON_1_IN_CIANWOOD_GYM
	pause 15
	playsound SFX_MOVE_PUZZLE_PIECE
	changeblock 12,  2, $d7
	reloadmappart
	waitsfx
	end

CianwoodWaterfallButton2:
	opentext
	checkevent EVENT_BUTTON_1_IN_CIANWOOD_GYM
	iffalse .NotActive
	checkevent EVENT_BUTTON_2_IN_CIANWOOD_GYM
	iftrue .Pushed
	writetext CianwoodGymButtonPressText
	waitbutton
	closetext
	setevent EVENT_BUTTON_2_IN_CIANWOOD_GYM
	pause 15
	playsound SFX_STRENGTH
	earthquake 50
	changeblock 6,  2, $d3
	changeblock 8,  4, $ca
	changeblock 8,  6, $cb
	changeblock 8,  8, $cb
	changeblock 8, 10, $da
	reloadmappart
	waitsfx
	end

.Pushed
	writetextend CianwoodGymButtonIsPressedText

.NotActive
	writetextend CianwoodGymButtonNotActiveText

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	readvar VAR_BADGES
	ifgreater 12, .LyraToo
	jumpstd GymStatue2Script
.LyraToo
	jumpstd GymStatue3Script

ChuckIntroText:
	text "Ooomph!"

	para "The pounding"
	line "waterfall right"
	cont "onto my head…"

	para "Arrgh!"
	
	para "Why did you stop"
	line "the waterfall from"
	cont "pouring on me?"

	para "You just spoiled"
	line "my training!"
	
	para "I have to warn you"
	line "that I am a strong"
	
	para "Trainer training"
	line "every day under"
	cont "this waterfall!"
	
	para "What?"
	
	para "It has nothing to"
	line "do with #mon?"
	
	para "…"
	line "That's true!"
	cont "… …"
	
	para "Come on."
	line "We shall"
	cont "do battle!"
	done

ChuckLossText:
	text "Wha? Huh?"
	line "I lost?"

	para "How about that!"
	line "You're worthy of"
	cont "the StormBadge!"
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "the StormBadge."
	done

ChuckExplainBadgeText:
	text "The StormBadge"
	line "makes all #mon"
	cont "up to L70 obey,"
	cont "even traded ones."

	para "It also lets your"
	line "#mon use Fly"
	cont "when you're not in"
	cont "a battle."

	para "Here, take this"
	line "too!"
	done

ChuckExplainTMText:
	text "Chuck: That is"
	line "DynamicPunch."

	para "It doesn't always"
	line "hit, but when it"
	cont "does, it causes"
	cont "confusion!"
	done

ChuckAfterText:
	text "WAHAHAH! I enjoyed"
	line "battling you!"

	para "But a loss is a"
	line "loss!"

	para "From now on, I'm"
	line "going to train 24"
	cont "hours a day!"
	done

ChuckRematchIntroText:
	text "WAHAHAHAHA!"
	
	para "Good to see you"
	line "<PLAYER>!"
	
	para "Feel like having"
	line "a rematch?"
	done
	
ChuckWinLossRematchText:
	text "WAHAHAH!" 
	line "Smashed like"
	cont "a rock!"
	done
	
ChuckRematchAfterBattleText:
	text "Even after 24 hour"
	line "training, I still"
	cont "can't win!"
	
	para "I wonder if I can"
	line "fit more training"
	cont "into my day…?"
	
	para "WAHAHAHAHA!"
	
	para "Anyway, feel free"
	line "to come back for"
	cont "a rematch!"
	
	para "That counts as"
	line "great training!"
	done
	
Chuck16IntroText:
	text "<PLAYER>!"
	line "You've done it!"
	
	para "You've beaten all"
	line "the Kanto Gym"
	cont "Leaders, too!"
	
	para "You've been doing"
	line "some intense"
	cont "training!"
	
	para "Should we have"
	line "a rematch?"
	done
	
Chuck16AfterBattleText:
	text "WAHAHAHAHA!"
	line "That was an"
	cont "amazing battle!"
	
	para "This is the best"
	line "training I've"
	cont "ever done!"
	
	para "Feel free to"
	line "come back for"
	cont "another round!"
	done

ChuckComeBackTomorrowText:
	text "Come and train"
	line "again tomorrow."
	done

ChuckNextTimeText:
	text "Ahh, no problem."
	line "Come back for"
	cont "another round!"
	done

BlackbeltYoshiSeenText:
	text "My #mon and I"
	line "are bound togeth-"
	cont "er by friendship."

	para "Our bond will"
	line "never be broken!"
	done

BlackbeltYoshiBeatenText:
	text "This isn't real!"
	done

BlackbeltYoshiAfterText:
	text "You seem to have a"
	line "strong bond with"
	cont "your #mon too!"
	done

BlackbeltLaoSeenText:
	text "We martial artists"
	line "fear nothing!"
	done

BlackbeltLaoBeatenText:
	text "That's shocking!"
	done

BlackbeltLaoAfterText:
	text "Fighting #mon"
	line "are afraid of psy-"
	cont "chics…"
	done

BlackbeltNobSeenText:
	text "Words are useless."
	line "Let your fists do"
	cont "the talking!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "I lost! "
	line "I'm speechless!"
	done

BlackbeltLungSeenText:
	text "My raging fists"
	line "will shatter your"
	cont "#mon!"
	done

BlackbeltLungBeatenText:
	text "I got shattered!"
	done

BlackbeltLungAfterText:
	text "My #mon lost…"
	line "My… my pride is"
	cont "shattered…"
	done
	
PoliwrathText:
	text "Poliwrath: Poli!!"
	done

CianwoodGymButtonPressText:
	text "It's a big red"
	line "button."
	
	para "Should probably"
	line "press it!"
	done

CianwoodGymButtonIsPressedText:
	text "The button has"
	line "already been"
	cont "pressed."
	done

CianwoodGymButtonNotActiveText:
	text "The button doesn't"
	line "seem to be active."
	done

WaterfallTrainingText:
	text "They're so into"
	line "their training,"
	cont "they don't seem"
	cont "to notice you."
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, CIANWOOD_CITY, 2
	warp_event  9, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event 12,  3, BGEVENT_READ, CianwoodWaterfallButton1
	bg_event  6,  3, BGEVENT_READ, CianwoodWaterfallButton2
	bg_event  7, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event 10, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  9, 10, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  8, 10, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodGymPoliwrath, -1
	object_event  3, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event 15,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event 11,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltNob, -1
	object_event  5,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
