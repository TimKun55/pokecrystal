	object_const_def
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_CHANSEY
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SaffronPokecenter1FChansey:
	jumpstd PokecenterChanseyScript

SaffronPokecenter1FTeacherScript:
	jumptextfaceplayer SaffronPokecenter1FTeacherText

SaffronPokecenter1FHikerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetextend SaffronPokecenter1FHikerText

.SolvedKantoPowerCrisis:
	writetextend SaffronPokecenter1FHikerReturnedMachinePartText

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "What are Johto's"
	line "#mon Centers"
	cont "like?"

	para "…Oh, I see. So"
	line "they're not much"
	cont "different from the"
	cont "ones in Kanto."

	para "I can go to Johto"
	line "without worrying,"
	cont "then!"
	done

SaffronPokecenter1FHikerText:
	text "I just happened to"
	line "come through Rock"
	cont "Tunnel."

	para "There was some"
	line "commotion at the"
	cont "Power Plant."
	done

SaffronPokecenter1FHikerReturnedMachinePartText:
	text "Caves can collapse"
	line "easily."

	para "As a pro Hiker,"
	line "it's important to"
	cont "always be prepared"
	cont "and ready to help"
	cont "others."
	done

SaffronPokecenter1FYoungsterText:
	text "Silph Co.'s Head"
	line "Office and the"
	cont "Magnet Train Sta-"
	cont "tion--they're the"
	cont "places to see in"
	cont "Saffron."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, SAFFRON_CITY, 4
	warp_event  6,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FChansey, -1
	object_event  2,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  9,  4, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FHikerScript, -1
	object_event 11,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
