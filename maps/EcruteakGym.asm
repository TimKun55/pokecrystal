	object_const_def
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_GENGAR
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_HEX_MANIAC1
	const ECRUTEAKGYM_HEX_MANIAC2
	const ECRUTEAKGYM_GYM_GUIDE
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_script EcruteakGymNoopScene,          SCENE_ECRUTEAKGYM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, EcruteakGymLanternsCallback

EcruteakGymForcedToLeaveScene:
	sdefer EcruteakGymClosed
EcruteakGymNoopScene:	
	end

EcruteakGymLanternsCallback:
	checkevent EVENT_BEAT_MORTY
	iftrue .AllLanternsOn
	checkevent EVENT_BEAT_HEX_MANIAC_MARTHA
	iftrue .MarthaLanternOff
	checkevent EVENT_BEAT_SAGE_JEFFREY
	iftrue .JeffreyLanternOff
	checkevent EVENT_BEAT_HEX_MANIAC_GRACE
	iftrue .GraceLanternOff
	checkevent EVENT_BEAT_SAGE_PING
	iftrue .PingLanternOff
.AllLanternsOn
	endcallback

.MarthaLanternOff:
	changeblock  4, 12, $a4 ; floor, wall, floor, floor (lantern out)
	changeblock  2, 10, $b0 ; pit, floor, pit, floor (darkness creep)
	changeblock  2, 12, $b1 ; pit, floor, pit, floor
	changeblock  6, 12, $b2 ; pit, pit, floor, pit
	changeblock  2, 14, $9c ; x4 pit
	changeblock  4, 14, $9d ; floor, pit, floor, pit
	changeblock  6, 14, $9d ; floor, pit, floor, pit
	changeblock  4, 16, $a7 ; x3 floor, pit
	changeblock  6, 16, $a1 ; floor, x3 pit
	changeblock  4, 18, $ac ; pit, floor, pit, floor (darkness creep)
	endcallback

.JeffreyLanternOff:
	changeblock  4, 18, $a5 ; floor, pit, floor, pit (darkness creep)
	changeblock  4, 20, $a4 ; floor, wall, floor, floor (lantern)
	changeblock  2, 22, $a3 ; x2 floor, x2 pit
	changeblock  4, 22, $9e ; x4 floor
	changeblock  6, 22, $a7 ; x3 floor, pit
	changeblock  4, 24, $9c ; x4 pit
	changeblock  6, 24, $9c ; x4 pit
	changeblock  8, 22, $af ; x2 floor, x2 pit
	endcallback

.GraceLanternOff:
	changeblock 10, 24, $a0 ; wall, floor, pit, floor (lantern)
	changeblock 10, 26, $9f ; pit, floor, pit, floor (darkness creep)
	changeblock 12, 24, $a1 ; floor, x3 pit
	changeblock 10, 22, $a2 ; floor, floor, pit, floor
	changeblock 12, 22, $9d ; floor, pit, floor, pit
	changeblock  8, 22, $ae ; x2 floor, x2 pit (darkness creep)
	endcallback

.PingLanternOff:
	changeblock 10, 28, $9e ; x4 floor (lantern)
	changeblock  8, 28, $9e ; x4 floor
	changeblock  8, 30, $9d ; floor, pit, floor, pit
	changeblock  8, 32, $ac ; floor, pit, floor, pit (darkness creep)
	changeblock 10, 30, $9c ; x4 pit
	changeblock 10, 26, $ad ; pit, floor, pit, floor
	endcallback

EcruteakGymMortyScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal 16, .MortyScript_16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .MortyScript_Rematch
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	changeblock  4, 12, $96 ; floor, wall, floor, floor (lantern on)
	changeblock  2, 10, $8b ; pit, floor, pit, floor (darkness creep)
	changeblock  2, 12, $8b ; pit, floor, pit, floor
	changeblock  6, 12, $95 ; pit, pit, floor, pit
	changeblock  2, 14, $38 ; x4 pit
	changeblock  4, 14, $8a ; floor, pit, floor, pit
	changeblock  6, 14, $89 ; floor, pit, floor, pit
	changeblock  4, 16, $93 ; x3 floor, pit
	changeblock  6, 16, $94 ; floor, x3 pit
	changeblock  4, 18, $89 ; pit, floor, pit, floor (darkness creep)
	refreshmap
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_HEX_MANIAC_MARTHA
	setevent EVENT_BEAT_HEX_MANIAC_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegiveitem TM_SHADOW_BALL
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetextend MortyText_ShadowBallSpeech

.GotShadowBall:
	writetextend MortyFightDoneText
	
.MortyScript_16Badges
	checkflag ENGINE_DAILY_MORTY_REMATCH
	iftrue .skip_rematch
	writetext Morty16IntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext MortyWinLossRematchText, 0
	loadtrainer MORTY, MORTY3
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_MORTY_REMATCH
	opentext
	writetextend Morty16AfterBattleText

.MortyScript_Rematch
	checkflag ENGINE_DAILY_MORTY_REMATCH
	iftrue .skip_rematch
	writetext MortyRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext MortyWinLossRematchText, 0
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_MORTY_REMATCH
	opentext
	writetextend MortyRematchAfterBattleText

.skip_rematch
	writetextend MortyComeBackTomorrowText

.EndRematch
	writetextend MortyNextTimeText

EcruteakGymGengar:
	opentext
	writetext GengarText
	cry GENGAR
	waitbutton
	refreshscreen
	pokepic GENGAR
	waitbutton
	closepokepic
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 40
	end

TrainerSageJeffrey:
	jumptextfaceplayer SageJeffreyAfterBattleText

SageJeffreyCheck:
	checkevent EVENT_BEAT_SAGE_JEFFREY
	iftrue .End
	playmusic MUSIC_SAGE_ENCOUNTER
	showemote EMOTE_SHOCK, ECRUTEAKGYM_SAGE1, 15
	pause 15
	applymovement ECRUTEAKGYM_SAGE1, JeffreyToPlayerMovement
	opentext
	writetext SageJeffreySeenText
	waitbutton
	closetext
	winlosstext SageJeffreyBeatenText, 0
	loadtrainer SAGE, JEFFREY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SAGE_JEFFREY
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock  4, 20, $aa ; lantern out
	reloadmappart
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock  4, 18, $a5 ; floor, pit, floor, pit (darkness creep)
	changeblock  4, 20, $a4 ; floor, wall, floor, floor (lantern)
	changeblock  2, 22, $a3 ; x2 floor, x2 pit
	changeblock  4, 22, $9e ; x4 floor
	changeblock  6, 22, $a7 ; x3 floor, pit
	changeblock  4, 24, $9c ; x4 pit
	changeblock  6, 24, $9c ; x4 pit
	changeblock  8, 22, $af ; x2 floor, x2 pit (darkness creep)
	; reload Grace's tiles
	changeblock 10, 24, $91 ; wall, floor, pit, floor (lit lantern)
	changeblock 10, 26, $8b ; pit, floor, pit, floor
	changeblock 12, 24, $8c ; floor, x3 pit
	changeblock 10, 22, $8d ; floor, floor, pit, floor
	changeblock 12, 22, $89 ; floor, pit, floor, pit
	reloadmappart
	special FadeInFromBlack
.End
	end

TrainerSagePing:
	jumptextfaceplayer SagePingAfterBattleText

SagePingCheck:
	checkevent EVENT_BEAT_SAGE_PING
	iftrue .End
	playmusic MUSIC_SAGE_ENCOUNTER
	showemote EMOTE_SHOCK, ECRUTEAKGYM_SAGE2, 15
	pause 15
	opentext
	writetext SagePingSeenText
	waitbutton
	closetext
	winlosstext SagePingBeatenText, 0
	loadtrainer SAGE, PING
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SAGE_PING
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock 10, 28, $a8 ; lantern out
	refreshmap
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock 10, 28, $9e ; x4 floor (lantern)
	changeblock  8, 28, $9e ; x4 floor
	changeblock  8, 30, $9d ; floor, pit, floor, pit
	changeblock  8, 32, $ac ; floor, pit, floor, pit (darkness creep)
	changeblock 10, 30, $9c ; x4 pit
	changeblock 10, 26, $ad ; pit, floor, pit, floor
	refreshmap
	special FadeInFromBlack
.End
	end

TrainerHexManiacMartha:
	jumptextfaceplayer HexManiacMarthaAfterBattleText

HexManiacMarthaCheck:
	checkevent EVENT_BEAT_HEX_MANIAC_MARTHA
	iftrue .End
	playmusic MUSIC_SAGE_ENCOUNTER
	showemote EMOTE_SHOCK, ECRUTEAKGYM_HEX_MANIAC1, 15
	pause 15
	applymovement ECRUTEAKGYM_HEX_MANIAC1, MarthaToPlayerMovement
	opentext
	writetext HexManiacMarthaSeenText
	waitbutton
	closetext
	winlosstext HexManiacMarthaBeatenText, 0
	loadtrainer HEX_MANIAC, MARTHA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HEX_MANIAC_MARTHA
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock 10, 24, $a9 ; lantern out
	reloadmappart
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock  4, 12, $a4 ; floor, wall, floor, floor (lantern out)
	changeblock  2, 10, $b0 ; pit, floor, pit, floor (darkness creep)
	changeblock  2, 12, $b1 ; pit, floor, pit, floor
	changeblock  6, 12, $b2 ; pit, pit, floor, pit
	changeblock  2, 14, $9c ; x4 pit
	changeblock  4, 14, $9d ; floor, pit, floor, pit
	changeblock  6, 14, $9d ; floor, pit, floor, pit
	changeblock  4, 16, $a7 ; x3 floor, pit
	changeblock  6, 16, $a1 ; floor, x3 pit
	changeblock  4, 18, $ac ; pit, floor, pit, floor (darkness creep)
	; reload Jeffrey's tiles
	changeblock  4, 20, $92 ; floor, wall, floor, floor (lantern)
	changeblock  2, 22, $8e ; x2 floor, x2 pit
	changeblock  4, 22, $09 ; x4 floor
	changeblock  6, 22, $8f ; x3 floor, pit
	changeblock  4, 24, $37 ; x4 pit
	changeblock  6, 24, $39 ; x4 pit
	changeblock  8, 22, $8e ; x2 floor, x2 pit (darkness creep)
	reloadmappart
	special FadeInFromBlack
.End
	end

TrainerHexManiacGrace:
	jumptextfaceplayer HexManiacGraceAfterBattleText

HexManiacGraceCheck:
	checkevent EVENT_BEAT_HEX_MANIAC_GRACE
	iftrue .End
	playmusic MUSIC_SAGE_ENCOUNTER
	showemote EMOTE_SHOCK, ECRUTEAKGYM_HEX_MANIAC2, 15
	pause 15
	opentext
	writetext HexManiacGraceSeenText
	waitbutton
	closetext
	winlosstext HexManiacGraceBeatenText, 0
	loadtrainer HEX_MANIAC, GRACE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HEX_MANIAC_GRACE
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock 10, 24, $a9 ; lantern
	reloadmappart
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock 10, 24, $a0 ; wall, floor, pit, floor (lantern)
	changeblock 10, 26, $9f ; pit, floor, pit, floor (darkness creep)
	changeblock 12, 24, $a1 ; floor, x3 pit
	changeblock 10, 22, $a2 ; floor, floor, pit, floor
	changeblock 12, 22, $9d ; floor, pit, floor, pit
	changeblock  8, 22, $ae ; x2 floor, x2 pit (darkness creep)
	; reload Ping's tiles
	changeblock 10, 28, $90 ; x4 floor (lit lantern)
	changeblock  8, 28, $09 ; x4 floor
	changeblock  8, 30, $8a ; floor, pit, floor, pit
	changeblock  8, 32, $89 ; floor, pit, floor, pit (darkness creep)
	changeblock 10, 30, $37 ; x4 pit
	reloadmappart
	special FadeInFromBlack
.End
	end

EcruteakGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuideWinScript
	writetextend EcruteakGymGuideText

.EcruteakGymGuideWinScript:
	writetextend EcruteakGymGuideWinText

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	readvar VAR_BADGES
	ifgreater 11, .LyraToo
	jumpstd GymStatue2Script
.LyraToo
	jumpstd GymStatue3Script

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

JeffreyToPlayerMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MarthaToPlayerMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

MortyIntroText:
	text "Good of you to"
	line "have come."

	para "Here in Ecruteak,"
	line "#mon have been"
	cont "revered."

	para "It's said that a"
	line "rainbow-colored"
	cont "#mon will come"
	cont "down to appear"
	cont "before a truly"
	cont "powerful trainer."

	para "I believed that"
	line "tale, so I have"
	cont "secretly trained"
	cont "here all my life."

	para "As a result, I can"
	line "now see what"
	cont "others cannot."

	para "Just a bit more…"

	para "With a little"
	line "more, I could see"
	cont "a future in which"
	cont "I meet the #mon"
	cont "of rainbow colors."

	para "You're going to"
	line "help me reach that"
	cont "level!"
	done

MortyWinLossText:
	text "I'm not good"
	line "enough yet…"

	para "All right. This"
	line "Badge is yours."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> received"
	line "the FogBadge."
	done

MortyText_FogBadgeSpeech:
	text "By having the Fog-"
	line "Badge, #mon up"
	cont "to L50 will obey"
	cont "you."

	para "Also, #mon that"
	line "know Surf will be"
	cont "able to use that"
	cont "move anytime."

	para "I want you to have"
	line "this too."
	done

MortyText_ShadowBallSpeech:
	text "Morty: It's"
	line "Shadow Ball."

	para "It causes damage"
	line "and may reduce"
	cont "the foe's Sp.Def."

	para "Use it if it"
	line "appeals to you."
	done

MortyFightDoneText:
	text "I see…"

	para "Your journey has"
	line "taken you to far-"
	cont "away places."

	para "And you have wit-"
	line "nessed much more"
	cont "than I."

	para "I envy you for"
	line "that…"
	done
	
MortyRematchIntroText:
	text "Hello, <PLAYER>!"
	line "Welcome back."
	
	para "Do you feel like"
	line "having a rematch?"
	done
	
MortyWinLossRematchText:
	text "Still so strong."
	done
	
MortyRematchAfterBattleText:
	text "That was a great"
	line "battle, but just"
	cont "wait, I'm going to"
	cont "get even stronger."
	
	para "Come back for"
	line "a rematch when"
	cont "you've got time."
	done
	
Morty16IntroText:
	text "<PLAYER>."
	line "You've done it."
	
	para "You've defeated"
	line "all of the Kanto"
	cont "Gym Leaders."
	
	para "Which means I"
	line "can go all out"
	cont "against you."
	
	para "Want a rematch?"
	done
	
Morty16AfterBattleText:
	text "Impressive."
	line "I didn't think our"
	cont "potentials are so"
	cont "different."
	
	para "Come back for"
	line "a rematch when"
	cont "you feel like it."
	done

MortyComeBackTomorrowText:
	text "You should come"
	line "back tomorrow for"
	cont "a rematch."
	done
	
MortyNextTimeText:
	text "No problem."
	line "Come back if you'd"
	cont "like a rematch."
	done

SageJeffreySeenText:
	text "I spent the spring"
	line "with my #mon."

	para "Then summer, fall"
	line "and winter…"

	para "Then spring came"
	line "again. We have"
	cont "lived together"
	cont "for a long time."
	done

SageJeffreyBeatenText:
	text "Wins and losses, I"
	line "experienced both."
	done

SageJeffreyAfterBattleText:
	text "Where did #mon"
	line "come from?"
	done

SagePingSeenText:
	text "Can you inflict"
	line "any damage on our"
	cont "#mon?"
	done

SagePingBeatenText:
	text "Ah! Well done!"
	done

SagePingAfterBattleText:
	text "We use only ghost-"
	line "type #mon."

	para "No normal-type"
	line "attack can harm"
	cont "them!"
	done

HexManiacMarthaSeenText:
	text "I shall win!"
	done

HexManiacMarthaBeatenText:
	text "I, I, I lost!"
	done

HexManiacMarthaAfterBattleText:
	text "The one who wants"
	line "to win most--will!"
	done

HexManiacGraceSeenText:
	text "The light wards"
	line "off the darkness."

	para "But what happens"
	line "when light goes"
	cont "out?"
	done

HexManiacGraceBeatenText:
	text "Wha-what?"
	done

HexManiacGraceAfterBattleText:
	text "Look at the path"
	line "carefully before"
	cont "the battles."
	done

EcruteakGymGuideText:
	text "The trainers here"
	line "have secret mo-"
	cont "tives."

	para "If you win, they"
	line "may tell you some"
	cont "deep secrets about"
	cont "Ecruteak."
	done

EcruteakGymGuideWinText:
	text "Whew, <PLAYER>."
	line "You did great!"

	para "I was cowering in"
	line "the corner out of"
	cont "pure terror!"
	done

EcruteakGymClosedText:
	text "Morty, the Gym"
	line "Leader, is absent."

	para "Sorry, but you'll"
	line "have to leave."

	para "Hohohoho."
	done
	
GengarText:
	text "Gengar: Gen!!"
	line "GengarGen!"
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 39, ECRUTEAK_CITY, 8
	warp_event  9, 39, ECRUTEAK_CITY, 8
	warp_event  8, 34, ECRUTEAK_GYM, 4
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  2,  7, ECRUTEAK_GYM, 3
	warp_event  4,  7, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  4,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 11, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  6, 12, ECRUTEAK_GYM, 3
	warp_event  2, 13, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3
	warp_event  3, 14, ECRUTEAK_GYM, 3
	warp_event  5, 14, ECRUTEAK_GYM, 3
	warp_event  7, 14, ECRUTEAK_GYM, 3
	warp_event  3, 15, ECRUTEAK_GYM, 3
	warp_event  5, 15, ECRUTEAK_GYM, 3
	warp_event  7, 15, ECRUTEAK_GYM, 3
	warp_event  3, 16, ECRUTEAK_GYM, 3
	warp_event  7, 16, ECRUTEAK_GYM, 3
	warp_event  3, 17, ECRUTEAK_GYM, 3
	warp_event  5, 17, ECRUTEAK_GYM, 3
	warp_event  6, 17, ECRUTEAK_GYM, 3
	warp_event  3, 18, ECRUTEAK_GYM, 3
	warp_event  5, 18, ECRUTEAK_GYM, 3
	warp_event  3, 19, ECRUTEAK_GYM, 3
	warp_event  5, 19, ECRUTEAK_GYM, 3
	warp_event  3, 20, ECRUTEAK_GYM, 3
	warp_event  5, 20, ECRUTEAK_GYM, 3
	warp_event  2, 21, ECRUTEAK_GYM, 3
	warp_event  3, 21, ECRUTEAK_GYM, 3
	warp_event  6, 21, ECRUTEAK_GYM, 3
	warp_event  7, 21, ECRUTEAK_GYM, 3
	warp_event  8, 21, ECRUTEAK_GYM, 3
	warp_event  9, 21, ECRUTEAK_GYM, 3
	warp_event 10, 21, ECRUTEAK_GYM, 3
	warp_event 11, 21, ECRUTEAK_GYM, 3
	warp_event 12, 21, ECRUTEAK_GYM, 3
	warp_event  1, 22, ECRUTEAK_GYM, 3
	warp_event 13, 22, ECRUTEAK_GYM, 3
	warp_event  2, 23, ECRUTEAK_GYM, 3
	warp_event  3, 23, ECRUTEAK_GYM, 3
	warp_event  7, 23, ECRUTEAK_GYM, 3
	warp_event  8, 23, ECRUTEAK_GYM, 3
	warp_event  9, 23, ECRUTEAK_GYM, 3
	warp_event 10, 23, ECRUTEAK_GYM, 3
	warp_event 13, 23, ECRUTEAK_GYM, 3
	warp_event  4, 24, ECRUTEAK_GYM, 3
	warp_event  5, 24, ECRUTEAK_GYM, 3
	warp_event  6, 24, ECRUTEAK_GYM, 3
	warp_event 13, 24, ECRUTEAK_GYM, 3
	warp_event 10, 25, ECRUTEAK_GYM, 3
	warp_event 12, 25, ECRUTEAK_GYM, 3
	warp_event 10, 26, ECRUTEAK_GYM, 3
	warp_event 12, 26, ECRUTEAK_GYM, 3
	warp_event  8, 27, ECRUTEAK_GYM, 3
	warp_event  9, 27, ECRUTEAK_GYM, 3	
	warp_event 10, 27, ECRUTEAK_GYM, 3
	warp_event 12, 27, ECRUTEAK_GYM, 3
	warp_event  7, 28, ECRUTEAK_GYM, 3
	warp_event 12, 28, ECRUTEAK_GYM, 3
	warp_event  7, 29, ECRUTEAK_GYM, 3
	warp_event 12, 29, ECRUTEAK_GYM, 3
	warp_event  7, 30, ECRUTEAK_GYM, 3
	warp_event  9, 30, ECRUTEAK_GYM, 3
	warp_event 10, 30, ECRUTEAK_GYM, 3
	warp_event 11, 30, ECRUTEAK_GYM, 3
	warp_event  7, 31, ECRUTEAK_GYM, 3
	warp_event  9, 31, ECRUTEAK_GYM, 3
	warp_event  7, 32, ECRUTEAK_GYM, 3
	warp_event  9, 32, ECRUTEAK_GYM, 3
	warp_event  7, 33, ECRUTEAK_GYM, 3
	warp_event  9, 33, ECRUTEAK_GYM, 3

	def_coord_events
	coord_event  8, 29, SCENE_ECRUTEAKGYM_NOOP, SagePingCheck
	coord_event 11, 24, SCENE_ECRUTEAKGYM_NOOP, HexManiacGraceCheck
	coord_event  6, 22, SCENE_ECRUTEAKGYM_NOOP, SageJeffreyCheck
	coord_event  4, 16, SCENE_ECRUTEAKGYM_NOOP, HexManiacMarthaCheck

	def_bg_events
	bg_event  6, 37, BGEVENT_READ, EcruteakGymStatue
	bg_event 11, 37, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  3,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  1, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGengar, -1
	object_event  2, 22, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerSageJeffrey, -1
	object_event  9, 29, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerSagePing, -1
	object_event  4, 12, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHexManiacMartha, -1
	object_event 11, 23, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHexManiacGrace, -1
	object_event 10, 37, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuideScript, -1
	object_event  8, 36, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
