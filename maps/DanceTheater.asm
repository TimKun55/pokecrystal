	object_const_def
	const DANCETHEATER_KIMONO_GIRL1
	const DANCETHEATER_KIMONO_GIRL2
	const DANCETHEATER_KIMONO_GIRL3
	const DANCETHEATER_KIMONO_GIRL4
	const DANCETHEATER_KIMONO_GIRL5
	const DANCETHEATER_KIMONO_GIRL6
	const DANCETHEATER_GENTLEMAN
	const DANCETHEATER_RHYDON
	const DANCETHEATER_COOLTRAINER_M
	const DANCETHEATER_GRANNY

DanceTheater_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end
	
TrainerKimonoGirlSakura:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .SakuraRematch2
	checkevent EVENT_BEAT_CLAIR
	iftrue .SakuraRematch1
	checkevent EVENT_BEAT_KIMONO_GIRL_SAKURA
	iftrue .FightDone
	writetext KimonoGirlSakuraSeenText
	waitbutton
	closetext
	winlosstext KimonoGirlSakuraBeatenText, 0
	loadtrainer KIMONO_GIRL, SAKURA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_SAKURA
	opentext
.FightDone
	writetext KimonoGirlSakuraAfterBattleText
	waitbutton
	closetext
	end
	
.SakuraRematch1
	writetext SakuraRematchText
	yesorno
	iffalse .KimonoGirlSakuraNextTime
	winlosstext SakuraRematchDefeatText, 0
	loadtrainer KIMONO_GIRL, SAKURA2
	startbattle
	reloadmapafterbattle
	opentext
	writetext KimonoGirlSakuraNextTimeText
	waitbutton
	closetext
	end
	
.SakuraRematch2
	writetext SakuraRematchText
	yesorno
	iffalse .KimonoGirlSakuraNextTime
	winlosstext SakuraRematchDefeatText, 0
	loadtrainer KIMONO_GIRL, SAKURA3
	startbattle
	reloadmapafterbattle
	opentext
	writetext KimonoGirlSakuraNextTimeText
	waitbutton
	closetext
	end

.KimonoGirlSakuraNextTime
	writetext SakuraMaybeNextTimeText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAKURA
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	faceplayer
	opentext
	writetext DanceTheaterRhydonText
	cry RHYDON
	waitbutton
	refreshscreen
	pokepic RHYDON
	waitbutton
	closepokepic
	closetext
	end

DanceTheaterCooltrainerMScript:
	jumptextfaceplayer DanceTheaterCooltrainerMText

DanceTheaterGrannyScript:
	jumptextfaceplayer DanceTheaterGrannyText

DanceTheaterFancyPanel:
	jumptext DanceTheaterFancyPanelText

KimonoGirlNaokoSeenText:
	text "You have lovely"
	line "#mon. May I see"
	cont "them in battle?"
	done

KimonoGirlNaokoBeatenText:
	text "Oh, you are very"
	line "strong."
	done

KimonoGirlNaokoAfterBattleText:
	text "I enjoyed that"
	line "bout. I would like"
	cont "to see you again."
	done

KimonoGirlSayoSeenText:
	text "I always dance"
	line "with my #mon."

	para "Of course, I also"
	line "train them."
	done

KimonoGirlSayoBeatenText:
	text "Oh, so close!"
	line "I almost had you."
	done

KimonoGirlSayoAfterBattleText:
	text "Rhythm is impor-"
	line "tant for both"

	para "dancing and #-"
	line "mon."
	done

KimonoGirlZukiSeenText:
	text "Isn't my barrette"
	line "pretty?"

	para "Oh. A #mon"
	line "battle?"
	done

KimonoGirlZukiBeatenText:
	text "I don't have any"
	line "#mon left…"
	done

KimonoGirlZukiAfterBattleText:
	text "I put a different"
	line "flower in my bar-"
	cont "rette every month."
	done

KimonoGirlKuniSeenText:
	text "Oh, you're a cute"
	line "trainer. Would you"
	cont "like to battle?"
	done

KimonoGirlKuniBeatenText:
	text "You're stronger"
	line "than you look."
	done

KimonoGirlKuniAfterBattleText:
	text "I trained a lot,"
	line "so I thought I was"

	para "a capable trainer."
	line "I guess I'm not."
	done

KimonoGirlMikiSeenText:
	text "Do you like my"
	line "dancing? I'm good"
	cont "at #mon too."
	done

KimonoGirlMikiBeatenText:
	text "Ooh, you're good"
	line "at #mon too."
	done

KimonoGirlMikiAfterBattleText:
	text "I can keep dancing"
	line "because there are"

	para "people who enjoy"
	line "what I do."

	para "My #mon keep my"
	line "spirits up too."
	done
	
KimonoGirlSakuraSeenText:
	text "#mon battles"
	line "and dancing are"
	cont "very similar."
	
	para "They both need"
	line "a huge amount"
	cont "of discipline."
	
	para "Let me show you"
	line "what we can do!"
	done
	
KimonoGirlSakuraBeatenText:
	text "Oh wow, we need"
	line "more discipline."
	done
	
SakuraRematchDefeatText:
	text "Still not enough?"
	done

KimonoGirlSakuraAfterBattleText:
	text "Our dancing and"
	line "training programs"
	cont "are pretty intense"
	cont "and regular."
	done
	
KimonoGirlSakuraNextTimeText:
	text "You should come"
	line "back for a rematch"
	cont "sometime!"
	done
	
SakuraRematchText:
	text "You're back!"
	line "Would you like"
	cont "a rematch?"
	done

SakuraMaybeNextTimeText:
	text "Oh, maybe next"
	line "time, then."
	done

SurfGuyNeverLeftAScratchText:
	text "Not only are the"
	line "Kimono Girls great"

	para "dancers, they're"
	line "also skilled at"
	cont "#mon."

	para "I always challenge"
	line "them, but I've"

	para "never even left a"
	line "scratch…"
	done

SurfGuyLadGiftText:
	text "Lad! If you can"
	line "defeat all the"

	para "Kimono Girls, I'll"
	line "give you a gift."
	done

SurfGuyLassieGiftText:
	text "Lassie, if you can"
	line "defeat all the"

	para "Kimono Girls, I'll"
	line "give you a gift."
	done

SurfGuyLikeADanceText:
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"

	para "I want you to have"
	line "this. Don't worry"
	cont "--take it!"
	done

SurfGuySurfExplanationText:
	text "That's Surf."

	para "It's a move that"
	line "lets #mon swim"
	cont "across water."
	done

SurfGuyElegantKimonoGirlsText:
	text "I wish my #mon"
	line "were as elegant as"
	cont "the Kimono Girls…"
	done

DanceTheaterRhydonText:
	text "Rhydon: Gugooh"
	line "gugogooh!"
	done

DanceTheaterCooltrainerMText:
	text "That man's always"
	line "with his Rhydon."

	para "Says he wants a"
	line "#mon that can"
	cont "Surf and dance."

	para "Is he trying to"
	line "make a synchro-"
	cont "nized swimming"
	cont "#mon?"
	done

DanceTheaterGrannyText:
	text "The Kimono Girls"
	line "are so beautiful…"

	para "But they have to"
	line "go through rigor-"
	cont "ous training."

	para "And they have to"
	line "learn to follow"

	para "customs before ap-"
	line "pearing in public."

	para "But if you love"
	line "something, any-"
	cont "thing is possible."
	done

DanceTheaterFancyPanelText:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

DanceTheater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 6
	warp_event  6, 13, ECRUTEAK_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheaterFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheaterFancyPanel

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  7,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  4,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerKimonoGirlSakura, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON_WALKING, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheaterCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterGrannyScript, -1
