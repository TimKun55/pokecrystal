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
	writetext HPSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltWinLossText, 0
	loadtrainer BLACKBELT_T, KON
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlackbeltAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext BlackbeltTrainAnytimeText
	waitbutton
	closetext
	end

FightingDojoAttackBlackBelt:
	faceplayer
	opentext
	writetext AttackSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltWinLossText, 0
	loadtrainer BLACKBELT_T, BO
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlackbeltAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext BlackbeltTrainAnytimeText
	waitbutton
	closetext
	end

FightingDojoDefenseBlackBelt:
	faceplayer
	opentext
	writetext DefenseSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltWinLossText, 0
	loadtrainer BLACKBELT_T, TOMO
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlackbeltAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext BlackbeltTrainAnytimeText
	waitbutton
	closetext
	end

FightingDojoSpAtkBlackBelt:
	faceplayer
	opentext
	writetext SpAtkSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltWinLossText, 0
	loadtrainer BLACKBELT_T, CHUU
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlackbeltAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext BlackbeltTrainAnytimeText
	waitbutton
	closetext
	end

FightingDojoSpDefBlackBelt:
	faceplayer
	opentext
	writetext SpDefSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltWinLossText, 0
	loadtrainer BLACKBELT_T, SHIN
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlackbeltAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext BlackbeltTrainAnytimeText
	waitbutton
	closetext
	end

FightingDojoSpeedBlackBelt:
	faceplayer
	opentext
	writetext SpeedSpecialistText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext BlackbeltWinLossText, 0
	loadtrainer BLACKBELT_T, AAN
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlackbeltAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext BlackbeltTrainAnytimeText
	waitbutton
	closetext
	end

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

	para "master, is in a"
	line "cave in Johto for"
	cont "training."
	
	para "We've set up a"
	line "training routine"
	
	para "for helping #mon"
	line "get stronger."
	done

HPSpecialistText:
	text "I've been training"
	line "#mon to boost"
	cont "their HP stat!"
	
	para "Shall we battle?"
	done

AttackSpecialistText:
	text "I've been training"
	line "#mon to boost"
	cont "their Atk stat!"
	
	para "Shall we battle?"
	done

DefenseSpecialistText:
	text "I've been training"
	line "#mon to boost"
	cont "their Def stat!"
	
	para "Shall we battle?"
	done

SpAtkSpecialistText:
	text "I've been training"
	line "#mon to boost"
	cont "their Sp.Atk stat!"
	
	para "Shall we battle?"
	done

SpDefSpecialistText:
	text "I've been training"
	line "#mon to boost"
	cont "their Sp.Def stat!"
	
	para "Shall we battle?"
	done

SpeedSpecialistText:
	text "I've been training"
	line "#mon to boost"
	cont "their Speed stat!"
	
	para "Shall we battle?"
	done

BlackbeltWinLossText:
	text "Great training!"
	done

BlackbeltAfterBattleText:
	text "Come back for"
	line "more training."
	done

BlackbeltTrainAnytimeText:
	text "Come back anytime."
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
	db 0, 0 ; filler

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
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
