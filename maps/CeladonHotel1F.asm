	object_const_def
	const CELADONHOTEL1F_GRAMPS
	const CELADONHOTEL1F_GENTLEMAN
	const CELADONHOTEL1F_BEAUTY
	const CELADONHOTEL1F_TEACHER
	const CELADONHOTEL1F_OFFICER

CeladonHotel1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonHotel1FGrampsScript:
	jumptextfaceplayer CeladonHotel1FGrampsText

CeladonHotel1FGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_CELADON_HOTEL_SCOPE_LENS
	iftrue .NoItem
	writetext CeladonHotel1FGentlemanLensBeforeText
	promptbutton
	verbosegiveitem SCOPE_LENS
	iffalse .NoRoom
	setevent EVENT_CELADON_HOTEL_SCOPE_LENS
.NoItem
	writetextend CeladonHotel1FGentlemanLensAfterText

.NoRoom
	writetextend CeladonHotel1FGentlemanNoRoomText

CeladonHotel1FBeautyScript:
	jumptextfaceplayer CeladonHotel1FBeautyText

CeladonHotel1FTeacherScript:
	jumptextfaceplayer CeladonHotel1FTeacherText

CeladonHotel1FSign1:
	jumptext CeladonHotel1FSign1Text

CeladonHotel1FSign2:
	jumptext CeladonHotel1FSign2Text

CeladonHotel1FElevator:
	jumptext CeladonHotel1FElevatorText

CeladonHotel1FSign3:
	jumptext CeladonHotel1FSign3Text

CeladonHotel1FGrampsText:
	text "#mon? No, this"
	line "is a hotel for"
	cont "people."

	para "We're full up."
	done

CeladonHotel1FSign1Text:
	text "Celadon Hotel"

	para "Enjoy your stay!"
	done

CeladonHotel1FSign2Text:
	text "Hotel Pool"

	para "Please wear a swim"
	line "cap in the water."
	done

CeladonHotel1FElevatorText:
	text "Looks like a"
	line "Guest Card is"
	cont "needed."
	done

CeladonHotel1FSign3Text:
	text "Suites"
	line "Upstairs"
	done

CeladonHotel1FGentlemanLensBeforeText:
	text "Hello, young one!"

	para "You seem like a"
	line "strong trainer."
	
	para "I don't battle"
	line "anymore, but I"
	cont "think you may get"
	cont "some good use"
	cont "out of this."
	done

CeladonHotel1FGentlemanLensAfterText:
	text "The Scope Lens"
	line "increases the"
	cont "chance of critical"
	cont "hits."
	
	para "Very useful if the"
	line "opponent has"
	cont "raised their stats"
	cont "because critical"
	cont "hits ignore stat"
	cont "boosts."
	done

CeladonHotel1FGentlemanNoRoomText:
	text "Oh, you have no"
	line "room for this."
	done

CeladonHotel1FBeautyText:
	text "This is my first"
	line "trip to Kanto."

	para "There's so much to"
	line "see in Celadon!"
	done

CeladonHotel1FTeacherText:
	text "Ahh, I really"
	line "needed this"
	cont "vacation!"
	done

CeladonHotel1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 16
	warp_event  4,  7, CELADON_CITY, 16
	warp_event 12,  0, CELADON_HOTEL_POOL, 1

	def_coord_events

	def_bg_events
	bg_event  7,  2, BGEVENT_READ, CeladonHotel1FSign1
	bg_event 13,  0, BGEVENT_READ, CeladonHotel1FSign2
	bg_event 16,  0, BGEVENT_READ, CeladonHotel1FElevator
	bg_event 17,  0, BGEVENT_READ, CeladonHotel1FSign3

	def_object_events
	object_event  3,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHotel1FGrampsScript, -1
	object_event 14,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHotel1FGentlemanScript, -1
	object_event 11,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHotel1FBeautyScript, -1
	object_event  9,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHotel1FTeacherScript, -1
