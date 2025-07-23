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
	call TrainerCardSetup_ClearBottomHalf
	call WaitBGMap

	ld b, SCGB_TRAINER_CARD
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap

	ld de, TicketsGFX
	ld hl, vTiles2 tile $37
	lb bc, BANK(TicketsGFX), 8
	call Request2bpp

	call TrainerCard_Page1_PrintDexCaught_GameTime
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
	call TrainerCardSetup_ClearBottomHalf
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD_JOHTO
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ld de, LeaderGFX
	ld hl, vTiles2 tile $37
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
	call TrainerCardSetup_ClearBottomHalf
	call WaitBGMap
	ld b, SCGB_TRAINER_CARD_KANTO
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ld de, LeaderGFX2
	ld hl, vTiles2 tile $37
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

	eventflagcheck EVENT_GRAND_CHAMPION
	jr z, .ChampionString
	hlcoord 3, 1
	ld de, .Grand
	call PlaceString
	hlcoord 4, 2
	ld de, .Champion
	call PlaceString
	jr .ContinueStrings

.ChampionString
	eventflagcheck EVENT_BEAT_ELITE_FOUR
	jr z, .PkmnTrainerString
	hlcoord 3, 2
	lb bc, 2, 8
	call ClearBox
	hlcoord 2, 1
	ld de, .League
	call PlaceString
	hlcoord 4, 2
	ld de, .Champion
	call PlaceString
	jr .ContinueStrings

.PkmnTrainerString
	hlcoord 3, 1
	lb bc, 2, 8
	call ClearBox
	hlcoord 2, 1
	ld de, .PkmnTrainer1
	call PlaceString
	hlcoord 4, 2
	ld de, .PkmnTrainer2
	call PlaceString

.ContinueStrings
	hlcoord 3, 3
	ld de, wPlayerName
	call PlaceString

	hlcoord 3, 4
	ld de, .ID_No
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 6, 4
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum

	hlcoord 3, 6
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum

	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ldh [hGraphicStartTile], a
	predef PlaceGraphic
	ret

.PkmnTrainer1:
	db "Pokémon@"

.PkmnTrainer2:
	db "Trainer@"

.League:
	db "League@"

.Champion:
	db "Champion@"

.Grand:
	db "Grand"

.ID_No:
	db $da, $db, $e8, -1 ; ID No.

TrainerCardSetup_ClearBottomHalf:
	hlcoord 1, 9
	lb bc, 8, 18
	call ClearBox
	ret

TrainerCard_Page1_PrintDexCaught_GameTime:
	hlcoord 2, 10
	ld de, .Dex_PlayTime
	call PlaceString

	hlcoord 12, 16
	ld de, .Badges
	call PlaceString

	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 15, 10
	lb bc, 1, 3
	call PrintNum

	call TrainerCard_Page1_PrintGameTime

	ld a, [wStatusFlags] ; pokedex
	bit 0, a
	jr nz, .have_pokedex
	hlcoord 2, 10
	lb bc, 1, 16
	call ClearBox
.have_pokedex
	eventflagcheck EVENT_GOT_SS_TICKET_FROM_ELM
	jr z, .CheckTrainPass
	hlcoord 2, 15
	ld de, .SSTicketTop
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 16
	ld de, .SSTicketBottom
	call TrainerCardSetup_PlaceTilemapString
.CheckTrainPass
	eventflagcheck EVENT_GOT_PASS_FROM_COPYCAT
	jr z, .Finish
	hlcoord 5, 15
	ld de, .TrainTicketTop
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 5, 16
	ld de, .TrainTicketBottom
	call TrainerCardSetup_PlaceTilemapString
.Finish
	ret

.Dex_PlayTime:
	db   "#dex"
	next "Play Time@"

.Badges:
	db "Badges▶@"

.SSTicketTop:
	db $37, $38, -1

.SSTicketBottom:
	db $3b, $3c, -1

.TrainTicketTop:
	db $39, $3a, -1

.TrainTicketBottom:
	db $3d, $3e, -1

TrainerCard_Page2_3_InitObjectsAndStrings:
	push hl

	hlcoord 3, 10
	ld a, $37
	ld c, 4
.loop
	call TrainerCard_Page2_3_PlaceLeadersFaces
rept 4
	inc hl
endr
	dec c
	jr nz, .loop
	hlcoord 3, 13
	ld a, $5b
	ld c, 4
.loop2
	call TrainerCard_Page2_3_PlaceLeadersFaces
rept 4
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
	inc a ; top border
.loop1
	ld [hli], a
	dec e
	jr nz, .loop1
	inc a ; top-right corner
	ld [hli], a

	ld bc, SCREEN_WIDTH - 2
	ld e, SCREEN_HEIGHT - 2
	inc a ; left border
.loop2
	ld [hli], a
	add hl, bc
	inc a ; right border
	ld [hli], a
	dec a ; left border again
	dec e
	jr nz, .loop2

	inc a
	inc a ; bottom-left corner
	ld [hli], a
	ld e, SCREEN_WIDTH - 2
	inc a ; bottom border
.loop3
	ld [hli], a
	dec e
	jr nz, .loop3
	inc a ; bottom-right corner
	ld [hl], a

	hlcoord 1, 8

	ld e, 6
.loop4
	ld a, $2c
	ld [hli], a
	inc a ; $2d
	ld [hli], a
	inc a ; $2e
	ld [hli], a
	ld a, $2c - 1
	dec e
	jr nz, .loop4

	hlcoord 0, 8
	ld de, .LeftMiddle
	call TrainerCardSetup_PlaceTilemapString

	hlcoord 19, 8
	ld de, .RightMiddle
	call TrainerCardSetup_PlaceTilemapString

	ret

.LeftMiddle:
	db $2b, -1

.RightMiddle:
	db $2f, -1

TrainerCard_Page2_3_PlaceLeadersFaces:
	push de
	push hl
	ld de, SCREEN_WIDTH - 3
rept 3
	ld [hli], a
	inc a
endr
	add hl, de
rept 3
	ld [hli], a
	inc a
endr
	add hl, de
rept 3
	ld [hli], a
	inc a
endr
	pop hl
	pop de
	ret

TrainerCard_Page1_PrintGameTime:
	hlcoord 11, 12
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
	hlcoord 15, 12
	ld a, [hl]
	xor " " ^ $30 ; alternate between space and small colon ($30) tiles
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
	db $68, $16, 0, 0, 0, 0
	db $00, $20, $24, $20 | (1 << 7)
	db $00, $20, $24, $20 | (1 << 7)

	; Hivebadge
	db $68, $36, 1, 1, 1, 1
	db $04, $20, $24, $20 | (1 << 7)
	db $04, $20, $24, $20 | (1 << 7)

	; Plainbadge
	db $68, $56, 2, 2, 2, 2
	db $08, $20, $24, $20 | (1 << 7)
	db $08, $20, $24, $20 | (1 << 7)

	; Fogbadge
	; X-flips on alternate cycles.
	db $68, $76, 3, 3, 3, 3
	db $0c, 		   $20, $24, $20 | (1 << 7)
	db $0c | (1 << 7), $20, $24, $20 | (1 << 7)

	; Mineralbadge
	db $80, $36, 5, 5, 5, 5
	db $10, $20, $24, $20 | (1 << 7)
	db $10, $20, $24, $20 | (1 << 7)

	; Stormbadge
	; X-flips on alternate cycles.
	db $80, $16, 4, 4, 4, 4
	db $14, 		   $20, $24, $20 | (1 << 7)
	db $14 | (1 << 7), $20, $24, $20 | (1 << 7)

	; Glacierbadge
	db $80, $56, 6, 6, 6, 6
	db $18, $20, $24, $20 | (1 << 7)
	db $18, $20, $24, $20 | (1 << 7)

	; Risingbadge
	db $80, $76, 7, 7, 7, 7
	db $1c, $20, $24, $20 | (1 << 7)
	db $1c, $20, $24, $20 | (1 << 7)
	
TrainerCard_KantoBadgesOAM:
; Template OAM data for Kanto badges on the trainer card.
; Format:
	; y, x, palette1, palette2, palette3, palette4
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wKantoBadges

	; Thunderbadge
	db $68, $16, 0, 0, 0, 0
	db $00, $20 | (1 << 7), $24, $20
	db $00, $20 | (1 << 7), $24, $20

	; Marshbadge
	db $68, $36, 1, 1, 1, 1
	db $04, $20 | (1 << 7), $24, $20
	db $04, $20 | (1 << 7), $24, $20

	; Cascadebadge
	db $68, $56, 2, 2, 2, 2
	db $08, $20 | (1 << 7), $24, $20
	db $08, $20 | (1 << 7), $24, $20

	; Rainbowbadge
	db $68, $76, 6, 0, 2, 3
	db $0c, $20 | (1 << 7), $24, $20
	db $0c, $20 | (1 << 7), $24, $20

	; Soulbadge
	db $80, $16, 4, 4, 4, 4
	db $10, $20 | (1 << 7), $24, $20
	db $10, $20 | (1 << 7), $24, $20

	; Boulderbadge
	db $80, $36, 5, 5, 5, 5
	db $14, $20 | (1 << 7), $24, $20
	db $14, $20 | (1 << 7), $24, $20

	; Volcanobadge
	db $80, $56, 6, 6, 6, 6
	db $18, $20 | (1 << 7), $24, $20
	db $18, $20 | (1 << 7), $24, $20

	; Earthbadge
	; X-flips on alternate cycles.
	db $80, $76, 7, 7, 7, 7
	db $1c,            $20 | (1 << 7), $24, $20
	db $1c | (1 << 7), $20 | (1 << 7), $24, $20

LeaderGFX:  INCBIN "gfx/trainer_card/johto_leaders.2bpp"
LeaderGFX2: INCBIN "gfx/trainer_card/kanto_leaders.2bpp"
BadgeGFX:   INCBIN "gfx/trainer_card/johto_badges.2bpp"
BadgeGFX2:  INCBIN "gfx/trainer_card/kanto_badges.2bpp"
TicketsGFX: INCBIN "gfx/trainer_card/tickets.2bpp"
