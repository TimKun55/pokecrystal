	object_const_def
	const MTSILVERPOKECENTER1F_NURSE
	const MTSILVERPOKECENTER1F_GRANNY

MtSilverPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MtSilverPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

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
	warp_event  3,  7, MT_SILVER_OUTSIDE, 1
	warp_event  4,  7, MT_SILVER_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPokecenter1FGrannyScript, -1
