DEF GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE   EQU 500
DEF GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE EQU 300

	object_const_def
	const GOLDENRODUNDERGROUND_SUPER_NERD1
	const GOLDENRODUNDERGROUND_SUPER_NERD2
	const GOLDENRODUNDERGROUND_SUPER_NERD3
	const GOLDENRODUNDERGROUND_SUPER_NERD4
	const GOLDENRODUNDERGROUND_BEAUTY
	const GOLDENRODUNDERGROUND_POKE_BALL
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_GRANNY

GoldenrodUnderground_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitchesCallback
	callback MAPCALLBACK_TILES, GoldenrodUndergroundCheckBasementKeyCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodUndergroundCheckDayOfWeekCallback

GoldenrodUndergroundResetSwitchesCallback:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

GoldenrodUndergroundCheckBasementKeyCallback:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
; Sunday
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $6b ; Open Shop (Younger Haircut Bro)
	changeblock  8,  6,	$6b ; Open Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.Monday:
	checktime MORN
	iffalse .NotMondayMorning
	changeblock 20, 16, $6b ; Open Shop (Bargain)
	changeblock 14, 16, $60 ; Locked Shop (Haircut Bros)
	changeblock  8,  6,	$60 ; Locked Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.NotMondayMorning:
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $60 ; Locked Shop (Haircut Bros)
	changeblock  8,  6,	$60 ; Locked Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.Tuesday:
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $6c ; Open Shop (Older Haircut Bro)
	changeblock  8,  6,	$60 ; Locked Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.Wednesday:
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $6b ; Open Shop (Younger Haircut Bro)
	changeblock  8,  6,	$60 ; Locked Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.Thursday:
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $6c ; Open Shop (Older Haircut Bro)
	changeblock  8,  6,	$60 ; Locked Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.Friday:
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $6b ; Open Shop (Younger Haircut Bro)
	changeblock  8,  6,	$60 ; Locked Shop (Bitter Herbs)
	sjump .FinishBasementDoorCheck

.Saturday:
	changeblock 20, 16, $60 ; Locked Shop (Bargain)
	changeblock 14, 16, $6c ; Open Shop (Older Haircut Bro)
	changeblock  8,  6,	$6b ; Open Shop (Bitter Herbs)

.FinishBasementDoorCheck
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	endcallback

.LockBasementDoor:
	changeblock 18, 6, $78 ; locked door
	endcallback

GoldenrodUndergroundCheckDayOfWeekCallback:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

; Sunday
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime MORN
	iffalse .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

TrainerSupernerdEric:
	trainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdEricAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTeru:
	trainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTeruAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacIssac:
	trainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacIssacAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDonald:
	trainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDonaldAfterBattleText
	waitbutton
	closetext
	end

BitterMerchantScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .Open
	ifequal SATURDAY, .Open
	sjump GoldenrodUndergroundScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

BargainMerchantScript:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue GoldenrodUndergroundScript_ShopClosed
	readvar VAR_WEEKDAY
	ifequal MONDAY, .CheckMorn
	sjump GoldenrodUndergroundScript_ShopClosed

.CheckMorn:
	checktime MORN
	iffalse GoldenrodUndergroundScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .DoHaircut
	ifequal THURSDAY, .DoHaircut
	ifequal SATURDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText
	promptbutton
	special OlderHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundOlderHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundOlderHaircutBrotherThatsAShameText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundOlderHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .DoHaircut
	ifequal WEDNESDAY, .DoHaircut
	ifequal FRIDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText
	promptbutton
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundYoungerHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext GoldenrodUndergroundTheDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext GoldenrodUndergroundBasementKeyOpenedDoorText
	waitbutton
	closetext
	setevent EVENT_USED_BASEMENT_KEY	
	takeitem BASEMENT_KEY
	changeblock 18, 6, $2e ; unlocked door
	reloadmappart
	end

.Open:
	writetext GoldenrodUndergroundTheDoorIsOpenText
	waitbutton
	closetext
	end

GoldenrodUndergroundScript_ShopClosed:
	writetext GoldenrodUndergroundWeAreNotOpenTodayText
	waitbutton
	closetext
	end

June:
	faceplayer
	opentext
	trade NPC_TRADE_JUNE
	waitbutton
	closetext
	end

GoldenrodUndergroundCoinCase:
	itemball COIN_CASE

GoldenrodUndergroundNoEntrySign:
	jumptext GoldenrodUndergroundNoEntryText

GoldenrodUndergroundHiddenParlyzHeal:
	hiddenitem PARLYZ_HEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARLYZ_HEAL

GoldenrodUndergroundHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION

GoldenrodUndergroundHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE

SupernerdEricSeenText:
	text "I got booted out"
	line "of the Game Cor-"
	cont "ner."

	para "I was trying to"
	line "cheat using my"
	cont "#mon…"
	done

SupernerdEricBeatenText:
	text "…Grumble…"
	done

SupernerdEricAfterBattleText:
	text "I guess I have to"
	line "do things fair and"
	cont "square…"
	done

SupernerdTeruSeenText:
	text "Do you consider"
	line "type alignments in"
	cont "battle?"

	para "If you know your"
	line "type advantages,"

	para "you'll do better"
	line "in battle."
	done

SupernerdTeruBeatenText:
	text "Ow, ow, ow!"
	done

SupernerdTeruAfterBattleText:
	text "I know my #mon"
	line "type alignments."

	para "But I only use one"
	line "type of #mon."
	done

PokemaniacIssacSeenText:
	text "My #mon just"
	line "got a haircut!"

	para "I'll show you how"
	line "strong it is!"
	done

PokemaniacIssacBeatenText:
	text "Aiyeeee!"
	done

PokemaniacIssacAfterBattleText:
	text "Your #mon will"
	line "like you more if"

	para "you give them"
	line "haircuts."
	done

PokemaniacDonaldSeenText:
	text "I think you have"
	line "some rare #mon"
	cont "with you."

	para "Let me see them!"
	done

PokemaniacDonaldBeatenText:
	text "Gaah! I lost!"
	line "That makes me mad!"
	done

PokemaniacDonaldAfterBattleText:
	text "Are you making a"
	line "#dex? Here's a"
	cont "hot tip."

	para "The Hiker on Route"
	line "33, Anthony, is a"
	cont "good guy."

	para "He'll phone you if"
	line "he sees any rare"
	cont "#mon."
	done

GoldenrodUndergroundTheDoorsLockedText:
	text "The door's locked…"
	done

GoldenrodUndergroundTheDoorIsOpenText:
	text "The door is open."
	done

GoldenrodUndergroundBasementKeyOpenedDoorText:
	text "The Basement Key"
	line "opened the door."
	
	para "The Key got stuck"
	line "in the lock."
	done

GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText:
	text "Welcome!"

	para "I run the #mon"
	line "Salon!"

	para "I'm the older and"
	line "better of the two"
	cont "Haircut Brothers."

	para "I can make your"
	line "#mon beautiful"
	cont "for just ¥500."

	para "Would you like me"
	line "to do that?"
	done

GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText:
	text "Which #mon"
	line "should I work on?"
	done

GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText:
	text "OK! Watch it"
	line "become beautiful!"
	done

GoldenrodUndergroundOlderHaircutBrotherAllDoneText:
	text "There! All done!"
	done

GoldenrodUndergroundOlderHaircutBrotherThatsAShameText:
	text "Is that right?"
	line "That's a shame!"
	done

GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText:
	text "You'll need more"
	line "money than that."
	done

GoldenrodUndergroundOlderHaircutBrotherOneHaircutADayText:
	text "I do only one"
	line "haircut a day. I'm"
	cont "done for today."
	done

GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText:
	text "Welcome to the"
	line "#mon Salon!"

	para "I'm the younger"
	line "and less expen-"
	cont "sive of the two"
	cont "Haircut Brothers."

	para "I'll spiff up your"
	line "#mon for just"
	cont "¥300."

	para "So? How about it?"
	done

GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText:
	text "OK, which #mon"
	line "should I do?"
	done

GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText:
	text "OK! I'll make it"
	line "look cool!"
	done

GoldenrodUndergroundYoungerHaircutBrotherAllDoneText:
	text "There we go!"
	line "All done!"
	done

GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText:
	text "No? "
	line "How disappointing!"
	done

GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText:
	text "You're a little"
	line "short on funds."
	done

GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText:
	text "I can do only one"
	line "haircut a day."

	para "Sorry, but I'm all"
	line "done for today."
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text " looks a"
	line "little happier."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text " looks"
	line "happy."
	done

HaircutBrosText_MuchHappier:
	text_ram wStringBuffer3
	text " looks"
	line "delighted!"
	done

GoldenrodUndergroundWeAreNotOpenTodayText:
	text "We're not open"
	line "today."
	done

GoldenrodUndergroundNoEntryText:
	text "NO ENTRY BEYOND"
	line "THIS POINT"
	done

GoldenrodUnderground_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 7
	warp_event  3, 33, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 4
	warp_event 26, 27, GOLDENROD_UNDERGROUND, 4
	warp_event 29,  7, GOLDENROD_UNDERGROUND, 3
	warp_event 30,  7, GOLDENROD_UNDERGROUND, 3
	warp_event 30,  3, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 1
	warp_event  8, 27, GOLDENROD_HOME_DECO_STORE_1, 1
	warp_event  9, 27, GOLDENROD_HOME_DECO_STORE_1, 2
	warp_event 14, 27, GOLDENROD_HOME_DECO_STORE_2, 1
	warp_event 15, 27, GOLDENROD_HOME_DECO_STORE_2, 2
	warp_event  8, 17, GOLDENROD_HOME_DECO_STORE_3, 1 
	warp_event  9, 17, GOLDENROD_HOME_DECO_STORE_3, 2
	warp_event 14,  7, GOLDENROD_HOME_DECO_STORE_4, 1
	warp_event 15,  7, GOLDENROD_HOME_DECO_STORE_4, 2

	def_coord_events

	def_bg_events
	bg_event 26, 27, BGEVENT_READ, BasementDoorScript
	bg_event 27, 27, BGEVENT_READ, GoldenrodUndergroundNoEntrySign
	bg_event  3, 13, BGEVENT_ITEM, GoldenrodUndergroundHiddenParlyzHeal
	bg_event 18, 18, BGEVENT_ITEM, GoldenrodUndergroundHiddenSuperPotion
	bg_event 17,  8, BGEVENT_ITEM, GoldenrodUndergroundHiddenAntidote

	def_object_events
	object_event  5, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdEric, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdTeru, -1
	object_event  3, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacIssac, -1
	object_event  1,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDonald, -1
	object_event  1, 20, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, June, -1
	object_event  1, 24, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundCoinCase, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	object_event 21, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event 14, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event 15, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  9,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
