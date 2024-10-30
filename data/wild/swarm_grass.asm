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

; Sentret swarm
	map_id ROUTE_29
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		 min, max
	db 20, PIDGEY,         2,   3
	db 26, SENTRET,        2,   3
	db 20, RATTATA,        2,   3
	db 10, HOPPIP,         2,   3
	db  8, PIDGEY,         2,   3
	db  8, SENTRET,        2,   3
	db  8, RATTATA,        2,   3
	; day
	;   %, species,		 min, max
	db 20, PIDGEY,         2,   3
	db 26, SENTRET,        2,   3
	db 20, RATTATA,        2,   3
	db 10, HOPPIP,         2,   3
	db  8, PIDGEY,         2,   3
	db  8, SENTRET,        2,   3
	db  8, RATTATA,        2,   3
	; nite
	;   %, species,		 min, max
	db 20, HOOTHOOT,       2,   3
	db 26, SENTRET,        2,   3
	db 22, RATTATA,        2,   3
	db 10, SENTRET,        2,   3
	db  8, RATTATA,        2,   3
	db  8, SENTRET,        2,   3
	db  8, HOOTHOOT,       2,   3

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

; Miltank swarm
	map_id ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		 min, max
	db 18, DODUO,         18,  20
	db 18, VOLTORB,       18,  20
	db 18, MAGNEMITE,     18,  20
	db 10, FLAAFFY,       18,  20
	db  8, TAUROS,        16,  17
	db 14, MILTANK,       16,  17
	db 14, MILTANK,       16,  17
	; day
	;   %, species,		 min, max
	db 18, DODUO,         18,  20
	db 18, VOLTORB,       18,  20
	db 18, MAGNEMITE,     18,  20
	db 10, FLAAFFY,       18,  20
	db  8, TAUROS,        16,  17
	db 14, MILTANK,       16,  17
	db 14, MILTANK,       16,  17
	; nite
	;   %, species,		 min, max
	db 22, MEOWTH,        18,  20
	db 14, MILTANK,       16,  17
	db 14, MILTANK,       16,  17
	db 10, MURKROW,       18,  20
	db  8, HOUNDOUR,      18,  20
	db  8, ARIADOS,       20,  22
	db  8, MISDREAVUS,    18,  20

; Girafarig swarm
	map_id ROUTE_43
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,		 min, max
	db 15, SKIPLOOM,      26,  28
	db 15, FLAAFFY,       29,  32
	db 15, FARFETCH_D,    30,  32
	db 10, FURRET,        28,  30
	db 29, GIRAFARIG,     30,  32
	db  8, FURRET,        30,  32
	db  8, EXEGGCUTE,     30,  32
	; day
	;   %, species,		 min, max
	db 15, SKIPLOOM,      26,  28
	db 15, FLAAFFY,       29,  32
	db 15, FARFETCH_D,    30,  32
	db 10, FURRET,        28,  30
	db 29, GIRAFARIG,     30,  32
	db  8, FURRET,        30,  32
	db  8, EXEGGCUTE,     30,  32
	; nite
	;   %, species,		 min, max
	db 15, VENONAT,       26,  28
	db 15, NOCTOWL,       29,  32
	db 15, FARFETCH_D,    30,  32
	db 10, FLAAFFY,       30,  32
	db 29, GIRAFARIG,     30,  32
	db  8, VENOMOTH,      30,  32
	db  8, VENOMOTH,      30,  32
	
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
