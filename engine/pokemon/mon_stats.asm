DrawPlayerHP:
	ld a, $1
	jr DrawHP

DrawEnemyHP:
	ld a, $2

DrawHP:
	ld [wWhichHPBar], a
	push hl
	push bc
	; box mons have full HP
	ld a, [wMonType]
	cp BOXMON
	jr z, .at_least_1_hp

	ld a, [wTempMonHP]
	ld b, a
	ld a, [wTempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .at_least_1_hp

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .fainted

.at_least_1_hp
	ld a, [wTempMonMaxHP]
	ld d, a
	ld a, [wTempMonMaxHP + 1]
	ld e, a
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon

	ld b, d
	ld c, e

.not_boxmon
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.fainted
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	bccoord 1, 1, 0
	add hl, bc
	ld de, wTempMonHP
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon_2
	ld de, wTempMonMaxHP
.not_boxmon_2
	lb bc, 2, 3
	call PrintNum

	ld a, '/'
	ld [hli], a

; Print max HP
	ld de, wTempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret

SaveLevelUpOldStats::
; hl = a party mon's MON_MAXHP, before a level-up changes its stats. Keep
; the low byte of each stat (HP, Atk, Def, Spe, SpA, SpD) for
; PrintTempMonLevelUpStats: a level-up's gain fits in a byte.
; Preserves all registers.
	push hl
	push de
	push bc
	push af
	ld de, wLevelUpOldStats
	ld b, NUM_STATS
.loop
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	jp PopAFBCDEHL

; scratch for PrintTempMonLevelUpStats
DEF LVUP_OLD_STAT  EQUS "wStringBuffer3"     ; dw, big-endian
DEF LVUP_GAIN      EQUS "wStringBuffer3 + 2" ; db
DEF LVUP_GAIN_LEN  EQUS "wStringBuffer3 + 3" ; db: "+" and its digits
DEF LVUP_SHOW_GAIN EQUS "wStringBuffer3 + 4" ; db

	assert wTempMonSpclDef - wTempMonMaxHP == (NUM_STATS - 1) * 2, \
		"wTempMon's stats must be MaxHP, Atk, Def, Spe, SpA, SpD"

PrintTempMonLevelUpStats:
; After a level-up (wTempMon = the mon now, wLevelUpOldStats from
; SaveLevelUpOldStats), as in Polished Crystal: a box with each stat's
; old value and its gain, then one with the new values. Each waits for
; A or B.
; The gain column is as wide as the largest gain needs.
	lb bc, 2, 0 ; b = width ("+" and 1 digit), c = stat
.width_loop
	call .GetGain
	ld d, 2
	cp 10
	jr c, .got_width
	inc d
	cp 100
	jr c, .got_width
	inc d
.got_width
	ld a, d
	cp b
	jr c, .not_wider
	ld b, a
.not_wider
	inc c
	ld a, c
	cp NUM_STATS
	jr nz, .width_loop
	ld a, b
	ld [LVUP_GAIN_LEN], a

	ld a, TRUE
	call .Page
	xor a ; FALSE
	; fallthrough

.Page:
; a: TRUE = old values and gains, FALSE = new values
	ld [LVUP_SHOW_GAIN], a
; the box: rows 4-11, from column 6 - width to the right edge
	hlcoord 6, 4
	call .LeftByGainLen
	ld b, 6
	ld a, [LVUP_GAIN_LEN]
	add 12
	ld c, a
	call Textbox
	hlcoord 7, 5
	call .LeftByGainLen
	ld de, .Names
	ld bc, .Order
.row
	push bc
	call PlaceString ; keeps hl, leaves de at the "@"
	inc de
	pop bc
	push de
	push hl
	push bc
	ld a, [bc]
	ld c, a
	call .GetGain
	ld de, 9
	add hl, de ; the value column
	ld a, [LVUP_SHOW_GAIN]
	and a
	jr z, .new_value
	push hl
	ld de, LVUP_OLD_STAT
	lb bc, 2, 3
	call PrintNum
	pop hl
	inc hl
	inc hl
	inc hl
	ld [hl], '+'
	inc hl
	ld a, [LVUP_GAIN_LEN]
	dec a
	ld c, a
	dec a
	jr z, .one_digit ; (PrintNum misplaces a lone digit)
	ld b, 1
	ld de, LVUP_GAIN
	call PrintNum
	jr .next_row

.one_digit
	ld a, [LVUP_GAIN]
	add '0'
	ld [hl], a
	jr .next_row

.new_value
	ld b, 0
	push hl
	ld hl, wTempMonMaxHP
	add hl, bc
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	lb bc, 2, 3
	call PrintNum

.next_row
	pop bc
	pop hl
	pop de
	inc bc
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	ld a, [bc]
	cp -1
	jr nz, .row
	jp WaitPressAorB_BlinkCursor

.LeftByGainLen:
; hl -= [LVUP_GAIN_LEN]
	ld a, [LVUP_GAIN_LEN]
	cpl
	inc a
	add l
	ld l, a
	ret c
	dec h
	ret

.GetGain:
; c = stat (MaxHP, Atk, Def, Spe, SpA, SpD). Returns its gain in a and
; LVUP_GAIN, and its old value in LVUP_OLD_STAT. Preserves bc, de, hl.
	push hl
	push de
	push bc
	ld b, 0
	ld hl, wLevelUpOldStats
	add hl, bc
	ld e, [hl]
	ld hl, wTempMonMaxHP
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, [hl]
	sub e
	ld b, a ; gain
	ld a, [hl]
	sub b
	ld [LVUP_OLD_STAT + 1], a
	ld a, d
	sbc 0
	ld [LVUP_OLD_STAT], a
	ld a, b
	ld [LVUP_GAIN], a
	pop bc
	pop de
	pop hl
	ret

.Order:
; shown in this order
	db 0, 1, 2, 4, 5, 3, -1

.Names:
	db "Health@"
	db "Attack@"
	db "Defense@"
	db "Sp.Atk@"
	db "Sp.Def@"
	db "Speed@"

PrintTempMonStats:
; Print wTempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, wTempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, wTempMonDefense
	call .PrintStat
	ld de, wTempMonSpclAtk
	call .PrintStat
	ld de, wTempMonSpclDef
	call .PrintStat
	ld de, wTempMonSpeed
	jp PrintNum

.PrintStat:
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

.StatNames:
	db   "Attack"
	next "Defense"
	next "Spcl.Atk"
	next "Spcl.Def"
	next "Speed"
	next "@"

GetGenderRatio::
; c = species
; Returns the species' gender ratio in c.
	push hl
	push de
	ld a, c
	dec a
	ld hl, BaseData + BASE_GENDER
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarByte
	pop de
	pop hl
	ld c, a
	ret

GetGender:
; Return the gender of a given monster (wCurPartyMon/wCurOTMon/wCurWildMon).
; When calling this function, a should be set to an appropriate wMonType value.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; This is determined by the stored gender bit in the personality word,
; which was already chosen using the species' gender ratio.

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, wPartyMon1Personality
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wMonType]
	and a
	jr z, .PartyMon

	ld hl, wBufferMonPersonality
	cp BUFFERMON
	jr z, .Personality

; 1: OTPartyMon
	ld hl, wOTPartyMon1Personality
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	dec a
	jr z, .sBoxMon

; 3: Unknown
	ld hl, wTempMonPersonality
	dec a
	jr z, .Personality

; else: WildMon
	ld hl, wEnemyMonPersonality
	jr .Personality

; Get our place in the party/box.

.sBoxMon:
	; old box code access; crash
	di
	jp @

.PartyMon:
	ld a, [wCurPartyMon]
	call AddNTimes

.Personality:
; Gender is the high byte of the personality word.
	inc hl
	ld a, [hl]
	and GENDER_MASK
	ld b, a ; b = GENDER_MASK for female, 0 for male

; We still need the gender ratio to handle fixed-gender species.
; GetGenderRatio leaves the ratio in a as well as c, so the personality bit
; can be restored from the stack before the fixed-gender checks below.
	push bc
	ld a, [wCurPartySpecies]
	ld c, a
	call GetGenderRatio
	pop bc

; The higher the ratio, the more likely the monster is to be female.

	cp GENDER_UNKNOWN
	jr z, .Genderless

	and a ; GENDER_F0?
	jr z, .Male

	cp GENDER_F100
	jr z, .Female

; Variable-gender species use the stored personality bit.
	ld a, b
	and a
	jr z, .Male

.Female:
	xor a
	ret

.Male:
	ld a, 1
	and a
	ret

.Genderless:
	scf
	ret

ListMovePP:
	ld a, [wNumMoves]
	inc a
	ld c, a
	ld a, NUM_MOVES
	sub c
	ld b, a
	push hl
	ld a, [wListMovesLineSpacing]
	ld e, a
	ld d, 0
	ld a, $42 ; P
	call .load_loop
	ld a, b
	and a
	jr z, .skip
	ld c, a
	ld a, '-'
	call .load_loop

.skip
	pop hl
	inc hl
	inc hl
	inc hl
	ld d, h
	ld e, l
	ld hl, wTempMonMoves
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	push bc
	push hl
	push de
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callfar GetMaxPPOfMove
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wTempMonPP - (wTempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStringBuffer1 + 4], a
	ld h, d
	ld l, e
	push hl
	ld de, wStringBuffer1 + 4
	lb bc, 1, 2
	call PrintNum
	ld a, '/'
	ld [hli], a
	ld de, wTempPP
	lb bc, 1, 2
	call PrintNum
	pop hl
	ld a, [wListMovesLineSpacing]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .loop

.done
	ret

.load_loop
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .load_loop
	ret

Unused_PlaceEnemyHPLevel:
	push hl
	push hl
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNickname
	pop hl
	call PlaceString
	call CopyMonToTempMon
	pop hl
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	ld bc, -12
	add hl, bc
	ld b, 0
	call DrawEnemyHP
	pop hl
	ld bc, 5
	add hl, bc
	push de
	call PrintLevel
	pop de

.egg
	ret

ListMoves:
; List moves at hl, spaced every [wListMovesLineSpacing] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, 0
.moves_loop
	ld a, [de]
	inc de
	and a
	jr z, .no_more_moves
	push de
	push hl
	push hl
	ld [wCurSpecies], a
	ld a, MOVE_NAME
	ld [wNamedObjectType], a
	call GetName
	ld de, wStringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [wListMovesLineSpacing]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], '-'
	ld a, [wListMovesLineSpacing]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret
	
GetMonTypeIndex:
	; type in c, because farcall clobbers a
	ld a, c
	and TYPE_MASK ; Phys/Spec Split only
;	; Skip Bird
;	cp BIRD
;	jr c, .done
;	cp UNUSED_TYPES
;	dec a
;	jr c, .done
;	sub UNUSED_TYPES
;.done
	ld c, a
	ret

GetStatusConditionIndex:
; de points to status condition bytes of a pokemon from a party_struct or battle_struct
; return the status condition index in 'a', and also 'd' for those who farcall
	push de
	inc de
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr z, .fnt
	ld a, [de]
	ld b, a
	and SLP_MASK
	ld a, 0
	jr nz, .slp
	bit PSN, b
	jr nz, .psn
	bit PAR, b
	jr nz, .par
	bit BRN, b
	jr nz, .brn
	bit FRZ, b
	jr nz, .frz
	ld d, a
	ret
	
.fnt
	inc a ; 6
.frz
	inc a ; 5
.brn
	inc a ; 4
.slp
	inc a ; 3
.par
	inc a ; 2
.psn
	inc a ; 1
	ld d, a
	ret

Player_CheckToxicStatus:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	ret z
	scf ; if we are Toxic'd set carry flag
	ret

Enemy_CheckToxicStatus:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	ret z
	scf ; if we are Toxic'd set carry flag
	ret

Player_LoadNonFaintStatus:
	ld bc, 0	
	call Player_CheckToxicStatus
	jr nc, .player_check_status_nottoxic
	ld a, 7 ; status condition index for Toxic
	jr .player_loadgfx ; yes, we are toxic
.player_check_status_nottoxic
	ld de, wBattleMonStatus
	call GetStatusConditionIndex
	and a
	ret z ; .no_status
	cp $6 ; status condition index for FNT
	ret z
.player_loadgfx
	push af ; status index
; Load Player Status Tiles GFX into VRAM
	ld hl, StatusIconBattleGFX
	ld bc, 2 * TILE_SIZE
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $78
	lb bc, BANK(StatusIconBattleGFX), 2
	call Request2bpp
	pop de ; status index, needs to be in 'd'
	push de ; status condition index
	farcall LoadPlayerStatusIconPalette
	pop af
	cp 6
	jr z, .player_fnt
	ld c, a
	ret
.player_fnt
	xor a
	ld c, a
	ret

Enemy_LoadNonFaintStatus:
	ld bc, 0
	call Enemy_CheckToxicStatus
	jr nc, .enemy_check_nontoxic
	ld a, 7 ; status condition index for Toxic
	jr .enemy_loadgfx ; yes, we are toxic
.enemy_check_nontoxic
	ld de, wEnemyMonStatus
	call GetStatusConditionIndex
	and a ; could also use c but this was a local call, so a is not clobbered
	ret z ; .no_status
	cp $6 ; faint
	ret z
.enemy_loadgfx
; Load Enemy Status Tiles GFX into VRAM
	push af ; status condition index
	ld hl, EnemyStatusIconGFX
	ld bc, 2 * TILE_SIZE
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $7a
	lb bc, BANK(EnemyStatusIconGFX), 2
	call Request2bpp

	pop de ; status condition index, needs to be in 'd'
	push de ; status condition index
	farcall LoadEnemyStatusIconPalette
	pop af ; status condition index
	cp 6 ; index 6 means the mon is fainted
	jr z, .enemy_fnt
	ld c, a ; status condition index
	ret
.enemy_fnt
	xor a ; status condition index
	ld c, a
	ret
