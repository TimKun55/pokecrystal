	object_const_def
	const RUINSOFALPHGSBALLCHAMBER_POKE_BALL

RuinsOfAlphGSBallChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphGSBallChamberGSBallScene,      SCENE_RUINSOFALPHGSBALLCHAMBER_GS_BALL
	scene_script RuinsOfAlphGSBallChamberGSBallNoopScene,  SCENE_RUINSOFALPHGSBALLCHAMBER_NOOP

	def_callbacks

RuinsOfAlphGSBallChamberGSBallScene:
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
	special FadeOutToBlack
	pause 10
	special FadeInFromBlack
	pause 30
	playsound SFX_INTRO_UNOWN_1
	turnobject PLAYER, LEFT
	pause 30
	turnobject PLAYER, RIGHT
	pause 30
	turnobject PLAYER, DOWN
	pause 30
	showemote EMOTE_SHOCK, PLAYER, 30
	turnobject PLAYER, UP
	applymovement PLAYER, GSBallChamberPlayerMovement2
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	playsound SFX_INTRO_UNOWN_1
	waitsfx
	special FadeOutToBlack
	pause 10
	special FadeInFromBlack
	pause 30
	applymovement PLAYER, GSBallChamberPlayerMovement3
	showemote EMOTE_QUESTION, PLAYER, 30
	pause 30
	playsound SFX_INTRO_UNOWN_3
	waitsfx
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	playsound SFX_INTRO_UNOWN_1
	waitsfx
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 30
	turnobject PLAYER, DOWN
	special FadeOutToBlack
	appear RUINSOFALPHGSBALLCHAMBER_POKE_BALL
	cry UNOWN	
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	special FadeInFromBlack
	special RestartMapMusic
	setscene SCENE_RUINSOFALPHGSBALLCHAMBER_NOOP
	end

RuinsOfAlphGSBallChamberBallRelic:
	itemball BALL_RELIC

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
	warp_event  9, 11, RUINS_OF_ALPH_CAVE_ENTRANCE, 4
	warp_event 10, 11, RUINS_OF_ALPH_CAVE_ENTRANCE, 4

	def_coord_events
	coord_event  9, 10, SCENE_RUINSOFALPHGSBALLCHAMBER_GS_BALL, GSBallAppearScene
	coord_event 10, 10, SCENE_RUINSOFALPHGSBALLCHAMBER_GS_BALL, GSBallAppearScene

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphGSBallChamberBallRelic, EVENT_GS_BALL_CHAMBER_BALL_RELIC
