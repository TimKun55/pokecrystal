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
	checkevent EVENT_BUTTON_IN_CIANWOOD_GYM
	iftrue .NoWaterfall
	endcallback	

.NoWaterfall
	changeblock 8,  4, $cc
	changeblock 8,  6, $ce
	changeblock 8,  8, $ce
	changeblock 8, 10, $d0
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
	checkevent EVENT_BUTTON_IN_CIANWOOD_GYM
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
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

.ChuckScript_16Badges
	writetext Chuck16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ChuckWinLossRematchText, 0
	loadtrainer CHUCK, CHUCK3
	startbattle
	reloadmapafterbattle
	opentext
	writetext Chuck16AfterBattleText
	waitbutton
	closetext
	end

.ChuckScript_Rematch
	writetext ChuckRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ChuckWinLossRematchText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ChuckRematchAfterBattleText
	waitbutton
	closetext
	end

.EndRematch
	writetext ChuckNextTimeText
	waitbutton
	closetext
	end

.ChuckWaterfallTraining
	writetext WaterfallTrainingText
	waitbutton
	closetext
	end
	
CianwoodGymPoliwrath:
	opentext
	checkevent EVENT_BUTTON_IN_CIANWOOD_GYM
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
	writetext WaterfallTrainingText
	waitbutton
	closetext
	end

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
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodWaterfallButton:
	opentext
	checkevent EVENT_BUTTON_IN_CIANWOOD_GYM
	iftrue .Pushed
	writetext CianwoodGymButtonPressText
	waitbutton
	closetext
	pause 15
	playsound SFX_STRENGTH
	earthquake 50
	changeblock 8,  4, $cc
	changeblock 8,  6, $ce
	changeblock 8,  8, $ce
	changeblock 8, 10, $d0
	reloadmappart
	setevent EVENT_BUTTON_IN_CIANWOOD_GYM
	end

.Pushed
	writetext CianwoodGymButtonIsPressedText
	waitbutton
	closetext
	end

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

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

	para "up to L70 obey,"
	line "even traded ones."

	para "It also lets your"
	line "#mon use Fly"

	para "when you're not in"
	line "a battle."

	para "Here, take this"
	line "too!"
	done

ChuckExplainTMText:
	text "That is Dynamic-"
	line "Punch."

	para "It doesn't always"
	line "hit, but when it"

	para "does, it causes"
	line "confusion!"
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

WaterfallTrainingText:
	text "They're so into"
	line "their training,"
	
	para "they don't seem"
	line "to notice you."
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, CIANWOOD_CITY, 2
	warp_event  9, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  6,  3, BGEVENT_READ, CianwoodWaterfallButton
	bg_event  7, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event 10, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  9, 10, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  8, 10, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodGymPoliwrath, -1
	object_event  3, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event 15,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event 11,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
