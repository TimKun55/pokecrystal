	object_const_def
	const RUINSOFALPHGSBALLCHAMBER_UNOWN
	const RUINSOFALPHGSBALLCHAMBER_POKE_BALL

RuinsOfAlphGSBallChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphGSBallChamberGSBallScene,      SCENE_RUINSOFALPHGSBALLCHAMBER_GS_BALL
	scene_script RuinsOfAlphGSBallChamberGSBallNoopScene,  SCENE_RUINSOFALPHGSBALLCHAMBER_NOOP

	def_callbacks

RuinsOfAlphGSBallChamberGSBallScene:
	end

RuinsOfAlphGSBallChamberGSBallNoopScene:
	end

GSBallAppearScene:
	special FadeOutMusic
	pause 15
	applymovement PLAYER, GSBallChamberPlayerMovement1
	opentext
	writetext StrangePresenceText
	waitbutton
	closetext
	pause 30
	turnobject PLAYER, LEFT
	pause 30
	turnobject PLAYER, RIGHT
	pause 30
	turnobject PLAYER, DOWN
	pause 30
	cry UNOWN
	showemote EMOTE_SHOCK, PLAYER, 30
	turnobject PLAYER, UP
	applymovement PLAYER, GSBallChamberPlayerMovement2
	cry UNOWN
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear RUINSOFALPHGSBALLCHAMBER_UNOWN
	special FadeInFromBlack
	pause 30
	applymovement PLAYER, GSBallChamberPlayerMovement3
	showemote EMOTE_QUESTION, PLAYER, 30
	pause 30
	cry UNOWN
	showemote EMOTE_SHOCK, PLAYER, 30
	turnobject PLAYER, DOWN
	appear RUINSOFALPHGSBALLCHAMBER_POKE_BALL
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	special RestartMapMusic
	setscene SCENE_RUINSOFALPHGSBALLCHAMBER_NOOP
	end

RuinsOfAlphGSBallChamberGSBall:
	itemball GS_BALL

GSBallChamberPlayerMovement1:
	slow_step UP
	slow_step UP
	step_end

GSBallChamberPlayerMovement2:
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

GSBallChamberPlayerMovement3:
	slow_step UP
	step_end

StrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

RuinsOfAlphGSBallChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, RUINS_OF_ALPH_INNER_CHAMBER, 10
	warp_event  4, 11, RUINS_OF_ALPH_INNER_CHAMBER, 10

	def_coord_events
	coord_event 3, 8, SCENE_RUINSOFALPHGSBALLCHAMBER_GS_BALL, GSBallAppearScene
	coord_event 4, 8, SCENE_RUINSOFALPHGSBALLCHAMBER_GS_BALL, GSBallAppearScene

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GS_BALL_CHAMBER_UNOWN
	object_event  3,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphGSBallChamberGSBall, EVENT_GS_BALL_CHAMBER_GS_BALL
