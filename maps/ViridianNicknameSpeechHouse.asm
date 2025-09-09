	object_const_def
	const VIRIDIANNICKNAMESPEECHHOUSE_POKEFAN_M
	const VIRIDIANNICKNAMESPEECHHOUSE_LASS
	const VIRIDIANNICKNAMESPEECHHOUSE_KWAXS
	const VIRIDIANNICKNAMESPEECHHOUSE_RATTEY

ViridianNicknameSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianNicknameSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText

ViridianNicknameSpeechHouseLassScript:
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText

Kwaxs:
	opentext
	writetext KwaxsText
	cry FARFETCH_D
	waitbutton
	refreshscreen
	pokepic FARFETCH_D
	waitbutton
	closepokepic
	closetext
	end

Rattey:
	opentext
	writetext RatteyText
	cry RATTATA
	waitbutton
	refreshscreen
	pokepic RATTATA
	waitbutton
	closepokepic
	closetext
	end

ViridianNicknameSpeechHousePokefanMText:
	text "Do you put a lot"
	line "of thought into"
	cont "naming your"
	cont "#mon?"

	para "Giving them good"
	line "nicknames adds to"
	cont "the fun of trading"
	cont "with others."
	done

ViridianNicknameSpeechHouseLassText:
	text "They're Kwaxs--"
	line "a Farfetch'd--and"
	cont "Rattey--a Rattata."
	done

KwaxsText:
	text "Kwaxs: Farrfarr!"
	done

RatteyText:
	text "Rattey: Kikiii!"
	done

ViridianNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 2
	warp_event  3,  7, VIRIDIAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePokefanMScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_FARFETCH_D, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kwaxs, -1
	object_event  6,  3, SPRITE_RATTATA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Rattey, -1
