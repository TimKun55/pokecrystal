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
	winlosstext CooltrainermTylerWinLossText, 0
	loadtrainer COOLTRAINERM, TYLER
	startbattle
	reloadmapafterbattle
	opentext
	writetextend CooltrainermTylerAfterBattleText

.NoBattle
	writetextend CooltrainermTylerTrainAnytimeText

EarlsPokemonAcademyCarla: ; Def
	faceplayer
	opentext
	writetext EarlsPokemonAcademyCarlaText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerfCarlaWinLossText, 0
	loadtrainer COOLTRAINERF, CARLA
	startbattle
	reloadmapafterbattle
	opentext
	writetextend CooltrainerfCarlaAfterBattleText

.NoBattle
	writetextend CooltrainerfCarlaTrainAnytimeText

EarlsPokemonAcademyCatt: ; SpAtk
	faceplayer
	opentext
	writetext EarlsPokemonAcademyCattText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerfCattWinLossText, 0
	loadtrainer COOLTRAINERF, CATT
	startbattle
	reloadmapafterbattle
	opentext
	writetextend CooltrainerfCattAfterBattleText

.NoBattle
	writetextend CooltrainerfCattTrainAnytimeText

EarlsPokemonAcademySteve: ; SpDef
	faceplayer
	opentext
	writetext EarlsPokemonAcademySteveText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainermSteveWinLossText, 0
	loadtrainer COOLTRAINERM, STEVE
	startbattle
	reloadmapafterbattle
	opentext
	writetextend CooltrainermSteveAfterBattleText

.NoBattle
	writetextend CooltrainermSteveTrainAnytimeText

EarlsPokemonAcademyJamie: ; Speed
	faceplayer
	opentext
	writetext EarlsPokemonAcademyJamieText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainermJamieWinLossText, 0
	loadtrainer COOLTRAINERM, JAMIE
	startbattle
	reloadmapafterbattle
	opentext
	writetextend CooltrainermJamieAfterBattleText

.NoBattle
	writetextend CooltrainermJamieTrainAnytimeText

EarlsPokemonAcademyPam: ; HP
	faceplayer
	opentext
	writetext EarlsPokemonAcademyPamText
	yesorno
	iffalse .NoBattle
	closetext
	winlosstext CooltrainerfPamWinLossText, 0
	loadtrainer COOLTRAINERF, PAM
	startbattle
	reloadmapafterbattle
	opentext
	writetextend CooltrainerfPamAfterBattleText

.NoBattle
	writetextend CooltrainerfPamTrainAnytimeText

EarlsPokemonAcademyTeacher:
	faceplayer
	opentext
	checkevent EVENT_EARLS_ACADEMY_B1F_MACHO_BRACE
	iftrue .MachoBraceExplain
	writetext EarlsPokemonAcademyTeacherIntroText
	waitbutton
	verbosegiveitem MACHO_BRACE
	iffalse .NoRoom
	setevent EVENT_EARLS_ACADEMY_B1F_MACHO_BRACE
.MachoBraceExplain:
	writetextend EarlsPokemonAcademyTeacherExplainText

.NoRoom:
	writetextend EarlsPokemonAcademyTeacherNoRoomText

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
	ntag "Tyler"
	text "I specialise in"
	line "training Attack."

	para "Want to battle?"
	done

CooltrainermTylerWinLossText:
	ntag "Tyler"
	text "Such power!"
	done

CooltrainermTylerAfterBattleText:
	ntag "Tyler"
	text "Come back for more"
	line "attack training."
	done

CooltrainermTylerTrainAnytimeText:
	ntag "Tyler"
	text "Come back if you"
	line "want to train."
	done

EarlsPokemonAcademyCarlaText:
	ntag "Carla"
	text "I specialise in"
	line "training Defense."

	para "Want to battle?"
	done

CooltrainerfCarlaWinLossText:
	ntag "Carla"
	text "Such resistance!"
	done

CooltrainerfCarlaAfterBattleText:
	ntag "Carla"
	text "Come back for more"
	line "defense training."
	done

CooltrainerfCarlaTrainAnytimeText:
	ntag "Carla"
	text "Come back if you"
	line "want to train."
	done

EarlsPokemonAcademyCattText:
	ntag "Catt"
	text "I specialise in"
	line "training Special"
	cont "Attack."

	para "Want to battle?"
	done

CooltrainerfCattWinLossText:
	ntag "Catt"
	text "Such special"
	line "power!"
	done

CooltrainerfCattAfterBattleText:
	ntag "Catt"
	text "Come back for more"
	line "special attack"
	cont "training."
	done

CooltrainerfCattTrainAnytimeText:
	ntag "Catt"
	text "Come back if you"
	line "want to train."
	done

EarlsPokemonAcademySteveText:
	ntag "Steve"
	text "I specialise in"
	line "training Special"
	cont "Defense."

	para "Want to battle?"
	done

CooltrainermSteveWinLossText:
	ntag "Steve"
	text "Such special"
	line "resistance!"
	done

CooltrainermSteveAfterBattleText:
	ntag "Steve"
	text "Come back for more"
	line "special defense"
	cont "training."
	done

CooltrainermSteveTrainAnytimeText:
	ntag "Steve"
	text "Come back if you"
	line "want to train."
	done

EarlsPokemonAcademyJamieText:
	ntag "Jamie"
	text "I specialise in"
	line "training Speed."

	para "Want to battle?"
	done

CooltrainermJamieWinLossText:
	ntag "Jamie"
	text "Such agility!"
	done

CooltrainermJamieAfterBattleText:
	ntag "Jamie"
	text "Come back for more"
	line "speed training."
	done

CooltrainermJamieTrainAnytimeText:
	ntag "Jamie"
	text "Come back if you"
	line "want to train."
	done

EarlsPokemonAcademyPamText:
	ntag "Pam"
	text "I specialise in"
	line "training HP."

	para "Want to battle?"
	done

CooltrainerfPamWinLossText:
	ntag "Pam"
	text "Such robustness!"
	done

CooltrainerfPamAfterBattleText:
	ntag "Pam"
	text "Come back for more"
	line "HP training."
	done

CooltrainerfPamTrainAnytimeText:
	ntag "Pam"
	text "Come back if you"
	line "want to train."
	done

EarlsPokemonAcademyTeacherIntroText:
	ntag "Penny"
	text "Welcome to my"
	line "Avanced course!"
	
	para "Train here, and"
	line "watch your #mon"
	cont "become the strong-"
	cont "est they can be!"
	
	para "Here, this is for"
	line "new students."
	done

EarlsPokemonAcademyTeacherExplainText:
	ntag "Penny"
	text "The Macho Brace"
	line "doubles the amount"
	cont "of EVs earned by"
	cont "the #mon hold-"
	cont "ing it, but also"
	cont "reduces its speed."
	
	para "It's a very useful"
	line "item for training"
	cont "I found while in"
	cont "the Hoenn region."
	done

EarlsPokemonAcademyTeacherNoRoomText:
	ntag "Penny"
	text "Oh, you have no"
	line "room for this."
	done

AttackEVSignText:
	text "Tyler says:"
	line "Attack is best."
	done

DefenseEVSignText:
	text "Carla says:"
	line "Defense is best."
	done

SpAttackEVSignText:
	text "Catt says:"
	line "Spcl.Atk is best."
	done

SpDefenseEVSignText:
	text "Steve says:"
	line "Spcl.Def is best."
	done

HPEVSignText:
	text "Pam says:"
	line "HP is best."
	done

SpeedEVSignText:
	text "Jamie says:"
	line "Speed is best."
	done

EarlsPokemonAcademyB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 13, EARLS_POKEMON_ACADEMY, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, AttackEVSign
	bg_event  5,  1, BGEVENT_READ, DefenseEVSign
	bg_event  8,  1, BGEVENT_READ, SpAttackEVSign
	bg_event 11,  1, BGEVENT_READ, SpDefenseEVSign
	bg_event  3,  7, BGEVENT_READ, HPEVSign
	bg_event 10,  7, BGEVENT_READ, SpeedEVSign

	def_object_events
	object_event  1,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyTyler, -1
	object_event 12,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademySteve, -1
	object_event 11,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyJamie, -1
	object_event  4,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyCarla, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyCatt, -1
	object_event  2,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyPam, -1
	object_event  6, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, EarlsPokemonAcademyTeacher, -1
