	object_const_def
	const WILLSROOM_WILL
	const WILLSROOM_XATU

WillsRoom_MapScripts:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_script WillsRoomNoopScene,     SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorsCallback

WillsRoomLockDoorScene:
	sdefer WillsRoomDoorLocksBehindYouScript
	end

WillsRoomNoopScene:
	end

WillsRoomDoorsCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $b3 ; open door
.KeepExitClosed:
	endcallback

WillsRoomDoorLocksBehindYouScript:
	applymovement PLAYER, WillsRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillBattle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue WillAfterBattle
	checkevent EVENT_GRAND_CHAMPION
	iftrue .WillGrandChampionMatch
	readvar VAR_BADGES
	ifequal 16, .Will16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .WillChampionMatch
	writetext WillBeforeText
	waitbutton
	closetext
	winlosstext WillBeatenText, 0
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	opentext
	writetext WillDefeatText
	waitbutton
	closetext
.AfterBattle
	setevent EVENT_BEAT_ELITE_4_WILL
	setevent EVENT_WILLS_ROOM_EXIT_OPEN	
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $b3 ; open door
	reloadmappart
	waitsfx
	end

.WillChampionMatch:
	writetext WillChampionMatchBeforeText
	waitbutton
	closetext
	winlosstext WillChampionMatchBeatenText, 0
	loadtrainer WILL, WILL1
	startbattle
	reloadmapafterbattle
	opentext
	writetext WillChampionMatchDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.Will16Badges:
	writetext Will16BadgesBeforeText
	waitbutton
	closetext
	winlosstext Will16BadgesBeatenText, 0
	loadtrainer WILL, WILL2
	startbattle
	reloadmapafterbattle
	opentext
	writetext Will16BadgesDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.WillGrandChampionMatch:
	writetext WillGrandChampionBeforeText
	waitbutton
	closetext
	winlosstext WillGrandChampionBeatenText, 0
	loadtrainer WILL, WILL2
	startbattle
	reloadmapafterbattle
	opentext
	writetext WillGrandChampionDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

WillAfterBattle:
	checkevent EVENT_GRAND_CHAMPION
	iftrue .WillGrandChampionAfter
	readvar VAR_BADGES
	ifequal 16, .WillChampionMatchAfter
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .WillChampionMatchAfter
	writetext WillDefeatText
	waitbutton
	closetext
	end

.WillGrandChampionAfter:
	writetext WillGrandChampionDefeatText
	waitbutton
	closetext
	end

.WillChampionMatchAfter:
	writetext WillChampionMatchDefeatText
	waitbutton
	closetext
	end
	
WillsRoomXatu:
	opentext
	writetext XatuText
	cry XATU
	waitbutton
	refreshscreen
	pokepic XATU
	waitbutton
	closepokepic
	closetext
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

WillBeforeText:
	text "Welcome to #mon"
	line "League, <PLAYER>."

	para "Allow me to intro-"
	line "duce myself. I am"
	cont "Will."

	para "I have trained all"
	line "around the world,"

	para "making my psychic"
	line "#mon powerful."

	para "And, at last, I've"
	line "been accepted into"
	cont "the Elite Four."

	para "I can only keep"
	line "getting better!"

	para "Losing is not an"
	line "option!"
	done

WillBeatenText:
	text "I… I can't…"
	line "believe it…"
	done

WillDefeatText:
	text "Even though I was"
	line "defeated, I won't"
	cont "change my course."

	para "I will continue"
	line "battling until I"

	para "stand above all"
	line "trainers!"

	para "Now, <PLAYER>, move"
	line "on and experience"

	para "the true ferocity"
	line "of the Elite Four."
	done

WillChampionMatchBeforeText:
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "Here for another"
	line "run through?"
	
	para "I'll gladly battle"
	line "you again!"
	done

WillChampionMatchBeatenText:
	text "Another loss!"
	done

WillChampionMatchDefeatText:
	text "My #mon and I"
	line "will keep aiming"
	cont "for the top!"
	done

Will16BadgesBeforeText:
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "Here for another"
	line "run through?"
	
	para "You have all 8"
	line "Kanto Badges, too?"
	
	para "Wow! I guess I'd"
	line "better not hold"
	cont "back anymore!"
	
	para "Let's go!"
	done

Will16BadgesBeatenText:
	text "Yet another loss!"
	done

Will16BadgesDefeatText:
	text "I can see why"
	line "you were able to"
	
	para "collect all the"
	line "Kanto Badges!"
	
	para "Go on and show"
	line "your progress to"
	cont "the others!"
	done

WillGrandChampionBeforeText:
	text "Grand Champion,"
	line "<PLAYER>!"
	
	para "It's an honour to"
	line "battle you again!"
	
	para "Let's go!"
	done

WillGrandChampionBeatenText:
	text "Ahh, another loss!"
	done

WillGrandChampionDefeatText:
	text "You really have"
	line "become one of the"
	cont "best trainers!"
	done
	
XatuText:
	text "Xatu: Xaa!!"
	line "Xatuuu!"
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 5
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WillBattle, -1
	object_event  5,  7, SPRITE_XATU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WillsRoomXatu, -1
