	object_const_def
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_CHANSEY
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

LavenderPokecenter1FChansey:
	jumpstd PokecenterChanseyScript

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderPokecenter1FYoungsterText_ReturnedMachinePart
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "To the north of"
	line "Lavender is Rock"

	para "Tunnel. Go through"
	line "it to get to the"
	cont "Power Plant."
	done

LavenderPokecenter1FTeacherText:
	text "There's a radio"
	line "program that plays"
	cont "# Flute music."

	para "Oh? Ah, your radio"
	line "needs an Expn Card"
	cont "to tune into it."
	done

LavenderPokecenter1FYoungsterText:
	text "If the Power Plant"
	line "isn't running, the"

	para "Magnet Train won't"
	line "run either…"

	para "It also means the"
	line "Radio Station"
	cont "can't broadcast…"
	done

LavenderPokecenter1FYoungsterText_ReturnedMachinePart:
	text "The Director of"
	line "the Radio Station"
	cont "sure was happy."

	para "He said they're"
	line "back on the air"

	para "because the Power"
	line "Plant is running"
	cont "smoothly again."
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, LAVENDER_TOWN, 1
	warp_event  6,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FChansey, -1
	object_event 10,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  9,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
