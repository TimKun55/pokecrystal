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

	ld hl, OddEggs
	ld a, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	; Writes to wOddEgg, wOddEggName, and wOddEggOT,
	; even though OddEggs does not have data for wOddEggOT
	ld de, wOddEgg
	ld bc, NICKNAMED_MON_STRUCT_LENGTH + NAME_LENGTH
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
