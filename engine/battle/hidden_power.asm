HiddenPowerDamage:
; Override Hidden Power's type based on the user's DVs.

	ld de, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld de, wEnemyMonDVs
.got_dvs
	call GetHiddenPowerType

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or SPECIAL
	ld [hl], a

	farcall BattleCommand_DamageStats
	ret

GetHiddenPowerType:
	; Def & 3
	ld a, [de]
	and %0011
	ld b, a

	; + (Atk & 3) << 2
	ld a, [de]
	and %0011 << 4
	swap a
	add a
	add a
	or b

	; add the least significant bit of the Speed DV to increment 50% of the time (to reach Fairy type)
	ld b, a
	inc de ; the Speed DV lives in the second byte
	ld a, [de]
	swap a
	and %0001
	add b

; Skip Normal. The result is 1-17, i.e. FIGHTING..FAIRY.
	inc a
	ld b, a
	ret