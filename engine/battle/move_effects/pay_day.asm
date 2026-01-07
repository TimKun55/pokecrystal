BattleCommand_PayDay:
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonLevel]
	jr z, .ok
	ld a, [wEnemyMonLevel]
.ok
	push bc
	ld c, a
	ld b, 5
.loop
	ld hl, wPayDayMoney + 2
	ld a, c
	add [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	dec hl
	jr nz, .done
	inc [hl]
.done
	dec b
	jr nz, .loop
	pop bc

	ld hl, CoinsScatteredText
	jp StdBattleTextbox
