	object_const_def
	const ROUTE5_SUPER_NERD1
	const ROUTE5_SUPER_NERD2
	const ROUTE5_POKEFAN_M
	const ROUTE5_SUPER_NERD3

Route5_MapScripts:
	def_scene_scripts
	scene_script Route5Noop1Scene, SCENE_ROUTE5_NOOP
	scene_script Route5Noop2Scene, SCENE_ROUTE5_DISGUISED

	def_callbacks

Route5Noop1Scene:
	end

Route5Noop2Scene:
	end

Route5DisguisedScene1:
	readvar VAR_FACING
	ifequal RIGHT, .continueappear1
	end
	
.continueappear1
	moveobject ROUTE5_SUPER_NERD3,  9, 13
	appear ROUTE5_SUPER_NERD3
	pause 5
	applymovement ROUTE5_SUPER_NERD3, Route5DisguisedRunDownMovement
	playsound SFX_TACKLE
	applymovement ROUTE5_SUPER_NERD3, Route5DisguisedRunsIntoYouMovement
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	showemote EMOTE_QUESTION, ROUTE5_SUPER_NERD3, 15
	pause 15
	showemote EMOTE_SHOCK, ROUTE5_SUPER_NERD3, 15
	turnobject ROUTE5_SUPER_NERD3, UP
	pause 15
	turnobject ROUTE5_SUPER_NERD3, DOWN
	pause 15
	applymovement ROUTE5_SUPER_NERD3, Route5DisguisedFast1Movement
	playsound SFX_ENTER_DOOR
	disappear ROUTE5_SUPER_NERD3
	turnobject PLAYER, RIGHT
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_ROUTE5_NOOP
	setmapscene UNDERGROUND_PATH, SCENE_UNDERGROUNDPATH_DOOR
	end

Route5DisguisedScene2:
	readvar VAR_FACING
	ifequal RIGHT, .continueappear2
	end
	
.continueappear2
	moveobject ROUTE5_SUPER_NERD3,  9, 14
	appear ROUTE5_SUPER_NERD3
	pause 5
	applymovement ROUTE5_SUPER_NERD3, Route5DisguisedRunDownMovement
	playsound SFX_TACKLE
	applymovement ROUTE5_SUPER_NERD3, Route5DisguisedRunsIntoYouMovement
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	showemote EMOTE_QUESTION, ROUTE5_SUPER_NERD3, 15
	pause 15
	showemote EMOTE_SHOCK, ROUTE5_SUPER_NERD3, 15
	turnobject ROUTE5_SUPER_NERD3, UP
	pause 15
	turnobject ROUTE5_SUPER_NERD3, DOWN
	pause 15
	applymovement ROUTE5_SUPER_NERD3, Route5DisguisedFast2Movement
	playsound SFX_EXIT_BUILDING
	disappear ROUTE5_SUPER_NERD3
	turnobject PLAYER, RIGHT
	showemote EMOTE_QUESTION, PLAYER, 30
	setscene SCENE_ROUTE5_NOOP
	setmapscene UNDERGROUND_PATH, SCENE_UNDERGROUNDPATH_DOOR
	end

Route5SuperNerdGreggScript:
	trainer SUPER_NERD, GREGG, EVENT_BEAT_SUPER_NERD_GREGG, SupernerdGreggSeenText, SupernerdGreggBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdGreggAfterBattleText
	waitbutton
	closetext
	end

Route5SuperNerdJayScript:
	trainer SUPER_NERD, JAY, EVENT_BEAT_SUPER_NERD_JAY, SupernerdJaySeenText, SupernerdJayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdJayAfterBattleText
	waitbutton
	closetext
	end

Route5PokefanMScript:
	jumptextfaceplayer Route5PokefanMText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5DisguisedRunDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	step_end

Route5DisguisedRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

Route5DisguisedFast1Movement:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

Route5DisguisedFast2Movement:
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	step_end

SupernerdGreggSeenText:
	text "You're from Johto?"
	line "You must have some"
	cont "rare #mon!"
	done

SupernerdGreggBeatenText:
	text "Rare and strong!"
	done

SupernerdGreggAfterBattleText:
	text "That guy Jay says"
	line "Misty is better"
	cont "than Sabrina."
	
	para "Lies!"
	done

SupernerdJaySeenText:
	text "Hey, let's battle!"
	done

SupernerdJayBeatenText:
	text "A miscalculation!"
	done

SupernerdJayAfterBattleText:
	text "That guy Gregg"
	line "says Sabrina is"
	cont "better than Misty."
	
	para "Lies!"
	done

Route5PokefanMText:
	text "The Underground"
	line "Path is closed"
	cont "until the problem"

	para "at the Power Plant"
	line "is solved."
	done

Route5UndergroundPathSignText:
	text "Underground Path"

	para "Cerulean City -"
	line "Vermilion City"
	done

HouseForSaleSignText:
	text "What's this?"

	para "House for Sale…"
	line "Nobody lives here."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 19, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  7, 23, ROUTE_5_SAFFRON_GATE, 1
	warp_event  8, 23, ROUTE_5_SAFFRON_GATE, 2
	warp_event  9,  9, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	def_coord_events
	coord_event 12, 20, SCENE_ROUTE5_DISGUISED, Route5DisguisedScene1
	coord_event 12, 21, SCENE_ROUTE5_DISGUISED, Route5DisguisedScene2

	def_bg_events
	bg_event 13, 19, BGEVENT_READ, Route5UndergroundPathSign
	bg_event  9,  9, BGEVENT_READ, HouseForSaleSign

	def_object_events
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Route5SuperNerdGreggScript, -1
	object_event 18, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Route5SuperNerdJayScript, -1
	object_event 15, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event -3, 19, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_POWER_PLANT_GIOVANNI
