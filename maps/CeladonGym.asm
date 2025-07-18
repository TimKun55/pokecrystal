	object_const_def
	const CELADONGYM_ERIKA
	const CELADONGYM_BELLOSSOM
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BEAUTY
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KANTO_LEADERS
	iftrue .ErikaScript_Rematch
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
	readvar VAR_BADGES
	ifequal 9, .FirstBadge
	ifequal 11, .Lyra3Badges
	ifequal 13, .LyrasEgg
	sjump .FightDone
.FirstBadge:
	specialphonecall SPECIALCALL_LYRAFIRSTBADGE
	sjump .FightDone
.Lyra3Badges:
	specialphonecall SPECIALCALL_LYRATHIRDBADGE
	sjump .FightDone
.LyrasEgg:
	specialphonecall SPECIALCALL_LYRASEGG
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end
	
.ErikaScript_Rematch
	checkflag ENGINE_DAILY_ERIKA_REMATCH
	iftrue .skip_rematch
	writetext ErikaRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext ErikaWinLossRematchText, 0
	loadtrainer ERIKA, ERIKA2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_ERIKA_REMATCH
	opentext
	writetext ErikaRematchAfterBattleText
	waitbutton
	closetext
	end

.skip_rematch
	writetext ErikaComeBackTomorrowText
	waitbutton
	closetext
	end

.EndRematch
	writetext ErikaNextTimeText
	waitbutton
	closetext
	end
	
CeladonGymBellossom:
	opentext
	writetext BellossomText
	cry BELLOSSOM
	waitbutton
	refreshscreen
	pokepic BELLOSSOM
	waitbutton
	closepokepic
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

TrainerLassSandy:
	trainer LASS, SANDY, EVENT_BEAT_LASS_SANDY, LassSandySeenText, LassSandyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassSandyAfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd GymStatue2Script

ErikaBeforeBattleText:
	text "Erika: Hello…"
	line "Lovely weather,"

	para "isn't it?"
	line "It's so pleasant…"

	para "…I'm afraid I may"
	line "doze off…"

	para "My name is Erika."
	line "I am the Leader of"
	cont "Celadon Gym."

	para "…Oh? All the way"
	line "from Johto, you"
	cont "say? How nice…"

	para "Oh. I'm sorry, I"
	line "didn't realize"

	para "that you wished to"
	line "challenge me."

	para "Very well, but I"
	line "shall not lose."
	done

ErikaBeatenText:
	text "Erika: Oh!"
	line "I concede defeat…"

	para "You are remarkably"
	line "strong…"

	para "I shall give you"
	line "the RainbowBadge…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> received"
	line "the RainbowBadge."
	done

ErikaExplainTMText:
	text "Erika: That was a"
	line "delightful match."

	para "I felt inspired."
	line "Please, I wish you"
	cont "to have this TM."

	para "It is Giga Drain."

	para "It is a wonderful"
	line "move that drains"

	para "half the damage it"
	line "inflicts to heal"
	cont "your #mon."

	para "Please use it if"
	line "it pleases you…"
	done

ErikaAfterBattleText:
	text "Erika: Losing"
	line "leaves a bitter"
	cont "aftertaste…"

	para "But knowing that"
	line "there are strong"

	para "trainers spurs me"
	line "to do better…"
	done
	
ErikaRematchIntroText:
	text "Oh, <PLAYER>."
	line "So good to see"
	cont "you again."
	
	para "Would you like to"
	line "have a rematch?"
	done
	
ErikaWinLossRematchText:
	text "You have grown"
	line "even stronger!"
	done
	
ErikaRematchAfterBattleText:
	text "You seem to be"
	line "flourishing!"
	
	para "Come back for"
	line "a rematch"
	cont "sometime."
	done

ErikaComeBackTomorrowText:
	text "Oh, I'm tired now"
	line "but come back"
	cont "tomorrow for a"
	cont "rematch, ok?"
	done

ErikaNextTimeText:
	text "Maybe next"
	line "time, then."
	done

LassMichelleSeenText:
	text "Do you think a"
	line "girls-only Gym"
	cont "is rare?"
	done

LassMichelleBeatenText:
	text "Oh, bleah!"
	done

LassMichelleAfterBattleText:
	text "I just got care-"
	line "less, that's all!"
	done

PicnickerTanyaSeenText:
	text "Oh, a battle?"
	line "That's kind of"
	cont "scary, but OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, that's it?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, look at all"
	line "your Badges. No"

	para "wonder I couldn't"
	line "win!"
	done

BeautyJuliaSeenText:
	text "Were you looking"
	line "at these flowers"
	cont "or at me?"
	done

BeautyJuliaBeatenText:
	text "How annoying!"
	done

BeautyJuliaAfterBattleText:
	text "How do I go about"
	line "becoming ladylike"
	cont "like Erika?"
	done

TwinsJoAndZoe1SeenText:
	text "We'll show you"
	line "#mon moves that"
	cont "Erika taught us!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… We lost…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "Erika will get you"
	line "back for us!"
	done

TwinsJoAndZoe2SeenText:
	text "We're going to"
	line "protect Erika!"
	done

TwinsJoAndZoe2BeatenText:
	text "We couldn't win…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "Erika is much,"
	line "much stronger!"
	done

LassSandySeenText:
	text "Don't you just"
	line "love this maze?"
	done

LassSandyBeatenText:
	text "Oh, so rough!"
	done

LassSandyAfterBattleText:
	text "Our gym is pretty"
	line "but it's a lot of"
	cont "work to maintain."
	done

BellossomText:
	text "Bellossom: Som!!"
	line "BellBell!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 27, CELADON_CITY, 10
	warp_event 15, 27, CELADON_CITY, 10

	def_coord_events

	def_bg_events
	bg_event 12, 25, BGEVENT_READ, CeladonGymStatue
	bg_event 17, 25, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event 15,  7, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event 14,  7, SPRITE_BELLOSSOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymBellossom, -1
	object_event 22, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassMichelle, -1
	object_event  5,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerTanya, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  1,  7, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  2,  7, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
	object_event  4, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerLassSandy, -1
