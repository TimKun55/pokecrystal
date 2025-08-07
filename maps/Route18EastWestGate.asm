	object_const_def
	const ROUTE18EASTWESTGATE_OFFICER

Route18EastWestGate_MapScripts:
	def_scene_scripts
	scene_script Route18EastWestGateNoopScene, SCENE_ROUTE18EASTWESTGATE_BICYCLE_CHECK

	def_callbacks

Route18EastWestGateNoopScene:
	end

Route18EastWestGateOfficerScript:
	jumptextfaceplayer Route18EastWestGateOfficerText

Route18EastWestGateBicycleCheck:
	checkitem BICYCLE
	iffalse .NoBicycle
	end

.NoBicycle:
	showemote EMOTE_SHOCK, ROUTE18EASTWESTGATE_OFFICER, 15
	turnobject PLAYER, UP
	opentext
	writetext Route18EastWestGateCannotPassText
	waitbutton
	closetext
	applymovement PLAYER, Route18EastWestGateCannotPassMovement
	end

Route18EastWestGateCannotPassMovement:
	step RIGHT
	turn_head LEFT
	step_end

Route18EastWestGateOfficerText:
	text "Cycling Road"
	line "Uphill starts here"
	done

Route18EastWestGateCannotPassText:
	text "Hang on! Don't you"
	line "have a Bicycle?"

	para "The Cycling Road"
	line "is beyond here."

	para "You have to have a"
	line "Bicycle to go on."
	done

Route18EastWestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_18_WEST, 1
	warp_event  0,  5, ROUTE_18_WEST, 2
	warp_event  9,  4, ROUTE_18_EAST, 1
	warp_event  9,  5, ROUTE_18_EAST, 2

	def_coord_events
	coord_event  5,  4, SCENE_ROUTE18EASTWESTGATE_BICYCLE_CHECK, Route18EastWestGateBicycleCheck
	coord_event  5,  5, SCENE_ROUTE18EASTWESTGATE_BICYCLE_CHECK, Route18EastWestGateBicycleCheck

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route18EastWestGateOfficerScript, -1
