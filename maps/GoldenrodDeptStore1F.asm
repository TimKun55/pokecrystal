	object_const_def
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore1FReceptionistText:
	text "Welcome to Golden-"
	line "rod Dept.Store."
	done

GoldenrodDeptStore1FGentlemanText:
	text "The Dept.Store"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "as Game Corner"
	line "prizes."
	done

GoldenrodDeptStore1FPokefanFText:
	text "I'm raring to shop"
	line "again today!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "Mum's good at"
	line "bargain hunting."

	para "She always buys"
	line "stuff at lower"
	cont "prices."
	done

GoldenrodDeptStore1FDirectoryText:
	text "1F Service Counter"

	para "2F Trainer's"
	line "   Market"

	para "3F Battle"
	line "   Collection"

	para "4F Medicine Box"

	para "5F TM Corner"

	para "6F Tranquil Square"

	para "Rooftop Lookout"
	done

GoldenrodDeptStore1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
