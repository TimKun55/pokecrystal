	object_const_def
;	const SEAFOAMISLANDSB2F_BEAUTY
;	const SEAFOAMISLANDSB2F_ROCKER1
;	const SEAFOAMISLANDSB2F_ROCKER2
	const SEAFOAMISLANDSB2F_POKE_BALL

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB2FWaterStone:
	itemball WATER_STONE

SeafoamIslandsB2FHiddenPearl1:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_1

SeafoamIslandsB2FHiddenPearl2:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_2

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 17, SEAFOAM_ISLANDS_B1F, 2
	warp_event  9,  9, SEAFOAM_ISLANDS_B1F, 3
	warp_event  5, 13, SEAFOAM_ISLANDS_B1F, 4
	warp_event  9, 15, SEAFOAM_ISLANDS_B1F, 5
	warp_event 27,  7, SEAFOAM_ISLANDS_B3F, 1
	warp_event 14,  7, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25, 13, SEAFOAM_ISLANDS_B3F, 3
	warp_event  3, 17, SEAFOAM_ISLANDS_B3F, 4

	def_coord_events

	def_bg_events
	bg_event  7,  8, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl1
	bg_event 23,  5, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl2

	def_object_events
	object_event 11, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB2FWaterStone, EVENT_SEAFOAM_ISLANDS_B2F_WATER_STONE
	