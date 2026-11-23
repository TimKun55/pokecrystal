; The probability table has 14 entries (non-shiny/shiny pairs); the data table
; below stores only the seven distinct species. Its low bit is the shiny flag.
DEF NUM_ODD_EGG_SPECIES EQU 7
DEF ODD_EGG_STRUCT_LENGTH EQU 1 + NUM_MOVES

GiveOddEgg:
	farcall _GiveOddEgg
	ret

_GiveOddEgg:
	; Figure out which egg to give.

	; Compare a random word to probabilities out of $ffff.
	call Random
	ld hl, OddEggProbabilities
	ld c, 0
	ld b, c
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	; Break on $ffff.
	ld a, d
	cp HIGH($ffff)
	jr nz, .not_done
	ld a, e
	cp LOW($ffff)
	jr z, .done
.not_done

	; Break when the random word <= the next probability in de.
	ldh a, [hRandomSub]
	cp d
	jr c, .done
	jr z, .ok
	jr .next
.ok
	ldh a, [hRandomAdd]
	cp e
	jr c, .done
	jr z, .done
.next
	inc bc
	jr .loop
.done
	; bc = 0..13. The low bit selects shiny; the rest selects the species.
	push bc ; keep the original index for the shiny flag

	srl b
	rr c ; bc = species index 0..6

	ld hl, OddEggs
	ld a, ODD_EGG_STRUCT_LENGTH
	call AddNTimes
	push hl

	; Zero the whole mon struct and nickname; every unused byte stays cleared.
	xor a
	ld hl, wOddEgg
	ld bc, PARTYMON_STRUCT_LENGTH + MON_NAME_LENGTH
	call ByteFill

	pop hl

	; Species and its four fixed moves are the only per-egg table data.
	ld a, [hli]
	ld [wOddEggSpecies], a
	ld de, wOddEggMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld a, EGG_LEVEL
	ld [wOddEggLevel], a
	ld a, 2
	ld [wOddEggHappiness], a ; steps to hatch

	ld hl, .Egg
	ld de, wOddEggName
	ld bc, MON_NAME_LENGTH
	call CopyBytes

; All three DV bytes are random. The buffer also seeds GeneratePersonality.
	call Random
	ld [wOddEggDVs], a
	ld [wDVAndPersonalityBuffer], a
	call Random
	ld [wOddEggDVs + 1], a
	ld [wDVAndPersonalityBuffer + 1], a
	call Random
	ld [wOddEggDVs + 2], a
	ld [wDVAndPersonalityBuffer + 2], a

; EXP is not regenerated at hatch, so it must match EGG_LEVEL.
	ld a, [wOddEggSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData
	ld d, EGG_LEVEL
	callfar CalcExpAtLevel
	ld hl, wOddEggExp
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a

; PP is derived from the fixed moves, just like daycare eggs.
	ld hl, wOddEggMoves
	ld de, wOddEggPP
	predef FillPP

; Nature, shininess, gender, and form are all generated fresh. The 14% shiny
; rate comes from the probability table, not from DV-based shininess.
	pop bc
	ld a, c
	and 1
	jr z, .not_shiny
	ld e, PERSONALITY_FORCE_SHINY
	jr .got_flags
.not_shiny
	ld e, 0
.got_flags
	ld a, [wOddEggSpecies]
	ld b, a
	ld c, 0 ; no Unown form
	farcall GeneratePersonality
	ld hl, wDVAndPersonalityBuffer + MON_PERSONALITY - MON_DVS
	ld de, wOddEggPersonality
	ld bc, 2
	call CopyBytes

	ld a, EGG_TICKET
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	; load Odd Egg Name in wTempOddEggNickname
	ld hl, .Odd
	ld de, wTempOddEggNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	farcall AddOddEggToParty
	ret

.Odd:
	dname "Odd", MON_NAME_LENGTH + 1

.Egg:
	dname "Egg", MON_NAME_LENGTH

INCLUDE "data/events/odd_eggs.asm"

; Add the Odd Egg to the party.
; The caller must have checked there is room; see maps/DayCare.asm.
; The mon's data is already built in wOddEgg, so it is copied rather than
; generated. The Odd Egg carries no mail, so sPartyMail is left untouched.
AddOddEggToParty:
	ld hl, wPartyCount
	ld a, [hl]
	inc [hl]
	ld [wCurPartyMon], a

	; species, then the terminator
	ld hl, wPartySpecies
	ld a, [wCurPartyMon]
	ld bc, 1
	call AddNTimes
	ld d, h
	ld e, l
	ld a, EGG
	ld [de], a
	inc de
	ld a, -1
	ld [de], a

	; the mon itself
	ld hl, wPartyMon1Species
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wOddEgg
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	; OT name, then the terminator
	ld hl, wPartyMonOTs
	ld a, [wCurPartyMon]
	ld bc, NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wTempOddEggNickname
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, '@'
	ld [de], a

	; nickname, then the terminator
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wOddEggName
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, '@'
	ld [de], a
	ret
