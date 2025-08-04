	object_const_def
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_RIVAL
	const NEWBARKTOWN_LYRA
	const NEWBARKTOWN_HOOTHOOT1
	const NEWBARKTOWN_HOOTHOOT2
	const NEWBARKTOWN_PIDGEY1
	const NEWBARKTOWN_PIDGEY2

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script NewBarkTownNoop1Scene, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU
	scene_script NewBarkTownNoop2Scene, SCENE_NEWBARKTOWN_LYRA_FINAL_LEAVE
	scene_script NewBarkTownNoop3Scene, SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlypointCallback

NewBarkTownNoop1Scene:
	end

NewBarkTownNoop2Scene:
	end

NewBarkTownNoop3Scene:
	end

NewBarkTownFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MUM
	endcallback

NewBarkTown_TeacherStopsYouScene1:
	playmusic MUSIC_MUM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement1
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouScene2:
	playmusic MUSIC_MUM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherRunsToYouMovement2
	turnobject PLAYER, UP
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, NewBarkTown_TeacherBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTown_LyraIntroScene:
	appear NEWBARKTOWN_LYRA
	special FadeOutMusic
	applymovement NEWBARKTOWN_LYRA, MovementNewBarkTown_LyraIntro1
	playmusic MUSIC_LYRA_ENCOUNTER
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	applymovement NEWBARKTOWN_LYRA, MovementNewBarkTown_LyraIntro2
	turnobject PLAYER, LEFT
	opentext
	writetext NewBarkTownLyraIntroText
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWN_LYRA
	applymovement PLAYER, MovementNewBarkTown_Player
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear PLAYER
	applymovement NEWBARKTOWN_LYRA, MovementNewBarkTown_LyraIntro3
	playsound SFX_ENTER_DOOR
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	special FadeOutPalettes
	pause 15
	warpfacing UP, ELMS_LAB, 4, 11
	end

NewBarkTown_LyraFinalTrigger1:
	moveobject NEWBARKTOWN_LYRA, 14, 11
	sjump NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger2:
	moveobject NEWBARKTOWN_LYRA, 14, 12
	sjump NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger3:
	moveobject NEWBARKTOWN_LYRA, 14, 13
	sjump NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger4:
	moveobject NEWBARKTOWN_LYRA, 14, 14
NewBarkTown_LyraFinalTrigger:
	appear NEWBARKTOWN_LYRA
	applymovement NEWBARKTOWN_LYRA, NewBarkTownLyraSaysGoodbyeMovement1
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	special FadeOutMusic
	pause 15
	playmusic MUSIC_LYRA_ENCOUNTER
	applymovement NEWBARKTOWN_LYRA, NewBarkTownLyraSaysGoodbyeMovement2
	turnobject PLAYER, LEFT
	opentext
	writetext NewBarkTownLyraGoodbyeText1
	waitbutton
	closetext
	setevent EVENT_LYRA_NEW_BARK_TOWN
	winlosstext NewBarkTownLyraGoodbyeTextWin, NewBarkTownLyraGoodbyeTextLoss
	setlasttalked NEWBARKTOWN_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	loadtrainer LYRA1, LYRA1_4_CHIKORITA
	sjump .AfterBattle

.Totodile:
	loadtrainer LYRA1, LYRA1_4_CYNDAQUIL
	sjump .AfterBattle

.Chikorita:
	loadtrainer LYRA1, LYRA1_4_TOTODILE
.AfterBattle
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE
	opentext
	writetext NewBarkTownLyraGoodbyeText2
	waitbutton
	closetext
	applymovement NEWBARKTOWN_LYRA, NewBarkTownLyraSaysGoodbyeMovement3
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	playmapmusic
	end	

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MUM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMum
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMumYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMumYoureLeaving:
	writetext Text_TellMumIfLeaving
	waitbutton
	closetext
	end

.CallMum:
	writetext Text_CallMumOnGear
	waitbutton
	closetext
	end

NewBarkTownFisherScript:
	jumptextfaceplayer Text_ElmDiscoveredNewMon

NewBarkTownRivalScript:
	opentext
	writetext NewBarkTownRivalText1
	waitbutton
	closetext
	turnobject NEWBARKTOWN_RIVAL, LEFT
	opentext
	writetext NewBarkTownRivalText2
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWN_RIVAL
	applymovement PLAYER, NewBarkTown_RivalPushesYouAwayMovement
	stopfollow
	pause 5
	turnobject NEWBARKTOWN_RIVAL, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, NewBarkTown_RivalShovesYouOutMovement
	applymovement NEWBARKTOWN_RIVAL, NewBarkTown_RivalReturnsToTheShadowsMovement
	end
	
NewBarkTownHoothootScript:
	opentext
	writetext NewBarkTownHoothootText
	cry HOOTHOOT
	waitbutton
	refreshscreen
	pokepic HOOTHOOT
	waitbutton
	closepokepic
	closetext
	end

NewBarkTownPidgeyScript:
	opentext
	writetext NewBarkTownPidgeyText
	cry PIDGEY
	waitbutton
	refreshscreen
	pokepic PIDGEY
	waitbutton
	closepokepic
	closetext
	end

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownLyrasHouseSign:
	jumptext NewBarkTownLyrasHouseSignText

NewBarkTown_TeacherRunsToYouMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

NewBarkTown_TeacherRunsToYouMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

NewBarkTown_TeacherBringsYouBackMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_TeacherBringsYouBackMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_RivalPushesYouAwayMovement:
	turn_head UP
	step DOWN
	step_end

NewBarkTown_RivalShovesYouOutMovement:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

NewBarkTown_RivalReturnsToTheShadowsMovement:
	step RIGHT
	step_end

MovementNewBarkTown_LyraIntro1:
	step RIGHT
	step RIGHT
	step_end

MovementNewBarkTown_LyraIntro2:
	step RIGHT
	step UP
	step UP
	step RIGHT
	step_end

MovementNewBarkTown_Player:
MovementNewBarkTown_LyraIntro3:
	step UP
	step_end

NewBarkTownLyraSaysGoodbyeMovement1:
	step UP
	step UP
	step_end

NewBarkTownLyraSaysGoodbyeMovement2:
	step RIGHT
	step UP
	step UP
	step UP
	step RIGHT
	step_end

NewBarkTownLyraSaysGoodbyeMovement3:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

Text_GearIsImpressive:
	text "Wow, your #gear"
	line "is impressive!"

	para "Did your mum get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#mon!"

	para "Wild #mon"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #mon"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMumIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mum if you"
	cont "are leaving."
	done

Text_CallMumOnGear:
	text "Call your mum on"
	line "your #gear to"

	para "let her know how"
	line "you're doing."
	done

Text_ElmDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "I hear Prof.Elm"
	line "discovered some"
	cont "new #mon."
	done

NewBarkTownRivalText1:
	text "<……>"

	para "So this is the"
	line "famous Elm #mon"
	cont "Lab…"
	done

NewBarkTownRivalText2:
	text "…What are you"
	line "staring at?"
	done

NewBarkTownLyraIntroText:
	text "Lyra: Oh, hello,"
	line "<PLAYER>!"

	para "I came by your"
	line "house earlier,"

	para "but you were"
	line "still sleeping."

	para "You know how I"
	line "assist Prof.Elm"
	cont "sometimes?"

	para "He's starting new"
	line "#mon research"

	para "and would like us"
	line "both to help."

	para "Let's go and see"
	line "what he wants!"
	done

NewBarkTownLyraGoodbyeText1:
	text "Lyra: <PLAYER>!"

	para "I heard that you"
	line "have all the Gym"
	cont "badges in Johto."

	para "…You're really"
	line "something,"
	cont "<PLAYER>."

	para "To think that we"
	line "both started our"

	para "journeys in this"
	line "town…"

	para "I do what I can"
	line "to help the Prof-"
	cont "essor, but I could"

	para "never take on the"
	line "League Champion."

	para "…Before you go…"

	para "How about one"
	line "more battle?"

	para "I want to see the"
	line "kind of trainer"
	cont "you've become!"
	done

NewBarkTownLyraGoodbyeTextWin:
	text "You're as talented"
	line "as I expected!"
	done

NewBarkTownLyraGoodbyeTextLoss:
	text "I hope you didn't"
	line "let me win…"
	done

NewBarkTownLyraGoodbyeText2:
	text "…Thanks, <PLAYER>."

	para "I can tell how"
	line "much work and"

	para "love you put into"
	line "raising your"
	cont "#mon."

	para "…So, this is"
	line "goodbye."

	para "I know you can win"
	line "at the #mon"
	cont "League!"

	para "You're going to be"
	line "a great Champion!"
	done
	
NewBarkTownHoothootText:
	text "Hoothoot: Hoo!!"
	done

NewBarkTownPidgeyText:
	text "Pidgey: Pipipi!"
	done

NewBarkTownSignText:
	text "New Bark Town"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText:
	text "Elm #mon Lab"
	done

NewBarkTownLyrasHouseSignText:
	text "Lyra's House"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 15,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 12, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 10,  2, ELMS_HOUSE, 1
	warp_event 11, 13, LYRAS_HOUSE_1F, 1

	def_coord_events
	coord_event  1,  8, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouScene1
	coord_event  1,  9, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouScene2
	coord_event  6,  4, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_LyraIntroScene
	coord_event 17,  6, SCENE_NEWBARKTOWN_LYRA_FINAL_LEAVE, NewBarkTown_LyraFinalTrigger1
	coord_event 17,  7, SCENE_NEWBARKTOWN_LYRA_FINAL_LEAVE, NewBarkTown_LyraFinalTrigger2
	coord_event 17,  8, SCENE_NEWBARKTOWN_LYRA_FINAL_LEAVE, NewBarkTown_LyraFinalTrigger3
	coord_event 17,  9, SCENE_NEWBARKTOWN_LYRA_FINAL_LEAVE, NewBarkTown_LyraFinalTrigger4

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownSign
	bg_event 13,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownLyrasHouseSign

	def_object_events
	object_event  6,  8, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 12,  9, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
	object_event  3,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRivalScript, EVENT_RIVAL_NEW_BARK_TOWN
	object_event  1,  6, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_NEW_BARK_TOWN
	object_event 16,  2, SPRITE_HOOTHOOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, MORN, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NewBarkTownHoothootScript, EVENT_NEW_BARK_TOD_POKEMON
	object_event 16,  2, SPRITE_HOOTHOOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, NITE, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NewBarkTownHoothootScript, EVENT_NEW_BARK_TOD_POKEMON
	object_event 15,  2, SPRITE_PIDGEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, DAY, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NewBarkTownPidgeyScript, EVENT_NEW_BARK_TOD_POKEMON
	object_event 15,  2, SPRITE_PIDGEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, EVE, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NewBarkTownPidgeyScript, EVENT_NEW_BARK_TOD_POKEMON
