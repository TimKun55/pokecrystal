; TrainerCard.Jumptable indexes
	const_def
	const TRAINERCARDSTATE_PAGE1_LOADGFX ; 0
	const TRAINERCARDSTATE_PAGE1_JOYPAD  ; 1
	const TRAINERCARDSTATE_PAGE2_LOADGFX ; 2
	const TRAINERCARDSTATE_PAGE2_JOYPAD  ; 3
	const TRAINERCARDSTATE_PAGE3_LOADGFX ; 4
	const TRAINERCARDSTATE_PAGE3_JOYPAD  ; 5
	const TRAINERCARDSTATE_QUIT          ; 6

TrainerCard:
	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .InitRAM
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	ldh a, [hJoyLast]
	and B_BUTTON
	jr nz, .quit
	call .RunJumptable
	call DelayFrame
	jr .loop

.quit
	pop af
	ld [wOptions], a
	pop af
	ld [wStateFlags], a
	ret

.InitRAM:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD

	farcall GetCardPic

	ld hl, BadgeBorderGFX
	ld de, vTiles2 tile $7c
	ld bc, 2 tiles
	ld a, BANK(BadgeBorderGFX)
	call FarCopyBytes

	call TrainerCard_PrintTopHalfOfCard

	call EnableLCD
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ld hl, wJumptableIndex
	xor a ; TRAINERCARDSTATE_PAGE1_LOADGFX
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTrainerCardBadgeFrameCounter
	ld [hli], a ; wTrainerCardBadgeTileID
	ld [hl], a  ; wTrainerCardBadgeAttributes
	ret

.RunJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
; entries correspond to TRAINERCARDSTATE_* constants
	dw TrainerCard_Page1_LoadGFX
	dw TrainerCard_Page1_Joypad
	dw TrainerCard_Page2_LoadGFX
	dw TrainerCard_Page2_Joypad
	dw TrainerCard_Page3_LoadGFX
	dw TrainerCard_Page3_Joypad
	dw TrainerCard_Quit

TrainerCard_IncrementJumptable:
	ld hl, wJumptableIndex
	inc [hl]
	ret

TrainerCard_Quit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TrainerCard_Page1_LoadGFX:
	call ClearSprites
	hlcoord 0, 9
	ld d, 6
	call TrainerCard_BadgeBorder
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ld de, TrainerCardExtraGFX
	ld hl, vTiles2 tile $33
	lb bc, BANK(TrainerCardExtraGFX), 32
	call Request2bpp
	ld de, TrainerCardLogoGFX
	ld hl, vTiles2 tile $53
	lb bc, BANK(TrainerCardLogoGFX), 36
	call Request2bpp
	call TrainerCard_BottomCard
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page1_Joypad:
	call TrainerCard_Page1_PrintGameTime
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT | A_BUTTON
	jr nz, .pressed_right_a
	ret

.pressed_right_a
	ld a, TRAINERCARDSTATE_PAGE2_LOADGFX
	ld [wJumptableIndex], a
	ret

TrainerCard_Page2_LoadGFX:
	call ClearSprites
	hlcoord 0, 9
	ld d, 6
	call TrainerCard_BadgeBorder
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD_JOHTO
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ld de, LeaderGFX
	ld hl, vTiles2 tile $34
	lb bc, BANK(LeaderGFX), 72
	call Request2bpp
	ld de, BadgeGFX
	ld hl, vTiles0 tile $00
	lb bc, BANK(BadgeGFX), 44
	call Request2bpp
	ld hl, TrainerCard_JohtoBadgesOAM
	call TrainerCard_Page2_3_InitObjectsAndStrings
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page2_Joypad:
	call TrainerCard_Page1_PrintGameTime
	ld hl, TrainerCard_JohtoBadgesOAM
	call TrainerCard_Page2_3_AnimateBadges
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	ld a, [wKantoBadges]
	and a
	jr nz, .has_kanto_badges
	ld a, [hl]
	and A_BUTTON
	jr nz, .Quit
	ret

.has_kanto_badges
	ld a, [hl]
	and D_RIGHT | A_BUTTON
	jr nz, .pressed_right_a
	ret

.pressed_left
	ld a, TRAINERCARDSTATE_PAGE1_LOADGFX
	ld [wJumptableIndex], a
	ret

.pressed_right_a
	ld a, TRAINERCARDSTATE_PAGE3_LOADGFX
	ld [wJumptableIndex], a
	ret

.Quit:
	ld a, TRAINERCARDSTATE_QUIT
	ld [wJumptableIndex], a
	ret

TrainerCard_Page3_LoadGFX:
	call ClearSprites
	hlcoord 0, 9
	ld d, 6
	call TrainerCard_BadgeBorder
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD_KANTO
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ld de, LeaderGFX2
	ld hl, vTiles2 tile $34
	lb bc, BANK(LeaderGFX2), 72
	call Request2bpp
	ld de, BadgeGFX2
	ld hl, vTiles0 tile $00
	lb bc, BANK(BadgeGFX2), 44
	call Request2bpp
	ld hl, TrainerCard_KantoBadgesOAM
	call TrainerCard_Page2_3_InitObjectsAndStrings
	call TrainerCard_IncrementJumptable
	ret

TrainerCard_Page3_Joypad:
	call TrainerCard_Page1_PrintGameTime
	ld hl, TrainerCard_KantoBadgesOAM
	call TrainerCard_Page2_3_AnimateBadges
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressed_a
	ret

.pressed_left
	ld a, TRAINERCARDSTATE_PAGE2_LOADGFX
	ld [wJumptableIndex], a
	ret

.pressed_a
	ld a, TRAINERCARDSTATE_QUIT
	ld [wJumptableIndex], a
	ret

TrainerCard_PrintTopHalfOfCard:
	hlcoord 0, 0
	ld d, 5
	call TrainerCard_InitBorder
	hlcoord 2, 1
	ld de, .Name_Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 2
	ld de, .ID_Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 3
	ld de, .Dex_Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 5
	ld de, .Money_Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 7
	ld de, .PlayTime_Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 5, 1
	ld de, wPlayerName
	call PlaceString
	hlcoord 5, 2
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum

	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 5, 3
	lb bc, 1, 3
	call PrintNum

	hlcoord 5, 5
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum

	call TrainerCard_Page1_PrintGameTime

	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ldh [hGraphicStartTile], a
	predef PlaceGraphic
	ret

.Name_Tilemap:
	db $2b, $2d, $2c, -1 ; Name icon

.ID_Tilemap:
	db $2b, $2e, $2c, -1 ; ID icon

.Dex_Tilemap:
	db $2b, $31, $2c, -1 ; Dex icon

.Money_Tilemap:
	db $2b, $2f, $2c, -1 ; Money icon

.PlayTime_Tilemap:
	db $2b, $30, $2c, -1 ; Time icon

TrainerCard_BottomCard:
	hlcoord 0, 12
	ld de, .JohtoTop
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 0, 13
	ld de, .JohtoTopMid
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 0, 14
	ld de, .JohtoBottomMid
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 0, 15
	ld de, .JohtoBottom
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 4, 10
	ld de, .TrainerCardLogoTop
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 4, 11
	ld de, .TrainerCardLogoMid
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 4, 12
	ld de, .TrainerCardLogoBottom
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 16, 12
	ld de, .KantoTop
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 16, 13
	ld de, .KantoTopMid
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 16, 14
	ld de, .KantoBottomMid
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 16, 15
	ld de, .KantoBottom
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 7, 14
	ld de, .Badges
	call PlaceString
	ret

.JohtoTop:
	db $33, $34, $35, $36, -1

.JohtoTopMid:
	db $37, $38, $39, $3a, -1

.JohtoBottomMid:
	db $3b, $3c, $3d, $3e, -1

.JohtoBottom:
	db $3f, $40, $41, $42, -1

.TrainerCardLogoTop:
	db $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, -1
	
.TrainerCardLogoMid:
	db $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, -1
	
.TrainerCardLogoBottom:
	db $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $76, -1

.KantoTop:
	db $43, $44, $45, $46, -1

.KantoTopMid:
	db $47, $48, $49, $4a, -1

.KantoBottomMid:
	db $4b, $4c, $4d, $4e, -1

.KantoBottom:
	db $4f, $50, $51, $52, -1

.Badges:
	db "Badges▶@"

TrainerCard_Page2_3_InitObjectsAndStrings:
	push hl

	hlcoord 0, 10
	ld a, $34
	ld c, 4
.loop
	call TrainerCard_Page2_3_PlaceLeadersFaces
rept 5
	inc hl
endr
	dec c
	jr nz, .loop
	hlcoord 0, 14
	ld a, $58
	ld c, 4
.loop2
	call TrainerCard_Page2_3_PlaceLeadersFaces
rept 5
	inc hl
endr
	dec c
	jr nz, .loop2
	xor a
	ld [wTrainerCardBadgeFrameCounter], a
	pop hl
	call TrainerCard_Page2_3_OAMUpdate
	ret

TrainerCardSetup_PlaceTilemapString:
.loop
	ld a, [de]
	cp -1
	ret z
	ld [hli], a
	inc de
	jr .loop

TrainerCard_InitBorder:
	ld a, $23
	ld [hli], a
	
	ld e, SCREEN_WIDTH - 2
.loop1
	ld a, $24
	ld [hli], a
	dec e
	jr nz, .loop1

	ld a, $25
	ld [hli], a

	ld a, $26
	ld [hli], a
	
	ld e, SCREEN_WIDTH - 2
	ld a, " "
.loop2
	ld [hli], a
	dec e
	jr nz, .loop2

	ld a, $2a
	ld [hli], a
.loop3
	ld a, $26
	ld [hli], a

	ld e, SCREEN_WIDTH - 2
	ld a, " "
.loop4
	ld [hli], a
	dec e
	jr nz, .loop4

	ld a, $2a
	ld [hli], a

	dec d
	jr nz, .loop3

	ld a, $26
	ld [hli], a
	
	ld e, SCREEN_WIDTH - 2
	ld a, " "
.loop5
	ld [hli], a
	dec e
	jr nz, .loop5

	ld a, $2a
	ld [hli], a

	ld a, $27
	ld [hli], a
	
	ld e, SCREEN_WIDTH - 2
.loop7
	ld a, $28
	ld [hli], a
	dec e
	jr nz, .loop7

	ld a, $29
	ld [hli], a
	ret

TrainerCard_BadgeBorder:
	ld e, SCREEN_WIDTH
.loop1
	ld a, $7c
	ld [hli], a
	dec e
	jr nz, .loop1

.loop2
	ld e, SCREEN_WIDTH
.loop3
	ld a, " "
	ld [hli], a
	dec e
	jr nz, .loop3

	dec d
	jr nz, .loop2

	ld e, SCREEN_WIDTH
.loop4
	ld a, " "
	ld [hli], a
	dec e
	jr nz, .loop4

	ld e, SCREEN_WIDTH
.loop5
	ld a, $7d
	ld [hli], a
	dec e
	jr nz, .loop5
	ret

TrainerCard_Page2_3_PlaceLeadersFaces:
	push de
	push hl
;	ld [hli], a
;	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 3
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 3
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	pop hl
	pop de
	ret

TrainerCard_Page1_PrintGameTime:
	hlcoord 5, 7
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ldh a, [hVBlankCounter]
	and $1f
	ret nz
	hlcoord 9, 7
	ld a, [hl]
	xor " " ^ $32 ; alternate between space and small colon ($32) tiles
	ld [hl], a
	ret

TrainerCard_Page2_3_AnimateBadges:
	ldh a, [hVBlankCounter]
	and %111
	ret nz
	ld a, [wTrainerCardBadgeFrameCounter]
	inc a
	and %111
	ld [wTrainerCardBadgeFrameCounter], a
	jr TrainerCard_Page2_3_OAMUpdate

TrainerCard_Page2_3_OAMUpdate:
; copy flag array pointer
	ld a, [hli]
	ld e, a
	ld a, [hli]
; get flag array
	ld d, a
	ld a, [de]
	ld c, a
	ld de, wShadowOAMSprite00
	ld b, NUM_JOHTO_BADGES
.loop
	srl c
	push bc
	jr nc, .skip_badge
	push hl
	ld a, [hli] ; y
	ld b, a
	ld a, [hli] ; x
	ld c, a
	ld a, h
	ld [wTrainerCardBadgePaletteAddr], a
	ld a, l
	ld [wTrainerCardBadgePaletteAddr + 1], a
rept 4
	inc hl
endr
	ld a, [wTrainerCardBadgeFrameCounter]
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld [wTrainerCardBadgeTileID], a
	call .PrepOAM
	pop hl
.skip_badge
	ld bc, $e ; 6 + 2 * 4
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrepOAM:
	ld a, [wTrainerCardBadgeTileID]
	and 1 << 7
	jr nz, .xflip
	ld hl, .facing1
	jr .loop2

.xflip
	ld hl, .facing2
.loop2
	ld a, [hli]
	cp -1
	ret z
	add b
	ld [de], a ; y
	inc de

	ld a, [hli]
	add c
	ld [de], a ; x
	inc de

	ld a, [wTrainerCardBadgeTileID]
	and $ff ^ (1 << 7)
	add [hl]
	ld [de], a ; tile id
	inc hl
	inc de

	push hl
	push bc
	ld a, [wTrainerCardBadgePaletteAddr]
	ld h, a
	ld a, [wTrainerCardBadgePaletteAddr + 1]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, h
	ld [wTrainerCardBadgePaletteAddr], a
	ld a, l
	ld [wTrainerCardBadgePaletteAddr + 1], a
	ld a, b
	pop bc
	pop hl
	add [hl]
	ld [de], a ; attributes
	inc hl
	inc de
	jr .loop2


.facing1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $01, 0
	dsprite  1,  0,  0,  0, $02, 0
	dsprite  1,  0,  1,  0, $03, 0
	db -1

.facing2
	dsprite  0,  0,  0,  0, $01, 0 | X_FLIP
	dsprite  0,  0,  1,  0, $00, 0 | X_FLIP
	dsprite  1,  0,  0,  0, $03, 0 | X_FLIP
	dsprite  1,  0,  1,  0, $02, 0 | X_FLIP
	db -1

TrainerCard_JohtoBadgesOAM:
; Template OAM data for Johto badges on the trainer card.
; Format:
	; y, x, palette
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wJohtoBadges

	; Zephyrbadge
	db $64, $20, 0, 0, 0, 0
	db $00, $20, $24, $20 | (1 << 7)
	db $00, $20, $24, $20 | (1 << 7)

	; Hivebadge
	db $64, $48, 1, 1, 1, 1
	db $04, $20, $24, $20 | (1 << 7)
	db $04, $20, $24, $20 | (1 << 7)

	; Plainbadge
	db $64, $70, 2, 2, 2, 2
	db $08, $20, $24, $20 | (1 << 7)
	db $08, $20, $24, $20 | (1 << 7)

	; Fogbadge
	; X-flips on alternate cycles.
	db $64, $98, 3, 3, 3, 3
	db $0c, 		   $20, $24, $20 | (1 << 7)
	db $0c | (1 << 7), $20, $24, $20 | (1 << 7)

	; Mineralbadge
	db $84, $48, 5, 5, 5, 5
	db $10, $20, $24, $20 | (1 << 7)
	db $10, $20, $24, $20 | (1 << 7)

	; Stormbadge
	; X-flips on alternate cycles.
	db $84, $20, 4, 4, 4, 4
	db $14, 		   $20, $24, $20 | (1 << 7)
	db $14 | (1 << 7), $20, $24, $20 | (1 << 7)

	; Glacierbadge
	db $84, $70, 6, 6, 6, 6
	db $18, $20, $24, $20 | (1 << 7)
	db $18, $20, $24, $20 | (1 << 7)

	; Risingbadge
	db $84, $98, 7, 7, 7, 7
	db $1c, $20, $24, $20 | (1 << 7)
	db $1c, $20, $24, $20 | (1 << 7)
	
TrainerCard_KantoBadgesOAM:
; Template OAM data for Kanto badges on the trainer card.
; Format:
	; y, x, palette1, palette2, palette3, palette4
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wKantoBadges

	; Boulderbadge
	db $64, $20, 0, 0, 0, 0
	db $00, $20 | (1 << 7), $24, $20
	db $00, $20 | (1 << 7), $24, $20

	; Cascadebadge
	db $64, $48, 1, 1, 1, 1
	db $04, $20 | (1 << 7), $24, $20
	db $04, $20 | (1 << 7), $24, $20

	; Thunderbadge
	db $64, $70, 2, 2, 2, 2
	db $08, $20 | (1 << 7), $24, $20
	db $08, $20 | (1 << 7), $24, $20

	; Rainbowbadge
	db $64, $98, 6, 2, 1, 3
	db $0c, $20 | (1 << 7), $24, $20
	db $0c, $20 | (1 << 7), $24, $20

	; Soulbadge
	db $84, $20, 4, 4, 4, 4
	db $10, $20 | (1 << 7), $24, $20
	db $10, $20 | (1 << 7), $24, $20

	; Marshbadge
	db $84, $48, 5, 5, 5, 5
	db $14, $20 | (1 << 7), $24, $20
	db $14, $20 | (1 << 7), $24, $20

	; Volcanobadge
	db $84, $70, 6, 6, 6, 6
	db $18, $20 | (1 << 7), $24, $20
	db $18, $20 | (1 << 7), $24, $20

	; Earthbadge
	; X-flips on alternate cycles.
	db $84, $98, 7, 7, 7, 7
	db $1c,            $20 | (1 << 7), $24, $20
	db $1c | (1 << 7), $20 | (1 << 7), $24, $20

LeaderGFX:  INCBIN "gfx/trainer_card/johto_leaders.2bpp"
LeaderGFX2: INCBIN "gfx/trainer_card/kanto_leaders.2bpp"
BadgeGFX:   INCBIN "gfx/trainer_card/johto_badges.2bpp"
BadgeGFX2:  INCBIN "gfx/trainer_card/kanto_badges.2bpp"

TrainerCardExtraGFX: INCBIN "gfx/trainer_card/trainer_card_extra.2bpp"

BadgeBorderGFX: INCBIN "gfx/trainer_card/badge_border.2bpp"

TrainerCardLogoGFX: INCBIN "gfx/trainer_card/trainer_card_gfx.2bpp"