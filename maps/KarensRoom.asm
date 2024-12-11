	object_const_def
	const KARENSROOM_KAREN
	const KARENSROOM_HOUNDOOM

KarensRoom_MapScripts:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_script KarensRoomNoopScene,     SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorsCallback

KarensRoomLockDoorScene:
	sdefer KarensRoomDoorLocksBehindYouScript
	end

KarensRoomNoopScene:
	end

KarensRoomDoorsCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KarensRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenBattle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenAfterBattle
	checkevent EVENT_GRAND_CHAMPION
	iftrue .KarenGrandChampionMatch
	readvar VAR_BADGES
	ifequal 16, .Karen16Badges
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .KarenChampionMatch
	writetext KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenBeatenText, 0
	loadtrainer KAREN, KAREN1
	startbattle
	reloadmapafterbattle
	opentext
	writetext KarenDefeatText
	waitbutton
	closetext
.AfterBattle:
	setevent EVENT_BEAT_ELITE_4_KAREN
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

.KarenChampionMatch:
	writetext KarenChampionMatchBeforeText
	waitbutton
	closetext
	winlosstext KarenChampionMatchBeatenText, 0
	loadtrainer KAREN, KAREN1
	startbattle
	reloadmapafterbattle
	opentext
	writetext KarenChampionMatchDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.Karen16Badges:
	writetext Karen16BadgesBeforeText
	waitbutton
	closetext
	winlosstext Karen16BadgesBeatenText, 0
	loadtrainer KAREN, KAREN2
	startbattle
	reloadmapafterbattle
	opentext
	writetext Karen16BadgesDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

.KarenGrandChampionMatch:
	writetext KarenGrandChampionBeforeText
	waitbutton
	closetext
	winlosstext KarenGrandChampionBeatenText, 0
	loadtrainer KAREN, KAREN2
	startbattle
	reloadmapafterbattle
	opentext
	writetext KarenGrandChampionDefeatText
	waitbutton
	closetext
	sjump .AfterBattle

KarenAfterBattle:
	checkevent EVENT_GRAND_CHAMPION
	iftrue .KarenGrandChampionAfter
	readvar VAR_BADGES
	ifequal 16, .KarenChampionMatchAfter
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .KarenChampionMatchAfter
	writetext KarenDefeatText
	waitbutton
	closetext
	end

.KarenGrandChampionAfter:
	writetext KarenGrandChampionDefeatText
	waitbutton
	closetext
	end

.KarenChampionMatchAfter:
	writetext KarenChampionMatchDefeatText
	waitbutton
	closetext
	end

KarensRoomHoundoom:
	opentext
	writetext HoundoomText
	cry HOUNDOOM
	waitbutton
	refreshscreen
	pokepic HOUNDOOM
	waitbutton
	closepokepic
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenBeforeText:
	text "I am Karen of the"
	line "Elite Four."

	para "You're <PLAYER>?"
	line "How amusing."

	para "I love dark-type"
	line "#mon."

	para "I find their wild,"
	line "tough image to be"

	para "so appealing. And"
	line "they're so strong."

	para "Think you can take"
	line "them? Just try to"
	cont "entertain me."

	para "Let's go."
	done

KarenBeatenText:
	text "Well, aren't you"
	line "good. I like that"
	cont "in a trainer."
	done

KarenDefeatText:
	text "Strong #mon."

	para "Weak #mon."

	para "That is only the"
	line "selfish perception"
	cont "of people."

	para "Truly skilled"
	line "trainers should"

	para "try to win with"
	line "their favorites."

	para "I like your style."
	line "You understand"
	cont "what's important."

	para "Go on--the Cham-"
	line "pion is waiting."
	done

KarenChampionMatchBeforeText:
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "You've made it"
	line "this far again."
	
	para "Let's battle."
	done

KarenChampionMatchBeatenText:
	text "Still strong!"
	done

KarenChampionMatchDefeatText:
	text "You've done well."
	
	para "Go on, he's"
	line "waiting for you."
	done

Karen16BadgesBeforeText:
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "You've collected"
	line "all Kanto Badges?"
	
	para "Very impressive."
	
	para "No need to hold"
	line "back anymore!"
	done

Karen16BadgesBeatenText:
	text "You're raising"
	line "your #mon well."
	done

Karen16BadgesDefeatText:
	text "I can see why"
	line "you were able to"
	
	para "collect all the"
	line "Kanto Badges."
	
	para "Go on, he's"
	line "waiting for you."
	done

KarenGrandChampionBeforeText:
	text "Grand Champion,"
	line "<PLAYER>!"
	
	para "I always look"
	line "forward to our"
	cont "battles."
	
	para "Let's begin!"
	done

KarenGrandChampionBeatenText:
	text "I expect nothing"
	line "less from you!"
	done

KarenGrandChampionDefeatText:
	text "You have become"
	line "a truly skilled"
	cont "trainer."
	
	para "Go on, he's"
	line "waiting for you."
	done
	
HoundoomText:
	text "Houndoom: Grr!!"
	line "Awooo!"
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KarenBattle, -1
	object_event  4,  7, SPRITE_HOUNDOOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarensRoomHoundoom, -1
