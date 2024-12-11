	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_ALAKAZAM
	const SAFFRONGYM_HEX_MANIAC1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_HEX_MANIAC2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, SaffronGymWarpTileCallback

SaffronGymWarpTileCallback:
	checkevent EVENT_BEAT_SABRINA
	iffalse .NoWarp
	endcallback

.NoWarp
	changeblock 10, 14, $4b ; no direct warp to Sabrina
	endcallback

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KANTO_LEADERS
	iftrue .SabrinaScript_Rematch
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_HEX_MANIAC_REBECCA
	setevent EVENT_BEAT_HEX_MANIAC_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	readvar VAR_BADGES
	ifequal 9, .FirstBadge
	ifequal 11, .Lyra3Badges
	ifequal 13, .LyrasEgg
	sjump .Finish
.FirstBadge:
	specialphonecall SPECIALCALL_LYRAFIRSTBADGE
	sjump .Finish
.Lyra3Badges:
	specialphonecall SPECIALCALL_LYRATHIRDBADGE
	sjump .Finish
.LyrasEgg:
	specialphonecall SPECIALCALL_LYRASEGG
.Finish
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

.SabrinaScript_Rematch
	checkflag ENGINE_DAILY_SABRINA_REMATCH
	iftrue .skip_rematch
	writetext SabrinaRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext SabrinaWinLossRematchText, 0
	loadtrainer SABRINA, SABRINA2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_SABRINA_REMATCH
	opentext
	writetext SabrinaRematchAfterBattleText
	waitbutton
	closetext
	end

.skip_rematch
	writetext SabrinaComeBackTomorrowText
	waitbutton
	closetext
	end

.EndRematch
	writetext SabrinaNextTimeText
	waitbutton
	closetext
	end

SaffronGymAlakazam:
	opentext
	writetext AlakazamText
	cry ALAKAZAM
	waitbutton
	refreshscreen
	pokepic ALAKAZAM
	waitbutton
	closepokepic
	closetext
	end

TrainerHexManiacRebecca:
	trainer HEX_MANIAC, REBECCA, EVENT_BEAT_HEX_MANIAC_REBECCA, HexManiacRebeccaSeenText, HexManiacRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerHexManiacDoris:
	trainer HEX_MANIAC, DORIS, EVENT_BEAT_HEX_MANIAC_DORIS, HexManiacDorisSeenText, HexManiacDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "Sabrina: I knew"
	line "you were coming…"

	para "Three years ago I"
	line "had a vision of"
	cont "your arrival."

	para "You're after my"
	line "Badge."

	para "I don't enjoy bat-"
	line "tling, but it's my"

	para "duty as a Leader"
	line "to confer Badges"

	para "on anyone who has"
	line "proven him- or"
	cont "herself worthy."

	para "Since you wish it,"
	line "I will show you my"
	cont "psychic powers!"
	done

SabrinaWinLossText:
	text "Sabrina: Your"
	line "power…"

	para "It far exceeds"
	line "what I foresaw…"

	para "Maybe it isn't"
	line "possible to fully"

	para "predict what the"
	line "future holds…"

	para "OK, you win. You"
	line "earned yourself"
	cont "the MarshBadge."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> received"
	line "the MarshBadge."
	done

SabrinaMarshBadgeText:
	text "Sabrina: The"
	line "MarshBadge draws"

	para "out your sub-"
	line "liminal powers…"

	para "Although I failed"
	line "to accurately pre-"
	cont "dict your power,"
	cont "this much I know"
	cont "to be true."

	para "You will become a"
	line "celebrated and"
	cont "beloved Champion!"
	done

SabrinaFightDoneText:
	text "Sabrina: Your love"
	line "for your #mon"

	para "overwhelmed my"
	line "psychic power…"

	para "The power of love,"
	line "I think, is also a"

	para "kind of psychic"
	line "power…"
	done

SabrinaRematchIntroText:
	text "<PLAYER>."
	line "I had a feeling"
	cont "you would be back."
	
	para "You're here for"
	line "a rematch, yes?"
	done
	
SabrinaWinLossRematchText:
	text "I see…"
	done
	
SabrinaRematchAfterBattleText:
	text "Your powers are"
	line "growing well."
	
	para "I would like it if"
	line "came back for a"
	cont "rematch sometime."
	done

SabrinaComeBackTomorrowText:
	text "Return tomorrow"
	line "and we may battle"
	cont "once more."
	done

SabrinaNextTimeText:
	text "I see…"
	done

HexManiacRebeccaSeenText:
	text "The power of all"
	line "those you defeated"
	cont "comes to me!"
	done

HexManiacRebeccaBeatenText:
	text "Strong…"
	line "Far too strong…"
	done

HexManiacRebeccaAfterBattleText:
	text "What is the source"
	line "of your power?"
	done

PsychicFranklinSeenText:
	text "Psychic power is"
	line "the power of your"
	cont "soul."
	done

PsychicFranklinBeatenText:
	text "Your soul has more"
	line "power than mine!"
	done

PsychicFranklinAfterBattleText:
	text "You made your soul"
	line "stronger, not just"
	cont "your abilities."
	done

HexManiacDorisSeenText:
	text "Fufufufu…"
	line "I see it clearly."

	para "I can see into"
	line "your soul!"
	done

HexManiacDorisBeatenText:
	text "Though I read you,"
	line "I still lost…"
	done

HexManiacDorisAfterBattleText:
	text "Darn! I forgot"
	line "that I predicted I"
	cont "would lose to you."
	done

PsychicJaredSeenText:
	text "The Fighting Dojo"
	line "next door was once"
	cont "this city's Gym."
	done

PsychicJaredBeatenText:
	text "I was no match…"
	done

PsychicJaredAfterBattleText:
	text "Karate King, the"
	line "master of the"

	para "Fighting Dojo, was"
	line "just destroyed by"
	cont "Sabrina."
	done

SaffronGymGuideText:
	text "Yo, Champ in"
	line "making!"

	para "A trainer as"
	line "skilled as you"

	para "doesn't need to be"
	line "told how to deal"

	para "with psychic-type"
	line "#mon, right?"

	para "I expect great"
	line "things from you!"

	para "Good luck!"
	done

SaffronGymGuideWinText:
	text "That was another"
	line "fantastic battle!"
	done
	
AlakazamText:
	text "Alakazam: Zaam!!"
	line "Kazaa!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 10, 17, SAFFRON_CITY, 2
	warp_event 11, 14, SAFFRON_GYM, 18
	warp_event 19, 14, SAFFRON_GYM, 19
	warp_event 19, 10, SAFFRON_GYM, 20
	warp_event  0, 10, SAFFRON_GYM, 21
	warp_event  4,  2, SAFFRON_GYM, 22
	warp_event 11,  4, SAFFRON_GYM, 23
	warp_event  0, 14, SAFFRON_GYM, 24
	warp_event 19,  2, SAFFRON_GYM, 25
	warp_event 15, 16, SAFFRON_GYM, 26
	warp_event  4, 16, SAFFRON_GYM, 27
	warp_event  4,  8, SAFFRON_GYM, 28
	warp_event  8,  2, SAFFRON_GYM, 29
	warp_event 15,  8, SAFFRON_GYM, 30
	warp_event 15,  4, SAFFRON_GYM, 31
	warp_event  0,  4, SAFFRON_GYM, 32
	warp_event 19, 16, SAFFRON_GYM, 3
	warp_event 19,  8, SAFFRON_GYM, 4
	warp_event  0,  8, SAFFRON_GYM, 5
	warp_event  4,  4, SAFFRON_GYM, 6
	warp_event 11,  2, SAFFRON_GYM, 7
	warp_event  0, 16, SAFFRON_GYM, 8
	warp_event 19,  4, SAFFRON_GYM, 9
	warp_event 15, 14, SAFFRON_GYM, 10
	warp_event  4, 14, SAFFRON_GYM, 11
	warp_event  4, 10, SAFFRON_GYM, 12
	warp_event  8,  4, SAFFRON_GYM, 13
	warp_event 15, 10, SAFFRON_GYM, 14
	warp_event 15,  2, SAFFRON_GYM, 15
	warp_event  0,  2, SAFFRON_GYM, 16
	warp_event 11, 10, SAFFRON_GYM, 17
	warp_event  8, 10, SAFFRON_GYM, 34
	warp_event 11, 15, SAFFRON_GYM, 33

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  7, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 10,  7, SPRITE_ALAKAZAM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronGymAlakazam, -1
	object_event 17, 15, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerHexManiacRebecca, -1
	object_event  2, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  2,  3, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHexManiacDoris, -1
	object_event 17,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
