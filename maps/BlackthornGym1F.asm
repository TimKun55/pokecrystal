	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_KINGDRA
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBouldersCallback

BlackthornGym1FBouldersCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 4, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 6, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 8, $ab ; fallen boulder 3
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	opentext
	writetextend ClairText_GoToDragonsDen

.FightDone:
	writetextend ClairText_TooMuchToExpect

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	verbosegiveitem TM_DRAGONBREATH
	iffalse .BagFull
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetextend BlackthornGymClairText_BagFull

.GotTM24:
	readvar VAR_BADGES
	ifequal 16, .ClairScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .ClairScript_Rematch
	writetextend BlackthornGymClairText_League
	
.ClairScript_16Badges
	checkflag ENGINE_DAILY_CLAIR_REMATCH
	iftrue .skip_rematch
	writetext Clair16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ClairWinLossRematchText, 0
	loadtrainer CLAIR, CLAIR3
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_CLAIR_REMATCH
	opentext
	writetextend Clair16AfterBattleText

.ClairScript_Rematch
	checkflag ENGINE_DAILY_CLAIR_REMATCH
	iftrue .skip_rematch
	writetext ClairRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ClairWinLossRematchText, 0
	loadtrainer CLAIR, CLAIR2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_CLAIR_REMATCH
	opentext
	writetextend ClairRematchAfterBattleText

.skip_rematch
	writetextend ClairComeBackTomorrowText

.EndRematch
	writetextend ClairNextTimeText
	
BlackthornGymKingdra:
	opentext
	writetext KingdraText
	cry KINGDRA
	waitbutton
	refreshscreen
	pokepic KINGDRA
	waitbutton
	closepokepic
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainermPaulAfterBattleText

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainermMikeAfterBattleText

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerfLolaAfterBattleText

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetextend BlackthornGymGuideText

.BlackthornGymGuideWinScript:
	jumptext BlackthornGymGuideWinText

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	readvar VAR_BADGES
	ifgreater 15, .LyraToo
	jumpstd GymStatue2Script
.LyraToo
	jumpstd GymStatue3Script

ClairIntroText:
	text "I am Clair."

	para "The world's best"
	line "dragon master."

	para "I can hold my own"
	line "against even the"
	cont "#mon League's"
	cont "Elite Four."

	para "Do you still want"
	line "to take me on?"

	para "…Fine."
	line "Let's do it!"

	para "As a Gym Leader,"
	line "I will use my full"
	cont "power against any"
	cont "opponent!"
	done

ClairWinText:
	text "I lost?"

	para "I don't believe"
	line "it. There must be"
	cont "some mistake…"
	done

ClairText_GoToDragonsDen:
	text "I won't admit"
	line "this."

	para "I may have lost,"
	line "but you're still"
	cont "not ready for the"
	cont "#mon League."

	para "I know. You should"
	line "take the dragon"
	cont "user challenge."

	para "Behind this Gym is"
	line "a place called"
	cont "Dragon's Den."

	para "There is a small"
	line "shrine at its"
	cont "center."
	
	para "Go there."

	para "If you can prove"
	line "that you've lost"
	cont "your lazy ideals,"
	cont "I will recognize"
	cont "you as a trainer"
	cont "worthy of a Gym"
	cont "Badge!"
	done

ClairText_TooMuchToExpect:
	text "What's the matter?"

	para "Is it too much to"
	line "expect of you?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "You've kept me"
	line "waiting!"

	para "Here! Take this!"
	done

BlackthornGymClairText_DescribeTM24:
	text "Clair: That cont-"
	line "ains DragonBreath."

	para "No, it doesn't"
	line "have anything to"
	cont "do with my breath."

	para "If you don't want"
	line "it, you don't have"
	cont "to take it."
	done

BlackthornGymClairText_BagFull:
	text "What is this? You"
	line "don't have room?"
	done

BlackthornGymClairText_League:
	text "What's the matter?"

	para "Aren't you headed"
	line "to the #mon"
	cont "League?"

	para "Don't you know"
	line "where it is?"

	para "From here, go to"
	line "New Bark Town."

	para "Then Surf east."
	line "The route there is"
	cont "very tough."

	para "Don't you dare"
	line "lose at the #-"
	cont "mon League!"

	para "If you do, I'll"
	line "feel even worse"
	cont "about having lost"
	cont "to you!"

	para "Give it every-"
	line "thing you've got."
	done
	
ClairRematchIntroText:
	text "<PLAYER>."
	line "You're here."
	
	para "Shall we have"
	line "a rematch?"
	done
	
ClairWinLossRematchText:
	text "Its over…"
	done
	
ClairRematchAfterBattleText:
	text "You haven't been"
	line "slacking off."
	cont "Good."
	
	para "Come back for"
	line "a rematch"
	cont "sometime."
	done
	
Clair16IntroText:
	text "<PLAYER>."
	line "You've done it."
	
	para "You've done what"
	line "few have been able"
	cont "to do."
	
	para "You've beaten all"
	line "the Kanto and"
	cont "Johto Gym Leaders."
	
	para "I can now use"
	line "my strongest team"
	cont "against you!"
	
	para "Want a rematch?"
	done
	
Clair16AfterBattleText:
	text "Well, that's it."
	line "My #mon and I"
	cont "gave it our all."
	
	para "Well done."
	
	para "Feel free to"
	line "come back for"
	cont "a rematch."
	done

ClairComeBackTomorrowText:
	text "Come back tomorrow"
	line "and we can have"
	cont "another match."
	done

ClairNextTimeText:
	text "I see."
	done

CooltrainermPaulSeenText:
	text "Your first battle"
	line "against dragons?"

	para "I'll show you how"
	line "tough they are!"
	done

CooltrainermPaulBeatenText:
	text "My dragon #mon"
	line "lost?"
	done

CooltrainermPaulAfterBattleText:
	text "Lance told you"
	line "that he'd like to"
	cont "see you again?"
	cont "Not a chance!"
	done

CooltrainermMikeSeenText:
	text "My chance of"
	line "losing? Not even"
	cont "one percent!"
	done

CooltrainermMikeBeatenText:
	text "That's odd."
	done

CooltrainermMikeAfterBattleText:
	text "I know my short-"
	line "comings now."

	para "Thanks for showing"
	line "me!"
	done

CooltrainerfLolaSeenText:
	text "Dragons are sacred"
	line "#mon."

	para "They are full of"
	line "life energy."

	para "If you're not"
	line "serious, you won't"
	cont "be able to beat"
	cont "them."
	done

CooltrainerfLolaBeatenText:
	text "Way to go!"
	done

CooltrainerfLolaAfterBattleText:
	text "Dragons are weak"
	line "against dragon-"
	cont "type moves."
	done

BlackthornGymGuideText:
	text "Yo! Champ in"
	line "making!"

	para "It's been a long"
	line "journey, but we"
	cont "are almost done!"
	cont "Count on me!"

	para "Clair uses the"
	line "mythical and sac-"
	cont "red dragon-type"
	cont "#mon."

	para "You can't damage"
	line "them very easily."

	para "But you know,"
	line "they're supposed"
	cont "to be weak against"
	cont "ice-type moves."
	done

BlackthornGymGuideWinText:
	text "You were great to"
	line "beat Clair!"

	para "All that's left is"
	line "the #mon League"
	cont "challenge."

	para "You're on the way"
	line "to becoming the"
	cont "#mon Champion!"
	done

KingdraText:
	text "Kingdra: Dra!!"
	line "DraKingdra!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, BLACKTHORN_CITY, 1
	warp_event  5, 23, BLACKTHORN_CITY, 1
	warp_event  1,  9, BLACKTHORN_GYM_2F, 1
	warp_event  7, 11, BLACKTHORN_GYM_2F, 2
	warp_event  2,  8, BLACKTHORN_GYM_2F, 3
	warp_event  7,  9, BLACKTHORN_GYM_2F, 4
	warp_event  9,  5, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  2, 21, BGEVENT_READ, BlackthornGymStatue
	bg_event  7, 21, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  2, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  4,  2, SPRITE_KINGDRA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymKingdra, -1
	object_event  6,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  6, 21, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
