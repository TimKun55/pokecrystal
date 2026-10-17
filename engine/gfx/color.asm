DEF SHINY_ATK_MASK EQU %0010
DEF SHINY_DEF_DV EQU 10
DEF SHINY_SPD_DV EQU 10
DEF SHINY_SPC_DV EQU 10

LoadMonBaseTypePal:
	; destination address of Palette and Slot is passed in 'de'
	; Type Index (already fixed/adjusted if a Special Type) is passed in 'c'
	ld hl, TypeIconPals ; pointer to the Type Colors designated in gfx\types_cats_status_pals.asm
	ld a, c ; c is the Type Index
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 2
	jp FarCopyColorWRAM

LoadSingleBlackPal:
	; Destination address of the Palette and Slot is passed in 'de'
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	xor a ; the color black is $0000
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ldh [rWBK], a
	ret

LoadDexTypePals:
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	ldh [rWBK], a	

	ld hl, TypeIconPals
	ld a, b
	add a
	push bc
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 2
	push de
	call FarCopyColorWRAM
	pop de

	ld hl, TypeIconPals
	pop bc
	ld a, c
	add a
	ld c, a
	ld b, 0
	add hl, bc
	inc de
	inc de
	ld bc, 2
	push de
	call FarCopyColorWRAM
	pop de
	inc de
	inc de

	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	ldh [rWBK], a
	ret

CheckShininess:
; Check if a mon is shiny by DVs at bc.
; Return carry if shiny.

	ld l, c
	ld h, b

; Attack
	ld a, [hl]
	and SHINY_ATK_MASK << 4
	jr z, .not_shiny

; Defense
	ld a, [hli]
	and %1111
	cp SHINY_DEF_DV
	jr nz, .not_shiny

; Speed
	ld a, [hl]
	and %1111 << 4
	cp SHINY_SPD_DV << 4
	jr nz, .not_shiny

; Special
	ld a, [hl]
	and %1111
	cp SHINY_SPC_DV
	jr nz, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret
	
LoadCPaletteBytesFromHLIntoDE:
	; Loads the number of Palettes passed in 'c' when called
	; Source address is 'hl'
	; Destination address is 'de'
	ldh a, [rWBK]
	push af
	ld a, BANK("GBC Video")
	ldh [rWBK], a
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rWBK], a
	ret

InitPartyMenuStatusPals:
	ld hl, StatusIconPals
	ld c, $1 ; PSN Index
	ld b, 0
	add hl, bc
	add hl, bc
	ld de, wBGPals1 palette 4 + 2 ; Color 2 of Palette 4 (Light Gray Pixels)
	ld bc, 2 ; 1 Color (2 bytes)
	call FarCopyColorWRAM

	ld hl, StatusIconPals
	ld c, $2 ; PAR Index
	ld b, 0
	add hl, bc
	add hl, bc
	ld de, wBGPals1 palette 5 + 2 ; Color 2 of Palette 5 (Light Gray Pixels)
	ld bc, 2 ; 1 Color (2 bytes)
	call FarCopyColorWRAM

	ld hl, StatusIconPals
	ld c, $3 ; SLP Index
	ld b, 0
	add hl, bc
	add hl, bc
 	ld de, wBGPals1 palette 6 + 2 ; Color 2 of Palette 6 (Light Gray Pixels)
	ld bc, 2 ; 1 Color (2 bytes)
	call FarCopyColorWRAM

	ld hl, StatusIconPals
	ld c, $4 ; BRN Index
	ld b, 0
	add hl, bc
	add hl, bc
	ld de, wBGPals1 palette 4 + 4 ; Color 3 of Palette 4 (Dark Gray Pixels)
	ld bc, 2 ; 1 Color (2 bytes)
	call FarCopyColorWRAM

	ld hl, StatusIconPals
	ld c, $5 ; FRZ Index
	ld b, 0
	add hl, bc
	add hl, bc
	ld de, wBGPals1 palette 5 + 4 ; Color 3 of Palette 5 (Dark Gray Pixels)
	ld bc, 2 ; 1 Color (2 bytes)
	jp FarCopyColorWRAM

LoadBattleCategoryAndTypePals:
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
	and ~TYPE_MASK ; Phys/Spec split only
	swap a ; Phys/Spec split only
	srl a ; Phys/Spec split only
	srl a ; Phys/Spec split only
	dec a ; Phys/Spec split only
	ld b, a ; Move Category Index
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
	; type index is already in c
	ld de, wBGPals1 palette 5
	; fallthrough	
;LoadCategoryAndTypePals:
	; given: de holds the address of destination Palette and Slot
	; adding a single white pal the way vanilla game does it
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de ; slot 1 + 1 byte, now pointing at 2nd byte of slot 1
	ld a, HIGH(PALRGB_WHITE)
	ld [de], a
	inc de ; now pointing at slot 2
	pop af
	ldh [rWBK], a
	; done adding the single white pal

	ld hl, CategoryIconPals ; from gfx\types_cats_status_pals.asm
	ld a, b
	add a ; doubles the Category Index
	add a ; Quadruples the Category Index
	; each Category has two colors, so each entry is 4 bytes long, 2 bytes per Color
	push bc
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 4 ; 4 bytes worth of colors means 2 slots are being filled at the same time, the two category colors
	push de
	call FarCopyColorWRAM
	pop de ; still pointing to Slot 2 of the Palette

	ld hl, TypeIconPals ; from gfx\types_cats_status_pals.asm
	pop bc
	ld a, c
	add a ; doubles the Index, since each color is 2 bytes
	ld c, a
	ld b, 0
	add hl, bc
	inc de 
	inc de
	inc de
	inc de ; incs 4 bytes, skips 2 slots of a Palette, now at Slot 4
	ld bc, 2 ; 2 bytes, 1 color, the type color in slot 4
	jp FarCopyColorWRAM
	
LoadEnemyBattleCGBLayoutStatusIconPalette:
	ld bc, 0	
	farcall Enemy_CheckToxicStatus
	jr nc, .check_status_nottoxic
	ld c, 7
.check_status_nottoxic
	ld a, 7
	cp c ; checking if we are Toxic'd
	jr z, .enemy_gotstatus ; yes, we are toxic
	ld de, wEnemyMonStatus
	predef GetStatusConditionIndex
	ld a, d
	and a
	ret z ; .no_status
	cp $6 ; faint
	ret z
.enemy_gotstatus
	ld d, a
LoadEnemyStatusIconPalette:
	ld a, [wEnemySubStatus2]
	ld de, wEnemyMonStatus
	farcall GetStatusConditionIndex ; status cond. index returned in 'd'
	ld hl, StatusIconPals ; from gfx\types_cats_status_pals.asm
	ld c, d
	ld b, 0
	add hl, bc ; add the index twice because file is list of colors 2 bytes each
	add hl, bc
	ld de, wBGPals1 palette 6 + 4 ; slot 3 of Palette 6
	ld bc, 2 ; two bytes, 1 color
	jp FarCopyColorWRAM
	
LoadPlayerBattleCGBLayoutStatusIconPalette:
	ld bc, 0	
	farcall Player_CheckToxicStatus
	jr nc, .check_status_nottoxic
	ld c, 7
.check_status_nottoxic
	ld a, 7
	cp c ; checking if we are Toxic'd
	jr z, .player_gotstatus ; yes, we are toxic
	ld de, wBattleMonStatus
	farcall GetStatusConditionIndex
	ld a, d
	and a
	ret z ; .no_status
	cp $6 ; faint
	ret z
.player_gotstatus
	ld d, a
	jp LoadPlayerStatusIconPalette
LoadSummaryScreenStatusIconPalette:
	ld de, wTempMonStatus
	predef GetStatusConditionIndex
	; index is in 'd'
LoadPlayerStatusIconPalette:
	; given: Status condition index in 'd'
	ld hl, StatusIconPals
	ld c, d
	ld b, 0
	add hl, bc ; pointers are 2 bytes long, so double the index to point at the right color
	add hl, bc
	ld de, wBGPals1 palette 6 + 2 ; slot 2 of pal 6
	ld bc, 2 ; number of bytes of the color, 2 bytes per slot
	jp FarCopyColorWRAM

Unused_CheckShininess:
; Return carry if the DVs at hl are all 10 or higher.

; Attack
	ld a, [hl]
	cp 10 << 4
	jr c, .not_shiny

; Defense
	ld a, [hli]
	and %1111
	cp 10
	jr c, .not_shiny

; Speed
	ld a, [hl]
	cp 10 << 4
	jr c, .not_shiny

; Special
	ld a, [hl]
	and %1111
	cp 10
	jr c, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret

InitPartyMenuPalettes:
	ld hl, PalPacket_PartyMenu
	call CopyFourPalettes

	ld hl, PartyMenuGenderPalette
	ld de, wBGPals1 palette 0
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	
	call InitPartyMenuOBPals
	call WipeAttrmap
	ret

LoadTrainerClassPaletteAsNthBGPal:
	ld a, [wTrainerClass]
	call GetTrainerPalettePointer
	ld a, e
	jr LoadNthMiddleBGPal

LoadMonPaletteAsNthBGPal:
	ld a, [wCurPartySpecies]
	call _GetMonPalettePointer
	ld a, e
	bit 7, a
	jr z, LoadNthMiddleBGPal
	and $7f
	inc hl
	inc hl
	inc hl
	inc hl

LoadNthMiddleBGPal:
	push hl
	ld hl, wBGPals1
	ld de, 1 palettes
.loop
	and a
	jr z, .got_addr
	add hl, de
	dec a
	jr .loop

.got_addr
	ld e, l
	ld d, h
	pop hl
	call LoadPalette_White_Col1_Col2_Black
	ret

;ApplyMonOrTrainerPals:
;	call CheckCGB
;	ret z
;	ld a, e
;	and a
;	jr z, .get_trainer
;	ld a, [wCurPartySpecies]
;	call GetMonPalettePointer
;	jr .load_palettes
;
;.get_trainer
;	ld a, [wTrainerClass]
;	call GetTrainerPalettePointer
;
;.load_palettes
;	ld de, wBGPals1
;	call LoadPalette_White_Col1_Col2_Black
;	call WipeAttrmap
;	call ApplyAttrmap
;	call ApplyPals
;	ret
;
ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, wBGPals2 palette PAL_BATTLE_BG_ENEMY_HP color 1
	jr .okay

.Player:
	ld de, wBGPals2 palette PAL_BATTLE_BG_PLAYER_HP color 1

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	ld bc, 4
	ld a, BANK(wBGPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	call FillBoxCGB
	ret

LoadSummaryScreenPals:
	call CheckCGB
	ret z
	ld hl, SummaryScreenPals
	ld b, 0
	add hl, bc
	add hl, bc
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld a, [hli] ; byte 1 of the summary screen page color
	ld [wBGPals1 palette 2], a ; into slot 1 byte 1 of pal 2
	ld [wBGPals1 palette 6 + 4], a ; into slot 2 byte 1 of pal 6
	ld a, [hl]
	ld [wBGPals1 palette 2 + 1], a ; into slot 1 byte 2 of pal 2
	ld [wBGPals1 palette 6 + 5], a ; into slot 2 byte 2 of pal 6

	xor a ; loading black into slot 4 of pal 6 and 7
	ld [wBGPals1 palette 6 + 6], a
	ld [wBGPals1 palette 6 + 7], a
	ld [wBGPals1 palette 7 + 6], a
	ld [wBGPals1 palette 7 + 7], a
.done
	pop af
	ldh [rWBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	call ApplyAttrmap
	ret

.MailPals:
INCLUDE "gfx/mail/mail.pal"

INCLUDE "engine/gfx/cgb_layouts.asm"

CopyFourPalettes:
	ld de, wBGPals1
	ld c, 4

CopyPalettes:
.loop
	push bc
	ld a, [hli]
	push hl
	call GetPredefPal
	call LoadHLPaletteIntoDE
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetPredefPal:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PredefPals
	add hl, bc
	ret

LoadHLPaletteIntoDE:
	ld c, 1 palettes
LoadHLBytesIntoDE:
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rWBK], a
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rWBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a

	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_WHITE)
	ld [de], a
	inc de

	ld c, 2 * COLOR_SIZE
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ldh [rWBK], a
	ret

ApplyWhiteTransparency:
; Blend the BGR555 colour in bc halfway towards white (31, 31, 31), so each
; channel becomes (channel >> 1) + 16.
	res 7, b ; clear the unused 16th colour bit
	res 2, b ; and blue's LSB, so the shifts can't bleed between channels
	ld a, c
	and LOW(palred 30 + palgreen 30 + palblue 30) ; ditto for red and green
	srl b
	rra ; the carry holds green's LSB, which belongs back at the top of a
	add LOW(palred 16 + palgreen 16 + palblue 16)
	ld c, a
	adc HIGH(palred 16 + palgreen 16 + palblue 16)
	add b ; fold the low byte's carry back into the high byte
	sub c
	ld b, a
	ret

FillBoxCGB:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a

	ld hl, wBGPals1
	ld c, 1 palettes
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ldh [rWBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

WipeAttrmap:
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	ret

ApplyPals:
	ld hl, wBGPals1
	ld de, wBGPals2
	ld bc, 16 palettes
	ld a, BANK(wGBCPalettes)
	call FarCopyWRAM
	ret

ApplyAttrmap:
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr z, .UpdateVBank1
	ldh a, [hBGMapMode]
	push af
	ld a, $2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	ret

.UpdateVBank1:
	hlcoord 0, 0, wAttrmap
	debgcoord 0, 0 ; vBGMap2
	ld b, SCREEN_HEIGHT
	ld a, $1
	ldh [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, TILEMAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	ld a, $0
	ldh [rVBK], a
	ret

; CGB layout for CGB_PARTY_MENU_HP_BARS
CGB_ApplyPartyMenuHPPals:
	ld hl, wHPPals
	ld a, [wPalScratch]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wPalScratch]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	call FillBoxCGB
	ret

InitPartyMenuOBPals:
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret

SetFirstOBJPalette::
; input: e must contain the offset of the selected palette from PartyMenuOBPals
	ld hl, PartyMenuOBPals
	ld d, 0
	add hl, de
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	jp ApplyPals

SetSecondOBJPalette::
; input: e must contain the offset of the selected palette from PartyMenuOBPals
	ld hl, PartyMenuOBPals
	ld d, 0
	add hl, de
	ld de, wOBPals1 palette 1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	jp ApplyPals

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	push de
	farcall GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempEnemyMonSpecies]
	call GetFrontpicPalettePointer
	pop de
	ret

GetPlayerOrMonPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .male
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .lyra
	ld a, [wPlayerGender]
	and a
	jr z, .male
	ld hl, KrisPalette
	ret

.male
	ld hl, PlayerPalette
	ret

.lyra
	ld hl, LyraPalette
	ret

GetFrontpicPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [wTrainerClass]

GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

GetPaintingPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PaintingPalettes
	add hl, bc
	ret

GetMonPalettePointer:
	call _GetMonPalettePointer
	ret

BattleObjectPals:
INCLUDE "gfx/battle_anims/battle_anims.pal"

_GetMonPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

GetMonNormalOrShinyPalettePointer:
	push bc
	call _GetMonPalettePointer
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr
	ret

InitCGBPals::
	call CheckCGB
	ret z

; CGB only
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	ld hl, STARTOF("VRAM1")
	ld bc, SIZEOF("VRAM1")
	xor a
	call ByteFill
	ld a, BANK(vTiles0)
	ldh [rVBK], a
	ld a, BGPI_AUTOINC
	ldh [rBGPI], a
	ld c, 4 palettes
.bgpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rBGPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, OBPI_AUTOINC
	ldh [rOBPI], a
	ld c, 4 palettes
.obpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rOBPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, wBGPals1
	call .LoadWhitePals
	ld hl, wBGPals2
	call .LoadWhitePals
	pop af
	ldh [rWBK], a
	ret

.LoadWhitePals:
	ld c, 8 palettes
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .loop
	ret


; Palette packet data for the CGB layout engine
INCLUDE "engine/gfx/pal_packets.asm"

PredefPals:
	table_width PAL_SIZE
INCLUDE "gfx/predef.pal"
	assert_table_length NUM_PREDEF_PALS

InitCGBBorderStub:
; SGB support removed: kept as a predef stub for stable predef indices.
	ret

HPBarPals:
INCLUDE "gfx/battle/hp_bar.pal"

ExpBarPalette:
INCLUDE "gfx/battle/exp_bar.pal"

GenderPalette:
INCLUDE "gfx/battle/gender.pal"

EggSummaryPals:
INCLUDE "gfx/summary/egg_summary.pal"

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

INCLUDE "data/paintings/palettes.asm"

ItemIconPalettes:
INCLUDE "gfx/items/items.pal"

TMHMTypeIconPals:
INCLUDE "gfx/tm_hm_types.pal"

LoadMapPals:
	farcall LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wEnvironment]
	maskbits NUM_ENVIRONMENTS + 1
	ld e, a
	ld d, 0
	ld hl, EnvironmentColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, wBGPals1
	ld b, 8
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ldh [rWBK], a

.got_pals
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	farcall LoadSpecialNPCPalette

	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	ret nz
.outside
	ld a, [wMapGroup]
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, RoofPals
	add hl, de
	add hl, de
	add hl, de
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp NITE_F
	ld de, 4
	jr z, .nite
	jr c, .morn_day
; eve
	add hl, de
.nite
	add hl, de
.morn_day
	ld de, wBGPals1 palette PAL_BG_ROOF color 1
	ld bc, 4
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	; Day Care outdoor palettes
	ld a, [wMapGroup]
	cp GROUP_ROUTE_34
	ret nz

	ld a, [wMapNumber]
	cp MAP_ROUTE_34
	ret nz

	ld a, BANK(wBreedMon1Species)
	ld hl, wBreedMon1Species
	call GetFarWRAMByte
	and a
	jr z, .day_care_mon_2
	ld [wCurPartySpecies], a

	ld hl, wBreedMon1DVs ; HL now points to the params of the wBreedMon1, which is needed by GetMenuMonIconPalette to determine if it's shiny.
	ld de, GetMenuMonIconPalette
	ld a, BANK(GetMenuMonIconPalette)
	call FarCall_de
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, PartyMenuOBPals
	add hl, de

	inc hl
	inc hl

	ld de, wOBPals1 palette PAL_OW_PURPLE + 2
	ld bc, 1 palettes - 2
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.day_care_mon_2
	ld a, BANK(wBreedMon2Species)
	ld hl, wBreedMon2Species
	call GetFarWRAMByte
	and a
	ret z
	ld [wCurPartySpecies], a

	ld hl, wBreedMon2DVs ; HL now points to the params of the wBreedMon2, which is needed by GetMenuMonIconPalette to determine if it's shiny.
	ld de, GetMenuMonIconPalette
	ld a, BANK(GetMenuMonIconPalette)
	call FarCall_de
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, PartyMenuOBPals
	add hl, de

	inc hl
	inc hl

	ld de, wOBPals1 palette PAL_OW_ROCK + 2
	ld bc, 1 palettes - 2
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret

INCLUDE "gfx/type_pals.asm"

INCLUDE "data/maps/environment_colors.asm"

INCLUDE "gfx/types_cats_status_pals.asm"

PartyMenuBGPalette:
INCLUDE "gfx/summary/party_menu_bg.pal"

PartyMenuGenderPalette:
INCLUDE "gfx/summary/party_menu_gender.pal"

BillsPC_ThemePals:
	table_width COLOR_SIZE * 4
INCLUDE "gfx/pc/themes.pal"
	assert_table_length NUM_BILLS_PC_THEMES

BillsPC_CursorPalette:
	; middle colors are set dynamically
	RGB 31,31,31, 31,31,31, 00,00,00, 00,00,00
BillsPC_PackPalette:
	RGB 31,31,31, 31,31,31, 07,19,07, 00,00,00
BillsPC_WhitePalette:
	RGB 31,31,31, 31,31,31, 31,31,31, 31,31,31

TilesetBGPalette:
INCLUDE "gfx/tilesets/bg_tiles.pal"

MapObjectPals::
INCLUDE "gfx/overworld/npc_sprites.pal"

RoofPals:
	table_width COLOR_SIZE * 3 * 2
INCLUDE "gfx/tilesets/roofs.pal"
	assert_table_length NUM_MAP_GROUPS + 1

DiplomaPalettes:
INCLUDE "gfx/diploma/diploma.pal"

PartyMenuOBPals:
INCLUDE "gfx/summary/party_menu_ob.pal"

MalePokegearPals:
INCLUDE "gfx/pokegear/pokegear.pal"

FemalePokegearPals:
INCLUDE "gfx/pokegear/pokegear_f.pal"

SlotMachinePals:
INCLUDE "gfx/slots/slots.pal"

LoadPokemonPalette:
	ld a, [wCurPartySpecies]
	; hl = palette
	call GetMonPalettePointer
	; load palette into de (set by caller)
	ld bc, COLOR_SIZE * 2
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

LoadTrainerPalette:
	ld a, [wTrainerClass]
	; hl = palette
	call GetTrainerPalettePointer
	; load palette into de (set by caller)
	ld bc, COLOR_SIZE * 2
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

LoadPaintingPalette:
	ld a, [wTrainerClass]
	; hl = palette
	call GetPaintingPalettePointer
	; load palette into de (set by caller)
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 8
	jp FarCopyWRAM
