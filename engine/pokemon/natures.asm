GeneratePersonality::
; Generate the two personality bytes in wDVAndPersonalityBuffer.
; b = species
; c = form (0 if none; 1..28 for Unown)
; e = PERSONALITY_FORCE_SHINY / PERSONALITY_NEVER_SHINY /
;     PERSONALITY_FORCE_NATURE flags
; d = forced nature when PERSONALITY_FORCE_NATURE is set
; a is the ROM bank during farcall and cannot carry the flags.
; DVs must already be in wDVAndPersonalityBuffer + 0..2.
	push hl
	push de
	push bc

; Nature: 0..24, or the Everstone-inherited nature
	ld a, e
	and PERSONALITY_FORCE_NATURE
	jr nz, .got_nature
	ld a, NUM_NATURES
	call RandomRange
	ld d, a
.got_nature
	ld a, d
	and NATURE_MASK
	ld d, a

; Shiny: 1/256 * 8/256 = 1/8192, unless overridden.
; NEVER_SHINY takes precedence if contradictory flags are ever passed.
	ld a, e
	and PERSONALITY_NEVER_SHINY
	jr nz, .not_shiny
	ld a, e
	and PERSONALITY_FORCE_SHINY
	jr nz, .shiny
	call Random
	and a
	jr nz, .not_shiny
	call Random
	cp SHINY_NUMERATOR
	jr nc, .not_shiny
.shiny
	ld a, SHINY_MASK
	jr .got_shiny
.not_shiny
	xor a
.got_shiny
	or d ; nature occupies bits 4-0, so it cannot overlap SHINY_MASK
	ld [wDVAndPersonalityBuffer + MON_PERSONALITY - MON_DVS], a

; Gender: roll 0..7, scaled to this fork's 0..224 gender-ratio range.
; This matches the contribution the old Attack/Defense/Special DVs made.
	call Random
	and %111
	swap a
	add a ; a = roll * 32 (0..224)
	ld d, a
	ld a, b
	ld c, a
	ld b, 0 ; this fork has no form-specific gender ratios
	call GetGenderRatio
	ld a, d
	cp c
	sbc a ; $ff if female, 0 if male
	and GENDER_MASK
	ld d, a

; Form: Unown letters are gated by the unlock table
	pop bc ; b = species, c = passed-in form
	ld a, b
	cp UNOWN
	jr nz, .use_passed_form
	ld a, [wUnlockedUnowns]
	and a
	jr z, .no_unlocked_unown_sets
.roll_form
	push de ; CheckUnownLetter clobbers de, including the gender bit in d
	ld a, NUM_UNOWN
	call RandomRange
	inc a ; 1..28
	ld [wUnownLetter], a
	farcall CheckUnownLetter
	pop de
	jr c, .roll_form
	ld a, [wUnownLetter]
	jr .got_form
.no_unlocked_unown_sets
	; No set is unlocked yet, so no letter can pass the gate. Keep a valid
	; placeholder form for forced/trainer Unown instead of looping forever.
	ld a, UNOWN_A
	ld [wUnownLetter], a
	jr .got_form
.use_passed_form
	ld a, c
	and FORM_MASK
.got_form
	or d
	ld [wDVAndPersonalityBuffer + MON_PERSONALITY - MON_DVS + 1], a

	pop de
	pop hl
	ret

PrintNature:
; Print nature b at hl.
	push hl
	ld hl, NatureNames
	jr _PrintNatureProperty

PrintNatureIndicators:
; Retained only to preserve the predef index. The summary screen draws arrows.
	ret

_PrintNatureProperty:
	ld a, b
	ld e, a
	ld d, 0
	add hl, de
	ld e, [hl]
	add hl, de
	ld e, l
	ld d, h
	pop hl
	; PlaceString is in the home bank, so a plain call is enough.
	; farcall would replace hl with PlaceString's address and lose the
	; tilemap coordinate in hl.
	call PlaceString
	ret

INCLUDE "data/natures.asm"
