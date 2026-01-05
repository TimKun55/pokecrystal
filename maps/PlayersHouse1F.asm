	object_const_def
	const PLAYERSHOUSE1F_MUM1
	const PLAYERSHOUSE1F_MUM2
	const PLAYERSHOUSE1F_MUM3
	const PLAYERSHOUSE1F_MUM4
	const PLAYERSHOUSE1F_MUM5
	const PLAYERSHOUSE1F_POKEFAN_F
	const PLAYERSHOUSE1F_SILVER_TROPHY
	const PLAYERSHOUSE1F_GOLD_TROPHY
	const PLAYERSHOUSE1F_CRYSTAL_TROPHY

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FMeetMumScene, SCENE_PLAYERSHOUSE1F_MEET_MUM
	scene_script PlayersHouse1FNoopScene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FMeetMumScene:
	sdefer PlayersHouse1FMumIntro
PlayersHouse1FNoopScene:
	end

PlayersHouse1FMumIntro:
	applymovement PLAYER, PlayerStepsDownMovement
	playmusic MUSIC_MUM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MUM1, 15
	turnobject PLAYERSHOUSE1F_MUM1, UP
	opentext
	writetext PlayerFinallyAwakeText
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalksTowardMumMovement
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
	promptbutton
	writetext RunningShoesText
	waitbutton
	closetext
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MUM1, LEFT
	end

PokegearName:
	db "#gear@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MumScript:
	faceplayer
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MUM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MUM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMum
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetextend HurryUpElmIsWaitingText

.GotAPokemon:
	writetextend SoWhatWasProfElmsErrandText

.FirstTimeBanking:
	writetextend ImBehindYouText

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
	checktime EVE | NITE
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
	
SilverTrophyScript:
	jumptext SilverTrophyText

GoldTrophyScript:
	jumptext GoldTrophyText

CrystalTrophyScript:
	jumptext CrystalTrophyText

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

PlayerStepsDownMovement:
	step DOWN
	step_end

PlayerWalksTowardMumMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PlayerFinallyAwakeText:
	text "Mum: Oh, <PLAYER>!"
	line "You're finally"
	cont "awake, dear."
	done

ElmsLookingForYouText:
	text "Your friend Lyra"
	line "was just here."

	para "She said that our"
	line "neighbor, Prof."
	cont "Elm, was looking"
	cont "for you."

	para "Oh! I almost for-"
	line "got! Your #mon"
	cont "Gear is back from"
	cont "the repair shop."

	para "Here you go!"
	done

MumGivesPokegearText:
	text "Mum: #mon Gear,"
	line "or just #gear."

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
	cont "for Daylight"
	cont "Saving Time."
	done

RunningShoesText:
	text "Also, don't forget"
	line "about your new"
	cont "Running Shoes."

	para "Do you remember"
	line "the instructions?"
	
	para "“Press the B but-"
	line "ton while walking"
	cont "to start running.”"

	para "They should put a"
	line "zip in your step!"
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
	cont "becoming Prof."
	cont "Elm's assistant."

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
	cont "sky as two boys"
	cont "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

SilverTrophyText:
	text "A shining"
	line "silver Trophy."
	
	para "Champion:"
	line "<PLAYER>"
	done

GoldTrophyText:
	text "A glittering"
	line "gold Trophy."
	
	para "Grand Champion:"
	line "<PLAYER>"
	done

CrystalTrophyText:
	text "A sparkling"
	line "crystal Trophy."
	
	para "The strongest:"
	line "<PLAYER>"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  7, NEW_BARK_TOWN, 2
	warp_event  9,  7, NEW_BARK_TOWN, 2
	warp_event 11,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  3,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  6,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  9,  4, SPRITE_MUM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_1
	object_event  3,  2, SPRITE_MUM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  9,  4, SPRITE_MUM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  6,  3, SPRITE_MUM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  1,  2, SPRITE_MUM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MumScript, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	object_event  7,  1, SPRITE_TROPHY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverTrophyScript, EVENT_PLAYERS_HOUSE_1F_SILVER_TROPHY
	object_event  9,  1, SPRITE_TROPHY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldTrophyScript, EVENT_PLAYERS_HOUSE_1F_GOLD_TROPHY
	object_event  8,  1, SPRITE_TROPHY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CrystalTrophyScript, EVENT_PLAYERS_HOUSE_1F_CRYSTAL_TROPHY
