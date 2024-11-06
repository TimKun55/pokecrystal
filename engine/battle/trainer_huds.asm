BattleStart_TrainerHuds:
	ld a, $e4
	ldh [rOBP0], a
	call LoadBallIconGFX
	call ShowPlayerMonsRemaining
	ld a, [wBattleMode]
	dec a
	ret z
	jp ShowOTTrainerMonsRemaining

EnemySwitch_TrainerHud:
	ld a, $e4
	ldh [rOBP0], a
	call LoadBallIconGFX
	jp ShowOTTrainerMonsRemaining

ShowPlayerMonsRemaining:
	call DrawPlayerPartyIconHUDBorder
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 12, 12
	ld a, 12 * TILE_WIDTH
	ld hl, wPlaceBallsX
	ld [hli], a
	ld [hl], a
	ld a, TILE_WIDTH
	ld [wPlaceBallsDirection], a
	ld hl, wShadowOAMSprite00
	jp LoadTrainerHudOAM

ShowOTTrainerMonsRemaining:
	call DrawEnemyPartyIconHUDBorder
	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 9, 4
	ld hl, wPlaceBallsX
	ld a, 9 * TILE_WIDTH
	ld [hli], a
	ld [hl], 4 * TILE_WIDTH
	ld a, -TILE_WIDTH
	ld [wPlaceBallsDirection], a
	ld hl, wShadowOAMSprite00 + PARTY_LENGTH * SPRITEOAMSTRUCT_LENGTH
	jp LoadTrainerHudOAM

StageBallTilesData:
	ld a, [de]
	push af
	ld de, wBattleHUDTiles
	ld c, PARTY_LENGTH
	ld a, $34 ; empty slot
.loop1
	ld [de], a
	inc de
	dec c
	jr nz, .loop1
	pop af

	ld de, wBattleHUDTiles
.loop2
	push af
	call .GetHUDTile
	inc de
	pop af
	dec a
	jr nz, .loop2
	ret

.GetHUDTile:
	ld a, [hli]
	and a
	jr nz, .got_hp
	ld a, [hl]
	and a
	ld b, $33 ; fainted
	jr z, .fainted

.got_hp
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	and a
	ld b, $32 ; statused
	jr nz, .load
	dec b ; normal
	jr .load

.fainted
	dec hl
	dec hl
	dec hl

.load
	ld a, b
	ld [de], a
	ld bc, PARTYMON_STRUCT_LENGTH + MON_HP - MON_STATUS
	add hl, bc
	ret

DrawPlayerHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	call CopyBytes
	hlcoord 19, 10
	ld de, -1 ; start on right
	jr PlaceHUDBorderTiles

.tiles
	db $7f ; right side ; (no vertical line)
	db $6b ; bottom right ; 6b (hard end, like enemy HP)
	db $6d ; bottom left
	db $62 ; bottom side
.tiles_end

DrawPlayerPartyIconHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	call CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jr PlaceHUDBorderTiles

.tiles
	db $7f ; right side ; empty space
	db $7f ; bottom right ; empty space
	db $6f ; bottom left
	db $62 ; bottom side
.tiles_end

DrawEnemyPartyIconHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	call CopyBytes
	hlcoord 1, 2
	ld de, 1 ; start on left
	call PlaceHUDBorderTiles
	ld a, [wBattleMode]
	jr DrawEnemyHUDBorder

.tiles
	db $7f ; right side ; empty space
	db $7f ; bottom right ; empty space
	db $78 ; bottom right
	db $62 ; bottom side
.tiles_end

DrawEnemyHUDBorder:
	ld a, [wBattleMode]
	dec a
	ret nz
	ld a, [wTempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret z
	hlcoord 1, 1 ; caught ball
	ld [hl], $5d
	ret

PlaceHUDBorderTiles:
	ld a, [wTrainerHUDTiles + 0]
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [wTrainerHUDTiles + 1]
	ld [hl], a
	ld b, 8
.loop
	add hl, de
	ld a, [wTrainerHUDTiles + 3]
	ld [hl], a
	dec b
	jr nz, .loop
	add hl, de
	ld a, [wTrainerHUDTiles + 2]
	ld [hl], a
	ret

LinkBattle_TrainerHuds:
	call LoadBallIconGFX
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * TILE_WIDTH
	ld [hli], a
	ld [hl], 8 * TILE_WIDTH
	ld a, TILE_WIDTH
	ld [wPlaceBallsDirection], a
	ld hl, wShadowOAMSprite00
	call LoadTrainerHudOAM

	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * TILE_WIDTH
	ld [hli], a
	ld [hl], 13 * TILE_WIDTH
	ld hl, wShadowOAMSprite00 + PARTY_LENGTH * SPRITEOAMSTRUCT_LENGTH
	jp LoadTrainerHudOAM

LoadTrainerHudOAM:
	ld de, wBattleHUDTiles
	ld c, PARTY_LENGTH
.loop
	ld a, [wPlaceBallsY]
	ld [hli], a ; y
	ld a, [wPlaceBallsX]
	ld [hli], a ; x
	ld a, [de]
	ld [hli], a ; tile id
	ld a, PAL_BATTLE_OB_RED
	ld [hli], a ; attributes
	ld a, [wPlaceBallsX]
	ld b, a
	ld a, [wPlaceBallsDirection]
	add b
	ld [wPlaceBallsX], a
	inc de
	dec c
	jr nz, .loop
	ret

LoadBallIconGFX:
	ld de, .gfx
	ld hl, vTiles0 tile $31
	lb bc, BANK(LoadBallIconGFX), 4
	call Get2bppViaHDMA
	ret

.gfx
INCBIN "gfx/battle/balls.2bpp"

_ShowLinkBattleParticipants:
	call ClearBGPalettes
	call LoadFontsExtra
	hlcoord 2, 3
	ld b, 9
	ld c, 14
	call Textbox
	hlcoord 4, 5
	ld de, wPlayerName
	call PlaceString
	hlcoord 4, 10
	ld de, wOTPlayerName
	call PlaceString
	hlcoord 9, 8
	ld a, "V"
	ld [hli], a
	ld [hl], "S"
	farcall LinkBattle_TrainerHuds ; no need to farcall
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	ld a, $e4
	ldh [rOBP0], a
	ret
