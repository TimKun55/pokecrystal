	object_const_def
	const ROUTE3POKECENTER1F_NURSE
	const ROUTE3POKECENTER1F_CHANSEY
	const ROUTE3POKECENTER1F_FISHER
	const ROUTE3POKECENTER1F_COOLTRAINER_M

Route3Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route3Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route3Pokecenter1FChansey:
	jumpstd PokecenterChanseyScript

Route3Pokecenter1FFisherScript:
	jumptextfaceplayer Route3Pokecenter1FFisherText

Route3Pokecenter1FCooltrainerMScript:
	jumptextfaceplayer Route3Pokecenter1FCooltrainerMText

Route3Pokecenter1FFisherText:
	text "A #mon Center"
	line "near a cave?"

	para "That's super"
	line "convenient."
	done

Route3Pokecenter1FCooltrainerMText:
	text "I'm glad we can"
	line "use the Square as"

	para "a short-cut to get"
	line "through Mt.Moon."
	done
	
Route3Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_3, 2
	warp_event  6,  7, ROUTE_3, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FChansey, -1
	object_event  2,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FFisherScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FCooltrainerMScript, -1
