MapGroupNum_Names::
	table_width 2
	dw Olivine_Map_Names
	dw Mahogany_Map_Names
	dw Dungeons_Map_Names
	dw Ecruteak_Map_Names
	dw Blackthorn_Map_Names
	dw Cinnabar_Map_Names
	dw Cerulean_Map_Names
	dw Azalea_Map_Names
	dw Lake_of_Rage_Map_Names
	dw Violet_Map_Names
	dw Goldenrod_Map_Names
	dw Vermilion_Map_Names
	dw Pallet_Map_Names
	dw Pewter_Map_Names
	dw Fast_Ship_Map_Names
	dw Indigo_Map_Names
	dw Fuchsia_Map_Names
	dw Lavender_Map_Names
	dw Silver_Map_Names
	dw Cable_Club_Map_Names
	dw Celadon_Map_Names
	dw Cianwood_Map_Names
	dw Viridian_Map_Names
	dw New_Bark_Map_Names
	dw Saffron_Map_Names
	dw Cherrygrove_Map_Names
	dw Safari_Map_Names
	dw Battle_Tower_Map_Names
	assert_table_length NUM_MAP_GROUPS

GetMapGroupNum_Name::
	dec d ; map num
	dec e ; map group
	push de
	ld d, 0
	; ld hl, Dungeons_Map_Names
	ld hl, MapGroupNum_Names
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld h, d
	ld l, e
	pop de
	ld e, d
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	; return string ptr in de
	ret

Olivine_Map_Names:
	table_width 2
	dw Olivine_Map_Name1  ; map_const OLIVINE_POKECENTER_1F
	dw Olivine_Map_Name2  ; map_const OLIVINE_GYM
	dw Olivine_Map_Name3  ; map_const OLIVINE_TIMS_HOUSE
	dw Olivine_Map_Name4  ; map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE
	dw Olivine_Map_Name5  ; map_const OLIVINE_GOOD_ROD_HOUSE
	dw Olivine_Map_Name6  ; map_const OLIVINE_CAFE
	dw Olivine_Map_Name7  ; map_const OLIVINE_MART
	dw Olivine_Map_Name8  ; map_const ROUTE_38_ECRUTEAK_GATE
	dw Olivine_Map_Name9  ; map_const ROUTE_39_BARN
	dw Olivine_Map_Name10 ; map_const ROUTE_39_FARMHOUSE
	dw Olivine_Map_Name11 ; map_const ROUTE_38
	dw Olivine_Map_Name12 ; map_const ROUTE_39
	dw Olivine_Map_Name13 ; map_const OLIVINE_CITY
	assert_table_length NUM_OLIVINE_MAPS

Olivine_Map_Name1:  db "Olivine <PKMN> Center@"
Olivine_Map_Name2:  db "Olivine Gym@"
Olivine_Map_Name3:  db "Tim's House@"
Olivine_Map_Name4:  db "Olivine House@"
Olivine_Map_Name5:  db "Olivine House 1@"
Olivine_Map_Name6:  db "Olivine Cafe@"
Olivine_Map_Name7:  db "Olivine <POKE>Mart@"
Olivine_Map_Name8:  db "Route 38 Gate@"
Olivine_Map_Name9:  db "Route 39 Barn@"
Olivine_Map_Name10: db "Route 39 House@"
Olivine_Map_Name11: db "Route 38@"
Olivine_Map_Name12: db "Route 39@"
Olivine_Map_Name13: db "Olivine City@"

Mahogany_Map_Names:
	table_width 2
	dw Mahogany_Map_Name1 ; map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE
	dw Mahogany_Map_Name2 ; map_const MAHOGANY_GYM
	dw Mahogany_Map_Name3 ; map_const MAHOGANY_POKECENTER_1F
	dw Mahogany_Map_Name4 ; map_const ROUTE_42_ECRUTEAK_GATE
	dw Mahogany_Map_Name5 ; map_const ROUTE_42
	dw Mahogany_Map_Name6 ; map_const ROUTE_44
	dw Mahogany_Map_Name7 ; map_const MAHOGANY_TOWN
	dw Mahogany_Map_Name8 ; map_const MAHOGANY_MOVE_TUTOR_HOUSE
	assert_table_length NUM_MAHOGANY_MAPS

Mahogany_Map_Name1: db "Mahogany House@"
Mahogany_Map_Name2: db "Mahogany Gym@"
Mahogany_Map_Name3: db "Mahogany <PKMN> Cen.@"
Mahogany_Map_Name4: db "Route 42 Gate@"
Mahogany_Map_Name5: db "Route 42@"
Mahogany_Map_Name6: db "Route 44@"
Mahogany_Map_Name7: db "Mahogany Town@" 
Mahogany_Map_Name8: db "Mahogany House@" 
	
Dungeons_Map_Names:
	table_width 2
	dw Dungeons_Map_Name1   ; map_const SPROUT_TOWER_1F
	dw Dungeons_Map_Name2   ; map_const SPROUT_TOWER_2F
	dw Dungeons_Map_Name3   ; map_const SPROUT_TOWER_3F
	dw Dungeons_Map_Name4   ; map_const TIN_TOWER_1F
	dw Dungeons_Map_Name5   ; map_const TIN_TOWER_2F
	dw Dungeons_Map_Name6   ; map_const TIN_TOWER_3F
	dw Dungeons_Map_Name7   ; map_const TIN_TOWER_4F
	dw Dungeons_Map_Name8   ; map_const TIN_TOWER_5F
	dw Dungeons_Map_Name9   ; map_const TIN_TOWER_6F
	dw Dungeons_Map_Name10  ; map_const TIN_TOWER_7F
	dw Dungeons_Map_Name11  ; map_const TIN_TOWER_8F
	dw Dungeons_Map_Name12  ; map_const TIN_TOWER_9F
	dw Dungeons_Map_Name13  ; map_const BURNED_TOWER_1F
	dw Dungeons_Map_Name14  ; map_const BURNED_TOWER_B1F
	dw Dungeons_Map_Name15  ; map_const NATIONAL_PARK
	dw Dungeons_Map_Name16  ; map_const NATIONAL_PARK_BUG_CONTEST
	dw Dungeons_Map_Name17  ; map_const RADIO_TOWER_1F
	dw Dungeons_Map_Name18  ; map_const RADIO_TOWER_2F
	dw Dungeons_Map_Name19  ; map_const RADIO_TOWER_3F
	dw Dungeons_Map_Name20  ; map_const RADIO_TOWER_4F
	dw Dungeons_Map_Name21  ; map_const RADIO_TOWER_5F
	dw Dungeons_Map_Name22  ; map_const RUINS_OF_ALPH_OUTSIDE
	dw Dungeons_Map_Name23  ; map_const RUINS_OF_ALPH_HO_OH_CHAMBER
	dw Dungeons_Map_Name24  ; map_const RUINS_OF_ALPH_KABUTO_CHAMBER
	dw Dungeons_Map_Name25  ; map_const RUINS_OF_ALPH_OMANYTE_CHAMBER
	dw Dungeons_Map_Name26  ; map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER
	dw Dungeons_Map_Name27  ; map_const RUINS_OF_ALPH_INNER_CHAMBER
	dw Dungeons_Map_Name28  ; map_const RUINS_OF_ALPH_RESEARCH_CENTER
	dw Dungeons_Map_Name29  ; map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	dw Dungeons_Map_Name30  ; map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	dw Dungeons_Map_Name31  ; map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	dw Dungeons_Map_Name32  ; map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM
	dw Dungeons_Map_Name33  ; map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM
	dw Dungeons_Map_Name34  ; map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM
	dw Dungeons_Map_Name35  ; map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	dw Dungeons_Map_Name36  ; map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	dw Dungeons_Map_Name37  ; map_const UNION_CAVE_1F
	dw Dungeons_Map_Name38  ; map_const UNION_CAVE_B1F
	dw Dungeons_Map_Name39  ; map_const UNION_CAVE_B2F
	dw Dungeons_Map_Name40  ; map_const SLOWPOKE_WELL_B1F
	dw Dungeons_Map_Name41  ; map_const SLOWPOKE_WELL_B2F
	dw Dungeons_Map_Name42  ; map_const OLIVINE_LIGHTHOUSE_1F
	dw Dungeons_Map_Name43  ; map_const OLIVINE_LIGHTHOUSE_2F
	dw Dungeons_Map_Name44  ; map_const OLIVINE_LIGHTHOUSE_3F
	dw Dungeons_Map_Name45  ; map_const OLIVINE_LIGHTHOUSE_4F
	dw Dungeons_Map_Name46  ; map_const OLIVINE_LIGHTHOUSE_5F
	dw Dungeons_Map_Name47  ; map_const OLIVINE_LIGHTHOUSE_6F
	dw Dungeons_Map_Name48  ; map_const MAHOGANY_MART_1F
	dw Dungeons_Map_Name49  ; map_const TEAM_ROCKET_BASE_B1F
	dw Dungeons_Map_Name50  ; map_const TEAM_ROCKET_BASE_B2F
	dw Dungeons_Map_Name51  ; map_const TEAM_ROCKET_BASE_B3F
	dw Dungeons_Map_Name52  ; map_const ILEX_FOREST
	dw Dungeons_Map_Name53  ; map_const GOLDENROD_UNDERGROUND
	dw Dungeons_Map_Name54  ; map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES
	dw Dungeons_Map_Name55  ; map_const GOLDENROD_DEPT_STORE_B1F
	dw Dungeons_Map_Name56  ; map_const GOLDENROD_UNDERGROUND_WAREHOUSE
	dw Dungeons_Map_Name57  ; map_const MOUNT_MORTAR_1F_OUTSIDE
	dw Dungeons_Map_Name58  ; map_const MOUNT_MORTAR_1F_INSIDE
	dw Dungeons_Map_Name59  ; map_const MOUNT_MORTAR_2F_INSIDE
	dw Dungeons_Map_Name60  ; map_const MOUNT_MORTAR_B1F
	dw Dungeons_Map_Name61  ; map_const ICE_PATH_1F
	dw Dungeons_Map_Name62  ; map_const ICE_PATH_B1F
	dw Dungeons_Map_Name63  ; map_const ICE_PATH_B2F_MAHOGANY_SIDE
	dw Dungeons_Map_Name64  ; map_const ICE_PATH_B2F_BLACKTHORN_SIDE
	dw Dungeons_Map_Name65  ; map_const ICE_PATH_B3F
	dw Dungeons_Map_Name66  ; map_const WHIRL_ISLAND_NW
	dw Dungeons_Map_Name67  ; map_const WHIRL_ISLAND_NE
	dw Dungeons_Map_Name68  ; map_const WHIRL_ISLAND_SW
	dw Dungeons_Map_Name69  ; map_const WHIRL_ISLAND_CAVE
	dw Dungeons_Map_Name70  ; map_const WHIRL_ISLAND_SE
	dw Dungeons_Map_Name71  ; map_const WHIRL_ISLAND_B1F
	dw Dungeons_Map_Name72  ; map_const WHIRL_ISLAND_B2F
	dw Dungeons_Map_Name73  ; map_const WHIRL_ISLAND_LUGIA_CHAMBER
	dw Dungeons_Map_Name74  ; map_const MT_SILVER_ROOM_1
	dw Dungeons_Map_Name75  ; map_const MT_SILVER_ROOM_2
	dw Dungeons_Map_Name77  ; map_const MT_SILVER_ITEM_ROOMS
	dw Dungeons_Map_Name78  ; map_const DARK_CAVE_VIOLET_ENTRANCE
	dw Dungeons_Map_Name79  ; map_const DARK_CAVE_BLACKTHORN_ENTRANCE
	dw Dungeons_Map_Name80  ; map_const DRAGONS_DEN_1F
	dw Dungeons_Map_Name81  ; map_const DRAGONS_DEN_B1F
	dw Dungeons_Map_Name82  ; map_const DRAGON_SHRINE
	dw Dungeons_Map_Name83  ; map_const TOHJO_FALLS
	dw Dungeons_Map_Name84  ; map_const DIGLETTS_CAVE
	dw Dungeons_Map_Name85  ; map_const VIRIDIAN_FOREST
	dw Dungeons_Map_Name86  ; map_const MOUNT_MOON_1F
	dw Dungeons_Map_Name87  ; map_const UNDERGROUND_PATH
	dw Dungeons_Map_Name88  ; map_const ROCK_TUNNEL_1F
	dw Dungeons_Map_Name89  ; map_const ROCK_TUNNEL_B1F
	dw Dungeons_Map_Name90  ; map_const VICTORY_ROAD_1F
	dw Dungeons_Map_Name91  ; map_const VICTORY_ROAD_2F
	dw Dungeons_Map_Name92  ; map_const VICTORY_ROAD_3F
	dw Dungeons_Map_Name93  ; map_const CERULEAN_CAVE_1F
	dw Dungeons_Map_Name94  ; map_const CERULEAN_CAVE_2F
	dw Dungeons_Map_Name95  ; map_const CERULEAN_CAVE_B1F
	dw Dungeons_Map_Name96  ; map_const RUINS_OF_ALPH_GS_BALL_CHAMBER
	dw Dungeons_Map_Name97  ; map_const RUINS_OF_ALPH_CAVE_ENTRANCE
	dw Dungeons_Map_Name98  ; map_const SLOWPOKE_WELL_ENTRANCE
	dw Dungeons_Map_Name99  ; map_const MOUNT_MOON_B1F
	dw Dungeons_Map_Name100 ; map_const MOUNT_MOON_B2F
	dw Dungeons_Map_Name101 ; map_const OLIVINE_LIGHTHOUSE_ELEVATOR
	assert_table_length NUM_DUNGEONS_MAPS

Dungeons_Map_Name1:   db "Sprout Tower 1F@"
Dungeons_Map_Name2:   db "Sprout Tower 2F@"
Dungeons_Map_Name3:   db "Sprout Tower 3F@"
Dungeons_Map_Name4:   db "Tin Tower 1F@"
Dungeons_Map_Name5:   db "Tin Tower 2F@"
Dungeons_Map_Name6:   db "Tin Tower 3F@"
Dungeons_Map_Name7:   db "Tin Tower 4F@"
Dungeons_Map_Name8:   db "Tin Tower 5F@"
Dungeons_Map_Name9:   db "Tin Tower 6F@"
Dungeons_Map_Name10:  db "Tin Tower 7F@"
Dungeons_Map_Name11:  db "Tin Tower 8F@"
Dungeons_Map_Name12:  db "Tin Tower 9F@"
Dungeons_Map_Name13:  db "Burned Tower 1F@"
Dungeons_Map_Name14:  db "Burned Tower B1F@"
Dungeons_Map_Name15:  db "National Park@"
Dungeons_Map_Name16:  db "Bug Contest@"
Dungeons_Map_Name17:  db "Radio Tower 1F@"
Dungeons_Map_Name18:  db "Radio Tower 2F@"
Dungeons_Map_Name19:  db "Radio Tower 3F@"
Dungeons_Map_Name20:  db "Radio Tower 4F@"
Dungeons_Map_Name21:  db "Radio Tower 5F@"
Dungeons_Map_Name22:  db "Ruins Of Alph@"
Dungeons_Map_Name23:  db "Ho-Oh Chamber@"
Dungeons_Map_Name24:  db "Kabuto Chamber@"
Dungeons_Map_Name25:  db "Omanyte Chamber@"
Dungeons_Map_Name26:  db "Aero Chamber@"
Dungeons_Map_Name27:  db "Ruins Chamber@"
Dungeons_Map_Name28:  db "Ruins Lab@"
Dungeons_Map_Name29:  db "Ho-Oh Item Room@"
Dungeons_Map_Name30:  db "Kabuto Item Room@"
Dungeons_Map_Name31:  db "Omanyte Item Room@"
Dungeons_Map_Name32:  db "Aero Item Room@"
Dungeons_Map_Name33:  db "Ho-Oh Word Room@"
Dungeons_Map_Name34:  db "Kabuto Word Room@"
Dungeons_Map_Name35:  db "Omanyte Word Room@"
Dungeons_Map_Name36:  db "Aero Word Room@"
Dungeons_Map_Name37:  db "Union Cave 1F@"
Dungeons_Map_Name38:  db "Union Cave B1F@"
Dungeons_Map_Name39:  db "Union Cave B2F@"
Dungeons_Map_Name40:  db "Slowpoke Well B1@"
Dungeons_Map_Name41:  db "Slowpoke Well B2@"
Dungeons_Map_Name42:  db "Lighthouse 1F@"
Dungeons_Map_Name43:  db "Lighthouse 2F@"
Dungeons_Map_Name44:  db "Lighthouse 3F@"
Dungeons_Map_Name45:  db "Lighthouse 4F@"
Dungeons_Map_Name46:  db "Lighthouse 5F@"
Dungeons_Map_Name47:  db "Lighthouse 6F@"
Dungeons_Map_Name48:  db "Mahogany <POKE>Mart@"
Dungeons_Map_Name49:  db "Rocket Base B1F@"
Dungeons_Map_Name50:  db "Rocket Base B2F@"
Dungeons_Map_Name51:  db "Rocket Base B3F@"
Dungeons_Map_Name52:  db "Ilex Forest@"
Dungeons_Map_Name53:  db "Gold. Underground@"
Dungeons_Map_Name54:  db "Gold. Switch Room@"
Dungeons_Map_Name55:  db "Gold. Dept B1F@"
Dungeons_Map_Name56:  db "Gold. Dept B1F@"
Dungeons_Map_Name57:  db "Mt. Mortar@"
Dungeons_Map_Name58:  db "Mt. Mortar 1F@"
Dungeons_Map_Name59:  db "Mt. Mortar 2F@"
Dungeons_Map_Name60:  db "Mt. Mortar B1F@"
Dungeons_Map_Name61:  db "Ice Path 1F@"
Dungeons_Map_Name62:  db "Ice Path B1F@"
Dungeons_Map_Name63:  db "Ice Path B2F W@"
Dungeons_Map_Name64:  db "Ice Path B2F E@"
Dungeons_Map_Name65:  db "Ice Path B3F@"
Dungeons_Map_Name66:  db "Whirl Islands NW@"
Dungeons_Map_Name67:  db "Whirl Islands NE@"
Dungeons_Map_Name68:  db "Whirl Islands SW@"
Dungeons_Map_Name69:  db "Whirl Cave@"
Dungeons_Map_Name70:  db "Whirl Islands SE@"
Dungeons_Map_Name71:  db "Whirl Islands B1F@"
Dungeons_Map_Name72:  db "Whirl Islands B2F@"
Dungeons_Map_Name73:  db "Whirl Chamber@"
Dungeons_Map_Name74:  db "Mt. Silver R1@"
Dungeons_Map_Name75:  db "Mt. Silver R2@"
Dungeons_Map_Name77:  db "Mt. Silver Room@"
Dungeons_Map_Name78:  db "Dark Cave, West@"	
Dungeons_Map_Name79:  db "Dark Cave, East@"
Dungeons_Map_Name80:  db "Dragons Den 1F@"
Dungeons_Map_Name81:  db "Dragons Den B1@"
Dungeons_Map_Name82:  db "Dragon Shrine@"
Dungeons_Map_Name83:  db "Tohjo Falls@"
Dungeons_Map_Name84:  db "Diglett's Cave@"
Dungeons_Map_Name85:  db "Viridian Forest@"
Dungeons_Map_Name86:  db "Mt. Moon 1F@"	
Dungeons_Map_Name87:  db "Underground Path@"
Dungeons_Map_Name88:  db "Rock Tunnel 1F@"
Dungeons_Map_Name89:  db "Rock Tunnel B1F@"
Dungeons_Map_Name90:  db "Victory Road 1F@"
Dungeons_Map_Name91:  db "Victory Road 2F@"
Dungeons_Map_Name92:  db "Victory Road 3F@"
Dungeons_Map_Name93:  db "Cerulean Cave 1F@"
Dungeons_Map_Name94:  db "Cerulean Cave 2F@"
Dungeons_Map_Name95:  db "Cerulean Cave B1F@"
Dungeons_Map_Name96:  db "GS Ball Chamber@"
Dungeons_Map_Name97:  db "Ruins of Alph Cave@"
Dungeons_Map_Name98:  db "Slowpoke Well Ent.@"
Dungeons_Map_Name99:  db "Mt. Moon B1F@"
Dungeons_Map_Name100: db "Mt. Moon B2F@"
Dungeons_Map_Name101: db "Lighthouse Elev.@"

Ecruteak_Map_Names:
	table_width 2
	dw Ecruteak_Map_Name1  ; map_const ROUTE_35
	dw Ecruteak_Map_Name2  ; map_const ROUTE_36
	dw Ecruteak_Map_Name3  ; map_const ROUTE_37
	dw Ecruteak_Map_Name4  ; map_const ECRUTEAK_TIN_TOWER_ENTRANCE
	dw Ecruteak_Map_Name5  ; map_const WISE_TRIOS_ROOM
	dw Ecruteak_Map_Name6  ; map_const ECRUTEAK_POKECENTER_1F
	dw Ecruteak_Map_Name7  ; map_const ECRUTEAK_LUGIA_SPEECH_HOUSE
	dw Ecruteak_Map_Name8  ; map_const DANCE_THEATRE
	dw Ecruteak_Map_Name9  ; map_const ECRUTEAK_MART
	dw Ecruteak_Map_Name10 ; map_const ECRUTEAK_GYM
	dw Ecruteak_Map_Name11 ; map_const ECRUTEAK_ITEMFINDER_HOUSE
	dw Ecruteak_Map_Name12 ; map_const ECRUTEAK_CITY
	dw Ecruteak_Map_Name13 ; map_const ECRUTEAK_FAIRY_FAMILY_HOUSE
	dw Ecruteak_Map_Name14 ; map_const ECRUTEAK_SWARM_HOUSE
	dw Ecruteak_Map_Name15 ; map_const ROUTE_35_GOLDENROD_GATE
	dw Ecruteak_Map_Name16 ; map_const ROUTE_35_NATIONAL_PARK_GATE
	dw Ecruteak_Map_Name17 ; map_const ROUTE_36_NATIONAL_PARK_GATE
	assert_table_length NUM_ECRUTEAK_MAPS

Ecruteak_Map_Name1:  db "Route 35@"
Ecruteak_Map_Name2:  db "Route 36@"
Ecruteak_Map_Name3:  db "Route 37@"
Ecruteak_Map_Name4:  db "Tin Tower Path@"
Ecruteak_Map_Name5:  db "Wise Trio Room@"
Ecruteak_Map_Name6:  db "Ecruteak <PKMN> Cen.@"
Ecruteak_Map_Name7:  db "Ecruteak House 1@"
Ecruteak_Map_Name8:  db "Dance Theater@"
Ecruteak_Map_Name9:  db "Ecruteak <POKE>Mart@"
Ecruteak_Map_Name10: db "Ecruteak Gym@"
Ecruteak_Map_Name11: db "Itemfinder House@"
Ecruteak_Map_Name12: db "Ecruteak City@"
Ecruteak_Map_Name13: db "Fairy House@"
Ecruteak_Map_Name14: db "Swarm House@"	
Ecruteak_Map_Name15: db "Route 35 Gate 1@"
Ecruteak_Map_Name16: db "Route 35 Gate 2@"
Ecruteak_Map_Name17: db "Route 36 Gate@"

Blackthorn_Map_Names:
	table_width 2
	dw Blackthorn_Map_Name1  ; map_const BLACKTHORN_GYM_1F
	dw Blackthorn_Map_Name2  ; map_const BLACKTHORN_GYM_2F
	dw Blackthorn_Map_Name3  ; map_const BLACKTHORN_DRAGON_SPEECH_HOUSE
	dw Blackthorn_Map_Name4  ; map_const BLACKTHORN_EMYS_HOUSE
	dw Blackthorn_Map_Name5  ; map_const BLACKTHORN_MART
	dw Blackthorn_Map_Name6  ; map_const BLACKTHORN_POKECENTER_1F
	dw Blackthorn_Map_Name7  ; map_const ROUTE_45
	dw Blackthorn_Map_Name8  ; map_const ROUTE_46
	dw Blackthorn_Map_Name9  ; map_const BLACKTHORN_CITY
	dw Blackthorn_Map_Name10 ; map_const BLACKTHORN_MOVE_TUTOR_HOUSE
	dw Blackthorn_Map_Name11 ; map_const MADAM_ITEMS_HOUSE
	assert_table_length NUM_BLACKTHORN_MAPS

Blackthorn_Map_Name1:  db "Blackthorn Gym@"
Blackthorn_Map_Name2:  db "Blackthorn Gym B1@"
Blackthorn_Map_Name3:  db "Dragon House@"
Blackthorn_Map_Name4:  db "Emy's House@"
Blackthorn_Map_Name5:  db "Blackthorn <POKE>Mart@"
Blackthorn_Map_Name6:  db "Blkth. <PKMN> Center@"
Blackthorn_Map_Name7:  db "Route 45@"
Blackthorn_Map_Name8:  db "Route 46@"
Blackthorn_Map_Name9:  db "Blackthorn City@"
Blackthorn_Map_Name10: db "Blackthorn House@"	
Blackthorn_Map_Name11: db "Madam Items@"

Cinnabar_Map_Names:
	table_width 2
	dw Cinnabar_Map_Name1  ; map_const CINNABAR_POKECENTER_1F
	dw Cinnabar_Map_Name2  ; map_const ROUTE_19_FUCHSIA_GATE
	dw Cinnabar_Map_Name3  ; map_const ROUTE_19
	dw Cinnabar_Map_Name4  ; map_const ROUTE_20
	dw Cinnabar_Map_Name5  ; map_const ROUTE_21
	dw Cinnabar_Map_Name6  ; map_const CINNABAR_ISLAND
	dw Cinnabar_Map_Name7  ; map_const CINNABAR_VOLCANO_1F
	dw Cinnabar_Map_Name8  ; map_const CINNABAR_VOLCANO_2F
	dw Cinnabar_Map_Name9  ; map_const CINNABAR_MOLTRES_NEST
	dw Cinnabar_Map_Name10 ; map_const SEAFOAM_GYM
	dw Cinnabar_Map_Name11 ; map_const SEAFOAM_ISLANDS_1F
	dw Cinnabar_Map_Name12 ; map_const SEAFOAM_ISLANDS_B1F
	dw Cinnabar_Map_Name13 ; map_const SEAFOAM_ISLANDS_B2F
	dw Cinnabar_Map_Name14 ; map_const SEAFOAM_ISLANDS_B3F
	dw Cinnabar_Map_Name15 ; map_const SEAFOAM_ISLANDS_B4F
	assert_table_length NUM_CINNABAR_MAPS

Cinnabar_Map_Name1:  db "Cinnabar <PKMN> Cen.@"
Cinnabar_Map_Name2:  db "Route 19 Gate@"
Cinnabar_Map_Name3:  db "Route 19@"
Cinnabar_Map_Name4:  db "Route 20@"
Cinnabar_Map_Name5:  db "Route 21@"
Cinnabar_Map_Name6:  db "Cinnabar Island@"
Cinnabar_Map_Name7:  db "Cinnabar Vol 1F@"
Cinnabar_Map_Name8:  db "Cinnabar Vol 2F@"
Cinnabar_Map_Name9:  db "Moltres Nest@"
Cinnabar_Map_Name10: db "Cinnabar Gym@"
Cinnabar_Map_Name11: db "Seafoam Isl. 1F@"
Cinnabar_Map_Name12: db "Seafoam Isl. B1F@"
Cinnabar_Map_Name13: db "Seafoam Isl. B2F@"
Cinnabar_Map_Name14: db "Seafoam Isl. B3F@"
Cinnabar_Map_Name15: db "Seafoam Isl. B4F@"

Cerulean_Map_Names:
	table_width 2
	dw Cerulean_Map_Name1  ; map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE
	dw Cerulean_Map_Name2  ; map_const CERULEAN_POLICE_STATION
	dw Cerulean_Map_Name3  ; map_const CERULEAN_TRADE_SPEECH_HOUSE
	dw Cerulean_Map_Name4  ; map_const CERULEAN_POKECENTER_1F
	dw Cerulean_Map_Name5  ; map_const CERULEAN_GYM
	dw Cerulean_Map_Name6  ; map_const CERULEAN_MART
	dw Cerulean_Map_Name7  ; map_const ROUTE_10_POKECENTER_1F
	dw Cerulean_Map_Name8  ; map_const POWER_PLANT
	dw Cerulean_Map_Name9  ; map_const BILLS_HOUSE
	dw Cerulean_Map_Name10 ; map_const ROUTE_4
	dw Cerulean_Map_Name11 ; map_const ROUTE_5
	dw Cerulean_Map_Name12 ; map_const ROUTE_9
	dw Cerulean_Map_Name13 ; map_const ROUTE_10_NORTH
	dw Cerulean_Map_Name14 ; map_const ROUTE_24
	dw Cerulean_Map_Name15 ; map_const ROUTE_25
	dw Cerulean_Map_Name16 ; map_const CERULEAN_CITY
	dw Cerulean_Map_Name17 ; map_const ROUTE_4_ZAPDOS_NEST
	dw Cerulean_Map_Name18 ; map_const CERULEAN_EMPTY_HOUSE
	dw Cerulean_Map_Name19 ; map_const CERULEAN_EMPTY_HOUSE_UNDERGROUND
	assert_table_length NUM_CERULEAN_MAPS

Cerulean_Map_Name1:  db "Cerulean House 1@"
Cerulean_Map_Name2:  db "Police Station@"
Cerulean_Map_Name3:  db "Cerulean House 2@"
Cerulean_Map_Name4:  db "Cerulean <PKMN> Cen.@"
Cerulean_Map_Name5:  db "Cerulean Gym@"
Cerulean_Map_Name6:  db "Cerulean <POKE>Mart@"
Cerulean_Map_Name7:  db "Route 10 <PKMN> Cen.@"
Cerulean_Map_Name8:  db "Power Plant@"
Cerulean_Map_Name9:  db "Bill's House@"
Cerulean_Map_Name10: db "Route 4@"
Cerulean_Map_Name11: db "Route 5@"
Cerulean_Map_Name12: db "Route 9@"
Cerulean_Map_Name13: db "Route 10 North@"
Cerulean_Map_Name14: db "Route 24@"
Cerulean_Map_Name15: db "Route 25@"
Cerulean_Map_Name16: db "Cerulean City@"
Cerulean_Map_Name17: db "Zapdos Nest@"
Cerulean_Map_Name18: db "Cerulean House@"
Cerulean_Map_Name19: db "???@"

Azalea_Map_Names:
	table_width 2
	dw Azalea_Map_Name1 ; map_const AZALEA_POKECENTER_1F
	dw Azalea_Map_Name2 ; map_const CHARCOAL_KILN
	dw Azalea_Map_Name3 ; map_const AZALEA_MART
	dw Azalea_Map_Name4 ; map_const KURTS_HOUSE
	dw Azalea_Map_Name5 ; map_const AZALEA_GYM
	dw Azalea_Map_Name6 ; map_const ROUTE_33
	dw Azalea_Map_Name7 ; map_const AZALEA_TOWN
	assert_table_length NUM_AZALEA_MAPS

Azalea_Map_Name1: db "Azalea <PKMN> Center@"
Azalea_Map_Name2: db "Charcoal Kiln@"
Azalea_Map_Name3: db "Azalea <POKE>Mart@"
Azalea_Map_Name4: db "Kurt's House@"
Azalea_Map_Name5: db "Azalea Gym@"
Azalea_Map_Name6: db "Route 33@"
Azalea_Map_Name7: db "Azalea Town@"

Lake_of_Rage_Map_Names:
	table_width 2
	dw Lake_of_Rage_Map_Name1 ; map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE
	dw Lake_of_Rage_Map_Name2 ; map_const LAKE_OF_RAGE_MAGIKARP_HOUSE
	dw Lake_of_Rage_Map_Name3 ; map_const ROUTE_43_MAHOGANY_GATE
	dw Lake_of_Rage_Map_Name4 ; map_const ROUTE_43_GATE
	dw Lake_of_Rage_Map_Name5 ; map_const ROUTE_43
	dw Lake_of_Rage_Map_Name6 ; map_const LAKE_OF_RAGE
	assert_table_length NUM_LAKE_OF_RAGE_MAPS

Lake_of_Rage_Map_Name1: db "Hidden Power Hs@"
Lake_of_Rage_Map_Name2: db "Magikarp House@"
Lake_of_Rage_Map_Name3: db "Rt 43 Gate 1@"
Lake_of_Rage_Map_Name4: db "Rt 43 Gate 2@"
Lake_of_Rage_Map_Name5: db "Route 43@"
Lake_of_Rage_Map_Name6: db "Lake Of Rage@" 

Violet_Map_Names:
	table_width 2
	dw Violet_Map_Name1  ; map_const ROUTE_32
	dw Violet_Map_Name2  ; map_const VIOLET_CITY
	dw Violet_Map_Name3  ; map_const VIOLET_MART
	dw Violet_Map_Name4  ; map_const VIOLET_GYM
	dw Violet_Map_Name5  ; map_const EARLS_POKEMON_ACADEMY
	dw Violet_Map_Name6  ; map_const VIOLET_NICKNAME_SPEECH_HOUSE
	dw Violet_Map_Name7  ; map_const VIOLET_POKECENTER_1F
	dw Violet_Map_Name8  ; map_const VIOLET_KYLES_HOUSE
	dw Violet_Map_Name9  ; map_const VIOLET_PRIMOS_HOUSE
	dw Violet_Map_Name10 ; map_const ROUTE_32_RUINS_OF_ALPH_GATE
	dw Violet_Map_Name11 ; map_const ROUTE_32_POKECENTER_1F
	dw Violet_Map_Name12 ; map_const ROUTE_36_RUINS_OF_ALPH_GATE
	dw Violet_Map_Name13 ; map_const ROUTE_36_VIOLET_GATE
	dw Violet_Map_Name14 ; map_const EARLS_POKEMON_ACADEMY_B1F
	assert_table_length NUM_VIOLET_MAPS

Violet_Map_Name1:  db "Route 32@"
Violet_Map_Name2:  db "Violet City@"
Violet_Map_Name3:  db "Violet <POKE>Mart@"
Violet_Map_Name4:  db "Violet Gym@"
Violet_Map_Name5:  db "Earl's Academy@"
Violet_Map_Name6:  db "Violet House 1@"
Violet_Map_Name7:  db "Violet <PKMN> Center@"
Violet_Map_Name8:  db "Kyle's House@"
Violet_Map_Name9:  db "Primo's House@"
Violet_Map_Name10: db "Route 32 Gate 1@"
Violet_Map_Name11: db "Route 32 <PKMN> Cen.@"
Violet_Map_Name12: db "Route 36 Gate 2@"
Violet_Map_Name13: db "Route 36 Gate 1@"
Violet_Map_Name14: db "Earl's Academy B1F@"

Goldenrod_Map_Names:
	table_width 2
	dw Goldenrod_Map_Name1  ; map_const ROUTE_34
	dw Goldenrod_Map_Name2  ; map_const GOLDENROD_CITY
	dw Goldenrod_Map_Name3  ; map_const GOLDENROD_GYM
	dw Goldenrod_Map_Name4  ; map_const GOLDENROD_BIKE_SHOP
	dw Goldenrod_Map_Name5  ; map_const GOLDENROD_HAPPINESS_RATER
	dw Goldenrod_Map_Name6  ; map_const BILLS_FAMILYS_HOUSE
	dw Goldenrod_Map_Name7  ; map_const GOLDENROD_MAGNET_TRAIN_STATION
	dw Goldenrod_Map_Name8  ; map_const GOLDENROD_FLOWER_SHOP
	dw Goldenrod_Map_Name9  ; map_const GOLDENROD_PP_SPEECH_HOUSE
	dw Goldenrod_Map_Name10 ; map_const GOLDENROD_NAME_RATER
	dw Goldenrod_Map_Name11 ; map_const GOLDENROD_DEPT_STORE_1F
	dw Goldenrod_Map_Name12 ; map_const GOLDENROD_DEPT_STORE_2F
	dw Goldenrod_Map_Name13 ; map_const GOLDENROD_DEPT_STORE_3F
	dw Goldenrod_Map_Name14 ; map_const GOLDENROD_DEPT_STORE_4F
	dw Goldenrod_Map_Name15 ; map_const GOLDENROD_DEPT_STORE_5F
	dw Goldenrod_Map_Name16 ; map_const GOLDENROD_DEPT_STORE_6F
	dw Goldenrod_Map_Name17 ; map_const GOLDENROD_DEPT_STORE_ELEVATOR
	dw Goldenrod_Map_Name18 ; map_const GOLDENROD_DEPT_STORE_ROOF
	dw Goldenrod_Map_Name19 ; map_const GOLDENROD_GAME_CORNER
	dw Goldenrod_Map_Name20 ; map_const GOLDENROD_POKECENTER_1F
	dw Goldenrod_Map_Name21 ; map_const ILEX_FOREST_AZALEA_GATE
	dw Goldenrod_Map_Name22 ; map_const ROUTE_34_ILEX_FOREST_GATE
	dw Goldenrod_Map_Name23 ; map_const DAY_CARE
	dw Goldenrod_Map_Name24 ; map_const GOLDENROD_HOME_DECOR_STORE_1
	dw Goldenrod_Map_Name25 ; map_const GOLDENROD_HOME_DECOR_STORE_2
	dw Goldenrod_Map_Name26 ; map_const GOLDENROD_HOME_DECOR_STORE_3
	dw Goldenrod_Map_Name27 ; map_const GOLDENROD_HOME_DECOR_STORE_4
	dw Goldenrod_Map_Name28 ; map_const GOLDENROD_FLOWER_SHOP_GARDEN
	assert_table_length NUM_GOLDENROD_MAPS

Goldenrod_Map_Name1:  db "Route 34@"
Goldenrod_Map_Name2:  db "Goldenrod City@"
Goldenrod_Map_Name3:  db "Goldenrod Gym@"
Goldenrod_Map_Name4:  db "Gold. Bike Shop@"
Goldenrod_Map_Name5:  db "Happiness Rater@"
Goldenrod_Map_Name6:  db "Bill's Fam. House@"
Goldenrod_Map_Name7:  db "Train Station 1@"
Goldenrod_Map_Name8:  db "Flower Shop@"
Goldenrod_Map_Name9:  db "Goldenrod House 1"
Goldenrod_Map_Name10: db "Gold. Name Rater@"
Goldenrod_Map_Name11: db "Gold.DeptStore 1F@"
Goldenrod_Map_Name12: db "Gold.DeptStore 2F@"
Goldenrod_Map_Name13: db "Gold.DeptStore 3F@"
Goldenrod_Map_Name14: db "Gold.DeptStore 4F@"
Goldenrod_Map_Name15: db "Gold.DeptStore 5F@"
Goldenrod_Map_Name16: db "Gold.DeptStore 6F@"
Goldenrod_Map_Name17: db "Gold. Dept Lift@"
Goldenrod_Map_Name18: db "Gold. Dept Roof@"
Goldenrod_Map_Name19: db "Gold. Game Corner@"
Goldenrod_Map_Name20: db "Goldenrod <PKMN> Cen.@"
Goldenrod_Map_Name21: db "Azalea Gate@"
Goldenrod_Map_Name22: db "Ilex Gate@"
Goldenrod_Map_Name23: db "Johto DayCare@"
Goldenrod_Map_Name24: db "Gold.DecorStore 1@"
Goldenrod_Map_Name25: db "Gold.DecorStore 2@"
Goldenrod_Map_Name26: db "Gold.DecorStore 3@"
Goldenrod_Map_Name27: db "Gold.DecorStore 4@"
Goldenrod_Map_Name28: db "Flower Shop Garden@"

Vermilion_Map_Names:
	table_width 2
	dw Vermilion_Map_Name1  ; map_const ROUTE_6
	dw Vermilion_Map_Name2  ; map_const ROUTE_11
	dw Vermilion_Map_Name3  ; map_const VERMILION_CITY
	dw Vermilion_Map_Name4  ; map_const VERMILION_FISHING_SPEECH_HOUSE
	dw Vermilion_Map_Name5  ; map_const VERMILION_POKECENTER_1F
	dw Vermilion_Map_Name6  ; map_const POKEMON_FAN_CLUB
	dw Vermilion_Map_Name7  ; map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE
	dw Vermilion_Map_Name8  ; map_const VERMILION_MART
	dw Vermilion_Map_Name9  ; map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE
	dw Vermilion_Map_Name10 ; map_const VERMILION_GYM
	dw Vermilion_Map_Name11 ; map_const ROUTE_6_SAFFRON_GATE
	dw Vermilion_Map_Name12 ; map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE
	dw Vermilion_Map_Name13 ; map_const ROUTE_11_ROUTE_12_GATE
	dw Vermilion_Map_Name14 ; map_const VERMILION_SAILORS_HOUSE
	assert_table_length NUM_VERMILION_MAPS

Vermilion_Map_Name1:  db "Route 6@"
Vermilion_Map_Name2:  db "Route 11@"
Vermilion_Map_Name3:  db "Vermilion City@"
Vermilion_Map_Name4:  db "Vermilion House 1@"
Vermilion_Map_Name5:  db "Vermilion <PKMN> Cen.@"
Vermilion_Map_Name6:  db "Vermilion FanClub@"
Vermilion_Map_Name7:  db "Vermilion House 2@"
Vermilion_Map_Name8:  db "Vermilion <POKE>Mart@"
Vermilion_Map_Name9:  db "Vermilion House 3@"
Vermilion_Map_Name10: db "Vermilion Gym@"
Vermilion_Map_Name11: db "Route 6 Gate@"
Vermilion_Map_Name12: db "Route 6 Undergrnd@"
Vermilion_Map_Name13: db "Route 11 Gate.@" 
Vermilion_Map_Name14: db "Vermil Sailor Hse@" 

Pallet_Map_Names:
	table_width 2
	dw Pallet_Map_Name1 ; map_const ROUTE_1
	dw Pallet_Map_Name2 ; map_const PALLET_TOWN
	dw Pallet_Map_Name3 ; map_const REDS_HOUSE_1F
	dw Pallet_Map_Name4 ; map_const REDS_HOUSE_2F
	dw Pallet_Map_Name5 ; map_const BLUES_HOUSE
	dw Pallet_Map_Name6 ; map_const OAKS_LAB
	dw Pallet_Map_Name7 ; map_const ROUTE_1_VIRIDIAN_GATE
	assert_table_length NUM_PALLET_MAPS

Pallet_Map_Name1: db "Route 1@"
Pallet_Map_Name2: db "Pallet Town@"
Pallet_Map_Name3: db "Red's House 1F@"
Pallet_Map_Name4: db "Red's House 2F@"
Pallet_Map_Name5: db "Blue's House@"
Pallet_Map_Name6: db "Oak's Lab@"
Pallet_Map_Name7: db "Route 1 Gate.@"

Pewter_Map_Names:
	table_width 2
	dw Pewter_Map_Name1  ; map_const ROUTE_3
	dw Pewter_Map_Name2  ; map_const PEWTER_CITY
	dw Pewter_Map_Name3  ; map_const PEWTER_NIDORAN_SPEECH_HOUSE
	dw Pewter_Map_Name4  ; map_const PEWTER_GYM
	dw Pewter_Map_Name5  ; map_const PEWTER_MART
	dw Pewter_Map_Name6  ; map_const PEWTER_POKECENTER_1F
	dw Pewter_Map_Name7  ; map_const PEWTER_SNOOZE_SPEECH_HOUSE
	dw Pewter_Map_Name8  ; map_const ROUTE_3_POKECENTER_1F
	dw Pewter_Map_Name9  ; map_const PEWTER_MUSEUM_1F
	dw Pewter_Map_Name10 ; map_const PEWTER_MUSEUM_2F
	assert_table_length NUM_PEWTER_MAPS

Pewter_Map_Name1:  db "Route 3@"
Pewter_Map_Name2:  db "Pewter City@"
Pewter_Map_Name3:  db "Pewter House 1@"
Pewter_Map_Name4:  db "Pewter Gym@"
Pewter_Map_Name5:  db "Pewter <POKE>Mart@"
Pewter_Map_Name6:  db "Pewter <PKMN> Center@"
Pewter_Map_Name7:  db "Pewter House 2@"
Pewter_Map_Name8:  db "Route 3 <PKMN> Cen.@" 
Pewter_Map_Name9:  db "Pewter Museum 1F@" 
Pewter_Map_Name10: db "Pewter Museum 2F@"

Fast_Ship_Map_Names:
	table_width 2
	dw Fast_Ship_Map_Name1  ; map_const OLIVINE_PORT
	dw Fast_Ship_Map_Name2  ; map_const VERMILION_PORT
	dw Fast_Ship_Map_Name3  ; map_const FAST_SHIP_1F
	dw Fast_Ship_Map_Name4  ; map_const FAST_SHIP_CABINS_NNW_NNE_NE
	dw Fast_Ship_Map_Name5  ; map_const FAST_SHIP_CABINS_SW_SSW_NW
	dw Fast_Ship_Map_Name6  ; map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	dw Fast_Ship_Map_Name7  ; map_const FAST_SHIP_B1F
	dw Fast_Ship_Map_Name8  ; map_const OLIVINE_PORT_PASSAGE
	dw Fast_Ship_Map_Name9  ; map_const VERMILION_PORT_PASSAGE
	dw Fast_Ship_Map_Name10 ; map_const MOUNT_MOON_SQUARE
	dw Fast_Ship_Map_Name11 ; map_const MOUNT_MOON_GIFT_SHOP
	dw Fast_Ship_Map_Name12 ; map_const TIN_TOWER_ROOF
	dw Fast_Ship_Map_Name13 ; map_const FARAWAY_ISLAND_OUTSIDE
	dw Fast_Ship_Map_Name14 ; map_const FARAWAY_ISLAND_INSIDE
	assert_table_length NUM_FAST_SHIP_MAPS

Fast_Ship_Map_Name1:  db "Olivine Marina@"
Fast_Ship_Map_Name2:  db "Vermilion Marina@"
Fast_Ship_Map_Name3:  db "S.S. Aqua@"
Fast_Ship_Map_Name4:  db "S.S. Aqua Cabins@"
Fast_Ship_Map_Name5:  db "S.S. Aqua Cabins@"
Fast_Ship_Map_Name6:  db "S.S. Aqua CptQtrs@"
Fast_Ship_Map_Name7:  db "S.S. Aqua Galley@"
Fast_Ship_Map_Name8:  db "Johto PortPassage@"
Fast_Ship_Map_Name9:  db "Kanto PortPassage@"
Fast_Ship_Map_Name10: db "Mt. Moon Square@"
Fast_Ship_Map_Name11: db "Mt. Moon Shop@"
Fast_Ship_Map_Name12: db "Tin Tower Roof@"
Fast_Ship_Map_Name13: db "Faraway Island@"  
Fast_Ship_Map_Name14: db "Faraway Island@"   

Indigo_Map_Names:
	table_width 2
	dw Indigo_Map_Name1 ; map_const ROUTE_23
	dw Indigo_Map_Name2 ; map_const INDIGO_PLATEAU_POKECENTER_1F
	dw Indigo_Map_Name3 ; map_const WILLS_ROOM
	dw Indigo_Map_Name4 ; map_const KOGAS_ROOM
	dw Indigo_Map_Name5 ; map_const BRUNOS_ROOM
	dw Indigo_Map_Name6 ; map_const KARENS_ROOM
	dw Indigo_Map_Name7 ; map_const LANCES_ROOM
	dw Indigo_Map_Name8 ; map_const HALL_OF_FAME
	dw Indigo_Map_Name9 ; map_const INDIGO_PLATEAU
	assert_table_length NUM_INDIGO_MAPS

Indigo_Map_Name1: db "Route 23@"
Indigo_Map_Name2: db "Indigo Plateau@"
Indigo_Map_Name3: db "E4 Will's Room@"
Indigo_Map_Name4: db "E4 Koga's Room@"
Indigo_Map_Name5: db "E4 Bruno's Room@"
Indigo_Map_Name6: db "E4 Karen's Room@"
Indigo_Map_Name7: db "E4 Lance's Room@"
Indigo_Map_Name8: db "E4 Hall Of Fame@"
Indigo_Map_Name9: db "Indigo Plateau@" 

Fuchsia_Map_Names:
	table_width 2
	dw Fuchsia_Map_Name1  ; map_const ROUTE_12
	dw Fuchsia_Map_Name2  ; map_const ROUTE_12_SUPER_ROD_HOUSE
	dw Fuchsia_Map_Name3  ; map_const ROUTE_13
	dw Fuchsia_Map_Name4  ; map_const ROUTE_14
	dw Fuchsia_Map_Name5  ; map_const ROUTE_15
	dw Fuchsia_Map_Name6  ; map_const ROUTE_16
	dw Fuchsia_Map_Name7  ; map_const ROUTE_17
	dw Fuchsia_Map_Name8  ; map_const ROUTE_18_WEST
	dw Fuchsia_Map_Name9  ; map_const ROUTE_18_EAST
	dw Fuchsia_Map_Name10 ; map_const FUCHSIA_CITY
	dw Fuchsia_Map_Name11 ; map_const FUCHSIA_MART
	dw Fuchsia_Map_Name12 ; map_const SAFARI_ZONE_FUCHSIA_GATE
	dw Fuchsia_Map_Name13 ; map_const FUCHSIA_GYM
	dw Fuchsia_Map_Name14 ; map_const BILLS_OLDER_SISTERS_HOUSE
	dw Fuchsia_Map_Name15 ; map_const FUCHSIA_POKECENTER_1F
	dw Fuchsia_Map_Name16 ; map_const SAFARI_ZONE_WARDENS_HOME
	dw Fuchsia_Map_Name17 ; map_const ROUTE_15_FUCHSIA_GATE
	dw Fuchsia_Map_Name18 ; map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE
	dw Fuchsia_Map_Name19 ; map_const ROUTE_16_GATE
	dw Fuchsia_Map_Name20 ; map_const ROUTE_18_EAST_WEST_GATE
	dw Fuchsia_Map_Name21 ; map_const FUCHSIA_CINNABAR_HOUSE_1
	assert_table_length NUM_FUCHSIA_MAPS

Fuchsia_Map_Name1:  db "Route 12@"
Fuchsia_Map_Name2:  db "Route 12 Angler@"
Fuchsia_Map_Name3:  db "Route 13@"
Fuchsia_Map_Name4:  db "Route 14@"
Fuchsia_Map_Name5:  db "Route 15@"
Fuchsia_Map_Name6:  db "Route 16@"
Fuchsia_Map_Name7:  db "Route 17@"
Fuchsia_Map_Name8:
Fuchsia_Map_Name9:  db "Route 18@"
Fuchsia_Map_Name10: db "Fuchsia City@"
Fuchsia_Map_Name11: db "Fuchsia <POKE>Mart@"
Fuchsia_Map_Name12: db "Safari Zone Gate@"
Fuchsia_Map_Name13: db "Fuchsia Gym@"
Fuchsia_Map_Name14: db "Bill's Sis' House@"
Fuchsia_Map_Name15: db "Fuchsia <PKMN> Center@"
Fuchsia_Map_Name16: db "Warden's House@" 
Fuchsia_Map_Name17: db "Route 15 Gate@"
Fuchsia_Map_Name18: db "Route 16 House@"
Fuchsia_Map_Name19: db "Route 16 Gate@"
Fuchsia_Map_Name20: db "Route 18 Gate@"
Fuchsia_Map_Name21: db "Fuchsia House@"

Lavender_Map_Names:
	table_width 2
	dw Lavender_Map_Name1  ; map_const ROUTE_8
	dw Lavender_Map_Name2  ; map_const ROUTE_10_SOUTH
	dw Lavender_Map_Name3  ; map_const LAVENDER_TOWN
	dw Lavender_Map_Name4  ; map_const LAVENDER_POKECENTER_1F
	dw Lavender_Map_Name5  ; map_const MR_FUJIS_HOUSE
	dw Lavender_Map_Name6  ; map_const LAVENDER_SPEECH_HOUSE
	dw Lavender_Map_Name7  ; map_const LAVENDER_NAME_RATER
	dw Lavender_Map_Name8  ; map_const LAVENDER_MART
	dw Lavender_Map_Name9  ; map_const SOUL_HOUSE
	dw Lavender_Map_Name10 ; map_const LAV_RADIO_TOWER_1F
	dw Lavender_Map_Name11 ; map_const ROUTE_12_LAVENDER_GATE
	dw Lavender_Map_Name12 ; map_const ROUTE_8_SAFFRON_GATE
	assert_table_length NUM_LAVENDER_MAPS

Lavender_Map_Name1:  db "Route 8@"
Lavender_Map_Name2:  db "Route 10 S.@"
Lavender_Map_Name3:  db "Lavender Town@"
Lavender_Map_Name4:  db "Lavender <PKMN> Cen.@"
Lavender_Map_Name5:  db "Mr.Fuji's House@"
Lavender_Map_Name6:  db "Lavender House 1@"
Lavender_Map_Name7:  db "Kanto Name Rater@"
Lavender_Map_Name8:  db "Lavender <POKE>Mart@"
Lavender_Map_Name9:  db "Soul House@"
Lavender_Map_Name10: db "Kanto Radio Tower@"
Lavender_Map_Name11: db "Route 12 Gate@"   
Lavender_Map_Name12: db "Route 8 Gate@"

Silver_Map_Names:
	table_width 2
	dw Silver_Map_Name1 ; map_const ROUTE_28
	dw Silver_Map_Name2 ; map_const MT_SILVER_OUTSIDE
	dw Silver_Map_Name3 ; map_const MT_SILVER_POKECENTER_1F
	dw Silver_Map_Name4 ; map_const ROUTE_28_STEEL_WING_HOUSE
	dw Silver_Map_Name4 ; map_const MT_SILVER_PEAK
	assert_table_length NUM_SILVER_MAPS

Silver_Map_Name1: db "Route 28@"
Silver_Map_Name2: db "Mt. Silver@"	
Silver_Map_Name3: db "Silver <PKMN> Cen.@"
Silver_Map_Name4: db "Route 28 Cabin@"      
Silver_Map_Name5: db "Mt. Silver Peak@"

Cable_Club_Map_Names:
	table_width 2
	dw Cable_Club_Map_Name1 ; map_const POKECENTER_2F
	dw Cable_Club_Map_Name2 ; map_const TRADE_CENTER
	dw Cable_Club_Map_Name3 ; map_const COLOSSEUM
	assert_table_length NUM_CABLE_CLUB_MAPS

Cable_Club_Map_Name1: db "<PKMN> Center 2F@"
Cable_Club_Map_Name2: db "<PKMN> Trade Center@"
Cable_Club_Map_Name3: db "<PKMN> Colosseum@"

Celadon_Map_Names:
	table_width 2
	dw Celadon_Map_Name1  ; map_const ROUTE_7
	dw Celadon_Map_Name2  ; map_const CELADON_CITY
	dw Celadon_Map_Name3  ; map_const CELADON_DEPT_STORE_1F
	dw Celadon_Map_Name4  ; map_const CELADON_DEPT_STORE_2F
	dw Celadon_Map_Name5  ; map_const CELADON_DEPT_STORE_3F
	dw Celadon_Map_Name6  ; map_const CELADON_DEPT_STORE_4F
	dw Celadon_Map_Name7  ; map_const CELADON_DEPT_STORE_5F
	dw Celadon_Map_Name8  ; map_const CELADON_DEPT_STORE_6F
	dw Celadon_Map_Name9  ; map_const CELADON_DEPT_STORE_ELEVATOR
	dw Celadon_Map_Name10 ; map_const CELADON_MANSION_1F
	dw Celadon_Map_Name11 ; map_const CELADON_MANSION_2F
	dw Celadon_Map_Name12 ; map_const CELADON_MANSION_3F
	dw Celadon_Map_Name13 ; map_const CELADON_MANSION_ROOF
	dw Celadon_Map_Name14 ; map_const CELADON_MANSION_ROOF_HOUSE
	dw Celadon_Map_Name15 ; map_const CELADON_POKECENTER_1F
	dw Celadon_Map_Name16 ; map_const CELADON_GAME_CORNER
	dw Celadon_Map_Name17 ; map_const CELADON_GAME_CORNER_PRIZE_ROOM
	dw Celadon_Map_Name18 ; map_const CELADON_GYM
	dw Celadon_Map_Name19 ; map_const CELADON_CAFE
	dw Celadon_Map_Name20 ; map_const ROUTE_7_SAFFRON_GATE
	dw Celadon_Map_Name21 ; map_const CELADON_HOME_DECO_STORE_1F
	dw Celadon_Map_Name22 ; map_const CELADON_HOME_DECO_STORE_B1F
	dw Celadon_Map_Name23 ; map_const CELADON_HOME_DECO_STORE_B2F
	dw Celadon_Map_Name24 ; map_const CELADON_CURSE_HOUSE
	dw Celadon_Map_Name25 ; map_const CELADON_HOTEL_1F
	dw Celadon_Map_Name26 ; map_const CELADON_HOTEL_POOL
	dw Celadon_Map_Name27 ; map_const EUSINES_HOUSE
	dw Celadon_Map_Name28 ; map_const ROUTE_7_UNDERGROUND_PATH_ENTRANCE
	dw Celadon_Map_Name29 ; map_const ROCKET_UNDERGROUND_TUNNEL
	dw Celadon_Map_Name30 ; map_const CELADON_ROCKET_HIDEOUT_B4F
	assert_table_length NUM_CELADON_MAPS

Celadon_Map_Name1:  db "Route 7@"
Celadon_Map_Name2:  db "Celadon City@"
Celadon_Map_Name3:  db "Cel. DeptStore 1F@"
Celadon_Map_Name4:  db "Cel. DeptStore 2F@"
Celadon_Map_Name5:  db "Cel. DeptStore 3F@"
Celadon_Map_Name6:  db "Cel. DeptStore 4F@"
Celadon_Map_Name7:  db "Cel. DeptStore 5F@"
Celadon_Map_Name8:  db "Cel. DeptStore 6F@"
Celadon_Map_Name9:  db "Celadon Dept Lift@"
Celadon_Map_Name10: db "Celadon Mansion1F@"
Celadon_Map_Name11: db "Celadon Mansion2F@"
Celadon_Map_Name12: db "Celadon Mansion3F@"
Celadon_Map_Name13: db "Cel. Mansion Roof@"
Celadon_Map_Name14: db "Granny's House@"
Celadon_Map_Name15: db "Celadon <PKMN> Center@"
Celadon_Map_Name16: db "Cel. Game Corner@"
Celadon_Map_Name17: db "Celadon PrizeRoom@"
Celadon_Map_Name18: db "Celadon Gym@"
Celadon_Map_Name19: db "Celadon Cafe@"
Celadon_Map_Name20: db "Route 7 Gate@"
Celadon_Map_Name21: db "Cel. DecoStore 1F@" 
Celadon_Map_Name22: db "Cel. DecoStore B1F@" 
Celadon_Map_Name23: db "Cel. DecoStore B2F@" 
Celadon_Map_Name24: db "Celadon House@" 
Celadon_Map_Name25: db "Celadon Hotel 1F@"
Celadon_Map_Name26: db "Celadon Hotel Pool@"
Celadon_Map_Name27: db "Eusine's House@"
Celadon_Map_Name28: db "Route 7 Undergrnd@"
Celadon_Map_Name29: db "???@"
Celadon_Map_Name30: db "???@"

Cianwood_Map_Names:
	table_width 2
	dw Cianwood_Map_Name1  ; map_const ROUTE_40
	dw Cianwood_Map_Name2  ; map_const ROUTE_41
	dw Cianwood_Map_Name3  ; map_const CIANWOOD_CITY
	dw Cianwood_Map_Name4  ; map_const MANIAS_HOUSE
	dw Cianwood_Map_Name5  ; map_const CIANWOOD_GYM
	dw Cianwood_Map_Name6  ; map_const CIANWOOD_POKECENTER_1F
	dw Cianwood_Map_Name7  ; map_const CIANWOOD_PHARMACY
	dw Cianwood_Map_Name8  ; map_const CIANWOOD_LUGIA_SPEECH_HOUSE
	dw Cianwood_Map_Name9  ; map_const CIANWOOD_BEASTS_HOUSE
	dw Cianwood_Map_Name10 ; map_const CIANWOOD_MOVE_TUTOR_HOUSE
	dw Cianwood_Map_Name11 ; map_const CIANWOOD_PHOTO_STUDIO
	assert_table_length NUM_CIANWOOD_MAPS

Cianwood_Map_Name1:  db "Route 40@"
Cianwood_Map_Name2:  db "Route 41@"
Cianwood_Map_Name3:  db "Cianwood City@"
Cianwood_Map_Name4:  db "Mania's House@"
Cianwood_Map_Name5:  db "Cianwood Gym@"
Cianwood_Map_Name6:  db "Cianwood <PKMN> Cen.@"
Cianwood_Map_Name7:  db "Cianwood Pharmacy@"
Cianwood_Map_Name8:  db "Cianwood House@"
Cianwood_Map_Name9:  db "Beasts House@"
Cianwood_Map_Name10: db "Cianwood Tutor@"
Cianwood_Map_Name11: db "Photo Studio@"

Viridian_Map_Names:
	table_width 2
	dw Viridian_Map_Name1  ; map_const ROUTE_2
	dw Viridian_Map_Name2  ; map_const ROUTE_22
	dw Viridian_Map_Name3  ; map_const ROUTE_26
	dw Viridian_Map_Name4  ; map_const VIRIDIAN_CITY
	dw Viridian_Map_Name5  ; map_const VIRIDIAN_GYM
	dw Viridian_Map_Name6  ; map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE
	dw Viridian_Map_Name7  ; map_const TRAINER_HOUSE_1F
	dw Viridian_Map_Name8  ; map_const TRAINER_HOUSE_B1F
	dw Viridian_Map_Name9  ; map_const VIRIDIAN_MART
	dw Viridian_Map_Name10 ; map_const VIRIDIAN_POKECENTER_1F
	dw Viridian_Map_Name11 ; map_const ROUTE_2_NUGGET_HOUSE
	dw Viridian_Map_Name12 ; map_const ROUTE_2_GATE
	dw Viridian_Map_Name13 ; map_const ROUTE_2_VIRIDIAN_FOREST_GATE
	dw Viridian_Map_Name14 ; map_const VIRIDIAN_FOREST_ROUTE_2_GATE
	dw Viridian_Map_Name15 ; map_const VIRIDIAN_FOREST_HOUSE
	dw Viridian_Map_Name16 ; map_const POKEMON_LEAGUE_GATE
	dw Viridian_Map_Name17 ; map_const ROUTE_26_HEAL_HOUSE
	dw Viridian_Map_Name18 ; map_const DAY_OF_WEEK_SIBLINGS_HOUSE
	assert_table_length NUM_VIRIDIAN_MAPS

Viridian_Map_Name1:  db "Route 2@"
Viridian_Map_Name2:  db "Route 22@"
Viridian_Map_Name3:  db "Route 26@"
Viridian_Map_Name4:  db "Viridian City@"
Viridian_Map_Name5:  db "Viridian Gym@"
Viridian_Map_Name6:  db "Viridian House@"
Viridian_Map_Name7:  db "Trainer House 1F@"
Viridian_Map_Name8:  db "Trainer HouseB1F@"
Viridian_Map_Name9:  db "Viridian <POKE>Mart@"
Viridian_Map_Name10: db "Viridian <PKMN> Cen.@"
Viridian_Map_Name11: db "Rt 2 Nugget House@"
Viridian_Map_Name12: db "Route 2 Gate@"
Viridian_Map_Name13: db "Route 2 VF Gate@"
Viridian_Map_Name14: db "VF Route 2 Gate@"
Viridian_Map_Name15: db "Forest House@"
Viridian_Map_Name16: db "League Gate@"
Viridian_Map_Name17: db "Route 26 House@"
Viridian_Map_Name18: db "Day Siblings House@"

New_Bark_Map_Names:
	table_width 2
	dw New_Bark_Map_Name1  ; map_const ROUTE_27
	dw New_Bark_Map_Name2  ; map_const ROUTE_29
	dw New_Bark_Map_Name3  ; map_const NEW_BARK_TOWN
	dw New_Bark_Map_Name4  ; map_const ELMS_LAB
	dw New_Bark_Map_Name5  ; map_const PLAYERS_HOUSE_1F
	dw New_Bark_Map_Name6  ; map_const PLAYERS_HOUSE_2F
	dw New_Bark_Map_Name7  ; map_const PLAYERS_NEIGHBORS_HOUSE
	dw New_Bark_Map_Name8  ; map_const ELMS_HOUSE
	dw New_Bark_Map_Name9  ; map_const ROUTE_27_SANDSTORM_HOUSE
	dw New_Bark_Map_Name10 ; map_const ROUTE_29_ROUTE_46_GATE
	dw New_Bark_Map_Name11 ; map_const LYRAS_HOUSE_1F
	dw New_Bark_Map_Name12 ; map_const LYRAS_HOUSE_2F
	assert_table_length NUM_NEW_BARK_MAPS

New_Bark_Map_Name1:  db "Route 27@"
New_Bark_Map_Name2:  db "Route 29@"
New_Bark_Map_Name3:  db "New Bark Town@"
New_Bark_Map_Name4:  db "Elm's Lab@"
New_Bark_Map_Name5:  db "Player's House 1F@"
New_Bark_Map_Name6:  db "Player's House 2F@"
New_Bark_Map_Name7:  db "New Bark House@"
New_Bark_Map_Name8:  db "Elm's House@"
New_Bark_Map_Name9:  db "Route 27 House@"
New_Bark_Map_Name10: db "Route 29 Gate@"
New_Bark_Map_Name11: db "Lyra's House 1F@"
New_Bark_Map_Name12: db "Lyra's House 2F@"

Saffron_Map_Names:
	table_width 2
	dw Saffron_Map_Name1  ; map_const SAFFRON_CITY
	dw Saffron_Map_Name2  ; map_const FIGHTING_DOJO
	dw Saffron_Map_Name3  ; map_const SAFFRON_GYM
	dw Saffron_Map_Name4  ; map_const SAFFRON_MART
	dw Saffron_Map_Name5  ; map_const SAFFRON_POKECENTER_1F
	dw Saffron_Map_Name6  ; map_const MR_PSYCHICS_HOUSE
	dw Saffron_Map_Name7  ; map_const SAFFRON_MAGNET_TRAIN_STATION
	dw Saffron_Map_Name8  ; map_const SILPH_CO_1F
	dw Saffron_Map_Name9  ; map_const COPYCATS_HOUSE_1F
	dw Saffron_Map_Name10 ; map_const COPYCATS_HOUSE_2F
	dw Saffron_Map_Name11 ; map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE
	dw Saffron_Map_Name12 ; map_const ROUTE_5_SAFFRON_GATE
	dw Saffron_Map_Name13 ; map_const ROUTE_5_CLEANSE_TAG_HOUSE
	dw Saffron_Map_Name14 ; map_const SAFFRON_AVICULTURAL_SOCIETY_1F
	dw Saffron_Map_Name15 ; map_const SAFFRON_AVICULTURAL_SOCIETY_2F
	dw Saffron_Map_Name16 ; map_const SAFFRON_AVICULTURAL_SOCIETY_3F
	dw Saffron_Map_Name17 ; map_const SAFFRON_ODDISH_DOLL_HOUSE
	assert_table_length NUM_SAFFRON_MAPS

Saffron_Map_Name1:  db "Saffron City@"
Saffron_Map_Name2:  db "Fighting Dojo@"
Saffron_Map_Name3:  db "Saffron Gym@"
Saffron_Map_Name4:  db "Saffron <POKE>Mart@"
Saffron_Map_Name5:  db "Saffron <PKMN> Center@"
Saffron_Map_Name6:  db "Mr.Psychics House@"
Saffron_Map_Name7:  db "Saffron Station@"
Saffron_Map_Name8:  db "Silph Co.@"
Saffron_Map_Name9:  db "Copycat House 1F@"
Saffron_Map_Name10: db "Copycat House 2F@"
Saffron_Map_Name11: db "Route 5 Undergrnd@"
Saffron_Map_Name12: db "Route 5 Gate@"
Saffron_Map_Name13: db "Route 5 House@"
Saffron_Map_Name14: db "Avicultural Soc.1F@"
Saffron_Map_Name15: db "Avicultural Soc.2F@"
Saffron_Map_Name16: db "Avicultural Soc.3F@"
Saffron_Map_Name17: db "Saffron House@"

Cherrygrove_Map_Names:
	table_width 2
	dw Cherrygrove_Map_Name1  ; map_const ROUTE_30
	dw Cherrygrove_Map_Name2  ; map_const ROUTE_31
	dw Cherrygrove_Map_Name3  ; map_const CHERRYGROVE_CITY
	dw Cherrygrove_Map_Name4  ; map_const CHERRYGROVE_MART
	dw Cherrygrove_Map_Name5  ; map_const CHERRYGROVE_POKECENTER_1F
	dw Cherrygrove_Map_Name6  ; map_const CHERRYGROVE_GYM_SPEECH_HOUSE
	dw Cherrygrove_Map_Name7  ; map_const GUIDE_GENTS_HOUSE
	dw Cherrygrove_Map_Name8  ; map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE
	dw Cherrygrove_Map_Name9  ; map_const ROUTE_30_BERRY_HOUSE
	dw Cherrygrove_Map_Name10 ; map_const MR_POKEMONS_HOUSE
	dw Cherrygrove_Map_Name11 ; map_const ROUTE_31_VIOLET_GATE
	assert_table_length NUM_CHERRYGROVE_MAPS

Cherrygrove_Map_Name1:  db "Route 30@"
Cherrygrove_Map_Name2:  db "Route 31@"
Cherrygrove_Map_Name3:  db "Cherrygrove City@"
Cherrygrove_Map_Name4:  db "Cherrygrove Mart@"
Cherrygrove_Map_Name5:  db "Cherry. <PKMN> Center@"
Cherrygrove_Map_Name6:  db "Cherryg. House 1@"
Cherrygrove_Map_Name7:  db "Guide Gent House@"
Cherrygrove_Map_Name8:  db "Cherryg. House 2@"
Cherrygrove_Map_Name9:  db "Route 30 House@"
Cherrygrove_Map_Name10: db "Mr. #mon House@"
Cherrygrove_Map_Name11: db "Route 31 Gate@"

Safari_Map_Names:
	table_width 2
	dw Safari_Map_Name1 ; map_const SAFARI_ZONE_HUB
	dw Safari_Map_Name2 ; map_const SAFARI_ZONE_EAST
	dw Safari_Map_Name3 ; map_const SAFARI_ZONE_NORTH
	dw Safari_Map_Name4 ; map_const SAFARI_ZONE_WEST
	dw Safari_Map_Name5 ; map_const SAFARI_ZONE_HUB_REST_HOUSE
	dw Safari_Map_Name6 ; map_const SAFARI_ZONE_EAST_REST_HOUSE
	dw Safari_Map_Name7 ; map_const SAFARI_ZONE_NORTH_REST_HOUSE
	dw Safari_Map_Name8 ; map_const SAFARI_ZONE_WEST_REST_HOUSE_1
	dw Safari_Map_Name9 ; map_const SAFARI_ZONE_WEST_REST_HOUSE_2
	assert_table_length NUM_SAFARI_MAPS

Safari_Map_Name1: db "Safari Zone Hub@"
Safari_Map_Name2: db "Safari Zone East@"
Safari_Map_Name3: db "Safari Zone North@"
Safari_Map_Name4: db "Safari Zone West@"
Safari_Map_Name5: db "Hub Rest House@"
Safari_Map_Name6: db "East Rest House@"
Safari_Map_Name7: db "North Rest House@"
Safari_Map_Name8: db "West Rest House 1@"
Safari_Map_Name9: db "West Rest House 2@"

Battle_Tower_Map_Names:
	table_width 2
	dw Battle_Tower_Map_Name1 ; map_const BATTLE_TOWER_OUTSIDE
	dw Battle_Tower_Map_Name2 ; map_const BATTLE_TOWER_1F
	dw Battle_Tower_Map_Name3 ; map_const BATTLE_TOWER_2F
	dw Battle_Tower_Map_Name4 ; map_const BATTLE_TOWER_BATTLE_ROOM
	dw Battle_Tower_Map_Name5 ; map_const BATTLE_TOWER_ELEVATOR
	dw Battle_Tower_Map_Name6 ; map_const BATTLE_TOWER_HALLWAY
	dw Battle_Tower_Map_Name7 ; map_const ROUTE_40_BATTLE_TOWER_GATE
	assert_table_length NUM_BATTLE_TOWER_MAPS

Battle_Tower_Map_Name1: db "Battle Tower@"
Battle_Tower_Map_Name2: db "Battle Tower 1F@"
Battle_Tower_Map_Name3: db "Battle Tower 2F@"
Battle_Tower_Map_Name4: db "Battle Tower Room@"
Battle_Tower_Map_Name5: db "Battle Tower Lift@"
Battle_Tower_Map_Name6: db "Battle Tower Hall@"
Battle_Tower_Map_Name7: db "Route 40 Gate@"
