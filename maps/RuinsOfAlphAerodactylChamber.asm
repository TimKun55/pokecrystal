RuinsOfAlphAerodactylChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphAerodactylChamberCheckWallScene, SCENE_RUINSOFALPHAERODACTYLCHAMBER_CHECK_WALL
	scene_script RuinsOfAlphAerodactylChamberNoopScene,      SCENE_RUINSOFALPHAERODACTYLCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphAerodactylChamberHiddenDoorsCallback

RuinsOfAlphAerodactylChamberCheckWallScene:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .end
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .OpenWall
.end
	end

.OpenWall:
	sdefer RuinsOfAlphAerodactylChamberWallOpenScript
	end

RuinsOfAlphAerodactylChamberNoopScene:
	end

RuinsOfAlphAerodactylChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .NormalWalls
	changeblock 2, 0, $2d ; left wall unown words
	changeblock 4, 0, $2e ; right wall unown words
.WallOpen:
	endcallback

.NormalWalls:
	changeblock 2, 0, $06 ; left full wall
	changeblock 4, 0, $07 ; right full wall
	endcallback

RuinsOfAlphAerodactylChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_RUINSOFALPHAERODACTYLCHAMBER_NOOP
	closetext
	end

RuinsOfAlphAerodactylChamberPuzzle:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iftrue .CompletedPuzzle
	refreshscreen
	setval UNOWNPUZZLE_AERODACTYL
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
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
	writetext AerodactylPuzzleCompletedText
	waitbutton
	closetext
	refreshscreen
	paintingpic AERODACTYL_PUZZLE
	waitbutton
	closepaintingpic
	end

RuinsOfAlphAerodactylChamberAncientReplica:
	jumptext RuinsOfAlphAerodactylChamberAncientReplicaText

RuinsOfAlphAerodactylChamberDescriptionSign:
	jumptext RuinsOfAlphAerodactylChamberDescriptionText

RuinsOfAlphAerodactylChamberWallPatternLeft:
	opentext
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .NoWords
	writetext RuinsOfAlphAerodactylChamberWallPatternText
	setval UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

.NoWords
	writetextend RuinsOfAlphAerodactylChamberWallBreezeText

RuinsOfAlphAerodactylChamberWallPatternRight:
	opentext
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse RuinsOfAlphAerodactylChamberWallPatternLeft.NoWords
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	writetext RuinsOfAlphAerodactylChamberWallPatternText
	setval UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	writetextend RuinsOfAlphAerodactylChamberWallHoleText

RuinsOfAlphAerodactylChamberWallPatternText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphAerodactylChamberWallBreezeText:
	text "There's a slight"
	line "breeze coming from"
	cont "somewhere…"
	done

RuinsOfAlphAerodactylChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphAerodactylChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

RuinsOfAlphAerodactylChamberDescriptionText:
	text "This flying #-"
	line "mon attacked its"
	cont "prey with saw-like"
	cont "fangs."
	done

AerodactylPuzzleCompletedText:
	text "The puzzle has"
	line "already been"
	cont "completed."
	done

RuinsOfAlphAerodactylChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  4,  0, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphAerodactylChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphAerodactylChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphAerodactylChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphAerodactylChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphAerodactylChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphAerodactylChamberWallPatternRight

	def_object_events
