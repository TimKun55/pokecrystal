	object_const_def
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F
	const PLAYERSNEIGHBORSHOUSE_MAGNEMITE
	const PLAYERSNEIGHBORSHOUSE_PIKACHU

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersNeighborsDaughterScript:
	jumptextfaceplayer PlayersNeighborsDaughterText

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText
	
PlayersNeighborMagnemiteScript:
	opentext
	writetext PlayersNeighborMagnemiteText
	cry MAGNEMITE	
	waitbutton
	refreshscreen
	pokepic MAGNEMITE
	waitbutton
	closepokepic
	verbosegiveitem RARE_CANDY, 50
	closetext
	end
	
PlayersNeighborPikachuScript:
	opentext
	writetext PlayersNeighborPikachuText
	cry PIKACHU	
	waitbutton
	refreshscreen
	pokepic PIKACHU
	waitbutton
	closepokepic
	closetext
	end

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborsDaughterText:
	text "Evolved #mon"
	line "like Magneton and"
	cont "Piloswine are able"
	cont "to evolve again!"

	para "I was amazed by"
	line "Prof.Elm's find-"
	cont "ings."

	para "He's so famous for"
	line "his research on"
	cont "#mon evolution."

	para "…sigh…"

	para "I wish I could be"
	line "a researcher like"
	cont "him…"
	done

PlayersNeighborText:
	text "My daughter is"
	line "adamant about"

	para "becoming Prof."
	line "Elm's assistant."

	para "She really loves"
	line "#mon!"

	para "But then, so do I!"
	done
	
PlayersNeighborMagnemiteText:
	text "Magnemite: Mag!"
	line "MiteMagne!!"
	done

PlayersNeighborPikachuText:
	text "Pikachu: Pika! Pi!"
	done

PlayerNeighborRadioText1:
	text "Prof.Oak's #mon"
	line "Talk! Please tune"
	cont "in next time!"
	done

PlayerNeighborRadioText2:
	text "#mon Channel!"
	done

PlayerNeighborRadioText3:
	text "This is DJ Mary,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#mon!"
	line "#mon Channel…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  5,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	object_event  4,  5, SPRITE_MAGNEMITE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, PlayersNeighborMagnemiteScript, -1
	object_event  4,  1, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersNeighborPikachuScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
