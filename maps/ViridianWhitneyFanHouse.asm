	object_const_def
	const VIRIDIANWHITNEYFANHOUSE_LASS
	const VIRIDIANWHITNEYFANHOUSE_DOLL

ViridianWhitneyFanHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianWhitneyFanHouseLassScript:
	jumptextfaceplayer ViridianWhitneyFanHouseLassText

ViridianWhitneyFanHouseDollScript:
	jumptextfaceplayer ViridianWhitneyFanHouseDollText

ViridianWhitneyFanHouseLassText:
	text "I absolutely love"
	line "Goldenrod City's"
	cont "Gym Leader!"

	para "I hear she's not"
	line "only cute, but"
	cont "she's tough, too!"
	done

ViridianWhitneyFanHouseDollText:
	text "It's a cute"
	line "Clefairy Doll."
	done

ViridianWhitneyFanHouse_MapEvents:

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 9
	warp_event  3,  7, VIRIDIAN_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianWhitneyFanHouseLassScript, -1
	object_event  4,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianWhitneyFanHouseDollScript, -1
