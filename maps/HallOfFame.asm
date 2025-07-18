	object_const_def
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	def_scene_scripts
	scene_script HallOfFameEnterScene, SCENE_HALLOFFAME_ENTER
	scene_script HallOfFameNoopScene,  SCENE_HALLOFFAME_NOOP

	def_callbacks

HallOfFameEnterScene:
	sdefer HallOfFameEnterScript
	end

HallOfFameNoopScene:
	end

HallOfFameEnterScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FirstTimeChampion
	readvar VAR_BADGES
	ifequal 16, .GrandChampionHoF
	opentext
	writetext HallOfFame_LanceRegisterText
	waitbutton
	closetext
	sjump .ContinueHoF

.GrandChampionHoF
	opentext
	writetext HallOfFame_LanceGrandChampionText
	waitbutton
	closetext
	clearevent EVENT_PLAYERS_HOUSE_1F_GOLD_TROPHY
	checkevent EVENT_GRAND_CHAMPION
	iftrue .SkipGrandChamp
	setevent EVENT_GRAND_CHAMPION
.SkipGrandChamp:
	sjump .ContinueHoF
	
.FirstTimeChampion
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	clearevent EVENT_PLAYERS_HOUSE_1F_SILVER_TROPHY
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
	setevent EVENT_RIVAL_SPROUT_TOWER
.ContinueHoF
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_HALLOFFAME_NOOP
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	clearevent EVENT_RED_IN_MT_SILVER
	special RespawnOneOffs
	setmapscene SPROUT_TOWER_3F, SCENE_SPROUTTOWER3F_NOOP
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "Lance: It's been a"
	line "long time since I"
	cont "last came here."

	para "This is where we"
	line "honor the League"

	para "Champions for all"
	line "eternity."

	para "Their courageous"
	line "#mon are also"
	cont "inducted."

	para "Here today, we"
	line "witnessed the rise"

	para "of a new League"
	line "Champion--a"

	para "trainer who feels"
	line "compassion for,"

	para "and trust toward,"
	line "all #mon."

	para "A trainer who"
	line "succeeded through"

	para "perseverance and"
	line "determination."

	para "The new League"
	line "Champion who has"

	para "all the makings"
	line "of greatness!"

	para "<PLAY_G>, allow me"
	line "to register you"

	para "and your partners"
	line "as Champions!"
	done

HallOfFame_LanceRegisterText:
	text "As you know,"
	line "this is where we"
	cont "honor the League"

	para "Champions for all"
	line "eternity."

	para "Their courageous"
	line "#mon are also"
	cont "inducted."

	para "<PLAY_G>, allow me"
	line "to register you"

	para "and your partners"
	line "as Champions!"
	done

HallOfFame_LanceGrandChampionText:
	text "Grand Champion"
	line "<PLAYER>."

	para "As you know,"
	line "this is where we"
	cont "honor the League"

	para "Champions for all"
	line "eternity."

	para "Their courageous"
	line "#mon are also"
	cont "inducted."
	
	para "It is with great"
	line "pride that I"
	
	para "register you and"
	line "your partners as"
	cont "Grand Champions!"
	
	para "Congratulations!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
