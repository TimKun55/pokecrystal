RuinsOfAlphOmanyteChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphOmanyteChamberCheckWallScene, SCENE_RUINSOFALPHOMANYTECHAMBER_CHECK_WALL
	scene_script RuinsOfAlphOmanyteChamberNoopScene,      SCENE_RUINSOFALPHOMANYTECHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphOmanyteChamberHiddenDoorsCallback

RuinsOfAlphOmanyteChamberCheckWallScene:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse .end
	special OmanyteChamber
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue .OpenWall
.end
	end

.OpenWall:
	sdefer RuinsOfAlphOmanyteChamberWallOpenScript
RuinsOfAlphOmanyteChamberNoopScene:
	end

RuinsOfAlphOmanyteChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse .NormalWalls
	changeblock 2, 0, $2d ; left wall unown words
	changeblock 4, 0, $2e ; right wall unown words
.WallOpen:
	endcallback

.NormalWalls:
	changeblock 2, 0, $06 ; left full wall
	changeblock 4, 0, $07 ; right full wall
	endcallback

RuinsOfAlphOmanyteChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_RUINSOFALPHOMANYTECHAMBER_NOOP
	closetext
	end

RuinsOfAlphOmanyteChamberPuzzle:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iftrue .CompletedPuzzle
	refreshscreen
	setval UNOWNPUZZLE_OMANYTE
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_OMANYTE_PUZZLE
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
	writetextend OmanytePuzzleCompletedText

RuinsOfAlphOmanyteChamberAncientReplica:
	jumptext RuinsOfAlphOmanyteChamberAncientReplicaText

RuinsOfAlphOmanyteChamberDescriptionSign:
	jumptext RuinsOfAlphOmanyteChamberDescriptionText

RuinsOfAlphOmanyteChamberWallPatternLeft:
	opentext
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse .NoWords
	writetext RuinsOfAlphOmanyteChamberWallPatternText
	setval UNOWNWORDS_WATER
	special DisplayUnownWords
	closetext
	end

.NoWords
	writetextend RuinsOfAlphOmanyteChamberWallBreezeText

RuinsOfAlphOmanyteChamberWallPatternRight:
	opentext
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse RuinsOfAlphOmanyteChamberWallPatternLeft.NoWords
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue .WallOpen
	writetext RuinsOfAlphOmanyteChamberWallPatternText
	setval UNOWNWORDS_WATER
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	writetextend RuinsOfAlphOmanyteChamberWallHoleText

RuinsOfAlphOmanyteChamberWallPatternText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphOmanyteChamberWallBreezeText:
	text "There's a slight"
	line "breeze coming from"
	cont "somewhere…"
	done

RuinsOfAlphOmanyteChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphOmanyteChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

RuinsOfAlphOmanyteChamberDescriptionText:
	text "This #mon"
	line "drifted in the"
	cont "sea by twisting"
	cont "its ten tentacles."
	done

OmanytePuzzleCompletedText:
	text "The puzzle has"
	line "already been"
	cont "completed."
	done

RuinsOfAlphOmanyteChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  4,  0, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphOmanyteChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphOmanyteChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphOmanyteChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphOmanyteChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphOmanyteChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphOmanyteChamberWallPatternRight

	def_object_events
