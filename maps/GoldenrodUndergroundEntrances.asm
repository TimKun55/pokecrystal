	object_const_def
	const GOLDENRODUNDERGROUNDENTRANCES_TEACHER
	const GOLDENRODUNDERGROUNDENTRANCES_SUPER_NERD

GoldenrodUndergroundEntrances_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodUndergroundEntrancesSuperNerdScript:
	jumptextfaceplayer GoldenrodUndergroundEntrances_SuperNerdText

GoldenrodUndergroundEntrancesTeacherScript:
	jumptextfaceplayer GoldenrodUndergroundEntrances_TeacherText

GoldenrodUndergroundEntrances_SuperNerdText:
	text "I was challenged"
	line "to a battle down-"
	cont "stairs."

	para "It's rough down"
	line "there. You'd"
	cont "better be careful."
	done

GoldenrodUndergroundEntrances_TeacherText:
	text "There are some"
	line "shops downstairs…"

	para "But there are"
	line "also trainers."

	para "I'm scared to go"
	line "down there."
	done

GoldenrodUndergroundEntrances_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  5, GOLDENROD_UNDERGROUND, 1
	warp_event  4,  9, GOLDENROD_CITY, 18
	warp_event  5,  9, GOLDENROD_CITY, 18
	warp_event  4, 19, GOLDENROD_UNDERGROUND, 2
	warp_event  4, 23, GOLDENROD_CITY, 19
	warp_event  5, 23, GOLDENROD_CITY, 19

	def_coord_events

	def_bg_events

	def_object_events
	object_event 8, 6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundEntrancesTeacherScript, -1
	object_event 1, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundEntrancesSuperNerdScript, -1
