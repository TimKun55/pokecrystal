	object_const_def
	const FIGHTINGDOJO_BLACK_BELT1
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3
	const FIGHTINGDOJO_BLACK_BELT4
	const FIGHTINGDOJO_BLACK_BELT5
	const FIGHTINGDOJO_BLACK_BELT6
	const FIGHTINGDOJO_BLACK_BELT7
	const FIGHTINGDOJO_POKE_BALL

FightingDojo_MapScripts:
	def_scene_scripts

	def_callbacks

FightingDojoBlackBelt:
	jumptextfaceplayer FightingDojoBlackBeltText

FightingDojoHPBlackBelt:
	faceplayer
	opentext
	writetext BlackbeltKonHPSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltKonWinLossText, 0
	loadtrainer BLACKBELT_T, KON
	startbattle
	reloadmapafterbattle
	opentext
	writetextend BlackbeltKonAfterBattleText

.NoBattle
	writetextend BlackbeltKonTrainAnytimeText

FightingDojoAttackBlackBelt:
	faceplayer
	opentext
	writetext BlackbeltBoAttackSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltBoWinLossText, 0
	loadtrainer BLACKBELT_T, BO
	startbattle
	reloadmapafterbattle
	opentext
	writetextend BlackbeltBoAfterBattleText

.NoBattle
	writetextend BlackbeltBoTrainAnytimeText

FightingDojoDefenseBlackBelt:
	faceplayer
	opentext
	writetext BlackbeltTomoDefenseSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltTomoWinLossText, 0
	loadtrainer BLACKBELT_T, TOMO
	startbattle
	reloadmapafterbattle
	opentext
	writetextend BlackbeltTomoAfterBattleText

.NoBattle
	writetextend BlackbeltTomoTrainAnytimeText

FightingDojoSpAtkBlackBelt:
	faceplayer
	opentext
	writetext BlackbeltChuuSpAtkSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltChuuWinLossText, 0
	loadtrainer BLACKBELT_T, CHUU
	startbattle
	reloadmapafterbattle
	opentext
	writetextend BlackbeltChuuAfterBattleText

.NoBattle
	writetextend BlackbeltChuuTrainAnytimeText

FightingDojoSpDefBlackBelt:
	faceplayer
	opentext
	writetext BlackbeltShinSpDefSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltShinWinLossText, 0
	loadtrainer BLACKBELT_T, SHIN
	startbattle
	reloadmapafterbattle
	opentext
	writetextend BlackbeltShinAfterBattleText

.NoBattle
	writetextend BlackbeltShinTrainAnytimeText

FightingDojoSpeedBlackBelt:
	faceplayer
	opentext
	writetext BlackbeltAanSpeedSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltAanWinLossText, 0
	loadtrainer BLACKBELT_T, AAN
	startbattle
	reloadmapafterbattle
	opentext
	writetextend BlackbeltAanAfterBattleText

.NoBattle
	writetextend BlackbeltAanTrainAnytimeText

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

FightingDojoBlackBeltText:
	text "Hello!"

	para "Karate King, the"
	line "Fighting Dojo's"
	cont "master, is in a"
	cont "cave in Johto for"
	cont "training."
	
	para "We've set up a"
	line "training routine"
	cont "for helping #-"
	cont "mon get stronger."
	done

BlackbeltKonHPSpecialistText:
	ntag " Kon "
	text "I'm Kon and I've"
	text "been training"
	line "#mon to boost"
	cont "their HP stat!"
	
	para "Shall we battle?"
	done

BlackbeltKonWinLossText:
	ntag " Kon "
	text "Out healthed!"
	done

BlackbeltKonAfterBattleText:
	ntag " Kon "
	text "Come back for more"
	line "attack training."
	done

BlackbeltKonTrainAnytimeText:
	ntag " Kon "
	text "Come back if you"
	line "want to train."
	done

BlackbeltBoAttackSpecialistText:
	ntag " Bo "
	text "I'm Bo and I've"
	text "been training"
	line "#mon to boost"
	cont "their Atk stat!"
	
	para "Shall we battle?"
	done

BlackbeltBoWinLossText:
	ntag " Bo "
	text "Out attacked!"
	done

BlackbeltBoAfterBattleText:
	ntag " Bo "
	text "Come back for more"
	line "attack training."
	done

BlackbeltBoTrainAnytimeText:
	ntag " Bo "
	text "Come back if you"
	line "want to train."
	done

BlackbeltTomoTrainAnytimeText:
	ntag " Tomo "
	text "I'm Tomo and I've"
	text "been training"
	line "#mon to boost"
	cont "their Def stat!"
	
	para "Shall we battle?"
	done

BlackbeltTomoAfterBattleText:
	ntag " Tomo "
	text "Out defended!"
	done

BlackbeltTomoWinLossText:
	ntag " Tomo "
	text "Come back for more"
	line "attack training."
	done

BlackbeltTomoDefenseSpecialistText:
	ntag " Tomo "
	text "Come back if you"
	line "want to train."
	done

BlackbeltChuuSpAtkSpecialistText:
	ntag " Chuu "
	text "I'm Chuu and I've"
	line "been training"
	line "#mon to boost"
	cont "their Sp.Atk stat!"
	
	para "Shall we battle?"
	done

BlackbeltChuuWinLossText:
	ntag " Chuu "
	text "Overpowered!"
	done

BlackbeltChuuAfterBattleText:
	ntag " Chuu "
	text "Come back for more"
	line "attack training."
	done

BlackbeltChuuTrainAnytimeText:
	ntag " Chuu "
	text "Come back if you"
	line "want to train."
	done

BlackbeltShinSpDefSpecialistText:
	ntag " Shin "
	text "I'm Shin and I've"
	line "been training"
	line "#mon to boost"
	cont "their Sp.Def stat!"
	
	para "Shall we battle?"
	done

BlackbeltShinWinLossText:
	ntag " Shin "
	text "Overwhelmed!"
	done

BlackbeltShinAfterBattleText:
	ntag " Shin "
	text "Come back for more"
	line "attack training."
	done

BlackbeltShinTrainAnytimeText:
	ntag " Shin "
	text "Come back if you"
	line "want to train."
	done

BlackbeltAanSpeedSpecialistText:
	ntag " Aan "
	text "I'm Aan and I've"
	line "been training"
	line "#mon to boost"
	cont "their Speed stat!"
	
	para "Shall we battle?"
	done

BlackbeltAanWinLossText:
	ntag " Aan "
	text "Outsped!"

BlackbeltAanAfterBattleText:
	ntag " Aan "
	text "Come back for more"
	line "attack training."
	done

BlackbeltAanTrainAnytimeText:
	ntag " Aan "
	text "Come back if you"
	line "want to train."
	done

FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

FightingDojo_MapEvents:

	def_warp_events
	warp_event  4, 13, SAFFRON_CITY, 1
	warp_event  5, 13, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2

	def_object_events
	object_event  4,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  2,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FightingDojoHPBlackBelt, -1
	object_event  2,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FightingDojoAttackBlackBelt, -1
	object_event  2,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoDefenseBlackBelt, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FightingDojoSpAtkBlackBelt, -1
	object_event  7,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoSpDefBlackBelt, -1
	object_event  7,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FightingDojoSpeedBlackBelt, -1
	object_event  3,  1, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
