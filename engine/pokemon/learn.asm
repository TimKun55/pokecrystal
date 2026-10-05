; Modes for the shared move screen, used when picking a move to forget.
	const_def
	const MOVESCREEN_NORMAL
	const MOVESCREEN_NEWMOVE

DEF MOVESCREEN_LIST_LENGTH EQU NUM_MOVES + 1 ; the move being learned is listed too
DEF MAX_LIST_OFFSET EQU MOVESCREEN_LIST_LENGTH - NUM_MOVES ; four slots, five moves

LearnMove:
	call LoadTilemapToTempTilemap
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes

.loop
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
; Get the first empty move slot.  This routine also serves to
; determine whether the Pokemon learning the moves already has
; all four slots occupied, in which case one would need to be
; deleted.
.next
	ld a, [hl]
	and a
	jr z, .learn
	inc hl
	dec b
	jr nz, .next
; If we're here, we enter the routine for forgetting a move
; to make room for the new move we're trying to learn.
	push de
	call ForgetMove
	pop de
	jp c, .cancel

	push hl
	push de
	ld [wNamedObjectIndex], a

	ld b, a
	ld a, [wBattleMode]
	and a
	jr z, .not_disabled
	ld a, [wDisabledMove]
	cp b
	jr nz, .not_disabled
	xor a
	ld [wDisabledMove], a
	ld [wPlayerDisableCount], a
.not_disabled

	call GetMoveName
	ld hl, Text_1_2_and_Poof ; 1, 2 and…
	call PrintText
	pop de
	pop hl

.learn
	ld a, [wPutativeTMHMMove]
	ld [hl], a
	ld bc, MON_PP - MON_MOVES
	add hl, bc

	push hl
	push de
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop de
	pop hl

	ld [hl], a

	ld a, [wBattleMode]
	and a
	jp z, .learned

	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wCurBattleMon]
	cp b
	jp nz, .learned

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .learned

	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES)
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	jp .learned

.cancel
	ld hl, StopLearningMoveText
	call PrintText
	call YesNoBox
	jp c, .loop

	ld hl, DidNotLearnMoveText
	call PrintText
	ld b, 0
	ret

.learned
	ld hl, LearnedMoveText
	call PrintText
	ld b, 1
	ret

ForgetMove:
	push hl
	ld hl, AskForgetMoveText
	call PrintText
	call YesNoBox
	pop hl
	ret c

.loop
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	push de
	call ChooseMoveToForget
	pop de
	jr c, .cancel
	ld c, a
	ld b, 0
	ld h, d
	ld l, e
	add hl, bc
	push hl
	call IsHMMove
	pop hl
	jr c, .hmmove
	ld a, [hl]
	and a
	ret

.hmmove
	ld hl, MoveCantForgetHMText
	call PrintText
	jr .loop

.cancel
	scf
	ret

LearnedMoveText:
	text_far _LearnedMoveText
	text_end

MoveAskForgetText:
	text_far _MoveAskForgetText
	text_end

StopLearningMoveText:
	text_far _StopLearningMoveText
	text_end

DidNotLearnMoveText:
	text_far _DidNotLearnMoveText
	text_end

AskForgetMoveText:
	text_far _AskForgetMoveText
	text_end

ChooseMoveToForget:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [wPutativeTMHMMove]
	push af
	ld a, [wItemQuantity]
	push af
	ld a, [wCurItemQuantity]
	push af
	ld a, [wCurItem]
	push af
	call .BuildMoveList
	farcall ChooseMoveToLearn
	pop af
	ld [wCurItem], a
	pop af
	ld [wCurItemQuantity], a
	pop af
	ld [wItemQuantity], a
	pop af
	ld [wPutativeTMHMMove], a
	pop bc
	ld a, b
	ld [wOptions], a
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .cancel

	ld a, [wMenuSelection]
	ld hl, wPutativeTMHMMove
	cp [hl]
	jr z, .cancel ; the move being learned, so declining it
	ld d, a ; the chosen move, in d: ld bc below would wipe b
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld c, NUM_MOVES
.find_slot
	ld a, [hl]
	cp d
	jr z, .found_slot
	inc hl
	dec c
	jr nz, .find_slot
	jr .cancel ; not one of the mon's moves after all
.found_slot
	ld a, NUM_MOVES
	sub c
	push af
	call ClearSprites
	call ClearTilemap
	call .Teardown
	pop af
	and a
	ret

.cancel
	call ClearSprites
	call ClearTilemap
	call .Teardown
	scf
	ret

.BuildMoveList
	ld a, NUM_MOVES
	ld [wd002], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld de, wd002 + 1
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [wPutativeTMHMMove]
	ld [de], a
	inc de
	xor a
	ld [de], a ; the move list is zero terminated, as CheckAlreadyInList expects
	ret

; Rebuild whichever screen we interrupted.
.Teardown
	call ClearBGPalettes
	ld a, [wBattleMode]
	and a
	jr z, .overworld
	call ClearTilemap
	call ClearSprites
	call ClearPalettes
	farcall GetBattleMonBackpic
	farcall GetEnemyMonFrontpic
	farcall _LoadBattleFontsHPBar
	call UpdateSprites
	call SafeLoadTempTilemapToTilemap
	farcall FinishBattleAnim ; battle colours, then a frame
	ret

.overworld
; Back to the party menu
	ld a, [wCurPartyMon]
	push af
	xor a
	ld [wPartyMenuActionText], a
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	farcall WritePartyMenuTilemap
	pop af
	ld [wCurPartyMon], a
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call SpeechTextbox
	call DelayFrame
	ret

Text_1_2_and_Poof:
	text_far Text_MoveForgetCount ; 1, 2 and…
	text_asm
	push de
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	pop de
	ld hl, .MoveForgotText
	ret

.MoveForgotText:
	text_far _MoveForgotText
	text_end

MoveCantForgetHMText:
	text_far _MoveCantForgetHMText
	text_end
