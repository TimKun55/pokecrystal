GetTrainerDVs:
; Write the 3 DV bytes of wOtherTrainerClass to wDVAndPersonalityBuffer.

	push hl
	push de
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
rept 3
	add hl, bc
endr

	ld de, wDVAndPersonalityBuffer
	ld bc, NUM_STATS / 2 ; 2 DVs per byte
	call CopyBytes

	pop de
	pop hl
	ret

INCLUDE "data/trainers/dvs.asm"
