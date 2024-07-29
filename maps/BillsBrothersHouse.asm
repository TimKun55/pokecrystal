	object_const_def
	const BILLSBROTHERSHOUSE_POKEFAN_F
	const BILLSBROTHERSHOUSE_YOUNGSTER

BillsBrothersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsBrotherScript:
	jumptextfaceplayer BillsBrotherText

BillsBrothersHouseYoungsterScript:
	jumptextfaceplayer BillsBrothersHouseYoungsterText

BillsBrotherText:
	text "My grandpa is at "
	line "my brother Bill's"
	cont "on Cerulean Cape."
	done

BillsBrothersHouseYoungsterText:
	text "I saw these weird,"
	line "slow #mon on"
	cont "Cycling Road."
	done

BillsBrothersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 3
	warp_event  3,  7, FUCHSIA_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsBrotherScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsBrothersHouseYoungsterScript, -1
