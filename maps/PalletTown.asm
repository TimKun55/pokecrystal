	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "I'm raising #-"
	line "mon too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "Not only can you"
	line "store #mon in"
	cont "PCs, but you can"
	cont "store items, too!"
	done

PalletTownSignText:
	text "Pallet Town"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "Red's House"
	done

OaksLabSignText:
	text "Oak #mon"
	line "Research Lab"
	done

BluesHouseSignText:
	text "Blue's House"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, REDS_HOUSE_1F, 1
	warp_event 13,  7, BLUES_HOUSE, 1
	warp_event 12, 13, OAKS_LAB, 1

	def_coord_events

	def_bg_events
	bg_event  7, 11, BGEVENT_READ, PalletTownSign
	bg_event  3,  7, BGEVENT_READ, RedsHouseSign
	bg_event 13, 15, BGEVENT_READ, OaksLabSign
	bg_event 11,  7, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  3, 10, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 16, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
