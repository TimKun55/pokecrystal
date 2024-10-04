MapGroupNum_Names::
	table_width 2, MapGroupNum_Names
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


Olivine_Map_Names: ;newgroup OLIVINE 									;  1
	table_width 2, Olivine_Map_Names
	dw Olivine_Map_Name1 ; map_const OLIVINE_POKECENTER_1F 				;  1
	dw Olivine_Map_Name2 ; map_const OLIVINE_GYM 						;  2
	dw Olivine_Map_Name3 ; map_const OLIVINE_TIMS_HOUSE 				;  3
	dw Olivine_Map_Name4 ; map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE 	;  4
	dw Olivine_Map_Name5 ; map_const OLIVINE_GOOD_ROD_HOUSE 			;  5
	dw Olivine_Map_Name6 ; map_const OLIVINE_CAFE 						;  6
	dw Olivine_Map_Name7 ; map_const OLIVINE_MART 						;  7
	dw Olivine_Map_Name8 ; map_const ROUTE_38_ECRUTEAK_GATE 			;  8
	dw Olivine_Map_Name9 ; map_const ROUTE_39_BARN 						;  9
	dw Olivine_Map_Name10 ; map_const ROUTE_39_FARMHOUSE 				; 10
	dw Olivine_Map_Name11 ; map_const ROUTE_38 							; 11
	dw Olivine_Map_Name12 ; map_const ROUTE_39	 						; 12
	dw Olivine_Map_Name13 ; map_const OLIVINE_CITY 						; 13
	assert_table_length NUM_OLIVINE_MAPS

Mahogany_Map_Names: ;newgroup MAHOGANY										;  2
	table_width 2, Mahogany_Map_Names                                    
	dw Mahogany_Map_Name1 ; map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE	;  1
	dw Mahogany_Map_Name2 ; map_const MAHOGANY_GYM 							;  2
	dw Mahogany_Map_Name3 ; map_const MAHOGANY_POKECENTER_1F 				;  3
	dw Mahogany_Map_Name4 ; map_const ROUTE_42_ECRUTEAK_GATE 				;  4
	dw Mahogany_Map_Name5 ; map_const ROUTE_42  							;  5
	dw Mahogany_Map_Name6 ; map_const ROUTE_44 								;  6
	dw Mahogany_Map_Name7 ; map_const MAHOGANY_TOWN  						;  7
	dw Mahogany_Map_Name8 ; map_const MAHOGANY_MOVE_TUTOR_HOUSE  			;  8
	assert_table_length NUM_MAHOGANY_MAPS
	
Dungeons_Map_Names: ;newgroup DUNGEONS										;  3
	table_width 2, Dungeons_Map_Names
	dw Dungeons_Map_Name1 ; map_const SPROUT_TOWER_1F,						;  1
	dw Dungeons_Map_Name2 ; map_const SPROUT_TOWER_2F, 						;  2
	dw Dungeons_Map_Name3 ; map_const SPROUT_TOWER_3F, 						;  3
	dw Dungeons_Map_Name4 ; map_const TIN_TOWER_1F,    						;  4
	dw Dungeons_Map_Name5 ; map_const TIN_TOWER_2F,  						;  5
	dw Dungeons_Map_Name6 ; map_const TIN_TOWER_3F,  						;  6
	dw Dungeons_Map_Name7 ; map_const TIN_TOWER_4F,  						;  7
	dw Dungeons_Map_Name8 ; map_const TIN_TOWER_5F,  						;  8
	dw Dungeons_Map_Name9 ; map_const TIN_TOWER_6F,  						;  9
	dw Dungeons_Map_Name10 ; map_const TIN_TOWER_7F,  						; 10
	dw Dungeons_Map_Name11 ; map_const TIN_TOWER_8F,						; 11
	dw Dungeons_Map_Name12 ; map_const TIN_TOWER_9F,    					; 12
	dw Dungeons_Map_Name13 ; map_const BURNED_TOWER_1F,  					; 13
	dw Dungeons_Map_Name14 ; map_const BURNED_TOWER_B1F, 					; 14
	dw Dungeons_Map_Name15 ; map_const NATIONAL_PARK,       				; 15
	dw Dungeons_Map_Name16 ; map_const NATIONAL_PARK_BUG_CONTEST,   		; 16
	dw Dungeons_Map_Name17 ; map_const RADIO_TOWER_1F 						; 17
	dw Dungeons_Map_Name18 ; map_const RADIO_TOWER_2F 						; 18
	dw Dungeons_Map_Name19 ; map_const RADIO_TOWER_3F 						; 19
	dw Dungeons_Map_Name20 ; map_const RADIO_TOWER_4F 						; 20
	dw Dungeons_Map_Name21 ; map_const RADIO_TOWER_5F 						; 21
	dw Dungeons_Map_Name22 ; map_const RUINS_OF_ALPH_OUTSIDE,       		; 22
	dw Dungeons_Map_Name23 ; map_const RUINS_OF_ALPH_HO_OH_CHAMBER 			; 23
	dw Dungeons_Map_Name24; map_const RUINS_OF_ALPH_KABUTO_CHAMBER 			; 24
	dw Dungeons_Map_Name25; map_const RUINS_OF_ALPH_OMANYTE_CHAMBER 		; 25
	dw Dungeons_Map_Name26 ; map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER 	; 26
	dw Dungeons_Map_Name27 ; map_const RUINS_OF_ALPH_INNER_CHAMBER,  		; 27
	dw Dungeons_Map_Name28 ; map_const RUINS_OF_ALPH_RESEARCH_CENTER 		; 28
	dw Dungeons_Map_Name29 ; map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM 		; 29
	dw Dungeons_Map_Name30 ; map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM 		; 30
	dw Dungeons_Map_Name31 ; map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM 		; 31
	dw Dungeons_Map_Name32 ; map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM 	; 32
	dw Dungeons_Map_Name33 ; map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM,       ; 33
	dw Dungeons_Map_Name34 ; map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM,      ; 34
	dw Dungeons_Map_Name35 ; map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM,     ; 35
	dw Dungeons_Map_Name36 ; map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,  ; 36
	dw Dungeons_Map_Name37 ; map_const UNION_CAVE_1F,                       ; 37
	dw Dungeons_Map_Name38 ; map_const UNION_CAVE_B1F,                      ; 38
	dw Dungeons_Map_Name39 ; map_const UNION_CAVE_B2F,                      ; 39
	dw Dungeons_Map_Name40 ; map_const SLOWPOKE_WELL_B1F,                   ; 40
	dw Dungeons_Map_Name41 ; map_const SLOWPOKE_WELL_B2F,                   ; 41
	dw Dungeons_Map_Name42 ; map_const OLIVINE_LIGHTHOUSE_1F,               ; 42
	dw Dungeons_Map_Name43 ; map_const OLIVINE_LIGHTHOUSE_2F,               ; 43
	dw Dungeons_Map_Name44 ; map_const OLIVINE_LIGHTHOUSE_3F,               ; 44
	dw Dungeons_Map_Name45 ; map_const OLIVINE_LIGHTHOUSE_4F,               ; 45
	dw Dungeons_Map_Name46 ; map_const OLIVINE_LIGHTHOUSE_5F,               ; 46
	dw Dungeons_Map_Name47 ; map_const OLIVINE_LIGHTHOUSE_6F,               ; 47
	dw Dungeons_Map_Name48 ; map_const MAHOGANY_MART_1F 					; 48
	dw Dungeons_Map_Name49 ; map_const TEAM_ROCKET_BASE_B1F,                ; 49
	dw Dungeons_Map_Name50 ; map_const TEAM_ROCKET_BASE_B2F,                ; 50
	dw Dungeons_Map_Name51 ; map_const TEAM_ROCKET_BASE_B3F,                ; 51
	dw Dungeons_Map_Name52 ; map_const ILEX_FOREST,                         ; 52
	dw Dungeons_Map_Name53 ; map_const GOLDENROD_UNDERGROUND,               ; 53
	dw Dungeons_Map_Name54 ; map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES,	; 54
	dw Dungeons_Map_Name55 ; map_const GOLDENROD_DEPT_STORE_B1F,            ; 55
	dw Dungeons_Map_Name56 ; map_const GOLDENROD_UNDERGROUND_WAREHOUSE,     ; 56
	dw Dungeons_Map_Name57 ; map_const MOUNT_MORTAR_1F_OUTSIDE,             ; 57
	dw Dungeons_Map_Name58 ; map_const MOUNT_MORTAR_1F_INSIDE,              ; 58
	dw Dungeons_Map_Name59 ; map_const MOUNT_MORTAR_2F_INSIDE,              ; 59
	dw Dungeons_Map_Name60 ; map_const MOUNT_MORTAR_B1F,                    ; 60
	dw Dungeons_Map_Name61 ; map_const ICE_PATH_1F,                         ; 61
	dw Dungeons_Map_Name62 ; map_const ICE_PATH_B1F,                        ; 62
	dw Dungeons_Map_Name63 ; map_const ICE_PATH_B2F_MAHOGANY_SIDE,          ; 63
	dw Dungeons_Map_Name64 ; map_const ICE_PATH_B2F_BLACKTHORN_SIDE 		; 64
	dw Dungeons_Map_Name65 ; map_const ICE_PATH_B3F,                        ; 65
	dw Dungeons_Map_Name66 ; map_const WHIRL_ISLAND_NW 						; 66
	dw Dungeons_Map_Name67 ; map_const WHIRL_ISLAND_NE,                     ; 67
	dw Dungeons_Map_Name68 ; map_const WHIRL_ISLAND_SW,                     ; 68
	dw Dungeons_Map_Name69 ; map_const WHIRL_ISLAND_CAVE 					; 69
	dw Dungeons_Map_Name70 ; map_const WHIRL_ISLAND_SE 						; 70
	dw Dungeons_Map_Name71 ; map_const WHIRL_ISLAND_B1F,                    ; 71
	dw Dungeons_Map_Name72 ; map_const WHIRL_ISLAND_B2F,                    ; 72
	dw Dungeons_Map_Name73 ; map_const WHIRL_ISLAND_LUGIA_CHAMBER,          ; 73
	dw Dungeons_Map_Name74 ; map_const MT_SILVER_ROOM_1,                    ; 74
	dw Dungeons_Map_Name75 ; map_const MT_SILVER_ROOM_2,                    ; 75
	dw Dungeons_Map_Name76 ; map_const MT_SILVER_PEAK,                      ; 76
	dw Dungeons_Map_Name77 ; map_const MT_SILVER_ITEM_ROOMS,                ; 77
	dw Dungeons_Map_Name78 ; map_const DARK_CAVE_VIOLET_ENTRANCE            ; 78
	dw Dungeons_Map_Name79 ; map_const DARK_CAVE_BLACKTHORN_ENTRANCE        ; 79
	dw Dungeons_Map_Name80 ; map_const DRAGONS_DEN_1F                       ; 80
	dw Dungeons_Map_Name81 ; map_const DRAGONS_DEN_B1F 						; 81
	dw Dungeons_Map_Name82 ; map_const DRAGON_SHRINE                        ; 82
	dw Dungeons_Map_Name83 ; map_const TOHJO_FALLS   						; 83
	dw Dungeons_Map_Name84 ; map_const DIGLETTS_CAVE                        ; 84
	dw Dungeons_Map_Name85 ; map_const VIRIDIAN_FOREST                      ; 85
	dw Dungeons_Map_Name86 ; map_const MOUNT_MOON_1F    					; 86
	dw Dungeons_Map_Name87 ; map_const UNDERGROUND_PATH                     ; 87
	dw Dungeons_Map_Name88 ; map_const ROCK_TUNNEL_1F                       ; 88
	dw Dungeons_Map_Name89 ; map_const ROCK_TUNNEL_B1F 	                    ; 89
	dw Dungeons_Map_Name90 ; map_const VICTORY_ROAD_1F  	                ; 90
	dw Dungeons_Map_Name91 ; map_const VICTORY_ROAD_2F						; 91
	dw Dungeons_Map_Name92 ; map_const VICTORY_ROAD_3F						; 92
	dw Dungeons_Map_Name93 ; map_const UNDERGROUND_ROOM						; 93
	dw Dungeons_Map_Name94 ; map_const CERULEAN_CAVE_1F						; 94
	dw Dungeons_Map_Name95 ; map_const CERULEAN_CAVE_2F                     ; 95
	dw Dungeons_Map_Name96 ; map_const CERULEAN_CAVE_B1F                    ; 96
	dw Dungeons_Map_Name97 ; map_const RUINS_OF_ALPH_GS_BALL_CHAMBER        ; 97
	dw Dungeons_Map_Name98 ; map_const RUINS_OF_ALPH_CAVE_ENTRANCE          ; 98
	dw Dungeons_Map_Name99 ; map_const SLOWPOKE_WELL_ENTRANCE               ; 99
	dw Dungeons_Map_Name100 ; map_const MOUNT_MOON_B1F                      ; 100
	dw Dungeons_Map_Name101 ; map_const MOUNT_MOON_B2F                      ; 100
	assert_table_length NUM_DUNGEONS_MAPS
	

Ecruteak_Map_Names: ;newgroup ECRUTEAK										;  4
	table_width 2, Ecruteak_Map_Names
	dw Ecruteak_Map_Name1 ; map_const ROUTE_35                              ;  1
	dw Ecruteak_Map_Name2 ; map_const ROUTE_36                              ;  2
	dw Ecruteak_Map_Name3 ; map_const ROUTE_37                              ;  3
	dw Ecruteak_Map_Name4 ; map_const ECRUTEAK_TIN_TOWER_ENTRANCE,          ;  4
	dw Ecruteak_Map_Name5 ; map_const WISE_TRIOS_ROOM 						;  5
	dw Ecruteak_Map_Name6 ; map_const ECRUTEAK_POKECENTER_1F 				;  6
	dw Ecruteak_Map_Name7 ; map_const ECRUTEAK_LUGIA_SPEECH_HOUSE 			;  7
	dw Ecruteak_Map_Name8 ; map_const DANCE_THEATRE 						;  8
	dw Ecruteak_Map_Name9 ; map_const ECRUTEAK_MART 						;  9
	dw Ecruteak_Map_Name10 ; map_const ECRUTEAK_GYM 						; 10
	dw Ecruteak_Map_Name11 ; map_const ECRUTEAK_ITEMFINDER_HOUSE 			; 11
	dw Ecruteak_Map_Name12 ; map_const ECRUTEAK_CITY,                       ; 12
	dw Ecruteak_Map_Name13 ; map_const ECRUTEAK_FAIRY_FAMILY_HOUSE			; 13
	dw Ecruteak_Map_Name14 ; map_const ECRUTEAK_SWARM_HOUSE					; 14
	dw Ecruteak_Map_Name15 ; map_const ROUTE_35_GOLDENROD_GATE   			; 15
	dw Ecruteak_Map_Name16 ; map_const ROUTE_35_NATIONAL_PARK_GATE			; 16
	dw Ecruteak_Map_Name17 ; map_const ROUTE_36_NATIONAL_PARK_GATE			; 17
	assert_table_length NUM_ECRUTEAK_MAPS

Blackthorn_Map_Names: ;newgroup BLACKTHORN									;  5
	table_width 2, Blackthorn_Map_Names
	dw Blackthorn_Map_Name1 ; map_const BLACKTHORN_GYM_1F 					;  1
	dw Blackthorn_Map_Name2 ; map_const BLACKTHORN_GYM_2F 					;  2
	dw Blackthorn_Map_Name3 ; map_const BLACKTHORN_DRAGON_SPEECH_HOUSE 		;  3
	dw Blackthorn_Map_Name4 ; map_const BLACKTHORN_EMYS_HOUSE 				;  4
	dw Blackthorn_Map_Name5 ; map_const BLACKTHORN_MART 					;  5
	dw Blackthorn_Map_Name6 ; map_const BLACKTHORN_POKECENTER_1F 			;  6
	dw Blackthorn_Map_Name7 ; map_const ROUTE_45							;  7
	dw Blackthorn_Map_Name8 ; map_const ROUTE_46							;  8
	dw Blackthorn_Map_Name9 ; map_const BLACKTHORN_CITY						;  9
	dw Blackthorn_Map_Name10 ; map_const BLACKTHORN_MOVE_TUTOR_HOUSE		; 10		
	dw Blackthorn_Map_Name11 ; map_const MADAM_ITEMS_HOUSE					; 11
	assert_table_length NUM_BLACKTHORN_MAPS

Cinnabar_Map_Names: ;newgroup CINNABAR										;  6
	table_width 2, Cinnabar_Map_Names
	dw Cinnabar_Map_Name1 ; map_const CINNABAR_POKECENTER_1F				;  1
	dw Cinnabar_Map_Name2 ; map_const ROUTE_19_FUCHSIA_GATE					;  2
	dw Cinnabar_Map_Name3 ; map_const ROUTE_19								;  3
	dw Cinnabar_Map_Name4 ; map_const ROUTE_20								;  4
	dw Cinnabar_Map_Name5 ; map_const ROUTE_21								;  5
	dw Cinnabar_Map_Name6 ; map_const CINNABAR_ISLAND						;  6
	dw Cinnabar_Map_Name7 ; map_const CINNABAR_VOLCANO_1F					;  7
	dw Cinnabar_Map_Name8 ; map_const CINNABAR_VOLCANO_2F					;  8
	dw Cinnabar_Map_Name9 ; map_const CINNABAR_MOLTRES_NEST				    ;  9
	dw Cinnabar_Map_Name10 ; map_const CINNABAR_ISLAND_RECOVERY_LAB      	; 10
	dw Cinnabar_Map_Name11 ; map_const SEAFOAM_GYM							; 11
	dw Cinnabar_Map_Name12 ; map_const SEAFOAM_ISLANDS_1F					; 12
	dw Cinnabar_Map_Name13 ; map_const SEAFOAM_ISLANDS_B1F					; 13
	dw Cinnabar_Map_Name14 ; map_const SEAFOAM_ISLANDS_B2F					; 14
	dw Cinnabar_Map_Name15 ; map_const SEAFOAM_ISLANDS_B3F					; 15
	dw Cinnabar_Map_Name16 ; map_const SEAFOAM_ISLANDS_B4F					; 16
	assert_table_length NUM_CINNABAR_MAPS

Cerulean_Map_Names: ;newgroup CERULEAN										;  7
	table_width 2, Cerulean_Map_Names
	dw Cerulean_Map_Name1 ; map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE		;  1
	dw Cerulean_Map_Name2 ; map_const CERULEAN_POLICE_STATION				;  2
	dw Cerulean_Map_Name3 ; map_const CERULEAN_TRADE_SPEECH_HOUSE			;  3
	dw Cerulean_Map_Name4 ; map_const CERULEAN_POKECENTER_1F				;  4
	dw Cerulean_Map_Name5 ; map_const CERULEAN_GYM							;  5
	dw Cerulean_Map_Name6 ; map_const CERULEAN_MART							;  6
	dw Cerulean_Map_Name7 ; map_const ROUTE_10_POKECENTER_1F				;  7
	dw Cerulean_Map_Name8 ; map_const POWER_PLANT							;  8
	dw Cerulean_Map_Name9 ; map_const BILLS_HOUSE							;  9
	dw Cerulean_Map_Name10 ; map_const ROUTE_4								; 10
	dw Cerulean_Map_Name11 ; map_const ROUTE_5								; 11
	dw Cerulean_Map_Name12 ; map_const ROUTE_9								; 12
	dw Cerulean_Map_Name13 ; map_const ROUTE_10_NORTH						; 13
	dw Cerulean_Map_Name14 ; map_const ROUTE_24								; 14
	dw Cerulean_Map_Name15 ; map_const ROUTE_25								; 15
	dw Cerulean_Map_Name16 ; map_const CERULEAN_CITY						; 16
	dw Cerulean_Map_Name17 ; map_const ROUTE_4_ZAPDOS_NEST					; 17
	dw Cerulean_Map_Name18 ; map_const CERULEAN_EMPTY_HOUSE					; 18
	dw Cerulean_Map_Name19 ; map_const CERULEAN_EMPTY_HOUSE_UNDERGROUND 	; 19
	assert_table_length NUM_CERULEAN_MAPS

Azalea_Map_Names: ;newgroup AZALEA											;  8
	table_width 2, Azalea_Map_Names
	dw Azalea_Map_Name1 ; map_const AZALEA_POKECENTER_1F					;  1
	dw Azalea_Map_Name2 ; map_const CHARCOAL_KILN							;  2
	dw Azalea_Map_Name3 ; map_const AZALEA_MART								;  3
	dw Azalea_Map_Name4 ; map_const KURTS_HOUSE								;  4
	dw Azalea_Map_Name5 ; map_const AZALEA_GYM								;  5
	dw Azalea_Map_Name6 ; map_const ROUTE_33								;  6
	dw Azalea_Map_Name7 ; map_const AZALEA_TOWN								;  7
	assert_table_length NUM_AZALEA_MAPS

Lake_of_Rage_Map_Names: ;newgroup LAKE_OF_RAGE								;  9
	table_width 2, Lake_of_Rage_Map_Names
	dw Lake_of_Rage_Map_Name1 ; map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE	;  1
	dw Lake_of_Rage_Map_Name2 ; map_const LAKE_OF_RAGE_MAGIKARP_HOUSE		;  2
	dw Lake_of_Rage_Map_Name3 ; map_const ROUTE_43_MAHOGANY_GATE			;  3
	dw Lake_of_Rage_Map_Name4 ; map_const ROUTE_43_GATE						;  4
	dw Lake_of_Rage_Map_Name5 ; map_const ROUTE_43							;  5
	dw Lake_of_Rage_Map_Name6 ; map_const LAKE_OF_RAGE						;  6
	assert_table_length NUM_LAKE_OF_RAGE_MAPS

Violet_Map_Names: ;newgroup VIOLET											; 10
	table_width 2, Violet_Map_Names
	dw Violet_Map_Name1 ; map_const ROUTE_32								;  1
	dw Violet_Map_Name2 ; map_const VIOLET_CITY								;  2
	dw Violet_Map_Name3 ; map_const VIOLET_MART								;  3
	dw Violet_Map_Name4 ; map_const VIOLET_GYM								;  4
	dw Violet_Map_Name5 ; map_const EARLS_POKEMON_ACADEMY					;  5
	dw Violet_Map_Name6 ; map_const VIOLET_NICKNAME_SPEECH_HOUSE			;  6
	dw Violet_Map_Name7 ; map_const VIOLET_POKECENTER_1F					;  7
	dw Violet_Map_Name8 ; map_const VIOLET_KYLES_HOUSE						;  8
	dw Violet_Map_Name9 ; map_const VIOLET_PRIMOS_HOUSE						;  9
	dw Violet_Map_Name10 ; map_const ROUTE_32_RUINS_OF_ALPH_GATE			; 10
	dw Violet_Map_Name11 ; map_const ROUTE_32_POKECENTER_1F					; 11
	dw Violet_Map_Name12 ; map_const ROUTE_36_RUINS_OF_ALPH_GATE			; 12
	dw Violet_Map_Name13 ; map_const ROUTE_36_VIOLET_GATE					; 13
	dw Violet_Map_Name14 ; map_const EARLS_POKEMON_ACADEMY_B1F              ; 14
	assert_table_length NUM_VIOLET_MAPS

Goldenrod_Map_Names: ;newgroup GOLDENROD									; 11
	table_width 2, Goldenrod_Map_Names
	dw Goldenrod_Map_Name1 ; map_const ROUTE_34								;  1
	dw Goldenrod_Map_Name2 ; map_const GOLDENROD_CITY						;  2
	dw Goldenrod_Map_Name3 ; map_const GOLDENROD_GYM						;  3
	dw Goldenrod_Map_Name4 ; map_const GOLDENROD_BIKE_SHOP					;  4
	dw Goldenrod_Map_Name5 ; map_const GOLDENROD_HAPPINESS_RATER			;  5
	dw Goldenrod_Map_Name6 ; map_const BILLS_FAMILYS_HOUSE					;  6
	dw Goldenrod_Map_Name7 ; map_const GOLDENROD_MAGNET_TRAIN_STATION		;  7
	dw Goldenrod_Map_Name8 ; map_const GOLDENROD_FLOWER_SHOP				;  8
	dw Goldenrod_Map_Name9 ; map_const GOLDENROD_PP_SPEECH_HOUSE			;  9
	dw Goldenrod_Map_Name10 ; map_const GOLDENROD_NAME_RATER				; 10
	dw Goldenrod_Map_Name11 ; map_const GOLDENROD_DEPT_STORE_1F				; 11
	dw Goldenrod_Map_Name12 ; map_const GOLDENROD_DEPT_STORE_2F				; 12
	dw Goldenrod_Map_Name13 ; map_const GOLDENROD_DEPT_STORE_3F				; 13
	dw Goldenrod_Map_Name14 ; map_const GOLDENROD_DEPT_STORE_4F				; 14
	dw Goldenrod_Map_Name15 ; map_const GOLDENROD_DEPT_STORE_5F				; 15
	dw Goldenrod_Map_Name16 ; map_const GOLDENROD_DEPT_STORE_6F				; 16
	dw Goldenrod_Map_Name17 ; map_const GOLDENROD_DEPT_STORE_ELEVATOR		; 17
	dw Goldenrod_Map_Name18 ; map_const GOLDENROD_DEPT_STORE_ROOF			; 18
	dw Goldenrod_Map_Name19 ; map_const GOLDENROD_GAME_CORNER				; 19
	dw Goldenrod_Map_Name20 ; map_const GOLDENROD_POKECENTER_1F				; 20
	dw Goldenrod_Map_Name21 ; map_const ILEX_FOREST_AZALEA_GATE				; 21
	dw Goldenrod_Map_Name22 ; map_const ROUTE_34_ILEX_FOREST_GATE			; 22
	dw Goldenrod_Map_Name23 ; map_const DAY_CARE							; 23
	dw Goldenrod_Map_Name24 ; map_const GOLDENROD_HOME_DECOR_STORE_1F		; 24
	dw Goldenrod_Map_Name25 ; map_const GOLDENROD_HOME_DECOR_STORE_2F		; 25
	dw Goldenrod_Map_Name26 ; map_const GOLDENROD_HOME_DECOR_STORE_3F		; 26
	dw Goldenrod_Map_Name27 ; map_const GOLDENROD_HOME_DECOR_STORE_4F		; 27
	dw Goldenrod_Map_Name28 ; map_const GOLDENROD_FLOWER_SHOP_GARDEN		; 28
	assert_table_length NUM_GOLDENROD_MAPS

Vermilion_Map_Names: ;newgroup VERMILION									; 12
	table_width 2, Vermilion_Map_Names
	dw Vermilion_Map_Name1 ; map_const ROUTE_6								;  1
	dw Vermilion_Map_Name2 ; map_const ROUTE_11								;  2
	dw Vermilion_Map_Name3 ; map_const VERMILION_CITY						;  3
	dw Vermilion_Map_Name4 ; map_const VERMILION_FISHING_SPEECH_HOUSE		;  4
	dw Vermilion_Map_Name5 ; map_const VERMILION_POKECENTER_1F				;  5
	dw Vermilion_Map_Name6 ; map_const POKEMON_FAN_CLUB						;  6
	dw Vermilion_Map_Name7 ; map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE	;  7
	dw Vermilion_Map_Name8 ; map_const VERMILION_MART						;  8
	dw Vermilion_Map_Name9 ; map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE ;  9
	dw Vermilion_Map_Name10 ; map_const VERMILION_GYM						; 10
	dw Vermilion_Map_Name11 ; map_const ROUTE_6_SAFFRON_GATE				; 11
	dw Vermilion_Map_Name12 ; map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE	; 12
	dw Vermilion_Map_Name13 ; map_const ROUTE_11_ROUTE_12_GATE				; 13
	dw Vermilion_Map_Name14 ; map_const VERMILION_BERRY_MART				; 14
	dw Vermilion_Map_Name15 ; map_const VERMILION_SAILORS_HOUSE				; 15
	assert_table_length NUM_VERMILION_MAPS

Pallet_Map_Names: ;newgroup PALLET											; 13
	table_width 2, Pallet_Map_Names
	dw Pallet_Map_Name1 ; map_const ROUTE_1									;  1
	dw Pallet_Map_Name2 ; map_const PALLET_TOWN								;  2
	dw Pallet_Map_Name3 ; map_const REDS_HOUSE_1F							;  3
	dw Pallet_Map_Name4 ; map_const REDS_HOUSE_2F							;  4
	dw Pallet_Map_Name5 ; map_const BLUES_HOUSE								;  5
	dw Pallet_Map_Name6 ; map_const OAKS_LAB								;  6
	dw Pallet_Map_Name7 ; map_const ROUTE_1_VIRIDIAN_GATE					;  7
	assert_table_length NUM_PALLET_MAPS

Pewter_Map_Names: ;newgroup PEWTER											; 14
	table_width 2, Pewter_Map_Names
	dw Pewter_Map_Name1 ; map_const ROUTE_3									;  1
	dw Pewter_Map_Name2 ; map_const PEWTER_CITY								;  2
	dw Pewter_Map_Name3 ; map_const PEWTER_NIDORAN_SPEECH_HOUSE				;  3
	dw Pewter_Map_Name4 ; map_const PEWTER_GYM								;  4
	dw Pewter_Map_Name5 ; map_const PEWTER_MART								;  5
	dw Pewter_Map_Name6 ; map_const PEWTER_POKECENTER_1F					;  6
	dw Pewter_Map_Name7 ; map_const PEWTER_SNOOZE_SPEECH_HOUSE				;  7
	dw Pewter_Map_Name8 ; map_const ROUTE_3_POKECENTER_1F 					;  8
	assert_table_length NUM_PEWTER_MAPS

Fast_Ship_Map_Names: ;newgroup FAST_SHIP										; 15
	table_width 2, Fast_Ship_Map_Names
	dw Fast_Ship_Map_Name1 ; map_const OLIVINE_PORT								;  1
	dw Fast_Ship_Map_Name2 ; map_const VERMILION_PORT							;  2
	dw Fast_Ship_Map_Name3 ; map_const FAST_SHIP_1F								;  3
	dw Fast_Ship_Map_Name4 ; map_const FAST_SHIP_CABINS_NNW_NNE_NE				;  4
	dw Fast_Ship_Map_Name5 ; map_const FAST_SHIP_CABINS_SW_SSW_NW				;  5
	dw Fast_Ship_Map_Name6 ; map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN	;  6
	dw Fast_Ship_Map_Name7 ; map_const FAST_SHIP_B1F							;  7
	dw Fast_Ship_Map_Name8 ; map_const OLIVINE_PORT_PASSAGE						;  8
	dw Fast_Ship_Map_Name9 ; map_const VERMILION_PORT_PASSAGE					;  9
	dw Fast_Ship_Map_Name10 ; map_const MOUNT_MOON_SQUARE						; 10
	dw Fast_Ship_Map_Name11 ; map_const MOUNT_MOON_GIFT_SHOP					; 11
	dw Fast_Ship_Map_Name12 ; map_const TIN_TOWER_ROOF							; 12
	dw Fast_Ship_Map_Name13 ; map_const FARAWAY_ISLAND_OUTSIDE					; 13
	dw Fast_Ship_Map_Name14 ; map_const FARAWAY_ISLAND_INSIDE					; 14
	assert_table_length NUM_FAST_SHIP_MAPS

Indigo_Map_Names: ;newgroup INDIGO											; 16
	table_width 2, Indigo_Map_Names
	dw Indigo_Map_Name1 ; map_const ROUTE_23								;  1
	dw Indigo_Map_Name2 ; map_const INDIGO_PLATEAU_POKECENTER_1F			;  2
	dw Indigo_Map_Name3 ; map_const WILLS_ROOM								;  3
	dw Indigo_Map_Name4 ; map_const KOGAS_ROOM								;  4
	dw Indigo_Map_Name5 ; map_const BRUNOS_ROOM								;  5
	dw Indigo_Map_Name6 ; map_const KARENS_ROOM								;  6
	dw Indigo_Map_Name7 ; map_const LANCES_ROOM								;  7
	dw Indigo_Map_Name8 ; map_const HALL_OF_FAME							;  8
	dw Indigo_Map_Name9 ; map_const INDIGO_PLATEAU							;  9
	assert_table_length NUM_INDIGO_MAPS

Fuchsia_Map_Names: ;newgroup FUCHSIA										; 17
	table_width 2, Fuchsia_Map_Names
	dw Fuchsia_Map_Name1 ; map_const ROUTE_12								;  1
	dw Fuchsia_Map_Name2 ; map_const ROUTE_12_SUPER_ROD_HOUSE				;  2
	dw Fuchsia_Map_Name3 ; map_const ROUTE_13								;  3
	dw Fuchsia_Map_Name4 ; map_const ROUTE_14								;  4
	dw Fuchsia_Map_Name5 ; map_const ROUTE_15								;  5
	dw Fuchsia_Map_Name6 ; map_const ROUTE_16								;  6
	dw Fuchsia_Map_Name7 ; map_const ROUTE_17								;  7
	dw Fuchsia_Map_Name8 ; map_const ROUTE_18								;  8
	dw Fuchsia_Map_Name9 ; map_const FUCHSIA_CITY							;  9
	dw Fuchsia_Map_Name10 ; map_const FUCHSIA_MART							; 10
	dw Fuchsia_Map_Name11 ; map_const SAFARI_ZONE_FUCHSIA_GATE				; 11
	dw Fuchsia_Map_Name12 ; map_const FUCHSIA_GYM							; 12
	dw Fuchsia_Map_Name13 ; map_const BILLS_BROTHERS_HOUSE					; 13
	dw Fuchsia_Map_Name14 ; map_const FUCHSIA_POKECENTER_1F					; 14
	dw Fuchsia_Map_Name15 ; map_const SAFARI_ZONE_WARDENS_HOME				; 15
	dw Fuchsia_Map_Name16 ; map_const ROUTE_15_FUCHSIA_GATE					; 16
	dw Fuchsia_Map_Name17 ; map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE			; 17
	dw Fuchsia_Map_Name18 ; map_const ROUTE_16_GATE							; 18
	dw Fuchsia_Map_Name19 ; map_const ROUTE_17_ROUTE_18_GATE				; 19
	dw Fuchsia_Map_Name20 ; map_const FUCHSIA_CINNABAR_HOUSE_1				; 20
	assert_table_length NUM_FUCHSIA_MAPS

Lavender_Map_Names: ;newgroup LAVENDER										; 18
	table_width 2, Lavender_Map_Names
	dw Lavender_Map_Name1 ; map_const ROUTE_8								;  1
	dw Lavender_Map_Name2 ; map_const ROUTE_10_SOUTH						;  2
	dw Lavender_Map_Name3 ; map_const LAVENDER_TOWN							;  3
	dw Lavender_Map_Name4 ; map_const LAVENDER_POKECENTER_1F				;  4
	dw Lavender_Map_Name5 ; map_const MR_FUJIS_HOUSE						;  5
	dw Lavender_Map_Name6 ; map_const LAVENDER_SPEECH_HOUSE					;  6
	dw Lavender_Map_Name7 ; map_const LAVENDER_NAME_RATER					;  7
	dw Lavender_Map_Name8 ; map_const LAVENDER_MART							;  8
	dw Lavender_Map_Name9 ; map_const SOUL_HOUSE							;  9
	dw Lavender_Map_Name10 ; map_const LAV_RADIO_TOWER_1F					; 10
	dw Lavender_Map_Name11 ; map_const ROUTE_12_LAVENDER_GATE				; 11
	dw Lavender_Map_Name12 ; map_const ROUTE_8_SAFFRON_GATE					; 12
	assert_table_length NUM_LAVENDER_MAPS

Silver_Map_Names: ;newgroup SILVER
	table_width 2, Silver_Map_Names											; 19
	dw Silver_Map_Name1 ; map_const ROUTE_28,								;  1
	dw Silver_Map_Name2 ; map_const MT_SILVER_OUTSIDE,						;  2
	dw Silver_Map_Name3 ; map_const MT_SILVER_POKECENTER_1F					;  3
	dw Silver_Map_Name4 ; map_const ROUTE_28_STEEL_WING_HOUSE				;  4
	assert_table_length NUM_SILVER_MAPS

Cable_Club_Map_Names: ;newgroup CABLE_CLUB
	table_width 2, Cable_Club_Map_Names										; 20
	dw Cable_Club_Map_Name1 ; map_const POKECENTER_2F						;  1
	dw Cable_Club_Map_Name2 ; map_const TRADE_CENTER						;  2
	dw Cable_Club_Map_Name3 ; map_const COLOSSEUM							;  3
;	dw Cable_Club_Map_Name4 ; map_const TIME_CAPSULE						;  4
;	dw Cable_Club_Map_Name5 ; map_const MOBILE_TRADE_ROOM					;  5
;	dw Cable_Club_Map_Name6 ; map_const MOBILE_BATTLE_ROOM					;  6
	assert_table_length NUM_CABLE_CLUB_MAPS

Celadon_Map_Names: ;newgroup CELADON
	table_width 2, Celadon_Map_Names										; 21
	dw Celadon_Map_Name1 ; map_const ROUTE_7								;  1
	dw Celadon_Map_Name2 ; map_const CELADON_CITY							;  2
	dw Celadon_Map_Name3 ; map_const CELADON_DEPT_STORE_1F					;  3
	dw Celadon_Map_Name4 ; map_const CELADON_DEPT_STORE_2F					;  4
	dw Celadon_Map_Name5 ; map_const CELADON_DEPT_STORE_3F					;  5
	dw Celadon_Map_Name6 ; map_const CELADON_DEPT_STORE_4F					;  6
	dw Celadon_Map_Name7 ; map_const CELADON_DEPT_STORE_5F					;  7
	dw Celadon_Map_Name8 ; map_const CELADON_DEPT_STORE_6F					;  8
	dw Celadon_Map_Name9 ; map_const CELADON_DEPT_STORE_ELEVATOR			;  9
	dw Celadon_Map_Name10 ; map_const CELADON_MANSION_1F					; 10
	dw Celadon_Map_Name11 ; map_const CELADON_MANSION_2F					; 11
	dw Celadon_Map_Name12 ; map_const CELADON_MANSION_3F					; 12
	dw Celadon_Map_Name13 ; map_const CELADON_MANSION_ROOF					; 13
	dw Celadon_Map_Name14 ; map_const CELADON_MANSION_ROOF_HOUSE			; 14
	dw Celadon_Map_Name15 ; map_const CELADON_POKECENTER_1F					; 15
	dw Celadon_Map_Name16 ; map_const CELADON_GAME_CORNER					; 16
	dw Celadon_Map_Name17 ; map_const CELADON_GAME_CORNER_PRIZE_ROOM		; 17
	dw Celadon_Map_Name18 ; map_const CELADON_GYM							; 18
	dw Celadon_Map_Name19 ; map_const CELADON_CAFE							; 19
	dw Celadon_Map_Name20 ; map_const ROUTE_7_SAFFRON_GATE					; 20
	dw Celadon_Map_Name21 ; map_const CELADON_HOME_DECOR_STORE_1F			; 21
	dw Celadon_Map_Name22 ; map_const CELADON_HOME_DECOR_STORE_2F			; 22
	dw Celadon_Map_Name23 ; map_const CELADON_HOME_DECOR_STORE_3F			; 23
	dw Celadon_Map_Name24 ; map_const CELADON_HOME_DECOR_STORE_4F			; 24
	dw Celadon_Map_Name25 ; map_const CELADON_CURSE_HOUSE       			; 25
	assert_table_length NUM_CELADON_MAPS

Cianwood_Map_Names: ;newgroup CIANWOOD
	table_width 2, Cianwood_Map_Names										; 22
	dw Cianwood_Map_Name1 ; map_const ROUTE_40								;  1
	dw Cianwood_Map_Name2 ; map_const ROUTE_41								;  2
	dw Cianwood_Map_Name3 ; map_const CIANWOOD_CITY							;  3
	dw Cianwood_Map_Name4 ; map_const MANIAS_HOUSE							;  4
	dw Cianwood_Map_Name5 ; map_const CIANWOOD_GYM							;  5
	dw Cianwood_Map_Name6 ; map_const CIANWOOD_POKECENTER_1F				;  6
	dw Cianwood_Map_Name7 ; map_const CIANWOOD_PHARMACY						;  7
	dw Cianwood_Map_Name8 ; map_const CIANWOOD_LUGIA_SPEECH_HOUSE			;  8
	dw Cianwood_Map_Name9 ; map_const CIANWOOD_BEASTS_HOUSE					;  9
	dw Cianwood_Map_Name10 ; map_const CIANWOOD_MOVE_TUTOR_HOUSE			; 10
	dw Cianwood_Map_Name11 ; map_const BATTLE_TOWER_1F						; 11
	dw Cianwood_Map_Name12 ; map_const BATTLE_TOWER_BATTLE_ROOM				; 12
	dw Cianwood_Map_Name13 ; map_const BATTLE_TOWER_ELEVATOR				; 13
	dw Cianwood_Map_Name14 ; map_const BATTLE_TOWER_HALLWAY					; 14
	dw Cianwood_Map_Name15 ; map_const ROUTE_40_BATTLE_TOWER_GATE			; 15
	dw Cianwood_Map_Name16 ; map_const BATTLE_TOWER_OUTSIDE					; 16
	assert_table_length NUM_CIANWOOD_MAPS

Viridian_Map_Names: ;newgroup VIRIDIAN 
	table_width 2, Viridian_Map_Names									; 23
	dw Viridian_Map_Name1 ; map_const ROUTE_2,                          ;  1
	dw Viridian_Map_Name2 ; map_const ROUTE_22,                         ;  2
	dw Viridian_Map_Name3 ; map_const ROUTE_26,							;  3
	dw Viridian_Map_Name4 ; map_const VIRIDIAN_CITY,                    ;  4
	dw Viridian_Map_Name5 ; map_const VIRIDIAN_GYM 						;  5
	dw Viridian_Map_Name6 ; map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE 	;  6
	dw Viridian_Map_Name7 ; map_const TRAINER_HOUSE_1F 					;  7
	dw Viridian_Map_Name8 ; map_const TRAINER_HOUSE_B1F 				;  8
	dw Viridian_Map_Name9 ; map_const VIRIDIAN_MART 					;  9
	dw Viridian_Map_Name10 ; map_const VIRIDIAN_POKECENTER_1F 			; 10
	dw Viridian_Map_Name11 ; map_const ROUTE_2_NUGGET_HOUSE 			; 11
	dw Viridian_Map_Name12 ; map_const ROUTE_2_GATE 					; 12
	dw Viridian_Map_Name13 ; map_const ROUTE_2_VIRIDIAN_FOREST_GATE		; 13
	dw Viridian_Map_Name14 ; map_const VIRIDIAN_FOREST_ROUTE_2_GATE 	; 14
	dw Viridian_Map_Name15 ; map_const VIRIDIAN_FOREST_HOUSE			; 15
	dw Viridian_Map_Name16 ; map_const VIRIDIAN_FOREST_HOUSE_BF1		; 16
	dw Viridian_Map_Name17 ; map_const VICTORY_ROAD_GATE				; 17
	dw Viridian_Map_Name18 ; map_const ROUTE_26_HEAL_HOUSE				; 18
	dw Viridian_Map_Name19 ; map_const DAY_OF_WEEK_SIBLINGS_HOUSE		; 19
	assert_table_length NUM_VIRIDIAN_MAPS

	
New_Bark_Map_Names: ; newgroup NEW_BARK
	table_width 2, New_Bark_Map_Names									; 24
	dw New_Bark_Map_Name1 ; map_const ROUTE_27							;  1
	dw New_Bark_Map_Name2 ; map_const ROUTE_29							;  2
	dw New_Bark_Map_Name3 ; map_const NEW_BARK_TOWN						;  3
	dw New_Bark_Map_Name4 ; map_const ELMS_LAB							;  4
	dw New_Bark_Map_Name5 ; map_const PLAYERS_HOUSE_1F					;  5
	dw New_Bark_Map_Name6 ; map_const PLAYERS_HOUSE_2F					;  6
	dw New_Bark_Map_Name7 ; map_const PLAYERS_NEIGHBORS_HOUSE			;  7
	dw New_Bark_Map_Name8 ; map_const ELMS_HOUSE						;  8
	dw New_Bark_Map_Name9 ; map_const ROUTE_27_SANDSTORM_HOUSE			;  9
	dw New_Bark_Map_Name10 ; map_const ROUTE_29_ROUTE_46_GATE			; 10
	assert_table_length NUM_NEW_BARK_MAPS


Saffron_Map_Names: 	; newgroup SAFFRON
	table_width 2, Saffron_Map_Names									; 25
	dw Saffron_Map_Name1 ; map_const SAFFRON_CITY						;  1
	dw Saffron_Map_Name2 ; map_const FIGHTING_DOJO						;  2
	dw Saffron_Map_Name3 ; map_const SAFFRON_GYM						;  3
	dw Saffron_Map_Name4 ; map_const SAFFRON_MART						;  4
	dw Saffron_Map_Name5 ; map_const SAFFRON_POKECENTER_1F				;  5
	dw Saffron_Map_Name6 ; map_const MR_PSYCHICS_HOUSE					;  6
	dw Saffron_Map_Name7 ; map_const SAFFRON_MAGNET_TRAIN_STATION		;  7
	dw Saffron_Map_Name8 ; map_const SILPH_CO_1F						;  8
	dw Saffron_Map_Name9 ; map_const COPYCATS_HOUSE_1F					;  9
	dw Saffron_Map_Name10 ; map_const COPYCATS_HOUSE_2F					; 10
	dw Saffron_Map_Name11 ; map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE ; 11
	dw Saffron_Map_Name12 ; map_const ROUTE_5_SAFFRON_GATE				; 12
	dw Saffron_Map_Name13 ; map_const ROUTE_5_CLEANSE_TAG_HOUSE			; 13
	dw Saffron_Map_Name14 ; map_const SAFFRON_AVICULTURAL_SOCIETY_1F	; 14
	dw Saffron_Map_Name15 ; map_const SAFFRON_AVICULTURAL_SOCIETY_2F	; 15
	dw Saffron_Map_Name16 ; map_const SAFFRON_AVICULTURAL_SOCIETY_3F	; 16
	dw Saffron_Map_Name17 ; map_const SAFFRON_ODDISH_DOLL_HOUSE	        ; 17
	assert_table_length NUM_SAFFRON_MAPS

	; CHERRYGROVE, 26
Cherrygrove_Map_Names:
	table_width 2, Cherrygrove_Map_Names
	dw Cherrygrove_Map_Name1 ; map_const ROUTE_30                            ;  1
	dw Cherrygrove_Map_Name2 ; map_const ROUTE_31                            ;  2
	dw Cherrygrove_Map_Name3 ; map_const CHERRYGROVE_CITY                    ;  3
	dw Cherrygrove_Map_Name4 ; map_const CHERRYGROVE_MART                    ;  4
	dw Cherrygrove_Map_Name5 ; map_const CHERRYGROVE_POKECENTER_1F           ;  5
	dw Cherrygrove_Map_Name6 ; map_const CHERRYGROVE_GYM_SPEECH_HOUSE        ;  6
	dw Cherrygrove_Map_Name7 ; map_const GUIDE_GENTS_HOUSE                   ;  7
	dw Cherrygrove_Map_Name8 ; map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE  ;  8
	dw Cherrygrove_Map_Name9 ; map_const ROUTE_30_BERRY_HOUSE                ;  9
	dw Cherrygrove_Map_Name10 ; map_const MR_POKEMONS_HOUSE                  ; 10
	dw Cherrygrove_Map_Name11 ; map_const ROUTE_31_VIOLET_GATE               ; 11
	assert_table_length NUM_CHERRYGROVE_MAPS
	
	; SAFARI, 27
Safari_Map_Names:
	table_width 2, Safari_Map_Names
	dw Safari_Map_Name1 ; map_const SAFARI_ZONE_HUB					;  1
	dw Safari_Map_Name2 ; map_const SAFARI_ZONE_EAST				;  2
	dw Safari_Map_Name3 ; map_const SAFARI_ZONE_NORTH 				;  3
	dw Safari_Map_Name4 ; map_const SAFARI_ZONE_WEST 				;  4
	dw Safari_Map_Name5 ; map_const SAFARI_ZONE_HUB_REST_HOUSE 		;  5
	dw Safari_Map_Name6 ; map_const SAFARI_ZONE_EAST_REST_HOUSE 	;  6
	dw Safari_Map_Name7 ; map_const SAFARI_ZONE_NORTH_REST_HOUSE 	;  7
	dw Safari_Map_Name8 ; map_const SAFARI_ZONE_WEST_REST_HOUSE_1 	;  8
	dw Safari_Map_Name9 ; map_const SAFARI_ZONE_WEST_REST_HOUSE_2 	;  9
	assert_table_length NUM_SAFARI_MAPS

; MAX LENGTH: 17
Olivine_Map_Name1: ; map_const OLIVINE_POKECENTER_1F 					;  1
	db "Olivine <PKMN> Center@"
Olivine_Map_Name2: ; map_const OLIVINE_GYM 								;  2
	db "Olivine Gym@"
Olivine_Map_Name3: ; map_const OLIVINE_TIMS_HOUSE 						;  3
	db "Tim's House@"
Olivine_Map_Name4: ; map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE 			;  4
	db "Olivine House@"
Olivine_Map_Name5: ; map_const OLIVINE_GOOD_ROD_HOUSE 					;  5
	db "Olivine House 1@"
Olivine_Map_Name6: ; map_const OLIVINE_CAFE 							;  6
	db "Olivine Cafe@"
Olivine_Map_Name7: ; map_const OLIVINE_MART 							;  7
	db "Olivine <POKE>Mart@"
Olivine_Map_Name8: ; map_const ROUTE_38_ECRUTEAK_GATE 					;  8
	db "Route 38 Gate@"
Olivine_Map_Name9: ; map_const ROUTE_39_BARN 							;  9
	db "Route 39 Barn@"
Olivine_Map_Name10: ; map_const ROUTE_39_FARMHOUSE 						; 10
	db "Route 39 House@"
Olivine_Map_Name11: ; map_const ROUTE_38  								; 11
	db "Route 38@"
Olivine_Map_Name12: ; map_const ROUTE_39  								; 12
	db "Route 39@"
Olivine_Map_Name13: ; map_const OLIVINE_CITY 							; 13
	db "Olivine City@"

Mahogany_Map_Name1: ; map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE ;  1
	db "Mahogany House@"
Mahogany_Map_Name2: ; map_const MAHOGANY_GYM ;  2
	db "Mahogany Gym@"
Mahogany_Map_Name3: ; map_const MAHOGANY_POKECENTER_1F ;  3
	db "Mahogany <PKMN> Cen.@"
Mahogany_Map_Name4: ; map_const ROUTE_42_ECRUTEAK_GATE ;  4
	db "Route 42 Gate@"
Mahogany_Map_Name5: ; map_const ROUTE_42,  ;  5
	db "Route 42@"
Mahogany_Map_Name6: ; map_const ROUTE_44, ;  6
	db "Route 44@"
Mahogany_Map_Name7: ; map_const MAHOGANY_TOWN,  ;  7
	db "Mahogany Town@" 
Mahogany_Map_Name8: ; map_const MAHOGANY_MOVE_TUTOR_HOUSE,  ;  8
	db "Mahogany House@" 
	
Dungeons_Map_Name1: ; map_const SPROUT_TOWER_1F, ;  1
	db "Sprout Tower 1F@"
Dungeons_Map_Name2: ; map_const SPROUT_TOWER_2F, ;  2
	db "Sprout Tower 2F@"
Dungeons_Map_Name3: ; map_const SPROUT_TOWER_3F, ;  3
	db "Sprout Tower 3F@"
Dungeons_Map_Name4: ; map_const TIN_TOWER_1F,  ;  4
	db "Tin Tower 1F@"
Dungeons_Map_Name5: ; map_const TIN_TOWER_2F,;  5
	db "Tin Tower 2F@"
Dungeons_Map_Name6: ; map_const TIN_TOWER_3F,;  6
	db "Tin Tower 3F@"
Dungeons_Map_Name7: ; map_const TIN_TOWER_4F,;  7
	db "Tin Tower 4F@"
Dungeons_Map_Name8: ; map_const TIN_TOWER_5F, ;  8
	db "Tin Tower 5F@"
Dungeons_Map_Name9: ; map_const TIN_TOWER_6F, ;  9
	db "Tin Tower 6F@"
Dungeons_Map_Name10: ; map_const TIN_TOWER_7F, ; 10
	db "Tin Tower 7F@"
Dungeons_Map_Name11: ; map_const TIN_TOWER_8F,; 11
	db "Tin Tower 8F@"
Dungeons_Map_Name12: ; map_const TIN_TOWER_9F,  ; 12
	db "Tin Tower 9F@"
Dungeons_Map_Name13: ; map_const BURNED_TOWER_1F, ; 13
	db "Burned Tower 1F@"
Dungeons_Map_Name14: ; map_const BURNED_TOWER_B1F, ; 14
	db "Burned Tower B1F@"
Dungeons_Map_Name15: ; map_const NATIONAL_PARK, ; 15
	db "National Park@"
Dungeons_Map_Name16: ; map_const NATIONAL_PARK_BUG_CONTEST,; 16
	db "Bug Contest@"
Dungeons_Map_Name17: ; map_const RADIO_TOWER_1F ; 17
	db "Radio Tower 1F@"
Dungeons_Map_Name18: ; map_const RADIO_TOWER_2F ; 18
	db "Radio Tower 2F@"
Dungeons_Map_Name19: ; map_const RADIO_TOWER_3F ; 19
	db "Radio Tower 3F@"
Dungeons_Map_Name20: ; map_const RADIO_TOWER_4F ; 20
	db "Radio Tower 4F@"
Dungeons_Map_Name21: ; map_const RADIO_TOWER_5F ; 21
	db "Radio Tower 5F@"
Dungeons_Map_Name22: ; map_const RUINS_OF_ALPH_OUTSIDE, ; 22
	db "Ruins Of Alph@"
Dungeons_Map_Name23: ; map_const RUINS_OF_ALPH_HO_OH_CHAMBER ; 23
	db "Ho-Oh Chamber@"
Dungeons_Map_Name24: ; map_const RUINS_OF_ALPH_KABUTO_CHAMBER ; 24
	db "Kabuto Chamber@"
Dungeons_Map_Name25: ; map_const RUINS_OF_ALPH_OMANYTE_CHAMBER ; 25
	db "Omanyte Chamber@"
Dungeons_Map_Name26: ; map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER ; 26
	db "Aero Chamber@"
Dungeons_Map_Name27: ; map_const RUINS_OF_ALPH_INNER_CHAMBE ; 27
	db "Ruins Chamber@"
Dungeons_Map_Name28: ; map_const RUINS_OF_ALPH_RESEARCH_CENTER ; 28
	db "Ruins Lab@"
Dungeons_Map_Name29: ; map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM ; 29
	db "Ho-Oh Prize Room@"
Dungeons_Map_Name30: ; map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM ; 30
	db "Kabuto Prize Room@"
Dungeons_Map_Name31: ; map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM ; 31
	db "Omanyte PrizeRoom@"
Dungeons_Map_Name32: ; map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM ; 32
	db "Aero Prize Room@"
Dungeons_Map_Name33: ; map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM,; 33
	db "Ho-Oh Word Room@"
Dungeons_Map_Name34: ; map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM,; 34
	db "Kabuto Word Room@"
Dungeons_Map_Name35: ; map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM,; 35
	db "Omanyte Word Room@"
Dungeons_Map_Name36: ; map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,; 36
	db "Aero Word Room@"
Dungeons_Map_Name37: ; map_const UNION_CAVE_1F,; 37
	db "Union Cave 1F@"
Dungeons_Map_Name38: ; map_const UNION_CAVE_B1F,; 38
	db "Union Cave B1F@"
Dungeons_Map_Name39: ; map_const UNION_CAVE_B2F,; 39
	db "Union Cave B2F@"
Dungeons_Map_Name40: ; map_const SLOWPOKE_WELL_B1F,; 40
	db "Slowpoke Well B1@"
Dungeons_Map_Name41: ; map_const SLOWPOKE_WELL_B2F,; 41
	db "Slowpoke Well B2@"
Dungeons_Map_Name42: ; map_const OLIVINE_LIGHTHOUSE_1F,; 42
	db "Lighthouse 1F@"
Dungeons_Map_Name43: ; map_const OLIVINE_LIGHTHOUSE_2F,; 43
	db "Lighthouse 2F@"
Dungeons_Map_Name44: ; map_const OLIVINE_LIGHTHOUSE_3F,; 44
	db "Lighthouse 3F@"
Dungeons_Map_Name45: ; map_const OLIVINE_LIGHTHOUSE_4F,; 45
	db "Lighthouse 4F@"
Dungeons_Map_Name46: ; map_const OLIVINE_LIGHTHOUSE_5F,; 46
	db "Lighthouse 5F@"
Dungeons_Map_Name47: ; map_const OLIVINE_LIGHTHOUSE_6F,; 47
	db "Lighthouse 6F@"
Dungeons_Map_Name48: ; map_const MAHOGANY_MART_1F ; 48
	db "Mahogany <POKE>Mart@"
Dungeons_Map_Name49: ; map_const TEAM_ROCKET_BASE_B1F,; 49
	db "Rocket Base B1F@"
Dungeons_Map_Name50: ; map_const TEAM_ROCKET_BASE_B2F,; 50
	db "Rocket Base B2F@"
Dungeons_Map_Name51: ; map_const TEAM_ROCKET_BASE_B3F,; 51
	db "Rocket Base B3F@"
Dungeons_Map_Name52: ; map_const ILEX_FOREST,; 52
	db "Ilex Forest@"
Dungeons_Map_Name53: ; map_const GOLDENROD_UNDERGROUND,; 53
	db "Gold. Underground@"
Dungeons_Map_Name54: ; map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES,; 54
	db "Gold. Switch Room@"
Dungeons_Map_Name55: ; map_const GOLDENROD_DEPT_STORE_B1F,; 55
	db "Gold. Dept B1F@"
Dungeons_Map_Name56: ; map_const GOLDENROD_UNDERGROUND_WAREHOUSE,; 56
	db "Gold. Dept B1F@"
Dungeons_Map_Name57: ; map_const MOUNT_MORTAR_1F_OUTSIDE,; 57
	db "Mt. Mortar@"
Dungeons_Map_Name58: ; map_const MOUNT_MORTAR_1F_INSIDE,; 58
	db "Mt. Mortar 1F@"
Dungeons_Map_Name59: ; map_const MOUNT_MORTAR_2F_INSIDE,; 59
	db "Mt. Mortar 2F@"
Dungeons_Map_Name60: ; map_const MOUNT_MORTAR_B1F,; 60
	db "Mt. Mortar B1F@"
Dungeons_Map_Name61: ; map_const ICE_PATH_1F,; 61
	db "Ice Path 1F@"
Dungeons_Map_Name62: ; map_const ICE_PATH_B1F,; 62
	db "Ice Path B1F@"
Dungeons_Map_Name63: ; map_const ICE_PATH_B2F_MAHOGANY_SIDE,; 63
	db "Ice Path B2F W@"
Dungeons_Map_Name64: ; map_const ICE_PATH_B2F_BLACKTHORN_SIDE ; 64
	db "Ice Path B2F E@"
Dungeons_Map_Name65: ; map_const ICE_PATH_B3F,; 65
	db "Ice Path B3F@"
Dungeons_Map_Name66: ; map_const WHIRL_ISLAND_NW ; 66
	db "Whirl Islands NW@"
Dungeons_Map_Name67: ; map_const WHIRL_ISLAND_NE,; 67
	db "Whirl Islands NE@"
Dungeons_Map_Name68: ; map_const WHIRL_ISLAND_SW,; 68
	db "Whirl Islands SW@"
Dungeons_Map_Name69: ; map_const WHIRL_ISLAND_CAVE ; 69
	db "Whirl Cave@"
Dungeons_Map_Name70: ; map_const WHIRL_ISLAND_SE ; 70
	db "Whirl Islands SE@"
Dungeons_Map_Name71: ; map_const WHIRL_ISLAND_B1F,; 71
	db "Whirl Islands B1F@"
Dungeons_Map_Name72: ; map_const WHIRL_ISLAND_B2F,; 72
	db "Whirl Islands B2F@"
Dungeons_Map_Name73: ; map_const WHIRL_ISLAND_LUGIA_CHAMBER,; 73
	db "Whirl Chamber@"
Dungeons_Map_Name74: ; map_const MT_SILVER_ROOM_1,; 74
	db "Mt. Silver R1@"
Dungeons_Map_Name75: ; map_const MT_SILVER_ROOM_2,; 75
	db "Mt. Silver R2@"
Dungeons_Map_Name76: ; map_const MT_SILVER_PEAK,; 76
	db "Mt. Silver Peak@"
Dungeons_Map_Name77: ; map_const MT_SILVER_ITEM_ROOMS,; 77
	db "Mt. Silver Room@"
Dungeons_Map_Name78: ; map_const DARK_CAVE_VIOLET_ENTRANCE,; 78
	db "Dark Cave, West@"	
Dungeons_Map_Name79: ; map_const DARK_CAVE_BLACKTHORN_ENTRANCE,; 79
	db "Dark Cave, East@"
Dungeons_Map_Name80: ; map_const DRAGONS_DEN_1F,; 80
	db "Dragons Den 1F@"
Dungeons_Map_Name81: ; map_const DRAGONS_DEN_B1F, ; 81
	db "Dragons Den B1@"
Dungeons_Map_Name82: ; map_const DRAGON_SHRINE, ; 82
	db "Dragon Shrine@"
Dungeons_Map_Name83: ; map_const TOHJO_FALLS, ; 83
	db "Tohjo Falls@"
Dungeons_Map_Name84: ; map_const DIGLETTS_CAVE,; 84
	db "Diglett's Cave@"
Dungeons_Map_Name85: ; map_const VIRIDIAN_FOREST,; 85
	db "Viridian Forest@"
Dungeons_Map_Name86: ; map_const MOUNT_MOON_1F,; 86
	db "Mt. Moon 1F@"	
Dungeons_Map_Name87: ; map_const UNDERGROUND_PATH,; 87
	db "Underground Path@"
Dungeons_Map_Name88: ; map_const ROCK_TUNNEL_1F,; 88
	db "Rock Tunnel 1F@"
Dungeons_Map_Name89: ; map_const ROCK_TUNNEL_B1F,; 89
	db "Rock Tunnel B1F@"
Dungeons_Map_Name90: ; map_const VICTORY_ROAD_1F,;  90
	db "Victory Road 1F@"
Dungeons_Map_Name91: ; map_const VICTORY_ROAD_2F,;  91
	db "Victory Road 2F@"
Dungeons_Map_Name92: ; map_const VICTORY_ROAD_3F,;  92
	db "Victory Road 3F@"
Dungeons_Map_Name93: ; map_const UNDERGROUND_ROOM,;  93
	db "Underground Room@"
Dungeons_Map_Name94: ; map_const CERULEAN_CAVE_1F,;  94
	db "Cerulean Cave 1F@"
Dungeons_Map_Name95: ; map_const CERULEAN_CAVE_2F,;  95
	db "Cerulean Cave 2F@"
Dungeons_Map_Name96: ; map_const CERULEAN_CAVE_B1F,;  96
	db "Cerulean Cave B1F@"
Dungeons_Map_Name97: ; map_const RUINS_OF_ALPH_GS_BALL_CHAMBER,;  97
	db "GS Ball Chamber@"
Dungeons_Map_Name98: ; map_const RUINS_OF_ALPH_CAVE_ENTRANCE,; 98
	db "Ruins of Alph Cave@"
Dungeons_Map_Name99: ; map_const SLOWPOKE_WELL_ENTRANCE,; 98
	db "Slowpoke Well Ent.@"
Dungeons_Map_Name100: ; map_const SLOWPOKE_WELL_ENTRANCE,; 98
	db "Mt. Moon B1F@"
Dungeons_Map_Name101: ; map_const SLOWPOKE_WELL_ENTRANCE,; 98
	db "Mt. Moon B2F@"

Ecruteak_Map_Name1: ; map_const ROUTE_35,;  1
	db "Route 35@"
Ecruteak_Map_Name2: ; map_const ROUTE 36,;  1
	db "Route 36@"
Ecruteak_Map_Name3: ; map_const ROUTE 37,;  1
	db "Route 37@"
Ecruteak_Map_Name4: ; map_const ECRUTEAK_TIN_TOWER_ENTRANCE,;  1
	db "Tin Tower Path@"
Ecruteak_Map_Name5: ; map_const WISE_TRIOS_ROOM ;  2
	db "Wise Trio Room@"
Ecruteak_Map_Name6: ; map_const ECRUTEAK_POKECENTER_1F ;  3
	db "Ecruteak <PKMN> Cen.@"
Ecruteak_Map_Name7: ; map_const ECRUTEAK_LUGIA_SPEECH_HOUSE ;  4
	db "Ecruteak House 1@"
Ecruteak_Map_Name8: ; map_const DANCE_THEATRE ;  5
	db "Dance Theater@"
Ecruteak_Map_Name9: ; map_const ECRUTEAK_MART ;  6
	db "Ecruteak <POKE>Mart@"
Ecruteak_Map_Name10: ; map_const ECRUTEAK_GYM ;  7
	db "Ecruteak Gym@"
Ecruteak_Map_Name11: ; map_const ECRUTEAK_ITEMFINDER_HOUSE ;  8
	db "Itemfinder House@"
Ecruteak_Map_Name12: ; map_const ECRUTEAK_CITY,;  9
	db "Ecruteak City@"
Ecruteak_Map_Name13: ; map_const ECRUTEAK_FAIRY_FAMILY_HOUSE,; 10
	db "Fairy House@"
Ecruteak_Map_Name14: ; map_const ECRUTEAK_SWARM_HOUSE,; 10
	db "Swarm House@"	
Ecruteak_Map_Name15: ; map_const ROUTE_35_GOLDENROD_GATE,; 10
	db "Route 35 Gate 1@"
Ecruteak_Map_Name16: ; map_const ROUTE_35_NATIONAL_PARK_GATE ; 14
	db "Route 35 Gate 2@"
Ecruteak_Map_Name17: ; map_const ROUTE_36_NATIONAL_PARK_GATE ; 15
	db "Route 36 Gate@"

Blackthorn_Map_Name1: ; map_const BLACKTHORN_GYM_1F ;  1
	db "Blackthorn Gym@"
Blackthorn_Map_Name2: ; map_const BLACKTHORN_GYM_2F ;  2
	db "Blackthorn Gym B1@"
Blackthorn_Map_Name3: ; map_const BLACKTHORN_DRAGON_SPEECH_HOUSE ;  3
	db "Dragon House@"
Blackthorn_Map_Name4: ; map_const BLACKTHORN_EMYS_HOUSE ;  4
	db "Emy's House@"
Blackthorn_Map_Name5: ; map_const BLACKTHORN_MART ;  5
	db "Blackthorn <POKE>Mart@"
Blackthorn_Map_Name6: ; map_const BLACKTHORN_POKECENTER_1F ;  6
	db "Blkth. <PKMN> Center@"
Blackthorn_Map_Name7: ; map_const ROUTE_45,;  7
	db "Route 45@"
Blackthorn_Map_Name8: ; map_const ROUTE_46,;  8
	db "Route 46@"
Blackthorn_Map_Name9: ; map_const BLACKTHORN_CITY,;  9
	db "Blackthorn City@"
Blackthorn_Map_Name10: ; map_const BLACKTHORN_MOVE_TUTOR_HOUSE,; 10
	db "Blackthorn House@"	
Blackthorn_Map_Name11: ; map_const MADAM_ITEMS_HOUSE,; 10
	db "Madam Items@"	

Cinnabar_Map_Name1: ; map_const CINNABAR_POKECENTER_1F ;  1
	db "Cinnabar <PKMN> Cen.@"
Cinnabar_Map_Name2: ; map_const ROUTE_19_FUCHSIA_GATE ;  2
	db "Route 19 Gate@"
Cinnabar_Map_Name3: ; map_const ROUTE_19, ;  3
	db "Route 19@"
Cinnabar_Map_Name4: ; map_const ROUTE_20,;  4
	db "Route 20@"
Cinnabar_Map_Name5: ; map_const ROUTE_21,;  5
	db "Route 21@"
Cinnabar_Map_Name6: ; map_const CINNABAR_ISLAND,;  6
	db "Cinnabar Island@"
Cinnabar_Map_Name7: ; map_const CINNABAR_VOLCANO_1F,;  7
	db "Cinnabar Vol 1F@"
Cinnabar_Map_Name8: ; map_const CINNABAR_VOLCANO_2F,;  8
	db "Cinnabar Vol 2F@"
Cinnabar_Map_Name9: ; map_const CINNABAR_MOLTRES_NEST,;  9
	db "Moltres Nest@"
Cinnabar_Map_Name10: ; map_const CINNABAR_ISLAND_RECOVERY_LAB,;  10
	db "Cinnabar Rec. Lab@"
Cinnabar_Map_Name11: ; map_const CINNABAR_GYM,; 11
	db "Cinnabar Gym@"
Cinnabar_Map_Name12: ; map_const SEAFOAM_ISLANDS_1F,; 12
	db "Seafoam Isl. 1F@"
Cinnabar_Map_Name13: ; map_const SEAFOAM_ISLANDS_B1F,; 13
	db "Seafoam Isl. B1F@"
Cinnabar_Map_Name14: ; map_const SEAFOAM_ISLANDS_B2F,; 14
	db "Seafoam Isl. B2F@"
Cinnabar_Map_Name15: ; map_const SEAFOAM_ISLANDS_B3F,; 15
	db "Seafoam Isl. B3F@"
Cinnabar_Map_Name16: ; map_const SEAFOAM_ISLANDS_B4F,; 16
	db "Seafoam Isl. B4F@"

Cerulean_Map_Name1: ; map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE ;  1
	db "Cerulean House 1@"
Cerulean_Map_Name2: ; map_const CERULEAN_POLICE_STATION ;  2
	db "Police Station@"
Cerulean_Map_Name3: ; map_const CERULEAN_TRADE_SPEECH_HOUSE ;  3
	db "Cerulean House 2@"
Cerulean_Map_Name4: ; map_const CERULEAN_POKECENTER_1F ;  4
	db "Cerulean <PKMN> Cen.@"
Cerulean_Map_Name5: ; map_const CERULEAN_GYM ;  5
	db "Cerulean Gym@"
Cerulean_Map_Name6: ; map_const CERULEAN_MART ;  6
	db "Cerulean <POKE>Mart@"
Cerulean_Map_Name7: ; map_const ROUTE_10_POKECENTER_1F ;  7
	db "Route 10 <PKMN> Cen.@"
Cerulean_Map_Name8: ; map_const POWER_PLANT,; 8
	db "Power Plant@"
Cerulean_Map_Name9: ; map_const BILLS_HOUSE ; 9
	db "Bill's House@"
Cerulean_Map_Name10: ; map_const ROUTE_4,; 10
	db "Route 4@"
Cerulean_Map_Name11: ; map_const ROUTE_5,; 11
	db "Route 5@"
Cerulean_Map_Name12: ; map_const ROUTE_9,; 12
	db "Route 9@"
Cerulean_Map_Name13: ; map_const ROUTE_10_NORTH,; 13
	db "Route 10 North@"
Cerulean_Map_Name14: ; map_const ROUTE_24,; 14
	db "Route 24@"
Cerulean_Map_Name15: ; map_const ROUTE_25,; 15
	db "Route 25@"
Cerulean_Map_Name16: ; map_const CERULEAN_CITY,;  16
	db "Cerulean City@"
Cerulean_Map_Name17: ; map_const ROUTE_4_ZAPDOS_NEST,;  16
	db "Zapdos Nest@"
Cerulean_Map_Name18: ; map_const CERULEAN_EMPTY_HOUSE,;  18
	db "Cerulean House@"
Cerulean_Map_Name19: ; map_const CERULEAN_EMPTY_HOUSE_UNDERGROUND,;  19
	db "Cerulean Undergrnd@"

Azalea_Map_Name1: ; map_const AZALEA_POKECENTER_1F ;  1
	db "Azalea <PKMN> Center@"
Azalea_Map_Name2: ; map_const CHARCOAL_KILN ;  2
	db "Charcoal Kiln@"
Azalea_Map_Name3: ; map_const AZALEA_MART ;  3
	db "Azalea <POKE>Mart@"
Azalea_Map_Name4: ; map_const KURTS_HOUSE ;  4
	db "Kurt's House@"
Azalea_Map_Name5: ; map_const AZALEA_GYM ;  5
	db "Azalea Gym@"
Azalea_Map_Name6: ; map_const ROUTE_33, ;  6
	db "Route 33@"
Azalea_Map_Name7: ; map_const AZALEA_TOWN, ; 7
	db "Azalea Town@"

Lake_of_Rage_Map_Name1: ; map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE ;  1
	db "Hidden Power Hs@"
Lake_of_Rage_Map_Name2: ; map_const LAKE_OF_RAGE_MAGIKARP_HOUSE ;  2
	db "Magikarp House@"
Lake_of_Rage_Map_Name3: ; map_const ROUTE_43_MAHOGANY_GATE ;  3
	db "Rt 43 Gate 1@"
Lake_of_Rage_Map_Name4: ; map_const ROUTE_43_GATE ;  4
	db "Rt 43 Gate 2@"
Lake_of_Rage_Map_Name5: ; map_const ROUTE_43 ;  5
	db "Route 43@"
Lake_of_Rage_Map_Name6: ; map_const LAKE_OF_RAGE ; 6
	db "Lake Of Rage@"                                             ; 10

Violet_Map_Name1: ; map_const ROUTE_32								;  1
	db "Route 32@"
Violet_Map_Name2: ; map_const VIOLET_CITY							;  2
	db "Violet City@"
Violet_Map_Name3: ; map_const VIOLET_MART 							;  3
	db "Violet <POKE>Mart@"
Violet_Map_Name4: ; map_const VIOLET_GYM 							;  4
	db "Violet Gym@"
Violet_Map_Name5: ; map_const EARLS_POKEMON_ACADEMY 				;  5
	db "Earl's Academy@"
Violet_Map_Name6: ; map_const VIOLET_NICKNAME_SPEECH_HOUSE 			;  6
	db "Violet House 1@"
Violet_Map_Name7: ; map_const VIOLET_POKECENTER_1F 					; 7
	db "Violet <PKMN> Center@"
Violet_Map_Name8: ; map_const VIOLET_KYLES_HOUSE 					; 8
	db "Kyle's House@"
Violet_Map_Name9: ; map_const VIOLET_PRIMOS_HOUSE 					; 9
	db "Primo's House@"
Violet_Map_Name10: ; map_const ROUTE_32_RUINS_OF_ALPH_GATE 			; 10
	db "Route 32 Gate 1@"
Violet_Map_Name11: ; map_const ROUTE_32_POKECENTER_1F 				; 11
	db "Route 32 <PKMN> Cen.@"
Violet_Map_Name12: ; map_const ROUTE_36_RUINS_OF_ALPH_GATE 			; 12
	db "Route 36 Gate 2@"
Violet_Map_Name13: ; map_const ROUTE_36_VIOLET_GATE 				; 13
	db "Route 36 Gate 1@"
Violet_Map_Name14: ; map_const EARLS_POKEMON_ACADEMY_B1F 			; 14
	db "Earl's Academy B1F@"

Goldenrod_Map_Name1: ; map_const ROUTE_34,;  1
	db "Route 34@"
Goldenrod_Map_Name2: ; map_const GOLDENROD_CITY;  2
	db "Goldenrod City@"
Goldenrod_Map_Name3: ; map_const GOLDENROD_GYM,;  3
	db "Goldenrod Gym@"
Goldenrod_Map_Name4: ; map_const GOLDENROD_BIKE_SHOP ;  4
	db "Gold. Bike Shop@"
Goldenrod_Map_Name5: ; map_const GOLDENROD_HAPPINESS_RATER ;  5
	db "Happiness Rater@"
Goldenrod_Map_Name6: ; map_const BILLS_FAMILYS_HOUSE ;  6
	db "Bill's Fam. House@"
Goldenrod_Map_Name7: ; map_const GOLDENROD_MAGNET_TRAIN_STATION,;  7
	db "Train Station 1@"
Goldenrod_Map_Name8: ; map_const GOLDENROD_FLOWER_SHOP ;  8
	db "Flower Shop@"
Goldenrod_Map_Name9: ; map_const GOLDENROD_PP_SPEECH_HOUSE ;  9
	db "Goldenrod House 1"
Goldenrod_Map_Name10: ; map_const GOLDENROD_NAME_RATER ; 10
	db "Gold. Name Rater@"
Goldenrod_Map_Name11: ; map_const GOLDENROD_DEPT_STORE_1F ; 11
	db "Gold.DeptStore 1F@"
Goldenrod_Map_Name12: ; map_const GOLDENROD_DEPT_STORE_2F ; 12
	db "Gold.DeptStore 2F@"
Goldenrod_Map_Name13: ; map_const GOLDENROD_DEPT_STORE_3F ; 13
	db "Gold.DeptStore 3F@"
Goldenrod_Map_Name14: ; map_const GOLDENROD_DEPT_STORE_4F ; 14
	db "Gold.DeptStore 4F@"
Goldenrod_Map_Name15: ; map_const GOLDENROD_DEPT_STORE_5F ; 15
	db "Gold.DeptStore 5F@"
Goldenrod_Map_Name16: ; map_const GOLDENROD_DEPT_STORE_6F ; 16
	db "Gold.DeptStore 6F@"
Goldenrod_Map_Name17: ; map_const GOLDENROD_DEPT_STORE_ELEVATOR ; 17
	db "Gold. Dept Lift@"
Goldenrod_Map_Name18: ; map_const GOLDENROD_DEPT_STORE_ROOF ; 18
	db "Gold. Dept Roof@"
Goldenrod_Map_Name19: ; map_const GOLDENROD_GAME_CORNER,; 19
	db "Gold. Game Corner@"
Goldenrod_Map_Name20: ; map_const GOLDENROD_POKECENTER_1F ; 20
	db "Goldenrod <PKMN> Cen.@"
Goldenrod_Map_Name21: ; map_const ILEX_FOREST_AZALEA_GATE ; 21
	db "Azalea Gate@"
Goldenrod_Map_Name22: ; map_const ROUTE_34_ILEX_FOREST_GATE ; 22
	db "Ilex Gate@"
Goldenrod_Map_Name23: ; map_const DAY_CARE ; 23 
	db "Johto DayCare@"
Goldenrod_Map_Name24: ; map_const GOLDENROD_HOME_DECOR_STORE_1F ; 24 
	db "Gold.DecorStore 1F@"
Goldenrod_Map_Name25: ; map_const GOLDENROD_HOME_DECOR_STORE_2F ; 25 
	db "Gold.DecorStore 2F@"
Goldenrod_Map_Name26: ; map_const GOLDENROD_HOME_DECOR_STORE_3F ; 26 
	db "Gold.DecorStore 3F@"
Goldenrod_Map_Name27: ; map_const GOLDENROD_HOME_DECOR_STORE_4F ; 27 
	db "Gold.DecorStore 4F@"
Goldenrod_Map_Name28: ; map_const GOLDENROD_FLOWER_SHOP_GARDEN ;  28
	db "Flower Shop Garden@"

Vermilion_Map_Name1: ; map_const ROUTE_6,;  1
	db "Route 6@"
Vermilion_Map_Name2: ; map_const ROUTE_11,;  2
	db "Route 11@"
Vermilion_Map_Name3: ; map_const VERMILION_CITY, ;  3
	db "Vermilion City@"
Vermilion_Map_Name4: ; map_const VERMILION_FISHING_SPEECH_HOUSE ;  4
	db "Vermilion House 1@"
Vermilion_Map_Name5: ; map_const VERMILION_POKECENTER_1F ;  5
	db "Vermilion <PKMN> Cen.@"
Vermilion_Map_Name6: ; map_const POKEMON_FAN_CLUB ;  6
	db "Vermilion FanClub@"
Vermilion_Map_Name7: ; map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE ;  7
	db "Vermilion House 2@"
Vermilion_Map_Name8: ; map_const VERMILION_MART ;  8
	db "Vermilion <POKE>Mart@"
Vermilion_Map_Name9: ; map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE ;  9
	db "Vermilion House 3@"
Vermilion_Map_Name10: ; map_const VERMILION_GYM ; 10
	db "Vermilion Gym@"
Vermilion_Map_Name11: ; map_const ROUTE_6_SAFFRON_GATE ; 11
	db "Route 6 Gate@"
Vermilion_Map_Name12: ; map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE ; 12
	db "Route 6 Under.@"                                           
Vermilion_Map_Name13: ; map_const ROUTE_11_ROUTE_12_GATE ; 13
	db "Route 11 Gate.@" 
Vermilion_Map_Name14: ; map_const VERMILION_BERRY_MART ; 14
	db "Berry Mart.@"
Vermilion_Map_Name15: ; map_const VERMILION_SAILORS_HOUSE ; 15
	db "Vermil Sailor Hse@" 

Pallet_Map_Name1: ; map_const ROUTE_1,;  1
	db "Route 1@"
Pallet_Map_Name2: ; map_const PALLET_TOWN,;  2
	db "Pallet Town@"
Pallet_Map_Name3: ; map_const REDS_HOUSE_1F ;  3
	db "Red's House 1F@"
Pallet_Map_Name4: ; map_const REDS_HOUSE_2F ;  4
	db "Red's House 2F@"
Pallet_Map_Name5: ; map_const BLUES_HOUSE ;  5
	db "Blue's House@"
Pallet_Map_Name6: ; map_const OAKS_LAB ;  6  ; 14
	db "Oak's Lab@"
Pallet_Map_Name7: ; map_const ROUTE_1_VIRIDIAN_GATE ;  6  ; 14
	db "Route 1 Gate.@"

Pewter_Map_Name1: ; map_const ROUTE_3,;  1
	db "Route 3@"
Pewter_Map_Name2: ; map_const PEWTER_CITY,;  2
	db "Pewter City@"
Pewter_Map_Name3: ; map_const PEWTER_NIDORAN_SPEECH_HOUSE ;  3
	db "Pewter House 1@"
Pewter_Map_Name4: ; map_const PEWTER_GYM ;  4
	db "Pewter Gym@"
Pewter_Map_Name5: ; map_const PEWTER_MART ;  5
	db "Pewter <POKE>Mart@"
Pewter_Map_Name6: ; map_const PEWTER_POKECENTER_1F ;  6
	db "Pewter <PKMN> Center@"
Pewter_Map_Name7: ; map_const PEWTER_SNOOZE_SPEECH_HOUSE ;  7
	db "Pewter House 2@"
Pewter_Map_Name8: ; map_const ROUTE_3_POKECENTER_1F ;  8
	db "Route 3 <PKMN> Cen.@" 

Fast_Ship_Map_Name1: ; map_const OLIVINE_PORT,;  1
	db "Olivine Marina@"
Fast_Ship_Map_Name2: ; map_const VERMILION_PORT,;  2
	db "Vermilion Marina@"
Fast_Ship_Map_Name3: ; map_const FAST_SHIP_1F,;  3
	db "S.S. Aqua@"
Fast_Ship_Map_Name4: ; map_const FAST_SHIP_CABINS_NNW_NNE_NE,;  4
	db "S.S. Aqua Cabin 1@"
Fast_Ship_Map_Name5: ; map_const FAST_SHIP_CABINS_SW_SSW_NW,;  5
	db "S.S. Aqua Cabin 1@"
Fast_Ship_Map_Name6: ; map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,;  6
	db "S.S. Aqua CptQtrs@"
Fast_Ship_Map_Name7: ; map_const FAST_SHIP_B1F,;  7
	db "S.S. Aqua Galley@"
Fast_Ship_Map_Name8: ; map_const OLIVINE_PORT_PASSAGE,;  8
	db "Johto PortPassage@"
Fast_Ship_Map_Name9: ; map_const VERMILION_PORT_PASSAGE,;  9
	db "Kanto PortPassage@"
Fast_Ship_Map_Name10: ; map_const MOUNT_MOON_SQUARE,; 10
	db "Mt. Moon Square@"
Fast_Ship_Map_Name11: ; map_const MOUNT_MOON_GIFT_SHOP ; 11
	db "Mt. Moon Shop@"
Fast_Ship_Map_Name12: ; map_const TIN_TOWER_ROOF, 12
	db "Tin Tower Roof@"                                             ; 16
Fast_Ship_Map_Name13: ; map_const FARAWAY_ISLAND_OUTSIDE, 13
	db "Faraway Island@"  
Fast_Ship_Map_Name14: ; map_const FARAWAY_ISLAND_INSIDE, 14
	db "Faraway Island@"   	

Indigo_Map_Name1: ; map_const ROUTE_23,;  1
	db "Route 23@"
Indigo_Map_Name2: ; map_const INDIGO_PLATEAU_POKECENTER_1F ;  2
	db "Indigo Plateau@"
Indigo_Map_Name3: ; map_const WILLS_ROOM ;  3
	db "E4 Will's Room@"
Indigo_Map_Name4: ; map_const KOGAS_ROOM ;  4
	db "E4 Koga's Room@"
Indigo_Map_Name5: ; map_const BRUNOS_ROOM ;  5
	db "E4 Bruno's Room@"
Indigo_Map_Name6: ; map_const KARENS_ROOM ;  6
	db "E4 Karen's Room@"
Indigo_Map_Name7: ; map_const LANCES_ROOM,;  7
	db "E4 Lance's Room@"
Indigo_Map_Name8: ; map_const HALL_OF_FAME ;  8
	db "E4 Hall Of Fame@"                                           ; 17
Indigo_Map_Name9: ; map_const HALL_OF_FAME ;  9
	db "Indigo Plateau@"  

Fuchsia_Map_Name1: ; map_const ROUTE_12							;  1
	db "Route 12@"
Fuchsia_Map_Name2: ; map_const ROUTE_12_SUPER_ROD_HOUSE			;  2
	db "Route 12 Angler@"
Fuchsia_Map_Name3: ; map_const ROUTE_13							;  3
	db "Route 13@"
Fuchsia_Map_Name4: ; map_const ROUTE_14							;  4
	db "Route 14@"
Fuchsia_Map_Name5: ; map_const ROUTE_15							;  5
	db "Route 15@"
Fuchsia_Map_Name6: ; map_const ROUTE_16							;  6
	db "Route 16@"
Fuchsia_Map_Name7: ; map_const ROUTE_17							;  7
	db "Route 17@"
Fuchsia_Map_Name8: ; map_const ROUTE_18							;  8
	db "Route 18@"
Fuchsia_Map_Name9: ; map_const FUCHSIA_CITY						;  9
	db "Fuchsia City@"
Fuchsia_Map_Name10: ; map_const FUCHSIA_MART 					; 10
	db "Fuchsia <POKE>Mart@"
Fuchsia_Map_Name11: ; map_const SAFARI_ZONE_FUCHSIA_GATE 		; 11
	db "Safari Zone Gate@"
Fuchsia_Map_Name12: ; map_const FUCHSIA_GYM 					; 12
	db "Fuchsia Gym@"
Fuchsia_Map_Name13: ; map_const BILLS_BROTHERS_HOUSE 			; 13
	db "Bill's Bro House@"
Fuchsia_Map_Name14: ; map_const FUCHSIA_POKECENTER_1F 			; 14
	db "Fuchsia <PKMN> Center@"
Fuchsia_Map_Name15: ; map_const SAFARI_ZONE_WARDENS_HOME 		; 15
	db "Warden's House@" 
Fuchsia_Map_Name16: ; map_const ROUTE_15_FUCHSIA_GATE 			; 16
	db "Route 15 Gate@"
Fuchsia_Map_Name17: ; map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE 	; 17
	db "Route 16 House@"
Fuchsia_Map_Name18: ; map_const ROUTE_16_GATE 					; 18
	db "Route 16 Gate@"
Fuchsia_Map_Name19: ; map_const ROUTE_17_ROUTE_18_GATE 			; 19
	db "Route 17 Gate@"
Fuchsia_Map_Name20: ; map_const FUCHSIA_CINNABAR_HOUSE_1 		; 20
	db "Fuchsia House@"

Lavender_Map_Name1: ; map_const ROUTE_8,;  1
	db "Route 8@"
Lavender_Map_Name2: ; map_const ROUTE_10_SOUTH,;  2
	db "Route 10 S.@"
Lavender_Map_Name3: ; map_const LAVENDER_TOWN,;  3
	db "Lavender Town@"
Lavender_Map_Name4: ; map_const LAVENDER_POKECENTER_1F ;  4
	db "Lavender <PKMN> Cen.@"
Lavender_Map_Name5: ; map_const MR_FUJIS_HOUSE ;  5
	db "Mr.Fuji's House@"
Lavender_Map_Name6: ; map_const LAVENDER_SPEECH_HOUSE ;  6
	db "Lavender House 1@"
Lavender_Map_Name7: ; map_const LAVENDER_NAME_RATER ;  7
	db "Kanto Name Rater@"
Lavender_Map_Name8: ; map_const LAVENDER_MART ;  8
	db "Lavender <POKE>Mart@"
Lavender_Map_Name9: ; map_const SOUL_HOUSE ;  9
	db "Soul House@"
Lavender_Map_Name10: ; map_const LAV_RADIO_TOWER_1F,; 10
	db "Kanto Radio Tower@"
Lavender_Map_Name11: ; map_const ROUTE_12_LAVENDER_GATE ; 11
	db "Route 12 Gate@"   
Lavender_Map_Name12: ; map_const ROUTE_8_SAFFRON_GATE ; 12
	db "Route 8 Gate@"                                              ; 19

Silver_Map_Name1: ; map_const ROUTE_28,;  1
	db "Route 28@"
Silver_Map_Name2: ; map_const MT_SILVER_OUTSIDE,;  2
	db "Mt. Silver@"	
Silver_Map_Name3: ; map_const SILVER_CAVE_POKECENTER_1F ;  3
	db "Silver <PKMN> Cen.@"
Silver_Map_Name4: ; map_const ROUTE_28_STEEL_WING_HOUSE ;  4
	db "Route 28 Cabin@"                                       ; 20

Cable_Club_Map_Name1: ; map_const POKECENTER_2F ;  1
	db "<PKMN> Center 2F@"
Cable_Club_Map_Name2: ; map_const TRADE_CENTER ;  2
	db "<PKMN> Trade Center@"
Cable_Club_Map_Name3: ; map_const COLOSSEUM ;  3
	db "<PKMN> Colosseum@"
;Cable_Club_Map_Name4: ; map_const TIME_CAPSULE ;  4
;	db "<PKMN> TIME CAPSULE@"
;Cable_Club_Map_Name5: ; map_const MOBILE_TRADE_ROOM ;  5
;	db "MOBILE TRADE@"
;Cable_Club_Map_Name6: ; map_const MOBILE_BATTLE_ROOM ;  6
;	db "MOBILE BATTLE@"                                          ; 21

Celadon_Map_Name1: ; map_const ROUTE_7,;  1
	db "Route 7@"
Celadon_Map_Name2: ; map_const CELADON_CITY, 2
	db "Celadon City@"
Celadon_Map_Name3: ; map_const CELADON_DEPT_STORE_1F ;  3
	db "Cel. DeptStore 1F@"
Celadon_Map_Name4: ; map_const CELADON_DEPT_STORE_2F ;  4
	db "Cel. DeptStore 2F@"
Celadon_Map_Name5: ; map_const CELADON_DEPT_STORE_3F ;  5
	db "Cel. DeptStore 3F@"
Celadon_Map_Name6: ; map_const CELADON_DEPT_STORE_4F ;  6
	db "Cel. DeptStore 4F@"
Celadon_Map_Name7: ; map_const CELADON_DEPT_STORE_5F ;  7
	db "Cel. DeptStore 5F@"
Celadon_Map_Name8: ; map_const CELADON_DEPT_STORE_6F ;  8
	db "Cel. DeptStore 6F@"
Celadon_Map_Name9: ; map_const CELADON_DEPT_STORE_ELEVATOR ;  9
	db "Celadon Dept Lift@"
Celadon_Map_Name10: ; map_const CELADON_MANSION_1F ; 10
	db "Celadon Mansion1F@"
Celadon_Map_Name11: ; map_const CELADON_MANSION_2F ; 11
	db "Celadon Mansion2F@"
Celadon_Map_Name12: ; map_const CELADON_MANSION_3F ; 12
	db "Celadon Mansion3F@"
Celadon_Map_Name13: ; map_const CELADON_MANSION_ROOF ; 13
	db "Cel. Mansion Roof@"
Celadon_Map_Name14: ; map_const CELADON_MANSION_ROOF_HOUSE ; 14
	db "Celadon Mansion4F@"
Celadon_Map_Name15: ; map_const CELADON_POKECENTER_1F ; 15
	db "Celadon <PKMN> Center@"
Celadon_Map_Name16: ; map_const CELADON_GAME_CORNER, 16
	db "Cel. Game Corner@"
Celadon_Map_Name17: ; map_const CELADON_GAME_CORNER_PRIZE_ROOM ; 17
	db "Celadon PrizeRoom@"
Celadon_Map_Name18: ; map_const CELADON_GYM ; 18
	db "Celadon Gym@"
Celadon_Map_Name19: ; map_const CELADON_CAFE ; 19
	db "Celadon Cafe@"
Celadon_Map_Name20: ; map_const ROUTE_7_SAFFRON_GATE ; 20 
	db "Route 7 Gate@"
Celadon_Map_Name21: ; map_const ROUTE_7_SAFFRON_GATE ; 21 
	db "Cel. DecorStore 1F@" 
Celadon_Map_Name22: ; map_const ROUTE_7_SAFFRON_GATE ; 22 
	db "Cel. DecorStore 2F@" 
Celadon_Map_Name23: ; map_const ROUTE_7_SAFFRON_GATE ; 23 
	db "Cel. DecorStore 3F@" 
Celadon_Map_Name24: ; map_const ROUTE_7_SAFFRON_GATE ; 24 
	db "Cel. DecorStore 4F@" 
Celadon_Map_Name25: ; map_const CELADON_CURSE_HOUSE ; 24 
	db "Celadon House@" 

Cianwood_Map_Name1: ; map_const ROUTE_40,  1
	db "Route 40@"
Cianwood_Map_Name2: ; map_const ROUTE_41, ;  2
	db "Route 41@"
Cianwood_Map_Name3: ; map_const CIANWOOD_CITY ;  3
	db "Cianwood City@"
Cianwood_Map_Name4: ; map_const MANIAS_HOUSE ;  4
	db "Mania's House@"
Cianwood_Map_Name5: ; map_const CIANWOOD_GYM ;  5
	db "Cianwood Gym@"
Cianwood_Map_Name6: ; map_const CIANWOOD_POKECENTER_1F ;  6
	db "Cianwood <PKMN> Cen.@"
Cianwood_Map_Name7: ; map_const CIANWOOD_PHARMACY ;  7
	db "Cianwood Pharmacy@"
Cianwood_Map_Name8: ; map_const CIANWOOD_LUGIA_SPEECH_HOUSE ;  8
	db "Cianwood House@"
Cianwood_Map_Name9: ; map_const CIANWOOD_BEASTS_HOUSE ;  9
	db "Beasts House@"
Cianwood_Map_Name10: ; map_const CIANWOOD_MOVE_TUTOR_HOUSE ; 10
	db "Cianwood Tutor@"
Cianwood_Map_Name11: ; map_const BATTLE_TOWER_1F ; 11
	db "Battle Tower 1F@"
Cianwood_Map_Name12: ; map_const BATTLE_TOWER_BATTLE_ROOM ; 12
	db "Battle Tower Room@"
Cianwood_Map_Name13: ; map_const BATTLE_TOWER_ELEVATOR ; 13
	db "Battle Tower Lift@"
Cianwood_Map_Name14: ; map_const BATTLE_TOWER_HALLWAY, ; 14
	db "Battle Tower Hall@"
Cianwood_Map_Name15: ; map_const ROUTE_40_BATTLE_TOWER_GATE ; 15
	db "Route 40 Gate@"
Cianwood_Map_Name16: ; map_const BATTLE_TOWER_OUTSIDE ; 16
	db "Battle Tower@"

Viridian_Map_Name1: ; map_const ROUTE_2,;  1
	db "Route 2@"
Viridian_Map_Name2: ; map_const ROUTE_22,  2
	db "Route 22@"
Viridian_Map_Name3: ; map_const ROUTE_26,  3
	db "Route 26@"
Viridian_Map_Name4: ; map_const VIRIDIAN_CITY,  4
	db "Viridian City@"
Viridian_Map_Name5: ; map_const VIRIDIAN_GYM ;  5
	db "Viridian Gym@"
Viridian_Map_Name6: ; map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE ;  6
	db "Viridian House 2@"
Viridian_Map_Name7: ; map_const TRAINER_HOUSE_1F ;  7
	db "Viridian House 1F@"
Viridian_Map_Name8: ; map_const TRAINER_HOUSE_B1F ;  8
	db "Viridian HouseB1F@"
Viridian_Map_Name9: ; map_const VIRIDIAN_MART ;  9
	db "Viridian <POKE>Mart@"
Viridian_Map_Name10: ; map_const VIRIDIAN_POKECENTER_1F ; 10
	db "Viridian <PKMN> Cen.@"
Viridian_Map_Name11: ; map_const ROUTE_2_NUGGET_HOUSE ; 11
	db "Rt 2 Nugget House@"
Viridian_Map_Name12: ; map_const ROUTE_2_GATE ; 12
	db "Route 2 Gate@"
Viridian_Map_Name13: ; map_const ROUTE_2_VIRIDIAN_FOREST_GATE ; 13
	db "Route 2 VF Gate@"
Viridian_Map_Name14: ; map_const VIRIDIAN_FOREST_ROUTE_2_GATE ; 14
	db "VF Route 2 Gate@"
Viridian_Map_Name15: ; map_const VIRIDIAN_FOREST_HOUSE ; 15
	db "Forest House@"
Viridian_Map_Name16: ; map_const VIRIDIAN_FOREST_HOUSE_BF1 ; 16
	db "Forest House BF1@"
Viridian_Map_Name17: ; map_const VICTORY_ROAD_GATE, 17
	db "Victory Road Gate@"
Viridian_Map_Name18: ; map_const ROUTE_26_HEAL_HOUSE ; 18
	db "Route 26 House@"
Viridian_Map_Name19: ; map_const DAY_OF_WEEK_SIBLINGS_HOUSE ; 19
	db "Day Siblings House@"

New_Bark_Map_Name1: ; map_const ROUTE_27,  1
	db "Route 27@"
New_Bark_Map_Name2: ; map_const ROUTE_29, ;  2
	db "Route 29@"
New_Bark_Map_Name3: ; map_const NEW_BARK_TOWN,;  3
	db "New Bark Town@"
New_Bark_Map_Name4: ; map_const ELMS_LAB ;  4
	db "Elm's Lab@"
New_Bark_Map_Name5: ; map_const PLAYERS_HOUSE_1F ;  5
	db "Player's House 1F@"
New_Bark_Map_Name6: ; map_const PLAYERS_HOUSE_2F ;  6
	db "Player's House 2F@"
New_Bark_Map_Name7: ; map_const PLAYERS_NEIGHBORS_HOUSE ;  7
	db "New Bark House@"
New_Bark_Map_Name8: ; map_const ELMS_HOUSE ;  8
	db "Elm's House@"
New_Bark_Map_Name9: ; map_const ROUTE_27_AERIAL_ACE_HOUSE ;  9
	db "Route 27 House@"
New_Bark_Map_Name10: ; map_const ROUTE_29_ROUTE_46_GATE ; 10
	db "Route 29 Gate@"

Saffron_Map_Name1: ; map_const SAFFRON_CITY ;  1
	db "Saffron City@"
Saffron_Map_Name2: ; map_const FIGHTING_DOJO ;  2
	db "Fighting Dojo@"
Saffron_Map_Name3: ; map_const SAFFRON_GYM,  ;  3
	db "Saffron Gym@"
Saffron_Map_Name4: ; map_const SAFFRON_MART ;  4
	db "Saffron <POKE>Mart@"
Saffron_Map_Name5: ; map_const SAFFRON_POKECENTER_1F ;  5
	db "Saffron <PKMN> Center@"
Saffron_Map_Name6: ; map_const MR_PSYCHICS_HOUSE ;  6
	db "Mr.Psychics House@"
Saffron_Map_Name7: ; map_const SAFFRON_MAGNET_TRAIN_STATION,;  7
	db "Saffron Station@"
Saffron_Map_Name8: ; map_const SILPH_CO_1F ;  8
	db "Silph Co.@"
Saffron_Map_Name9: ; map_const COPYCATS_HOUSE_1F ;  9
	db "Copycat House 1F@"
Saffron_Map_Name10: ; map_const COPYCATS_HOUSE_2F ; 10
	db "Copycat House 2F@"
Saffron_Map_Name11: ; map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE ; 11
	db "Route 5 Undergrnd@"
Saffron_Map_Name12: ; map_const ROUTE_5_SAFFRON_GATE ; 12
	db "Route 5 Gate@"
Saffron_Map_Name13: ; map_const ROUTE_5_CLEANSE_TAG_HOUSE ; 13
	db "Route 5 House@"
Saffron_Map_Name14: ; map_const SAFFRON_AVICULTURAL_SOCIETY_1F ; 13
	db "Avicultural Soc.1F@"
Saffron_Map_Name15: ; map_const SAFFRON_AVICULTURAL_SOCIETY_2F ; 13
	db "Avicultural Soc.2F@"
Saffron_Map_Name16: ; map_const SAFFRON_AVICULTURAL_SOCIETY_3F ; 13
	db "Avicultural Soc.3F@"
Saffron_Map_Name17: ; map_const SAFFRON_ODDISH_DOLL_HOUSE ; 13
	db "Saffron House@"

Cherrygrove_Map_Name1: ; map_const ROUTE_30         ;  1
	db "Route 30@"
Cherrygrove_Map_Name2: ; map_const ROUTE_31         ;  2
	db "Route 31@"
Cherrygrove_Map_Name3: ; map_const CHERRYGROVE_CITY ;  3
	db "Cherrygrove City@"
Cherrygrove_Map_Name4: ; map_const CHERRYGROVE_MART ;  4
	db "Cherrygrove Mart@"
Cherrygrove_Map_Name5: ; map_const CHERRYGROVE_POKECENTER_1F ;  5
	db "Cherry. <PKMN> Center@"
Cherrygrove_Map_Name6: ; map_const CHERRYGROVE_GYM_SPEECH_HOUSE ;  6
	db "Cherryg. House 1@"
Cherrygrove_Map_Name7: ; map_const GUIDE_GENTS_HOUSE ;  7
	db "Guide Gent House@"
Cherrygrove_Map_Name8: ; map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE ;  8
	db "Cherryg. House 2@"
Cherrygrove_Map_Name9: ; map_const ROUTE_30_BERRY_HOUSE ;  9
	db "Route 30 House@"
Cherrygrove_Map_Name10: ; map_const MR_POKEMONS_HOUSE ; 10
	db "Mr. #mon House@"
Cherrygrove_Map_Name11: ; map_const ROUTE_31_VIOLET_GATE ; 11
	db "Route 31 Gate@"
	
Safari_Map_Name1: ; map_const SAFARI_ZONE_HUB         ;  1
	db "Safari Zone Hub@"
Safari_Map_Name2: ; map_const SAFARI_ZONE_EAST         ;  2
	db "Safari Zone East@"
Safari_Map_Name3: ; map_const SAFARI_ZONE_NORTH ;  3
	db "Safari Zone North@"
Safari_Map_Name4: ; map_const SAFARI_ZONE_WEST ;  4
	db "Safari Zone West@"
Safari_Map_Name5: ; map_const SAFARI_ZONE_HUB_REST_HOUSE ;  5
	db "Hub Rest House@"
Safari_Map_Name6: ; map_const SAFARI_ZONE_EAST_REST_HOUSE ;  6
	db "East Rest House@"
Safari_Map_Name7: ; map_const SAFARI_ZONE_NORTH_REST_HOUSE ;  7
	db "North Rest House@"
Safari_Map_Name8: ; map_const SAFARI_ZONE_WEST_REST_HOUSE_1 ;  8
	db "West Rest House 1@"
Safari_Map_Name9: ; map_const SAFARI_ZONE_WEST_REST_HOUSE_2 ;  9
	db "West Rest House 2@"