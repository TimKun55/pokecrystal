	object_const_def
	const ROUTE7_BUG_MANIAC
	const ROUTE7_POKEFAN_M
	const ROUTE7_FISHER
	const ROUTE7_FRUIT_TREE

Route7_MapScripts:
	def_scene_scripts
	scene_script Route7Noop1Scene, SCENE_ROUTE7_NOOP
	scene_script Route7Noop2Scene, SCENE_ROUTE7_DISGUISED
	scene_script Route7Noop3Scene, SCENE_ROUTE7_CLOSE_DOORS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route7UndergroundPathOpenScript

Route7Noop1Scene:
Route7Noop2Scene:
Route7Noop3Scene:
	end

Route7UndergroundPathOpenScript:
	checkevent EVENT_ROUTE_7_UNDERGROUND_PATH_DOORS_OPEN
	iftrue .end
	changeblock  4, 10, $9f ; closed gate doors
	changeblock  6, 10, $a3 ; closed gate doors
.end
	endcallback

Route7DisguisedScene:
	moveobject ROUTE7_FISHER,  5, 11
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock  4, 10, $10 ; open gate doors
	changeblock  6, 10, $11 ; open gate doors
	refreshscreen
	setevent EVENT_ROUTE_7_UNDERGROUND_PATH_DOORS_OPEN
	playsound SFX_EXIT_BUILDING
	appear ROUTE7_FISHER
	applymovement ROUTE7_FISHER, Route7DisguisedExitMovement
	pause 15
	applymovement PLAYER, Route7PlayerSlowMovement
	showemote EMOTE_QUESTION, PLAYER, 15
	pause 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundUpMovement
	pause 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundDownMovement
	pause 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundRightMovement
	pause 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundLeftMovement
	pause 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundRightMovement
	pause 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundDownMovement
	pause 25
	showemote EMOTE_QUESTION, ROUTE7_FISHER, 15
	applymovement ROUTE7_FISHER, Route7DisguisedLookAroundRightMovement
	pause 15
	showemote EMOTE_SHOCK, ROUTE7_FISHER, 15
	opentext
	writetext Route7DisguisedScreamText
	waitbutton
	closetext	
	applymovement ROUTE7_FISHER, Route7DisguisedQuickExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE7_FISHER
	pause 15
	showemote EMOTE_QUESTION, PLAYER, 15
	setscene SCENE_ROUTE7_NOOP
	end

Route7ClosedDoorScene:
	checkevent EVENT_KANTO_ROCKET_DISBAND
	iffalse .end
	clearevent EVENT_ROUTE_7_UNDERGROUND_PATH_DOORS_OPEN
	pause 15
	showemote EMOTE_QUESTION, PLAYER, 15
	pause 10
	turnobject PLAYER, UP
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 10
	applymovement PLAYER, Route7PlayerStepsBackMovement
	pause 10
	changeblock  4, 10, $9f ; closed gate doors
	changeblock  6, 10, $a3 ; closed gate doors
	refreshscreen
	playsound SFX_ENTER_DOOR
	pause 15
	setscene SCENE_ROUTE7_NOOP
	closetext
.end
	end

TrainerBugManiacEli:
	trainer BUG_MANIAC, ELI, EVENT_BEAT_BUG_MANIAC_ELI, BugManiacEliSeenText, BugManiacEliBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugManiacEliAfterBattleText

TrainerPokefanMCarlos:
	trainer POKEFANM, CARLOS, EVENT_BEAT_POKEFANM_CARLOS, PokefanMCarlosSeenText, PokefanMCarlosBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext PokefanMCarlosAfterBattleText

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7PomegTree:
	fruittree FRUITTREE_ROUTE_7_POMEG

Route7DisguisedExitMovement:
	step DOWN
	step_end

Route7PlayerSlowMovement:
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

Route7DisguisedLookAroundUpMovement:
	turn_head UP
	step_end

Route7DisguisedLookAroundRightMovement:
	turn_head RIGHT
	step_end

Route7DisguisedLookAroundDownMovement:
	turn_head DOWN
	step_end

Route7DisguisedLookAroundLeftMovement:
	turn_head LEFT
	step_end

Route7DisguisedQuickExitMovement:
	big_step UP
	step_end

Route7PlayerStepsBackMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing	
	step_end

BugManiacEliSeenText:
	text "I've been training"
	line "to take on Erika!"
	
	para "I won't lose!"
	done

BugManiacEliBeatenText:
	text "Well, I guess not!"
	done

BugManiacEliAfterBattleText:
	text "Back to training I"
	line "go! It's good to"
	cont "have goals to"
	cont "work towards!"
	done

PokefanMCarlosSeenText:
	text "Look at how cute"
	line "my #mon are!"
	done

PokefanMCarlosBeatenText:
	text "My cuties!"
	done

PokefanMCarlosAfterBattleText:
	text "I should go to"
	line "the Fan Club in"
	cont "Vermilion and show"
	cont "off my #mon!"
	done

Route7DisguisedScreamText:
	text "Ahh!!"
	done

Route7UndergroundPathSignText:
	text "What's this flyer?"

	para "… Uncouth trainers"
	line "have been holding"
	cont "battles in the"
	cont "Underground Path."

	para "Because of rising"
	line "complaints by lo-"
	cont "cal residents, the"
	cont "Underground Path"
	cont "has been sealed"
	cont "indefinitely."

	para "Celadon Police"
	done

Route7LockedDoorText:
	text "It's locked…"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  8, ROUTE_7_SAFFRON_GATE, 1
	warp_event 27,  9, ROUTE_7_SAFFRON_GATE, 2
	warp_event  5, 11, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6, 11, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 2

	def_coord_events
	coord_event  8, 10, SCENE_ROUTE7_DISGUISED, Route7DisguisedScene
	coord_event  9, 10, SCENE_ROUTE7_DISGUISED, Route7DisguisedScene
	coord_event  5, 12, SCENE_ROUTE7_CLOSE_DOORS, Route7ClosedDoorScene
	coord_event  6, 12, SCENE_ROUTE7_CLOSE_DOORS, Route7ClosedDoorScene

	def_bg_events
	bg_event  4, 12, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  5, 11, BGEVENT_READ, Route7LockedDoor
	bg_event  6, 11, BGEVENT_READ, Route7LockedDoor

	def_object_events
	object_event  7,  6, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugManiacEli, -1
	object_event 22, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerPokefanMCarlos, -1
	object_event 29,  0, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKETS_IN_KANTO
	object_event 13, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7PomegTree, -1
