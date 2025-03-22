	object_const_def
	const KOGASROOM_KOGA
	const KOGASROOM_CROBAT

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_script KogasRoomNoopScene,     SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomLockDoorScene:
	sdefer KogasRoomDoorLocksBehindYouScript
	end

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KogasRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KogasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaBattle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaAfterBattle
	checkevent EVENT_GRAND_CHAMPION
	iftrue .KogaGrandChampionMatch
	readvar VAR_BADGES
	ifequal 16, .Koga16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .KogaChampionMatch
	writetext KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaBeatenText, 0
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext KogaDefeatText
	waitbutton
	closetext
.AfterBattle:
	setevent EVENT_BEAT_ELITE_4_KOGA
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

.KogaChampionMatch:
	writetext KogaChampionMatchBeforeText
	waitbutton
	closetext
	winlosstext KogaChampionMatchBeatenText, 0
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext KogaChampionMatchDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.Koga16Badges:
	writetext Koga16BadgesBeforeText
	waitbutton
	closetext
	winlosstext Koga16BadgesBeatenText, 0
	loadtrainer KOGA, KOGA2
	startbattle
	reloadmapafterbattle
	opentext
	writetext Koga16BadgesDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.KogaGrandChampionMatch:
	writetext KogaGrandChampionBeforeText
	waitbutton
	closetext
	winlosstext KogaGrandChampionBeatenText, 0
	loadtrainer KOGA, KOGA2
	startbattle
	reloadmapafterbattle
	opentext
	writetext KogaGrandChampionDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

KogaAfterBattle:
	checkevent EVENT_GRAND_CHAMPION
	iftrue .KogaGrandChampionAfter
	readvar VAR_BADGES
	ifequal 16, .KogaChampionMatchAfter
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .KogaChampionMatchAfter
	writetext KogaDefeatText
	waitbutton
	closetext
	end

.KogaGrandChampionAfter:
	writetext KogaGrandChampionDefeatText
	waitbutton
	closetext
	end

.KogaChampionMatchAfter:
	writetext KogaChampionMatchDefeatText
	waitbutton
	closetext
	end
	
KogasRoomCrobat:
	opentext
	writetext CrobatText
	cry CROBAT
	waitbutton
	refreshscreen
	pokepic CROBAT
	waitbutton
	closepokepic
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaBeforeText:
	text "Fwahahahaha!"

	para "I am Koga of the"
	line "Elite Four."

	para "I live in shadows,"
	line "a ninja!"

	para "My intricate style"
	line "will confound and"
	cont "destroy you!"

	para "Confusion, sleep,"
	line "poison…"

	para "Prepare to be the"
	line "victim of my sin-"
	cont "ister technique!"

	para "Fwahahahaha!"

	para "#mon is not"
	line "merely about brute"

	para "force--you shall"
	line "see soon enough!"
	done

KogaBeatenText:
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done

KogaDefeatText:
	text "I subjected you to"
	line "everything I could"
	cont "muster."

	para "But my efforts"
	line "failed. I must"
	cont "hone my skills."

	para "Go on to the next"
	line "room, and put your"
	cont "abilities to test!"
	done

KogaChampionMatchBeforeText:
	text "Champion <PLAYER>,"
	line "welcome back."
	
	para "I welcome another"
	line "battle with you."
	
	para "Let us begin!"
	done

KogaChampionMatchBeatenText:
	text "A disappointing"
	line "but not unexpected"
	cont "outcome."
	done

KogaChampionMatchDefeatText:
	text "I shall continue"
	line "to hone my skills."
	done

Koga16BadgesBeforeText:
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "I welcome another"
	line "battle with you."
	
	para "You have all 8"
	line "Kanto Badges, too?"
	
	para "This means you've"
	line "bested my talented"
	cont "daughter, Janine."

	para "There is no need"
	line "for me to hold"
	cont "back, then."
	
	para "Let us begin!"
	done

Koga16BadgesBeatenText:
	text "Such power."
	done

Koga16BadgesDefeatText:
	text "So this is how"
	line "you defeated my"
	
	para "Janine and the"
	line "others."
	
	para "Most impressive."
	
	para "Go on and show"
	line "your progress to"
	cont "the others."
	done

KogaGrandChampionBeforeText:
	text "Grand Champion,"
	line "<PLAYER>."
	
	para "It's an honour to"
	line "battle you again."
	
	para "Let us begin!"
	done

KogaGrandChampionBeatenText:
	text "Hmm, another loss."
	done

KogaGrandChampionDefeatText:
	text "You truly have"
	line "become one of the"
	cont "best trainers."
	done

CrobatText:
	text "Crobat: Skreee!!"
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 3
	warp_event  5, 17, WILLS_ROOM, 4
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KogaBattle, -1
	object_event  5,  7, SPRITE_CROBAT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, KogasRoomCrobat, -1
