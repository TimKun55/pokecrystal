	object_const_def
	const OLIVINELIGHTHOUSEELEVATOR_SAILOR

OlivineLighthouseElevator_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouseElevatorSailorScript:
	faceplayer
	opentext
	elevator OlivineLighthouseElevatorData
	closetext
	turnobject OLIVINELIGHTHOUSEELEVATOR_SAILOR, UP
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done:
	end

OlivineLighthouseElevatorData:
	db 2 ; floors
	elevfloor FLOOR_1F, 4, OLIVINE_LIGHTHOUSE_1F
	elevfloor FLOOR_6F, 2, OLIVINE_LIGHTHOUSE_6F
	db -1 ; end

OlivineLighthouseElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  3, OLIVINE_LIGHTHOUSE_1F, -1
	warp_event  2,  3, OLIVINE_LIGHTHOUSE_1F, -1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseElevatorSailorScript, -1
