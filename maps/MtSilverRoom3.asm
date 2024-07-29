	object_const_def
	const MTSILVERROOM3_RED
	const MTSILVERROOM3_PIKACHU

MtSilverRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear MTSILVERROOM3_RED
	disappear MTSILVERROOM3_PIKACHU
	pause 15
	special FadeInFromBlack
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
MtSilverRoom3Pikachu:
	opentext
	writetext PikachuText
	cry PIKACHU
	waitbutton
	refreshscreen
	pokepic PIKACHU
	waitbutton
	closepokepic
	closetext
	end

RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "<……>"
	line "<……>"
	done
	
PikachuText:
	text "Pikachu: Piii!!"
	done

MtSilverRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, MT_SILVER_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
	object_event 10, 10, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MtSilverRoom3Pikachu, EVENT_RED_IN_MT_SILVER
