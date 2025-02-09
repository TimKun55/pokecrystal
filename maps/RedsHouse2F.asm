	object_const_def
	const REDSHOUSE2F_CRYSTALTROPHY

RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsCrystalTrophyScript:
	jumptext RedsCrystalTrophyText

RedsHouse2FTVScript:
	jumptext RedsHouse2FTVText

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsCrystalTrophyText:
	text "A very impressive"
	line "trophy."
	
	para "There is no name"
	line "engraved on it."
	done

RedsHouse2FTVText:
	text "It's displaying"
	line "what's on the"
	cont "console."
	done

RedsHouse2FN64Text:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

RedsHouse2FPCText:
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  4, BGEVENT_READ, RedsHouse2FTVScript
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FN64Script
	bg_event  0,  1, BGEVENT_READ, RedsHouse2FPCScript

	def_object_events
	object_event  2,  1, SPRITE_TROPHY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RedsCrystalTrophyScript, EVENT_REDS_HOUSE_2F_TROPHY
