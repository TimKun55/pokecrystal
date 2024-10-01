	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3
	const ROUTE6_LADY_LIA
	const ROUTE6_GENTLEMAN
	const ROUTE6_YOUNGSTER
	const ROUTE6_POKE_BALL

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLadyLia:
	trainer LADY, LIA, EVENT_BEAT_LADY_LIA, LadyLiaSeenText, LadyLiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadyLiaAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanVirgil:
	trainer GENTLEMAN, VIRGIL, EVENT_BEAT_GENTLEMAN_VIRGIL, GentlemanVirgilSeenText, GentlemanVirgilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanVirgilAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperDale:
	trainer CAMPER, DALE, EVENT_BEAT_CAMPER_DALE, CamperDaleSeenText, CamperDaleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDaleAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6MaxPotion:
	itemball MAX_POTION

Route6PokefanMText:
	text "The road is closed"
	line "until the problem"

	para "at the Power Plant"
	line "is solved."
	done

Route6UndergroundPathSignText:
	text "Underground Path"

	para "Cerulean City -"
	line "Vermilion City"
	done

PokefanmRexSeenText:
	text "My Donphan is the"
	line "cutest in the"
	cont "world."
	done

PokefanmRexBeatenText:
	text "My Donphan!"
	done

PokefanmRexAfterBattleText:
	text "Look how adorable"
	line "my Donphan acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

PokefanmAllanSeenText:
	text "My Ursaring is"
	line "the cutest in the"
	cont "world."
	done

PokefanmAllanBeatenText:
	text "My Ursaring!"
	done

PokefanmAllanAfterBattleText:
	text "Look how adorable"
	line "my Ursaring acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

LadyLiaSeenText:
	text "You've beaten all"
	line "the Johto Gym"
	cont "Leaders?! Wow!"
	
	para "We just HAVE TO"
	line "battle!"
	done

LadyLiaBeatenText:
	text "So strong!"
	done

LadyLiaAfterBattleText:
	text "I'm trying to show"
	line "the people of"
	cont "Kanto how useful"
	
	para "fairy-types are!"
	
	para "2 of my sisters"
	line "are doing the"
	cont "same!"
	done

GentlemanVirgilSeenText:
	text "You there!"
	line "Shall we battle?"
	done

GentlemanVirgilBeatenText:
	text "Oh my!"
	done

GentlemanVirgilAfterBattleText:
	text "You're raising"
	line "your #mon well."
	done

CamperDaleSeenText:
	text "Training is"
	line "lots of fun!"
	done

CamperDaleBeatenText:
	text "You're strong."
	done

CamperDaleAfterBattleText:
	text "Eventually, I want"
	line "to challenge the"
	cont "Gym Leaders."
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  7,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 18,  4, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
	object_event 13, 18, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerLadyLia, -1
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGentlemanVirgil, -1
	object_event 18, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDale, -1
	object_event  1, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route6MaxPotion, EVENT_ROUTE_6_MAX_POTION
