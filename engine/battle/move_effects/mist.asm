BattleCommand_Mist:
	ld hl, wPlayerScreens
	ld de, wPlayerMistCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld de, wEnemyMistCount
.ok
	bit SCREENS_MIST, [hl]
	jr nz, .failed
	set SCREENS_MIST, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, MistText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
