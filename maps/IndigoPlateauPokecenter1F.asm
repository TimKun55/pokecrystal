	object_const_def
	const INDIGOPLATEAUPOKECENTER1F_NURSE
	const INDIGOPLATEAUPOKECENTER1F_CHANSEY
	const INDIGOPLATEAUPOKECENTER1F_CLERK
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_M
	const INDIGOPLATEAUPOKECENTER1F_RIVAL
	const INDIGOPLATEAUPOKECENTER1F_LYRA
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA
	const INDIGOPLATEAUPOKECENTER1F_TUTOR

IndigoPlateauPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script IndigoPlateauPokecenter1FNoopScene, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, IndigoPlateauPokecenter1FPrepareElite4Callback

IndigoPlateauPokecenter1FNoopScene:
	end

IndigoPlateauPokecenter1FPrepareElite4Callback:
	setmapscene WILLS_ROOM, SCENE_WILLSROOM_LOCK_DOOR
	setmapscene KOGAS_ROOM, SCENE_KOGASROOM_LOCK_DOOR
	setmapscene BRUNOS_ROOM, SCENE_BRUNOSROOM_LOCK_DOOR
	setmapscene KARENS_ROOM, SCENE_KARENSROOM_LOCK_DOOR
	setmapscene LANCES_ROOM, SCENE_LANCESROOM_LOCK_DOOR
	setmapscene HALL_OF_FAME, SCENE_HALLOFFAME_ENTER
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	clearevent EVENT_CHAMPION_ROOM_DRAGONITE
	endcallback

PlateauRivalBattle1:
	moveobject INDIGOPLATEAUPOKECENTER1F_RIVAL, 11, 11
	moveobject INDIGOPLATEAUPOKECENTER1F_LYRA, 11, 11
PlateauRivalBattle2:
	checkevent EVENT_FINAL_BATTLE_WITH_LYRA
	iftrue LyraFight
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MaybeRivalFight
	ifequal TUESDAY, MaybeLyraFight
	ifequal WEDNESDAY, .MaybeRivalFight
	ifequal THURSDAY, MaybeLyraFight
	ifequal FRIDAY, .MaybeRivalFight
	ifequal SATURDAY, MaybeLyraFight
	end

.MaybeRivalFight:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	appear INDIGOPLATEAUPOKECENTER1F_RIVAL
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalApproachesMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceobject INDIGOPLATEAUPOKECENTER1F_RIVAL, PLAYER
	faceobject PLAYER, INDIGOPLATEAUPOKECENTER1F_RIVAL
	opentext
	writetext PlateauRivalText1
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	; Cyndaquil
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump PlateauRivalPostBattle

.Totodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump PlateauRivalPostBattle

.Chikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump PlateauRivalPostBattle

PlateauRivalPostBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PlateauRivalText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_RIVAL, PlateauRivalLeavesMovement
	disappear INDIGOPLATEAUPOKECENTER1F_RIVAL
	setscene SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
PlateauRivalScriptDone:
	end

MaybeLyraFight:
	checkevent EVENT_GRAND_CHAMPION
	iffalse PlateauLyraScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_LYRA_FIGHT
	iftrue PlateauLyraScriptDone
LyraFight:
	appear INDIGOPLATEAUPOKECENTER1F_LYRA
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_LYRA, PlateauRivalApproachesMovement
	faceobject INDIGOPLATEAUPOKECENTER1F_LYRA, PLAYER
	faceobject PLAYER, INDIGOPLATEAUPOKECENTER1F_LYRA
	opentext
	writetext PlateauLyraText1
	waitbutton
	playmusic MUSIC_LYRA_ENCOUNTER
	writetext PlateauLyraText2
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .LyraTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .LyraChikorita
	; Cyndaquil
	winlosstext PlateauLyraWinText, PlateauLyraLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_LYRA
	loadtrainer LYRA2, LYRA2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump LyraPostBattle

.LyraTotodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_LYRA
	loadtrainer LYRA2, LYRA2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump LyraPostBattle

.LyraChikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_LYRA
	loadtrainer LYRA2, LYRA2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
LyraPostBattle:
	playmusic MUSIC_LYRA_DEPARTURE
	opentext
	writetext PlateauLyraText3
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_LYRA, PlateauRivalLeavesMovement
	disappear INDIGOPLATEAUPOKECENTER1F_LYRA
	setscene SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_LYRA_FIGHT
	clearevent EVENT_FINAL_BATTLE_WITH_LYRA
PlateauLyraScriptDone:
	end

IndigoPlateauPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
IndigoPlateauPokecenter1FChansey:
	jumpstd PokecenterChanseyScript

IndigoPlateauPokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

IndigoPlateauPokecenter1FCooltrainerMScript:
	jumptextfaceplayer IndigoPlateauPokecenter1FCooltrainerMText

TeleportGuyScript:
	faceplayer
	opentext
	writetext TeleportGuyText1
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 15, 6
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	refreshscreen
	pokepic ABRA
	waitbutton
	closepokepic
	closetext
	end
	
IndigoPlateauPokecenter1FTutorScript:
	faceplayer
	opentext
	writetext IndigoPlateauPokecenter1FTutorIntroText
	yesorno
	iffalse .TutorRefused
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .payfortutor
	setval GIGA_IMPACT
	writetext IndigoPlateauPokecenter1FGigaImpactClear
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext IndigoPlateauPokecenter1FTutorRefused
	waitbutton
	closetext
	end
	
.payfortutor
	special PlaceMoneyTopRight
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, .NotEnough
	writetext IndigoPlateauPokecenter1FGigaImpactForAPrice
	yesorno
	iffalse .TutorRefused
	setval GIGA_IMPACT
	writetext IndigoPlateauPokecenter1FGigaImpactClear
	special MoveTutor
	ifequal FALSE, .TeachMovePay
	
.TeachMovePay
 	writetext IndigoPlateauPokecenter1FGigaImpactPayment
	takemoney YOUR_MONEY, 25000
 	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
 	sjump .TeachMove
	
.NotEnough:
	writetext IndigoPlateauPokecenter1FGigaImpactNotEnough
	waitbutton
	closetext
	end

.TeachMove
	writetext IndigoPlateauPokecenter1FGigaImpactTaught
	waitbutton
	closetext
	end

PlateauRivalApproachesMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

PlateauRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PokemonJournalGiovanniScript:
	jumptext PokemonJournalGiovanniText

IndigoPlateauPokecenter1FCooltrainerMText:
	text "Are you ready to"
	line "get tested by"
	cont "the Elite Four?"

	para "You have to beat"
	line "them all, one"
	cont "after the other."

	para "If you lose, you"
	line "have to start the"
	cont "challenge over!"
	done

PlateauRivalText1:
	text "Hold it."

	para "You're going to"
	line "take the #mon"

	para "League challenge"
	line "now?"

	para "That's not going"
	line "to happen."

	para "My super-well-"
	line "trained #mon"

	para "are going to pound"
	line "you."

	para "<PLAYER>!"
	line "I challenge you!"
	done

PlateauRivalWinText:
	text "…"

	para "OK--I lost…"
	done

PlateauRivalText2:
	text "…Darn… I still"
	line "can't win…"

	para "I… I have to think"
	line "more about my"
	cont "#mon…"

	para "Humph! Try not to"
	line "lose!"
	done

PlateauRivalLoseText:
	text "…"

	para "Whew…"
	line "With my partners,"

	para "I'm going to be"
	line "the Champion!"
	done

PlateauLyraText1:
	text "<PLAYER>!"

	para "I've been travel-"
	line "ing around Johto,"

	para "earning badges and"
	line "gaining strength."

	para "You know what"
	line "that's like,"
	cont "<PLAYER>."

	para "And now…"

	para "Here I am, at the"
	line "Indigo Plateau."

	para "Do you know what"
	line "this means?"

	para "I get to challenge"
	line "you, not only as"
	cont "my friend, but"
	done

PlateauLyraText2:
	text "as the #mon"
	line "League Champion!"
	done

PlateauLyraWinText:
	text "So you're still"
	line "stronger than me…"
	done

PlateauLyraLoseText:
	text "…I won?"
	done

PlateauLyraText3:
	text "I'm not angry that"
	line "I lost."

	para "I got to explore"
	line "Johto, meet new"
	cont "people, raise my"

	para "#mon to be"
	line "stronger than I"

	para "thought they could"
	line "ever be…"

	para "And I got to"
	line "battle you at my"
	cont "very best."

	para "You beat me--now"
	line "go beat the #-"
	cont "mon League!"
	done

TeleportGuyText1:
	text "Ah! Are you"
	line "challenging the"
	cont "Elite Four?"

	para "Are you sure"
	line "you're ready?"

	para "If you need to"
	line "train more, my"
	cont "Abra can help you."

	para "It can Teleport"
	line "you home."

	para "Would you like to"
	line "go home now?"
	done

TeleportGuyYesText:
	text "OK, OK. Picture"
	line "your house in your"
	cont "mind…"
	done

TeleportGuyNoText:
	text "OK, OK. The best"
	line "of luck to you!"
	done

AbraText:
	text "Abra: Aabraa…"
	done
	
IndigoPlateauPokecenter1FTutorIntroText:
	text "If you've made it"
	line "here, that must"
	cont "mean you're aiming"
	cont "to be the best!"
	
	para "How about I teach"
	line "your #mon a"
	cont "super-strong move:"
	
	para "Giga Impact!"
	done
	
IndigoPlateauPokecenter1FGigaImpactClear:
	text_start
	done
	
IndigoPlateauPokecenter1FGigaImpactForAPrice:
	text "It'll cost you"
	line "¥25,000."
	
	para "Should I?"
	done
	
IndigoPlateauPokecenter1FGigaImpactPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥25,000."
	done
	
IndigoPlateauPokecenter1FGigaImpactNotEnough:
	text "Sorry kid, you"
	line "don't have enough."
	done
	
IndigoPlateauPokecenter1FGigaImpactTaught:
	text "It's perfect for"
	line "a #mon with"
	cont "high Attack!"
	
	para "Just watch out for"
	line "the recharge turn."
	done
	
IndigoPlateauPokecenter1FTutorRefused:
	text "But I thought you"
	line "wanted to be the"
	cont "best?"
	done
	
PokemonJournalGiovanniText:
	text "#mon Journal"

	para "Special Feature:"
	line "Boss Giovanni!"

	para "When police sear-"
	line "ched the abandoned"
	cont "Viridian Gym, they"

	para "discovered that"
	line "its Leader,"
	cont "Giovanni, had"

	para "also been the"
	line "Team Rocket Boss."
	done

IndigoPlateauPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, INDIGO_PLATEAU, 1
	warp_event 11, 17, INDIGO_PLATEAU, 2
	warp_event  0, 17, POKECENTER_2F, 1
	warp_event 10,  0, WILLS_ROOM, 1
	warp_event 11,  0, WILLS_ROOM, 2

	def_coord_events
	coord_event 10,  6, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE, PlateauRivalBattle1
	coord_event 11,  6, SCENE_INDIGOPLATEAUPOKECENTER1F_RIVAL_BATTLE, PlateauRivalBattle2

	def_bg_events

	def_object_events
	object_event  5, 13, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FNurseScript, -1
	object_event  6, 13, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FChansey, -1
	object_event 17, 13, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FClerkScript, -1
	object_event 15, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FCooltrainerMScript, -1
	object_event 10, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	object_event 10, 11, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_LYRA
	object_event  3, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event  2, 15, SPRITE_ABRA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
	object_event 19, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FTutorScript, -1
