	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_HEX
	iftrue .GotTM11
	writetext SoulHouseGrannyOldTrainerText
	promptbutton
	verbosegiveitem TM_HEX
	setevent EVENT_GOT_TM_HEX
	writetextend SoulHouseGrannyOldHexText

.GotTM11
	writetextend SoulHouseGrannyText
	
MrFujiText:
	text "Mr.Fuji: Welcome."

	para "Hmm… You appear to"
	line "be raising your"
	cont "#mon in a kind"
	cont "and loving manner."

	para "#mon lovers"
	line "come here to pay"
	cont "their respects to"
	cont "departed #mon."

	para "Please offer con-"
	line "dolences for the"
	cont "souls of the de-"
	cont "parted #mon."

	para "I'm sure that will"
	line "make them happy."
	done

SoulHouseTeacherText:
	text "There are other"
	line "graves of #mon"
	cont "here, I think."

	para "There are many"
	line "chambers that only"
	cont "Mr.Fuji may enter."
	done

SoulHouseLassText:
	text "I came with my mum"
	line "to visit #mon"
	cont "graves…"
	done

SoulHouseGrannyOldTrainerText:
	text "My #mon and"
	line "I trained all"
	cont "the time."

	para "This was part of"
	line "our favourite"
	cont "stratergy."

	para "You can"
	line "have this."
	done

SoulHouseGrannyOldHexText:
	text "Hex can do some"
	line "nasty damage if"
	cont "the opponent has a"
	cont "status condition"
	cont "like Psn or Brn."
	done

SoulHouseGrannyText:
	text "The #mon that"
	line "lived with me…"

	para "I loved them like"
	line "my grandchildren…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, LAVENDER_TOWN, 6
	warp_event  5,  9, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
