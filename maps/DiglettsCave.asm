	object_const_def
	const DIGLETTSCAVE_HIKER

DiglettsCave_MapScripts:
	def_scene_scripts

	def_callbacks

DiglettsCaveHikerScript:
	jumptextfaceplayer DiglettsCaveHikerText

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE

DiglettsCaveHikerText:
	text "A bunch of Diglett"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 39, ROUTE_11, 1
	warp_event  5, 37, DIGLETTS_CAVE, 5
	warp_event 31,  5, ROUTE_2, 6
	warp_event 33,  3, DIGLETTS_CAVE, 6
	warp_event 33, 39, DIGLETTS_CAVE, 2
	warp_event  3,  3, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  6, 11, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	def_object_events
	object_event  3, 37, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCaveHikerScript, -1
