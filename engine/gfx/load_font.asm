INCLUDE "gfx/font.asm"

_GetFontPointer::
	ld a, [wFontType]
	cp FONT_SERIF
	jr z, .serif
	cp FONT_MICR
	jr z, .micr
	cp FONT_SMALL
	jr z, .small
	ld de, FontNormal
	ret

.serif
	ld de, FontSerif
	ret

.micr
	ld de, FontMicr
	ret

.small
	ld de, FontSmall
	ret

_LoadStandardFont::
	call GetFontPointer
	push de
	ld hl, vTiles1
	lb bc, BANK(Fonts), 32 ; "A" to "]"
	call Get1bppViaHDMA
	pop de
	push de
	ld h, d
	ld l, e
	ld bc, 32 * TILE_1BPP_SIZE
	add hl, bc
	ld d, h
	ld e, l
	ld hl, vTiles1 tile $20
	lb bc, BANK(Fonts), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bppViaHDMA
	pop de
	push de
	ld h, d
	ld l, e
	ld bc, 64 * TILE_1BPP_SIZE
	add hl, bc
	ld d, h
	ld e, l
	ld hl, vTiles1 tile $40
	lb bc, BANK(Fonts), 32 ; $c0 to "←"
	call Get1bppViaHDMA
	pop de
	ld h, d
	ld l, e
	ld bc, 96 * TILE_1BPP_SIZE
	add hl, bc
	ld d, h
	ld e, l
	ld hl, vTiles1 tile $60
	lb bc, BANK(Fonts), 32 ; "'" to "9"
	jp Get1bppViaHDMA

_LoadFontsExtra1::
	jr LoadFrame

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 16
	call Get2bppViaHDMA
	jr LoadFrame

_LoadExpBarGFX::
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $70
	lb bc, BANK(ExpBarGFX), 5
	call Get2bppViaHDMA
	ld de, SummaryScreenPageTilesGFX + 1 tiles
	ld hl, vTiles2 tile $75
	lb bc, BANK(SummaryScreenPageTilesGFX), 3
	call Get2bppViaHDMA
	jr LoadFrame
	
LoadFrame:
	ld a, [wTextboxFrame]
	ld bc, TEXTBOX_FRAME_TILES * TILE_1BPP_SIZE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles0 tile '┌' ; $ba
	lb bc, BANK(Frames), TEXTBOX_FRAME_TILES ; '┌' to '┘'
	call Get1bppViaHDMA
	ld hl, vTiles2 tile ' ' ; $7f
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	call Get1bppViaHDMA
	ret

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 12
	call Get2bppViaHDMA
	call LoadFrame

LoadHPBar:
	call _LoadExpBarGFX
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ret

SummaryScreen_LoadFont:
	call _LoadFontsBattleExtra
	call _LoadExpBarGFX
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA

LoadSummaryScreenPageTilesGFX:
	ld de, SummaryScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(SummaryScreenPageTilesGFX), 32 ; Loading More Tiles than in Vanilla
	call Get2bppViaHDMA
	ret
