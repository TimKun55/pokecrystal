	object_const_def
	const LYRASHOUSE2F_LYRA
	const LYRASHOUSE2F_PIDGEOT
	const LYRASHOUSE2F_N64

LyrasHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

LyrasHouseLyraScript:
	jumptextfaceplayer LyrasHouseLyraText

LyrasHousePidgeotScript:
	opentext
	writetext LyrasHousePidgeotText
	cry PIDGEOT
	waitbutton
	refreshscreen
	pokepic PIDGEOT
	waitbutton
	closepokepic
	closetext
	end

LyrasHouseN64Script:
	jumptextfaceplayer LyrasHouseN64Text

LyrasHouseRadioScript:
	jumpstd Radio1Script

LyrasHousePCScript:
	jumptext LyrasHousePCText

PokemonJournalProfElmScript:
	jumptext PokemonJournalProfElmText

LyrasHouseLyraText:
	text "Lyra: Hi, <PLAYER>!"

	para "Hmm… My #mon"
	line "may be putting"
	cont "on some weight"
	cont "lately…"
	done

LyrasHousePidgeotText:
	text "Flappy: Pijiii!"
	done

PokemonJournalProfElmText:
	text "#mon Journal"

	para "Special Feature:"
	line "#mon Prof.Elm!"

	para "Prof.Elm was the"
	line "top student of"
	cont "Prof.Oak."

	para "They're said to"
	line "often argue about"
	cont "research."
	done

LyrasHousePCText:
	text "You shouldn't mess"
	line "with someone"
	cont "else's PC!"
	done

LyrasHouseN64Text:
	text "It's a limited-"
	line "edition Pikachu"
	cont "N64!"
	done

LyrasHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, LYRAS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, LyrasHousePCScript
	bg_event  5,  1, BGEVENT_READ, LyrasHouseRadioScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalProfElmScript

	def_object_events
	object_event  2,  3, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LyrasHouseLyraScript, EVENT_LYRA_IN_HER_ROOM
	object_event  3,  3, SPRITE_PIDGEOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LyrasHousePidgeotScript, EVENT_LYRA_IN_HER_ROOM
	object_event  6,  2, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, LyrasHouseN64Script, -1