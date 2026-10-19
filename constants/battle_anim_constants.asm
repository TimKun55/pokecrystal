; battle_anim_struct members (see macros/ram.asm)
rsreset
DEF BATTLEANIMSTRUCT_INDEX           rb ; 00
DEF BATTLEANIMSTRUCT_OAMFLAGS        rb ; 01
DEF BATTLEANIMSTRUCT_FIX_Y           rb ; 02
DEF BATTLEANIMSTRUCT_FRAMESET_ID     rb ; 03
DEF BATTLEANIMSTRUCT_FUNCTION        rb ; 04
DEF BATTLEANIMSTRUCT_PALETTE         rb ; 05
DEF BATTLEANIMSTRUCT_TILEID          rb ; 06
DEF BATTLEANIMOBJ_LENGTH EQU _RS - 1 ; discount BATTLEANIMSTRUCT_INDEX
DEF BATTLEANIMSTRUCT_XCOORD          rb ; 07
DEF BATTLEANIMSTRUCT_YCOORD          rb ; 08
DEF BATTLEANIMSTRUCT_XOFFSET         rb ; 09
DEF BATTLEANIMSTRUCT_YOFFSET         rb ; 0a
DEF BATTLEANIMSTRUCT_PARAM           rb ; 0b
DEF BATTLEANIMSTRUCT_DURATION        rb ; 0c
DEF BATTLEANIMSTRUCT_FRAME           rb ; 0d
DEF BATTLEANIMSTRUCT_JUMPTABLE_INDEX rb ; 0e
DEF BATTLEANIMSTRUCT_VAR1            rb ; 0f
DEF BATTLEANIMSTRUCT_VAR2            rb ; 10
DEF BATTLEANIMSTRUCT_VAR3            rb ; 11
DEF BATTLEANIMSTRUCT_VAR4            rb ; 12
                                     rb_skip 5
DEF BATTLEANIMSTRUCT_LENGTH EQU _RS
DEF NUM_BATTLE_ANIM_STRUCTS EQU 10 ; see wActiveAnimObjects

; wBattleAnimTileDict size (see wram.asm)
DEF NUM_BATTLEANIMTILEDICT_ENTRIES EQU 5

; Start tile for battle animation graphics
DEF BATTLEANIM_BASE_TILE EQU 7 * 7  ; Maximum size of a pokemon picture

; BattleAnimObjects indexes (see data/battle_anims/objects.asm)
	const_def
	const BATTLE_ANIM_OBJ_HIT_BIG_YFIX        ; 00
	const BATTLE_ANIM_OBJ_HIT_YFIX            ; 01
	const BATTLE_ANIM_OBJ_HIT_SMALL_YFIX      ; 02
	const BATTLE_ANIM_OBJ_HIT_BIG             ; 03
	const BATTLE_ANIM_OBJ_HIT                 ; 04
	const BATTLE_ANIM_OBJ_HIT_SMALL           ; 05
	const BATTLE_ANIM_OBJ_PUNCH               ; 06
	const BATTLE_ANIM_OBJ_KICK                ; 07
	const BATTLE_ANIM_OBJ_PALM                ; 08
	const BATTLE_ANIM_OBJ_FANG                ; 09
	const BATTLE_ANIM_OBJ_PUNCH_SHAKE         ; 0a
	const BATTLE_ANIM_OBJ_EMBER               ; 0b
	const BATTLE_ANIM_OBJ_DRAGON_RAGE         ; 0c
	const BATTLE_ANIM_OBJ_FLAMETHROWER        ; 0d
	const BATTLE_ANIM_OBJ_FIRE_SPIN           ; 0e
	const BATTLE_ANIM_OBJ_FIRE_BLAST          ; 0f
	const BATTLE_ANIM_OBJ_BURNED              ; 10
	const BATTLE_ANIM_OBJ_BLIZZARD            ; 11
	const BATTLE_ANIM_OBJ_ICE                 ; 12
	const BATTLE_ANIM_OBJ_ICE_BEAM            ; 13
	const BATTLE_ANIM_OBJ_RAZOR_LEAF          ; 14
	const BATTLE_ANIM_OBJ_POKE_BALL           ; 15
	const BATTLE_ANIM_OBJ_POKE_BALL_BG        ; 16
	const BATTLE_ANIM_OBJ_POKE_BALL_BLOCKED   ; 17
	const BATTLE_ANIM_OBJ_EXPLOSION1          ; 18
	const BATTLE_ANIM_OBJ_EXPLOSION2          ; 19
	const BATTLE_ANIM_OBJ_ACID                ; 1a
	const BATTLE_ANIM_OBJ_SLUDGE              ; 1b
	const BATTLE_ANIM_OBJ_ICE_SPEAR           ; 1c
	const BATTLE_ANIM_OBJ_BALL_POOF           ; 1d
	const BATTLE_ANIM_OBJ_BIG_ROCK            ; 1e
	const BATTLE_ANIM_OBJ_SMALL_ROCK          ; 1f
	const BATTLE_ANIM_OBJ_STRENGTH            ; 20
	const BATTLE_ANIM_OBJ_SEISMIC_TOSS        ; 21
	const BATTLE_ANIM_OBJ_BUBBLE              ; 22
	const BATTLE_ANIM_OBJ_SURF                ; 23
	const BATTLE_ANIM_OBJ_SING                ; 24
	const BATTLE_ANIM_OBJ_WATER_GUN           ; 25
	const BATTLE_ANIM_OBJ_HYDRO_PUMP          ; 26
	const BATTLE_ANIM_OBJ_POWDER              ; 27
	const BATTLE_ANIM_OBJ_BEAM                ; 28
	const BATTLE_ANIM_OBJ_BEAM_TIP            ; 29
	const BATTLE_ANIM_OBJ_ICE_BUILDUP         ; 2a
	const BATTLE_ANIM_OBJ_FROZEN              ; 2b
	const BATTLE_ANIM_OBJ_MASTER_BALL_SPARKLE ; 2c
	const BATTLE_ANIM_OBJ_RECOVER             ; 2d
	const BATTLE_ANIM_OBJ_THUNDER_CENTER      ; 2e
	const BATTLE_ANIM_OBJ_THUNDER_LEFT        ; 2f
	const BATTLE_ANIM_OBJ_THUNDER_RIGHT       ; 30
	const BATTLE_ANIM_OBJ_THUNDER_WAVE        ; 31
	const BATTLE_ANIM_OBJ_THUNDERBOLT_SPARKS  ; 32
	const BATTLE_ANIM_OBJ_THUNDERBOLT_CORE    ; 33
	const BATTLE_ANIM_OBJ_THUNDERSHOCK_SPARKS ; 34
	const BATTLE_ANIM_OBJ_THUNDERSHOCK_CORE   ; 35
	const BATTLE_ANIM_OBJ_ROCK_BLAST          ; 36
	const BATTLE_ANIM_OBJ_BITE                ; 37
	const BATTLE_ANIM_OBJ_CUT_DOWN_LEFT       ; 38
	const BATTLE_ANIM_OBJ_CUT_UP_RIGHT        ; 39
	const BATTLE_ANIM_OBJ_CUT_LONG_DOWN_LEFT  ; 3a
	const BATTLE_ANIM_OBJ_CUT_LONG_DOWN_RIGHT ; 3b
	const BATTLE_ANIM_OBJ_SOLAR_BEAM_CHARGE   ; 3c
	const BATTLE_ANIM_OBJ_ABSORB_CENTER       ; 3d
	const BATTLE_ANIM_OBJ_GUST                ; 3e
	const BATTLE_ANIM_OBJ_VINE_WHIP1          ; 3f
	const BATTLE_ANIM_OBJ_VINE_WHIP2          ; 40
	const BATTLE_ANIM_OBJ_RAZOR_WIND1         ; 41
	const BATTLE_ANIM_OBJ_RAZOR_WIND2         ; 42
	const BATTLE_ANIM_OBJ_SONICBOOM_JP        ; 43
	const BATTLE_ANIM_OBJ_WARP                ; 44
	const BATTLE_ANIM_OBJ_ABSORB              ; 45
	const BATTLE_ANIM_OBJ_FOCUS               ; 46
	const BATTLE_ANIM_OBJ_BIND1               ; 47
	const BATTLE_ANIM_OBJ_BIND2               ; 48
	const BATTLE_ANIM_OBJ_LEECH_SEED          ; 49
	const BATTLE_ANIM_OBJ_SOUND               ; 4a
	const BATTLE_ANIM_OBJ_WAVE                ; 4b
	const BATTLE_ANIM_OBJ_CONFUSE_RAY         ; 4c
	const BATTLE_ANIM_OBJ_LEER                ; 4d
	const BATTLE_ANIM_OBJ_LEER_TIP            ; 4e
	const BATTLE_ANIM_OBJ_SCREEN              ; 4f
	const BATTLE_ANIM_OBJ_HARDEN              ; 50
	const BATTLE_ANIM_OBJ_CHICK               ; 51
	const BATTLE_ANIM_OBJ_AMNESIA             ; 52
	const BATTLE_ANIM_OBJ_ASLEEP              ; 53
	const BATTLE_ANIM_OBJ_SKULL               ; 54
	const BATTLE_ANIM_OBJ_DIG_SAND            ; 55
	const BATTLE_ANIM_OBJ_DIG_PILE            ; 56
	const BATTLE_ANIM_OBJ_SAND                ; 57
	const BATTLE_ANIM_OBJ_PARALYZED           ; 58
	const BATTLE_ANIM_OBJ_STRING_SHOT         ; 59
	const BATTLE_ANIM_OBJ_HAZE                ; 5a
	const BATTLE_ANIM_OBJ_MIST                ; 5b
	const BATTLE_ANIM_OBJ_SMOG                ; 5c
	const BATTLE_ANIM_OBJ_HORN                ; 5d
	const BATTLE_ANIM_OBJ_NEEDLE              ; 5e
	const BATTLE_ANIM_OBJ_PETAL_DANCE         ; 5f
	const BATTLE_ANIM_OBJ_SLUDGE_BOMB         ; 60
	const BATTLE_ANIM_OBJ_PAY_DAY             ; 61
	const BATTLE_ANIM_OBJ_ENERGY_BALL         ; 62
	const BATTLE_ANIM_OBJ_MIMIC               ; 63
	const BATTLE_ANIM_OBJ_ATTRACT             ; 64
	const BATTLE_ANIM_OBJ_ROCK_TOMB           ; 65
	const BATTLE_ANIM_OBJ_BONE_CLUB           ; 66
	const BATTLE_ANIM_OBJ_STONE_EDGE_STILL    ; 67
	const BATTLE_ANIM_OBJ_SWIFT               ; 68
	const BATTLE_ANIM_OBJ_STONE_EDGE          ; 69
	const BATTLE_ANIM_OBJ_FLASH               ; 6a
	const BATTLE_ANIM_OBJ_SHINY               ; 6b
	const BATTLE_ANIM_OBJ_DRAGON_PULSE        ; 6c
	const BATTLE_ANIM_OBJ_LICK                ; 6d
	const BATTLE_ANIM_OBJ_SHOOTING_HEART      ; 6e
	const BATTLE_ANIM_OBJ_GROWTH              ; 6f
	const BATTLE_ANIM_OBJ_ICE_SPLASH          ; 70
	const BATTLE_ANIM_OBJ_SMOKE               ; 71
	const BATTLE_ANIM_OBJ_SMOKESCREEN         ; 72
	const BATTLE_ANIM_OBJ_SWORDS_DANCE        ; 73
	const BATTLE_ANIM_OBJ_SPEED_LINE          ; 74
	const BATTLE_ANIM_OBJ_HURRICANE           ; 75
	const BATTLE_ANIM_OBJ_DEFENSE_CURL        ; 76
	const BATTLE_ANIM_OBJ_METRONOME_HAND      ; 77
	const BATTLE_ANIM_OBJ_METRONOME_SPARKLE   ; 78
	const BATTLE_ANIM_OBJ_DISABLE             ; 79
	const BATTLE_ANIM_OBJ_AGILITY             ; 7a
	const BATTLE_ANIM_OBJ_HEART               ; 7b
	const BATTLE_ANIM_OBJ_FLAME_WHEEL         ; 7c
	const BATTLE_ANIM_OBJ_SACRED_FIRE         ; 7d
	const BATTLE_ANIM_OBJ_COTTON_SPORE        ; 7e
	const BATTLE_ANIM_OBJ_ANGER               ; 7f
	const BATTLE_ANIM_OBJ_HEAL_BELL           ; 80
	const BATTLE_ANIM_OBJ_HEAL_BELL_NOTE      ; 81
	const BATTLE_ANIM_OBJ_BATON_PASS          ; 82
	const BATTLE_ANIM_OBJ_LOCK_ON             ; 83
	const BATTLE_ANIM_OBJ_BULK_UP             ; 84
	const BATTLE_ANIM_OBJ_SAFEGUARD           ; 85
	const BATTLE_ANIM_OBJ_PROTECT             ; 86
	const BATTLE_ANIM_OBJ_THIEF               ; 87
	const BATTLE_ANIM_OBJ_PRESENT             ; 88
	const BATTLE_ANIM_OBJ_SPIKES              ; 89
	const BATTLE_ANIM_OBJ_POWDER_SNOW         ; 8a
	const BATTLE_ANIM_OBJ_DRAGONBREATH        ; 8b
	const BATTLE_ANIM_OBJ_CONVERSION          ; 8c
	const BATTLE_ANIM_OBJ_SMALL_GLOW          ; 8d
	const BATTLE_ANIM_OBJ_CAKE                ; 8e
	const BATTLE_ANIM_OBJ_NIGHTMARE           ; 8f
	const BATTLE_ANIM_OBJ_IN_NIGHTMARE        ; 90
	const BATTLE_ANIM_OBJ_KARATE_CHOP         ; 91
	const BATTLE_ANIM_OBJ_SWEET_KISS          ; 92
	const BATTLE_ANIM_OBJ_SKETCH              ; 93
	const BATTLE_ANIM_OBJ_ENCORE_HAND         ; 94
	const BATTLE_ANIM_OBJ_ENCORE_STAR         ; 95
	const BATTLE_ANIM_OBJ_DESTINY_BOND        ; 96
	const BATTLE_ANIM_OBJ_MORNING_SUN         ; 97
	const BATTLE_ANIM_OBJ_GLIMMER             ; 98
	const BATTLE_ANIM_OBJ_HIDDEN_POWER        ; 99
	const BATTLE_ANIM_OBJ_CROSS_CHOP1         ; 9a
	const BATTLE_ANIM_OBJ_CROSS_CHOP2         ; 9b
	const BATTLE_ANIM_OBJ_SANDSTORM           ; 9c
	const BATTLE_ANIM_OBJ_ZAP_CANNON          ; 9d
	const BATTLE_ANIM_OBJ_SPITE               ; 9e
	const BATTLE_ANIM_OBJ_CURSE               ; 9f
	const BATTLE_ANIM_OBJ_ICICLE_CRASH        ; a0
	const BATTLE_ANIM_OBJ_FORESIGHT           ; a1
	const BATTLE_ANIM_OBJ_RAPID_SPIN          ; a2
	const BATTLE_ANIM_OBJ_SWAGGER             ; a3
	const BATTLE_ANIM_OBJ_BELLY_DRUM_HAND     ; a4
	const BATTLE_ANIM_OBJ_BELLY_DRUM_NOTE     ; a5
	const BATTLE_ANIM_OBJ_MEAN_LOOK           ; a6
	const BATTLE_ANIM_OBJ_BETA_PURSUIT        ; a7
	const BATTLE_ANIM_OBJ_SHOOTING_SPARKLE    ; a8
	const BATTLE_ANIM_OBJ_RAIN                ; a9
	const BATTLE_ANIM_OBJ_GROWING_BALL        ; aa
	const BATTLE_ANIM_OBJ_NASTY_PLOT          ; ab
	const BATTLE_ANIM_OBJ_ANCIENTPOWER        ; ac
	const BATTLE_ANIM_OBJ_AEROBLAST           ; ad
	const BATTLE_ANIM_OBJ_SHADOW_BALL         ; ae
	const BATTLE_ANIM_OBJ_ROCK_SMASH          ; af
	const BATTLE_ANIM_OBJ_FLOWER              ; b0
	const BATTLE_ANIM_OBJ_COTTON              ; b1
	const BATTLE_ANIM_OBJ_ENEMYFEET_1ROW      ; b2
	const BATTLE_ANIM_OBJ_PLAYERHEAD_1ROW     ; b3
	const BATTLE_ANIM_OBJ_ENEMYFEET_2ROW      ; b4
	const BATTLE_ANIM_OBJ_PLAYERHEAD_2ROW     ; b5
	const BATTLE_ANIM_OBJ_HAIL                ; b6
	const BATTLE_ANIM_OBJ_SHRINKING_RING_SMALL ; b7
	const BATTLE_ANIM_OBJ_SHRINKING_RING_BIG  ; b8
	const BATTLE_ANIM_OBJ_RISING_BUBBLE       ; b9
	const BATTLE_ANIM_OBJ_BUBBLE_SPLASH       ; ba
	const BATTLE_ANIM_OBJ_SIGNAL_BEAM_R       ; bb
	const BATTLE_ANIM_OBJ_SIGNAL_BEAM_B       ; bc
	const BATTLE_ANIM_OBJ_HYDRO_PUMP_SHOT     ; bd
	const BATTLE_ANIM_OBJ_HEART_BURST         ; be
	const BATTLE_ANIM_OBJ_STAR_BURST          ; bf
	const BATTLE_ANIM_OBJ_WHIRLPOOL           ; c0
	const BATTLE_ANIM_OBJ_FOCUS_BLAST         ; c1
	const BATTLE_ANIM_OBJ_HEAT_WAVE           ; c2
	const BATTLE_ANIM_OBJ_PETAL_DANCE_IMPACT  ; c3
	const BATTLE_ANIM_OBJ_GUNK_SHOT           ; c4
	const BATTLE_ANIM_OBJ_STAT_UP             ; c5
	const BATTLE_ANIM_OBJ_STAT_DOWN           ; c6
	const BATTLE_ANIM_OBJ_SWIRL_SHORT         ; c7
	const BATTLE_ANIM_OBJ_VORTEX              ; c8
	const BATTLE_ANIM_OBJ_RADIAL_FLAME        ; c9
	const BATTLE_ANIM_OBJ_RISING_MOON         ; ca
	const BATTLE_ANIM_OBJ_RISING_SPARKLE      ; cb
	const BATTLE_ANIM_OBJ_GLIMMER_YFIX        ; cc
	const BATTLE_ANIM_OBJ_PULSING_SPARKLE_YFIX ; cd
DEF NUM_BATTLE_ANIM_OBJS EQU const_value

; DoBattleAnimFrame arguments (see engine/battle_anims/functions.asm)
	const_def
	const BATTLE_ANIM_FUNC_NULL                      ; 00
	const BATTLE_ANIM_FUNC_USER_TO_TARGET            ; 01
	const BATTLE_ANIM_FUNC_USER_TO_TARGET_DISAPPEAR  ; 02
	const BATTLE_ANIM_FUNC_MOVE_IN_CIRCLE            ; 03
	const BATTLE_ANIM_FUNC_WAVE_TO_TARGET            ; 04
	const BATTLE_ANIM_FUNC_THROW_TO_TARGET_DISAPPEAR ; 05
	const BATTLE_ANIM_FUNC_DROP                      ; 06
	const BATTLE_ANIM_FUNC_USER_TO_TARGET_SPIN       ; 07
	const BATTLE_ANIM_FUNC_SHAKE                     ; 08
	const BATTLE_ANIM_FUNC_FIRE_BLAST                ; 09
	const BATTLE_ANIM_FUNC_RAZOR_LEAF                ; 0a
	const BATTLE_ANIM_FUNC_BUBBLE                    ; 0b
	const BATTLE_ANIM_FUNC_SURF                      ; 0c
	const BATTLE_ANIM_FUNC_SING                      ; 0d
	const BATTLE_ANIM_FUNC_WATER_GUN                 ; 0e
	const BATTLE_ANIM_FUNC_EMBER                     ; 0f
	const BATTLE_ANIM_FUNC_POWDER                    ; 10
	const BATTLE_ANIM_FUNC_POKEBALL                  ; 11
	const BATTLE_ANIM_FUNC_POKEBALL_BG               ; 12
	const BATTLE_ANIM_FUNC_POKEBALL_BLOCKED          ; 13
	const BATTLE_ANIM_FUNC_RECOVER                   ; 14
	const BATTLE_ANIM_FUNC_THUNDER_WAVE              ; 15
	const BATTLE_ANIM_FUNC_CLAMP_ENCORE              ; 16
	const BATTLE_ANIM_FUNC_BITE                      ; 17
	const BATTLE_ANIM_FUNC_SOLAR_BEAM                ; 18
	const BATTLE_ANIM_FUNC_GUST                      ; 19
	const BATTLE_ANIM_FUNC_RAZOR_WIND                ; 1a
	const BATTLE_ANIM_FUNC_KICK                      ; 1b
	const BATTLE_ANIM_FUNC_ABSORB                    ; 1c
	const BATTLE_ANIM_FUNC_MOVE_UP                   ; 1d
	const BATTLE_ANIM_FUNC_WRAP                      ; 1e
	const BATTLE_ANIM_FUNC_LEECH_SEED                ; 1f
	const BATTLE_ANIM_FUNC_SOUND                     ; 20
	const BATTLE_ANIM_FUNC_CONFUSE_RAY               ; 21
	const BATTLE_ANIM_FUNC_DIZZY                     ; 22
	const BATTLE_ANIM_FUNC_AMNESIA                   ; 23
	const BATTLE_ANIM_FUNC_FLOAT_UP                  ; 24
	const BATTLE_ANIM_FUNC_DIG                       ; 25
	const BATTLE_ANIM_FUNC_STRING                    ; 26
	const BATTLE_ANIM_FUNC_PARALYZED                 ; 27
	const BATTLE_ANIM_FUNC_SPIRAL_DESCENT            ; 28
	const BATTLE_ANIM_FUNC_ATTRACT                   ; 29
	const BATTLE_ANIM_FUNC_HORN                      ; 2a
	const BATTLE_ANIM_FUNC_NEEDLE                    ; 2b
	const BATTLE_ANIM_FUNC_PETAL_DANCE               ; 2c
	const BATTLE_ANIM_FUNC_THIEF_PAYDAY              ; 2d
	const BATTLE_ANIM_FUNC_ABSORB_CIRCLE             ; 2e
	const BATTLE_ANIM_FUNC_FALL_AND_STOP             ; 2f
	const BATTLE_ANIM_FUNC_SHINY                     ; 30
	const BATTLE_ANIM_FUNC_GROWTH_SWORDS_DANCE       ; 31
	const BATTLE_ANIM_FUNC_SMOKE_FLAME_WHEEL         ; 32
	const BATTLE_ANIM_FUNC_PRESENT_SMOKESCREEN       ; 33
	const BATTLE_ANIM_FUNC_STRENGTH_SEISMIC_TOSS     ; 34
	const BATTLE_ANIM_FUNC_SPEED_LINE                ; 35
	const BATTLE_ANIM_FUNC_SLUDGE                    ; 36
	const BATTLE_ANIM_FUNC_METRONOME_HAND            ; 37
	const BATTLE_ANIM_FUNC_METRONOME_SPARKLE_SKETCH  ; 38
	const BATTLE_ANIM_FUNC_AGILITY                   ; 39
	const BATTLE_ANIM_FUNC_SACRED_FIRE               ; 3a
	const BATTLE_ANIM_FUNC_SAFEGUARD_PROTECT         ; 3b
	const BATTLE_ANIM_FUNC_LOCK_ON                   ; 3c
	const BATTLE_ANIM_FUNC_SPIKES                    ; 3d
	const BATTLE_ANIM_FUNC_HEAL_BELL_NOTES           ; 3e
	const BATTLE_ANIM_FUNC_BATON_PASS                ; 3f
	const BATTLE_ANIM_FUNC_CONVERSION                ; 40
	const BATTLE_ANIM_FUNC_ENCORE_BELLY_DRUM         ; 41
	const BATTLE_ANIM_FUNC_SWAGGER_MORNING_SUN       ; 42
	const BATTLE_ANIM_FUNC_HIDDEN_POWER              ; 43
	const BATTLE_ANIM_FUNC_CURSE                     ; 44
	const BATTLE_ANIM_FUNC_RAPID_SPIN                ; 45
	const BATTLE_ANIM_FUNC_BETA_PURSUIT              ; 46
	const BATTLE_ANIM_FUNC_RAIN_SANDSTORM            ; 47
	const BATTLE_ANIM_FUNC_NASTY_PLOT                ; 48
	const BATTLE_ANIM_FUNC_ANCIENT_POWER             ; 49
	const BATTLE_ANIM_FUNC_ICE_SPLASH                ; 4a
	const BATTLE_ANIM_FUNC_ROCK_SMASH                ; 4b
	const BATTLE_ANIM_FUNC_COTTON                    ; 4c
	const BATTLE_ANIM_FUNC_ROCK_TOMB                 ; 4d
	const BATTLE_ANIM_FUNC_HURRICANE                 ; 4e
	const BATTLE_ANIM_FUNC_RADIAL_MOVE_OUT           ; 4f
	const BATTLE_ANIM_FUNC_STRAIGHT_DESCENT          ; 50
	const BATTLE_ANIM_FUNC_FLAMETHROWER              ; 51
	const BATTLE_ANIM_FUNC_RADIAL_MOVE_OUT_VERY_SLOW ; 52
DEF NUM_BATTLE_ANIM_FUNCS EQU const_value

; BattleAnimFrameData indexes (see data/battle_anims/framesets.asm)
	const_def
	const BATTLE_ANIM_FRAMESET_HIT_BIG               ; 00
	const BATTLE_ANIM_FRAMESET_HIT                   ; 01
	const BATTLE_ANIM_FRAMESET_HIT_SMALL             ; 02
	const BATTLE_ANIM_FRAMESET_PUNCH                 ; 03
	const BATTLE_ANIM_FRAMESET_KICK                  ; 04
	const BATTLE_ANIM_FRAMESET_PALM                  ; 05
	const BATTLE_ANIM_FRAMESET_FANG                  ; 06
	const BATTLE_ANIM_FRAMESET_PUNCH_SHAKE           ; 07
	const BATTLE_ANIM_FRAMESET_BALL_POOF             ; 08
	const BATTLE_ANIM_FRAMESET_POKE_BALL_1           ; 09
	const BATTLE_ANIM_FRAMESET_POKE_BALL_2           ; 0a
	const BATTLE_ANIM_FRAMESET_POKE_BALL_3           ; 0b
	const BATTLE_ANIM_FRAMESET_POKE_BALL_4           ; 0c
	const BATTLE_ANIM_FRAMESET_POKE_BALL_5           ; 0d
	const BATTLE_ANIM_FRAMESET_DRAGON_RAGE           ; 0e
	const BATTLE_ANIM_FRAMESET_FLAMETHROWER          ; 0f
	const BATTLE_ANIM_FRAMESET_EMBER                 ; 10
	const BATTLE_ANIM_FRAMESET_BURNED                ; 11
	const BATTLE_ANIM_FRAMESET_BLIZZARD              ; 12
	const BATTLE_ANIM_FRAMESET_ICE                   ; 13
	const BATTLE_ANIM_FRAMESET_ICE_BEAM              ; 14
	const BATTLE_ANIM_FRAMESET_POWDER_SNOW           ; 15
	const BATTLE_ANIM_FRAMESET_RAZOR_LEAF_1          ; 16
	const BATTLE_ANIM_FRAMESET_RAZOR_LEAF_2          ; 17
	const BATTLE_ANIM_FRAMESET_EXPLOSION             ; 18
	const BATTLE_ANIM_FRAMESET_BIG_ROCK              ; 19
	const BATTLE_ANIM_FRAMESET_SMALL_ROCK            ; 1a
	const BATTLE_ANIM_FRAMESET_STRENGTH              ; 1b
	const BATTLE_ANIM_FRAMESET_SKULL_CROSSBONE       ; 1c
	const BATTLE_ANIM_FRAMESET_ACID                  ; 1d
	const BATTLE_ANIM_FRAMESET_SLUDGE_BUBBLE         ; 1e
	const BATTLE_ANIM_FRAMESET_SLUDGE_BUBBLE_BURST   ; 1f
	const BATTLE_ANIM_FRAMESET_SMALL_BUBBLE          ; 20
	const BATTLE_ANIM_FRAMESET_PULSING_BUBBLE        ; 21
	const BATTLE_ANIM_FRAMESET_SURF                  ; 22
	const BATTLE_ANIM_FRAMESET_MUSIC_NOTE_1          ; 23
	const BATTLE_ANIM_FRAMESET_MUSIC_NOTE_2          ; 24 ; reached via MUSIC_NOTE_1 + param (Sing/Heal Bell)
	const BATTLE_ANIM_FRAMESET_MUSIC_NOTE_3          ; 25 ; reached via MUSIC_NOTE_1 + param (Sing/Heal Bell)
	const BATTLE_ANIM_FRAMESET_WATER_GUN_1           ; 26
	const BATTLE_ANIM_FRAMESET_WATER_GUN_2           ; 27
	const BATTLE_ANIM_FRAMESET_WATER_GUN_3           ; 28
	const BATTLE_ANIM_FRAMESET_HYDRO_PUMP            ; 29
	const BATTLE_ANIM_FRAMESET_POWDER                ; 2a
	const BATTLE_ANIM_FRAMESET_BEAM                  ; 2b
	const BATTLE_ANIM_FRAMESET_BEAM_TIP              ; 2c
	const BATTLE_ANIM_FRAMESET_ICE_BUILDUP           ; 2d
	const BATTLE_ANIM_FRAMESET_FROZEN                ; 2e
	const BATTLE_ANIM_FRAMESET_CIRCLING_SPARKLE      ; 2f
	const BATTLE_ANIM_FRAMESET_THUNDER_CENTER        ; 30
	const BATTLE_ANIM_FRAMESET_THUNDER_LEFT          ; 31
	const BATTLE_ANIM_FRAMESET_THUNDER_RIGHT         ; 32
	const BATTLE_ANIM_FRAMESET_THUNDER_WAVE_DISABLE  ; 33
	const BATTLE_ANIM_FRAMESET_THUNDER_WAVE_EXTRA    ; 34
	const BATTLE_ANIM_FRAMESET_THUNDERBOLT_SPARKS    ; 35
	const BATTLE_ANIM_FRAMESET_THUNDERBOLT_CORE      ; 36
	const BATTLE_ANIM_FRAMESET_THUNDERSHOCK_SPARKS   ; 37
	const BATTLE_ANIM_FRAMESET_THUNDERSHOCK_CORE     ; 38
	const BATTLE_ANIM_FRAMESET_SMALL_GLOW            ; 39
	const BATTLE_ANIM_FRAMESET_TINY_GLOW             ; 3a
	const BATTLE_ANIM_FRAMESET_BITE_1                ; 3b
	const BATTLE_ANIM_FRAMESET_BITE_2                ; 3c
	const BATTLE_ANIM_FRAMESET_CUT_DOWN_LEFT         ; 3d
	const BATTLE_ANIM_FRAMESET_CUT_UP_RIGHT          ; 3e
	const BATTLE_ANIM_FRAMESET_CUT_LONG_DOWN_LEFT    ; 3f
	const BATTLE_ANIM_FRAMESET_CUT_LONG_DOWN_RIGHT   ; 40
	const BATTLE_ANIM_FRAMESET_CHARGE_ORB_1          ; 41
	const BATTLE_ANIM_FRAMESET_ABSORB_CENTER         ; 42
	const BATTLE_ANIM_FRAMESET_GUST                  ; 43
	const BATTLE_ANIM_FRAMESET_VINE_WHIP_1           ; 44
	const BATTLE_ANIM_FRAMESET_VINE_WHIP_2           ; 45
	const BATTLE_ANIM_FRAMESET_RAZOR_WIND_1          ; 46
	const BATTLE_ANIM_FRAMESET_RAZOR_WIND_2          ; 47
	const BATTLE_ANIM_FRAMESET_SONICBOOM_JP          ; 48
	const BATTLE_ANIM_FRAMESET_WARP                  ; 49
	const BATTLE_ANIM_FRAMESET_CHARGE_ORB_2          ; 4a
	const BATTLE_ANIM_FRAMESET_GROWING_BALL          ; 4b
	const BATTLE_ANIM_FRAMESET_WATER_BALL            ; 4c
	const BATTLE_ANIM_FRAMESET_GROWING_BUBBLE        ; 4d
	const BATTLE_ANIM_FRAMESET_FOCUS                 ; 4e
	const BATTLE_ANIM_FRAMESET_BIND_1                ; 4f
	const BATTLE_ANIM_FRAMESET_BIND_2                ; 50 ; reached via BIND_1 + 1 (Wrap)
	const BATTLE_ANIM_FRAMESET_BIND_3                ; 51
	const BATTLE_ANIM_FRAMESET_BIND_4                ; 52 ; reached via BIND_3 + 1 (Wrap)
	const BATTLE_ANIM_FRAMESET_LEECH_SEED_1          ; 53
	const BATTLE_ANIM_FRAMESET_LEECH_SEED_2          ; 54
	const BATTLE_ANIM_FRAMESET_LEECH_SEED_3          ; 55
	const BATTLE_ANIM_FRAMESET_SOUND_1               ; 56
	const BATTLE_ANIM_FRAMESET_SOUND_2               ; 57 ; reached via SOUND_1 + param (Sound)
	const BATTLE_ANIM_FRAMESET_SOUND_3               ; 58 ; reached via SOUND_1 + param (Sound)
	const BATTLE_ANIM_FRAMESET_WAVE                  ; 59
	const BATTLE_ANIM_FRAMESET_CONFUSE_RAY_1         ; 5a
	const BATTLE_ANIM_FRAMESET_CONFUSE_RAY_2         ; 5b ; reached via CONFUSE_RAY_1 + 1 (Confuse Ray)
	const BATTLE_ANIM_FRAMESET_LEER                  ; 5c
	const BATTLE_ANIM_FRAMESET_REFLECT               ; 5d
	const BATTLE_ANIM_FRAMESET_CHICK_1               ; 5e
	const BATTLE_ANIM_FRAMESET_CHICK_2               ; 5f ; reached via CHICK_1 + 1 (Dizzy)
	const BATTLE_ANIM_FRAMESET_AMNESIA_1             ; 60
	const BATTLE_ANIM_FRAMESET_AMNESIA_2             ; 61 ; reached via AMNESIA_1 + param (Amnesia)
	const BATTLE_ANIM_FRAMESET_AMNESIA_3             ; 62 ; reached via AMNESIA_1 + param (Amnesia)
	const BATTLE_ANIM_FRAMESET_ASLEEP                ; 63
	const BATTLE_ANIM_FRAMESET_DIG_SAND              ; 64
	const BATTLE_ANIM_FRAMESET_DIG_PILE              ; 65
	const BATTLE_ANIM_FRAMESET_SAND                  ; 66
	const BATTLE_ANIM_FRAMESET_STRING_SHOT_1         ; 67
	const BATTLE_ANIM_FRAMESET_STRING_SHOT_2         ; 68 ; reached via STRING_SHOT_1 + param (String Shot)
	const BATTLE_ANIM_FRAMESET_STRING_SHOT_3         ; 69 ; reached via STRING_SHOT_1 + param (String Shot)
	const BATTLE_ANIM_FRAMESET_PARALYZED             ; 6a
	const BATTLE_ANIM_FRAMESET_PARALYZED_FLIPPED     ; 6b
	const BATTLE_ANIM_FRAMESET_HAZE                  ; 6c
	const BATTLE_ANIM_FRAMESET_MIST                  ; 6d
	const BATTLE_ANIM_FRAMESET_HORN                  ; 6e
	const BATTLE_ANIM_FRAMESET_NEEDLE                ; 6f
	const BATTLE_ANIM_FRAMESET_FLOWER                ; 70
	const BATTLE_ANIM_FRAMESET_BARRAGE_BALL          ; 71
	const BATTLE_ANIM_FRAMESET_PAY_DAY               ; 72
	const BATTLE_ANIM_FRAMESET_HEART                 ; 73
	const BATTLE_ANIM_FRAMESET_SPINNING_BONE         ; 74
	const BATTLE_ANIM_FRAMESET_STAR                  ; 75
	const BATTLE_ANIM_FRAMESET_STONE_EDGE            ; 76
	const BATTLE_ANIM_FRAMESET_SPARKLE               ; 77
	const BATTLE_ANIM_FRAMESET_DRAGON_PULSE          ; 78
	const BATTLE_ANIM_FRAMESET_LICK                  ; 79
	const BATTLE_ANIM_FRAMESET_SHRINKING_CHARGE_ORB  ; 7a
	const BATTLE_ANIM_FRAMESET_CONVERSION            ; 7b
	const BATTLE_ANIM_FRAMESET_SWORD                 ; 7c
	const BATTLE_ANIM_FRAMESET_SPEED_LINE_1          ; 7d
	const BATTLE_ANIM_FRAMESET_SPEED_LINE_2          ; 7e ; reached via SPEED_LINE_1 + param (Speed Line)
	const BATTLE_ANIM_FRAMESET_SPEED_LINE_3          ; 7f ; reached via SPEED_LINE_1 + param (Speed Line)
	const BATTLE_ANIM_FRAMESET_SEISMIC_TOSS          ; 80
	const BATTLE_ANIM_FRAMESET_GROWING_HEART         ; 81
	const BATTLE_ANIM_FRAMESET_DEFENSE_CURL          ; 82
	const BATTLE_ANIM_FRAMESET_METRONOME_HAND        ; 83
	const BATTLE_ANIM_FRAMESET_AGILITY               ; 84
	const BATTLE_ANIM_FRAMESET_COTTON                ; 85
	const BATTLE_ANIM_FRAMESET_SPIKE                 ; 86
	const BATTLE_ANIM_FRAMESET_ANGER_VEIN            ; 87
	const BATTLE_ANIM_FRAMESET_HEAL_BELL             ; 88
	const BATTLE_ANIM_FRAMESET_BATON_PASS            ; 89
	const BATTLE_ANIM_FRAMESET_LOCK_ON_1             ; 8a
	const BATTLE_ANIM_FRAMESET_LOCK_ON_2             ; 8b ; reached via LOCK_ON_1 + param (Lock On)
	const BATTLE_ANIM_FRAMESET_LOCK_ON_3             ; 8c ; reached via LOCK_ON_1 + param (Lock On)
	const BATTLE_ANIM_FRAMESET_LOCK_ON_4             ; 8d ; reached via LOCK_ON_1 + param (Lock On)
	const BATTLE_ANIM_FRAMESET_SHRINKING_RING_SMALL  ; 8e
	const BATTLE_ANIM_FRAMESET_SHRINKING_RING_BIG    ; 8f
	const BATTLE_ANIM_FRAMESET_ICICLE                ; 90
	const BATTLE_ANIM_FRAMESET_HURRICANE             ; 91
	const BATTLE_ANIM_FRAMESET_SAFEGUARD             ; 92
	const BATTLE_ANIM_FRAMESET_ITEM_BAG              ; 93
	const BATTLE_ANIM_FRAMESET_BULK_UP               ; 94
	const BATTLE_ANIM_FRAMESET_CAKE                  ; 95
	const BATTLE_ANIM_FRAMESET_IMP                   ; 96
	const BATTLE_ANIM_FRAMESET_IMP_FLIPPED           ; 97
	const BATTLE_ANIM_FRAMESET_CHERUB                ; 98
	const BATTLE_ANIM_FRAMESET_PENCIL                ; 99
	const BATTLE_ANIM_FRAMESET_ENCORE_HAND           ; 9a
	const BATTLE_ANIM_FRAMESET_ENCORE_HAND_FLIPPED   ; 9b ; reached via ENCORE_HAND + 1 (Encore, Clamp_Encore flip)
	const BATTLE_ANIM_FRAMESET_DESTINY_BOND          ; 9c
	const BATTLE_ANIM_FRAMESET_MORNING_SUN           ; 9d
	const BATTLE_ANIM_FRAMESET_GLIMMER               ; 9e
	const BATTLE_ANIM_FRAMESET_CROSS_CHOP_1          ; 9f
	const BATTLE_ANIM_FRAMESET_CROSS_CHOP_2          ; a0
	const BATTLE_ANIM_FRAMESET_ZAP_CANNON            ; a1
	const BATTLE_ANIM_FRAMESET_CURSE_NAIL            ; a2
	const BATTLE_ANIM_FRAMESET_FORESIGHT_SHINE       ; a3
	const BATTLE_ANIM_FRAMESET_RAPID_SPIN            ; a4
	const BATTLE_ANIM_FRAMESET_SWAGGER               ; a5
	const BATTLE_ANIM_FRAMESET_MEAN_LOOK             ; a6
	const BATTLE_ANIM_FRAMESET_UPSIDE_DOWN_PUNCH     ; a7
	const BATTLE_ANIM_FRAMESET_GROWING_SPARKLE       ; a8
	const BATTLE_ANIM_FRAMESET_RAIN                  ; a9
	const BATTLE_ANIM_FRAMESET_NASTY_PLOT            ; aa
	const BATTLE_ANIM_FRAMESET_AEROBLAST             ; ab
	const BATTLE_ANIM_FRAMESET_SANDSTORM             ; ac
	const BATTLE_ANIM_FRAMESET_ENEMYFEET_1ROW        ; ad
	const BATTLE_ANIM_FRAMESET_PLAYERHEAD_1ROW       ; ae
	const BATTLE_ANIM_FRAMESET_ENEMYFEET_2ROW        ; af
	const BATTLE_ANIM_FRAMESET_PLAYERHEAD_2ROW       ; b0
	const BATTLE_ANIM_FRAMESET_HAIL                  ; b1
	const BATTLE_ANIM_FRAMESET_SWIRL_SHORT           ; b2
	const BATTLE_ANIM_FRAMESET_VORTEX                ; b3
	const BATTLE_ANIM_FRAMESET_FIRE_BLAST_IMPACT     ; b4
	const BATTLE_ANIM_FRAMESET_BUBBLE_SPLASH         ; b5
	const BATTLE_ANIM_FRAMESET_SPARKLE_LONG          ; b6
	const BATTLE_ANIM_FRAMESET_PULSING_SPARKLE       ; b7
DEF NUM_BATTLE_ANIM_FRAMESETS EQU const_value

; BattleAnimOAMData indexes (see data/battle_anims/oam.asm)
	const_def
	const BATTLE_ANIM_OAMSET_00
	const BATTLE_ANIM_OAMSET_01
	const BATTLE_ANIM_OAMSET_02
	const BATTLE_ANIM_OAMSET_03
	const BATTLE_ANIM_OAMSET_04
	const BATTLE_ANIM_OAMSET_05
	const BATTLE_ANIM_OAMSET_06
	const BATTLE_ANIM_OAMSET_07
	const BATTLE_ANIM_OAMSET_08
	const BATTLE_ANIM_OAMSET_09
	const BATTLE_ANIM_OAMSET_0A
	const BATTLE_ANIM_OAMSET_0B
	const BATTLE_ANIM_OAMSET_0C
	const BATTLE_ANIM_OAMSET_0D
	const BATTLE_ANIM_OAMSET_0E
	const BATTLE_ANIM_OAMSET_0F
	const BATTLE_ANIM_OAMSET_10
	const BATTLE_ANIM_OAMSET_11
	const BATTLE_ANIM_OAMSET_12
	const BATTLE_ANIM_OAMSET_13
	const BATTLE_ANIM_OAMSET_14
	const BATTLE_ANIM_OAMSET_15
	const BATTLE_ANIM_OAMSET_16
	const BATTLE_ANIM_OAMSET_17
	const BATTLE_ANIM_OAMSET_18
	const BATTLE_ANIM_OAMSET_19
	const BATTLE_ANIM_OAMSET_1A
	const BATTLE_ANIM_OAMSET_1B
	const BATTLE_ANIM_OAMSET_1C
	const BATTLE_ANIM_OAMSET_1D
	const BATTLE_ANIM_OAMSET_1E
	const BATTLE_ANIM_OAMSET_1F
	const BATTLE_ANIM_OAMSET_20
	const BATTLE_ANIM_OAMSET_21
	const BATTLE_ANIM_OAMSET_22
	const BATTLE_ANIM_OAMSET_23
	const BATTLE_ANIM_OAMSET_24
	const BATTLE_ANIM_OAMSET_25
	const BATTLE_ANIM_OAMSET_26
	const BATTLE_ANIM_OAMSET_27
	const BATTLE_ANIM_OAMSET_28
	const BATTLE_ANIM_OAMSET_29
	const BATTLE_ANIM_OAMSET_2A
	const BATTLE_ANIM_OAMSET_2B
	const BATTLE_ANIM_OAMSET_2C
	const BATTLE_ANIM_OAMSET_2D
	const BATTLE_ANIM_OAMSET_2E
	const BATTLE_ANIM_OAMSET_2F
	const BATTLE_ANIM_OAMSET_30
	const BATTLE_ANIM_OAMSET_31
	const BATTLE_ANIM_OAMSET_32
	const BATTLE_ANIM_OAMSET_33
	const BATTLE_ANIM_OAMSET_34
	const BATTLE_ANIM_OAMSET_35
	const BATTLE_ANIM_OAMSET_36
	const BATTLE_ANIM_OAMSET_37
	const BATTLE_ANIM_OAMSET_38
	const BATTLE_ANIM_OAMSET_39
	const BATTLE_ANIM_OAMSET_3A
	const BATTLE_ANIM_OAMSET_3B
	const BATTLE_ANIM_OAMSET_3C
	const BATTLE_ANIM_OAMSET_3D
	const BATTLE_ANIM_OAMSET_3E
	const BATTLE_ANIM_OAMSET_3F
	const BATTLE_ANIM_OAMSET_40
	const BATTLE_ANIM_OAMSET_41
	const BATTLE_ANIM_OAMSET_42
	const BATTLE_ANIM_OAMSET_43
	const BATTLE_ANIM_OAMSET_44
	const BATTLE_ANIM_OAMSET_45
	const BATTLE_ANIM_OAMSET_46
	const BATTLE_ANIM_OAMSET_47
	const BATTLE_ANIM_OAMSET_SMALL_RING ; 48
	const BATTLE_ANIM_OAMSET_49
	const BATTLE_ANIM_OAMSET_4A
	const BATTLE_ANIM_OAMSET_4B
	const BATTLE_ANIM_OAMSET_4C
	const BATTLE_ANIM_OAMSET_4D
	const BATTLE_ANIM_OAMSET_4E
	const BATTLE_ANIM_OAMSET_4F
	const BATTLE_ANIM_OAMSET_50
	const BATTLE_ANIM_OAMSET_51
	const BATTLE_ANIM_OAMSET_52
	const BATTLE_ANIM_OAMSET_53
	const BATTLE_ANIM_OAMSET_54
	const BATTLE_ANIM_OAMSET_55
	const BATTLE_ANIM_OAMSET_56
	const BATTLE_ANIM_OAMSET_57
	const BATTLE_ANIM_OAMSET_58
	const BATTLE_ANIM_OAMSET_59
	const BATTLE_ANIM_OAMSET_5A
	const BATTLE_ANIM_OAMSET_5B
	const BATTLE_ANIM_OAMSET_5C
	const BATTLE_ANIM_OAMSET_60
	const BATTLE_ANIM_OAMSET_61
	const BATTLE_ANIM_OAMSET_62
	const BATTLE_ANIM_OAMSET_63
	const BATTLE_ANIM_OAMSET_64
	const BATTLE_ANIM_OAMSET_65
	const BATTLE_ANIM_OAMSET_66
	const BATTLE_ANIM_OAMSET_67
	const BATTLE_ANIM_OAMSET_68
	const BATTLE_ANIM_OAMSET_69
	const BATTLE_ANIM_OAMSET_6A
	const BATTLE_ANIM_OAMSET_6B
	const BATTLE_ANIM_OAMSET_6C
	const BATTLE_ANIM_OAMSET_6D
	const BATTLE_ANIM_OAMSET_6E
	const BATTLE_ANIM_OAMSET_6F
	const BATTLE_ANIM_OAMSET_70
	const BATTLE_ANIM_OAMSET_71
	const BATTLE_ANIM_OAMSET_72
	const BATTLE_ANIM_OAMSET_73
	const BATTLE_ANIM_OAMSET_74
	const BATTLE_ANIM_OAMSET_75
	const BATTLE_ANIM_OAMSET_76
	const BATTLE_ANIM_OAMSET_77
	const BATTLE_ANIM_OAMSET_78
	const BATTLE_ANIM_OAMSET_79
	const BATTLE_ANIM_OAMSET_7A
	const BATTLE_ANIM_OAMSET_7B
	const BATTLE_ANIM_OAMSET_7C
	const BATTLE_ANIM_OAMSET_7D
	const BATTLE_ANIM_OAMSET_7E
	const BATTLE_ANIM_OAMSET_7F
	const BATTLE_ANIM_OAMSET_80
	const BATTLE_ANIM_OAMSET_81
	const BATTLE_ANIM_OAMSET_82
	const BATTLE_ANIM_OAMSET_83
	const BATTLE_ANIM_OAMSET_84
	const BATTLE_ANIM_OAMSET_85
	const BATTLE_ANIM_OAMSET_86
	const BATTLE_ANIM_OAMSET_87
	const BATTLE_ANIM_OAMSET_88
	const BATTLE_ANIM_OAMSET_89
	const BATTLE_ANIM_OAMSET_8A
	const BATTLE_ANIM_OAMSET_8B
	const BATTLE_ANIM_OAMSET_8C
	const BATTLE_ANIM_OAMSET_8D
	const BATTLE_ANIM_OAMSET_8E
	const BATTLE_ANIM_OAMSET_8F
	const BATTLE_ANIM_OAMSET_90
	const BATTLE_ANIM_OAMSET_91
	const BATTLE_ANIM_OAMSET_92
	const BATTLE_ANIM_OAMSET_93
	const BATTLE_ANIM_OAMSET_94
	const BATTLE_ANIM_OAMSET_95
	const BATTLE_ANIM_OAMSET_96
	const BATTLE_ANIM_OAMSET_97
	const BATTLE_ANIM_OAMSET_98
	const BATTLE_ANIM_OAMSET_STONE_EDGE ; 99
	const BATTLE_ANIM_OAMSET_ICICLE ; 9A
	const BATTLE_ANIM_OAMSET_9C
	const BATTLE_ANIM_OAMSET_9D
	const BATTLE_ANIM_OAMSET_9E
	const BATTLE_ANIM_OAMSET_A0
	const BATTLE_ANIM_OAMSET_A1
	const BATTLE_ANIM_OAMSET_A2
	const BATTLE_ANIM_OAMSET_A3
	const BATTLE_ANIM_OAMSET_BULK_UP1 ; A4
	const BATTLE_ANIM_OAMSET_BULK_UP2 ; A5
	const BATTLE_ANIM_OAMSET_BIG_RING1 ; A6
	const BATTLE_ANIM_OAMSET_BIG_RING2 ; A7
	const BATTLE_ANIM_OAMSET_A8
	const BATTLE_ANIM_OAMSET_A9
	const BATTLE_ANIM_OAMSET_AA
	const BATTLE_ANIM_OAMSET_AB
	const BATTLE_ANIM_OAMSET_AC
	const BATTLE_ANIM_OAMSET_AD
	const BATTLE_ANIM_OAMSET_AF
	const BATTLE_ANIM_OAMSET_B0
	const BATTLE_ANIM_OAMSET_B1
	const BATTLE_ANIM_OAMSET_B2
	const BATTLE_ANIM_OAMSET_B3
	const BATTLE_ANIM_OAMSET_B4
	const BATTLE_ANIM_OAMSET_HURRICANE ; B5
	const BATTLE_ANIM_OAMSET_B6
	const BATTLE_ANIM_OAMSET_B8
	const BATTLE_ANIM_OAMSET_B9
	const BATTLE_ANIM_OAMSET_BA
	const BATTLE_ANIM_OAMSET_BB
	const BATTLE_ANIM_OAMSET_BC
	const BATTLE_ANIM_OAMSET_BD
	const BATTLE_ANIM_OAMSET_BE
	const BATTLE_ANIM_OAMSET_BF
	const BATTLE_ANIM_OAMSET_C0
	const BATTLE_ANIM_OAMSET_C1
	const BATTLE_ANIM_OAMSET_C3
	const BATTLE_ANIM_OAMSET_C4
	const BATTLE_ANIM_OAMSET_C5
	const BATTLE_ANIM_OAMSET_C6
	const BATTLE_ANIM_OAMSET_C7
	const BATTLE_ANIM_OAMSET_C8
	const BATTLE_ANIM_OAMSET_C9
	const BATTLE_ANIM_OAMSET_CA
	const BATTLE_ANIM_OAMSET_CB
	const BATTLE_ANIM_OAMSET_CC
	const BATTLE_ANIM_OAMSET_CD
	const BATTLE_ANIM_OAMSET_CE
	const BATTLE_ANIM_OAMSET_CF
	const BATTLE_ANIM_OAMSET_D0
	const BATTLE_ANIM_OAMSET_D1
	const BATTLE_ANIM_OAMSET_D2
	const BATTLE_ANIM_OAMSET_D3
	const BATTLE_ANIM_OAMSET_D4
	const BATTLE_ANIM_OAMSET_D5
	const BATTLE_ANIM_OAMSET_D6
	const BATTLE_ANIM_OAMSET_D7
	const BATTLE_ANIM_OAMSET_HAIL
	const BATTLE_ANIM_OAMSET_D9
	const BATTLE_ANIM_OAMSET_DA
	const BATTLE_ANIM_OAMSET_DB
	const BATTLE_ANIM_OAMSET_DC
	const BATTLE_ANIM_OAMSET_DD
	const BATTLE_ANIM_OAMSET_DE
DEF NUM_BATTLE_ANIM_OAMSETS EQU const_value

assert NUM_BATTLE_ANIM_OAMSETS <= FIRST_OAM_CMD, \
	"BATTLE_ANIM_OAMSET_* constants overlap oam*_command constants"

; BattleBGEffects indexes (see engine/battle_anims/bg_effects.asm)
	const_def 1
	const BATTLE_BG_EFFECT_FLASH_INVERTED                   ; 01
	const BATTLE_BG_EFFECT_FLASH_WHITE                      ; 02
	const BATTLE_BG_EFFECT_WHITE_HUES                       ; 03
	const BATTLE_BG_EFFECT_BLACK_HUES                       ; 04
	const BATTLE_BG_EFFECT_ALTERNATE_HUES                   ; 05
	const BATTLE_BG_EFFECT_CYCLE_OBPALS_GRAY_AND_YELLOW     ; 06
	const BATTLE_BG_EFFECT_CYCLE_MID_OBPALS_GRAY_AND_YELLOW ; 07
	const BATTLE_BG_EFFECT_CYCLE_BGPALS_INVERTED            ; 08
	const BATTLE_BG_EFFECT_HIDE_MON                         ; 09
	const BATTLE_BG_EFFECT_SHOW_MON                         ; 0a
	const BATTLE_BG_EFFECT_ENTER_MON                        ; 0b
	const BATTLE_BG_EFFECT_RETURN_MON                       ; 0c
	const BATTLE_BG_EFFECT_SURF                             ; 0d
	const BATTLE_BG_EFFECT_WHIRLPOOL                        ; 0e
	const BATTLE_BG_EFFECT_TELEPORT                         ; 0f
	const BATTLE_BG_EFFECT_NIGHT_SHADE                      ; 10
	const BATTLE_BG_EFFECT_BATTLEROBJ_1ROW                  ; 11
	const BATTLE_BG_EFFECT_BATTLEROBJ_2ROW                  ; 12
	const BATTLE_BG_EFFECT_DOUBLE_TEAM                      ; 13
	const BATTLE_BG_EFFECT_FADE_MON_TO_LIGHT                ; 14
	const BATTLE_BG_EFFECT_FADE_MON_TO_BLACK                ; 15
	const BATTLE_BG_EFFECT_FADE_MON_TO_LIGHT_REPEATING      ; 16
	const BATTLE_BG_EFFECT_FADE_MON_TO_BLACK_REPEATING      ; 17
	const BATTLE_BG_EFFECT_CYCLE_MON_LIGHT_DARK_REPEATING   ; 18
	const BATTLE_BG_EFFECT_FADE_MONS_TO_BLACK_REPEATING     ; 19
	const BATTLE_BG_EFFECT_FADE_MON_TO_WHITE_WAIT_FADE_BACK ; 1a
	const BATTLE_BG_EFFECT_SHAKE_SCREEN_X                   ; 1b
	const BATTLE_BG_EFFECT_SHAKE_SCREEN_Y                   ; 1c
	const BATTLE_BG_EFFECT_BOUNCE_DOWN                      ; 1d
	const BATTLE_BG_EFFECT_DIG                              ; 1e
	const BATTLE_BG_EFFECT_TACKLE                           ; 1f
	const BATTLE_BG_EFFECT_BODY_SLAM                        ; 20
	const BATTLE_BG_EFFECT_WOBBLE_MON                       ; 21
	const BATTLE_BG_EFFECT_REMOVE_MON                       ; 22
	const BATTLE_BG_EFFECT_WAVE_DEFORM_MON                  ; 23
	const BATTLE_BG_EFFECT_PSYCHIC                          ; 24
	const BATTLE_BG_EFFECT_BETA_PURSUIT                     ; 25
	const BATTLE_BG_EFFECT_ROLLOUT                          ; 26
	const BATTLE_BG_EFFECT_VITAL_THROW                      ; 27
	const BATTLE_BG_EFFECT_START_WATER                      ; 28
	const BATTLE_BG_EFFECT_WATER                            ; 29
	const BATTLE_BG_EFFECT_END_WATER                        ; 2a
	const BATTLE_BG_EFFECT_VIBRATE_MON                      ; 2b
	const BATTLE_BG_EFFECT_WOBBLE_PLAYER                    ; 2c
	const BATTLE_BG_EFFECT_WOBBLE_SCREEN                    ; 2d

; wBattleAnimTileDict keys (see wram.asm)
; AnimObjGFX indexes (see data/battle_anims/object_gfx.asm)
	const_def 1
	const BATTLE_ANIM_GFX_HIT        ; 01
	const BATTLE_ANIM_GFX_CUT        ; 02
	const BATTLE_ANIM_GFX_FIRE       ; 03
	const BATTLE_ANIM_GFX_WATER      ; 04
	const BATTLE_ANIM_GFX_LIGHTNING  ; 05
	const BATTLE_ANIM_GFX_PLANT      ; 06
	const BATTLE_ANIM_GFX_SMOKE      ; 07
	const BATTLE_ANIM_GFX_EXPLOSION  ; 08
	const BATTLE_ANIM_GFX_ROCKS      ; 09
	const BATTLE_ANIM_GFX_ICE        ; 0a
	const BATTLE_ANIM_GFX_POKE_BALL  ; 0b
	const BATTLE_ANIM_GFX_POKE_BALL_BG ; 0c
	const BATTLE_ANIM_GFX_POISON     ; 0d
	const BATTLE_ANIM_GFX_BUBBLE     ; 0e
	const BATTLE_ANIM_GFX_NOISE      ; 0f
	const BATTLE_ANIM_GFX_POWDER     ; 10
	const BATTLE_ANIM_GFX_BEAM       ; 11
	const BATTLE_ANIM_GFX_SPEED      ; 12
	const BATTLE_ANIM_GFX_CHARGE     ; 13
	const BATTLE_ANIM_GFX_WIND       ; 14
	const BATTLE_ANIM_GFX_WHIP       ; 15
	const BATTLE_ANIM_GFX_EGG        ; 16
	const BATTLE_ANIM_GFX_ROPE       ; 17
	const BATTLE_ANIM_GFX_PSYCHIC    ; 18
	const BATTLE_ANIM_GFX_REFLECT    ; 19
	const BATTLE_ANIM_GFX_STATUS     ; 1a
	const BATTLE_ANIM_GFX_SAND       ; 1b
	const BATTLE_ANIM_GFX_WEB        ; 1c
	const BATTLE_ANIM_GFX_HAZE       ; 1d
	const BATTLE_ANIM_GFX_HORN       ; 1e
	const BATTLE_ANIM_GFX_FLOWER     ; 1f
	const BATTLE_ANIM_GFX_MISC       ; 20
	const BATTLE_ANIM_GFX_GLOBE      ; 21
	const BATTLE_ANIM_GFX_SHAPES     ; 22
	const BATTLE_ANIM_GFX_OBJECTS    ; 23
	const BATTLE_ANIM_GFX_SHINE      ; 24
	const BATTLE_ANIM_GFX_ANGELS     ; 25
	const BATTLE_ANIM_GFX_AEROBLAST  ; 26
	const BATTLE_ANIM_GFX_PLAYERHEAD ; 27
	const BATTLE_ANIM_GFX_ENEMYFEET   ; 28
	const BATTLE_ANIM_GFX_ICICLECRASH ; 29
	const BATTLE_ANIM_GFX_HURRICANE   ; 2a
	const BATTLE_ANIM_GFX_BULK_UP     ; 2b
	const BATTLE_ANIM_GFX_RINGS       ; 2c
	const BATTLE_ANIM_GFX_BIG_RINGS   ; 2d
	const BATTLE_ANIM_GFX_GLOW        ; 2e
	const BATTLE_ANIM_GFX_WATER_BALL  ; 2f
	const BATTLE_ANIM_GFX_CHOP        ; 30
	const BATTLE_ANIM_GFX_HEARTS      ; 31
 	const BATTLE_ANIM_GFX_STARS       ; 32
	const BATTLE_ANIM_GFX_BEAM_AURORA ; 33
	const BATTLE_ANIM_GFX_FOCUS_BLAST ; 34
	const BATTLE_ANIM_GFX_PETALS      ; 35
	const BATTLE_ANIM_GFX_MOON        ; 36
	const BATTLE_ANIM_GFX_SWIRL       ; 37
	const BATTLE_ANIM_GFX_VORTEX      ; 38
DEF NUM_BATTLE_ANIM_GFX EQU const_value - 1

; battle_bg_effect struct members (see macros/ram.asm)
rsreset
DEF BG_EFFECT_STRUCT_FUNCTION    rb
DEF BG_EFFECT_STRUCT_JT_INDEX    rb
DEF BG_EFFECT_STRUCT_BATTLE_TURN rb
DEF BG_EFFECT_STRUCT_PARAM       rb
DEF BG_EFFECT_STRUCT_LENGTH EQU _RS
DEF NUM_BG_EFFECTS EQU 5 ; see wActiveBGEffects

; anim_bgeffect battle turn values for some effects
	const_def
	const BG_EFFECT_TARGET ; 0
	const BG_EFFECT_USER   ; 1

; battle palettes
	const_def
	const PAL_BATTLE_BG_PLAYER    ; 0
	const PAL_BATTLE_BG_ENEMY     ; 1
	const PAL_BATTLE_BG_ENEMY_HP  ; 2
	const PAL_BATTLE_BG_PLAYER_HP ; 3
	const PAL_BATTLE_BG_EXP       ; 4
	const PAL_BATTLE_BG_5         ; 5
	const PAL_BATTLE_BG_6         ; 6
	const PAL_BATTLE_BG_TEXT      ; 7
; sentinel palette indices that denote "user" or "target" for battle pics
; (anim_setbgpal applies them to the relevant obj palettes too)
	const PAL_BATTLE_BG_USER       ; 8
	const PAL_BATTLE_BG_TARGET     ; 9

; animation object palettes
	const_def
	const PAL_BATTLE_OB_ENEMY  ; 0
	const PAL_BATTLE_OB_PLAYER ; 1
	const PAL_BATTLE_OB_GRAY   ; 2
	const PAL_BATTLE_OB_YELLOW ; 3
	const PAL_BATTLE_OB_RED    ; 4
	const PAL_BATTLE_OB_GREEN  ; 5
	const PAL_BATTLE_OB_BLUE   ; 6
	const PAL_BATTLE_OB_BROWN  ; 7

; custom bg/obj palettes (see gfx/battle_anims/custom.pal)
; the first 6 matches PAL_BATTLE_OB_GRAY/YELLOW/...
	const_def
	const PAL_BTLCUSTOM_GRAY         ; 00
	const PAL_BTLCUSTOM_YELLOW       ; 01
	const PAL_BTLCUSTOM_RED          ; 02
	const PAL_BTLCUSTOM_GREEN        ; 03
	const PAL_BTLCUSTOM_BLUE         ; 04
	const PAL_BTLCUSTOM_BROWN        ; 05
	const PAL_BTLCUSTOM_METALLIC     ; 06
	const PAL_BTLCUSTOM_PURPLE       ; 07
	const PAL_BTLCUSTOM_ICE          ; 08
	const PAL_BTLCUSTOM_FIRE         ; 09
	const PAL_BTLCUSTOM_AURORA       ; 0a
	const PAL_BTLCUSTOM_DRAGONBREATH ; 0b
	const PAL_BTLCUSTOM_DRAGON_RAGE  ; 0c
	const PAL_BTLCUSTOM_PINK         ; 0d
	const PAL_BTLCUSTOM_SHADOW_BALL  ; 0e
	const PAL_BTLCUSTOM_WATER        ; 0f
	const PAL_BTLCUSTOM_BUBBLE       ; 10
	const PAL_BTLCUSTOM_PEACH        ; 11	
	const PAL_BTLCUSTOM_ACID         ; 12
	const PAL_BTLCUSTOM_BULK_UP      ; 13
	const PAL_BTLCUSTOM_MOON         ; 14
	const PAL_BTLCUSTOM_MOONSHINE    ; 15
	const PAL_BTLCUSTOM_ZAP_CANNON   ; 16
	const PAL_BTLCUSTOM_LIGHTSCREEN  ; 17
	const PAL_BTLCUSTOM_REFLECT      ; 18
DEF NUM_CUSTOM_BATTLE_PALETTES EQU const_value

DEF PAL_BTLCUSTOM_DEFAULT EQU -1
