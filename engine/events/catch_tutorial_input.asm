_LyraAutoInput_A::
	ld hl, LyraAutoInput_A
	jr _LyraAutoInput

_LyraAutoInput_RightA:
	ld hl, LyraAutoInput_RightA
	jr _LyraAutoInput

_LyraAutoInput_DownA:
	ld hl, LyraAutoInput_DownA
	jr _LyraAutoInput

_LyraAutoInput:
	ld a, BANK(LyraAutoInputs)
	call StartAutoInput
	ret

LyraAutoInputs: ; used only for BANK(LyraAutoInputs)

LyraAutoInput_A:
	db NO_INPUT, $50
	db PAD_A, $00
	db NO_INPUT, $ff ; end

LyraAutoInput_RightA:
	db NO_INPUT, $08
	db PAD_RIGHT,  $00
	db NO_INPUT, $08
	db PAD_RIGHT,  $00
	db NO_INPUT, $08
	db PAD_A, $00
	db NO_INPUT, $ff ; end

LyraAutoInput_DownA:
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db PAD_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db PAD_A, $00
	db NO_INPUT, $ff ; end
