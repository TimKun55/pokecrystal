	object_const_def
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerLassConnie:
	trainer LASS, CONNIE, EVENT_BEAT_LASS_CONNIE, LassConnieSeenText, LassConnieBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext LassConnieAfterBattleText

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SailorKentAfterBattleText

SailorKentSeenText:
	text "Jasmine must be"
	line "worried sick about"
	cont "the #mon here."

	para "She won't even"
	line "smile these days."
	done

SailorKentBeatenText:
	ntag " Kent "
	text "I can't manage a"
	line "smile either…"
	done

SailorKentAfterBattleText:
	ntag " Kent "
	text "Speaking of sick,"
	line "I've heard there's"
	cont "a good Pharmacy in"
	cont "Cianwood."
	done

LassConnieSeenText:
	text "Jasmine is this"
	line "city's Gym Leader."

	para "I mean to bring"
	line "her back with me."

	para "Nobody had better"
	line "get in my way!"
	done

LassConnieBeatenText:
	ntag " Connie "
	text "Aaack! My #mon!"
	done

LassConnieAfterBattleText:
	ntag " Connie "
	text "Right. Anybody"
	line "would be worried"
	cont "if his or her own"
	cont "#mon were hurt."

	para "I'll pray for the"
	line "#mon here, so"
	cont "Jasmine can come"
	cont "back to the Gym."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
