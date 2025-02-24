	object_const_def
	const ICEPATH1F_LANCE
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3

IcePath1F_MapScripts:
	def_scene_scripts
	scene_script IcePath1FNoop1Scene, SCENE_ICEPATH1F_LANCE
	scene_script IcePath1FNoop2Scene, SCENE_ICEPATH1F_NOOP

	def_callbacks

IcePath1FNoop1Scene:
	end

IcePath1FNoop2Scene:
	end

IcePath1FLanceTop:
	moveobject ICEPATH1F_LANCE, 7, 16
	sjump IcePath1FLanceBottom.Continue

IcePath1FLanceBottom:
	moveobject ICEPATH1F_LANCE, 7, 17
.Continue
	opentext
	writetext IcePathLanceWaitText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	pause 20
	appear ICEPATH1F_LANCE
	applymovement ICEPATH1F_LANCE, IcePathLanceToPlayerMovement
	opentext
	writetext IcePathLanceCongratulationsText
	promptbutton
	verbosegiveitem HM_WATERFALL
	setevent EVENT_GOT_HM07_WATERFALL
	writetext IcePathLanceWaterfallText
	waitbutton
	closetext
	applymovement ICEPATH1F_LANCE, IcePathLanceLeaveMovement
	disappear ICEPATH1F_LANCE
	setscene SCENE_ICEPATH1F_NOOP
	end

IcePath1FFullRestore:
	itemball FULL_RESTORE

IcePath1FPPUp:
	itemball PP_UP

IcePath1FProtein:
	itemball PROTEIN

IcePathLanceToPlayerMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

IcePathLanceLeaveMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

IcePathLanceWaitText:
	text "???: <PLAYER>!"
	
	para "Wait!"
	done

IcePathLanceCongratulationsText:
	text "I've been looking"
	line "all over for you!"
	
	para "Well done for"
	line "defending the"
	cont "Radio Tower!"
	
	para "You took on Team"
	line "Rocket again and"
	cont "showed them the"
	cont "door!"
	
	para "I want you to have"
	line "this as a 'thank"
	cont "you' on behalf of"
	
	para "myself and the"
	line "people of Johto."
	done

IcePathLanceWaterfallText:
	text "Lance: My Gyarados"
	line "loves using it and"
	cont "I'm sure you'll"
	
	para "find it useful"
	line "while on your"
	cont "journey."
	
	para "Be sure to earn"
	line "the Rising Badge"
	cont "in Blackthorn to"
	
	para "use Waterfall out-"
	line "side of battle."
	
	para "Hopefully she won't"
	line "make things too"
	cont "difficult…"
	
	para "Anyway, time I get"
	line "my #mon out of"
	cont "this cave - they"
	cont "don't like the"
	cont "cold very much."
	
	para "I'm sure I'll see"
	line "you soon!"
	done
	

IcePath1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 19, ROUTE_44, 1
	warp_event 36, 27, BLACKTHORN_CITY, 6
	warp_event 37,  5, ICE_PATH_B1F, 1
	warp_event 37, 13, ICE_PATH_B1F, 7

	def_coord_events
	coord_event 12, 16, SCENE_ICEPATH1F_LANCE, IcePath1FLanceTop
	coord_event 12, 17, SCENE_ICEPATH1F_LANCE, IcePath1FLanceBottom

	def_bg_events

	def_object_events
	object_event  0, 29, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ICE_PATH_1F_LANCE
	object_event 31,  7, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FFullRestore, EVENT_ICE_PATH_1F_FULL_RESTORE
	object_event 32, 23, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPPUp, EVENT_ICE_PATH_1F_PP_UP
	object_event 35,  9, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FProtein, EVENT_ICE_PATH_1F_PROTEIN
