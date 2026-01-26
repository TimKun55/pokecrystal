_TitleScreen:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTitleScreenSelectedOption
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; Turn LCD off
	call DisableLCD

; VRAM bank 1
	ld a, 1
	ldh [rVBK], a

; Decompress running Suicune gfx
	ld hl, TitleSuicuneGFX
	ld de, vTiles1
	call Decompress

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 * TILEMAP_WIDTH
	xor a
	call ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, vBGMap1
	ld bc, TILEMAP_WIDTH
	ld a, 7 ; palette
	call ByteFill

; BG Map 0:

; Apply logo gradient:

; lines 3-6
	hlbgcoord 0, 3
	ld bc, 4 * TILEMAP_WIDTH
	ld a, 2
	call ByteFill
; line 7-9
	hlbgcoord 0, 7
	ld bc, 3 * TILEMAP_WIDTH
	ld a, 3
	call ByteFill

; 'TIM'S CRYSTAL'
	hlbgcoord 6, 9
	ld bc, 9 ; length of version text
	ld a, 1
	call ByteFill

; Suicune gfx
;	hlbgcoord 0, 12
;	ld bc, 6 * TILEMAP_WIDTH ; the rest of the screen
;	ld a, 0 | OAM_BANK1
;	call ByteFill

	hlbgcoord 6, 12
	lb bc, 6, 8
	ld a, 4 | OAM_BANK1
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, TILEMAP_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row

; Back to VRAM bank 0
	ld a, 0
	ldh [rVBK], a

; Decompress logo
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress

; Decompress Unowns
	ld hl, TitleUnownGFX
	ld de, vTiles2 tile $1A
	call Decompress

; Decompress background crystal
	ld hl, TitleCrystalGFX
	ld de, vTiles0
	call Decompress

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * TILEMAP_WIDTH
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 3
	lb bc, 7, 20
	ld d, $80
	ld e, 20
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 3, 0, vBGMap1
	lb bc, 1, 13
	ld d, $c
	ld e, 16
	call DrawTitleGraphic

; Draw Unowns
	hlcoord 1, 11
	lb bc, 2, 2
	lb de, $1a, 2
	call DrawTitleGraphic
	hlcoord 2, 14
	lb bc, 2, 2
	lb de, $1e, 2
	call DrawTitleGraphic
	hlcoord 17, 11
	lb bc, 3, 2
	lb de, $22, 2
	call DrawTitleGraphic
	hlcoord 16, 14
	lb bc, 2, 2
	lb de, $28, 2
	call DrawTitleGraphic
	hlcoord 18, 14
	ld [hl], $2c
	hlcoord 5, 11
	ld [hl], $2d
	hlcoord 15, 11
	ld [hl], $2e

; Initialize running Suicune?
	ld d, $0
	call LoadSuicuneFrame

; Initialize background crystal
	call InitializeCrystalSprites

; Update palette colors
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a

	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	pop af
	ldh [rWBK], a

; LY/SCX trickery starts here

	ldh a, [rWBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rWBK], a

; Make alternating lines come in from opposite sides

; (This part is actually totally pointless, you can't
;  see anything until these values are overwritten!)

	ld b, 80 / 2 ; alternate for 80 lines
	ld hl, wLYOverrides
.loop
; $00 is the middle position
	ld [hl], +112 ; coming from the left
	inc hl
	ld [hl], -112 ; coming from the right
	inc hl
	dec b
	jr nz, .loop

; Make sure the rest of the buffer is empty
	ld hl, wLYOverrides + 80
	xor a
	ld bc, wLYOverridesEnd - (wLYOverrides + 80)
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, JP_INSTRUCTION
	ld [hFunctionInstruction], a
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a

	pop af
	ldh [rWBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ldh a, [rLCDC]
	set B_LCDC_OBJ_SIZE, a
	ldh [rLCDC], a

	ld a, +112
	ldh [hSCX], a
	ld a, 8
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, -112
	ldh [hWY], a

	ld a, TRUE
	ldh [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ldh [hBGMapMode], a

	xor a
	ld [wSuicuneFrame], a

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX

	ret

SuicuneFrameIterator:
	ld hl, wSuicuneFrame
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and %111
	ret nz

	ld a, c
	and %11000
	sla a
	swap a
	ld e, a
	ld d, 0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ldh [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $3
	ldh [hBGMapThird], a
	ret

.Frames:
	db $80 ; vTiles3 tile $80
	db $88 ; vTiles3 tile $88
	db $00 ; vTiles5 tile $00
	db $08 ; vTiles5 tile $08

LoadSuicuneFrame:
	hlcoord 6, 12
	ld b, 6
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

InitializeCrystalSprites:
	ld hl, wShadowOAMSprite00
	lb de, -$22, $00 ; initial top-left Y coord, top-left tile ID
	ld c, 5 ; column height
.loop
	push bc
	call .InitRow
	pop bc
	ld a, $10 ; increment Y coord
	add d
	ld d, a
	dec c
	jr nz, .loop

	; set palettes for crystal sprites besides #0
	ld a, 0 | OAM_PRIO
	ld [wShadowOAMSprite00Attributes], a
	ld [wShadowOAMSprite01Attributes], a
	ld [wShadowOAMSprite02Attributes], a
	ld [wShadowOAMSprite06Attributes], a
	ld [wShadowOAMSprite21Attributes], a
	ld [wShadowOAMSprite24Attributes], a
	ld [wShadowOAMSprite25Attributes], a
	ld [wShadowOAMSprite26Attributes], a
	ld a, 2 | OAM_PRIO
	ld [wShadowOAMSprite07Attributes], a
	ld [wShadowOAMSprite19Attributes], a
	ld [wShadowOAMSprite20Attributes], a
	inc a ; 3 | OAM_PRIO
	ld [wShadowOAMSprite08Attributes], a

	; create overlapping sprites
	ld hl, .OverlappingSprites
	ld de, wShadowOAMSprite30
	ld bc, 6 * OBJ_SIZE
	call CopyBytes
	ret

.InitRow:
	lb bc, $40, $6 ; left X coord, row width
.loop2
	ld a, d
	ld [hli], a ; y coord
	ld a, b
	ld [hli], a ; x coord
	add $8 ; increment X coord
	ld b, a
	ld a, e
	ld [hli], a ; tile id
	inc e ; increment tile ID
	inc e
	ld a, 1 | OAM_PRIO
	ld [hli], a ; attributes
	dec c
	jr nz, .loop2
	ret

.OverlappingSprites:
	db -$12, $40, $3c, 1 | OAM_PRIO
	db -$12, $48, $3e, 4 | OAM_PRIO
	db  $1e, $40, $40, 1 | OAM_PRIO
	db  $1d, $48, $42, 1 | OAM_PRIO
	db  $1e, $50, $44, 1 | OAM_PRIO
	db  $0e, $60, $46, 0 | OAM_PRIO

AnimateTitleCrystal:
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, wShadowOAMSprite00YCoord
	ld a, [hl]
	cp 6 + 2 * TILE_WIDTH
	ret z

; Move all 36 parts of the crystal down by 2
	ld c, 36
.loop
	ld a, [hl]
	add 2
	ld [hli], a ; y
rept OBJ_SIZE - 1
	inc hl
endr
	dec c
	jr nz, .loop

	ret

TitleSuicuneGFX:
INCBIN "gfx/title/suicune.2bpp.lz"

TitleUnownGFX:
INCBIN "gfx/title/unowns.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleCrystalGFX:
INCBIN "gfx/title/crystal.2bpp.lz"

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"
