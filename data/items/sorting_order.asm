ItemNameOrder:
 	table_width 1, ItemNameOrder

	db NO_ITEM      ; 00

	; Items
	db EGG_TICKET   ; 81
	db ESCAPE_ROPE  ; 13
	db EXP_SHARE    ; 39
	db MULCH        ; 9b
	db REPEL        ; 14
	db SUPER_REPEL  ; 2a
	db MAX_REPEL    ; 2b

	; Stat altering Battle Items
	db DIRE_HIT     ; 2c
	db GUARD_SPEC   ; 29
	db POKE_DOLL    ; 25
	db X_ACCURACY   ; 21
	db X_ATTACK     ; 31
	db X_DEFEND     ; 33
	db X_SP_ATK     ; 35
	db X_SP_DEF     ; 78
	db X_SPEED      ; 34

	; Battle related Held Items
	db AMULET_COIN  ; 5b
	db BERRY_JUICE  ; 8b
	db BERSERK_GENE ; 98
	db BLACKBELT_I  ; 62
	db BLACKGLASSES ; 66
	db BRIGHTPOWDER ; 03
	db CHARCOAL     ; 8a
	db CLEANSE_TAG  ; 5e
	db DRAGON_FANG  ; 90
	db EVERSTONE    ; 70
	db EVIOLITE     ; 87
	db FOCUS_BAND   ; 77
	db HARD_STONE   ; 7d
	db KINGS_ROCK   ; 52
	db LEFTOVERS    ; 92
	db LIGHT_BALL   ; a3
	db LUCKY_EGG    ; 7e
	db LUCKY_PUNCH  ; 1e
	db MAGNET       ; 6c
	db METAL_COAT   ; 8f
	db METAL_POWDER ; 23
	db MIRACLE_SEED ; 75
	db MYSTIC_WATER ; 5f
	db NEVERMELTICE ; 6b
	db PINK_BOW     ; 68
	db POISON_BARB  ; 51
	db POLKADOT_BOW ; aa
	db QUICK_CLAW   ; b4
	db SCOPE_LENS   ; 8c
	db SHARP_BEAK   ; 4d
	db SILVERPOWDER ; 58
	db SMOKE_BALL   ; 6a
	db SOFT_SAND    ; 4c
	db SPELL_TAG    ; 71
	db STICK        ; 69
	db THICK_CLUB   ; 76
	db TWISTEDSPOON ; 60

	; Evolution Items
	db DRAGON_SCALE ; 97
	db FIRE_STONE   ; 16
	db LEAF_STONE   ; 22
	db MOON_STONE   ; 08
	db SUN_STONE    ; a9
	db THUNDERSTONE ; 17
	db WATER_STONE  ; 18
	db UP_GRADE     ; ac

	; Fossils
	db OLD_AMBER    ; 93
	db DOME_FOSSIL  ; 94
	db HELIX_FOSSIL ; 95

	; Other items
	db SILVER_LEAF  ; 3c
	db GOLD_LEAF    ; 4b
	db TINYMUSHROOM ; 56
	db BIG_MUSHROOM ; 57
	db STARDUST     ; 83
	db STAR_PIECE   ; 84
	db PEARL        ; 6e
	db BIG_PEARL    ; 6f
	db NUGGET       ; 24
	db BIG_NUGGET   ; 19
	db SLOWPOKETAIL ; 67

	; Mail
	db BLUESKY_MAIL ; bb
	db EON_MAIL     ; b9
	db FLOWER_MAIL  ; 9e
	db LITEBLUEMAIL ; b6
	db LOVELY_MAIL  ; b8
	db MIRAGE_MAIL  ; bd
	db MORPH_MAIL   ; ba
	db MUSIC_MAIL   ; bc
	db PORTRAITMAIL ; b7
	db SURF_MAIL    ; b5

	; HP restoring items
	db POTION       ; 12
	db SUPER_POTION ; 11
	db HYPER_POTION ; 10
	db MAX_POTION   ; 0f
	db FULL_RESTORE ; 0e
	db SACRED_ASH   ; 9c

	; Vending Machine Drinks
	db FRESH_WATER  ; 2e
	db SODA_POP     ; 2f
	db LEMONADE     ; 30

	; Other healing related items
	db MOOMOO_MILK  ; 48
	db RAGECANDYBAR ; 72

	; Status recovery items
	db ANTIDOTE     ; 09
	db AWAKENING    ; 0c
	db BURN_HEAL    ; 0a
	db ICE_HEAL     ; 0b
	db PARLYZ_HEAL  ; 0d
	db FULL_HEAL    ; 26

	; PP restoring items
	db ETHER        ; 3f
	db MAX_ETHER    ; 40
	db ELIXER       ; 41
	db MAX_ELIXER   ; 15
	db REVIVE       ; 27
	db MAX_REVIVE   ; 28

	; Bitter Medicine
	db ENERGY_ROOT  ; 7a
	db ENERGYPOWDER ; 79
	db HEAL_POWDER  ; 7b
	db REVIVAL_HERB ; 7c

	; Vitamins
	db RARE_CANDY   ; 20
	db HP_UP        ; 1a
	db PROTEIN      ; 1b
	db IRON         ; 1c
	db CALCIUM      ; 1f
	db ZINC         ; 89
	db CARBOS       ; 1d
	db PP_UP        ; 3e

	; Generic Pokéballs
	db POKE_BALL    ; 05
	db GREAT_BALL   ; 04
	db ULTRA_BALL   ; 02
	db MASTER_BALL  ; 01

	; Specialist Pokéballs
	db PREMIER_BALL ; 99
	db DUSK_BALL    ; 5a
	db NET_BALL     ; a2
	db PARK_BALL    ; b1

	; Kurt's Pokéballs
	db FAST_BALL    ; a1
	db FRIEND_BALL  ; a4
	db HEAVY_BALL   ; 9d
	db LEVEL_BALL   ; 9f
	db LOVE_BALL    ; a6
	db LURE_BALL    ; a0
	db MOON_BALL    ; a5

	; Berries
	db ORAN_BERRY   ; ad
	db SITRUS_BERRY ; ae
	db CHERI_BERRY  ; 4e
	db CHESTO_BERRY ; 54
	db PECHA_BERRY  ; 4a
	db RAWST_BERRY  ; 50
	db ASPEAR_BERRY ; 4f
	db PERSIM_BERRY ; 53
	db LEPPA_BERRY  ; 96
	db LUM_BERRY    ; 6d

	; EV Berries
	db POMEG_BERRY  ; 32
	db KELPSY_BERRY ; 64
	db QUALOT_BERRY ; 88
	db HONDEW_BERRY ; 8d
	db GREPA_BERRY  ; 8e
	db TAMATO_BERRY ; 91

	; Apricorns
	db BLU_APRICORN ; 59
	db BLK_APRICORN ; 63
	db GRN_APRICORN ; 5d
	db PNK_APRICORN ; 65
	db RED_APRICORN ; 55
	db WHT_APRICORN ; 61
	db YLW_APRICORN ; 5c

	; Permanent Key Items
 	; Items that are possibly frequently used
	db BICYCLE      ; 07
	db COIN_CASE    ; 36
	db DIPLOMA      ; 49
	db ITEMFINDER   ; 37

	; Rods
	db OLD_ROD      ; 3a
	db GOOD_ROD     ; 3b
	db SUPER_ROD    ; 3d

	; Items that are possibly seldom used
	db BLUE_CARD    ; 74
	db CLEAR_BELL   ; 46
	db GS_BALL      ; 73
	db OLD_SEA_MAP  ; b0
	db PASS         ; 86
	db SILVER_WING  ; 47
	db RAINBOW_WING ; b2
	db SECRET_KEY   ; 2d
	db SQUIRTBOTTLE ; af
	db S_S_TICKET   ; 44

	; Temporary Key Items
	db BALL_RELIC   ; 9a
	db BASEMENT_KEY ; 85
	db CARD_KEY     ; 7f
	db LOST_ITEM    ; 82
	db MACHINE_PART ; 80
	db MYSTERY_EGG  ; 45
	db RED_SCALE    ; 42
	db SECRETPOTION ; 43

	; Unused Items
	db TOWN_MAP     ; 06
	db POKE_FLUTE   ; 38
	db ITEM_A7      ; a7
	db ITEM_A8      ; a8
	db ITEM_AB      ; ab
	db ITEM_B3      ; b3
	db ITEM_BE      ; be
	db ITEM_BF      ; bf

	; 192 items total

;REPT 22
; 	db $FF ; fill with empty bytes to reach NUM_ITEMS + 1
;ENDR
 
 	assert_table_length NUM_ITEMS + 1 ; Needs to be increased if more dummied items are added
 	db -1 ; end
