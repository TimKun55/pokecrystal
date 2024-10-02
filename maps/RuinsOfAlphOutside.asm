	object_const_def
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphOutsideNoop1Scene, SCENE_RUINSOFALPHOUTSIDE_NOOP
	scene_script RuinsOfAlphOutsideNoop2Scene, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphOutsideScientistCallback

RuinsOfAlphOutsideNoop1Scene:
	end

RuinsOfAlphOutsideNoop2Scene:
	end

RuinsOfAlphOutsideScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	sjump .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	sjump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	endcallback

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOOP
	endcallback

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene3:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	applymovement PLAYER, RuinsOfAlphOutsidePlayerMovement
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, RuinsOfAlphOutsideScientistWalkToLabMovement
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, RuinsOfAlphOutsidePlayerEnterLabMovement
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	promptbutton
.Next:
	writetext RuinsOfAlphOutsideFisherText2
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphOutsideMysteryChamberSign:
	jumptext RuinsOfAlphOutsideMysteryChamberSignText

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

RuinsOfAlphOutsidePlayerMovement:
	step RIGHT
	step_end

RuinsOfAlphOutsideScientistWalkToLabMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

RuinsOfAlphOutsidePlayerEnterLabMovement:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "Hm? That's a #-"
	line "DEX, isn't it?"
	cont "May I see it?"

	para "There are so many"
	line "kinds of #mon."

	para "Hm? What's this?"

	para "What is this"
	line "#mon?"

	para "It looks like the"
	line "strange writing on"

	para "the walls of the"
	line "Ruins."

	para "If those drawings"
	line "are really #-"
	cont "mon, there should"
	cont "be many more."

	para "I know! Let me up-"
	line "grade your #-"
	cont "dex. Follow me."
	done

SuperNerdStanSeenText:
	text "What do you want?"
	line "I'm studying--"
	cont "don't disturb me!"
	done

SuperNerdStanBeatenText:
	text "Sorry…"
	line "I'm frustrated by"

	para "our lack of real"
	line "understanding…"
	done

SuperNerdStanAfterBattleText:
	text "The Ruins are from"
	line "about 1500 years"
	cont "ago."

	para "Nobody knows who"
	line "built them."

	para "It's also not"
	line "known if the #-"
	cont "mon statues have"
	cont "any meaning."

	para "It's all one big"
	line "mystery…"
	done

PsychicNathanSeenText:
	text "Hmmm… This is a"
	line "strange place."
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "I like thinking"
	line "here."
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "Mystery Stone"
	line "Panel Chamber"
	done

RuinsOfAlphSignText:
	text "Ruins Of Alph"
	line "Visitors Welcome"
	done

RuinsOfAlphResearchCenterSignText:
	text "Ruins Of Alph"
	line "Research Center"

	para "The authority on"
	line "the Ruins Of Alph"
	done

RuinsOfAlphOutsideFisherText1:
	text "While exploring"
	line "the Ruins, we"

	para "suddenly noticed"
	line "an odd presence."

	para "We all got scared"
	line "and ran away."

	para "You should be"
	line "careful too."
	done

RuinsOfAlphOutsideFisherText2:
	text "The Ruins hide a"
	line "huge secret!"

	para "…I think…"
	done

RuinsOfAlphOutsideYoungster1Text:
	text "There are many"
	line "kinds of Unown, so"

	para "we use them for"
	line "our secret codes."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "A… H… E… A… D…"
	line "Hmm…"

	para "What?"

	para "I'm decoding this"
	line "message!"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 15,  7, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  4, 35, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 16, 39, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 11, 15, RUINS_OF_ALPH_CAVE_ENTRANCE, 1
	warp_event 17, 13, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  6, 21, UNION_CAVE_B1F, 1
	warp_event  8, 31, UNION_CAVE_B1F, 2
	warp_event  7,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 17, 26, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 17, 27, ROUTE_32_RUINS_OF_ALPH_GATE, 2

	def_coord_events
	coord_event 12, 16, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 11, 17, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2
	coord_event 10, 17, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene3

	def_bg_events
	bg_event 13,  8, BGEVENT_READ, RuinsOfAlphOutsideMysteryChamberSign
	bg_event 12, 18, BGEVENT_READ, RuinsOfAlphSign
	bg_event 18, 14, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	def_object_events
	object_event  4, 22, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 12, 17, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 15, 20, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 17, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
