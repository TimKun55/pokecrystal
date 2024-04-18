	object_const_def
	const MADAMITEMSHOUSE_MADAM_ITEM

MadamItemsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MadamItem:
	faceplayer
	opentext
	pokemart MARTTYPE_MADAMITEMS, MART_BLACKTHORN_MADAM
	closetext
	end

MadamItemsHouseBookshelf:
	jumpstd DifficultBookshelfScript

MadamItemsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 8
	warp_event  3,  7, BLACKTHORN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MadamItemsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MadamItemsHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MadamItem, -1
