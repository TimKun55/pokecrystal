	object_const_def
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY

MrFujisHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	refreshscreen
	pokepic PSYDUCK
	waitbutton
	closepokepic
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	refreshscreen
	pokepic NIDORINO
	waitbutton
	closepokepic
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	refreshscreen
	pokepic PIDGEY
	waitbutton
	closepokepic
	closetext
	end

MrFujisHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrFujisHouseSuperNerdText:
	text "Mr.Fuji does live"
	line "here, but he's not"
	cont "home now."

	para "He should be at"
	line "the Soul House."
	done

MrFujisHouseLassText:
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #mon."

	para "Grandpa takes in"
	line "the poor homeless"

	para "#mon and takes"
	line "care of them."
	done

MrFujisPsyduckText:
	text "Psyduck: Gu-guwa?"
	done

MrFujisNidorinoText:
	text "Nidorino: Gyun!"
	done

MrFujisPidgeyText:
	text "Pidgey: Pijji!"
	done

MrFujisHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 2
	warp_event  3,  7, LAVENDER_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, MrFujisHouseBookshelf
	bg_event  5,  1, BGEVENT_READ, MrFujisHouseBookshelf

	def_object_events
	object_event  6,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  8,  4, SPRITE_PSYDUCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_NIDORINO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_PIDGEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
