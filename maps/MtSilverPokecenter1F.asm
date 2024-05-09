	object_const_def
	const MTSILVERPOKECENTER1F_NURSE
	const MTSILVERPOKECENTER1F_CHANSEY
	const MTSILVERPOKECENTER1F_GRANNY

MtSilverPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MtSilverPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MtSilverPokecenter1FChanseyScript:
	jumpstd PokecenterChanseyScript

MtSilverPokecenter1FGrannyScript:
	jumptextfaceplayer MtSilverPokecenter1FGrannyText

MtSilverPokecenter1FGrannyText:
	text "Trainers who seek"
	line "power climb MT."

	para "SILVER despite its"
	line "many dangers…"

	para "With their trusted"
	line "#MON, they must"

	para "feel they can go"
	line "anywhere…"
	done

MtSilverPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, MT_SILVER_OUTSIDE, 1
	warp_event  6,  7, MT_SILVER_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MtSilverPokecenter1FChanseyScript, -1
	object_event  8,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPokecenter1FGrannyScript, -1
