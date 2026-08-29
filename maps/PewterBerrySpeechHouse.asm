	object_const_def
	const PEWTERBERRYSPEECHHOUSE_HEX_MANIAC

PewterBerrySpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PewterBerrySpeechHouseHexManiacScript:
	faceplayer
	opentext
	writetext PewterBerrySpeechHouseHexManiacText
	waitbutton
	random 24
	ifequal 1, .GiveBerry
	closetext
	end

.GiveBerry:
	writetext PewterBerrySpeechHouseHexManiacGiveBerryText
	waitbutton
	verbosegiveitem SITRUS_BERRY, 5
	iffalse .NoRoom
	writetextend PewterBerrySpeechHouseHexManiacUseWellText

.NoRoom:
	writetextend PewterBerrySpeechHouseHexManiacNoRoomText

PewterBerrySpeechHouseHexManiacText:
	text "My husband is"
	line "always in the City"
	cont "garden taking care"
	cont "of the flowers."
	
	para "Berries are better"
	line "than flowers!"
	
	para "Some can heal"
	line "status problems,"
	
	para "one restores"
	line "Power Points,"
	
	para "And some heal HP."
	line "Those are my"
	cont "favourite kind!"
	done

PewterBerrySpeechHouseHexManiacGiveBerryText:
	text "Like these;"
	line "take these."
	done

PewterBerrySpeechHouseHexManiacUseWellText:
	text "Use them well!"
	done

PewterBerrySpeechHouseHexManiacNoRoomText:
	text "Oh, you have no"
	line "room for them."
	
	para "Oh well!"
	line "Maybe next time."
	done

PewterBerrySpeechHouse_MapEvents:

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 7
	warp_event  3,  7, PEWTER_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterBerrySpeechHouseHexManiacScript, -1
