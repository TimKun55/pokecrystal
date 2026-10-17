Crystal_FillBoxCGB:
; This is a copy of FillBoxCGB.
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

LoadOW_BGPal7::
	ld hl, Palette_TextBG7
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

Palette_TextBG7:
INCLUDE "gfx/font/bg_text.pal"

LoadBattleInfoBoxPals::
	ld hl, BattleTextBoxPalettes
	ld de, wBGPals1 palette 5
	ld bc, 3 palettes
	ld a, BANK(wBGPals1)
	call FarCopyColorWRAM

; Load Player Pokemon's Type Palette(s)
	ld de, wBGPals1 palette 5
	call GetBaseData
	ld a, [wBattleMonType1]
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
; load the 1st type pal 
	; type index is already in c
	ld de, wBGPals1 palette 5 + 2 ; slot 2 of pal 5, byte 1
	farcall LoadMonBaseTypePal	

	ld a, [wBattleMonType1]
	ld b, a
	ld a, [wBattleMonType2]
	cp b
	jr z, .player_palettes_done
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
; load the 2nd type pal 
	; type index is already in c
	ld de, wBGPals1 palette 5 + 4 ; slot 3 of pal 5, byte 1
	farcall LoadMonBaseTypePal
.player_palettes_done

; Load Enemy Pokemon's Type Palette(s)
	ld de, wBGPals1 palette 6
	call GetBaseData
	ld a, [wEnemyMonType1]
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
; load the 1st type pal 
	; type index is already in c
	ld de, wBGPals1 palette 6 + 2 ; slot 2 of pal 6, byte 1
	farcall LoadMonBaseTypePal	

	ld a, [wEnemyMonType1]
	ld b, a
	ld a, [wEnemyMonType2]
	cp b
	jr z, .enemy_palettes_done
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
; load the 2nd type pal 
	; type index is already in c
	ld de, wBGPals1 palette 6 + 4 ; slot 3 of pal 6, byte 1
	farcall LoadMonBaseTypePal
.enemy_palettes_done

	hlcoord 3, 4, wAttrmap
	lb bc, 2, 4 ; height, width
	ld a, $5 ; player type icon palette
	call Crystal_FillBoxCGB

	hlcoord 13, 4, wAttrmap
	lb bc, 2, 4 ; height, width
	ld a, $6 ; enemy type icon palette
	call Crystal_FillBoxCGB
	call WaitBGMap2
	ret

BattleTextBoxPalettes:
INCLUDE "gfx/battle/battle_info_box.pal"

Function49420::
	ld hl, MansionPalette palette 8
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

INCLUDE "engine/tilesets/tileset_palettes.asm"

_InitMG_Mobile_LinkTradePalMap:
	hlcoord 0, 0, wAttrmap
	lb bc, 16, 2
	ld a, $4
	call Crystal_FillBoxCGB
	ld a, $3
	ldcoord_a 0, 1, wAttrmap
	ldcoord_a 0, 14, wAttrmap
	hlcoord 2, 0, wAttrmap
	lb bc, 8, 18
	ld a, $5
	call Crystal_FillBoxCGB
	hlcoord 2, 8, wAttrmap
	lb bc, 8, 18
	ld a, $6
	call Crystal_FillBoxCGB
	hlcoord 0, 16, wAttrmap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $2
	hlcoord 2, 16, wAttrmap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrmap
	ld a, $3
	ld bc, 6
	call ByteFill
	ret

_LoadTradeRoomBGPals:
	ld hl, TradeRoomPalette
	ld de, wBGPals1 palette PAL_BG_GREEN
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

TradeRoomPalette:
INCLUDE "gfx/trade/border.pal"

InitMG_Mobile_LinkTradePalMap:
	call _InitMG_Mobile_LinkTradePalMap
	ret
