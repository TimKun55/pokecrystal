; sprite_anim_struct members (see macros/ram.asm)
rsreset
DEF SPRITEANIMSTRUCT_INDEX           rb ; 0
DEF SPRITEANIMSTRUCT_FRAMESET_ID     rb ; 1
DEF SPRITEANIMSTRUCT_ANIM_SEQ_ID     rb ; 2
DEF SPRITEANIMSTRUCT_TILE_ID         rb ; 3
DEF SPRITEANIMSTRUCT_XCOORD          rb ; 4
DEF SPRITEANIMSTRUCT_YCOORD          rb ; 5
DEF SPRITEANIMSTRUCT_XOFFSET         rb ; 6
DEF SPRITEANIMSTRUCT_YOFFSET         rb ; 7
DEF SPRITEANIMSTRUCT_DURATION        rb ; 8
DEF SPRITEANIMSTRUCT_DURATIONOFFSET  rb ; 9
DEF SPRITEANIMSTRUCT_FRAME           rb ; a
DEF SPRITEANIMSTRUCT_JUMPTABLE_INDEX rb ; b
DEF SPRITEANIMSTRUCT_VAR1            rb ; c
DEF SPRITEANIMSTRUCT_VAR2            rb ; d
DEF SPRITEANIMSTRUCT_VAR3            rb ; e
DEF SPRITEANIMSTRUCT_VAR4            rb ; f
DEF SPRITEANIMSTRUCT_LENGTH EQU _RS
DEF NUM_SPRITE_ANIM_STRUCTS EQU 10 ; see wSpriteAnimationStructs

; wSpriteAnimDict keys (see wram.asm)
; UnusedSpriteAnimGFX indexes (see data/sprite_anims/unused_gfx.asm)
	const_def
	const SPRITE_ANIM_DICT_DEFAULT      ; 00
	const_skip 4                        ; unused
	const SPRITE_ANIM_DICT_TEXT_CURSOR  ; 05
	const SPRITE_ANIM_DICT_GS_SPLASH    ; 06
	const SPRITE_ANIM_DICT_SLOTS        ; 07
	const SPRITE_ANIM_DICT_ARROW_CURSOR ; 08
DEF NUM_SPRITE_ANIM_GFX EQU const_value

; wSpriteAnimDict size (see wram.asm)
DEF NUM_SPRITEANIMDICT_ENTRIES EQU 10

; SpriteAnimObjects indexes (see data/sprite_anims/objects.asm)
	const_def
	const SPRITE_ANIM_OBJ_PARTY_MON                 ; 00
	const SPRITE_ANIM_OBJ_NAMING_SCREEN_CURSOR      ; 01
	const SPRITE_ANIM_OBJ_GAMEFREAK_LOGO            ; 02
	const SPRITE_ANIM_OBJ_SLOTS_GOLEM               ; 03
	const SPRITE_ANIM_OBJ_SLOTS_CHANSEY             ; 04
	const SPRITE_ANIM_OBJ_SLOTS_EGG                 ; 05
	const SPRITE_ANIM_OBJ_COMPOSE_MAIL_CURSOR       ; 06
	const SPRITE_ANIM_OBJ_RED_WALK                  ; 07
	const SPRITE_ANIM_OBJ_MEMORY_GAME_CURSOR        ; 08
	const SPRITE_ANIM_OBJ_POKEGEAR_ARROW            ; 09
	const SPRITE_ANIM_OBJ_TRADE_POKE_BALL           ; 0a
	const SPRITE_ANIM_OBJ_TRADE_POOF                ; 0b
	const SPRITE_ANIM_OBJ_TRADE_TUBE_BULGE          ; 0c
	const SPRITE_ANIM_OBJ_TRADEMON_ICON             ; 0d
	const SPRITE_ANIM_OBJ_TRADEMON_BUBBLE           ; 0e
	const SPRITE_ANIM_OBJ_EVOLUTION_BALL_OF_LIGHT   ; 0f
	const SPRITE_ANIM_OBJ_RADIO_TUNING_KNOB         ; 10
	const SPRITE_ANIM_OBJ_MAGNET_TRAIN_RED          ; 11
	const SPRITE_ANIM_OBJ_LEAF                      ; 12
	const SPRITE_ANIM_OBJ_CUT_TREE                  ; 13
	const SPRITE_ANIM_OBJ_FLY_LEAF                  ; 14
	const SPRITE_ANIM_OBJ_EGG_CRACK                 ; 15
	const SPRITE_ANIM_OBJ_HEADBUTT                  ; 16
	const SPRITE_ANIM_OBJ_EGG_HATCH                 ; 17
	const SPRITE_ANIM_OBJ_BLUE_WALK                 ; 18
	const SPRITE_ANIM_OBJ_MAGNET_TRAIN_BLUE         ; 19
	const SPRITE_ANIM_OBJ_INTRO_SUICUNE             ; 1a
	const SPRITE_ANIM_OBJ_INTRO_PICHU               ; 1b
	const SPRITE_ANIM_OBJ_INTRO_WOOPER              ; 1c
	const SPRITE_ANIM_OBJ_INTRO_UNOWN               ; 1d
	const SPRITE_ANIM_OBJ_INTRO_UNOWN_F             ; 1e
	const SPRITE_ANIM_OBJ_INTRO_SUICUNE_AWAY        ; 1f
	const SPRITE_ANIM_OBJ_CELEBI                    ; 20
	const SPRITE_ANIM_OBJ_PC_CURSOR                 ; 21
	const SPRITE_ANIM_OBJ_PC_QUICK                  ; 22
	const SPRITE_ANIM_OBJ_PC_MODE                   ; 23
	const SPRITE_ANIM_OBJ_PC_MODE2                  ; 24
	const SPRITE_ANIM_OBJ_PC_PACK                   ; 25
	const SPRITE_ANIM_OBJ_SLOTS_COVER               ; 26
; Surfing Pikachu minigame objects (see SurfingPikachuObjectSpawnData)
	const SPRITE_ANIM_OBJ_SURF_UNUSED                ; 27
	const SPRITE_ANIM_OBJ_SURF_PIKACHU               ; 28
	const SPRITE_ANIM_OBJ_SURF_START                 ; 29
	const SPRITE_ANIM_OBJ_SURF_GOAL                  ; 2a
	const SPRITE_ANIM_OBJ_SURF_PLUS50                ; 2b
	const SPRITE_ANIM_OBJ_SURF_PLUS150               ; 2c
	const SPRITE_ANIM_OBJ_SURF_PLUS350               ; 2d
	const SPRITE_ANIM_OBJ_SURF_PLUS750               ; 2e
	const SPRITE_ANIM_OBJ_SURF_PLUS180               ; 2f
	const SPRITE_ANIM_OBJ_SURF_PLUS500               ; 30
	const SPRITE_ANIM_OBJ_SURF_WATER_SPRAY           ; 31
	const SPRITE_ANIM_OBJ_SURF_OH_NO                 ; 32
	const SPRITE_ANIM_OBJ_SURF_INTRO_PIKACHU         ; 33
DEF NUM_SPRITE_ANIM_OBJS EQU const_value

; DoSpriteAnimFrame.Jumptable indexes (see engine/sprite_anims/functions.asm)
	const_def
	const SPRITE_ANIM_FUNC_NULL                      ; 00
	const SPRITE_ANIM_FUNC_PARTY_MON                 ; 01
	const SPRITE_ANIM_FUNC_PARTY_MON_SWITCH          ; 02
	const SPRITE_ANIM_FUNC_PARTY_MON_SELECTED        ; 03
	const SPRITE_ANIM_FUNC_NAMING_SCREEN_CURSOR      ; 04
	const SPRITE_ANIM_FUNC_GAMEFREAK_LOGO            ; 05
	const SPRITE_ANIM_FUNC_SLOTS_GOLEM               ; 06
	const SPRITE_ANIM_FUNC_SLOTS_CHANSEY             ; 07
	const SPRITE_ANIM_FUNC_SLOTS_EGG                 ; 08
	const SPRITE_ANIM_FUNC_MAIL_CURSOR               ; 09
	const SPRITE_ANIM_FUNC_MEMORY_GAME_CURSOR        ; 0a
	const SPRITE_ANIM_FUNC_POKEGEAR_ARROW            ; 0b
	const SPRITE_ANIM_FUNC_TRADE_POKE_BALL           ; 0c
	const SPRITE_ANIM_FUNC_TRADE_TUBE_BULGE          ; 0d
	const SPRITE_ANIM_FUNC_TRADEMON_IN_TUBE          ; 0e
	const SPRITE_ANIM_FUNC_REVEAL_NEW_MON            ; 0f
	const SPRITE_ANIM_FUNC_RADIO_TUNING_KNOB         ; 10
	const SPRITE_ANIM_FUNC_CUT_LEAVES                ; 11
	const SPRITE_ANIM_FUNC_FLY_FROM                  ; 12
	const SPRITE_ANIM_FUNC_FLY_LEAF                  ; 13
	const SPRITE_ANIM_FUNC_FLY_TO                    ; 14
	const SPRITE_ANIM_FUNC_INTRO_SUICUNE             ; 15
	const SPRITE_ANIM_FUNC_INTRO_PICHU_WOOPER        ; 16
	const SPRITE_ANIM_FUNC_CELEBI                    ; 17
	const SPRITE_ANIM_FUNC_INTRO_UNOWN               ; 18
	const SPRITE_ANIM_FUNC_INTRO_UNOWN_F             ; 19
	const SPRITE_ANIM_FUNC_INTRO_SUICUNE_AWAY        ; 1a
	const SPRITE_ANIM_FUNC_PC_CURSOR                 ; 1b
	const SPRITE_ANIM_FUNC_PC_QUICK                  ; 1c
	const SPRITE_ANIM_FUNC_PC_MODE                   ; 1d
	const SPRITE_ANIM_FUNC_PC_PACK                   ; 1e
	const SPRITE_ANIM_FUNC_COVER                     ; 1f
; Surfing Pikachu minigame callbacks (see SurfingPikachuObjectCallbacks)
	const SPRITE_ANIM_FUNC_SURF_NOP                  ; 20
	const SPRITE_ANIM_FUNC_SURF_PIKACHU              ; 21
	const SPRITE_ANIM_FUNC_SURF_MOVE_BANNER          ; 22
	const SPRITE_ANIM_FUNC_SURF_FLIPPING_PIKA        ; 23
	const SPRITE_ANIM_FUNC_SURF_INTRO_PIKACHU        ; 24
DEF NUM_SPRITE_ANIM_FUNCS EQU const_value

; SpriteAnimFrameData indexes (see data/sprite_anims/framesets.asm)
	const_def
	const SPRITE_ANIM_FRAMESET_00                        ; 00
	const SPRITE_ANIM_FRAMESET_PARTY_MON                 ; 01
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL       ; 02
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM       ; 03
	const SPRITE_ANIM_FRAMESET_PARTY_MON_FAST            ; 04
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL_FAST  ; 05
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM_FAST  ; 06
	const SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR         ; 07
	const SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR_BIG     ; 08
	const SPRITE_ANIM_FRAMESET_GAMEFREAK_LOGO            ; 09
	const SPRITE_ANIM_FRAMESET_SLOTS_GOLEM               ; 0a
	const SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY             ; 0b
	const SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY_2           ; 0c
	const SPRITE_ANIM_FRAMESET_SLOTS_EGG                 ; 0d
	const SPRITE_ANIM_FRAMESET_RED_WALK                  ; 0e
	const SPRITE_ANIM_FRAMESET_STILL_CURSOR              ; 0f
	const SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL           ; 10
	const SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL_WOBBLE    ; 11
	const SPRITE_ANIM_FRAMESET_TRADE_POOF                ; 12
	const SPRITE_ANIM_FRAMESET_TRADE_TUBE_BULGE          ; 13
	const SPRITE_ANIM_FRAMESET_TRADEMON_ICON             ; 14
	const SPRITE_ANIM_FRAMESET_TRADEMON_BUBBLE           ; 15
	const SPRITE_ANIM_FRAMESET_EVOLUTION_BALL_OF_LIGHT   ; 16
	const SPRITE_ANIM_FRAMESET_RADIO_TUNING_KNOB         ; 17
	const SPRITE_ANIM_FRAMESET_MAGNET_TRAIN_RED          ; 18
	const SPRITE_ANIM_FRAMESET_UNUSED_1C                 ; 19
	const SPRITE_ANIM_FRAMESET_LEAF                      ; 1a
	const SPRITE_ANIM_FRAMESET_CUT_TREE                  ; 1b
	const SPRITE_ANIM_FRAMESET_EGG_CRACK                 ; 1c
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_1               ; 1d
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_2               ; 1e
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_3               ; 1f
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_4               ; 20
	const SPRITE_ANIM_FRAMESET_HEADBUTT                  ; 21
	const SPRITE_ANIM_FRAMESET_BLUE_WALK                 ; 22
	const SPRITE_ANIM_FRAMESET_MAGNET_TRAIN_BLUE         ; 23
	const SPRITE_ANIM_FRAMESET_INTRO_SUICUNE             ; 24
	const SPRITE_ANIM_FRAMESET_INTRO_SUICUNE_2           ; 25
	const SPRITE_ANIM_FRAMESET_INTRO_PICHU               ; 26
	const SPRITE_ANIM_FRAMESET_INTRO_WOOPER              ; 27
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_1             ; 28
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_2             ; 29
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_3             ; 2a
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_4             ; 2b
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_F_2           ; 2c
	const SPRITE_ANIM_FRAMESET_INTRO_SUICUNE_AWAY        ; 2d
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_F             ; 2e
	const SPRITE_ANIM_FRAMESET_CELEBI_LEFT               ; 2f
	const SPRITE_ANIM_FRAMESET_CELEBI_RIGHT              ; 30
	const SPRITE_ANIM_FRAMESET_PC_CURSOR                 ; 31
	const SPRITE_ANIM_FRAMESET_PC_CURSOR_ITEM            ; 32
	const SPRITE_ANIM_FRAMESET_PC_QUICK                  ; 33
	const SPRITE_ANIM_FRAMESET_PC_MODE                   ; 34
	const SPRITE_ANIM_FRAMESET_PC_MODE2                  ; 35
	const SPRITE_ANIM_FRAMESET_PC_PACK                   ; 36
	const SPRITE_ANIM_FRAMESET_SLOTS_COVER_WHITE         ; 37
	const SPRITE_ANIM_FRAMESET_SLOTS_COVER_GREEN         ; 38
	const SPRITE_ANIM_FRAMESET_SURF_PIKACHU              ; 39
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_00              ; 3a
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_01              ; 3b
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_02              ; 3c
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_03              ; 3d
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_04              ; 3e
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_05              ; 3f
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_06              ; 40
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_07              ; 41
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_08              ; 42
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_09              ; 43
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_10              ; 44
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_11              ; 45
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_12              ; 46
	const SPRITE_ANIM_FRAMESET_SURF_ANGLE_13              ; 47
	const SPRITE_ANIM_FRAMESET_SURF_RESULTS_PIKACHU       ; 48
	const SPRITE_ANIM_FRAMESET_SURF_LARGE_SPLASH          ; 49
	const SPRITE_ANIM_FRAMESET_SURF_START_TEXT            ; 4a
	const SPRITE_ANIM_FRAMESET_SURF_OH_NO_TEXT            ; 4b
	const SPRITE_ANIM_FRAMESET_SURF_WATER_SPRAY           ; 4c
	const SPRITE_ANIM_FRAMESET_SURF_PLUS_50               ; 4d
	const SPRITE_ANIM_FRAMESET_SURF_PLUS_150              ; 4e
	const SPRITE_ANIM_FRAMESET_SURF_PLUS_350              ; 4f
	const SPRITE_ANIM_FRAMESET_SURF_PLUS_750              ; 50
	const SPRITE_ANIM_FRAMESET_SURF_PLUS_180              ; 51
	const SPRITE_ANIM_FRAMESET_SURF_PLUS_500              ; 52
	const SPRITE_ANIM_FRAMESET_SURF_INTRO_PIKACHU         ; 53
DEF NUM_SPRITE_ANIM_FRAMESETS EQU const_value

; SpriteAnimOAMData indexes (see data/sprite_anims/oam.asm)
	const_def
	const SPRITE_ANIM_OAMSET_RED_WALK_1                  ; 00
	const SPRITE_ANIM_OAMSET_RED_WALK_2                  ; 01
	const SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR           ; 02
	const SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG       ; 03
	const SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1               ; 04
	const SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2               ; 05
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1             ; 06
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2             ; 07
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3             ; 08
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4             ; 09
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5             ; 0a
	const SPRITE_ANIM_OAMSET_SLOTS_EGG                   ; 0b
	const SPRITE_ANIM_OAMSET_STILL_CURSOR                ; 0c
	const SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1           ; 0d
	const SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2           ; 0e
	const SPRITE_ANIM_OAMSET_TRADE_POOF_1                ; 0f
	const SPRITE_ANIM_OAMSET_TRADE_POOF_2                ; 10
	const SPRITE_ANIM_OAMSET_TRADE_POOF_3                ; 11
	const SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1          ; 12
	const SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2          ; 13
	const SPRITE_ANIM_OAMSET_TRADEMON_ICON_1             ; 14
	const SPRITE_ANIM_OAMSET_TRADEMON_ICON_2             ; 15
	const SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE             ; 16
	const SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1   ; 17
	const SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2   ; 18
	const SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB           ; 19
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1       ; 1a
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2       ; 1b
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1       ; 1c
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2       ; 1d
	const SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1          ; 1e
	const SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2          ; 1f
	const SPRITE_ANIM_OAMSET_UNUSED_43                   ; 20
	const SPRITE_ANIM_OAMSET_UNUSED_44                   ; 21
	const SPRITE_ANIM_OAMSET_UNUSED_45                   ; 22
	const SPRITE_ANIM_OAMSET_UNUSED_46                   ; 23
	const SPRITE_ANIM_OAMSET_UNUSED_47                   ; 24
	const SPRITE_ANIM_OAMSET_UNUSED_48                   ; 25
	const SPRITE_ANIM_OAMSET_UNUSED_49                   ; 26
	const SPRITE_ANIM_OAMSET_UNUSED_4A                   ; 27
	const SPRITE_ANIM_OAMSET_UNUSED_4B                   ; 28
	const SPRITE_ANIM_OAMSET_UNUSED_4C                   ; 29
	const SPRITE_ANIM_OAMSET_UNUSED_4D                   ; 2a
	const SPRITE_ANIM_OAMSET_UNUSED_4E                   ; 2b
	const SPRITE_ANIM_OAMSET_LEAF                        ; 2c
	const SPRITE_ANIM_OAMSET_TREE_1                      ; 2d
	const SPRITE_ANIM_OAMSET_CUT_TREE_2                  ; 2e
	const SPRITE_ANIM_OAMSET_CUT_TREE_3                  ; 2f
	const SPRITE_ANIM_OAMSET_CUT_TREE_4                  ; 30
	const SPRITE_ANIM_OAMSET_EGG_CRACK                   ; 31
	const SPRITE_ANIM_OAMSET_EGG_HATCH                   ; 32
	const SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2             ; 33
	const SPRITE_ANIM_OAMSET_BLUE_WALK_1                 ; 34
	const SPRITE_ANIM_OAMSET_BLUE_WALK_2                 ; 35
	const SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1         ; 36
	const SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2         ; 37
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1             ; 38
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2             ; 39
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3             ; 3a
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4             ; 3b
	const SPRITE_ANIM_OAMSET_INTRO_PICHU_1               ; 3c
	const SPRITE_ANIM_OAMSET_INTRO_PICHU_2               ; 3d
	const SPRITE_ANIM_OAMSET_INTRO_PICHU_3               ; 3e
	const SPRITE_ANIM_OAMSET_INTRO_WOOPER                ; 3f
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_1               ; 40
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_2               ; 41
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_3               ; 42
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1           ; 43
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2           ; 44
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3           ; 45
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4           ; 46
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5           ; 47
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY          ; 48
	const SPRITE_ANIM_OAMSET_CELEBI_1                    ; 49
	const SPRITE_ANIM_OAMSET_CELEBI_2                    ; 4a
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1            ; 4b
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2            ; 4c
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3            ; 4d
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4            ; 4e
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5            ; 4f
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6            ; 50
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7            ; 51
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8            ; 52
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9            ; 53
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10           ; 54
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11           ; 55
	const SPRITE_ANIM_OAMSET_PARTY_MON_1                 ; 56
	const SPRITE_ANIM_OAMSET_PARTY_MON_2                 ; 57
	const SPRITE_ANIM_OAMSET_PC_CURSOR                   ; 58
	const SPRITE_ANIM_OAMSET_PC_CURSOR_ITEM              ; 59
	const SPRITE_ANIM_OAMSET_PC_QUICK                    ; 5a
	const SPRITE_ANIM_OAMSET_PC_MODE                     ; 5b
	const SPRITE_ANIM_OAMSET_PC_MODE2                    ; 5c
	const SPRITE_ANIM_OAMSET_PC_PACK                     ; 5d
	const SPRITE_ANIM_OAMSET_SLOTS_COVER_WHITE           ; 5e
	const SPRITE_ANIM_OAMSET_SLOTS_COVER_GREEN           ; 5f
	const SPRITE_ANIM_OAMSET_SURF_PIKACHU                ; 60
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_00                ; 61
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_01                ; 62
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_02                ; 63
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_03                ; 64
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_04                ; 65
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_05                ; 66
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_06                ; 67
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_07                ; 68
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_08                ; 69
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_09                ; 6a
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_10                ; 6b
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_11                ; 6c
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_12                ; 6d
	const SPRITE_ANIM_OAMSET_SURF_ANGLE_13                ; 6e
	const SPRITE_ANIM_OAMSET_SURF_SMALL_SPLASH           ; 6f
	const SPRITE_ANIM_OAMSET_SURF_LARGE_SPLASH           ; 70
	const SPRITE_ANIM_OAMSET_SURF_START_TEXT             ; 71
	const SPRITE_ANIM_OAMSET_SURF_OH_NO_TEXT             ; 72
	const SPRITE_ANIM_OAMSET_SURF_WATER_SPRAY            ; 73
	const SPRITE_ANIM_OAMSET_SURF_PLUS_50                ; 74
	const SPRITE_ANIM_OAMSET_SURF_PLUS_150               ; 75
	const SPRITE_ANIM_OAMSET_SURF_PLUS_350               ; 76
	const SPRITE_ANIM_OAMSET_SURF_PLUS_750               ; 77
	const SPRITE_ANIM_OAMSET_SURF_PLUS_180               ; 78
	const SPRITE_ANIM_OAMSET_SURF_PLUS_500               ; 79
	const SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU          ; 7a
	const SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU_2        ; 7b
	const SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU_3        ; 7c
	const SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU_4        ; 7d
	const SPRITE_ANIM_OAMSET_SURF_EMPTY_BOARD            ; 7e
	const SPRITE_ANIM_OAMSET_SURF_RESULTS_PIKACHU_1      ; 7f
	const SPRITE_ANIM_OAMSET_SURF_RESULTS_PIKACHU_2      ; 80
DEF TYPE_ICON_FIRST_OAM EQU 15
DEF NUM_SPRITE_ANIM_OAMSETS EQU const_value

assert NUM_SPRITE_ANIM_OAMSETS <= FIRST_OAM_CMD, \
	"SPRITE_ANIM_OAMSET_* constants overlap oam*_command constants"
