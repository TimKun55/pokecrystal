; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		min, max
	db 22, GEODUDE,       2,   4
	db 22, DUNSPARCE,     2,   5
	db 22, ZUBAT,         2,   4 
	db 10, ONIX,          2,   4 
	db  8, DUNSPARCE,     3,   6
	db  8, TEDDIURSA,     3,   6
	db  8, LARVITAR,      3,   7
	; day
	;   %, species,		min, max
	db 22, GEODUDE,       2,   4
	db 22, DUNSPARCE,     2,   5
	db 22, ZUBAT,         2,   4 
	db 10, ONIX,          2,   4 
	db  8, DUNSPARCE,     3,   6
	db  8, TEDDIURSA,     3,   6
	db  8, LARVITAR,      3,   7
	; nite
	;   %, species,		min, max
	db 22, GEODUDE,       2,   4
	db 22, DUNSPARCE,     2,   5
	db 22, ZUBAT,         2,   4 
	db 10, ONIX,          2,   4 
	db  8, DUNSPARCE,     3,   6
	db  8, TEDDIURSA,     3,   6
	db  8, LARVITAR,      3,   7

; Mareep swarm
    map_id ROUTE_36
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		 min, max
	db 13, LEDYBA,         2,   4
	db 13, PIDGEY,         3,   4
	db 13, BELLSPROUT,     3,   5
	db 10, GROWLITHE,      4,   5
	db 35, MAREEP,         4,   5
	db  8, PIDGEY,         5,   6
	db  8, SUNKERN,        5,   6
	; day
	;   %, species,		 min, max
	db 13, LEDYBA,         2,   4
	db 13, PIDGEY,         3,   4
	db 13, BELLSPROUT,     3,   5
	db 10, GROWLITHE,      4,   5
	db 35, MAREEP,         4,   5
	db  8, PIDGEY,         5,   6
	db  8, SUNKERN,        5,   6
	; nite
	;   %, species,		 min, max
	db 13, SPINARAK,       2,   4
	db 13, HOOTHOOT,       3,   4
	db 13, BELLSPROUT,     3,   5
	db 10, HOOTHOOT,       4,   5
	db 35, MAREEP,         4,   5
	db  8, GASTLY,         5,   6
	db  8, GASTLY,         5,   6

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		min, max
	db 22, YANMA,        16,  18
	db 22, PIDGEY,       16,  19
	db 22, SNUBBULL,     15,  18 
	db 10, GROWLITHE,    15,  18 
	db  8, ABRA,         12,  15
	db  8, YANMA,        16,  18
	db  8, DITTO,        11,  15
	; day
	;   %, species,		min, max
	db 22, YANMA,        16,  18
	db 22, PIDGEY,       16,  19
	db 22, SNUBBULL,     15,  18 
	db 10, GROWLITHE,    15,  18 
	db  8, ABRA,         12,  15
	db  8, YANMA,        16,  18
	db  8, DITTO,        11,  15
	; nite
	;   %, species,		min, max
	db 22, YANMA,        16,  18
	db 22, PIDGEY,       16,  19
	db 22, SNUBBULL,     15,  18 
	db 10, GROWLITHE,    15,  18 
	db  8, ABRA,         12,  15
	db  8, YANMA,        16,  18
	db  8, DITTO,        11,  15
	
; Heracross swarm
	map_id ILEX_FOREST
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		 min, max
	db 13, CATERPIE,       4,   6
	db 13, WEEDLE,         4,   6
	db 13, PARAS,          9,  12
	db 10, PINECO,         9,  12
	db  8, METAPOD,        8,   9
	db  8, KAKUNA,         8,   9
	db 35, HERACROSS,      9,  11
	; day
	;   %, species,		 min, max
	db 13, CATERPIE,       4,   6
	db 13, WEEDLE,         4,   6
	db 13, PARAS,          9,  12
	db 10, PINECO,         9,  12
	db  8, METAPOD,        8,   9
	db  8, KAKUNA,         8,   9
	db 35, HERACROSS,      9,  11
	; nite
	;   %, species,		 min, max
	db 13, ODDISH,         8,  11
	db 13, VENONAT,        7,  10
	db 13, PSYDUCK,        9,  12
	db 10, PINECO,         9,  12
	db  8, ODDISH,        10,  12
	db  8, PARAS,          9,  12
	db 35, HERACROSS,      9,  11

	db -1 ; end
