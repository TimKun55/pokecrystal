	object_const_def
	const EARLSPOKEMONACADEMYB1F_COOLTRAINER_M1
	const EARLSPOKEMONACADEMYB1F_COOLTRAINER_M2
	const EARLSPOKEMONACADEMYB1F_COOLTRAINER_M3
	const EARLSPOKEMONACADEMYB1F_COOLTRAINER_F1
	const EARLSPOKEMONACADEMYB1F_COOLTRAINER_F2
	const EARLSPOKEMONACADEMYB1F_COOLTRAINER_F3
	const EARLSPOKEMONACADEMYB1F_TEACHER

EarlsPokemonAcademyB1F_MapScripts:
	def_scene_scripts

	def_callbacks

EarlsPokemonAcademyTyler:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyTylerText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerWinLossText, 0
	loadtrainer COOLTRAINERM, TYLER
	startbattle
	reloadmapafterbattle
	opentext
	writetext CooltrainerAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext CooltrainerTrainAnytimeText
	waitbutton
	closetext
	end

EarlsPokemonAcademyCarla: ; Def
	faceplayer
	opentext
	writetext EarlsPokemonAcademyCarlaText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerWinLossText, 0
	loadtrainer COOLTRAINERF, CARLA
	startbattle
	reloadmapafterbattle
	opentext
	writetext CooltrainerAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext CooltrainerTrainAnytimeText
	waitbutton
	closetext
	end

EarlsPokemonAcademyCatt: ; SpAtk
	faceplayer
	opentext
	writetext EarlsPokemonAcademyCattText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerWinLossText, 0
	loadtrainer COOLTRAINERF, CATT
	startbattle
	reloadmapafterbattle
	opentext
	writetext CooltrainerAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext CooltrainerTrainAnytimeText
	waitbutton
	closetext
	end

EarlsPokemonAcademySteve: ; SpDef
	faceplayer
	opentext
	writetext EarlsPokemonAcademySteveText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerWinLossText, 0
	loadtrainer COOLTRAINERM, STEVE
	startbattle
	reloadmapafterbattle
	opentext
	writetext CooltrainerAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext CooltrainerTrainAnytimeText
	waitbutton
	closetext
	end

EarlsPokemonAcademyJamie: ; Speed
	faceplayer
	opentext
	writetext EarlsPokemonAcademyJamieText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerWinLossText, 0
	loadtrainer COOLTRAINERM, JAMIE
	startbattle
	reloadmapafterbattle
	opentext
	writetext CooltrainerAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext CooltrainerTrainAnytimeText
	waitbutton
	closetext
	end

EarlsPokemonAcademyPam: ; HP
	faceplayer
	opentext
	writetext EarlsPokemonAcademyPamText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerWinLossText, 0
	loadtrainer COOLTRAINERF, PAM
	startbattle
	reloadmapafterbattle
	opentext
	writetext CooltrainerAfterBattleText
	waitbutton
	closetext
	end

.NoBattle
	writetext CooltrainerTrainAnytimeText
	waitbutton
	closetext
	end

EarlsPokemonAcademyTeacher:
	jumptextfaceplayer EarlsPokemonAcademyTeacherText

AttackEVSign:
	jumptext AttackEVSignText
	
DefenseEVSign:
	jumptext DefenseEVSignText

SpAttackEVSign:
	jumptext SpAttackEVSignText
	
SpDefenseEVSign:
	jumptext SpDefenseEVSignText

HPEVSign:
	jumptext HPEVSignText

SpeedEVSign:
	jumptext SpeedEVSignText

EarlsPokemonAcademyTylerText:
	text "I specialise in"
	line "training Attack."

	para "Want to battle?"
	done

EarlsPokemonAcademyCarlaText:
	text "I specialise in"
	line "training Defense."

	para "Want to battle?"
	done

EarlsPokemonAcademyCattText:
	text "I specialise in"
	line "training Special"
	cont "Attack."

	para "Want to battle?"
	done

EarlsPokemonAcademySteveText:
	text "I specialise in"
	line "training Special"
	cont "Defense."

	para "Want to battle?"
	done

EarlsPokemonAcademyJamieText:
	text "I specialise in"
	line "training Speed."

	para "Want to battle?"
	done

EarlsPokemonAcademyPamText:
	text "I specialise in"
	line "training HP."

	para "Want to battle?"
	done

CooltrainerWinLossText:
	text "Great training!"
	done

CooltrainerAfterBattleText:
	text "Come back for"
	line "more training."
	done

CooltrainerTrainAnytimeText:
	text "Come back anytime."
	done

EarlsPokemonAcademyTeacherText:
	text "Welcome to my"
	line "Avanced course!"
	
	para "Train here, and"
	line "watch your #mon"

	para "become the strong-"
	line "est they can be!"
	done

AttackEVSignText:
	text "Attack is best."
	done

DefenseEVSignText:
	text "Defense is best."
	done

SpAttackEVSignText:
	text "Spcl.Atk is best."
	done

SpDefenseEVSignText:
	text "Spcl.Def is best."
	done

HPEVSignText:
	text "HP is best."
	done

SpeedEVSignText:
	text "Speed is best."
	done

EarlsPokemonAcademyB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 10, EARLS_POKEMON_ACADEMY, 3

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_READ, AttackEVSign
	bg_event  5,  0, BGEVENT_READ, DefenseEVSign
	bg_event  8,  0, BGEVENT_READ, SpAttackEVSign
	bg_event 11,  0, BGEVENT_READ, SpDefenseEVSign
	bg_event  3,  4, BGEVENT_READ, HPEVSign
	bg_event 10,  4, BGEVENT_READ, SpeedEVSign

	def_object_events
	object_event  1,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyTyler, -1
	object_event 12,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademySteve, -1
	object_event 11,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyJamie, -1
	object_event  4,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyCarla, -1
	object_event  9,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyCatt, -1
	object_event  2,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyPam, -1
	object_event  6,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, EarlsPokemonAcademyTeacher, -1
