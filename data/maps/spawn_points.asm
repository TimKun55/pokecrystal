MACRO spawn
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants
	table_width 4, SpawnPoints

	spawn PLAYERS_HOUSE_2F,            3,  3
	spawn VIRIDIAN_POKECENTER_1F,      5,  3

	spawn PALLET_TOWN,                 5,  6
	spawn VIRIDIAN_CITY,              23, 26
	spawn PEWTER_CITY,                13, 26
	spawn CERULEAN_CITY,              19, 22
	spawn ROUTE_10_NORTH,              9,  4
	spawn VERMILION_CITY,              9,  6
	spawn LAVENDER_TOWN,               5,  6
	spawn SAFFRON_CITY,               11, 32
	spawn CELADON_CITY,               29, 10
	spawn FUCHSIA_CITY,               17, 28
	spawn CINNABAR_ISLAND,            21, 18
	spawn INDIGO_PLATEAU,              9,  6

	spawn NEW_BARK_TOWN,              13,  6
	spawn CHERRYGROVE_CITY,           29,  4
	spawn VIOLET_CITY,                31, 26
	spawn ROUTE_32,                   11, 74
	spawn AZALEA_TOWN,                15, 10
	spawn CIANWOOD_CITY,              23, 44
	spawn GOLDENROD_CITY,             17, 28
	spawn OLIVINE_CITY,               13, 22
	spawn ECRUTEAK_CITY,              23, 40
	spawn MAHOGANY_TOWN,              15, 14
	spawn LAKE_OF_RAGE,               21, 29
	spawn BLACKTHORN_CITY,            21, 30
	spawn MT_SILVER_OUTSIDE,          23, 14
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2

	spawn N_A,                        -1, -1

	assert_table_length NUM_SPAWNS + 1
