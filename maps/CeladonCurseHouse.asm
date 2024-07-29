	object_const_def
	const CELADONCURSEHOUSE_PHARMACIST

CeladonCurseHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonCurseHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonCurseHousePharmacistIntroText
	promptbutton
	checktime NITE
	iftrue .Night
	writetext CeladonCurseHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonCurseHousePharmacistStoryText
	promptbutton
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonCurseHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonCurseHousePharmacistIntroText:
	text "Let me recount a"
	line "terrifying tale…"
	done

CeladonCurseHousePharmacistNotNightText:
	text "Then again, it's"
	line "not as scary while"

	para "it's still light"
	line "outside."

	para "Come back after"
	line "sunset, OK?"
	done

CeladonCurseHousePharmacistStoryText:
	text "Once upon a time,"
	line "there was a little"

	para "boy who was given"
	line "a new Bicycle…"

	para "He wanted to try"
	line "it right away…"

	para "He was having so"
	line "much fun that he"

	para "didn't notice the"
	line "sun had set…"

	para "While riding home"
	line "in the pitch-black"

	para "night, the bike"
	line "suddenly slowed!"

	para "The pedals became"
	line "heavy!"

	para "When he stopped"
	line "pedaling, the bike"

	para "began slipping"
	line "backwards!"

	para "It was as if the"
	line "bike were cursed"

	para "and trying to drag"
	line "him into oblivion!"

	para "…"

	para "…"

	para "SHRIEEEEK!"

	para "The boy had been"
	line "riding uphill on"
	cont "Cycling Road!"

	para "…"
	line "Ba-dum ba-dum!"

	para "For listening so"
	line "patiently, you may"
	cont "take this--TM03!"
	done

CeladonCurseHousePharmacistCurseText:
	text "TM03 is Curse."

	para "It's a terrifying"
	line "move that slowly"

	para "whittles down the"
	line "victim's HP."
	done

CeladonCurseHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_CITY, 13
	warp_event  3,  7, CELADON_CITY, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCurseHousePharmacistScript, -1
