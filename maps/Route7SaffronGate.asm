	object_const_def
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScripts:
	def_scene_scripts
	scene_script Route7SaffronGateNoop1Scene, SCENE_ROUTE7SAFFRONGATE_POWER_PLANT_CHECK
	scene_script Route7SaffronGateNoop2Scene, SCENE_ROUTE7SAFFRONGATE_NOOP
	
	def_callbacks

Route7SaffronGateNoop1Scene:
	end

Route7SaffronGateNoop2Scene:
	end

Route7SaffronGuardScript:
	jumptextfaceplayer Route7SaffronGuardSeriousText

Route7SaffronGatePowerPlantCheck:
	checkevent EVENT_RETURNED_MACHINE_PART
	iffalse .NoPower
	end

.NoPower:
	showemote EMOTE_SHOCK, ROUTE7SAFFRONGATE_OFFICER, 15
	turnobject PLAYER, UP
	opentext
	writetext Route7SaffronGateCannotPassText
	waitbutton
	closetext
	applymovement PLAYER, Route7SaffronGateCannotPassMovement
	end

Route7SaffronGateCannotPassText:
	text "Did you hear about"
	line "the accident at"
	cont "the Power Plant?"

	para "I'm under orders"
	line "to not let anyone"
	cont "through until"
	
	para "the problem is"
	line "solved."
	
	para "Sorry, kid."
	done

Route7SaffronGateCannotPassMovement:
	step RIGHT
	step_end

Route7SaffronGuardSeriousText:
	text "I take my Guard"
	line "job seriously."

	para "Hey! You have a"
	line "#dex."

	para "OK. You can go"
	line "through."
	done

Route7SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 13
	warp_event  9,  5, SAFFRON_CITY, 14

	def_coord_events
	coord_event  5,  4, SCENE_ROUTE7SAFFRONGATE_POWER_PLANT_CHECK, Route7SaffronGatePowerPlantCheck
	coord_event  5,  5, SCENE_ROUTE7SAFFRONGATE_POWER_PLANT_CHECK, Route7SaffronGatePowerPlantCheck

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
