BattleCommand_Acrobatics:
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonItem
	jr z, .got_item
	ld hl, wEnemyMonItem
.got_item
	ld a, [hl]
	and a
	ret nz
	jr DoubleDamage
	