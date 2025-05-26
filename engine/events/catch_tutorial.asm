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
	ld de, .LyraItems
	call .CopyLyraData
	ld hl, wLyraNumMedicine
	ld de, .LyraMedicine
	call .CopyLyraData
	ld hl, wLyraNumBalls
	ld de, .LyraBalls
.CopyLyraData:
	ld a, [de]
	inc de
	ld [hli], a
	cp -1
	jr nz, .CopyLyraData
	ret

.Lyra:
	db "Lyra@"
.LyraItems:
	db 2, REPEL, 1, MULCH, 3, -1
.LyraMedicine:
	db 3, POTION, 2, ANTIDOTE, 1, FRESH_WATER, 1, -1
.LyraBalls:
	db 2, POKE_BALL, 10, PREMIER_BALL, 1, -1

.AutoInput:
	db NO_INPUT, $ff ; end
