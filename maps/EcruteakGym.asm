	object_const_def
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_GENGAR
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_HEX_MANIAC1
	const ECRUTEAKGYM_HEX_MANIAC2
	const ECRUTEAKGYM_GYM_GUIDE
	const ECRUTEAKGYM_GRAMPS
	const ECRUTEAKGYM_ETHAN
	const ECRUTEAKGYM_KRIS

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
	changeblock  6, 14, $90 ; floor, wall, floor, floor (lantern out)
	changeblock  4, 12, $91 ; pit, floor, pit, floor (darkness creep)
	changeblock  4, 14, $92 ; pit, floor, pit, floor
	changeblock  8, 14, $93 ; pit, pit, floor, pit
	changeblock  4, 16, $6b ; x4 pit
	changeblock  6, 16, $83 ; floor, pit, floor, pit
	changeblock  8, 16, $83 ; floor, pit, floor, pit
	changeblock  6, 18, $8e ; x3 floor, pit
	changeblock  8, 18, $88 ; floor, x3 pit
	changeblock  6, 20, $84 ; pit, floor, pit, floor (darkness creep)
	endcallback

.JeffreyLanternOff:
	changeblock  6, 20, $8b ; floor, pit, floor, pit (darkness creep)
	changeblock  6, 22, $8c ; floor, wall, floor, floor (lantern)
	changeblock  4, 24, $8d ; x2 floor, x2 pit
	changeblock  6, 24, $82 ; x4 floor
	changeblock  8, 24, $8e ; x3 floor, pit
	changeblock  6, 26, $6b ; x4 pit
	changeblock  8, 26, $6b ; x4 pit
	changeblock 10, 24, $8f ; x2 floor, x2 pit (darkness creep)
	endcallback

.GraceLanternOff:
	changeblock 12, 26, $86 ; wall, floor, pit, floor (lantern)
	changeblock 12, 28, $87 ; pit, floor, pit, floor (darkness creep)
	changeblock 14, 26, $88 ; floor, x3 pit
	changeblock 12, 24, $89 ; floor, floor, pit, floor
	changeblock 14, 24, $83 ; floor, pit, floor, pit
	changeblock 10, 24, $8a ; x2 floor, x2 pit (darkness creep)
	endcallback

.PingLanternOff:
	changeblock 12, 30, $82 ; x4 floor (lantern)
	changeblock 10, 30, $82 ; x4 floor
	changeblock 10, 32, $82 ; floor, pit, floor, pit
	changeblock 10, 34, $83 ; floor, pit, floor, pit (darkness creep)
	changeblock 12, 32, $6b ; x4 pit
	changeblock 12, 28, $85 ; pit, floor, pit, floor
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
	changeblock  6, 14, $7c ; floor, wall, floor, floor (lantern on)
	changeblock  4, 12, $70 ; pit, floor, pit, floor
	changeblock  4, 14, $70 ; pit, floor, pit, floor
	changeblock  8, 14, $7b ; pit, pit, floor, pit
	changeblock  4, 16, $7a ; x4 pit
	changeblock  6, 16, $6d ; floor, pit, floor, pit
	changeblock  8, 16, $6c ; floor, pit, floor, pit
	changeblock  6, 18, $76 ; x3 floor, pit
	changeblock  8, 18, $72 ; floor, x3 pit
	changeblock  6, 20, $6c ; pit, floor, pit, floor
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
	showemote EMOTE_SHOCK, ECRUTEAKGYM_SAGE1, 30
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
	playmusic MUSIC_GYM
	setevent EVENT_BEAT_SAGE_JEFFREY
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock  6, 22, $80 ; lantern out
	reloadmappart
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock  6, 20, $8b ; floor, pit, floor, pit (darkness creep)
	changeblock  6, 22, $8c ; floor, wall, floor, floor (lantern)
	changeblock  4, 24, $8d ; x2 floor, x2 pit
	changeblock  6, 24, $82 ; x4 floor
	changeblock  8, 24, $8e ; x3 floor, pit
	changeblock  6, 26, $6b ; x4 pit
	changeblock  8, 26, $6b ; x4 pit
	changeblock 10, 24, $8f ; x2 floor, x2 pit (darkness creep)
	; reload Grace's tiles
	changeblock 12, 26, $71 ; wall, floor, pit, floor (lantern)
	changeblock 12, 28, $70 ; pit, floor, pit, floor (darkness creep)
	changeblock 14, 26, $72 ; floor, x3 pit
	changeblock 12, 24, $74 ; floor, floor, pit, floor
	changeblock 14, 24, $8c ; floor, pit, floor, pit
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
	showemote EMOTE_SHOCK, ECRUTEAKGYM_SAGE2, 30
	pause 15
	turnobject PLAYER, RIGHT
	opentext
	writetext SagePingSeenText
	waitbutton
	closetext
	winlosstext SagePingBeatenText, 0
	loadtrainer SAGE, PING
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GYM
	setevent EVENT_BEAT_SAGE_PING
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock 12, 30, $7e ; lantern out
	refreshmap
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock 12, 30, $82 ; x4 floor (lantern)
	changeblock 10, 30, $82 ; x4 floor
	changeblock 10, 32, $82 ; floor, pit, floor, pit
	changeblock 10, 34, $83 ; floor, pit, floor, pit (darkness creep)
	changeblock 12, 32, $6b ; x4 pit
	changeblock 12, 28, $85 ; pit, floor, pit, floor
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
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ShowGirlPlaceholder
	appear ECRUTEAKGYM_ETHAN
	sjump .HidePlayer

.ShowGirlPlaceholder
	appear ECRUTEAKGYM_KRIS
.HidePlayer
	applymovement PLAYER, HideObjectMovement
	applymovement PLAYER, BigStepUpMovement
	showemote EMOTE_SHOCK, ECRUTEAKGYM_HEX_MANIAC1, 30
	pause 15
	applymovement PLAYER, BigStepDownFaceUpMovement
	applymovement PLAYER, ShowObjectMovement
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .HideGirlPlaceholder
	disappear ECRUTEAKGYM_ETHAN
	sjump .HidPlaceholder

.HideGirlPlaceholder
	disappear ECRUTEAKGYM_KRIS
.HidPlaceholder
	applymovement ECRUTEAKGYM_HEX_MANIAC1, MarthaToPlayerMovement
	opentext
	writetext HexManiacMarthaSeenText
	waitbutton
	closetext
	winlosstext HexManiacMarthaBeatenText, 0
	loadtrainer HEX_MANIAC, MARTHA
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GYM
	setevent EVENT_BEAT_HEX_MANIAC_MARTHA
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock 12, 26, $81 ; lantern out
	reloadmappart
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock  6, 14, $90 ; floor, wall, floor, floor (lantern out)
	changeblock  4, 12, $91 ; pit, floor, pit, floor (darkness creep)
	changeblock  4, 14, $92 ; pit, floor, pit, floor
	changeblock  8, 14, $93 ; pit, pit, floor, pit
	changeblock  4, 16, $6b ; x4 pit
	changeblock  6, 16, $83 ; floor, pit, floor, pit
	changeblock  8, 16, $83 ; floor, pit, floor, pit
	changeblock  6, 18, $8e ; x3 floor, pit
	changeblock  8, 18, $88 ; floor, x3 pit
	changeblock  6, 20, $84 ; pit, floor, pit, floor (darkness creep)
	; reload Jeffrey's tiles
	changeblock  6, 22, $7c ; floor, wall, floor, floor (lantern)
	changeblock  4, 24, $75 ; x2 floor, x2 pit
	changeblock  6, 24, $6e ; x4 floor
	changeblock  8, 24, $76 ; x3 floor, pit
	changeblock  6, 26, $77 ; x4 pit
	changeblock  8, 26, $78 ; x4 pit
	changeblock 10, 24, $75 ; x2 floor, x2 pit
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
	showemote EMOTE_SHOCK, ECRUTEAKGYM_HEX_MANIAC2, 30
	pause 15
	opentext
	writetext HexManiacGraceSeenText
	waitbutton
	closetext
	winlosstext HexManiacGraceBeatenText, 0
	loadtrainer HEX_MANIAC, GRACE
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GYM
	setevent EVENT_BEAT_HEX_MANIAC_GRACE
	pause 20
	special FadeOutToWhite
	pause 10
	changeblock 12, 26, $7f ; lantern off
	reloadmappart
	special FadeInFromWhite
	pause 20
	special FadeOutToBlack
	pause 10
	changeblock 12, 26, $86 ; wall, floor, pit, floor (lantern)
	changeblock 12, 28, $87 ; pit, floor, pit, floor (darkness creep)
	changeblock 14, 26, $88 ; floor, x3 pit
	changeblock 12, 24, $89 ; floor, floor, pit, floor
	changeblock 14, 24, $83 ; floor, pit, floor, pit
	changeblock 10, 24, $8a ; x2 floor, x2 pit (darkness creep)
	; reload Ping's tiles
	changeblock 12, 30, $6f ; x4 floor (lantern)
	changeblock 10, 30, $6e ; x4 floor
	changeblock 10, 32, $6d ; floor, pit, floor, pit
	changeblock 10, 34, $6c ; floor, pit, floor, pit (darkness creep)
	changeblock 12, 32, $73 ; x4 pit
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

BigStepUpMovement:
	big_step UP
	step_end

BigStepDownFaceUpMovement:
	big_step DOWN
	turn_head UP
	step_end

ShowObjectMovement:
	show_object
	step_end

HideObjectMovement:
	hide_object
	step_end

MortyIntroText:
	ntag " Morty "
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
	ntag " Morty "
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
	ntag " Morty "
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
	ntag " Morty "
	text "It's Shadow Ball."

	para "It causes damage"
	line "and may reduce"
	cont "the foe's Sp.Def."

	para "Use it if it"
	line "appeals to you."
	done

MortyFightDoneText:
	ntag " Morty "
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
	ntag " Morty "
	text "Hello, <PLAYER>!"
	line "Welcome back."
	
	para "Do you feel like"
	line "having a rematch?"
	done
	
MortyWinLossRematchText:
	ntag " Morty "
	text "Still so strong."
	done
	
MortyRematchAfterBattleText:
	ntag " Morty "
	text "That was a great"
	line "battle, but just"
	cont "wait, I'm going to"
	cont "get even stronger."
	
	para "Come back for"
	line "a rematch when"
	cont "you've got time."
	done
	
Morty16IntroText:
	ntag " Morty "
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
	ntag " Morty "
	text "Impressive."
	line "I didn't think our"
	cont "potentials are so"
	cont "different."
	
	para "Come back for"
	line "a rematch when"
	cont "you feel like it."
	done

MortyComeBackTomorrowText:
	ntag " Morty "
	text "You should come"
	line "back tomorrow for"
	cont "a rematch."
	done
	
MortyNextTimeText:
	ntag " Morty "
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
	ntag " Jeffrey "
	text "Wins and losses, I"
	line "experienced both."
	done

SageJeffreyAfterBattleText:
	ntag " Jeffrey "
	text "Where did #mon"
	line "come from?"
	done

SagePingSeenText:
	text "Can you inflict"
	line "any damage on our"
	cont "#mon?"
	done

SagePingBeatenText:
	ntag " Ping "
	text "Ah! Well done!"
	done

SagePingAfterBattleText:
	ntag " Ping "
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
	ntag " Martha "
	text "I, I, I lost!"
	done

HexManiacMarthaAfterBattleText:
	ntag " Martha "
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
	ntag " Grace "
	text "Wha-what?"
	done

HexManiacGraceAfterBattleText:
	ntag " Grace "
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
	ntag " Gengar "
	text "Gen! GengarGen!"
	done

EcruteakGym_MapEvents:

	def_warp_events
	warp_event 10, 41, ECRUTEAK_CITY, 8
	warp_event 11, 41, ECRUTEAK_CITY, 8
	warp_event 10, 36, ECRUTEAK_GYM, 4
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  4,  9, ECRUTEAK_GYM, 3
	warp_event  6,  9, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  6, 10, ECRUTEAK_GYM, 3
	warp_event  4, 11, ECRUTEAK_GYM, 3
	warp_event  6, 11, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  6, 12, ECRUTEAK_GYM, 3
	warp_event  4, 13, ECRUTEAK_GYM, 3
	warp_event  6, 13, ECRUTEAK_GYM, 3
	warp_event  4, 14, ECRUTEAK_GYM, 3
	warp_event  8, 14, ECRUTEAK_GYM, 3
	warp_event  4, 15, ECRUTEAK_GYM, 3
	warp_event  9, 15, ECRUTEAK_GYM, 3
	warp_event  5, 16, ECRUTEAK_GYM, 3
	warp_event  7, 16, ECRUTEAK_GYM, 3
	warp_event  9, 16, ECRUTEAK_GYM, 3
	warp_event  5, 17, ECRUTEAK_GYM, 3
	warp_event  7, 17, ECRUTEAK_GYM, 3
	warp_event  9, 17, ECRUTEAK_GYM, 3
	warp_event  5, 18, ECRUTEAK_GYM, 3
	warp_event  9, 18, ECRUTEAK_GYM, 3
	warp_event  5, 19, ECRUTEAK_GYM, 3
	warp_event  7, 19, ECRUTEAK_GYM, 3
	warp_event  8, 19, ECRUTEAK_GYM, 3
	warp_event  5, 20, ECRUTEAK_GYM, 3
	warp_event  7, 20, ECRUTEAK_GYM, 3
	warp_event  5, 21, ECRUTEAK_GYM, 3
	warp_event  7, 21, ECRUTEAK_GYM, 3
	warp_event  5, 22, ECRUTEAK_GYM, 3
	warp_event  7, 22, ECRUTEAK_GYM, 3
	warp_event  4, 23, ECRUTEAK_GYM, 3
	warp_event  5, 23, ECRUTEAK_GYM, 3
	warp_event  8, 23, ECRUTEAK_GYM, 3
	warp_event  9, 23, ECRUTEAK_GYM, 3
	warp_event 10, 23, ECRUTEAK_GYM, 3
	warp_event 11, 23, ECRUTEAK_GYM, 3
	warp_event 12, 23, ECRUTEAK_GYM, 3
	warp_event 13, 23, ECRUTEAK_GYM, 3
	warp_event 14, 23, ECRUTEAK_GYM, 3
	warp_event  3, 24, ECRUTEAK_GYM, 3
	warp_event 15, 24, ECRUTEAK_GYM, 3
	warp_event  4, 25, ECRUTEAK_GYM, 3
	warp_event  5, 25, ECRUTEAK_GYM, 3
	warp_event  9, 25, ECRUTEAK_GYM, 3
	warp_event 10, 25, ECRUTEAK_GYM, 3
	warp_event 11, 25, ECRUTEAK_GYM, 3
	warp_event 12, 25, ECRUTEAK_GYM, 3
	warp_event 15, 25, ECRUTEAK_GYM, 3
	warp_event  6, 26, ECRUTEAK_GYM, 3
	warp_event  7, 26, ECRUTEAK_GYM, 3
	warp_event  8, 26, ECRUTEAK_GYM, 3
	warp_event 15, 26, ECRUTEAK_GYM, 3
	warp_event 12, 27, ECRUTEAK_GYM, 3
	warp_event 14, 27, ECRUTEAK_GYM, 3
	warp_event 12, 28, ECRUTEAK_GYM, 3
	warp_event 14, 28, ECRUTEAK_GYM, 3
	warp_event 10, 29, ECRUTEAK_GYM, 3
	warp_event 11, 29, ECRUTEAK_GYM, 3
	warp_event 12, 29, ECRUTEAK_GYM, 3
	warp_event 14, 29, ECRUTEAK_GYM, 3
	warp_event  9, 30, ECRUTEAK_GYM, 3
	warp_event 14, 30, ECRUTEAK_GYM, 3
	warp_event  9, 31, ECRUTEAK_GYM, 3
	warp_event 14, 31, ECRUTEAK_GYM, 3
	warp_event  9, 32, ECRUTEAK_GYM, 3
	warp_event 11, 32, ECRUTEAK_GYM, 3
	warp_event 12, 32, ECRUTEAK_GYM, 3
	warp_event 13, 32, ECRUTEAK_GYM, 3
	warp_event  9, 33, ECRUTEAK_GYM, 3
	warp_event 11, 33, ECRUTEAK_GYM, 3
	warp_event  9, 34, ECRUTEAK_GYM, 3
	warp_event 11, 34, ECRUTEAK_GYM, 3
	warp_event  9, 35, ECRUTEAK_GYM, 3
	warp_event 11, 35, ECRUTEAK_GYM, 3

	def_coord_events
	coord_event 10, 31, SCENE_ECRUTEAKGYM_NOOP, SagePingCheck
	coord_event 13, 26, SCENE_ECRUTEAKGYM_NOOP, HexManiacGraceCheck
	coord_event  8, 24, SCENE_ECRUTEAKGYM_NOOP, SageJeffreyCheck
	coord_event  6, 18, SCENE_ECRUTEAKGYM_NOOP, HexManiacMarthaCheck

	def_bg_events
	bg_event  8, 39, BGEVENT_READ, EcruteakGymStatue
	bg_event 13, 39, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  4,  3, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  5,  3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGengar, -1
	object_event  4, 24, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerSageJeffrey, -1
	object_event 11, 31, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerSagePing, -1
	object_event  6, 14, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHexManiacMartha, -1
	object_event 13, 25, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHexManiacGrace, -1
	object_event 12, 39, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuideScript, -1
	object_event 10, 38, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  6, 18, SPRITE_ETHAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  6, 18, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
