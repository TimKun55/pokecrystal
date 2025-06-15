; wInputType::
DEF AUTO_INPUT EQU $ff

; wDebugFlags::
	const_def
	const DEBUG_BATTLE_F
	const DEBUG_FIELD_F

; wCurDexMode::
	const_def
	const DEXMODE_JOHTO
	const DEXMODE_NATIONAL
	const DEXMODE_ABC
	const DEXMODE_UNOWN

; wPokedexColor
	const_def
	const DEXCOLOR_RED
	const DEXCOLOR_BLUE
	const DEXCOLOR_PURPLE
	const DEXCOLOR_BROWN
	const DEXCOLOR_GREEN
	const DEXCOLOR_PINK
	const DEXCOLOR_YELLOW
	const DEXCOLOR_CYAN
	const DEXCOLOR_GRAY

; wMonType::
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4
	const BUFFERMON  ; 5

; wGameTimerPaused::
DEF GAME_TIMER_COUNTING_F EQU 0
DEF GAME_TIMER_MOBILE_F   EQU 7

; wJoypadDisable::
DEF JOYPAD_DISABLE_MON_FAINT_F    EQU 6
DEF JOYPAD_DISABLE_SGB_TRANSFER_F EQU 7

; wOptions1::
DEF TEXT_DELAY_MASK EQU %111
	const_def 4
	const NO_TEXT_SCROLL ; 4
	const STEREO         ; 5
	const BATTLE_SHIFT   ; 6
	const BATTLE_SCENE   ; 7

DEF TEXT_DELAY_NONE EQU %000 ; 0
DEF TEXT_DELAY_FAST EQU %001 ; 1
DEF TEXT_DELAY_MED  EQU %011 ; 3
DEF TEXT_DELAY_SLOW EQU %101 ; 5

; wTextboxFrame::
	const_def
	const FRAME_1 ; 0
	const FRAME_2 ; 1
	const FRAME_3 ; 2
	const FRAME_4 ; 3
	const FRAME_5 ; 4
	const FRAME_6 ; 5
	const FRAME_7 ; 6
	const FRAME_8 ; 7
	const FRAME_9 ; 8
DEF NUM_FRAMES EQU const_value

; wTextboxFlags::
	const_def
	const FAST_TEXT_DELAY_F ; 0
	const TEXT_DELAY_F      ; 1

; wGBPrinterBrightness::
DEF GBPRINTER_LIGHTEST EQU $00
DEF GBPRINTER_LIGHTER  EQU $20
DEF GBPRINTER_NORMAL   EQU $40
DEF GBPRINTER_DARKER   EQU $60
DEF GBPRINTER_DARKEST  EQU $7f

; wOptions2::
	const_def
	const MENU_ACCOUNT ; 0

; wWalkingDirection::
	const_def -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
DEF NUM_DIRECTIONS EQU const_value

DEF DOWN_MASK  EQU 1 << DOWN
DEF UP_MASK    EQU 1 << UP
DEF LEFT_MASK  EQU 1 << LEFT
DEF RIGHT_MASK EQU 1 << RIGHT

; wFacingDirection::
	const_def NUM_DIRECTIONS - 1, -1
	shift_const FACE_DOWN  ; 8
	shift_const FACE_UP    ; 4
	shift_const FACE_LEFT  ; 2
	shift_const FACE_RIGHT ; 1
DEF FACE_CURRENT EQU 0

; wStateFlags
DEF SPRITE_UPDATES_DISABLED_F             EQU 0
DEF LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F EQU 1
DEF TEXT_STATE_F                          EQU 6
DEF SCRIPTED_MOVEMENT_STATE_F             EQU 7

; wPokemonWithdrawDepositParameter::
DEF PC_WITHDRAW       EQU 0
DEF PC_DEPOSIT        EQU 1
DEF REMOVE_PARTY      EQU 0
DEF REMOVE_BOX        EQU 1
DEF DAY_CARE_WITHDRAW EQU 2
DEF DAY_CARE_DEPOSIT  EQU 3

; wPlayerStepFlags::
	const_def 4
	const PLAYERSTEP_MIDAIR_F   ; 4
	const PLAYERSTEP_CONTINUE_F ; 5
	const PLAYERSTEP_STOP_F     ; 6
	const PLAYERSTEP_START_F    ; 7

; wInitListType::
DEF INIT_ENEMYOT_LIST    EQU 1
DEF INIT_BAG_ITEM_LIST   EQU 2
DEF INIT_OTHER_ITEM_LIST EQU 3
DEF INIT_PLAYEROT_LIST   EQU 4
DEF INIT_MON_LIST        EQU 5

; wTimeOfDay::
	const_def
	const MORN_F     ; 0
	const DAY_F      ; 1
	const NITE_F     ; 2
	const EVE_F      ; 3
DEF NUM_DAYTIMES EQU const_value

DEF MORN     EQU 1 << MORN_F
DEF DAY      EQU 1 << DAY_F
DEF NITE     EQU 1 << NITE_F
DEF EVE      EQU 1 << EVE_F

DEF ANYTIME EQU MORN | DAY | EVE | NITE

; wTimeOfDayPalset::
; Must be different from any in ReplaceTimeOfDayPals.BrightnessLevels
DEF DARKNESS_PALSET EQU (MORN_F << 6) | (DAY_F << 4) | (EVE_F << 2) | NITE_F

; wBattleAnimFlags::
	const_def
	const BATTLEANIM_STOP_F          ; 0
	const BATTLEANIM_IN_SUBROUTINE_F ; 1
	const BATTLEANIM_IN_LOOP_F       ; 2
	const BATTLEANIM_KEEPSPRITES_F   ; 3

; wPlayerSpriteSetupFlags::
DEF PLAYERSPRITESETUP_FACING_MASK       EQU %11
DEF PLAYERSPRITESETUP_FEMALE_TO_MALE_F  EQU 2
DEF PLAYERSPRITESETUP_CUSTOM_FACING_F   EQU 5
DEF PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F EQU 6
DEF PLAYERSPRITESETUP_RESET_ACTION_F    EQU 7

; wPlayerGender::
DEF PLAYERGENDER_FEMALE_F EQU 0

; wMapStatus::
	const_def
	const MAPSTATUS_START  ; 0
	const MAPSTATUS_ENTER  ; 1
	const MAPSTATUS_HANDLE ; 2
	const MAPSTATUS_DONE   ; 3

; wMapEventStatus::
	const_def
	const MAPEVENTS_ON  ; 0
	const MAPEVENTS_OFF ; 1

; wScriptFlags::
DEF SCRIPT_RUNNING EQU 2

; wScriptMode::
	const_def
	const SCRIPT_OFF
	const SCRIPT_READ
	const SCRIPT_WAIT_MOVEMENT
	const SCRIPT_WAIT

; wSpawnAfterChampion::
DEF SPAWN_LANCE EQU 1
DEF SPAWN_RED   EQU 2

; wCurDay::
	const_def
	const SUNDAY    ; 0
	const MONDAY    ; 1
	const TUESDAY   ; 2
	const WEDNESDAY ; 3
	const THURSDAY  ; 4
	const FRIDAY    ; 5
	const SATURDAY  ; 6

; wStatusFlags::
	const_def
	const STATUSFLAGS_POKEDEX_F                  ; 0
	const STATUSFLAGS_UNOWN_DEX_F                ; 1
	const STATUSFLAGS_FLASH_F                    ; 2
	const STATUSFLAGS_CAUGHT_POKERUS_F           ; 3
	const STATUSFLAGS_ROCKET_SIGNAL_F            ; 4
	const STATUSFLAGS_NO_WILD_ENCOUNTERS_F       ; 5
	const STATUSFLAGS_HALL_OF_FAME_F             ; 6
	const STATUSFLAGS_MAIN_MENU_MOBILE_CHOICES_F ; 7

; wStatusFlags2::
	const_def
	const STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F ; 0
	const STATUSFLAGS2_SAFARI_GAME_F            ; 1
	const STATUSFLAGS2_BUG_CONTEST_TIMER_F      ; 2
	const STATUSFLAGS2_UNUSED_3_F               ; 3
	const STATUSFLAGS2_BIKE_SHOP_CALL_F         ; 4
	const STATUSFLAGS2_UNUSED_5_F               ; 5
	const STATUSFLAGS2_REACHED_GOLDENROD_F      ; 6
	const STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F    ; 7

; wMumSavingMoney::
DEF MUM_SAVING_SOME_MONEY_F EQU 0
DEF MUM_SAVING_HALF_MONEY_F EQU 1
DEF MUM_SAVING_ALL_MONEY_F  EQU 2
DEF MUM_ACTIVE_F            EQU 7

DEF MUM_SAVING_MONEY_MASK EQU (1 << MUM_SAVING_SOME_MONEY_F) | (1 << MUM_SAVING_HALF_MONEY_F) | (1 << MUM_SAVING_ALL_MONEY_F)

; wJohtoBadges::
	const_def
	const ZEPHYRBADGE
	const HIVEBADGE
	const PLAINBADGE
	const FOGBADGE
	const MINERALBADGE
	const STORMBADGE
	const GLACIERBADGE
	const RISINGBADGE
DEF NUM_JOHTO_BADGES EQU const_value

; wKantoBadges::
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
DEF NUM_KANTO_BADGES EQU const_value
DEF NUM_BADGES       EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; wPokegearFlags::
	const_def
	const POKEGEAR_MAP_CARD_F   ; 0
	const POKEGEAR_RADIO_CARD_F ; 1
	const POKEGEAR_PHONE_CARD_F ; 2
	const POKEGEAR_EXPN_CARD_F  ; 3
	const_skip 3
	const POKEGEAR_OBTAINED_F   ; 7

; wWhichRegisteredItem::
DEF REGISTERED_POCKET EQU %11000000
DEF REGISTERED_NUMBER EQU %00111111

; wPlayerState::
DEF PLAYER_NORMAL    EQU 0
DEF PLAYER_BIKE      EQU 1
DEF PLAYER_SKATE     EQU 2
DEF PLAYER_SURF      EQU 4
DEF PLAYER_SURF_PIKA EQU 8

; wPalFadeMode::
DEF PALFADE_WHICH        EQU %11
DEF PALFADE_FLASH_F      EQU 2
DEF PALFADE_PARTIAL_F    EQU 3
DEF PALFADE_SKIP_FIRST_F EQU 4

; hBattlePalFadeMode::
DEF PALFADE_BOTH       EQU %00
DEF PALFADE_BG         EQU %01
DEF PALFADE_OBJ        EQU %10
DEF PALFADE_FLASH      EQU 1 << PALFADE_FLASH_F
DEF PALFADE_PARTIAL    EQU 1 << PALFADE_PARTIAL_F
DEF PALFADE_SKIP_FIRST EQU 1 << PALFADE_SKIP_FIRST_F

; wCelebiEvent::
DEF CELEBIEVENT_FOREST_IS_RESTLESS_F EQU 2

; wBikeFlags::
	const_def
	const BIKEFLAGS_STRENGTH_ACTIVE_F ; 0
	const BIKEFLAGS_ALWAYS_ON_BIKE_F  ; 1
	const BIKEFLAGS_DOWNHILL_F        ; 2

; wDailyFlags1::
	const_def
	const DAILYFLAGS1_KURT_MAKING_BALLS_F             ; 00
	const DAILYFLAGS1_BUG_CONTEST_F                   ; 01
	const DAILYFLAGS1_SWARM_F                         ; 02
	const DAILYFLAGS1_INDIGO_PLATEAU_LYRA_FIGHT       ; 03
	const DAILYFLAGS1_ALL_FRUIT_TREES_F               ; 04
	const DAILYFLAGS1_GOT_SHUCKIE_TODAY_F             ; 05
	const DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F ; 06
	const DAILYFLAGS1_MT_MOON_SQUARE_CLEFAIRY_F       ; 07
	; Gym Leader Rematches
	const DAILYFLAGS_FALKNER_REMATCH                  ; 08
	const DAILYFLAGS_BUGSY_REMATCH                    ; 09
	const DAILYFLAGS_WHITNEY_REMATCH                  ; 0a
	const DAILYFLAGS_MORTY_REMATCH                    ; 0b
	const DAILYFLAGS_CHUCK_REMATCH                    ; 0c
	const DAILYFLAGS_JASMINE_REMATCH                  ; 0d
	const DAILYFLAGS_PRYCE_REMATCH                    ; 0e
	const DAILYFLAGS_CLAIR_REMATCH                    ; 0f
	const DAILYFLAGS_BROCK_REMATCH                    ; 10
	const DAILYFLAGS_MISTY_REMATCH                    ; 11
	const DAILYFLAGS_LTSURGE_REMATCH                  ; 12
	const DAILYFLAGS_ERIKA_REMATCH                    ; 13
	const DAILYFLAGS_JANINE_REMATCH                   ; 14
	const DAILYFLAGS_SABRINA_REMATCH                  ; 15
	const DAILYFLAGS_BLAINE_REMATCH                   ; 16
	const DAILYFLAGS_BLUE_REMATCH                     ; 17
	; Trainer rematch flags
	const DAILYFLAGS_KIMONO_GIRL_SAKURA_REMATCH       ; 18
	; Overworld states that get reset daily
	const DAILYFLAGS1_HEADBUTT_ACTIVE                 ; 19
	const DAILYFLAGS1_SURF_ACTIVE                     ; 1a
	const DAILYFLAGS1_WHIRPOOL_ACTIVE                 ; 1b
	const DAILYFLAGS1_WATERFALL_ACTIVE                ; 1c
	const DAILYFLAGS1_ROCK_SMASH_ACTIVE               ; 1d
	
; wDailyFlags2::
	const_def
	const DAILYFLAGS2_UNION_CAVE_LAPRAS_F                 ; 0
	const DAILYFLAGS2_GOLDENROD_UNDERGROUND_GOT_HAIRCUT_F ; 1
	const DAILYFLAGS2_GOLDENROD_DEPT_STORE_TM27_RETURN_F  ; 2
	const DAILYFLAGS2_DAISYS_GROOMING_F                   ; 3
	const DAILYFLAGS2_INDIGO_PLATEAU_RIVAL_FIGHT_F        ; 4
	const DAILYFLAGS2_BUENAS_PASSWORD_F                   ; 5
	const DAILYFLAGS2_DAILY_MOUNT_MOON_B2F_FOSSIL         ; 6 
	const DAILYFLAGS2_DAILY_CIANWOOD_PHOTOGRAPH           ; 7

; wSwarmFlags::
	const_def
	const SWARMFLAGS_BUENAS_PASSWORD_F           ; 0
	const SWARMFLAGS_GOLDENROD_DEPT_STORE_SALE_F ; 1
	const SWARMFLAGS_DUNSPARCE_SWARM_F           ; 2
	const SWARMFLAGS_YANMA_SWARM_F               ; 3
	const SWARMFLAGS_MOBILE_4_F                  ; 4

; wLuckyNumberShowFlag::
DEF LUCKYNUMBERSHOW_GAME_OVER_F EQU 0

; wDayCareMan::
DEF DAYCAREMAN_HAS_MON_F         EQU 0
DEF DAYCAREMAN_MONS_COMPATIBLE_F EQU 5
DEF DAYCAREMAN_HAS_EGG_F         EQU 6
DEF DAYCAREMAN_ACTIVE_F          EQU 7

; wDayCareLady::
DEF DAYCARELADY_HAS_MON_F        EQU 0
DEF DAYCARELADY_ACTIVE_F         EQU 7

; wUnlockedUnowns::
	const_def
	const UNLOCKED_UNOWNS_A_TO_G_F
	const UNLOCKED_UNOWNS_H_TO_N_F
	const UNLOCKED_UNOWNS_O_TO_U_F
	const UNLOCKED_UNOWNS_V_TO_QUESTION_F
DEF NUM_UNLOCKED_UNOWN_SETS EQU const_value
