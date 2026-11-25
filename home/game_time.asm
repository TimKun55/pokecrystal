ResetGameTime::
	xor a
	ld [wGameTimeCap], a
	ld [wGameTimeHours], a
	ld [wGameTimeHours + 1], a
	ld [wGameTimeMinutes], a
	ld [wGameTimeSeconds], a
	ld [wGameTimeFrames], a
	ret

GameTimer::
	nop

	ldh a, [rWBK]
	push af
	ld a, BANK(wGameTime)
	ldh [rWBK], a

	call .Function

	pop af
	ldh [rWBK], a
	ret

.Function:
; Increment the game timer by one frame.
; The game timer is capped at 999:59:59.00.

; Don't update if game logic is paused.
	ld a, [wGameLogicPaused]
	and a
	ret nz

; Is the timer paused?
	ld hl, wGameTimerPaused
	bit GAME_TIMER_COUNTING_F, [hl]
	ret z

; Is the timer already capped?
	ld hl, wGameTimeCap
	bit 0, [hl]
	ret nz

; +1 frame
	ld hl, wGameTimeFrames
	ld a, [hl]
	inc a

	cp 60 ; frames/second
	jr nc, .second

	ld [hl], a
	ret

.second
	xor a
	ld [hl], a

; The game's own clock gains NO_RTC_SPEEDUP seconds for every second played,
; except during battles, where it runs at real time (1x).
; Only do this when "Real Time Clock" is Off (NO_RTC set).
	ld a, 0
	ldh [rWBK], a
	ld a, [wOptions2]
	ld b, a
	ld a, BANK(wGameTime)
	ldh [rWBK], a
	ld a, b
	bit NO_RTC, a
	jr z, .done
; wBattleMode lives in WRAM bank 1, so switch banks to read it.
	ld a, 1
	ldh [rWBK], a
	ld a, [wBattleMode]
	ld b, a
	ld a, [wBugContestMinsRemaining]
	or b
	ld b, a
	ld a, BANK(wGameTime)
	ldh [rWBK], a
	ld a, b
	and a
	jr nz, .once
rept NO_RTC_SPEEDUP
	call UpdateNoRTC
endr
	jr .done
.once
	call UpdateNoRTC
.done
; +1 second
	ld hl, wGameTimeSeconds
	ld a, [hl]
	inc a

	cp 60 ; seconds/minute
	jr nc, .minute

	ld [hl], a
	ret

.minute
	xor a
	ld [hl], a

; +1 minute
	ld hl, wGameTimeMinutes
	ld a, [hl]
	inc a

	cp 60 ; minutes/hour
	jr nc, .hour

	ld [hl], a
	ret

.hour
	xor a
	ld [hl], a

; +1 hour
	ld a, [wGameTimeHours]
	ld h, a
	ld a, [wGameTimeHours + 1]
	ld l, a
	inc hl

; Cap the timer after 1000 hours.
	ld a, h
	cp HIGH(1000)
	jr c, .ok

	ld a, l
	cp LOW(1000)
	jr c, .ok

	ld hl, wGameTimeCap
	set 0, [hl]

	ld a, 59 ; 999:59:59.00
	ld [wGameTimeMinutes], a
	ld [wGameTimeSeconds], a
	ret

.ok
	ld a, h
	ld [wGameTimeHours], a
	ld a, l
	ld [wGameTimeHours + 1], a
	ret

UpdateNoRTC::
; add a second to the game's own clock (hRTC*)
	ld hl, hRTCSeconds
	inc [hl]
	ld a, 60
	sub [hl]
	ret nz
	ld [hld], a

; +1 minute
	inc [hl]
	ld a, 60
	sub [hl]
	ret nz
	ld [hld], a

; +1 hour
	inc [hl]
	ld a, 24
	sub [hl]
	ret nz
	ld [hld], a

; +1 day (FixDays keeps the day count inside its 140 day loop)
	inc [hl]
	ret
