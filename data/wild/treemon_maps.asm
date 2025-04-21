MACRO treemon_map
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps::
	treemon_map ROUTE_26,                  TREEMON_SET_KANTO
	treemon_map ROUTE_27,                  TREEMON_SET_KANTO
	treemon_map ROUTE_28,                  TREEMON_SET_NONE
	treemon_map ROUTE_29,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_30,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_31,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_32,                  TREEMON_SET_KANTO
	treemon_map ROUTE_33,                  TREEMON_SET_TOWN
	treemon_map ROUTE_34,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_35,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_36,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_37,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_38,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_39,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_40,                  TREEMON_SET_NONE
	treemon_map ROUTE_41,                  TREEMON_SET_NONE
	treemon_map ROUTE_42,                  TREEMON_SET_TOWN
	treemon_map ROUTE_43,                  TREEMON_SET_LAKE
	treemon_map ROUTE_44,                  TREEMON_SET_CANYON
	treemon_map ROUTE_45,                  TREEMON_SET_CANYON
	treemon_map ROUTE_46,                  TREEMON_SET_CANYON
	treemon_map NEW_BARK_TOWN,             TREEMON_SET_NONE
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_NONE
	treemon_map VIOLET_CITY,               TREEMON_SET_NONE
	treemon_map AZALEA_TOWN,               TREEMON_SET_TOWN
	treemon_map CIANWOOD_CITY,             TREEMON_SET_NONE
	treemon_map GOLDENROD_CITY,            TREEMON_SET_NONE
	treemon_map OLIVINE_CITY,              TREEMON_SET_NONE
	treemon_map ECRUTEAK_CITY,             TREEMON_SET_NONE
	treemon_map MAHOGANY_TOWN,             TREEMON_SET_NONE
	treemon_map LAKE_OF_RAGE,              TREEMON_SET_LAKE
	treemon_map BLACKTHORN_CITY,           TREEMON_SET_NONE
	treemon_map MT_SILVER_OUTSIDE,         TREEMON_SET_NONE
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	db -1

RockMonMaps::
	treemon_map BURNED_TOWER_1F,           TREEMON_SET_ROCK_BURNED_TOWER
	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK_CIANWOOD
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, TREEMON_SET_ROCK_DARK_CAVE
	treemon_map ICE_PATH_B3F,              TREEMON_SET_ROCK_JOHTO
	treemon_map ROUTE_4_ZAPDOS_NEST,       TREEMON_SET_ROCK_KANTO
	treemon_map ROUTE_19,                  TREEMON_SET_ROCK_KANTO_SHORE
	treemon_map ROUTE_26,                  TREEMON_SET_ROCK_KANTO_EARLY
	treemon_map ROUTE_40,                  TREEMON_SET_ROCK_CIANWOOD
	treemon_map ROUTE_41,                  TREEMON_SET_ROCK_CIANWOOD
	treemon_map RUINS_OF_ALPH_OUTSIDE,     TREEMON_SET_ROCK_RUINS
	treemon_map TOHJO_FALLS,               TREEMON_SET_ROCK_TOHJO
	treemon_map VICTORY_ROAD_1F,           TREEMON_SET_ROCK_VICTORY_ROAD
	treemon_map VICTORY_ROAD_2F,           TREEMON_SET_ROCK_VICTORY_ROAD
	treemon_map VICTORY_ROAD_3F,           TREEMON_SET_ROCK_VICTORY_ROAD

	db -1
