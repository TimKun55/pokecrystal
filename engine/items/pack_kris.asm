DrawKrisPackGFX:
	ld hl, PackFGFXPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, vTiles2 tile $27
	lb bc, BANK(PackFGFX), 25
	call Request2bpp
	ret

PackFGFXPointers:
	dw PackFGFX + (25 tiles) * 1 ; ITEM_POCKET
	dw PackFGFX + (25 tiles) * 4 ; BALL_POCKET
	dw PackFGFX + (25 tiles) * 0 ; KEY_ITEM_POCKET
	dw PackFGFX + (25 tiles) * 3 ; TM_HM_POCKET
	dw PackFGFX + (25 tiles) * 5 ; BERRY_POCKET
	dw PackFGFX + (25 tiles) * 2 ; MEDICINE_POCKET

PackFGFX:
INCBIN "gfx/pack/pack_f.2bpp"
