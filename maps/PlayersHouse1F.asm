	object_const_def
	const PLAYERSHOUSE1F_MUM1
	const PLAYERSHOUSE1F_MUM2
	const PLAYERSHOUSE1F_MUM3
	const PLAYERSHOUSE1F_MUM4
	const PLAYERSHOUSE1F_POKEFAN_F
	const PLAYERSHOUSE1F_PIKACHU

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MUM
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMumLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMumRightScript:
	playmusic MUSIC_MUM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MUM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MUM1, MumTurnsTowardPlayerMovement
	sjump MeetMumScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MUM1, MumWalksToPlayerMovement
MeetMumScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MUM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MUM_1
	clearevent EVENT_PLAYERS_HOUSE_MUM_2
	writetext MumGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	writetext InstructionsNextText
	waitbutton
	sjump .FinishPhone

.FinishPhone:
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MUM1, MumTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MUM1, MumWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MUM1, LEFT
	end

MeetMumTalkedScript:
	playmusic MUSIC_MUM
	sjump MeetMumScript

PokegearName:
	db "#gear@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MumScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMumTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MUM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MUM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MUM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMum
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MUM
.BankOfMum:
	setevent EVENT_TALKED_TO_MUM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMum
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end
	
NeighborPikachuScript:
	opentext
	writetext NeighborPikachuText
	cry PIKACHU
	waitbutton
	refreshscreen
	pokepic PIKACHU
	waitbutton
	closepokepic
	closetext
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MumTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MumWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MumTurnsBackMovement:
	turn_head LEFT
	step_end

MumWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>!"
	line "You're awake."

	para "Your friend Lyra"
	line "was just here."

	para "She said that our"
	line "neighbor, Prof."

	para "Elm, was looking"
	line "for you."

	para "Oh! I almost for-"
	line "got! Your #mon"

	para "Gear is back from"
	line "the repair shop."

	para "Here you go!"
	done

MumGivesPokegearText:
	text "#mon Gear, or"
	line "just #gear."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the Phone?"
	done

KnowTheInstructionsText:
	text "That's my kid!"
	line "So tech savvy!"
	done

DontKnowTheInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Turn the #gear"
	line "on and select the"
	cont "Phone icon."
	
	para "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."
	done

InstructionsNextText:
	text "Phones really are"
	line "so convenient."
	done

HurryUpElmIsWaitingText:
	text "Prof.Elm is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

SoWhatWasProfElmsErrandText:
	text "So, what was Prof."
	line "Elm's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming Prof."
	line "Elm's assistant."

	para "She really loves"
	line "#mon!"
	done
	
NeighborPikachuText:
	text "Pikachu: Pika! Pi!"
	done

PlayersHouse1FStoveText:
	text "Mum's specialty!"

	para "Cinnabar Volcano"
	line "Burger!"
	done

PlayersHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mum likes it"
	cont "clean."
	done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "Fresh Water and"
	line "tasty Lemonade!"
	done

PlayersHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  7, NEW_BARK_TOWN, 2
	warp_event  9,  7, NEW_BARK_TOWN, 2
	warp_event 11,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event 10,  4, SCENE_PLAYERSHOUSE1F_MEET_MUM, MeetMumLeftScript
	coord_event 11,  4, SCENE_PLAYERSHOUSE1F_MEET_MUM, MeetMumRightScript

	def_bg_events
	bg_event  3,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  6,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  9,  4, SPRITE_MUM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_1
	object_event  3,  2, SPRITE_MUM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  9,  4, SPRITE_MUM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  1,  2, SPRITE_MUM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	object_event  5,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NeighborPikachuScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
