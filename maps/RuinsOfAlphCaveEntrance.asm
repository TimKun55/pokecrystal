	object_const_def
	const RUINSOFALPHCAVEENTRANCE_SCIENTIST

RuinsOfAlphCaveEntrance_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphCaveEntranceNoop1Scene, SCENE_RUINSOFALPHCAVEENTRANCE_SCIENTIST
	scene_script RuinsOfAlphCaveEntranceNoop2Scene, SCENE_RUINSOFALPHCAVEENTRANCE_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphCaveEntranceHiddenDoorCallback
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphCaveEntranceScientistCallback

RuinsOfAlphCaveEntranceNoop1Scene:
	end

RuinsOfAlphCaveEntranceNoop2Scene:
	end	

RuinsOfAlphCaveEntranceHiddenDoorCallback:
	checkevent EVENT_WALL_OPENED_IN_INNER_CHAMBER
	iftrue .WallOpened
	endcallback
	
.WallOpened:
	changeblock 6, 0, $3e ; opened wall
	endcallback

RuinsOfAlphCaveEntranceScientistCallback:
	checkevent EVENT_WALL_OPENED_IN_INNER_CHAMBER
	iftrue .NoAppear
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .ShowScientist
	sjump .NoAppear

.ShowScientist
	appear RUINSOFALPHCAVEENTRANCE_SCIENTIST
	setscene SCENE_RUINSOFALPHCAVEENTRANCE_SCIENTIST
	endcallback

.NoAppear
	disappear RUINSOFALPHCAVEENTRANCE_SCIENTIST
	setscene SCENE_RUINSOFALPHCAVEENTRANCE_NOOP
	endcallback

RuinsOfAlphCaveEntranceScientistRight:
	moveobject RUINSOFALPHCAVEENTRANCE_SCIENTIST, 5, 9
	playsound SFX_ENTER_DOOR
	appear RUINSOFALPHCAVEENTRANCE_SCIENTIST
	pause 20
	showemote EMOTE_SHOCK, RUINSOFALPHCAVEENTRANCE_SCIENTIST, 20
	pause 20
	applymovement RUINSOFALPHCAVEENTRANCE_SCIENTIST, RuinsOfAlphCaveEntranceScientistEnterMovement
	turnobject RUINSOFALPHCAVEENTRANCE_SCIENTIST, RIGHT
	turnobject PLAYER, LEFT
	sjump CaveEntranceScientistContinue

RuinsOfAlphCaveEntranceScientistLeft:
	moveobject RUINSOFALPHCAVEENTRANCE_SCIENTIST, 6, 9
	playsound SFX_ENTER_DOOR
	appear RUINSOFALPHCAVEENTRANCE_SCIENTIST
	pause 20
	showemote EMOTE_SHOCK, RUINSOFALPHCAVEENTRANCE_SCIENTIST, 20
	pause 20
	applymovement RUINSOFALPHCAVEENTRANCE_SCIENTIST, RuinsOfAlphCaveEntranceScientistEnterMovement
	turnobject RUINSOFALPHCAVEENTRANCE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
CaveEntranceScientistContinue:
	opentext
	writetext RuinsOfAlphCaveEntranceScientistAllUnownText
	waitbutton
	closetext
	setevent EVENT_WALL_OPENED_IN_INNER_CHAMBER
	earthquake 30
	changeblock 6, 0, $3e ; opened wall
	reloadmappart
	showemote EMOTE_SHOCK, PLAYER, 20
	showemote EMOTE_SHOCK, RUINSOFALPHCAVEENTRANCE_SCIENTIST, 20
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	turnobject RUINSOFALPHCAVEENTRANCE_SCIENTIST, UP
	showemote EMOTE_SHOCK, RUINSOFALPHCAVEENTRANCE_SCIENTIST, 20
	opentext
	writetext RuinsOfAlphCaveEntranceScientistGoCheckText
	waitbutton
	closetext
	faceplayer
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	opentext
	writetext RuinsOfAlphCaveEntranceScientistDownloadedText
	waitbutton
	closetext
	applymovement RUINSOFALPHCAVEENTRANCE_SCIENTIST, RuinsOfAlphCaveEntranceScientistExitMovement
	playsound SFX_EXIT_BUILDING
	disappear RUINSOFALPHCAVEENTRANCE_SCIENTIST
	setscene SCENE_RUINSOFALPHCAVEENTRANCE_NOOP
	end
	
	
	

RuinsOfAlphCaveEntranceScientistEnterMovement:
	step UP
	step_end

RuinsOfAlphCaveEntranceScientistExitMovement:
	step DOWN
	step_end

RuinsOfAlphCaveEntranceScientistAllUnownText:
	text "<PLAYER>!"
	line "I've been tracking"
	cont "your progress"
	
	para "finding all of"
	line "the Unown!"
	
	para "According to the"
	line "data I received"
	
	para "from your Unown"
	line "Dex, it seems like"
	
	para "you've found all"
	line "of them!"
	
	para "This is a truly"
	line "amazing feat!"
	
	para "There's still some"
	line "untranslated text"
	
	para "I could use your"
	line "help decoding."
	
	para "Let's go!"
	done

RuinsOfAlphCaveEntranceScientistGoCheckText:
	text "Wha…"
	line "What was that?"
	
	para "Wait!"
	line "Did a door just"
	cont "open back there?!"
	
	para "I… I work in a Lab"
	line "not in the field!"
	
	para "Can you go see"
	line "what happened?"
	
	para "Oh, wait!"
	line "Can I borrow your"
	cont "#dex quickly?"
	done

RuinsOfAlphCaveEntranceScientistDownloadedText:
	text "There!"
	
	para "I just downloaded"
	line "the data from your"
	cont "Unown Dex."
	
	para "I'll translate,"
	line "you explore."
	
	para "It's a winning"
	line "combo, right?"
	
	para "Stay safe and"
	line "see you soon!"
	done

RuinsOfAlphCaveEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 5, 9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event 6, 9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event 5, 4, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event 6, 0, RUINS_OF_ALPH_GS_BALL_CHAMBER, 1

	def_coord_events
	coord_event  5,  8, SCENE_RUINSOFALPHCAVEENTRANCE_SCIENTIST, RuinsOfAlphCaveEntranceScientistLeft
	coord_event  6,  8, SCENE_RUINSOFALPHCAVEENTRANCE_SCIENTIST, RuinsOfAlphCaveEntranceScientistRight

	def_bg_events

	def_object_events
	object_event 12, 17, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RUINS_OF_ALPH_CAVE_ENTRANCE_SCIENTIST
