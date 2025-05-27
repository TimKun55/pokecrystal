	object_const_def
	const BRUNOSROOM_BRUNO
	const BRUNOSROOM_HITMONCHAMP

BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_script BrunosRoomNoopScene,     SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorsCallback

BrunosRoomLockDoorScene:
	sdefer BrunosRoomDoorLocksBehindYouScript
	end

BrunosRoomNoopScene:
	end

BrunosRoomDoorsCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $bc ; open door
.KeepExitClosed:
	endcallback

BrunosRoomDoorLocksBehindYouScript:
	applymovement PLAYER, BrunosRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoBattle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoAfterBattle
	checkevent EVENT_GRAND_CHAMPION
	iftrue .BrunoGrandChampionMatch
	readvar VAR_BADGES
	ifequal 16, .Bruno16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BrunoChampionMatch
	writetext BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	opentext
	writetext BrunoDefeatText
	waitbutton
	closetext
.AfterBattle:
	setevent EVENT_BEAT_ELITE_4_BRUNO
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN	
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $bc ; open door
	reloadmappart
	waitsfx
	end

.BrunoChampionMatch:
	writetext BrunoChampionMatchBeforeText
	waitbutton
	closetext
	winlosstext BrunoChampionMatchBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	opentext
	writetext BrunoChampionMatchDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.Bruno16Badges:
	writetext Bruno16BadgesBeforeText
	waitbutton
	closetext
	winlosstext Bruno16BadgesBeatenText, 0
	loadtrainer BRUNO, BRUNO2
	startbattle
	reloadmapafterbattle
	opentext
	writetext Bruno16BadgesDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.BrunoGrandChampionMatch:
	writetext BrunoGrandChampionBeforeText
	waitbutton
	closetext
	winlosstext BrunoGrandChampionBeatenText, 0
	loadtrainer BRUNO, BRUNO2
	startbattle
	reloadmapafterbattle
	opentext
	writetext BrunoGrandChampionDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

BrunoAfterBattle:
	checkevent EVENT_GRAND_CHAMPION
	iftrue .BrunoGrandChampionAfter
	readvar VAR_BADGES
	ifequal 16, .BrunoChampionMatchAfter
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BrunoChampionMatchAfter
	writetext BrunoDefeatText
	waitbutton
	closetext
	end

.BrunoGrandChampionAfter:
	writetext BrunoGrandChampionDefeatText
	waitbutton
	closetext
	end

.BrunoChampionMatchAfter:
	writetext BrunoChampionMatchDefeatText
	waitbutton
	closetext
	end

BrunosRoomMachamp:
	opentext
	writetext MachampText
	cry MACHAMP
	waitbutton
	refreshscreen
	pokepic MACHAMP
	waitbutton
	closepokepic
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoBeforeText:
	text "I am Bruno of the"
	line "Elite Four."

	para "I always train to"
	line "the extreme be-"
	cont "cause I believe in"
	cont "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "Ready, <PLAYER>?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "Hoo hah!"
	done

BrunoBeatenText:
	text "Why? How could we"
	line "lose?"
	done

BrunoDefeatText:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go face your next"
	line "challenge!"
	done

BrunoChampionMatchBeforeText:
	text "You've returned,"
	line "Champion <PLAYER>."
	
	para "Let's battle"
	line "again!"

	para "Hoo hah!"
	done

BrunoChampionMatchBeatenText:
	text "We lost again!"
	done

BrunoChampionMatchDefeatText:
	text "It's clear we need"
	line "more training."
	done

Bruno16BadgesBeforeText:
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "Oh, You have all"
	line "8 Kanto Badges!"
	
	para "I need not hold"
	line "back anymore!"
	
	para "Hoo hah!"
	done

Bruno16BadgesBeatenText:
	text "Another defeat."
	done

Bruno16BadgesDefeatText:
	text "You are quite the"
	line "capable person."
	
	para "It's good to see"
	line "one as young as"
	
	para "you devoted to"
	line "their training."
	
	para "Go on. Show your"
	line "progress to"
	cont "the others."
	done

BrunoGrandChampionBeforeText:
	text "Grand Champion,"
	line "<PLAYER>."
	
	para "Welcome back."
	
	para "We shall have our"
	line "greatest battle."
	
	para "Hoo hah!"
	done

BrunoGrandChampionBeatenText:
	text "Hoo hahahaha!"
	line "You're too good!"
	done

BrunoGrandChampionDefeatText:
	text "I expected nothing"
	line "less from one of"
	cont "the best trainers!"
	done
	
MachampText:
	text "Machamp: Champ!!"
	line "Machampchamp!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoBattle, -1
	object_event  5,  7, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, BrunosRoomMachamp, -1
