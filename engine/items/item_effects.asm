_DoItemEffect::
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyName1
	ld a, 1
	ld [wItemEffectSucceeded], a
	ld a, [wCurItem]
	dec a
	ld hl, ItemEffects
	rst JumpTable
	ret

ItemEffects:
; entries correspond to item ids (see constants/item_constants.asm)
	table_width 2, ItemEffects
	dw PokeBallEffect      ; MASTER_BALL
	dw PokeBallEffect      ; ULTRA_BALL
	dw NoEffect            ; BRIGHTPOWDER
	dw PokeBallEffect      ; GREAT_BALL
	dw PokeBallEffect      ; POKE_BALL
	dw TownMapEffect       ; TOWN_MAP
	dw BicycleEffect       ; BICYCLE
	dw EvoStoneEffect      ; MOON_STONE
	dw StatusHealingEffect ; ANTIDOTE
	dw StatusHealingEffect ; BURN_HEAL
	dw StatusHealingEffect ; ICE_HEAL
	dw StatusHealingEffect ; AWAKENING
	dw StatusHealingEffect ; PARLYZ_HEAL
	dw FullRestoreEffect   ; FULL_RESTORE
	dw RestoreHPEffect     ; MAX_POTION
	dw RestoreHPEffect     ; HYPER_POTION
	dw RestoreHPEffect     ; SUPER_POTION
	dw RestoreHPEffect     ; POTION
	dw EscapeRopeEffect    ; ESCAPE_ROPE
	dw RepelEffect         ; REPEL
	dw RestorePPEffect     ; MAX_ELIXER
	dw EvoStoneEffect      ; FIRE_STONE
	dw EvoStoneEffect      ; THUNDERSTONE
	dw EvoStoneEffect      ; WATER_STONE
	dw NoEffect            ; BIG_NUGGET
	dw VitaminEffect       ; HP_UP
	dw VitaminEffect       ; PROTEIN
	dw VitaminEffect       ; IRON
	dw VitaminEffect       ; CARBOS
	dw NoEffect            ; LUCKY_PUNCH
	dw VitaminEffect       ; CALCIUM
	dw RareCandyEffect     ; RARE_CANDY
	dw XAccuracyEffect     ; X_ACCURACY
	dw EvoStoneEffect      ; LEAF_STONE
	dw NoEffect            ; METAL_POWDER
	dw NoEffect            ; NUGGET
	dw PokeDollEffect      ; POKE_DOLL
	dw StatusHealingEffect ; FULL_HEAL
	dw ReviveEffect        ; REVIVE
	dw ReviveEffect        ; MAX_REVIVE
	dw GuardSpecEffect     ; GUARD_SPEC
	dw SuperRepelEffect    ; SUPER_REPEL
	dw MaxRepelEffect      ; MAX_REPEL
	dw DireHitEffect       ; DIRE_HIT
	dw NoEffect            ; SECRET_KEY
	dw RestoreHPEffect     ; FRESH_WATER
	dw RestoreHPEffect     ; SODA_POP
	dw RestoreHPEffect     ; LEMONADE
	dw XItemEffect         ; X_ATTACK
	dw LowerEVBerryEffect  ; POMEG_BERRY
	dw XItemEffect         ; X_DEFEND
	dw XItemEffect         ; X_SPEED
	dw XItemEffect         ; X_SP_ATK
	dw CoinCaseEffect      ; COIN_CASE
	dw ItemfinderEffect    ; ITEMFINDER
	dw PokeFluteEffect     ; POKE_FLUTE
	dw NoEffect            ; EXP_SHARE
	dw OldRodEffect        ; OLD_ROD
	dw GoodRodEffect       ; GOOD_ROD
	dw NoEffect            ; SILVER_LEAF
	dw SuperRodEffect      ; SUPER_ROD
	dw RestorePPEffect     ; PP_UP
	dw RestorePPEffect     ; ETHER
	dw RestorePPEffect     ; MAX_ETHER
	dw RestorePPEffect     ; ELIXER
	dw NoEffect            ; RED_SCALE
	dw NoEffect            ; SECRETPOTION
	dw NoEffect            ; ITEM_44
	dw NoEffect            ; MYSTERY_EGG
	dw NoEffect            ; CLEAR_BELL
	dw NoEffect            ; SILVER_WING
	dw RestoreHPEffect     ; MOOMOO_MILK
	dw DiplomaEffect       ; DIPLOMA
	dw StatusHealingEffect ; PECHA_BERRY
	dw NoEffect            ; GOLD_LEAF
	dw NoEffect            ; SOFT_SAND
	dw NoEffect            ; SHARP_BEAK
	dw StatusHealingEffect ; CHERI_BERRY
	dw StatusHealingEffect ; ASPEAR_BERRY
	dw StatusHealingEffect ; RAWST_BERRY
	dw NoEffect            ; POISON_BARB
	dw NoEffect            ; KINGS_ROCK
	dw PersimBerryEffect   ; PERSIM_BERRY
	dw StatusHealingEffect ; CHESTO_BERRY
	dw NoEffect            ; RED_APRICORN
	dw NoEffect            ; TINYMUSHROOM
	dw NoEffect            ; BIG_MUSHROOM
	dw NoEffect            ; SILVERPOWDER
	dw NoEffect            ; BLU_APRICORN
	dw PokeBallEffect      ; DUSK_BALL
	dw NoEffect            ; AMULET_COIN
	dw NoEffect            ; YLW_APRICORN
	dw NoEffect            ; GRN_APRICORN
	dw NoEffect            ; CLEANSE_TAG
	dw NoEffect            ; MYSTIC_WATER
	dw NoEffect            ; TWISTEDSPOON
	dw NoEffect            ; WHT_APRICORN
	dw NoEffect            ; BLACKBELT_I
	dw NoEffect            ; BLK_APRICORN
	dw LowerEVBerryEffect  ; KELPSY_BERRY
	dw NoEffect            ; PNK_APRICORN
	dw NoEffect            ; BLACKGLASSES
	dw NoEffect            ; SLOWPOKETAIL
	dw NoEffect            ; PINK_BOW
	dw NoEffect            ; LEEK
	dw NoEffect            ; SMOKE_BALL
	dw NoEffect            ; NEVERMELTICE
	dw NoEffect            ; MAGNET
	dw StatusHealingEffect ; LUM_BERRY
	dw NoEffect            ; PEARL
	dw NoEffect            ; BIG_PEARL
	dw NoEffect            ; EVERSTONE
	dw NoEffect            ; SPELL_TAG
	dw RestoreHPEffect     ; RAGECANDYBAR
	dw NoEffect            ; GS_BALL
	dw BlueCardEffect      ; BLUE_CARD
	dw NoEffect            ; MIRACLE_SEED
	dw NoEffect            ; THICK_CLUB
	dw NoEffect            ; FOCUS_BAND
	dw XItemEffect         ; X_SP_DEF
	dw EnergypowderEffect  ; ENERGYPOWDER
	dw EnergyRootEffect    ; ENERGY_ROOT
	dw HealPowderEffect    ; HEAL_POWDER
	dw RevivalHerbEffect   ; REVIVAL_HERB
	dw NoEffect            ; HARD_STONE
	dw NoEffect            ; LUCKY_EGG
	dw CardKeyEffect       ; CARD_KEY
	dw NoEffect            ; MACHINE_PART
	dw NoEffect            ; EGG_TICKET
	dw NoEffect            ; LOST_ITEM
	dw NoEffect            ; STARDUST
	dw NoEffect            ; STAR_PIECE
	dw BasementKeyEffect   ; BASEMENT_KEY
	dw NoEffect            ; ITEM_86
	dw NoEffect            ; EVIOLITE
	dw LowerEVBerryEffect  ; QUALOT_BERRY
	dw VitaminEffect       ; ZINC
	dw NoEffect            ; CHARCOAL
	dw RestoreHPEffect     ; BERRY_JUICE
	dw NoEffect            ; SCOPE_LENS
	dw LowerEVBerryEffect  ; HONDEW_BERRY
	dw LowerEVBerryEffect  ; GREPA_BERRY
	dw NoEffect            ; METAL_COAT
	dw NoEffect            ; DRAGON_FANG
	dw LowerEVBerryEffect  ; TAMATO_BERRY
	dw NoEffect            ; LEFTOVERS
	dw NoEffect            ; OLD_AMBER
	dw NoEffect            ; DOME_FOSSIL
	dw NoEffect            ; HELIX_FOSSIL
	dw RestorePPEffect     ; LEPPA_BERRY
	dw NoEffect            ; DRAGON_SCALE
	dw NoEffect            ; BERSERK_GENE
	dw PokeBallEffect      ; PREMIER_BALL
	dw NoEffect            ; BALL_RELIC
	dw NoEffect            ; MULCH
	dw SacredAshEffect     ; SACRED_ASH
	dw PokeBallEffect      ; HEAVY_BALL
	dw NoEffect            ; FLOWER_MAIL
	dw PokeBallEffect      ; LEVEL_BALL
	dw PokeBallEffect      ; LURE_BALL
	dw PokeBallEffect      ; FAST_BALL
	dw PokeBallEffect      ; NET_BALL
	dw NoEffect            ; LIGHT_BALL
	dw PokeBallEffect      ; FRIEND_BALL
	dw PokeBallEffect      ; MOON_BALL
	dw PokeBallEffect      ; LOVE_BALL
	dw NoEffect            ; MACHO_BRACE
	dw NoEffect            ; ITEM_A8
	dw EvoStoneEffect      ; SUN_STONE
	dw NoEffect            ; POLKADOT_BOW
	dw NoEffect            ; ITEM_AB
	dw NoEffect            ; UP_GRADE
	dw RestoreHPEffect     ; ORAN_BERRY
	dw RestoreHPEffect     ; SITRUS_BERRY
	dw SquirtbottleEffect  ; SQUIRTBOTTLE
	dw NoEffect            ; OLD_SEA_MAP
	dw PokeBallEffect      ; PARK_BALL
	dw NoEffect            ; RAINBOW_WING
	dw NoEffect            ; ITEM_B3
	assert_table_length ITEM_B3
; The items past ITEM_B3 do not have effect entries:
;	QUICK_CLAW
;	SURF_MAIL
;	LITEBLUEMAIL
;	PORTRAITMAIL
;	LOVELY_MAIL
;	EON_MAIL
;	MORPH_MAIL
;	BLUESKY_MAIL
;	MUSIC_MAIL
;	MIRAGE_MAIL
;	ITEM_BE
;   ITEM_BF
; They all have the ITEMMENU_NOUSE attribute so they can't be used anyway.
; NoEffect would be appropriate, with the table then being NUM_ITEMS long.

PokeBallEffect:
	ld a, [wBattleMode]
	dec a
	jp nz, UseBallInTrainerBattle
	
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .room_in_party

	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nz, .room_in_party

	newfarcall NewStorageBoxPointer
	jp c, Ball_BoxIsFullMessage

.room_in_party
	xor a
	ld [wWildMon], a
	ld a, [wBattleType]
	cp BATTLETYPE_CONTEST
	call nz, ReturnToBattle_UseBall

	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ld hl, ItemUsedText
	call PrintText

	ld a, [wEnemyMonCatchRate]
	ld b, a
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, .catch_without_fail
	ld a, [wCurItem]
	cp MASTER_BALL
	jp z, .catch_without_fail
	ld a, [wCurItem]
	ld c, a
	ld hl, BallMultiplierFunctionTable

.get_multiplier_loop
	ld a, [hli]
	cp $ff
	jr z, .skip_or_return_from_ball_fn
	cp c
	jr z, .call_ball_function
	inc hl
	inc hl
	jr .get_multiplier_loop

.call_ball_function
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .skip_or_return_from_ball_fn
	push de
	jp hl

.skip_or_return_from_ball_fn
	ld a, [wCurItem]
	cp LEVEL_BALL
	ld a, b
	jp z, .skip_hp_calc

	ld a, b
	ldh [hMultiplicand + 2], a

	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	sla c
	rl b

	ld h, d
	ld l, e
	add hl, de
	add hl, de
	ld d, h
	ld e, l
	ld a, d
	and a
	jr z, .okay_1

	srl d
	rr e
	srl d
	rr e
	srl b
	rr c
	srl b
	rr c

	ld a, c
	and a
	jr nz, .okay_1
	ld c, $1
.okay_1
	ld b, e

	push bc
	ld a, b
	sub c
	ldh [hMultiplier], a
	xor a
	ldh [hDividend + 0], a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	call Multiply
	pop bc

	ld a, b
	ldh [hDivisor], a
	ld b, 4
	call Divide

	ldh a, [hQuotient + 3]
	and a
	jr nz, .statuscheck
	ld a, 1
.statuscheck
	ld b, a
	ld a, [wEnemyMonStatus]
	and 1 << FRZ | SLP_MASK
	ld c, 10
	jr nz, .addstatus
	ld a, [wEnemyMonStatus]
	and a
	ld c, 5
	jr nz, .addstatus
	ld c, 0
.addstatus
	ld a, b
	add c
	jr nc, .max_1
	ld a, $ff
.max_1

	ld d, a
	push de
	ld a, [wBattleMonItem]
	ld b, a
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_CATCH_CHANCE
	pop de
	ld a, d
	jr nz, .max_2
	add c
	jr nc, .max_2
	ld a, $ff
.max_2

.skip_hp_calc
	ld b, a
	ld [wFinalCatchRate], a
	call Random

	cp b
	ld a, 0
	jr z, .catch_without_fail
	jr nc, .fail_to_catch

.catch_without_fail
	ld a, [wEnemyMonSpecies]

.fail_to_catch
	ld [wWildMon], a
	ld c, 20
	call DelayFrames

	ld a, [wCurItem]
	cp POKE_BALL + 1 ; Assumes Master/Ultra/Great come before
	jr c, .not_kurt_ball
	ld a, POKE_BALL
.not_kurt_ball
	ld [wBattleAnimParam], a

	ld de, ANIM_THROW_POKE_BALL
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ldh [hBattleTurn], a
	ld [wThrownBallWobbleCount], a
	ld [wNumHits], a
	predef PlayBattleAnim

	ld a, [wWildMon]
	and a
	jr nz, .caught
	ld a, [wThrownBallWobbleCount]
	cp 1
	ld hl, BallBrokeFreeText
	jp z, .shake_and_break_free
	cp 2
	ld hl, BallAppearedCaughtText
	jp z, .shake_and_break_free
	cp 3
	ld hl, BallAlmostHadItText
	jp z, .shake_and_break_free
	cp 4
	ld hl, BallSoCloseText
	jp z, .shake_and_break_free

.caught
	ld hl, wEnemyMonStatus
	ld a, [hli]
	push af
	inc hl
	ld a, [hli]
	push af
	ld a, [hl]
	push af
	push hl
	ld hl, wEnemyMonItem
	ld a, [hl]
	push af
	push hl
	ld hl, wEnemySubStatus5
	ld a, [hl]
	push af
	set SUBSTATUS_TRANSFORMED, [hl]

	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .load_data
	
	ld hl, wEnemyBackupDVs
	ld a, [wEnemyMonDVs]
	ld [hli], a
	ld a, [wEnemyMonDVs + 1]
	ld [hl], a

.load_data
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wEnemyMonLevel]
	ld [wCurPartyLevel], a
	farcall LoadEnemyMon

	pop af
	ld [wEnemySubStatus5], a

	pop hl
	pop af
	ld [hl], a
	pop hl
	pop af
	ld [hld], a
	pop af
	ld [hld], a
	dec hl
	pop af
	ld [hl], a

	ld hl, wEnemySubStatus5
	bit SUBSTATUS_TRANSFORMED, [hl]
	jr nz, .Transformed
	ld hl, wWildMonMoves
	ld de, wEnemyMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, wWildMonPP
	ld de, wEnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes

.Transformed:
	ld a, [wEnemyMonSpecies]
	ld [wWildMon], a
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, .FinishTutorial

	farcall StubbedTrainerRankings_WildMonsCaught

	ld hl, Text_GotchaMonWasCaught
	call PrintText

	call ClearSprites

	ld a, [wTempSpecies]
	ld l, a
	ld a, [wCurPartyLevel]
	ld h, a
	push hl
	farcall ApplyExperienceAfterEnemyCaught
	pop hl
	ld a, l
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld a, h
	ld [wCurPartyLevel], a

	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon

	ld a, c
	push af
	ld a, [wTempSpecies]
	dec a
	call SetSeenAndCaughtMon
	pop af
	and a
	jr nz, .skip_pokedex

	call CheckReceivedDex
	jr z, .skip_pokedex

	ld hl, NewDexDataText
	call PrintText

	call ClearSprites

	ld c, 15
	call FadeToWhite

	ld a, [wEnemyMonSpecies]
	ld [wTempSpecies], a
	predef NewPokedexEntry

.skip_pokedex
	ld a, [wBattleType]
	cp BATTLETYPE_CONTEST
	jp z, .catch_bug_contest_mon

	ld hl, wBattleResult
	set BATTLERESULT_CAUGHT_POKEMON_F, [hl]

	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr z, .SendToPC

	xor a ; PARTYMON
	ld [wMonType], a
	call ClearSprites

	predef TryAddMonToParty

	farcall SetCaughtData

	ld a, [wCurItem]
	cp FRIEND_BALL
	jr nz, .SkipPartyMonFriendBall

	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld a, FRIEND_BALL_HAPPINESS
	ld [hl], a

.SkipPartyMonFriendBall:
	ld hl, AskGiveNicknameText
	call PrintText

	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName

	call YesNoBox
	jp c, .return_from_capture

	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes

	ld d, h
	ld e, l
	push de
	xor a ; PARTYMON
	ld [wMonType], a
	ld b, NAME_MON
	farcall NamingScreen

	ld c, 15
	call FadeToWhite

	call LoadStandardFont

	pop hl
	ld de, wStringBuffer1
	call InitName

	jp .return_from_capture

.SendToPC:
	call ClearSprites

	predef SendMonIntoBox

	farcall SetBoxMonCaughtData

	newfarcall NewStorageBoxPointer
	jr nc, .BoxNotFullYet
	ld hl, wBattleResult
	set BATTLERESULT_BOX_FULL, [hl]
.BoxNotFullYet:
	ld a, [wCurItem]
	cp FRIEND_BALL
	jr nz, .SkipBoxMonFriendBall
	; The captured mon is now first in the box
	ld a, FRIEND_BALL_HAPPINESS
	ld [wBufferMonHappiness], a
.SkipBoxMonFriendBall:
	ld hl, AskGiveNicknameText
	call PrintText

	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName

	call YesNoBox
	jr c, .SkipBoxMonNickname

	xor a
	ld [wCurPartyMon], a
	ld a, BUFFERMON
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	ld b, NAME_MON
	farcall NamingScreen

	ld hl, wMonOrItemNameBuffer
	ld de, wBufferMonNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	ld hl, wBufferMonNickname
	ld de, wStringBuffer1
	call InitName

.SkipBoxMonNickname:
	ld hl, wBufferMonNickname
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	newfarcall UpdateStorageBoxMonFromTemp

	; Switch current Box if it was full. We can check this by checking if
	; the buffermon's box location matches the current box.
	ld a, [wBufferMonBox]
	ld b, a
	ld a, [wCurBox]
	inc a
	cp b
	jr z, .curbox_not_full

	push bc
	ld b, a
	newfarcall GetBoxName
	ld hl, CurBoxFullText
	call PrintText
	pop bc

	; Switch current box.
	ld a, b
	dec a
	ld [wCurBox], a

.curbox_not_full
	ld a, [wCurBox]
	inc a
	ld b, a
	newfarcall GetBoxName

	ld hl, BallSentToPCText
	call PrintText

	ld c, 15
	call FadeToWhite
	call LoadStandardFont
	jr .return_from_capture

.catch_bug_contest_mon
	farcall BugContest_SetCaughtContestMon
	jr .return_from_capture

.FinishTutorial:
	ld hl, Text_GotchaMonWasCaught

.shake_and_break_free
	call PrintText
	call ClearSprites

.return_from_capture
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	ret z
	cp BATTLETYPE_DEBUG
	ret z
	cp BATTLETYPE_CONTEST
	jr z, .used_park_ball

	ld a, [wWildMon]
	and a
	jr z, .toss

	call ClearBGPalettes
	call ClearTilemap

.toss
	ld hl, wNumItems
	inc a
	ld [wItemQuantityChange], a
	jp TossItem

.used_park_ball
	ld hl, wParkBallsRemaining
	dec [hl]
	ret

BallMultiplierFunctionTable:
; table of routines that increase or decrease the catch rate based on
; which ball is used in a certain situation.
	dbw ULTRA_BALL,  UltraBallMultiplier
	dbw GREAT_BALL,  GreatBallMultiplier
	dbw SAFARI_BALL, SafariBallMultiplier ; Safari Ball, leftover from RBY
	dbw HEAVY_BALL,  HeavyBallMultiplier
	dbw LEVEL_BALL,  LevelBallMultiplier
	dbw LURE_BALL,   LureBallMultiplier
	dbw FAST_BALL,   FastBallMultiplier
	dbw MOON_BALL,   MoonBallMultiplier
	dbw LOVE_BALL,   LoveBallMultiplier
	dbw PARK_BALL,   ParkBallMultiplier
	dbw DUSK_BALL,   DuskBallMultiplier
	dbw NET_BALL,    NetBallMultiplier
	db -1 ; end

UltraBallMultiplier:
; multiply catch rate by 2
	sla b
	ret nc
	ld b, $ff
	ret

SafariBallMultiplier:
GreatBallMultiplier:
ParkBallMultiplier:
; multiply catch rate by 1.5
	ld a, b
	srl a
	add b
	ld b, a
	ret nc
	ld b, $ff
	ret

HeavyBallMultiplier:
; subtract 20 from catch rate if weight < 102.4 kg
; else add 0 to catch rate if weight < 204.8 kg
; else add 20 to catch rate if weight < 307.2 kg
; else add 30 to catch rate if weight < 409.6 kg
; else add 40 to catch rate
	ld a, [wEnemyMonSpecies]
	ld hl, PokedexDataPointerTable
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	; d = bank, hl = address
	ld a, BANK(PokedexDataPointerTable)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(PokedexDataPointerTable)
	call GetFarWord
	pop de

.SkipText:
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .SkipText

	ld a, d
	push bc
	inc hl
	inc hl
	call GetFarWord

	srl h
	rr l
	ld b, h
	ld c, l

rept 4
	srl b
	rr c
endr
	call .subbc

	srl b
	rr c
	call .subbc

	ld a, h
	pop bc
	jr .compare

.subbc
	; subtract bc from hl
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	pop bc
	ret

.compare
	ld c, a
	cp HIGH(1024) ; 102.4 kg
	jr c, .lightmon

	ld hl, .WeightsTable
.lookup
	ld a, c
	cp [hl]
	jr c, .heavymon
	inc hl
	inc hl
	jr .lookup

.heavymon
	inc hl
	ld a, b
	add [hl]
	ld b, a
	ret nc
	ld b, $ff
	ret

.lightmon
	ld a, b
	sub 20
	ld b, a
	ret nc
	ld b, $1
	ret

.WeightsTable:
; weight factor, boost
	db HIGH(2048),   0
	db HIGH(3072),  20
	db HIGH(4096),  30
	db HIGH(65280), 40

LureBallMultiplier:
; multiply catch rate by 3 if this is a fishing rod battle
	ld a, [wBattleType]
	cp BATTLETYPE_FISH
	ret nz

	ld a, b
	add a
	jr c, .max

	add b
	jr nc, .done
.max
	ld a, $ff
.done
	ld b, a
	ret

MoonBallMultiplier:
	push bc
	ld a, [wTempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
	pop bc

	push bc
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	cp EVOLVE_ITEM
	pop bc
	ret nz

	inc hl
	inc hl
	inc hl

	push bc
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	cp MOON_STONE
	pop bc
	ret nz

	sla b
	jr c, .max
	sla b
	jr nc, .done
.max
	ld b, $ff
.done
	ret

LoveBallMultiplier:

	; does species match?
	ld a, [wTempEnemyMonSpecies]
	ld c, a
	ld a, [wTempBattleMonSpecies]
	cp c
	ret nz

	; check player mon species
	push bc
	ld a, [wTempBattleMonSpecies]
	ld [wCurPartySpecies], a
	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	farcall GetGender
	jr c, .done1 ; no effect on genderless

	ld d, 0 ; male
	jr nz, .got_player_gender
	inc d   ; female
.got_player_gender

	; check wild mon species
	push de
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld a, WILDMON
	ld [wMonType], a
	farcall GetGender
	jr c, .done2 ; no effect on genderless

	ld d, 0 ; male
	jr nz, .got_wild_gender
	inc d   ; female
.got_wild_gender

	ld a, d
	pop de
	cp d
	pop bc
	ret z

	sla b
	jr c, .max
	sla b
	jr c, .max
	sla b
	ret nc
.max
	ld b, $ff
	ret

.done2
	pop de

.done1
	pop bc
	ret

FastBallMultiplier:
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseSpeed]
	cp 100
	ret nc
	sla b
	jr c, .max
	sla b
	ret nc
.max
	ld b, $ff
	ret

NetBallMultiplier:
	ld a, [wEnemyMonType1]
	cp WATER
	jr z, .WaterOrBug
	cp BUG
	jr z, .WaterOrBug
	ld a, [wEnemyMonType2]
	cp WATER
	jr z, .WaterOrBug
	cp BUG
	ret nz

.WaterOrBug
; b is the catch rate
; a := b + b + b == b × 3
	ld a, b
	add a
	jr c, .max

	add b
	jr c, .max

	ld b, a
	ret

.max
	ld b, $ff
	ret

LevelBallMultiplier:
; multiply catch rate by 8 if player mon level / 4 > enemy mon level
; multiply catch rate by 4 if player mon level / 2 > enemy mon level
; multiply catch rate by 2 if player mon level > enemy mon level
	ld a, [wBattleMonLevel]
	ld c, a
	ld a, [wEnemyMonLevel]
	cp c
	ret nc ; if player is lower level, we're done here
	sla b
	jr c, .max

	srl c
	cp c
	ret nc ; if player/2 is lower level, we're done here
	sla b
	jr c, .max

	srl c
	cp c
	ret nc ; if player/4 is lower level, we're done here
	sla b
	ret nc

.max
	ld b, $ff
	ret
	
DuskBallMultiplier:
; is it night?
	ld a, [wTimeOfDay]
	cp NITE
	jr z, .night_or_cave
; or are we in a cave?
	ld a, [wEnvironment]
	cp CAVE
	ret nz ; neither night nor cave

.night_or_cave
; b is the catch rate
; a := b + b + b == b × 3
	ld a, b
	add a
	jr c, .max

	add b
	jr c, .max

	ld b, a
	ret

.max
	ld b, $ff
	ret

BallBrokeFreeText:
	text_far _BallBrokeFreeText
	text_end

BallAppearedCaughtText:
	text_far _BallAppearedCaughtText
	text_end

BallAlmostHadItText:
	text_far _BallAlmostHadItText
	text_end

BallSoCloseText:
	text_far _BallSoCloseText
	text_end

Text_GotchaMonWasCaught:
	; Gotcha! @ was caught!@ @
	text_far Text_BallCaught
	text_asm
	call WaitSFX
	push bc
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_CAPTURE
	call PlayMusic
	pop bc
	ld hl, WaitButtonText
	ret

WaitButtonText:
	text_far _WaitButtonText
	text_end

CurBoxFullText:
	text_far _CurBoxFullText
	text_end

BallSentToPCText:
	text_far _BallSentToPCText
	text_end

NewDexDataText:
	text_far _NewDexDataText
	text_end

AskGiveNicknameText:
	text_far _AskGiveNicknameText
	text_end

ReturnToBattle_UseBall:
	farcall _ReturnToBattle_UseBall
	ret

TownMapEffect:
	farcall PokegearMap
	ret

DiplomaEffect:
	call FadeToMenu
	farcall _Diploma
	call Call_ExitMenu
	xor a
	ldh [hBGMapMode], a
	farcall Pack_InitGFX
	farcall WaitBGMap_DrawPackGFX
	farcall Pack_InitColors
 	ret

BicycleEffect:
	farcall BikeFunction
	ret

EvoStoneEffect:
	ld b, PARTYMENUACTION_EVO_STONE
	call UseItem_SelectMon

	jp c, .DecidedNotToUse

	ld a, MON_ITEM
	call GetPartyParamLocation

	ld a, [hl]
	cp EVERSTONE
	jr z, .NoEffect

	ld a, TRUE
	ld [wForceEvolution], a
	farcall EvolvePokemon

	ld a, [wMonTriedToEvolve]
	and a
	jr z, .NoEffect

	jp UseDisposableItem

.NoEffect:
	call WontHaveAnyEffectMessage

.DecidedNotToUse:
	xor a
	ld [wItemEffectSucceeded], a
	ret

LowerEVBerryEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	jp c, RareCandy_StatBooster_ExitMenu
	
	ld a, MON_HAPPINESS
    call GetPartyParamLocation
	ld a, [hl]
	inc a
	push af
;SetUpEVModifier
	call RareCandy_StatBooster_GetParameters
	call GetEVRelativePointer
    ld a, MON_EVS
    call GetPartyParamLocation
	
	add hl, bc
	pop af
	or [hl]
    jp z, NoEffectMessage

	ld a, [hl]
	sub 10
	jr nc, .ev_value_ok
	xor a

.ev_value_ok
	ld [hl], a
	call UpdateStatsAfterItem
	ld c, HAPPINESS_USEDEVBERRY
	farcall ChangeHappiness
; GetStatStringAndPlayFullHealSFX
    call GetEVRelativePointer
	ld hl, StatStrings
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer2
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	call Play_SFX_FULL_HEAL
	
	ld hl, ItemHappinessRoseButStatFellText
	call PrintText
	jp UseDisposableItem

ItemHappinessRoseButStatFellText:
	text_far _ItemHappinessRoseButStatFellText
	text_end

VitaminEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon

	jp c, RareCandy_StatBooster_ExitMenu

	call RareCandy_StatBooster_GetParameters

	call GetEVRelativePointer

    ld a, MON_EVS
    call GetPartyParamLocation

    add hl, bc
    ld a, [hl]
    cp MAX_EV
    jr nc, NoEffectMessage

    add 10
    jr c, .ev_overflow
    cp MAX_EV + 1
    jr c, .got_ev
.ev_overflow
    ld a, MAX_EV
.got_ev
    ld [hl], a
    call UpdateStatsAfterItem

    call GetEVRelativePointer

	ld hl, StatStrings
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer2
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes

	call Play_SFX_FULL_HEAL

	ld hl, ItemStatRoseText
	call PrintText

	ld c, HAPPINESS_USEDITEM
	farcall ChangeHappiness

	jp UseDisposableItem

NoEffectMessage:
	ld hl, ItemWontHaveEffectText
	call PrintText
	jp ClearPalettes

UpdateStatsAfterItem:
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_EVS - 1
	call GetPartyParamLocation
	ld b, TRUE
	predef_jump CalcMonStats

RareCandy_StatBooster_ExitMenu:
	xor a
	ld [wItemEffectSucceeded], a
	jp ClearPalettes

ItemStatRoseText:
	text_far _ItemStatRoseText
	text_end

StatStrings:
	dw .health
	dw .attack
	dw .defense
	dw .speed
	dw .sp_atk
	dw .sp_def

.health  db "Health@"
.attack  db "Attack@"
.defense db "Defense@"
.speed   db "Speed@"
.sp_atk  db "Sp.Atk@"
.sp_def  db "Sp.Def@"

GetEVRelativePointer:
	ld a, [wCurItem]
	ld hl, EVItemPointerOffsets
.next
	cp [hl]
	inc hl
	jr z, .got_it
	inc hl
	jr .next

.got_it
	ld a, [hl]
	ld c, a
	ld b, 0
	ret

EVItemPointerOffsets:
	db HP_UP,    MON_HP_EV - MON_EVS
	db PROTEIN, MON_ATK_EV - MON_EVS
	db IRON,    MON_DEF_EV - MON_EVS
	db CARBOS,  MON_SPD_EV - MON_EVS
	db CALCIUM, MON_SAT_EV - MON_EVS
	db ZINC,    MON_SDF_EV - MON_EVS
	db POMEG_BERRY,   MON_HP_EV - MON_EVS
	db KELPSY_BERRY, MON_ATK_EV - MON_EVS
	db QUALOT_BERRY, MON_DEF_EV - MON_EVS
	db HONDEW_BERRY, MON_SAT_EV - MON_EVS
	db GREPA_BERRY,  MON_SDF_EV - MON_EVS
	db TAMATO_BERRY, MON_SPD_EV - MON_EVS

RareCandy_StatBooster_GetParameters:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wTempSpecies], a
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	call GetBaseData
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ret

RareCandyEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon

	jp c, RareCandy_StatBooster_ExitMenu

	call RareCandy_StatBooster_GetParameters

	ld a, MON_LEVEL
	call GetPartyParamLocation

	ld a, [hl]
	cp MAX_LEVEL
	jp nc, NoEffectMessage

	inc a
	ld [hl], a
	ld [wCurPartyLevel], a
	push de
	ld d, a
	farcall CalcExpAtLevel

	pop de
	ld a, MON_EXP
	call GetPartyParamLocation

	ldh a, [hMultiplicand + 0]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a

	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc
	call UpdateStatsAfterItem

	ld a, MON_MAXHP + 1
	call GetPartyParamLocation

	pop bc
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	dec hl
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	farcall LevelUpHappinessMod

	ld a, PARTYMENUTEXT_LEVEL_UP
	call ItemActionText

	xor a ; PARTYMON
	ld [wMonType], a
	predef CopyMonToTempMon

	hlcoord 9, 0
	ld b, 10
	ld c, 9
	call Textbox

	hlcoord 11, 1
	ld bc, 4
	predef PrintTempMonStats

	call WaitPressAorB_BlinkCursor

	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	predef LearnLevelMoves

	xor a
	ld [wForceEvolution], a
	farcall EvolvePokemon

	jp UseDisposableItem

HealPowderEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon

	jp c, StatusHealer_ExitMenu

	call UseStatusHealer
	cp FALSE
	jr nz, .not_used

	ld c, HAPPINESS_BITTERPOWDER
	farcall ChangeHappiness
	call LooksBitterMessage

	ld a, $0

.not_used
	jp StatusHealer_Jumptable

StatusHealingEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	jp c, StatusHealer_ExitMenu

FullyHealStatus:
	call UseStatusHealer
	jp StatusHealer_Jumptable

UseStatusHealer:
	call IsMonFainted
	ld a, TRUE
	ret z
	call GetItemHealingAction
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld a, [hl]
	and c
	jr nz, .good
	call IsItemUsedOnConfusedMon
	ld a, TRUE
	ret nc
	ld b, PARTYMENUTEXT_HEAL_CONFUSION
.good
	xor a
	ld [hl], a
	ld a, b
	ld [wPartyMenuActionText], a
	call HealStatus
	call Play_SFX_FULL_HEAL
	call ItemActionTextWaitButton
	call UseDisposableItem
	ld a, FALSE
	ret

IsItemUsedOnConfusedMon:
	call IsItemUsedOnBattleMon
	jr nc, .nope
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .nope
	ld a, c
	cp $ff
	jr nz, .nope
	scf
	ret

.nope
	and a
	ret

BattlemonRestoreHealth:
	call IsItemUsedOnBattleMon
	ret nc
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wBattleMonHP], a
	ld a, [hld]
	ld [wBattleMonHP + 1], a
	ret

HealStatus:
	call IsItemUsedOnBattleMon
	ret nc
	xor a
	ld [wBattleMonStatus], a
	ld hl, wPlayerSubStatus5
	res SUBSTATUS_TOXIC, [hl]
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	call GetItemHealingAction
	ld a, c
	cp %11111111
	jr nz, .not_full_heal
	ld hl, wPlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
.not_full_heal
	push bc
	farcall CalcPlayerStats
	pop bc
	ret

GetItemHealingAction:
	push hl
	ld a, [wCurItem]
	ld hl, StatusHealingActions
	ld bc, 3
.next
	cp [hl]
	jr z, .found_it
	add hl, bc
	jr .next

.found_it
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hl]
	ld c, a
	cp %11111111
	pop hl
	ret

INCLUDE "data/items/heal_status.asm"

StatusHealer_Jumptable:
	ld hl, .dw
	rst JumpTable
	ret

.dw
	dw StatusHealer_ClearPalettes
	dw StatusHealer_NoEffect
	dw StatusHealer_ExitMenu

RevivalHerbEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	jp c, StatusHealer_ExitMenu

	call RevivePokemon
	cp FALSE
	jr nz, .not_used

	ld c, HAPPINESS_REVIVALHERB
	farcall ChangeHappiness
	call LooksBitterMessage

	ld a, $0

.not_used
	jp StatusHealer_Jumptable

ReviveEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	jp c, StatusHealer_ExitMenu

	call RevivePokemon
	jp StatusHealer_Jumptable

RevivePokemon:
	call IsMonFainted
	ld a, TRUE
	ret nz
	ld a, [wBattleMode]
	and a
	jr z, .skip_to_revive

	ld a, [wCurPartyMon]
	ld c, a
	ld d, 0
	ld hl, wBattleParticipantsIncludingFainted
	ld b, CHECK_FLAG
	predef SmallFarFlagAction
	ld a, c
	and a
	jr z, .skip_to_revive

	ld a, [wCurPartyMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, SET_FLAG
	predef SmallFarFlagAction

.skip_to_revive
	xor a
	ld [wLowHealthAlarm], a
	ld a, [wCurItem]
	cp REVIVE
	jr z, .revive_half_hp

	call ReviveFullHP
	jr .finish_revive

.revive_half_hp
	call ReviveHalfHP

.finish_revive
	call HealHP_SFX_GFX
	ld a, PARTYMENUTEXT_REVIVE
	ld [wPartyMenuActionText], a
	call ItemActionTextWaitButton
	call UseDisposableItem
	ld a, FALSE
	ret

FullRestoreEffect:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	jp c, StatusHealer_ExitMenu

	call IsMonFainted
	jp z, StatusHealer_NoEffect

	call IsMonAtFullHealth
	jr c, .NotAtFullHealth

	jp FullyHealStatus

.NotAtFullHealth:
	call .FullRestore
	jp StatusHealer_Jumptable

.FullRestore:
	xor a
	ld [wLowHealthAlarm], a
	call ReviveFullHP
	ld a, MON_STATUS
	call GetPartyParamLocation
	xor a
	ld [hli], a
	ld [hl], a
	call HealStatus
	call BattlemonRestoreHealth
	call HealHP_SFX_GFX
	ld a, PARTYMENUTEXT_HEAL_HP
	ld [wPartyMenuActionText], a
	call ItemActionTextWaitButton
	call UseDisposableItem
	ld a, 0
	ret

PersimBerryEffect:
	ld hl, wPlayerSubStatus3
	bit SUBSTATUS_CONFUSED, [hl]
	ld a, 1
	jr z, .done

	res SUBSTATUS_CONFUSED, [hl]
	xor a
	ldh [hBattleTurn], a
	call UseItemText

	ld hl, ConfusedNoMoreText
	call StdBattleTextbox

	ld a, 0

.done
	jp StatusHealer_Jumptable

RestoreHPEffect:
	call ItemRestoreHP
	jp StatusHealer_Jumptable

EnergypowderEffect:
	ld c, HAPPINESS_BITTERPOWDER
	jr EnergypowderEnergyRootCommon

EnergyRootEffect:
	ld c, HAPPINESS_ENERGYROOT

EnergypowderEnergyRootCommon:
	push bc
	call ItemRestoreHP
	pop bc
	cp 0
	jr nz, .skip_happiness

	farcall ChangeHappiness
	call LooksBitterMessage
	ld a, 0

.skip_happiness
	jp StatusHealer_Jumptable

ItemRestoreHP:
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	ld a, 2
	ret c

	call IsMonFainted
	ld a, 1
	ret z

	call IsMonAtFullHealth
	ld a, 1
	ret nc

	xor a
	ld [wLowHealthAlarm], a
	call GetHealingItemAmount
	call RestoreHealth
	call BattlemonRestoreHealth
	call HealHP_SFX_GFX
	ld a, PARTYMENUTEXT_HEAL_HP
	ld [wPartyMenuActionText], a
	call ItemActionTextWaitButton
	call UseDisposableItem
	ld a, 0
	ret

HealHP_SFX_GFX:
	push de
	ld de, SFX_POTION
	call WaitPlaySFX
	pop de
	ld a, [wCurPartyMon]
	hlcoord 11, 0
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld a, $2
	ld [wWhichHPBar], a
	predef_jump AnimateHPBar

UseItem_SelectMon:
	call .SelectMon
	ret c

	ld a, [wCurPartySpecies]
	cp EGG
	jr nz, .not_egg

	call CantUseOnEggMessage
	scf
	ret

.not_egg
	and a
	ret

.SelectMon:
	ld a, b
	ld [wPartyMenuActionText], a
	push hl
	push de
	push bc
	call ClearBGPalettes
	call ChooseMonToUseItemOn
	pop bc
	pop de
	pop hl
	ret

ChooseMonToUseItemOn:
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	farcall WritePartyMenuTilemap
	farcall PlacePartyMenuText
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
	farcall PartyMenuSelect
	ret

ItemActionText:
	ld [wPartyMenuActionText], a
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurPartyMon]
	push af
	push hl
	push de
	push bc
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuActionText
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
	pop bc
	pop de
	pop hl
	pop af
	ld [wCurPartyMon], a
	pop af
	ld [wCurPartySpecies], a
	ret

ItemActionTextWaitButton:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	ld a, " "
	call ByteFill
	ld a, [wPartyMenuActionText]
	call ItemActionText
	ld a, $1
	ldh [hBGMapMode], a
	ld c, 50
	call DelayFrames
	jp WaitPressAorB_BlinkCursor

StatusHealer_NoEffect:
	call WontHaveAnyEffectMessage
	jr StatusHealer_ClearPalettes

StatusHealer_ExitMenu:
	xor a
	ld [wItemEffectSucceeded], a
StatusHealer_ClearPalettes:
	call ClearPalettes
	ret

IsItemUsedOnBattleMon:
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [wCurPartyMon]
	push hl
	ld hl, wCurBattleMon
	cp [hl]
	pop hl
	jr nz, .nope
	scf
	ret

.nope
	xor a
	ret

ReviveHalfHP:
	call LoadHPFromBuffer1
	srl d
	rr e
	jr ContinueRevive

ReviveFullHP:
	call LoadHPFromBuffer1
ContinueRevive:
	ld a, MON_HP
	call GetPartyParamLocation
	ld [hl], d
	inc hl
	ld [hl], e
	jp LoadCurHPIntoBuffer3

RestoreHealth:
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr c, .full_hp
	call LoadCurHPIntoBuffer3
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_MAXHP + 1
	call GetPartyParamLocation
	ld a, [de]
	sub [hl]
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	jr c, .finish
.full_hp
	call ReviveFullHP
.finish
	ret

RemoveHP:
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ld a, [hl]
	sub e
	ld [hld], a
	ld a, [hl]
	sbc d
	ld [hl], a
	jr nc, .okay
	xor a
	ld [hld], a
	ld [hl], a
.okay
	call LoadCurHPIntoBuffer3
	ret

IsMonFainted:
	push de
	call LoadMaxHPIntoBuffer1
	call LoadCurHPIntoBuffer2
	call LoadHPFromBuffer2
	ld a, d
	or e
	pop de
	ret

IsMonAtFullHealth:
	call LoadHPFromBuffer2
	ld h, d
	ld l, e
	call LoadHPFromBuffer1
	ld a, l
	sub e
	ld a, h
	sbc d
	ret

LoadCurHPIntoBuffer3:
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wHPBuffer3 + 1], a
	ld a, [hl]
	ld [wHPBuffer3], a
	ret

LoadHPIntoBuffer3: ; unreferenced
	ld a, d
	ld [wHPBuffer3 + 1], a
	ld a, e
	ld [wHPBuffer3], a
	ret

LoadHPFromBuffer3: ; unreferenced
	ld a, [wHPBuffer3 + 1]
	ld d, a
	ld a, [wHPBuffer3]
	ld e, a
	ret

LoadCurHPIntoBuffer2:
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wHPBuffer2 + 1], a
	ld a, [hl]
	ld [wHPBuffer2], a
	ret

LoadHPFromBuffer2:
	ld a, [wHPBuffer2 + 1]
	ld d, a
	ld a, [wHPBuffer2]
	ld e, a
	ret

LoadMaxHPIntoBuffer1:
	push hl
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	pop hl
	ret

LoadHPFromBuffer1:
	ld a, [wHPBuffer1 + 1]
	ld d, a
	ld a, [wHPBuffer1]
	ld e, a
	ret

GetOneFifthMaxHP:
	push bc
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ldh [hDividend + 0], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 2]
	ld d, a
	ldh a, [hQuotient + 3]
	ld e, a
	pop bc
	ret

GetHealingItemAmount:
	push hl
	ld a, [wCurItem]
	ld hl, HealingHPAmounts
	ld d, a
.next
	ld a, [hli]
	cp -1
	jr z, .NotFound
	cp d
	jr z, .done
	inc hl
	inc hl
	jr .next

.NotFound:
	scf
.done
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret

INCLUDE "data/items/heal_hp.asm"

FreshSnackFunction:
; Fresh Snack in the field
	ld a, [wPartyMenuCursor]
	dec a
	ld b, a
	call .SelectFreshSnackRecipient ; select pokemon
	jr c, .skip
	ld a, b
	ld [wCurPartyMon], a
	call IsMonFainted
	call GetOneFifthMaxHP
	call RemoveHP
	push bc
	call HealHP_SFX_GFX
	pop bc
	call GetOneFifthMaxHP
	ld a, c
	ld [wCurPartyMon], a
	call IsMonFainted
	call RestoreHealth
	call HealHP_SFX_GFX
	ld a, PARTYMENUTEXT_HEAL_HP
	call ItemActionText
	call JoyWaitAorB
.skip
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	ret

.SelectFreshSnackRecipient:
.loop
	push bc
	ld a, PARTYMENUACTION_HEALING_ITEM
	ld [wPartyMenuActionText], a
	call ChooseMonToUseItemOn
	pop bc
	jr c, .set_carry
	ld a, [wPartyMenuCursor]
	dec a
	ld c, a
	ld a, b
	cp c
	jr z, .cant_use ; chose the same mon as user
	ld a, c
	ld [wCurPartyMon], a
	call IsMonFainted
	jr z, .cant_use
	call IsMonAtFullHealth
	jr nc, .cant_use
	xor a
	ret

.set_carry
	scf
	ret

.cant_use
	push bc
	ld hl, .ItemCantUseOnMonText
	call MenuTextboxBackup
	pop bc
	jr .loop

.ItemCantUseOnMonText:
	text_far _ItemCantUseOnMonText
	text_end

EscapeRopeEffect:
	xor a
	ld [wItemEffectSucceeded], a
	farcall EscapeRopeFunction

	ld a, [wItemEffectSucceeded]
	cp 1
	call z, UseDisposableItem
	ret

SuperRepelEffect:
	ld b, 200
	jr UseRepel

MaxRepelEffect:
	ld b, 250
	jr UseRepel

RepelEffect:
	ld b, 100

UseRepel:
	ld a, [wRepelEffect]
	and a
	ld hl, RepelUsedEarlierIsStillInEffectText
	jp nz, PrintText

	ld a, b
	ld [wRepelEffect], a
	ld a, [wCurItem]
	ld [wRepelType], a
	jp UseItemText

RepelUsedEarlierIsStillInEffectText:
	text_far _RepelUsedEarlierIsStillInEffectText
	text_end

XAccuracyEffect:
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_X_ACCURACY, [hl]
	jp nz, WontHaveAnyEffect_NotUsedMessage
	set SUBSTATUS_X_ACCURACY, [hl]
	jp UseItemText

PokeDollEffect:
	ld a, [wBattleMode]
	dec a ; WILD_BATTLE?
	jr nz, .not_wild
	inc a ; TRUE
	ld [wForcedSwitch], a
	ld a, [wBattleResult]
	and BATTLERESULT_BITMASK
	or DRAW
	ld [wBattleResult], a
	jp UseItemText

.not_wild
	xor a
	ld [wItemEffectSucceeded], a
	ret

GuardSpecEffect:
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_MIST, [hl]
	jp nz, WontHaveAnyEffect_NotUsedMessage
	set SUBSTATUS_MIST, [hl]
	jp UseItemText

DireHitEffect:
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jp nz, WontHaveAnyEffect_NotUsedMessage
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	jp UseItemText

XItemEffect:
	call UseItemText

	ld a, [wCurItem]
	ld hl, XItemStats

.loop
	cp [hl]
	jr z, .got_it
	inc hl
	inc hl
	jr .loop

.got_it
	inc hl
	ld b, [hl]
	xor a
	ldh [hBattleTurn], a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	farcall RaiseStat
	call WaitSFX

	farcall BattleCommand_StatUpMessage
	farcall BattleCommand_StatUpFailText

	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	ld c, HAPPINESS_USEDXITEM
	farcall ChangeHappiness
	ret

INCLUDE "data/items/x_stats.asm"

PokeFluteEffect:
	ld a, [wBattleMode]
	and a
	jr nz, .in_battle
	; overworld flute code was dummied out here

.in_battle
	xor a
	ld [wPokeFluteCuredSleep], a

	ld b, ~SLP_MASK

	ld hl, wPartyMon1Status
	call .CureSleep

	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr z, .skip_otrainer
	ld hl, wOTPartyMon1Status
	call .CureSleep
.skip_otrainer

	ld hl, wBattleMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld hl, wEnemyMonStatus
	ld a, [hl]
	and b
	ld [hl], a

	ld a, [wPokeFluteCuredSleep]
	and a
	ld hl, .PlayedFluteText
	jp z, PrintText
	ld hl, .PlayedTheFlute
	call PrintText

	ld a, [wLowHealthAlarm]
	and 1 << DANGER_ON_F
	jr nz, .dummy
	; more code was dummied out here
.dummy
	ld hl, .FluteWakeUpText
	jp PrintText

.CureSleep:
	ld de, PARTYMON_STRUCT_LENGTH
	ld c, PARTY_LENGTH
.loop
	ld a, [hl]
	push af
	and SLP_MASK
	jr z, .not_asleep
	ld a, TRUE
	ld [wPokeFluteCuredSleep], a
.not_asleep
	pop af
	and b
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

.PlayedFluteText:
	text_far _PlayedFluteText
	text_end

.FluteWakeUpText:
	text_far _FluteWakeUpText
	text_end

.PlayedTheFlute:
	; played the # FLUTE.@ @
	text_far Text_PlayedPokeFlute
	text_asm
	ld a, [wBattleMode]
	and a
	jr nz, .battle

	push de
	ld de, SFX_POKEFLUTE
	call WaitPlaySFX
	call WaitSFX
	pop de

.battle
	jp PokeFluteTerminator

BlueCardEffect:
	ld hl, .BlueCardBalanceText
	jp MenuTextboxWaitButton

.BlueCardBalanceText:
	text_far _BlueCardBalanceText
	text_end

CoinCaseEffect:
	ld hl, .CoinCaseCountText
	jp MenuTextboxWaitButton

.CoinCaseCountText:
	text_far _CoinCaseCountText
	text_end

OldRodEffect:
	ld e, $0
	jr UseRod

GoodRodEffect:
	ld e, $1
	jr UseRod

SuperRodEffect:
	ld e, $2
	jr UseRod

UseRod:
	farcall FishFunction
	ret

ItemfinderEffect:
	farcall ItemFinder
	ret

RestorePPEffect:
	ld a, [wCurItem]
	ld [wTempRestorePPItem], a

.loop
	; Party Screen opens to choose on which mon to use the Item
	ld b, PARTYMENUACTION_HEALING_ITEM
	call UseItem_SelectMon
	jp c, PPRestoreItem_Cancel

.loop2
	ld a, [wTempRestorePPItem]
	cp MAX_ELIXER
	jp z, Elixer_RestorePPofAllMoves
	cp ELIXER
	jp z, Elixer_RestorePPofAllMoves

	ld hl, RaiseThePPOfWhichMoveText
	ld a, [wTempRestorePPItem]
	cp PP_UP
	jr z, .ppup
	ld hl, RestoreThePPOfWhichMoveText

.ppup
	call PrintText

	ld a, [wCurMoveNum]
	push af
	xor a
	ld [wCurMoveNum], a
	ld a, $2
	ld [wMoveSelectionMenuType], a
	farcall MoveSelectionScreen
	pop bc

	ld a, b
	ld [wCurMoveNum], a
	jr nz, .loop
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call GetMthMoveOfNthPartymon

	push hl
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1
	pop hl

	ld a, [wTempRestorePPItem]
	cp PP_UP
	jp nz, Not_PP_Up

	ld a, [hl]
	cp SKETCH
	jr z, .CantUsePPUpOnSketch

	ld bc, MON_PP - MON_MOVES
	add hl, bc
	ld a, [hl]
	cp PP_UP_MASK
	jr c, .do_ppup

.CantUsePPUpOnSketch:
	ld hl, PPIsMaxedOutText
	call PrintText
	jr .loop2

.do_ppup
	ld a, [hl]
	add PP_UP_ONE
	ld [hl], a
	ld a, TRUE
	ld [wUsePPUp], a
	call ApplyPPUp
	call Play_SFX_FULL_HEAL

	ld hl, PPsIncreasedText
	call PrintText

FinishPPRestore:
	call ClearPalettes
	jp UseDisposableItem

BattleRestorePP:
	ld a, [wBattleMode]
	and a
	jr z, .not_in_battle
	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wCurBattleMon]
	cp b
	jr nz, .not_in_battle
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .not_in_battle
	call .UpdateBattleMonPP

.not_in_battle
	call Play_SFX_FULL_HEAL
	ld hl, PPRestoredText
	call PrintText
	jr FinishPPRestore

.UpdateBattleMonPP:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld de, wBattleMonMoves
	ld b, NUM_MOVES
.loop
	ld a, [de]
	and a
	jr z, .done
	cp [hl]
	jr nz, .next
	push hl
	push de
	push bc
rept NUM_MOVES + 2 ; wBattleMonPP - wBattleMonMoves
	inc de
endr
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	ld a, [hl]
	ld [de], a
	pop bc
	pop de
	pop hl

.next
	inc hl
	inc de
	dec b
	jr nz, .loop

.done
	ret

Not_PP_Up:
	call RestorePP
	jr nz, BattleRestorePP
	jp PPRestoreItem_NoEffect

Elixer_RestorePPofAllMoves:
	xor a
	ld hl, wMenuCursorY
	ld [hli], a
	ld [hl], a
	ld b, NUM_MOVES
.moveLoop
	push bc
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call GetMthMoveOfNthPartymon
	ld a, [hl]
	and a
	jr z, .next

	call RestorePP
	jr z, .next
	ld hl, wMenuCursorX
	inc [hl]

.next
	ld hl, wMenuCursorY
	inc [hl]
	pop bc
	dec b
	jr nz, .moveLoop
	ld a, [wMenuCursorX]
	and a
	jp nz, BattleRestorePP

PPRestoreItem_NoEffect:
	call WontHaveAnyEffectMessage

PPRestoreItem_Cancel:
	call ClearPalettes
	xor a
	ld [wItemEffectSucceeded], a
	ret

RestorePP:
	xor a ; PARTYMON
	ld [wMonType], a
	call GetMaxPPOfMove
	ld hl, wPartyMon1PP
	ld bc, PARTYMON_STRUCT_LENGTH
	call GetMthMoveOfNthPartymon
	ld a, [wTempPP]
	ld b, a
	ld a, [hl]
	and PP_MASK
	cp b
	jr nc, .dont_restore

	ld a, [wTempRestorePPItem]
	cp MAX_ELIXER
	jr z, .restore_all
	cp MAX_ETHER
	jr z, .restore_all

	ld c, 5
	cp LEPPA_BERRY
	jr z, .restore_some

	ld c, 10

.restore_some
	ld a, [hl]
	and PP_MASK
	add c
	cp b
	jr nc, .restore_all
	ld b, a

.restore_all
	ld a, [hl]
	and PP_UP_MASK
	or b
	ld [hl], a
	ret

.dont_restore
	xor a
	ret

RaiseThePPOfWhichMoveText:
	text_far _RaiseThePPOfWhichMoveText
	text_end

RestoreThePPOfWhichMoveText:
	text_far _RestoreThePPOfWhichMoveText
	text_end

PPIsMaxedOutText:
	text_far _PPIsMaxedOutText
	text_end

PPsIncreasedText:
	text_far _PPsIncreasedText
	text_end

PPRestoredText:
	text_far _PPRestoredText
	text_end

SquirtbottleEffect:
	farcall _Squirtbottle
	ret

CardKeyEffect:
	farcall _CardKey
	ret

BasementKeyEffect:
	farcall _BasementKey
	ret

SacredAshEffect:
	farcall _SacredAsh
	ld a, [wItemEffectSucceeded]
	cp $1
	ret nz
	call UseDisposableItem
	ret

NoEffect:
	jp IsntTheTimeMessage

Play_SFX_FULL_HEAL:
	push de
	ld de, SFX_FULL_HEAL
	call WaitPlaySFX
	pop de
	ret

UseItemText:
	ld hl, ItemUsedText
	call PrintText
	call Play_SFX_FULL_HEAL
	call WaitPressAorB_BlinkCursor
UseDisposableItem:
	ld hl, wNumItems
	ld a, 1
	ld [wItemQuantityChange], a
	jp TossItem

UseBallInTrainerBattle:
	call ReturnToBattle_UseBall
	ld de, ANIM_THROW_POKE_BALL
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ld [wBattleAnimParam], a
	ldh [hBattleTurn], a
	ld [wNumHits], a
	predef PlayBattleAnim
	ld hl, BallBlockedText
	call PrintText
	ld hl, BallDontBeAThiefText
	call PrintText
	jr UseDisposableItem

WontHaveAnyEffect_NotUsedMessage:
	ld hl, ItemWontHaveEffectText
	call PrintText

	; Item wasn't used.
	ld a, $2
	ld [wItemEffectSucceeded], a
	ret

LooksBitterMessage:
	ld hl, ItemLooksBitterText
	jp PrintText

Ball_BoxIsFullMessage:
	ld hl, StorageFullText
	jr z, .got_msg
	ld hl, DatabaseTaxedText
.got_msg
	call PrintText

	; Item wasn't used.
	ld a, $2
	ld [wItemEffectSucceeded], a
	ret

CantUseOnEggMessage:
	ld hl, ItemCantUseOnEggText
	jr CantUseItemMessage

IsntTheTimeMessage:
	ld hl, ItemOakWarningText
	jr CantUseItemMessage

WontHaveAnyEffectMessage:
	ld hl, ItemWontHaveEffectText
	jr CantUseItemMessage

BelongsToSomeoneElseMessage: ; unreferenced
	ld hl, ItemBelongsToSomeoneElseText
	jr CantUseItemMessage

CyclingIsntAllowedMessage: ; unreferenced
	ld hl, NoCyclingText
	jr CantUseItemMessage

CantGetOnYourBikeMessage: ; unreferenced
	ld hl, ItemCantGetOnText
	; fallthrough

CantUseItemMessage:
; Item couldn't be used.
	xor a
	ld [wItemEffectSucceeded], a
	jp PrintText

ItemLooksBitterText:
	text_far _ItemLooksBitterText
	text_end

ItemCantUseOnEggText:
	text_far _ItemCantUseOnEggText
	text_end

ItemOakWarningText:
	text_far _ItemOakWarningText
	text_end

ItemBelongsToSomeoneElseText:
	text_far _ItemBelongsToSomeoneElseText
	text_end

ItemWontHaveEffectText:
	text_far _ItemWontHaveEffectText
	text_end

BallBlockedText:
	text_far _BallBlockedText
	text_end

BallDontBeAThiefText:
	text_far _BallDontBeAThiefText
	text_end

NoCyclingText:
	text_far _NoCyclingText
	text_end

ItemCantGetOnText:
	text_far _ItemCantGetOnText
	text_end

StorageFullText:
	text_far _StorageFullText
	text_end

DatabaseTaxedText:
	text_far _StorageFullText
	text_end

ItemUsedText:
	text_far _ItemUsedText
	text_end

ItemGotOnText: ; unreferenced
	text_far _ItemGotOnText
	text_end

ItemGotOffText: ; unreferenced
	text_far _ItemGotOffText
	text_end

ApplyPPUp:
	ld a, MON_MOVES
	call GetPartyParamLocation
	push hl
	ld de, wPPUpPPBuffer
	predef FillPP
	pop hl
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	ld de, wPPUpPPBuffer
	ld b, 0
.loop
	inc b
	ld a, b
	cp NUM_MOVES + 1
	ret z
	ld a, [wUsePPUp]
	dec a ; FALSE?
	jr nz, .use
	ld a, [wMenuCursorY]
	inc a
	cp b
	jr nz, .skip

.use
	ld a, [hl]
	and PP_UP_MASK
	ld a, [de] ; wasted cycle
	call nz, ComputeMaxPP

.skip
	inc hl
	inc de
	jr .loop

ComputeMaxPP:
	push bc
	; Divide the base PP by 5.
	ld a, [de]
	ldh [hDividend + 3], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 4
	call Divide
	; Get the number of PP, which are bits 6 and 7 of the PP value stored in RAM.
	ld a, [hl]
	ld b, a
	swap a
	and $f
	srl a
	srl a
	ld c, a
	; If this value is 0, we are done
	and a
	jr z, .NoPPUp

.loop
	; Normally, a move with 40 PP would have 64 PP with three PP Ups.
	; Since this would overflow into bit 6, we prevent that from happening
	; by decreasing the extra amount of PP each PP Up provides, resulting
	; in a maximum of 61.
	ldh a, [hQuotient + 3]
	cp $8
	jr c, .okay
	ld a, $7

.okay
	add b
	ld b, a
	ld a, [wTempPP]
	dec a
	jr z, .NoPPUp
	dec c
	jr nz, .loop

.NoPPUp:
	ld [hl], b
	pop bc
	ret

RestoreBufferPP:
	ld hl, wBufferMonMoves
	ld de, wBufferMonPP
	ld a, [wMenuCursorY]
	push af
	ld a, BUFFERMON
	ld [wMonType], a
	call _RestoreAllPP
	pop af
	ld [wMenuCursorY], a
	ret

RestoreAllPP:
	ld a, MON_PP
	call GetPartyParamLocation
	push hl
	ld a, MON_MOVES
	call GetPartyParamLocation
	pop de
	xor a ; PARTYMON
	ld [wMonType], a
	; fallthrough
_RestoreAllPP:
	xor a
	ld [wMenuCursorY], a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	and a
	ret z
	push hl
	push de
	push bc
	call GetMaxPPOfMove
	pop bc
	pop de
	ld a, [de]
	and PP_UP_MASK
	ld b, a
	ld a, [wTempPP]
	add b
	ld [de], a
	inc de
	ld hl, wMenuCursorY
	inc [hl]
	pop hl
	dec c
	jr nz, .loop
	ret

GetMaxPPOfMove:
	ld a, [wStringBuffer1 + 0]
	push af
	ld a, [wStringBuffer1 + 1]
	push af

	ld a, [wMonType]
	and a

	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	jr z, .got_partymon ; PARTYMON

	ld hl, wOTPartyMon1Moves
	dec a
	jr z, .got_partymon ; OTPARTYMON

	ld hl, wTempMonMoves
	dec a
	jr z, .got_nonpartymon ; BOXMON

	ld hl, wTempMonMoves ; Wasted cycles
	dec a
	jr z, .got_nonpartymon ; TEMPMON

	ld hl, wBattleMonMoves ; WILDMON
	dec a
	jr z, .got_nonpartymon

	ld hl, wBufferMonMoves ; BUFFERMON

.got_nonpartymon ; BOXMON, TEMPMON, WILDMON
	call GetMthMoveOfCurrentMon
	jr .gotdatmove

.got_partymon ; PARTYMON, OTPARTYMON
	call GetMthMoveOfNthPartymon

.gotdatmove
	ld a, [hl]
	dec a

	push hl
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	ld de, wStringBuffer1
	ld [de], a
	pop hl

	push bc
	ld bc, MON_PP - MON_MOVES
	ld a, [wMonType]
	cp WILDMON
	jr nz, .notwild
	ld bc, wEnemyMonPP - wEnemyMonMoves
.notwild
	add hl, bc
	ld a, [hl]
	and PP_UP_MASK
	pop bc

	or b
	ld hl, wStringBuffer1 + 1
	ld [hl], a
	xor a
	ld [wTempPP], a
	ld a, b ; this gets lost anyway
	call ComputeMaxPP
	ld a, [hl]
	and PP_MASK
	ld [wTempPP], a

	pop af
	ld [wStringBuffer1 + 1], a
	pop af
	ld [wStringBuffer1 + 0], a
	ret

GetMthMoveOfNthPartymon:
	ld a, [wCurPartyMon]
	call AddNTimes

GetMthMoveOfCurrentMon:
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ret