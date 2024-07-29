DEF NUM_ODD_EggS EQU 14

MACRO prob
	DEF prob_total += \1
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
; entries correspond to OddEggs (below)
	table_width 2, OddEggProbabilities
DEF prob_total = 0
; Pikachu
	prob 8
	prob 1
; Chinchou
	prob 16
	prob 3
; Sneasel
	prob 16
	prob 3
; Swinub
	prob 14
	prob 2
; Houndour
	prob 10
	prob 2
; Chansey
	prob 12
	prob 2
; Tyrogue
	prob 10
	prob 1
	assert_table_length NUM_ODD_EggS
	assert prob_total == 100, "OddEggProbabilities do not sum to 100%!"

OddEggs:
	table_width NICKNAMED_MON_STRUCT_LENGTH, OddEggs

	db PIKACHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, SURF, 0
	dw 02048 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 30, 20, 15, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 17 ; Max HP
	bigdw 9 ; Atk
	bigdw 6 ; Def
	bigdw 11 ; Spd
	bigdw 8 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db PIKACHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, SURF, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 30, 20, 15, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 17 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	db CHINCHOU
	db NO_ITEM
	db WATER_GUN, SUPERSONIC, LIGHT_SCREEN, 0
	dw 04096 ; OT ID
	dt 156 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 25, 20, 30, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 7 ; Atk
	bigdw 7 ; Def
	bigdw 6 ; Spd
	bigdw 9 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	db CHINCHOU
	db NO_ITEM
	db WATER_GUN, SUPERSONIC, LIGHT_SCREEN, 0
	dw 00768 ; OT ID
	dt 156 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 25, 20, 30, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 7 ; Atk
	bigdw 8 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db SNEASEL
	db NO_ITEM
	db SCRATCH, POWDER_SNOW, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 135 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 35, 25, 10, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 24 ; Max HP
	bigdw 8 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 9 ; SAtk
	bigdw 7 ; SDef
	db "Egg@@@@@@@@"

	db SNEASEL
	db NO_ITEM
	db SCRATCH, POWDER_SNOW, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 135 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 35, 25, 10, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 24 ; Max HP
	bigdw 8 ; Atk
	bigdw 7 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db SWINUB
	db NO_ITEM
	db TACKLE, MUD_SLAP, ICICLE_SPEAR, 0
	dw 03584 ; OT ID
	dt 156 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 35, 10, 30, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 8 ; Atk
	bigdw 6 ; Def
	bigdw 11 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db SWINUB
	db NO_ITEM
	db TACKLE, MUD_SLAP, ICICLE_SPEAR, 0
	dw 00512 ; OT ID
	dt 156 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 35, 10, 30, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 8 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 14 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db HOUNDOUR
	db NO_ITEM
	db LEER, EMBER, ROAR, PURSUIT
	dw 02560 ; OT ID
	dt 156 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 30, 25, 20, 20 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 12 ; Atk
	bigdw 8 ; Def
	bigdw 13 ; Spd
	bigdw 12 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	db HOUNDOUR
	db NO_ITEM
	db LEER, EMBER, ROAR, PURSUIT
	dw 00512 ; OT ID
	dt 156 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 30, 25, 20, 20 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 12 ; Atk
	bigdw 9 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db CHANSEY
	db NO_ITEM
	db TACKLE, GROWL, DIZZY_PUNCH, 0
	dw 03072 ; OT ID
	dt 100 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 35, 40, 10, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 11 ; Atk
	bigdw 8 ; Def
	bigdw 14 ; Spd
	bigdw 11 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	db CHANSEY
	db NO_ITEM
	db TACKLE, GROWL, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 100 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 35, 40, 10, 0 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 11 ; Atk
	bigdw 9 ; Def
	bigdw 15 ; Spd
	bigdw 12 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, FOCUS_ENERGY, FORESIGHT, DIZZY_PUNCH
	dw 02560 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 9, 10, 10, 10 ; DVs
	db 35, 30, 40, 10 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 8 ; Atk
	bigdw 8 ; Def
	bigdw 8 ; Spd
	bigdw 8 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, FOCUS_ENERGY, FORESIGHT, DIZZY_PUNCH
	dw 00256 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 2, 10, 10, 10 ; DVs
	db 35, 30, 40, 10 ; PP
	db 2 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 8 ; Atk
	bigdw 9 ; Def
	bigdw 9 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	assert_table_length NUM_ODD_EggS
