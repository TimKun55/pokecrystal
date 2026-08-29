	object_const_def
	const VIRIDIANTRAINERSPEECHHOUSE_POKEFAN_M
	const VIRIDIANTRAINERSPEECHHOUSE_YOUNGSTER
	const VIRIDIANTRAINERSPEECHHOUSE_BULBASAUR

ViridianTrainerSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianTrainerSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianTrainerSpeechHousePokefanMText

ViridianTrainerSpeechHouseYoungsterScript:
	jumptextfaceplayer ViridianTrainerSpeechHouseYoungsterText

ViridianTrainerSpeechHouseBulbasaurScript:
	opentext
	writetext BulbasaurText
	cry BULBASAUR
	waitbutton
	refreshscreen
	pokepic BULBASAUR
	waitbutton
	closepokepic
	closetext
	end

ViridianTrainerSpeechHousePokefanMText:
	text "My son went to"
	line "Professor Oak for"
	cont "a #mon of his"
	cont "very own."

	para "It's certainly"
	line "livened things up"
	cont "around here."
	done

ViridianTrainerSpeechHouseYoungsterText:
	text "I love Bulbasaur!"
	line "They're so cute!"
	done

BulbasaurText:
	ntag " Bulbasaur "
	text "Bulba!"
	line "Bulbasaur!"
	done

ViridianTrainerSpeechHouse_MapEvents:

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 8
	warp_event  3,  7, VIRIDIAN_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianTrainerSpeechHousePokefanMScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianTrainerSpeechHouseYoungsterScript, -1
	object_event  5,  2, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianTrainerSpeechHouseBulbasaurScript, -1
