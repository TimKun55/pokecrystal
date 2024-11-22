	object_const_def
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route30BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MULCH_FROM_ROUTE_30_HOUSE
	iftrue .GotMulch
	writetext Route30BerrySpeechHouseMonEatBerriesText
	promptbutton
	verbosegiveitem MULCH, 3
	iffalse .NoRoom
	setevent EVENT_GOT_MULCH_FROM_ROUTE_30_HOUSE
.GotMulch:
	writetext Route30BerrySpeechHouseMulchText
	waitbutton
.NoRoom:
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route30BerrySpeechHouseMonEatBerriesText:
	text "You know, #mon"
	line "eat Berries."

	para "They take time to"
	line "grow back when"
	cont "they're picked,"

	para "but using Mulch"
	line "on the soil really"
	cont "speeds that up!"

	para "Here. I'll share"
	line "some with you!"
	done

Route30BerrySpeechHouseMulchText:
	text "I buy top-quality"
	line "Mulch in Goldenrod"
	cont "City."
	done

Route30BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 1
	warp_event  3,  7, ROUTE_30, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route30BerryHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1
