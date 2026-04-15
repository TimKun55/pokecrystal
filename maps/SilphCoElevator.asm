	object_const_def
	const SILPHCOELEVATOR_SCIENTIST

SilphCoElevator_MapScripts:
	def_scene_scripts
	scene_script SilphCoElevatorScene, SCENE_SILPHCO_ELEVATOR

	def_callbacks

SilphCoElevatorScene:
	applymovement PLAYER, SilphCoElevatorPlayerEntersMovement
	applymovement SILPHCOELEVATOR_SCIENTIST, SilphCoElevatorScientistMovement1
	pause 15
	playsound SFX_TWO_PC_BEEPS
	waitsfx
	applymovement SILPHCOELEVATOR_SCIENTIST, SilphCoElevatorScientistMovement2
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	applymovement SILPHCOELEVATOR_SCIENTIST, SilphCoElevatorExitMovement
	playsound SFX_ENTER_DOOR
	disappear SILPHCOELEVATOR_SCIENTIST
	applymovement PLAYER, SilphCoElevatorExitMovement
	playsound SFX_ENTER_DOOR
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	checkevent EVENT_SILPH_CO_ELEVATOR_UP
	iftrue .WarpTo3F
	warpfacing DOWN, SILPH_CO_1F, 14, 0
	applymovement PLAYER, SilphCoElevatorExitMovement
	end

.WarpTo3F:
	setmapscene SILPH_CO_3F, SCENE_SILPHCO3F_ELEVATOR_EXIT
	warpfacing DOWN, SILPH_CO_3F, 14, 0
	applymovement PLAYER, SilphCoElevatorExitMovement
	end

SilphCoElevatorPlayerEntersMovement:
	step UP
	turn_head DOWN
	step_end

SilphCoElevatorScientistMovement1:
	step LEFT
	turn_head DOWN
	step_end

SilphCoElevatorScientistMovement2:
	step UP
	step RIGHT
	turn_head DOWN
	step_end

SilphCoElevatorExitMovement:
	step DOWN
	step_end

SilphCoElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 1, 3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
