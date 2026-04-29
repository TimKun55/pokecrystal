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
KarensRoomNoopScene:
	end

KarensRoomDoorsCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 6, 16, $59 ; closed door behind
	changeblock 6, 18, $65 ; warp carpet with door shadow
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 6, 4, $51 ; open door
.KeepExitClosed:
	endcallback

KarensRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 16, $59 ; closed door behind
	changeblock 6, 18, $65 ; warp carpet with door shadow
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
	setevent EVENT_KARENS_ROOM_EXIT_OPEN	
	playsound SFX_ENTER_DOOR
	changeblock 6, 4, $51 ; open door
	reloadmappart
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
	writetextend KarenDefeatText

.KarenGrandChampionAfter:
	writetextend KarenGrandChampionDefeatText

.KarenChampionMatchAfter:
	writetextend KarenChampionMatchDefeatText

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
	ntag "Karen"
	text "I am Karen of the"
	line "Elite Four."

	para "You're <PLAYER>?"
	line "How amusing."

	para "I love dark-type"
	line "#mon."

	para "I find their wild,"
	line "tough image to be"
	cont "so appealing. And"
	cont "they're so strong."

	para "Think you can take"
	line "them? Just try to"
	cont "entertain me."

	para "Let's go."
	done

KarenBeatenText:
	ntag "Karen"
	text "Well, aren't you"
	line "good. I like that"
	cont "in a trainer."
	done

KarenDefeatText:
	ntag "Karen"
	text "Strong #mon."

	para "Weak #mon."

	para "That is only the"
	line "selfish perception"
	cont "of people."

	para "Truly skilled"
	line "trainers should"
	cont "try to win with"
	cont "their favorites."

	para "I like your style."
	line "You understand"
	cont "what's important."

	para "Go on--the Cham-"
	line "pion is waiting."
	done

KarenChampionMatchBeforeText:
	ntag "Karen"
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "You've made it"
	line "this far again."
	
	para "Let's battle."
	done

KarenChampionMatchBeatenText:
	ntag "Karen"
	text "Still strong!"
	done

KarenChampionMatchDefeatText:
	ntag "Karen"
	text "You've done well."
	
	para "Go on, he's"
	line "waiting for you."
	done

Karen16BadgesBeforeText:
	ntag "Karen"
	text "Welcome back,"
	line "Champion <PLAYER>."
	
	para "You've collected"
	line "all Kanto Badges?"
	
	para "Very impressive."
	
	para "No need to hold"
	line "back anymore!"
	done

Karen16BadgesBeatenText:
	ntag "Karen"
	text "You're raising"
	line "your #mon well."
	done

Karen16BadgesDefeatText:
	ntag "Karen"
	text "I can see why"
	line "you were able to"
	cont "collect all the"
	cont "Kanto Badges."
	
	para "Go on, he's"
	line "waiting for you."
	done

KarenGrandChampionBeforeText:
	ntag "Karen"
	text "Grand Champion,"
	line "<PLAYER>!"
	
	para "I always look"
	line "forward to our"
	cont "battles."
	
	para "Let's begin!"
	done

KarenGrandChampionBeatenText:
	ntag "Karen"
	text "I expect nothing"
	line "less from you!"
	done

KarenGrandChampionDefeatText:
	ntag "Karen"
	text "You have become"
	line "a truly skilled"
	cont "trainer."
	
	para "Go on, he's"
	line "waiting for you."
	done
	
HoundoomText:
	ntag "Houndoom"
	text "Grr! Awooo!"
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 19, BRUNOS_ROOM, 3
	warp_event  7, 19, BRUNOS_ROOM, 4
	warp_event  6,  4, LANCES_ROOM, 1
	warp_event  7,  4, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  9, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KarenBattle, -1
	object_event  7,  9, SPRITE_HOUNDOOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarensRoomHoundoom, -1
