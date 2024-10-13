CatchTutorial::
	ld a, [wBattleType]
	dec a
	ld c, a
	ld hl, .dw
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw .LyraTutorial
	dw .LyraTutorial
	dw .LyraTutorial

.LyraTutorial:
; Back up your name to your Mum's name.
	ld hl, wPlayerName
	ld de, wMumsName
	ld bc, NAME_LENGTH
	call CopyBytes
; Copy Lyra's name to your name
	ld hl, .Lyra
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	call .LoadLyraData

	xor a
	ldh [hJoyDown], a
	ldh [hJoyPressed], a
	ld a, [wOptions]
	push af
	and ~TEXT_DELAY_MASK
	add TEXT_DELAY_MED
	ld [wOptions], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	callfar StartBattle
	call StopAutoInput
	pop af

	ld [wOptions], a
	ld hl, wMumsName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.LoadLyraData:
	ld hl, wLyraNumItems
	ld [hl], 1
	inc hl
	ld [hl], POTION
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], -1
	ld hl, wLyraNumKeyItems
	ld [hl], 0
	inc hl
	ld [hl], -1
	ld hl, wLyraNumBalls
	ld a, 1
	ld [hli], a
	ld a, POKE_BALL
	ld [hli], a
	ld [hli], a
	ld [hl], -1
	ret

.Lyra:
	db "Lyra@"

.AutoInput:
	db NO_INPUT, $ff ; end
