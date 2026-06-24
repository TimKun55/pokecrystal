_AnimateTileset::
; Increment [hTileAnimFrame] and run that frame's function
; from the array pointed to by wTilesetAnim.

; Called in WRAM bank 1, VRAM bank 0, so map tiles
; $80 and above in VRAM bank 1 cannot be animated
; without switching to that bank themselves.

	ld a, [wTilesetAnim]
	ld e, a
	ld a, [wTilesetAnim + 1]
	ld d, a

	ldh a, [hTileAnimFrame]
	ld l, a
	inc a
	ldh [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl

INCLUDE "data/tileset_anims.asm"

DoneTileAnimation:
; Reset the animation command loop.
	xor a
	ldh [hTileAnimFrame], a

WaitTileAnimation:
; Do nothing this frame.
	ret

StandingTileFrame8:
; Tick the wTileAnimationTimer, wrapping from 7 to 0.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	ret

ScrollTileRightLeft:
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileLeft
	jr ScrollTileRight

ScrollTileUpDown: ; unreferenced
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileDown
	jr ScrollTileUp

ScrollTileLeft:
	ld h, d
	ld l, e
	ld c, LEN_2BPP_TILE / 4
.loop
rept 4
	ld a, [hl]
	rlca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileRight:
	ld h, d
	ld l, e
	ld c, LEN_2BPP_TILE / 4
.loop
rept 4
	ld a, [hl]
	rrca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileUp:
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, LEN_2BPP_TILE - 2
	add hl, bc
	ld a, LEN_2BPP_TILE / 4
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret

ScrollTileDown:
	ld h, d
	ld l, e
	ld de, LEN_2BPP_TILE - 2
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, LEN_2BPP_TILE / 4
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret

AnimateFountainTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; period 8, offset to pointer table (2 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 8
	add a

	add LOW(.FountainTilePointers)
	ld l, a
	adc HIGH(.FountainTilePointers)
	sub l
	ld h, a

	ld sp, hl
	pop hl

	jp WriteTileHLToDE

.FountainTilePointers:
	dw .FountainTileFrames + 0 tiles ; 0
	dw .FountainTileFrames + 1 tiles ; 1
	dw .FountainTileFrames + 2 tiles ; 2
	dw .FountainTileFrames + 3 tiles ; 3
	dw .FountainTileFrames + 2 tiles ; 4
	dw .FountainTileFrames + 3 tiles ; 5
	dw .FountainTileFrames + 4 tiles ; 6
	dw .FountainTileFrames + 0 tiles ; 7

.FountainTileFrames:
INCBIN "gfx/tilesets/fountain/fountain.2bpp"

AnimateWaterTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = .WaterTileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	add LOW(.WaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(.WaterTileFrames)
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.WaterTileFrames:
	INCBIN "gfx/tilesets/water/water.2bpp"

AnimateSeaWaterTile:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 8, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 8
	swap a

	add LOW(.SeaWaterTileFrames)
	ld l, a
	adc HIGH(.SeaWaterTileFrames)
	sub l
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.SeaWaterTileFrames:
INCBIN "gfx/tilesets/water/water_sea.2bpp"

AnimateFarawayWaterTiles:
	ld hl, sp + 0
	ld b, h
	ld c, l

	ld l, e
	ld h, d
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

; period 8, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 8
	swap a

	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	adc h
	sub l
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

ForestTreeLeftAnimation:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeLeftFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; hl = ForestTreeLeftFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.got_frames
; Write the tile graphic from hl (now sp) to tile $0c (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeLeftFrames:
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"

ForestTreeRightFrames:
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"

ForestTreeRightAnimation:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeRightFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; hl = ForestTreeRightFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.got_frames
; Write the tile graphic from hl (now sp) to tile $0f (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

ForestTreeLeftAnimation2:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeLeftFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; Offset by 1 frame from ForestTreeLeftAnimation
	xor %10

; hl = ForestTreeLeftFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.got_frames
; Write the tile graphic from hl (now sp) to tile $0c (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeRightAnimation2:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Only animate this during the Celebi event
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .do_animation
	ld hl, ForestTreeRightFrames
	jr .got_frames

.do_animation
; A cycle of 2 frames, updating every tick
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame

; Offset by 1 frame from ForestTreeRightAnimation
	xor %10

; hl = ForestTreeRightFrames + a * 8
; (a was pre-multiplied by 2 from GetForestTreeFrame)
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.got_frames
; Write the tile graphic from hl (now sp) to tile $0f (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

GetForestTreeFrame:
; Return 0 if a is even, or 2 if odd.
	and 1
	add a
	ret

AnimateFlowerTile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; period 2, every 2 frames, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 2, 1
	add a
	add a
	add a

	add LOW(.FlowerTileFrames)
	ld l, a
	adc HIGH(.FlowerTileFrames)
	sub l
	ld h, a

	jp WriteTileHLToDE

.FlowerTileFrames:
	INCBIN "gfx/tilesets/flower/flower.2bpp"

AnimateBuoyTiles:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 4, every 2 frames, offset to 3 tiles (48 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4, 1
	swap a
	ld l, a
	rrca
	add l

	add LOW(.BuoyTileFrames)
	ld l, a
	adc HIGH(.BuoyTileFrames)
	sub l
	ld h, a

	jp WriteThreeTilesHLToDE

.BuoyTileFrames:
INCBIN "gfx/tilesets/buoy/buoy.2bpp"

AnimateFireTiles:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 4, offset to 2 tiles (32 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4
	swap a
	add a

	add LOW(.FireTileFrames)
	ld l, a
	adc HIGH(.FireTileFrames)
	sub l
	ld h, a

	jp WriteTwoTilesHLToDE

.FireTileFrames:
INCBIN "gfx/tilesets/fire/fire.2bpp"

AnimateTorchTile:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 2, every 2 frames, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 2, 1
	add a
	add a
	add a

	add LOW(.TorchTileFrames)
	ld l, a
	adc HIGH(.TorchTileFrames)
	sub l
	ld h, a

	jp WriteTileHLToDE

.TorchTileFrames:
INCBIN "gfx/tilesets/fire/torch.2bpp"

AnimateKarenStar1Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; Offset by 2 frames from AnimateKarenStar2Tile
	srl a
	inc a
	inc a
	and %011

; hl = StarTileFrames + a * 16
	swap a
	ld e, a
	ld d, 0
	ld hl, StarTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $5b (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

AnimateKarenStar2Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = StarTileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, StarTileFrames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $38 (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $2f
	jp WriteTile

StarTileFrames:
INCBIN "gfx/tilesets/stars/star_1.2bpp"
INCBIN "gfx/tilesets/stars/star_2.2bpp"
INCBIN "gfx/tilesets/stars/star_3.2bpp"
INCBIN "gfx/tilesets/stars/star_4.2bpp"

AnimateKarenStar3Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; Offset by 2 frames from AnimateKarenStar4Tile
	srl a
	inc a
	inc a
	and %011

; hl = StarTile2Frames + a * 16
	swap a
	ld e, a
	ld d, 0
	ld hl, StarTile2Frames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $5b (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $1f
	jp WriteTile

AnimateKarenStar4Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = StarTileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, StarTile2Frames
	add hl, de

; Write the tile graphic from hl (now sp) to tile $38 (now hl)
	ld sp, hl
	ld hl, vTiles2 tile $3f
	jp WriteTile

StarTile2Frames:
INCBIN "gfx/tilesets/stars/star_5.2bpp"
INCBIN "gfx/tilesets/stars/star_6.2bpp"
INCBIN "gfx/tilesets/stars/star_7.2bpp"
INCBIN "gfx/tilesets/stars/star_8.2bpp"

AnimateLavaBubbleTile1:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 4, phase shift 2, every 2 frames, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4, 1
	srl a
	inc a
	inc a
	maskbits 4
	swap a

	jr _FinishAnimateLavaBubbleTile

AnimateLavaBubbleTile2:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 4, every 2 frames, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4, 1
	add a
	add a
	add a
	; fallthrough

_FinishAnimateLavaBubbleTile:
	add LOW(.LavaBubbleFrames)
	ld l, a
	adc HIGH(.LavaBubbleFrames)
	sub l
	ld h, a

	jp WriteTileHLToDE

.LavaBubbleFrames:
INCBIN "gfx/tilesets/lava/lava.2bpp"

AnimateBeachWater1Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = .BeachWater1TileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	add LOW(.BeachWater1TileFrames)
	ld l, a
	ld a, 0
	adc HIGH(.BeachWater1TileFrames)
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.BeachWater1TileFrames:
	INCBIN "gfx/tilesets/water/beach_water_1.2bpp"

AnimateBeachWater2Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = .BeachWater2TileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	add LOW(.BeachWater2TileFrames)
	ld l, a
	ld a, 0
	adc HIGH(.BeachWater2TileFrames)
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.BeachWater2TileFrames:
	INCBIN "gfx/tilesets/water/beach_water_2.2bpp"

AnimateBeachWater3Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = .BeachWater3TileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	add LOW(.BeachWater3TileFrames)
	ld l, a
	ld a, 0
	adc HIGH(.BeachWater3TileFrames)
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.BeachWater3TileFrames:
	INCBIN "gfx/tilesets/water/beach_water_3.2bpp"

AnimateBeachWater4Tile:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 4 frames, updating every other tick
	ld a, [wTileAnimationTimer]
	and %110

; hl = .BeachWater4TileFrames + a * 8
; (a was pre-multiplied by 2 from 'and %110')
	add a
	add a
	add a
	add LOW(.BeachWater4TileFrames)
	ld l, a
	ld a, 0
	adc HIGH(.BeachWater4TileFrames)
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.BeachWater4TileFrames:
	INCBIN "gfx/tilesets/water/beach_water_4.2bpp"

AnimateTowerPillarTile:
; Input de points to the destination in VRAM, then the source tile frames

; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; A cycle of 8 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %111

; a = [.TowerPillarTileFrameOffsets + a]
	ld hl, .TowerPillarTileFrameOffsets
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

; de = the destination in VRAM
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; hl = the source tile frames + offset a
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.TowerPillarTileFrameOffsets:
	db 0 tiles
	db 1 tiles
	db 2 tiles
	db 3 tiles
	db 4 tiles
	db 3 tiles
	db 2 tiles
	db 1 tiles

StandingTileFrame:
; Tick the wTileAnimationTimer.
	ld hl, wTileAnimationTimer
	inc [hl]
	ret

Animate4FrameTile:
; Input de points to the destination in VRAM, then the source tile frames

; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; de = the destination in VRAM
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; A cycle of 4 frames, updating every tick
	ld a, [wTileAnimationTimer]
	and %11

; hl = the source tile frames + a * 16
	swap a
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; Write the tile graphic from hl (now sp) to de (now hl)
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

AnimateWaterfallTiles:
	ld hl, sp + 0
	ld b, h
	ld c, l

	; period 4, offset to 2 tiles (32 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4
	swap a
	add a

	add LOW(.WaterfallTileFrames)
	ld l, a
	adc HIGH(.WaterfallTileFrames)
	sub l
	ld h, a

	jp WriteTwoTilesHLToDE

.WaterfallTileFrames:
INCBIN "gfx/tilesets/waterfall/waterfall.2bpp"

AnimatePortBuoyTiles:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 4, offset to 4 tiles (64 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4
	swap a
	add a
	add a

	add LOW(.PortBuoyTileFrames)
	ld l, a
	adc HIGH(.PortBuoyTileFrames)
	sub l
	ld h, a

	jp WriteFourTilesHLToDE

.PortBuoyTileFrames:
INCBIN "gfx/tilesets/buoy/port_buoy.2bpp"

AnimateWhirlpoolTiles:
	ld hl, sp + 0
	ld b, h
	ld c, l

; period 4, offset to 4 tiles (64 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4
	swap a
	add a
	add a

	add LOW(.WhirlpoolTileFrames)
	ld l, a
	adc HIGH(.WhirlpoolTileFrames)
	sub l
	ld h, a

	jp WriteFourTilesHLToDE

.WhirlpoolTileFrames:
INCBIN "gfx/tilesets/whirlpool/whirlpool.2bpp"

WriteTileFromAnimBuffer:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Write the tile graphic from wTileAnimBuffer (now sp) to de (now hl)
	ld hl, wTileAnimBuffer
	ld sp, hl
	ld h, d
	ld l, e
	jp WriteTile

ReadTileToAnimBuffer:
; Save the stack pointer in bc for WriteTile to restore
	ld hl, sp+0
	ld b, h
	ld c, l

; Write the tile graphic from de (now sp) to wTileAnimBuffer (now hl)
	ld h, d
	ld l, e
	ld sp, hl
	ld hl, wTileAnimBuffer
	jp WriteTile

WriteFourTilesHLToDE:
	ld sp, hl
	ld l, e
	ld h, d
	; fallthrough

WriteFourTiles:
	pop de
	ld [hl], e ; no-optimize *hl++|*hl-- = b|c|d|e
	inc hl
	ld [hl], d
rept 8
	pop de
	inc hl
	ld [hl], e ; no-optimize *hl++|*hl-- = b|c|d|e
	inc hl
	ld [hl], d
endr

	jr _FinishWritingThreeTiles

WriteThreeTilesHLToDE:
	ld sp, hl
	ld l, e
	ld h, d
	; fallthrough

WriteThreeTiles:
	pop de
	ld [hl], e ; no-optimize *hl++|*hl-- = b|c|d|e
	inc hl
	ld [hl], d
_FinishWritingThreeTiles:
rept 8
	pop de
	inc hl
	ld [hl], e ; no-optimize *hl++|*hl-- = b|c|d|e
	inc hl
	ld [hl], d
endr

	jr _FinishWritingTwoTiles

WriteTwoTilesHLToDE:
	ld sp, hl
	ld l, e
	ld h, d
	; fallthrough

WriteTwoTiles:
	pop de
	ld [hl], e ; no-optimize *hl++|*hl-- = b|c|d|e
	inc hl
	ld [hl], d
_FinishWritingTwoTiles:
rept 8
	pop de
	inc hl
	ld [hl], e ; no-optimize *hl++|*hl-- = b|c|d|e
	inc hl
	ld [hl], d
endr

	jr _FinishWritingOneTile

WriteTileHLToDE:
	ld sp, hl
	ld l, e
	ld h, d
	; fallthrough

WriteTile:
; Write one tile from sp to hl.
; The stack pointer has been saved in bc.

; This function cannot be called, only jumped to,
; because it relocates the stack pointer to quickly
; copy data with a "pop slide".

	pop de
	ld [hl], e
	inc hl
	ld [hl], d
_FinishWritingOneTile:
rept (LEN_2BPP_TILE - 2) / 2
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; Restore the stack pointer from bc
	ld h, b
	ld l, c
	ld sp, hl
	ret

AnimateWaterPalette:
; Transition between color values 0-2 for color 0 in palette 3.

; Don't update the palette on DMG
	ldh a, [hCGB]
	and a
	ret z

; Don't update a non-standard palette order
	ldh a, [rBGP]
	cp %11100100
	ret nz

; Only update on even ticks
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input
	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_WATER color 0
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; A cycle of 4 colors (0 1 2 1), updating every other tick
	ld a, l
	and %110
	jr z, .color0
	cp %100
	jr z, .color2

; Copy one color from hl to rBGPI via rBGPD

; color1
	ld hl, wBGPals1 palette PAL_BG_WATER color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wBGPals1 palette PAL_BG_WATER color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color2
	ld hl, wBGPals1 palette PAL_BG_WATER color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret

FlickeringCaveEntrancePalette:
; Don't update the palette on DMG
	ldh a, [hCGB]
	and a
	ret z

; Don't update a non-standard palette order
	ldh a, [rBGP]
	cp %11100100
	ret nz

; We only want to be here if we're in a dark cave.
	ld a, [wTimeOfDayPalset]
	cp DARKNESS_PALSET
	ret nz

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Ready for BGPD input
	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_YELLOW color 0
	ldh [rBGPI], a

; A cycle of 2 colors (0 2), updating every other vblank
	ldh a, [hVBlankCounter]
	and %10
	jr nz, .color1

; Copy one color from hl to rBGPI via rBGPD

; color0
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 0
	jr .okay

.color1
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 1

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret

TowerPillarTilePointer1:  dw vTiles2 tile $2d, TowerPillarTile1
TowerPillarTilePointer2:  dw vTiles2 tile $2f, TowerPillarTile2
TowerPillarTilePointer3:  dw vTiles2 tile $3d, TowerPillarTile3
TowerPillarTilePointer4:  dw vTiles2 tile $3f, TowerPillarTile4
TowerPillarTilePointer5:  dw vTiles2 tile $3c, TowerPillarTile5
TowerPillarTilePointer6:  dw vTiles2 tile $2c, TowerPillarTile6
TowerPillarTilePointer7:  dw vTiles2 tile $4d, TowerPillarTile7
TowerPillarTilePointer8:  dw vTiles2 tile $4f, TowerPillarTile8
TowerPillarTilePointer9:  dw vTiles2 tile $5d, TowerPillarTile9
TowerPillarTilePointer10: dw vTiles2 tile $5f, TowerPillarTile10

TowerPillarTile1:  INCBIN "gfx/tilesets/tower-pillar/1.2bpp"
TowerPillarTile2:  INCBIN "gfx/tilesets/tower-pillar/2.2bpp"
TowerPillarTile3:  INCBIN "gfx/tilesets/tower-pillar/3.2bpp"
TowerPillarTile4:  INCBIN "gfx/tilesets/tower-pillar/4.2bpp"
TowerPillarTile5:  INCBIN "gfx/tilesets/tower-pillar/5.2bpp"
TowerPillarTile6:  INCBIN "gfx/tilesets/tower-pillar/6.2bpp"
TowerPillarTile7:  INCBIN "gfx/tilesets/tower-pillar/7.2bpp"
TowerPillarTile8:  INCBIN "gfx/tilesets/tower-pillar/8.2bpp"
TowerPillarTile9:  INCBIN "gfx/tilesets/tower-pillar/9.2bpp"
TowerPillarTile10: INCBIN "gfx/tilesets/tower-pillar/10.2bpp"

FarawayWaterFrames1: dw vTiles2 tile $14, FarawayWaterTiles1
FarawayWaterFrames2: dw vTiles2 tile $15, FarawayWaterTiles2

FarawayWaterTiles1: INCBIN "gfx/tilesets/water/faraway_water_1.2bpp"
FarawayWaterTiles2: INCBIN "gfx/tilesets/water/faraway_water_2.2bpp"
