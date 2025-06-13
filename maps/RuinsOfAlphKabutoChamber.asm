	object_const_def
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsOfAlphKabutoChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoChamberCheckWallScene, SCENE_RUINSOFALPHKABUTOCHAMBER_CHECK_WALL
	scene_script RuinsOfAlphKabutoChamberNoopScene,      SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphKabutoChamberHiddenDoorsCallback

RuinsOfAlphKabutoChamberCheckWallScene:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .end
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .OpenWall
.end
	end

.OpenWall:
	sdefer RuinsOfAlphKabutoChamberWallOpenScript
	end

RuinsOfAlphKabutoChamberNoopScene:
	end

RuinsOfAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .NormalWalls
	changeblock 2, 0, $2d ; left wall unown words
	changeblock 4, 0, $2e ; right wall unown words
.WallOpen:
	endcallback

.NormalWalls:
	changeblock 2, 0, $06 ; left full wall
	changeblock 4, 0, $07 ; right full wall
	endcallback

RuinsOfAlphKabutoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iftrue .PuzzleSolved
	writetext RuinsOfAlphKabutoChamberReceptionistText
	waitbutton
	closetext
	end

.PuzzleSolved
	writetext RuinsOfAlphKabutoChamberReceptionistTremorText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberPuzzle:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iftrue .CompletedPuzzle
	refreshscreen
	setval UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	special FadeOutMusic
	pause 16
	playsound SFX_INTRO_UNOWN_1
	waitsfx
	pause 24
	playsound SFX_INTRO_UNOWN_2
	waitsfx
	showemote EMOTE_QUESTION, RUINSOFALPHKABUTOCHAMBER_SCIENTIST, 15
	showemote EMOTE_SHOCK, RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST, 15
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
	showemote EMOTE_SHOCK, RUINSOFALPHKABUTOCHAMBER_SCIENTIST, 15
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST, 15
	turnobject RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST, UP
	pause 16
	special RestartMapMusic
	end

.CompletedPuzzle
	opentext
	writetext KabutoPuzzleCompletedText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end
	
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

.WallOpen:
	writetext RuinsOfAlphKabutoChamberScientistHoleText
	waitbutton
	closetext
	end

.AllUnownCaught:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberAncientReplica:
	jumptext RuinsOfAlphKabutoChamberAncientReplicaText

RuinsOfAlphKabutoChamberDescriptionSign:
	jumptext RuinsOfAlphKabutoChamberDescriptionText

RuinsOfAlphKabutoChamberWallPatternLeft:
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .NoWords
	writetext RuinsOfAlphKabutoChamberWallPatternText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

.NoWords
	writetext RuinsOfAlphKabutoChamberWallBreezeText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberWallPatternRight:
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse RuinsOfAlphKabutoChamberWallPatternLeft.NoWords
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	writetext RuinsOfAlphKabutoChamberWallPatternText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	writetext RuinsOfAlphKabutoChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistText:
	text "Welcome to this"
	line "chamber."

	para "There are sliding"
	line "panels that depict"

	para "a #mon drawn by"
	line "the ancients."

	para "Slide the panels"
	line "around to form the"
	cont "picture."

	para "To the right is a"
	line "description of the"
	cont "#mon."
	done

RuinsOfAlphKabutoChamberReceptionistTremorText:
	text "Wha-What was that"
	line "sudden shaking?"
	
	para "And those strange"
	line "sounds?"
	
	para "And did the wall"
	line "over there change?"
	
	para "This is all a bit"
	line "too creepy for me!"
	done

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "This part of the"
	line "wall seems a bit"
	cont "different than"
	cont "the rest, but"
	cont "I don't know why…"
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "Ah! A huge hole"
	line "appeared!"

	para "It's big enough to"
	line "go through!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "That tremor was"
	line "pretty scary!"

	para "But I'm more"
	line "concerned about"
	cont "this wall here…"
	
	para "Strange, cryptic"
	line "patterns have"
	cont "appeared!"
	
	para "What could this"
	line "possibly mean…?"
	done

RuinsOfAlphKabutoChamberWallPatternText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphKabutoChamberWallBreezeText:
	text "There's a slight"
	line "breeze coming from"
	cont "somewhere…"
	done

RuinsOfAlphKabutoChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphKabutoChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "A #mon that hid"
	line "on the sea floor."

	para "Eyes on its back"
	line "scanned the area."
	done

KabutoPuzzleCompletedText:
	text "The puzzle has"
	line "already been"
	cont "completed."
	done

RuinsOfAlphKabutoChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternRight

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1
