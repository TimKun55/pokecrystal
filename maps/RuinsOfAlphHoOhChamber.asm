RuinsOfAlphHoOhChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphHoOhChamberCheckWallScene, SCENE_RUINSOFALPHHOOHCHAMBER_CHECK_WALL
	scene_script RuinsOfAlphHoOhChamberNoopScene,      SCENE_RUINSOFALPHHOOHCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphHoOhChamberHiddenDoorsCallback

RuinsOfAlphHoOhChamberCheckWallScene:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .end
	special HoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .OpenWall
.end
	end

.OpenWall:
	sdefer RuinsOfAlphHoOhChamberWallOpenScript
RuinsOfAlphHoOhChamberNoopScene:
	end

RuinsOfAlphHoOhChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .NormalWalls
	changeblock 2, 0, $2d ; left wall unown words
	changeblock 4, 0, $2e ; right wall unown words
.WallOpen:
	endcallback

.NormalWalls:
	changeblock 2, 0, $06 ; left full wall
	changeblock 4, 0, $07 ; right full wall
	endcallback

RuinsOfAlphHoOhChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_RUINSOFALPHHOOHCHAMBER_NOOP
	closetext
	end

RuinsOfAlphHoOhChamberPuzzle:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iftrue .CompletedPuzzle
	refreshscreen
	setval UNOWNPUZZLE_HO_OH
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	special FadeOutMusic
	pause 16
	playsound SFX_INTRO_UNOWN_1
	waitsfx
	pause 24
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	pause 16
	turnobject PLAYER, RIGHT
	pause 16
	turnobject PLAYER, DOWN
	showemote EMOTE_QUESTION, PLAYER, 15
	pause 16
	playsound SFX_INTRO_UNOWN_3
	waitsfx
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	playsound SFX_INTRO_UNOWN_1
	waitsfx
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	pause 16
	cry UNOWN
	playsound SFX_STRENGTH
	earthquake 30
	changeblock 2, 0, $2d ; left wall unown words
	changeblock 4, 0, $2e ; right wall unown words
	reloadmappart
	pause 16
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	special RestartMapMusic
	end

.CompletedPuzzle
	opentext
	writetext HoOhPuzzleCompletedText
	waitbutton
	closetext
	refreshscreen
	paintingpic HO_OH_PUZZLE
	waitbutton
	closepaintingpic
	end

RuinsOfAlphHoOhChamberAncientReplica:
	jumptext RuinsOfAlphHoOhChamberAncientReplicaText

RuinsOfAlphHoOhChamberDescriptionSign:
	jumptext RuinsOfAlphHoOhChamberDescriptionText

RuinsOfAlphHoOhChamberWallPatternLeft:
	opentext
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .NoWords
	writetext RuinsOfAlphHoOhChamberWallPatternText
	setval UNOWNWORDS_SEED
	special DisplayUnownWords
	closetext
	end

.NoWords
	writetextend RuinsOfAlphHoOhChamberWallBreezeText

RuinsOfAlphHoOhChamberWallPatternRight:
	opentext
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse RuinsOfAlphHoOhChamberWallPatternLeft.NoWords
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	writetext RuinsOfAlphHoOhChamberWallPatternText
	setval UNOWNWORDS_SEED
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	writetextend RuinsOfAlphHoOhChamberWallHoleText

RuinsOfAlphHoOhChamberWallPatternText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphHoOhChamberWallBreezeText:
	text "There's a slight"
	line "breeze coming from"
	cont "somewhere…"
	done

RuinsOfAlphHoOhChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphHoOhChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

RuinsOfAlphHoOhChamberDescriptionText:
	text "A #mon that"
	line "flew gracefully on"
	cont "rainbow-colored"
	cont "wings."
	done

HoOhPuzzleCompletedText:
	text "The puzzle has"
	line "already been"
	cont "completed."
	done

RuinsOfAlphHoOhChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  0, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphHoOhChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphHoOhChamberWallPatternRight

	def_object_events
