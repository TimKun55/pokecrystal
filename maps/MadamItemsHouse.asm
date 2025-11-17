	object_const_def
	const MADAMITEMSHOUSE_MADAM_ITEM
	const MADAMITEMSHOUSE_YOUNGSTER

MadamItemsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MadamItem:
	faceplayer
	opentext
	pokemart MARTTYPE_MADAMITEMS, MART_BLACKTHORN_MADAM
	closetext
	end

MadamItemsHouseYoungsterScript:
	jumptextfaceplayer MadamItemsHouseYoungsterText

MadamItemsHouseCabinet:
	jumptext MadamItemsHouseCabinetText

MadamItemsHouseBookshelfLeft:
	jumptext MadamItemsHouseBookshelfLeftText

MadamItemsHouseBookshelfRight:
	jumptext MadamItemsHouseBookshelfRightText

MadamItemsHouseYoungsterText:
	text "Madam Items is"
	line "really nice!"
	
	para "I didn't know what"
	line "items to use to"
	cont "evolve my #mon,"
	cont "so she wrote it"
	cont "all down for me!"
	
	para "Have a look at the"
	line "bookshelf if you"
	cont "need a reminder."
	done

MadamItemsHouseCabinetText:
	text "Lot's of shiny and"
	line "cool-looking items"
	cont "are on display."
	done

MadamItemsHouseBookshelfLeftText:
	text "Kingdra needs"
	line "a Dragon Scale."

	para "Scizor and Steelix"
	line "need a Metal Coat."
	done

MadamItemsHouseBookshelfRightText:
	text "Porygon-Z needs"
	line "an Up-Grade, but"
	cont "it doesn't seem"
	cont "to be stable…"

	para "Politoed and"
	line "Slowking need a"
	cont "King's Rock."
	done

MadamItemsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, BLACKTHORN_CITY, 8
	warp_event  4,  7, BLACKTHORN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_READ, MadamItemsHouseCabinet
	bg_event  6,  1, BGEVENT_READ, MadamItemsHouseBookshelfLeft
	bg_event  7,  1, BGEVENT_READ, MadamItemsHouseBookshelfRight

	def_object_events
	object_event  3,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MadamItem, -1
	object_event  7,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MadamItemsHouseYoungsterScript, -1
