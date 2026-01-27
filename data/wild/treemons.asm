TreeMons::
; entries correspond to TREEMON_SET_* constants
	table_width 2
	dw TreeMonSet_None
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
;	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
;	dw TreeMonSet_None ; unused

RockSmashMons::
	; broke off from the above table, for nayru's pokedex
	; delineation was needed because there is no 'rare' table for rocksmash
	table_width 2
	dw TreeMonSet_RockJohto
	dw TreeMonSet_RockDarkCave
	dw TreeMonSet_RockRuins
	dw TreeMonSet_RockBurnedTower
	dw TreeMonSet_RockCianwood
	dw TreeMonSet_RockTohjo
	dw TreeMonSet_RockKantoEarly
	dw TreeMonSet_RockVictoryRoad
	dw TreeMonSet_RockKantoShore
	dw TreeMonSet_RockKanto
	dw TreeMonSet_RockVermilion
	assert_table_length NUM_ROCKSMASH_SETS

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_None:
; no encounter data

TreeMonSet_Canyon:
; common
	db 50, PIDGEY,     10
	db 15, PIDGEY,     10
	db 15, PIDGEY,     10
	db 10, MANKEY,     10
	db  5, MANKEY,     10
	db  5, MANKEY,     10
	db -1
; rare
	db 50, PIDGEY,     10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, MANKEY,     10
	db  5, MANKEY,     10
	db  5, MANKEY,     10
	db -1

TreeMonSet_Town:
; common
	db 50, PIDGEY,     10
	db 15, EKANS,      10
	db 15, PIDGEY,     10
	db 10, MANKEY,     10
	db  5, MANKEY,     10
	db  5, MANKEY,     10
	db -1
; rare
	db 50, PIDGEY,     10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, MANKEY,     10
	db  5, MANKEY,     10
	db  5, MANKEY,     10
	db -1

TreeMonSet_Route:
; common
	db 50, HOOTHOOT,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Kanto:
; common
	db 50, HOOTHOOT,   10
	db 15, EKANS,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,   10
	db 15, VENONAT,    10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, NOCTOWL,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, HOOTHOOT,   10
	db  5, METAPOD,    10
	db  5, KAKUNA,     10
	db -1

; Rock smash sets dont have common/rare tables
; can have as many entries as you want as long as the % adds up to 100
; feel free to add new rock smash sets

TreeMonSet_RockJohto:
	db 85, GEODUDE,    30
	db 15, GRAVELER,   35
	db -1

TreeMonSet_RockDarkCave:
	db 90, GEODUDE,    15
	db 10, DUNSPARCE,  15
	db -1

TreeMonSet_RockRuins:
	db 90, GEODUDE,    15
	db 10, SHUCKLE,    15
	db -1

TreeMonSet_RockBurnedTower:
	db 80, GEODUDE,    15
	db 20, SLUGMA,     15
	db -1

TreeMonSet_RockCianwood:
	db 60, KRABBY,     20
	db 30, CORSOLA,    20
	db 10, SHUCKLE,    20
	db -1

TreeMonSet_RockTohjo:
	db 60, KINGLER,    35
	db 30, GRAVELER,   35
	db 10, SHUCKLE,    35
	db -1

TreeMonSet_RockKantoEarly:
	db 60, KINGLER,    35
	db 40, GRAVELER,   35
	db -1

TreeMonSet_RockVictoryRoad:
	db 90, GRAVELER,   37
	db 10, GRAVELER,   40
	db -1

TreeMonSet_RockKantoShore:
	db 90, KINGLER,    50
	db 10, CORSOLA,    50
	db -1

TreeMonSet_RockKanto:
	db 90, GRAVELER,   55
	db 10, GOLEM,      55
	db -1

TreeMonSet_RockVermilion:
	db 60, KINGLER,    55
	db 40, GRAVELER,   55
	db -1
