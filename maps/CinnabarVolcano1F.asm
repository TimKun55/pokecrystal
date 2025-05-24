	object_const_def
	const CINNABARVOLCANO1F_OFFICER

CinnabarVolcano1F_MapScripts:
	def_scene_scripts
	scene_script CinnabarVolcano1FForcedToLeaveScene, SCENE_CINNABARVOLCANO1F_FORCED_TO_LEAVE
	scene_script CinnabarVolcano1FNoopScene,          SCENE_CINNABARVOLCANO1F_NOOP

	def_callbacks
	
CinnabarVolcano1FForcedToLeaveScene:
	applymovement PLAYER, CinnabarVolcano1FPlayerStepUpMovement
	applymovement CINNABARVOLCANO1F_OFFICER, CinnabarVolcano1FOfficerSlowStepDownMovement
	opentext
	writetext CinnabarVolcano1FClosedText
	waitbutton
	closetext
	follow PLAYER, CINNABARVOLCANO1F_OFFICER
	applymovement PLAYER, CinnabarVolcano1FPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp CINNABAR_ISLAND, 10, 15
	end

CinnabarVolcano1FNoopScene:
	end

CinnabarVolcano1FPlayerStepUpMovement:
	step UP
	step_end

CinnabarVolcano1FOfficerSlowStepDownMovement:
	slow_step DOWN
	step_end

CinnabarVolcano1FPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end
	
CinnabarVolcano1FClosedText:
	text "I'm so sorry, but"
	line "the Volcano is"
	
	para "off-limits to the"
	line "general public."

	para "You'll have"
	line "to leave."
	done
	
CinnabarVolcano1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 13, CINNABAR_ISLAND, 2
	warp_event  9,  5, CINNABAR_VOLCANO_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CINNABAR_VOLCANO_1F_OFFICER
	