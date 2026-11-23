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
; Return the Hidden Power type in a and b from the three DVs at de.
; Builds b = %00fedcba (SDf, SAt, Spe, Def, Atk, HP), then looks up
; type = floor(b × 17 / 64) + 1 so all 17 non-Normal types occur evenly.
	push de
	ld h, d
	ld l, e
	ld bc, 3
	ld e, 1
.loop
	ld a, [hli]
	swap a
	and %00010001
	srl a
	push af
	call c, .add_bit
	pop af
	sla e
	and a
	call nz, .add_bit
	sla e
	dec c
	jr nz, .loop
	; b = 0..63
	ld hl, HiddenPowerTypes
	ld c, b
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld b, a
	pop de
	ret

.add_bit
	ld a, b
	or e
	ld b, a
	ret

HiddenPowerTypes:
; 64 entries: floor(index × 17 / 64) + 1
; 13 types occur 4 times; Rock/Fire/Psychic/Fairy occur 3 times.
	db FIGHTING, FIGHTING, FIGHTING, FIGHTING
	db FLYING, FLYING, FLYING, FLYING
	db POISON, POISON, POISON, POISON
	db GROUND, GROUND, GROUND, GROUND
	db ROCK, ROCK, ROCK
	db BUG, BUG, BUG, BUG
	db GHOST, GHOST, GHOST, GHOST
	db STEEL, STEEL, STEEL, STEEL
	db FIRE, FIRE, FIRE
	db WATER, WATER, WATER, WATER
	db GRASS, GRASS, GRASS, GRASS
	db ELECTRIC, ELECTRIC, ELECTRIC, ELECTRIC
	db PSYCHIC_TYPE, PSYCHIC_TYPE, PSYCHIC_TYPE
	db ICE, ICE, ICE, ICE
	db DRAGON, DRAGON, DRAGON, DRAGON
	db DARK, DARK, DARK, DARK
	db FAIRY, FAIRY, FAIRY
