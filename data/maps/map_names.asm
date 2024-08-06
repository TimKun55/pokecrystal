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
	dw Mahogany_Map_Name9 ; map_const MAHOGANY_BAKERY            			;  9
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
	dw Dungeons_Map_Name77 ; map_const MT_SILVER_ROOM_4,                    ; 77
	dw Dungeons_Map_Name78 ; map_const MT_SILVER_ITEM_ROOMS,                ; 78
	dw Dungeons_Map_Name79 ; map_const DARK_CAVE_VIOLET_ENTRANCE            ; 79
	dw Dungeons_Map_Name80 ; map_const DARK_CAVE_BLACKTHORN_ENTRANCE        ; 80
	dw Dungeons_Map_Name81 ; map_const DRAGONS_DEN_1F 						; 81
	dw Dungeons_Map_Name82 ; map_const DRAGONS_DEN_B1F                      ; 82
	dw Dungeons_Map_Name83 ; map_const DRAGON_SHRINE 						; 83
	dw Dungeons_Map_Name84 ; map_const TOHJO_FALLS                          ; 84
	dw Dungeons_Map_Name85 ; map_const DIGLETTS_CAVE                        ; 85
	dw Dungeons_Map_Name86 ; map_const VIRIDIAN_FOREST						; 86
	dw Dungeons_Map_Name87 ; map_const MOUNT_MOON                           ; 87
	dw Dungeons_Map_Name88 ; map_const UNDERGROUND_PATH                     ; 88
	dw Dungeons_Map_Name89 ; map_const ROCK_TUNNEL_1F 	                    ; 89
	dw Dungeons_Map_Name90 ; map_const ROCK_TUNNEL_B1F  	                ; 90
	dw Dungeons_Map_Name91 ; map_const VICTORY_ROAD_1F						; 91
	dw Dungeons_Map_Name92 ; map_const VICTORY_ROAD_2F						; 92
	dw Dungeons_Map_Name93 ; map_const VICTORY_ROAD_3F						; 93
	dw Dungeons_Map_Name94 ; map_const UNDERGROUND_ROOM						; 94
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
	dw Ecruteak_Map_Name15 ; map_const BELLCHIME_TRAIL						; 15
	dw Ecruteak_Map_Name16 ; map_const ROUTE_35_GOLDENROD_GATE				; 16
	dw Ecruteak_Map_Name17 ; map_const ROUTE_35_NATIONAL_PARK_GATE			; 17
	dw Ecruteak_Map_Name18 ; map_const ROUTE_36_NATIONAL_PARK_GATE			; 18
	assert_table_length NUM_ECRUTEAK_MAPS

Blackthorn_Map_Names: ;newgroup BLACKTHORN									;  5
	table_width 2, Blackthorn_Map_Names
	dw Blackthorn_Map_Name1 ; map_const BLACKTHORN_GYM_1F 					;  1
	dw Blackthorn_Map_Name2 ; map_const BLACKTHORN_GYM_2F 					;  2
	dw Blackthorn_Map_Name3 ; map_const BLACKTHORN_DRAGON_SPEECH_HOUSE 		;  3
	dw Blackthorn_Map_Name4 ; map_const BLACKTHORN_EMYS_HOUSE 				;  4
	dw Blackthorn_Map_Name5 ; map_const BLACKTHORN_MART 					;  5
	dw Blackthorn_Map_Name6 ; map_const BLACKTHORN_POKECENTER_1F 			;  6
	dw Blackthorn_Map_Name7 ; map_const ROUTE_45							;  8
	dw Blackthorn_Map_Name8 ; map_const ROUTE_46							;  9
	dw Blackthorn_Map_Name9 ; map_const BLACKTHORN_CITY						; 10
	dw Blackthorn_Map_Name10 ; map_const BLACKTHORN_MOVE_TUTOR_HOUSE		; 11		
	dw Blackthorn_Map_Name11 ; map_const MADAM_ITEMS_HOUSE					; 12
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
	dw Cinnabar_Map_Name9 ; map_const CINNABAR_GYM							;  9
	dw Cinnabar_Map_Name10 ; map_const CINNABAR_VOLCANO_B1F					; 10
	dw Cinnabar_Map_Name11 ; map_const CINNABAR_MOLTRES_NEST				; 11
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
	dw Goldenrod_Map_Name28 ; map_const GOLDENROD_TOY_STORE					; 28
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
	dw Fuchsia_Map_Name20 ; map_const ROUTE_13_ZAPDOS_NEST					; 20
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
	assert_table_length NUM_SAFFRON_MAPS

	; CHERRYGROVE, 26
Cherrygrove_Map_Names:
	table_width 2, Cherrygrove_Map_Names
	dw Cherrygrove_Map_Name1 ; map_const ROUTE_30         ;  1
	dw Cherrygrove_Map_Name2 ; map_const ROUTE_31         ;  2
	dw Cherrygrove_Map_Name3 ; map_const CHERRYGROVE_CITY ;  3
	dw Cherrygrove_Map_Name4 ; map_const CHERRYGROVE_MART ;  4
	dw Cherrygrove_Map_Name5 ; map_const CHERRYGROVE_POKECENTER_1F ;  5
	dw Cherrygrove_Map_Name6 ; map_const CHERRYGROVE_GYM_SPEECH_HOUSE ;  6
	dw Cherrygrove_Map_Name7 ; map_const GUIDE_GENTS_HOUSE ;  7
	dw Cherrygrove_Map_Name8 ; map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE ;  8
	dw Cherrygrove_Map_Name9 ; map_const ROUTE_30_BERRY_HOUSE ;  9
	dw Cherrygrove_Map_Name10 ; map_const MR_POKEMONS_HOUSE ; 10
	dw Cherrygrove_Map_Name11 ; map_const ROUTE_31_VIOLET_GATE ; 11
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
	db "OLIVINE¯", $E1, $E2, " CENTER@"
Olivine_Map_Name2: ; map_const OLIVINE_GYM 								;  2
	db "OLIVINE¯GYM@"
Olivine_Map_Name3: ; map_const OLIVINE_TIMS_HOUSE 						;  3
	db "TIM'S HOUSE@"
Olivine_Map_Name4: ; map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE 			;  4
	db "OLIVINE¯HOUSE@"
Olivine_Map_Name5: ; map_const OLIVINE_GOOD_ROD_HOUSE 					;  5
	db "OLIVINE¯HOUSE 1@"
Olivine_Map_Name6: ; map_const OLIVINE_CAFE 							;  6
	db "OLIVINE¯CAFE@"
Olivine_Map_Name7: ; map_const OLIVINE_MART 							;  7
	db "OLIVINE ", $70, $71, "MART@"
Olivine_Map_Name8: ; map_const ROUTE_38_ECRUTEAK_GATE 					;  8
	db "ROUTE 38 GATE@"
Olivine_Map_Name9: ; map_const ROUTE_39_BARN 							;  9
	db "ROUTE 39 BARN@"
Olivine_Map_Name10: ; map_const ROUTE_39_FARMHOUSE 						; 10
	db "ROUTE 39 HOUSE@"
Olivine_Map_Name11: ; map_const ROUTE_38  								; 11
	db "ROUTE 38@"
Olivine_Map_Name12: ; map_const ROUTE_39  								; 12
	db "ROUTE 39@"
Olivine_Map_Name13: ; map_const OLIVINE_CITY 							; 13
	db "OLIVINE¯CITY@"

Mahogany_Map_Name1: ; map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE ;  1
	db "MAHOGANY¯HOUSE@"
Mahogany_Map_Name2: ; map_const MAHOGANY_GYM ;  2
	db "MAHOGANY¯GYM@"
Mahogany_Map_Name3: ; map_const MAHOGANY_POKECENTER_1F ;  3
	db "MAHOGANY¯PC@"
Mahogany_Map_Name4: ; map_const ROUTE_42_ECRUTEAK_GATE ;  4
	db "ROUTE 42 GATE@"
Mahogany_Map_Name5: ; map_const ROUTE_42,  ;  5
	db "ROUTE 42@"
Mahogany_Map_Name6: ; map_const ROUTE_44, ;  6
	db "ROUTE 44@"
Mahogany_Map_Name7: ; map_const MAHOGANY_TOWN,  ;  7
	db "MAHOGANY¯TOWN@" 
Mahogany_Map_Name8: ; map_const MAHOGANY_MOVE_TUTOR_HOUSE,  ;  8
	db "MAHOGANY¯HOUSE@" 
Mahogany_Map_Name9: ; map_const MAHOGANY_MOVE_TUTOR_HOUSE,  ;  9
	db "MAHOGANY¯HOUSE@" 
	
Dungeons_Map_Name1: ; map_const SPROUT_TOWER_1F, ;  1
	db "SPROUT TOWER 1F@"
Dungeons_Map_Name2: ; map_const SPROUT_TOWER_2F, ;  2
	db "SPROUT TOWER 2F@"
Dungeons_Map_Name3: ; map_const SPROUT_TOWER_3F, ;  3
	db "SPROUT TOWER 3F@"
Dungeons_Map_Name4: ; map_const TIN_TOWER_1F,  ;  4
	db "TIN TOWER 1F@"
Dungeons_Map_Name5: ; map_const TIN_TOWER_2F,;  5
	db "TIN TOWER 2F@"
Dungeons_Map_Name6: ; map_const TIN_TOWER_3F,;  6
	db "TIN TOWER 3F@"
Dungeons_Map_Name7: ; map_const TIN_TOWER_4F,;  7
	db "TIN TOWER 4F@"
Dungeons_Map_Name8: ; map_const TIN_TOWER_5F, ;  8
	db "TIN TOWER 5F@"
Dungeons_Map_Name9: ; map_const TIN_TOWER_6F, ;  9
	db "TIN TOWER 6F@"
Dungeons_Map_Name10: ; map_const TIN_TOWER_7F, ; 10
	db "TIN TOWER 7F@"
Dungeons_Map_Name11: ; map_const TIN_TOWER_8F,; 11
	db "TIN TOWER 8F@"
Dungeons_Map_Name12: ; map_const TIN_TOWER_9F,  ; 12
	db "TIN TOWER 9F@"
Dungeons_Map_Name13: ; map_const BURNED_TOWER_1F, ; 13
	db "BURNED TOWER 1F@"
Dungeons_Map_Name14: ; map_const BURNED_TOWER_B1F, ; 14
	db "BURNED TOWER B1F@"
Dungeons_Map_Name15: ; map_const NATIONAL_PARK, ; 15
	db "NATIONAL¯PARK@"
Dungeons_Map_Name16: ; map_const NATIONAL_PARK_BUG_CONTEST,; 16
	db "BUG CONTEST@"
Dungeons_Map_Name17: ; map_const RADIO_TOWER_1F ; 17
	db "RADIO TOWER 1F@"
Dungeons_Map_Name18: ; map_const RADIO_TOWER_2F ; 18
	db "RADIO TOWER 2F@"
Dungeons_Map_Name19: ; map_const RADIO_TOWER_3F ; 19
	db "RADIO TOWER 3F@"
Dungeons_Map_Name20: ; map_const RADIO_TOWER_4F ; 20
	db "RADIO TOWER 4F@"
Dungeons_Map_Name21: ; map_const RADIO_TOWER_5F ; 21
	db "RADIO TOWER 5F@"
Dungeons_Map_Name22: ; map_const RUINS_OF_ALPH_OUTSIDE, ; 22
	db "RUINS OF ALPH@"
Dungeons_Map_Name23: ; map_const RUINS_OF_ALPH_HO_OH_CHAMBER ; 23
	db "HO¯OH CHAMBER@"
Dungeons_Map_Name24: ; map_const RUINS_OF_ALPH_KABUTO_CHAMBER ; 24
	db "KABUTO CHAMBER@"
Dungeons_Map_Name25: ; map_const RUINS_OF_ALPH_OMANYTE_CHAMBER ; 25
	db "OMANYTE CHAMBER@"
Dungeons_Map_Name26: ; map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER ; 26
	db "AERO CHAMBER@"
Dungeons_Map_Name27: ; map_const RUINS_OF_ALPH_INNER_CHAMBE ; 27
	db "RUINS CHAMBER@"
Dungeons_Map_Name28: ; map_const RUINS_OF_ALPH_RESEARCH_CENTER ; 28
	db "RUINS LAB@"
Dungeons_Map_Name29: ; map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM ; 29
	db "HO¯OH PRIZE ROOM@"
Dungeons_Map_Name30: ; map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM ; 30
	db "KABUTO PRIZE ROOM@"
Dungeons_Map_Name31: ; map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM ; 31
	db "OMANYTE PRIZEROOM@"
Dungeons_Map_Name32: ; map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM ; 32
	db "AERO PRIZE ROOM@"
Dungeons_Map_Name33: ; map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM,; 33
	db "HO¯OH WORD ROOM@"
Dungeons_Map_Name34: ; map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM,; 34
	db "KABUTO WORD ROOM@"
Dungeons_Map_Name35: ; map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM,; 35
	db "OMANYTE WORD ROOM@"
Dungeons_Map_Name36: ; map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,; 36
	db "AERO WORD ROOM@"
Dungeons_Map_Name37: ; map_const UNION_CAVE_1F,; 37
	db "UNION CAVE 1F@"
Dungeons_Map_Name38: ; map_const UNION_CAVE_B1F,; 38
	db "UNION CAVE B1F@"
Dungeons_Map_Name39: ; map_const UNION_CAVE_B2F,; 39
	db "UNION CAVE B2F@"
Dungeons_Map_Name40: ; map_const SLOWPOKE_WELL_B1F,; 40
	db "SLOWPOKEWELL B1@"
Dungeons_Map_Name41: ; map_const SLOWPOKE_WELL_B2F,; 41
	db "SLOWPOKEWELL B2@"
Dungeons_Map_Name42: ; map_const OLIVINE_LIGHTHOUSE_1F,; 42
	db "LIGHTHOUSE 1F@"
Dungeons_Map_Name43: ; map_const OLIVINE_LIGHTHOUSE_2F,; 43
	db "LIGHTHOUSE 2F@"
Dungeons_Map_Name44: ; map_const OLIVINE_LIGHTHOUSE_3F,; 44
	db "LIGHTHOUSE 3F@"
Dungeons_Map_Name45: ; map_const OLIVINE_LIGHTHOUSE_4F,; 45
	db "LIGHTHOUSE 4F@"
Dungeons_Map_Name46: ; map_const OLIVINE_LIGHTHOUSE_5F,; 46
	db "LIGHTHOUSE 5F@"
Dungeons_Map_Name47: ; map_const OLIVINE_LIGHTHOUSE_6F,; 47
	db "LIGHTHOUSE 6F@"
Dungeons_Map_Name48: ; map_const MAHOGANY_MART_1F ; 48
	db "MAHOGANY ", $70, $71, "MART@"
Dungeons_Map_Name49: ; map_const TEAM_ROCKET_BASE_B1F,; 49
	db "ROCKET BASE B1F@"
Dungeons_Map_Name50: ; map_const TEAM_ROCKET_BASE_B2F,; 50
	db "ROCKET BASE B2F@"
Dungeons_Map_Name51: ; map_const TEAM_ROCKET_BASE_B3F,; 51
	db "ROCKET BASE B3F@"
Dungeons_Map_Name52: ; map_const ILEX_FOREST,; 52
	db "ILEX FOREST@"
Dungeons_Map_Name53: ; map_const GOLDENROD_UNDERGROUND,; 53
	db "GOLD. UNDERGROUND@"
Dungeons_Map_Name54: ; map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES,; 54
	db "GOLD. SWITCH ROOM@"
Dungeons_Map_Name55: ; map_const GOLDENROD_DEPT_STORE_B1F,; 55
	db "GOLD. DEPT B1F@"
Dungeons_Map_Name56: ; map_const GOLDENROD_UNDERGROUND_WAREHOUSE,; 56
	db "GOLD. DEPT B1F@"
Dungeons_Map_Name57: ; map_const MOUNT_MORTAR_1F_OUTSIDE,; 57
	db "MT. MORTAR@"
Dungeons_Map_Name58: ; map_const MOUNT_MORTAR_1F_INSIDE,; 58
	db "MT. MORTAR 1F@"
Dungeons_Map_Name59: ; map_const MOUNT_MORTAR_2F_INSIDE,; 59
	db "MT. MORTAR 2F@"
Dungeons_Map_Name60: ; map_const MOUNT_MORTAR_B1F,; 60
	db "MT. MORTAR B1F@"
Dungeons_Map_Name61: ; map_const ICE_PATH_1F,; 61
	db "ICE PATH 1F@"
Dungeons_Map_Name62: ; map_const ICE_PATH_B1F,; 62
	db "ICE PATH B1F@"
Dungeons_Map_Name63: ; map_const ICE_PATH_B2F_MAHOGANY_SIDE,; 63
	db "ICE PATH B2F W@"
Dungeons_Map_Name64: ; map_const ICE_PATH_B2F_BLACKTHORN_SIDE ; 64
	db "ICE PATH B2F E@"
Dungeons_Map_Name65: ; map_const ICE_PATH_B3F,; 65
	db "ICE PATH B3F@"
Dungeons_Map_Name66: ; map_const WHIRL_ISLAND_NW ; 66
	db "WHIRL¯ISL NW@"
Dungeons_Map_Name67: ; map_const WHIRL_ISLAND_NE,; 67
	db "WHIRL¯ISL NE@"
Dungeons_Map_Name68: ; map_const WHIRL_ISLAND_SW,; 68
	db "WHIRL¯ISL SW@"
Dungeons_Map_Name69: ; map_const WHIRL_ISLAND_CAVE ; 69
	db "WHIRL¯ISL CAVE@"
Dungeons_Map_Name70: ; map_const WHIRL_ISLAND_SE ; 70
	db "WHIRL¯ISL SE@"
Dungeons_Map_Name71: ; map_const WHIRL_ISLAND_B1F,; 71
	db "WHIRL¯ISL B1F@"
Dungeons_Map_Name72: ; map_const WHIRL_ISLAND_B2F,; 72
	db "WHIRL¯ISL B2F@"
Dungeons_Map_Name73: ; map_const WHIRL_ISLAND_LUGIA_CHAMBER,; 73
	db "WHIRL¯ISL DEEP@"
Dungeons_Map_Name74: ; map_const MT_SILVER_ROOM_1,; 74
	db "MT. SILVER R1@"
Dungeons_Map_Name75: ; map_const MT_SILVER_ROOM_2,; 75
	db "MT. SILVER R2@"
Dungeons_Map_Name76: ; map_const MT_SILVER_PEAK,; 76
	db "MT. SILVER PEAK@"
Dungeons_Map_Name77: ; map_const MT_SILVER_ROOM_4,; 76
	db "MT. SILVER R4@"
Dungeons_Map_Name78: ; map_const MT_SILVER_ITEM_ROOMS,; 77
	db "MT. SILVER ROOM@"	
Dungeons_Map_Name79: ; map_const DARK_CAVE_VIOLET_ENTRANCE,; 78
	db "DARK CAVE WEST@"
Dungeons_Map_Name80: ; map_const DARK_CAVE_BLACKTHORN_ENTRANCE,; 79
	db "DARK CAVE EAST@"
Dungeons_Map_Name81: ; map_const DRAGONS_DEN_1F ; 80
	db "DRAGONS¯DEN 1F@"
Dungeons_Map_Name82: ; map_const DRAGONS_DEN_B1F,; 81
	db "DRAGONS¯DEN B1@"
Dungeons_Map_Name83: ; map_const DRAGON_SHRINE ; 82
	db "DRAGON SHRINE@"
Dungeons_Map_Name84: ; map_const TOHJO_FALLS,; 83
	db "TOHJO FALLS@"
Dungeons_Map_Name85: ; map_const DIGLETTS_CAVE,; 84
	db "DIGLETTS¯CAVE@"
Dungeons_Map_Name86: ; map_const VIRIDIAN_FOREST,; 85
	db "VIRIDIAN¯FOREST@"	
Dungeons_Map_Name87: ; map_const MOUNT_MOON,; 86
	db "MT. MOON@"
Dungeons_Map_Name88: ; map_const UNDERGROUND_PATH,; 87
	db "UNDERGROUND PATH@"
Dungeons_Map_Name89: ; map_const ROCK_TUNNEL_1F,; 88
	db "ROCK TUNNEL 1F@"
Dungeons_Map_Name90: ; map_const ROCK_TUNNEL_B1F,; 89
	db "ROCK TUNNEL B1F@"
Dungeons_Map_Name91: ; map_const VICTORY_ROAD_1F,;  90
	db "VICTORY¯ROAD 1F@"
Dungeons_Map_Name92: ; map_const VICTORY_ROAD_1F,;  90
	db "VICTORY¯ROAD 2F@"
Dungeons_Map_Name93: ; map_const VICTORY_ROAD_1F,;  90
	db "VICTORY¯ROAD 3F@"
Dungeons_Map_Name94: ; map_const VICTORY_ROAD_1F,;  90
	db "UNDERGROUND ROOM@"

Ecruteak_Map_Name1: ; map_const ROUTE_35,;  1
	db "ROUTE 35@"
Ecruteak_Map_Name2: ; map_const ROUTE 36,;  1
	db "ROUTE 36@"
Ecruteak_Map_Name3: ; map_const ROUTE 37,;  1
	db "ROUTE 37@"
Ecruteak_Map_Name4: ; map_const ECRUTEAK_TIN_TOWER_ENTRANCE,;  1
	db "TIN TOWER PATH@"
Ecruteak_Map_Name5: ; map_const WISE_TRIOS_ROOM ;  2
	db "WISE TRIO ROOM@"
Ecruteak_Map_Name6: ; map_const ECRUTEAK_POKECENTER_1F ;  3
	db "ECRUTEAK ", $E1, $E2, "CENTER@"
Ecruteak_Map_Name7: ; map_const ECRUTEAK_LUGIA_SPEECH_HOUSE ;  4
	db "ECRUTEAK¯HOUSE 1@"
Ecruteak_Map_Name8: ; map_const DANCE_THEATRE ;  5
	db "DANCE THEATER@"
Ecruteak_Map_Name9: ; map_const ECRUTEAK_MART ;  6
	db "ECRUTEAK ", $70, $71, "MART@"
Ecruteak_Map_Name10: ; map_const ECRUTEAK_GYM ;  7
	db "ECRUTEAK¯GYM@"
Ecruteak_Map_Name11: ; map_const ECRUTEAK_ITEMFINDER_HOUSE ;  8
	db "ITEMFINDER¯HOUSE@"
Ecruteak_Map_Name12: ; map_const ECRUTEAK_CITY,;  9
	db "ECRUTEAK¯CITY@"
Ecruteak_Map_Name13: ; map_const ECRUTEAK_FAIRY_FAMILY_HOUSE,; 10
	db "FAIRY¯HOUSE@"
Ecruteak_Map_Name14: ; map_const ECRUTEAK_SWARM_HOUSE,; 10
	db "SWARM¯HOUSE@"	
Ecruteak_Map_Name15: ; map_const BELLCHIME_TRAIL,; 10
	db "BELLCHIME¯TRAIL@"
Ecruteak_Map_Name16: ; map_const ROUTE_35_GOLDENROD_GATE ; 14
	db "ROUTE 35 GATE 2@"
Ecruteak_Map_Name17: ; map_const ROUTE_35_NATIONAL_PARK_GATE ; 15
	db "ROUTE 35 GATE 3@"
Ecruteak_Map_Name18: ; map_const ROUTE_36_NATIONAL_PARK_GATE ; 17                                        ; 11
	db "ROUTE 36 GATE 2@"

Blackthorn_Map_Name1: ; map_const BLACKTHORN_GYM_1F ;  1
	db "BLACKTHORN¯GYM@"
Blackthorn_Map_Name2: ; map_const BLACKTHORN_GYM_2F ;  2
	db "BLACKTHORN¯GYM B1@"
Blackthorn_Map_Name3: ; map_const BLACKTHORN_DRAGON_SPEECH_HOUSE ;  3
	db "DRAGON HOUSE@"
Blackthorn_Map_Name4: ; map_const BLACKTHORN_EMYS_HOUSE ;  4
	db "EMY'S HOUSE@"
Blackthorn_Map_Name5: ; map_const BLACKTHORN_MART ;  5
	db "BLACKTHORN ", $70, $71, "MART@"
Blackthorn_Map_Name6: ; map_const BLACKTHORN_POKECENTER_1F ;  6
	db "BLACKTHORN ", $E1, $E2, "CEN.@"
Blackthorn_Map_Name7: ; map_const ROUTE_45,;  7
	db "ROUTE 45@"
Blackthorn_Map_Name8: ; map_const ROUTE_46,;  8
	db "ROUTE 46@"
Blackthorn_Map_Name9: ; map_const BLACKTHORN_CITY,;  9
	db "BLACKTHORN¯CITY@"
Blackthorn_Map_Name10: ; map_const BLACKTHORN_MOVE_TUTOR_HOUSE,; 10
	db "BLACKTHORN¯HOUSE@"	
Blackthorn_Map_Name11: ; map_const MADAM_ITEMS_HOUSE,; 10
	db "MADAM¯ITEMS@"	

Cinnabar_Map_Name1: ; map_const CINNABAR_POKECENTER_1F ;  1
	db "CINNABAR ", $E1, $E2, "CENTER@"
Cinnabar_Map_Name2: ; map_const ROUTE_19_FUCHSIA_GATE ;  2
	db "ROUTE 19 GATE@"
Cinnabar_Map_Name3: ; map_const ROUTE_19, ;  3
	db "ROUTE 19@"
Cinnabar_Map_Name4: ; map_const ROUTE_20,;  4
	db "ROUTE 20@"
Cinnabar_Map_Name5: ; map_const ROUTE_21,;  5
	db "ROUTE 21@"
Cinnabar_Map_Name6: ; map_const CINNABAR_ISLAND,;  6
	db "CINNABAR¯ISLAND@"
Cinnabar_Map_Name7: ; map_const CINNABAR_VOLCANO_1F,;  7
	db "CINNABAR¯VOL 1F@"
Cinnabar_Map_Name8: ; map_const CINNABAR_VOLCANO_2F,;  8
	db "CINNABAR¯VOL 2F@"
Cinnabar_Map_Name9: ; map_const CINNABAR_GYM,;   9
	db "CINNABAR¯GYM@"
Cinnabar_Map_Name10: ; map_const CINNABAR_VOLCANO_B1F,;  10
	db "CINNABAR¯VOL B1F@"
Cinnabar_Map_Name11: ; map_const CINNABAR_MOLTRES_NEST,;  11
	db "MOLTRES¯NEST@"

Cerulean_Map_Name1: ; map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE ;  1
	db "CERULEAN¯HOUSE 1@"
Cerulean_Map_Name2: ; map_const CERULEAN_POLICE_STATION ;  2
	db "POLICE STATION@"
Cerulean_Map_Name3: ; map_const CERULEAN_TRADE_SPEECH_HOUSE ;  3
	db "CERULEAN¯HOUSE 2@"
Cerulean_Map_Name4: ; map_const CERULEAN_POKECENTER_1F ;  4
	db "CERULEAN ", $E1, $E2, "CENTER@"
Cerulean_Map_Name5: ; map_const CERULEAN_GYM ;  5
	db "CERULEAN¯GYM@"
Cerulean_Map_Name6: ; map_const CERULEAN_MART ;  6
	db "CERULEAN ", $70, $71, "MART@"
Cerulean_Map_Name7: ; map_const ROUTE_10_POKECENTER_1F ;  7
	db "ROUTE 10 ", $E1, $E2, "CENTER@"
Cerulean_Map_Name8: ; map_const POWER_PLANT,; 8
	db "POWER PLANT@"
Cerulean_Map_Name9: ; map_const BILLS_HOUSE ; 9
	db "BILL'S HOUSE@"
Cerulean_Map_Name10: ; map_const ROUTE_4,; 10
	db "ROUTE 4@"
Cerulean_Map_Name11: ; map_const ROUTE_5,; 11
	db "ROUTE 5@"
Cerulean_Map_Name12: ; map_const ROUTE_9,; 12
	db "ROUTE 9@"
Cerulean_Map_Name13: ; map_const ROUTE_10_NORTH,; 13
	db "ROUTE 10 NORTH@"
Cerulean_Map_Name14: ; map_const ROUTE_24,; 14
	db "ROUTE 24@"
Cerulean_Map_Name15: ; map_const ROUTE_25,; 15
	db "ROUTE 25@"
Cerulean_Map_Name16: ; map_const CERULEAN_CITY,;  16
	db "CERULEAN¯CITY@"
Cerulean_Map_Name17: ; map_const ROUTE_4_ZAPDOS_NEST,;  16
	db "ZAPDOS¯NEST@"

Azalea_Map_Name1: ; map_const AZALEA_POKECENTER_1F ;  1
	db "AZALEA ", $E1, $E2, "CENTER@"
Azalea_Map_Name2: ; map_const CHARCOAL_KILN ;  2
	db "CHARCOAL KILN@"
Azalea_Map_Name3: ; map_const AZALEA_MART ;  3
	db "AZALEA ", $70, $71, "MART@"
Azalea_Map_Name4: ; map_const KURTS_HOUSE ;  4
	db "KURT'S HOUSE@"
Azalea_Map_Name5: ; map_const AZALEA_GYM ;  5
	db "AZALEA GYM@"
Azalea_Map_Name6: ; map_const ROUTE_33, ;  6
	db "ROUTE 33@"
Azalea_Map_Name7: ; map_const AZALEA_TOWN, ; 7
	db "AZALEA TOWN@"

Lake_of_Rage_Map_Name1: ; map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE ;  1
	db "HIDDEN¯POWER¯HS@"
Lake_of_Rage_Map_Name2: ; map_const LAKE_OF_RAGE_MAGIKARP_HOUSE ;  2
	db "MAGIKARP¯HOUSE@"
Lake_of_Rage_Map_Name3: ; map_const ROUTE_43_MAHOGANY_GATE ;  3
	db "RT 43 GATE 1@"
Lake_of_Rage_Map_Name4: ; map_const ROUTE_43_GATE ;  4
	db "RT 43 GATE 2@"
Lake_of_Rage_Map_Name5: ; map_const ROUTE_43 ;  5
	db "ROUTE 43@"
Lake_of_Rage_Map_Name6: ; map_const LAKE_OF_RAGE ; 6
	db "LAKE OF¯RAGE@"                                             ; 10

Violet_Map_Name1: ; map_const ROUTE_32,;  1
	db "ROUTE 32@"
Violet_Map_Name2: ; map_const VIOLET_CITY,;  5
	db "VIOLET CITY@"
Violet_Map_Name3: ; map_const VIOLET_MART ;  6
	db "VIOLET ", $70, $71, "MART@"
Violet_Map_Name4: ; map_const VIOLET_GYM ;  7
	db "VIOLET GYM@"
Violet_Map_Name5: ; map_const EARLS_POKEMON_ACADEMY ;  8
	db "EARL'S ACADEMY@"
Violet_Map_Name6: ; map_const VIOLET_NICKNAME_SPEECH_HOUSE ;  9
	db "VIOLET HOUSE 1@"
Violet_Map_Name7: ; map_const VIOLET_POKECENTER_1F ; 10
	db "VIOLET ", $E1, $E2, "CENTER@"
Violet_Map_Name8: ; map_const VIOLET_KYLES_HOUSE ; 11
	db "KYLE'S HOUSE@"
Violet_Map_Name9: ; map_const VIOLET_PRIMOS_HOUSE ; 11
	db "PRIMO'S HOUSE@"
Violet_Map_Name10: ; map_const ROUTE_32_RUINS_OF_ALPH_GATE ; 12
	db "ROUTE 32 GATE 1@"
Violet_Map_Name11: ; map_const ROUTE_32_POKECENTER_1F ; 13
	db "ROUTE 32 ", $E1, $E2, "CENTER@"
Violet_Map_Name12: ; map_const ROUTE_36_RUINS_OF_ALPH_GATE ; 16
	db "ROUTE 36 GATE 2@"
Violet_Map_Name13: ; map_const ROUTE_36_VIOLET_GATE ; 16
	db "ROUTE 36 GATE 1@"

Goldenrod_Map_Name1: ; map_const ROUTE_34,;  1
	db "ROUTE 34@"
Goldenrod_Map_Name2: ; map_const GOLDENROD_CITY;  2
	db "GOLDENROD¯CITY@"
Goldenrod_Map_Name3: ; map_const GOLDENROD_GYM,;  3
	db "GOLDENROD¯GYM@"
Goldenrod_Map_Name4: ; map_const GOLDENROD_BIKE_SHOP ;  4
	db "GOLD. BIKE SHOP@"
Goldenrod_Map_Name5: ; map_const GOLDENROD_HAPPINESS_RATER ;  5
	db "HAPPINESS¯RATER@"
Goldenrod_Map_Name6: ; map_const BILLS_FAMILYS_HOUSE ;  6
	db "BILL'S FAM. HOUSE@"
Goldenrod_Map_Name7: ; map_const GOLDENROD_MAGNET_TRAIN_STATION,;  7
	db "TRAIN STATION 1@"
Goldenrod_Map_Name8: ; map_const GOLDENROD_FLOWER_SHOP ;  8
	db "FLOWER SHOP@"
Goldenrod_Map_Name9: ; map_const GOLDENROD_PP_SPEECH_HOUSE ;  9
	db "GOLDENROD HOUSE 1"
Goldenrod_Map_Name10: ; map_const GOLDENROD_NAME_RATER ; 10
	db "GOLD. NAME RATER@"
Goldenrod_Map_Name11: ; map_const GOLDENROD_DEPT_STORE_1F ; 11
	db "GOLD.DEPTSTORE 1F@"
Goldenrod_Map_Name12: ; map_const GOLDENROD_DEPT_STORE_2F ; 12
	db "GOLD.DEPTSTORE 2F@"
Goldenrod_Map_Name13: ; map_const GOLDENROD_DEPT_STORE_3F ; 13
	db "GOLD.DEPTSTORE 3F@"
Goldenrod_Map_Name14: ; map_const GOLDENROD_DEPT_STORE_4F ; 14
	db "GOLD.DEPTSTORE 4F@"
Goldenrod_Map_Name15: ; map_const GOLDENROD_DEPT_STORE_5F ; 15
	db "GOLD.DEPTSTORE 5F@"
Goldenrod_Map_Name16: ; map_const GOLDENROD_DEPT_STORE_6F ; 16
	db "GOLD.DEPTSTORE 6F@"
Goldenrod_Map_Name17: ; map_const GOLDENROD_DEPT_STORE_ELEVATOR ; 17
	db "GOLD. DEPT LIFT@"
Goldenrod_Map_Name18: ; map_const GOLDENROD_DEPT_STORE_ROOF ; 18
	db "GOLD. DEPT ROOF@"
Goldenrod_Map_Name19: ; map_const GOLDENROD_GAME_CORNER,; 19
	db "GOLD. GAME CORNER@"
Goldenrod_Map_Name20: ; map_const GOLDENROD_POKECENTER_1F ; 20
	db "GOLDENROD", $E1, $E2, "CENTER@"
Goldenrod_Map_Name21: ; map_const ILEX_FOREST_AZALEA_GATE ; 21
	db "AZALEA GATE@"
Goldenrod_Map_Name22: ; map_const ROUTE_34_ILEX_FOREST_GATE ; 22
	db "ILEX GATE@"
Goldenrod_Map_Name23: ; map_const DAY_CARE ; 23 
	db "JOHTO DAYCARE@"
Goldenrod_Map_Name24: ; map_const GOLDENROD_HOME_DECOR_STORE_1F ; 24 
	db "GOLD.DECORSTORE 1F@"
Goldenrod_Map_Name25: ; map_const GOLDENROD_HOME_DECOR_STORE_2F ; 25 
	db "GOLD.DECORSTORE 2F@"
Goldenrod_Map_Name26: ; map_const GOLDENROD_HOME_DECOR_STORE_3F ; 26 
	db "GOLD.DECORSTORE 3F@"
Goldenrod_Map_Name27: ; map_const GOLDENROD_HOME_DECOR_STORE_4F ; 27 
	db "GOLD.DECORSTORE 4F@"
Goldenrod_Map_Name28: ; map_const GOLDENROD_TOY_STORE ; 28 
	db "GOLDENROD TOYSTORE@"

Vermilion_Map_Name1: ; map_const ROUTE_6,;  1
	db "ROUTE 6@"
Vermilion_Map_Name2: ; map_const ROUTE_11,;  2
	db "ROUTE 11@"
Vermilion_Map_Name3: ; map_const VERMILION_CITY, ;  3
	db "VERMILION¯CITY@"
Vermilion_Map_Name4: ; map_const VERMILION_FISHING_SPEECH_HOUSE ;  4
	db "VERMILION¯HOUSE 1@"
Vermilion_Map_Name5: ; map_const VERMILION_POKECENTER_1F ;  5
	db "VERMILION ", $E1, $E2, "CENT.@"
Vermilion_Map_Name6: ; map_const POKEMON_FAN_CLUB ;  6
	db "VERMILION¯FANCLUB@"
Vermilion_Map_Name7: ; map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE ;  7
	db "VERMILION¯HOUSE 2@"
Vermilion_Map_Name8: ; map_const VERMILION_MART ;  8
	db "VERMILION ", $70, $71, "MART@"
Vermilion_Map_Name9: ; map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE ;  9
	db "VERMILION¯HOUSE 3@"
Vermilion_Map_Name10: ; map_const VERMILION_GYM ; 10
	db "VERMILION¯GYM@"
Vermilion_Map_Name11: ; map_const ROUTE_6_SAFFRON_GATE ; 11
	db "ROUTE 6 GATE@"
Vermilion_Map_Name12: ; map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE ; 12
	db "ROUTE 6 UNDER.@"                                           
Vermilion_Map_Name13: ; map_const ROUTE_11_ROUTE_12_GATE ; 13
	db "ROUTE 11 GATE.@" 
Vermilion_Map_Name14: ; map_const VERMILION_BERRY_MART ; 14
	db "BERRY MART.@" 	

Pallet_Map_Name1: ; map_const ROUTE_1,;  1
	db "ROUTE 1@"
Pallet_Map_Name2: ; map_const PALLET_TOWN,;  2
	db "PALLET TOWN@"
Pallet_Map_Name3: ; map_const REDS_HOUSE_1F ;  3
	db "RED'S HOUSE 1F@"
Pallet_Map_Name4: ; map_const REDS_HOUSE_2F ;  4
	db "RED'S HOUSE 2F@"
Pallet_Map_Name5: ; map_const BLUES_HOUSE ;  5
	db "BLUE'S HOUSE@"
Pallet_Map_Name6: ; map_const OAKS_LAB ;  6  ; 14
	db "OAK'S LAB@"
Pallet_Map_Name7: ; map_const ROUTE_1_VIRIDIAN_GATE ;  6  ; 14
	db "ROUTE 1 GATE.@"

Pewter_Map_Name1: ; map_const ROUTE_3,;  1
	db "ROUTE 3@"
Pewter_Map_Name2: ; map_const PEWTER_CITY,;  2
	db "PEWTER CITY@"
Pewter_Map_Name3: ; map_const PEWTER_NIDORAN_SPEECH_HOUSE ;  3
	db "PEWTER HOUSE 1@"
Pewter_Map_Name4: ; map_const PEWTER_GYM ;  4
	db "PEWTER GYM@"
Pewter_Map_Name5: ; map_const PEWTER_MART ;  5
	db "PEWTER ", $70, $71, "MART@"
Pewter_Map_Name6: ; map_const PEWTER_POKECENTER_1F ;  6
	db "PEWTER ", $E1, $E2, "CENTER@"
Pewter_Map_Name7: ; map_const PEWTER_SNOOZE_SPEECH_HOUSE ;  7
	db "PEWTER HOUSE 2@"                                          ; 15

Fast_Ship_Map_Name1: ; map_const OLIVINE_PORT,;  1
	db "OLIVINE MARINA@"
Fast_Ship_Map_Name2: ; map_const VERMILION_PORT,;  2
	db "VERMILION MARINA@"
Fast_Ship_Map_Name3: ; map_const FAST_SHIP_1F,;  3
	db "S.S. AQUA@"
Fast_Ship_Map_Name4: ; map_const FAST_SHIP_CABINS_NNW_NNE_NE,;  4
	db "S.S. AQUA CABIN 1@"
Fast_Ship_Map_Name5: ; map_const FAST_SHIP_CABINS_SW_SSW_NW,;  5
	db "S.S. AQUA CABIN 1@"
Fast_Ship_Map_Name6: ; map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,;  6
	db "S.S. AQUA CPTQTRS@"
Fast_Ship_Map_Name7: ; map_const FAST_SHIP_B1F,;  7
	db "S.S. AQUA GALLEY@"
Fast_Ship_Map_Name8: ; map_const OLIVINE_PORT_PASSAGE,;  8
	db "JOHTO PORTPASSAGE@"
Fast_Ship_Map_Name9: ; map_const VERMILION_PORT_PASSAGE,;  9
	db "KANTO PORTPASSAGE@"
Fast_Ship_Map_Name10: ; map_const MOUNT_MOON_SQUARE,; 10
	db "MT. MOON SQUARE@"
Fast_Ship_Map_Name11: ; map_const MOUNT_MOON_GIFT_SHOP ; 11
	db "MT. MOON SHOP@"
Fast_Ship_Map_Name12: ; map_const TIN_TOWER_ROOF, 12
	db "TIN TOWER ROOF@"                                             ; 16

Indigo_Map_Name1: ; map_const ROUTE_23,;  1
	db "ROUTE 23@"
Indigo_Map_Name2: ; map_const INDIGO_PLATEAU_POKECENTER_1F ;  2
	db "INDIGO¯PLATEAU@"
Indigo_Map_Name3: ; map_const WILLS_ROOM ;  3
	db "E4 WILL'S ROOM@"
Indigo_Map_Name4: ; map_const KOGAS_ROOM ;  4
	db "E4 KOGA'S ROOM@"
Indigo_Map_Name5: ; map_const BRUNOS_ROOM ;  5
	db "E4 BRUNO'S ROOM@"
Indigo_Map_Name6: ; map_const KARENS_ROOM ;  6
	db "E4 KAREN'S ROOM@"
Indigo_Map_Name7: ; map_const LANCES_ROOM,;  7
	db "E4 LANCE'S ROOM@"
Indigo_Map_Name8: ; map_const HALL_OF_FAME ;  8
	db "E4 HALL OF FAME@"                                           ; 17
Indigo_Map_Name9: ; map_const HALL_OF_FAME ;  9
	db "INDIGO¯PLATEAU@"  

Fuchsia_Map_Name1: ; map_const ROUTE_12							;  1
	db "ROUTE 12@"
Fuchsia_Map_Name2: ; map_const ROUTE_12_SUPER_ROD_HOUSE			;  2
	db "ROUTE 12 ANGLER@"
Fuchsia_Map_Name3: ; map_const ROUTE_13							;  3
	db "ROUTE 13@"
Fuchsia_Map_Name4: ; map_const ROUTE_14							;  4
	db "ROUTE 14@"
Fuchsia_Map_Name5: ; map_const ROUTE_15							;  5
	db "ROUTE 15@"
Fuchsia_Map_Name6: ; map_const ROUTE_16							;  6
	db "ROUTE 16@"
Fuchsia_Map_Name7: ; map_const ROUTE_17							;  7
	db "ROUTE 17@"
Fuchsia_Map_Name8: ; map_const ROUTE_18							;  8
	db "ROUTE 18@"
Fuchsia_Map_Name9: ; map_const FUCHSIA_CITY						;  9
	db "FUCHSIA¯CITY@"
Fuchsia_Map_Name10: ; map_const FUCHSIA_MART 					; 10
	db "FUCHSIA ", $70, $71, "MART@"
Fuchsia_Map_Name11: ; map_const SAFARI_ZONE_FUCHSIA_GATE 		; 11
	db "SAFARI ZONE GATE@"
Fuchsia_Map_Name12: ; map_const FUCHSIA_GYM 					; 12
	db "FUCHSIA¯GYM@"
Fuchsia_Map_Name13: ; map_const BILLS_BROTHERS_HOUSE 			; 13
	db "BILL'S BRO HOUSE@"
Fuchsia_Map_Name14: ; map_const FUCHSIA_POKECENTER_1F 			; 14
	db "FUCHSIA ", $E1, $E2, "CENTER@"
Fuchsia_Map_Name15: ; map_const SAFARI_ZONE_WARDENS_HOME 		; 15
	db "WARDEN'S HOUSE@" 
Fuchsia_Map_Name16: ; map_const ROUTE_15_FUCHSIA_GATE 			; 16
	db "ROUTE 15 GATE@"
Fuchsia_Map_Name17: ; map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE 	; 17
	db "ROUTE 16 HOUSE@"
Fuchsia_Map_Name18: ; map_const ROUTE_16_GATE 					; 18
	db "ROUTE 16 GATE@"
Fuchsia_Map_Name19: ; map_const ROUTE_17_ROUTE_18_GATE 			; 19
	db "ROUTE 17 GATE@"
Fuchsia_Map_Name20: ; map_const ROUTE_14_ARTICUNO_NEST 			; 20
	db "ARTICUNO¯NEST@"

Lavender_Map_Name1: ; map_const ROUTE_8,;  1
	db "ROUTE 8@"
Lavender_Map_Name2: ; map_const ROUTE_10_SOUTH,;  2
	db "ROUTE 10 S.@"
Lavender_Map_Name3: ; map_const LAVENDER_TOWN,;  3
	db "LAVENDER¯TOWN@"
Lavender_Map_Name4: ; map_const LAVENDER_POKECENTER_1F ;  4
	db "LAVENDER ", $E1, $E2, "CENTER@"
Lavender_Map_Name5: ; map_const MR_FUJIS_HOUSE ;  5
	db "MR.FUJI'S HOUSE@"
Lavender_Map_Name6: ; map_const LAVENDER_SPEECH_HOUSE ;  6
	db "LAVENDER¯HOUSE 1@"
Lavender_Map_Name7: ; map_const LAVENDER_NAME_RATER ;  7
	db "KANTO NAME RATER@"
Lavender_Map_Name8: ; map_const LAVENDER_MART ;  8
	db "LAVENDER ", $70, $71, "MART@"
Lavender_Map_Name9: ; map_const SOUL_HOUSE ;  9
	db "SOUL HOUSE@"
Lavender_Map_Name10: ; map_const LAV_RADIO_TOWER_1F,; 10
	db "KANTO¯RADIO TOWER@"
Lavender_Map_Name11: ; map_const ROUTE_12_LAVENDER_GATE ; 11
	db "ROUTE 12 GATE@"   
Lavender_Map_Name12: ; map_const ROUTE_8_SAFFRON_GATE ; 12
	db "ROUTE 8 GATE@"                                              ; 19

Silver_Map_Name1: ; map_const ROUTE_28,;  1
	db "ROUTE 28@"
Silver_Map_Name2: ; map_const MT_SILVER_OUTSIDE,;  2
	db "MT. SILVER@"	
Silver_Map_Name3: ; map_const SILVER_CAVE_POKECENTER_1F ;  3
	db "MT. SILVER", $E1, $E2, "CENTER@"
Silver_Map_Name4: ; map_const ROUTE_28_STEEL_WING_HOUSE ;  4
	db "ROUTE 28 CABIN@"                                       ; 20

Cable_Club_Map_Name1: ; map_const POKECENTER_2F ;  1
	db $E1, $E2, " CENTER 2F@"
Cable_Club_Map_Name2: ; map_const TRADE_CENTER ;  2
	db $E1, $E2, " TRADE CENTER@"
Cable_Club_Map_Name3: ; map_const COLOSSEUM ;  3
	db $E1, $E2, " COLOSSEUM@"
;Cable_Club_Map_Name4: ; map_const TIME_CAPSULE ;  4
;	db $E1, $E2, " TIME CAPSULE@"
;Cable_Club_Map_Name5: ; map_const MOBILE_TRADE_ROOM ;  5
;	db "MOBILE TRADE@"
;Cable_Club_Map_Name6: ; map_const MOBILE_BATTLE_ROOM ;  6
;	db "MOBILE BATTLE@"                                          ; 21

Celadon_Map_Name1: ; map_const ROUTE_7,;  1
	db "ROUTE 7@"
Celadon_Map_Name2: ; map_const CELADON_CITY, 2
	db "CELADON¯CITY@"
Celadon_Map_Name3: ; map_const CELADON_DEPT_STORE_1F ;  3
	db "CEL. DEPTSTORE 1F@"
Celadon_Map_Name4: ; map_const CELADON_DEPT_STORE_2F ;  4
	db "CEL. DEPTSTORE 2F@"
Celadon_Map_Name5: ; map_const CELADON_DEPT_STORE_3F ;  5
	db "CEL. DEPTSTORE 3F@"
Celadon_Map_Name6: ; map_const CELADON_DEPT_STORE_4F ;  6
	db "CEL. DEPTSTORE 4F@"
Celadon_Map_Name7: ; map_const CELADON_DEPT_STORE_5F ;  7
	db "CEL. DEPTSTORE 5F@"
Celadon_Map_Name8: ; map_const CELADON_DEPT_STORE_6F ;  8
	db "CEL. DEPTSTORE 6F@"
Celadon_Map_Name9: ; map_const CELADON_DEPT_STORE_ELEVATOR ;  9
	db "CELADON DEPT LIFT@"
Celadon_Map_Name10: ; map_const CELADON_MANSION_1F ; 10
	db "CELADON MANSION1F@"
Celadon_Map_Name11: ; map_const CELADON_MANSION_2F ; 11
	db "CELADON MANSION2F@"
Celadon_Map_Name12: ; map_const CELADON_MANSION_3F ; 12
	db "CELADON MANSION3F@"
Celadon_Map_Name13: ; map_const CELADON_MANSION_ROOF ; 13
	db "CEL. MANSION ROOF@"
Celadon_Map_Name14: ; map_const CELADON_MANSION_ROOF_HOUSE ; 14
	db "CELADON MANSION4F@"
Celadon_Map_Name15: ; map_const CELADON_POKECENTER_1F ; 15
	db "CELADON ", $E1, $E2, "CENTER@"
Celadon_Map_Name16: ; map_const CELADON_GAME_CORNER, 16
	db "CEL. GAME CORNER@"
Celadon_Map_Name17: ; map_const CELADON_GAME_CORNER_PRIZE_ROOM ; 17
	db "CELADON PRIZEROOM@"
Celadon_Map_Name18: ; map_const CELADON_GYM ; 18
	db "CELADON GYM@"
Celadon_Map_Name19: ; map_const CELADON_CAFE ; 19
	db "CELADON CAFE@"
Celadon_Map_Name20: ; map_const ROUTE_7_SAFFRON_GATE ; 20 
	db "ROUTE 7 GATE@"
Celadon_Map_Name21: ; map_const ROUTE_7_SAFFRON_GATE ; 21 
	db "CEL. DECORSTORE 1F@" 
Celadon_Map_Name22: ; map_const ROUTE_7_SAFFRON_GATE ; 22 
	db "CEL. DECORSTORE 2F@" 
Celadon_Map_Name23: ; map_const ROUTE_7_SAFFRON_GATE ; 23 
	db "CEL. DECORSTORE 3F@" 
Celadon_Map_Name24: ; map_const ROUTE_7_SAFFRON_GATE ; 24 
	db "CEL. DECORSTORE 4F@" 

Cianwood_Map_Name1: ; map_const ROUTE_40,  1
	db "ROUTE 40@"
Cianwood_Map_Name2: ; map_const ROUTE_41, ;  2
	db "ROUTE 41@"
Cianwood_Map_Name3: ; map_const CIANWOOD_CITY ;  3
	db "CIANWOOD¯CITY@"
Cianwood_Map_Name4: ; map_const MANIAS_HOUSE ;  4
	db "MANIA'S HOUSE@"
Cianwood_Map_Name5: ; map_const CIANWOOD_GYM ;  5
	db "CIANWOOD¯GYM@"
Cianwood_Map_Name6: ; map_const CIANWOOD_POKECENTER_1F ;  6
	db "CIANWOOD ", $E1, $E2, "CENTER@"
Cianwood_Map_Name7: ; map_const CIANWOOD_PHARMACY ;  7
	db "CIANWOOD¯PHARMACY@"
Cianwood_Map_Name8: ; map_const CIANWOOD_LUGIA_SPEECH_HOUSE ;  8
	db "CIANWOOD HOUSE@"
Cianwood_Map_Name9: ; map_const CIANWOOD_BEASTS_HOUSE ;  9
	db "BEASTS HOUSE@"
Cianwood_Map_Name10: ; map_const CIANWOOD_MOVE_TUTOR_HOUSE ; 10
	db "CIANWOOD TUTOR@"
Cianwood_Map_Name11: ; map_const BATTLE_TOWER_1F ; 11
	db "BATTLE TOWER 1F@"
Cianwood_Map_Name12: ; map_const BATTLE_TOWER_BATTLE_ROOM ; 12
	db "BATTLE TOWER ROOM@"
Cianwood_Map_Name13: ; map_const BATTLE_TOWER_ELEVATOR ; 13
	db "BATTLE TOWER LIFT@"
Cianwood_Map_Name14: ; map_const BATTLE_TOWER_HALLWAY, ; 14
	db "BATTLE TOWER HALL@"
Cianwood_Map_Name15: ; map_const ROUTE_40_BATTLE_TOWER_GATE ; 15
	db "ROUTE 40 GATE@"
Cianwood_Map_Name16: ; map_const BATTLE_TOWER_OUTSIDE ; 16
	db "BATTLE TOWER@"

Viridian_Map_Name1: ; map_const ROUTE_2,;  1
	db "ROUTE 2@"
Viridian_Map_Name2: ; map_const ROUTE_22,  2
	db "ROUTE 22@"
Viridian_Map_Name3: ; map_const ROUTE_26,  3
	db "ROUTE 26@"
Viridian_Map_Name4: ; map_const VIRIDIAN_CITY,  4
	db "VIRIDIAN¯CITY@"
Viridian_Map_Name5: ; map_const VIRIDIAN_GYM ;  5
	db "VIRIDIAN¯GYM@"
Viridian_Map_Name6: ; map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE ;  6
	db "VIRIDIAN¯HOUSE 2@"
Viridian_Map_Name7: ; map_const TRAINER_HOUSE_1F ;  7
	db "VIRIDIAN¯HOUSE 1F@"
Viridian_Map_Name8: ; map_const TRAINER_HOUSE_B1F ;  8
	db "VIRIDIAN¯HOUSEB1F@"
Viridian_Map_Name9: ; map_const VIRIDIAN_MART ;  9
	db "VIRIDIAN ", $70, $71, "MART@"
Viridian_Map_Name10: ; map_const VIRIDIAN_POKECENTER_1F ; 10
	db "VIRIDIAN ", $E1, $E2, "CENTER@"
Viridian_Map_Name11: ; map_const ROUTE_2_NUGGET_HOUSE ; 11
	db "RT 2 NUGGET HOUSE@"
Viridian_Map_Name12: ; map_const ROUTE_2_GATE ; 12
	db "ROUTE 2 GATE@"
Viridian_Map_Name13: ; map_const ROUTE_2_VIRIDIAN_FOREST_GATE ; 13
	db "ROUTE 2 VF GATE@"
Viridian_Map_Name14: ; map_const VIRIDIAN_FOREST_ROUTE_2_GATE ; 14
	db "VF ROUTE 2 GATE@"
Viridian_Map_Name15: ; map_const VIRIDIAN_FOREST_HOUSE ; 15
	db "FOREST HOUSE@"
Viridian_Map_Name16: ; map_const VIRIDIAN_FOREST_HOUSE_BF1 ; 16
	db "FOREST HOUSE BF1@"
Viridian_Map_Name17: ; map_const VICTORY_ROAD_GATE, 17
	db "VICTORY¯ROAD GATE@"
Viridian_Map_Name18: ; map_const ROUTE_26_HEAL_HOUSE ; 18
	db "ROUTE 26 HOUSE@"
Viridian_Map_Name19: ; map_const DAY_OF_WEEK_SIBLINGS_HOUSE ; 19
	db "DAY SIBLINGS HOUSE@"

New_Bark_Map_Name1: ; map_const ROUTE_27,  1
	db "ROUTE 27@"
New_Bark_Map_Name2: ; map_const ROUTE_29, ;  2
	db "ROUTE 29@"
New_Bark_Map_Name3: ; map_const NEW_BARK_TOWN,;  3
	db "NEW BARK¯TOWN@"
New_Bark_Map_Name4: ; map_const ELMS_LAB ;  4
	db "ELM'S LAB@"
New_Bark_Map_Name5: ; map_const PLAYERS_HOUSE_1F ;  5
	db "PLAYER'S HOUSE 1F@"
New_Bark_Map_Name6: ; map_const PLAYERS_HOUSE_2F ;  6
	db "PLAYER'S HOUSE 2F@"
New_Bark_Map_Name7: ; map_const PLAYERS_NEIGHBORS_HOUSE ;  7
	db "NEW BARK HOUSE@"
New_Bark_Map_Name8: ; map_const ELMS_HOUSE ;  8
	db "ELM'S HOUSE@"
New_Bark_Map_Name9: ; map_const ROUTE_27_AERIAL_ACE_HOUSE ;  9
	db "ROUTE 27 HOUSE@"
New_Bark_Map_Name10: ; map_const ROUTE_29_ROUTE_46_GATE ; 10
	db "ROUTE 29 GATE@"

Saffron_Map_Name1: ; map_const SAFFRON_CITY ;  1
	db "SAFFRON¯CITY@"
Saffron_Map_Name2: ; map_const FIGHTING_DOJO ;  2
	db "FIGHTING DOJO@"
Saffron_Map_Name3: ; map_const SAFFRON_GYM,  ;  3
	db "SAFFRON GYM@"
Saffron_Map_Name4: ; map_const SAFFRON_MART ;  4
	db "SAFFRON ", $70, $71, "MART@"
Saffron_Map_Name5: ; map_const SAFFRON_POKECENTER_1F ;  5
	db "SAFFRON ", $E1, $E2, "CENTER@"
Saffron_Map_Name6: ; map_const MR_PSYCHICS_HOUSE ;  6
	db "MR.PSYCHICS HOUSE@"
Saffron_Map_Name7: ; map_const SAFFRON_MAGNET_TRAIN_STATION,;  7
	db "SAFFRON STATION@"
Saffron_Map_Name8: ; map_const SILPH_CO_1F ;  8
	db "SILPH CO.@"
Saffron_Map_Name9: ; map_const COPYCATS_HOUSE_1F ;  9
	db "COPYCAT HOUSE 1F@"
Saffron_Map_Name10: ; map_const COPYCATS_HOUSE_2F ; 10
	db "COPYCAT HOUSE 2F@"
Saffron_Map_Name11: ; map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE ; 11
	db "ROUTE 5 UNDERGRND@"
Saffron_Map_Name12: ; map_const ROUTE_5_SAFFRON_GATE ; 12
	db "ROUTE 5 GATE@"
Saffron_Map_Name13: ; map_const ROUTE_5_CLEANSE_TAG_HOUSE ; 13
	db "ROUTE 5 HOUSE@"
Saffron_Map_Name14: ; map_const SAFFRON_AVICULTURAL_SOCIETY_1F ; 13
	db "AVICULTURAL SOC.1F@"
Saffron_Map_Name15: ; map_const SAFFRON_AVICULTURAL_SOCIETY_2F ; 13
	db "AVICULTURAL SOC.2F@"
Saffron_Map_Name16: ; map_const SAFFRON_AVICULTURAL_SOCIETY_3F ; 13
	db "AVICULTURAL SOC.3F@"

Cherrygrove_Map_Name1: ; map_const ROUTE_30         ;  1
	db "ROUTE 30@"
Cherrygrove_Map_Name2: ; map_const ROUTE_31         ;  2
	db "ROUTE 31@"
Cherrygrove_Map_Name3: ; map_const CHERRYGROVE_CITY ;  3
	db "CHERRYGROVE¯CITY@"
Cherrygrove_Map_Name4: ; map_const CHERRYGROVE_MART ;  4
	db "CHERRYGROVE.#MART@"
Cherrygrove_Map_Name5: ; map_const CHERRYGROVE_POKECENTER_1F ;  5
	db "CHERRYGROVE ", $E1, $E2, "CEN@"
Cherrygrove_Map_Name6: ; map_const CHERRYGROVE_GYM_SPEECH_HOUSE ;  6
	db "CHERRYG.¯HOUSE 1@"
Cherrygrove_Map_Name7: ; map_const GUIDE_GENTS_HOUSE ;  7
	db "GUIDE GENT HOUSE@"
Cherrygrove_Map_Name8: ; map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE ;  8
	db "CHERRYG.¯HOUSE 2@"
Cherrygrove_Map_Name9: ; map_const ROUTE_30_BERRY_HOUSE ;  9
	db "ROUTE 30 HOUSE@"
Cherrygrove_Map_Name10: ; map_const MR_POKEMONS_HOUSE ; 10
	db "MR.#MON HOUSE@"
Cherrygrove_Map_Name11: ; map_const ROUTE_31_VIOLET_GATE ; 11
	db "ROUTE 31 GATE@"
	
Safari_Map_Name1: ; map_const SAFARI_ZONE_HUB         ;  1
	db "SAFARI ZONE HUB@"
Safari_Map_Name2: ; map_const SAFARI_ZONE_EAST         ;  2
	db "SAFARI ZONE EAST@"
Safari_Map_Name3: ; map_const SAFARI_ZONE_NORTH ;  3
	db "SAFARI ZONE NORTH@"
Safari_Map_Name4: ; map_const SAFARI_ZONE_WEST ;  4
	db "SAFARI ZONE WEST@"
Safari_Map_Name5: ; map_const SAFARI_ZONE_HUB_REST_HOUSE ;  5
	db "HUB REST HOUSE@"
Safari_Map_Name6: ; map_const SAFARI_ZONE_EAST_REST_HOUSE ;  6
	db "EAST REST HOUSE@"
Safari_Map_Name7: ; map_const SAFARI_ZONE_NORTH_REST_HOUSE ;  7
	db "NORTH REST HOUSE@"
Safari_Map_Name8: ; map_const SAFARI_ZONE_WEST_REST_HOUSE_1 ;  8
	db "WEST REST HOUSE 1@"
Safari_Map_Name9: ; map_const SAFARI_ZONE_WEST_REST_HOUSE_2 ;  9
	db "WEST REST HOUSE 2@"