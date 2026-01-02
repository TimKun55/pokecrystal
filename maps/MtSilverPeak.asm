	object_const_def
	const MTSILVERPEAK_RED
	const MTSILVERPEAK_PIKACHU
	const MTSILVERPEAK_ROCK1
	const MTSILVERPEAK_ROCK2
	const MTSILVERPEAK_ROCK3
	const MTSILVERPEAK_POKE_BALL1
	const MTSILVERPEAK_POKE_BALL2

MtSilverPeak_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_RED
	iftrue .RedRematch
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	setevent EVENT_BEAT_RED
.FinishBattle:
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear MTSILVERPEAK_RED
	disappear MTSILVERPEAK_PIKACHU
	pause 15
	special FadeInFromBlack
	pause 30
	special HealParty
	refreshscreen
	credits
	end

.RedRematch:
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	sjump .FinishBattle
	
MtSilverPeakPikachu:
	opentext
	writetext PikachuText
	cry PIKACHU_P
	waitbutton
	refreshscreen
	pokepic PIKACHU_P
	waitbutton
	closepokepic
	closetext
	end

MtSilverPeakRock:
	jumpstd SmashRockScript

MtSilverPeakMaxRevive:
	itemball MAX_REVIVE

MtSilverPeakMaxFullRestore:
	itemball FULL_RESTORE

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

MtSilverPeak_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 49, MT_SILVER_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15,  9, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
	object_event 16,  9, SPRITE_PIKACHU_P, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MtSilverPeakPikachu, EVENT_RED_IN_MT_SILVER
	object_event 21, 44, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPeakRock, -1
	object_event  8, 46, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPeakRock, -1
	object_event 20, 45, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverPeakRock, -1
	object_event 23, 42, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverPeakMaxRevive, EVENT_MT_SILVER_PEAK_MAX_REVIVE
	object_event  6, 40, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtSilverPeakMaxFullRestore, EVENT_MT_SILVER_PEAK_FULL_RESTORE
