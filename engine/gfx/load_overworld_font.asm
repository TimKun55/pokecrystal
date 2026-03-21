LoadOverworldFont::
	ld a, [wFontType]
	cp FONT_SERIF
	jr z, .font_serif
	cp FONT_MICR
	jr z, .font_micr
	cp FONT_SMALL
	jr z, .font_small
; .font_normal
	ld de, .OverworldFontNormalGFX
	jr .finish
.font_serif
	ld de, .OverworldFontSerifGFX
	jr .finish
.font_micr
	ld de, .OverworldFontMicrGFX
	jr .finish
.font_small
	ld de, .OverworldFontSmallGFX
.finish
	ld hl, vTiles1
	lb bc, BANK(LoadOverworldFont), $80
	call Get2bpp
	ld de, .OverworldFontSpaceGFX
	ld hl, vTiles2 tile ' '
	lb bc, BANK(.OverworldFontSpaceGFX), 1
	call Get2bpp
	ret

.OverworldFontNormalGFX:
INCBIN "gfx/font/overworld_normal.2bpp"

.OverworldFontSerifGFX:
INCBIN "gfx/font/overworld_serif.2bpp"

.OverworldFontMicrGFX:
INCBIN "gfx/font/overworld_micr.2bpp"

.OverworldFontSmallGFX:
INCBIN "gfx/font/overworld_small.2bpp"

.OverworldFontSpaceGFX:
INCBIN "gfx/font/overworld_space.2bpp"
