BankOfMum:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	xor a
	ld [wJumptableIndex], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call .RunJumptable
	jr .loop

.done
	pop af
	ldh [hInMenu], a
	ret

.RunJumptable:
	jumptable .dw, wJumptableIndex

.dw
	dw .CheckIfBankInitialized
	dw .InitializeBank
	dw .IsThisAboutYourMoney
	dw .AccessBankOfMum
	dw .StoreMoney
	dw .TakeMoney
	dw .StopOrStartSavingMoney
	dw .JustDoWhatYouCan
	dw .AskDST

.CheckIfBankInitialized:
	ld a, [wMumSavingMoney]
	bit MUM_ACTIVE_F, a
	jr nz, .savingmoneyalready
	set MUM_ACTIVE_F, a
	ld [wMumSavingMoney], a
	ld a, $1
	jr .done_0

.savingmoneyalready
	ld a, $2

.done_0
	ld [wJumptableIndex], a
	ret

.InitializeBank:
	ld hl, MumLeavingText1
	call PrintText
	call YesNoBox
	jr c, .DontSaveMoney
	ld hl, MumLeavingText2
	call PrintText
	ld a, (1 << MUM_ACTIVE_F) | (1 << MUM_SAVING_SOME_MONEY_F)
	jr .done_1

.DontSaveMoney:
	ld a, 1 << MUM_ACTIVE_F

.done_1
	ld [wMumSavingMoney], a
	ld hl, MumLeavingText3
	call PrintText
	ld a, $8
	ld [wJumptableIndex], a
	ret

.IsThisAboutYourMoney:
	ld hl, MumIsThisAboutYourMoneyText
	call PrintText
	call YesNoBox
	jr c, .nope
	ld a, $3
	jr .done_2

.nope
	call DSTChecks
	ld a, $7

.done_2
	ld [wJumptableIndex], a
	ret

.AccessBankOfMum:
	ld hl, MumBankWhatDoYouWantToDoText
	call PrintText
	call LoadStandardMenuHeader
	ld hl, BankOfMum_MenuHeader
	call CopyMenuHeader
	call VerticalMenu
	call CloseWindow
	jr c, .cancel
	ld a, [wMenuCursorY]
	cp $1
	jr z, .withdraw
	cp $2
	jr z, .deposit
	cp $3
	jr z, .stopsaving

.cancel
	ld a, $7
	jr .done_3

.withdraw
	ld a, $5
	jr .done_3

.deposit
	ld a, $4
	jr .done_3

.stopsaving
	ld a, $6

.done_3
	ld [wJumptableIndex], a
	ret

.StoreMoney:
	ld hl, MumStoreMoneyText
	call PrintText
	xor a
	ld hl, wStringBuffer2
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 5
	ld [wMumBankDigitCursorPosition], a
	call LoadStandardMenuHeader
	call Mum_SetUpDepositMenu
	call Mum_Wait10Frames
	call Mum_WithdrawDepositMenuJoypad
	call CloseWindow
	jr c, .CancelDeposit
	ld hl, wStringBuffer2
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .CancelDeposit
	ld de, wMoney
	ld bc, wStringBuffer2
	farcall CompareMoney
	jr c, .InsufficientFundsInWallet
	ld hl, wStringBuffer2
	ld de, wStringBuffer2 + 3
	ld bc, 3
	call CopyBytes
	ld bc, wMumsMoney
	ld de, wStringBuffer2
	farcall GiveMoney
	jr c, .NotEnoughRoomInBank
	ld bc, wStringBuffer2 + 3
	ld de, wMoney
	farcall TakeMoney
	ld hl, wStringBuffer2
	ld de, wMumsMoney
	ld bc, 3
	call CopyBytes
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, MumStoredMoneyText
	call PrintText
	ld a, $8
	jr .done_4

.InsufficientFundsInWallet:
	ld hl, MumInsufficientFundsInWalletText
	call PrintText
	ret

.NotEnoughRoomInBank:
	ld hl, MumNotEnoughRoomInBankText
	call PrintText
	ret

.CancelDeposit:
	ld a, $7

.done_4
	ld [wJumptableIndex], a
	ret

.TakeMoney:
	ld hl, MumTakeMoneyText
	call PrintText
	xor a
	ld hl, wStringBuffer2
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 5
	ld [wMumBankDigitCursorPosition], a
	call LoadStandardMenuHeader
	call Mum_SetUpWithdrawMenu
	call Mum_Wait10Frames
	call Mum_WithdrawDepositMenuJoypad
	call CloseWindow
	jr c, .CancelWithdraw
	ld hl, wStringBuffer2
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .CancelWithdraw
	ld hl, wStringBuffer2
	ld de, wStringBuffer2 + 3
	ld bc, 3
	call CopyBytes
	ld de, wMumsMoney
	ld bc, wStringBuffer2
	farcall CompareMoney
	jr c, .InsufficientFundsInBank
	ld bc, wMoney
	ld de, wStringBuffer2
	farcall GiveMoney
	jr c, .NotEnoughRoomInWallet
	ld bc, wStringBuffer2 + 3
	ld de, wMumsMoney
	farcall TakeMoney
	ld hl, wStringBuffer2
	ld de, wMoney
	ld bc, 3
	call CopyBytes
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, MumTakenMoneyText
	call PrintText
	ld a, $8
	jr .done_5

.InsufficientFundsInBank:
	ld hl, MumHaventSavedThatMuchText
	call PrintText
	ret

.NotEnoughRoomInWallet:
	ld hl, MumNotEnoughRoomInWalletText
	call PrintText
	ret

.CancelWithdraw:
	ld a, $7

.done_5
	ld [wJumptableIndex], a
	ret

.StopOrStartSavingMoney:
	ld hl, MumSaveMoneyText
	call PrintText
	call YesNoBox
	jr c, .StopSavingMoney
	ld a, (1 << MUM_ACTIVE_F) | (1 << MUM_SAVING_SOME_MONEY_F)
	ld [wMumSavingMoney], a
	ld hl, MumStartSavingMoneyText
	call PrintText
	ld a, $8
	ld [wJumptableIndex], a
	ret

.StopSavingMoney:
	ld a, 1 << MUM_ACTIVE_F
	ld [wMumSavingMoney], a
	ld a, $7
	ld [wJumptableIndex], a
	ret

.JustDoWhatYouCan:
	ld hl, MumJustDoWhatYouCanText
	call PrintText

.AskDST:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

DSTChecks:
; check the time; avoid changing DST if doing so would change the current day
	ld a, [wDST]
	bit 7, a
	ldh a, [hHours]
	jr z, .NotDST
	and a ; within one hour of 00:00?
	jr z, .LostBooklet
	jr .loop

.NotDST:
	cp 23 ; within one hour of 23:00?
	jr nz, .loop
	; fallthrough

.LostBooklet:
	call .ClearBox
	bccoord 1, 14
	ld hl, .TimesetAskAdjustDSTText
	call PrintTextboxTextAt
	call YesNoBox
	ret c
	call .ClearBox
	bccoord 1, 14
	ld hl, .MumLostGearBookletText
	call PrintTextboxTextAt
	ret

.loop
	call .ClearBox
	bccoord 1, 14
	ld a, [wDST]
	bit 7, a
	jr z, .SetDST
	ld hl, .TimesetAskNotDSTText
	call PrintTextboxTextAt
	call YesNoBox
	ret c
	ld a, [wDST]
	res 7, a
	ld [wDST], a
	call .SetClockBack
	call .ClearBox
	bccoord 1, 14
	ld hl, .TimesetNotDSTText
	call PrintTextboxTextAt
	ret

.SetDST:
	ld hl, .TimesetAskDSTText
	call PrintTextboxTextAt
	call YesNoBox
	ret c
	ld a, [wDST]
	set 7, a
	ld [wDST], a
	call .SetClockForward
	call .ClearBox
	bccoord 1, 14
	ld hl, .TimesetDSTText
	call PrintTextboxTextAt
	ret

.SetClockForward:
	ld a, [wStartHour]
	add 1
	sub 24
	jr nc, .DontLoopHourForward
	add 24
.DontLoopHourForward:
	ld [wStartHour], a
	ccf
	ld a, [wStartDay]
	adc 0
	ld [wStartDay], a
	ret

.SetClockBack:
	ld a, [wStartHour]
	sub 1
	jr nc, .DontLoopHourBack
	add 24
.DontLoopHourBack:
	ld [wStartHour], a
	ld a, [wStartDay]
	sbc 0
	jr nc, .DontLoopDayBack
	add 7
.DontLoopDayBack:
	ld [wStartDay], a
	ret

.ClearBox:
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ret

.TimesetAskAdjustDSTText:
	text_far _TimesetAskAdjustDSTText
	text_end

.MumLostGearBookletText:
	text_far _MumLostGearBookletText
	text_end

.TimesetAskDSTText:
	text_far _TimesetAskDSTText
	text_end

.TimesetDSTText:
	text_far _TimesetDSTText
	text_end

.TimesetAskNotDSTText:
	text_far _TimesetAskNotDSTText
	text_end

.TimesetNotDSTText:
	text_far _TimesetNotDSTText
	text_end

Mum_SetUpWithdrawMenu:
	ld de, Mon_WithdrawString
	jr Mum_ContinueMenuSetup

Mum_SetUpDepositMenu:
	ld de, Mum_DepositString
Mum_ContinueMenuSetup:
	push de
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 6, 18
	call Textbox
	hlcoord 1, 2
	ld de, Mum_SavedString
	call PlaceString
	hlcoord 12, 2
	ld de, wMumsMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 4
	ld de, Mum_HeldString
	call PlaceString
	hlcoord 12, 4
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 6
	pop de
	call PlaceString
	hlcoord 12, 6
	ld de, wStringBuffer2
	lb bc, PRINTNUM_MONEY | PRINTNUM_LEADINGZEROS | 3, 6
	call PrintNum
	call UpdateSprites
	call CGBOnly_CopyTilemapAtOnce
	ret

Mum_Wait10Frames:
	ld c, 10
	call DelayFrames
	ret

Mum_WithdrawDepositMenuJoypad:
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and PAD_B
	jr nz, .pressedB
	ld a, [hl]
	and PAD_A
	jr nz, .pressedA
	call .dpadaction
	xor a
	ldh [hBGMapMode], a
	hlcoord 12, 6
	ld bc, 7
	ld a, ' '
	call ByteFill
	hlcoord 12, 6
	ld de, wStringBuffer2
	lb bc, PRINTNUM_MONEY | PRINTNUM_LEADINGZEROS | 3, 6
	call PrintNum
	ldh a, [hVBlankCounter]
	and $10
	jr nz, .skip
	hlcoord 13, 6
	ld a, [wMumBankDigitCursorPosition]
	ld c, a
	ld b, 0
	add hl, bc
	ld [hl], ' '

.skip
	call WaitBGMap
	jr .loop

.pressedB
	scf
	ret

.pressedA
	and a
	ret

.dpadaction
	ld hl, hJoyLast
	ld a, [hl]
	and PAD_UP
	jr nz, .incrementdigit
	ld a, [hl]
	and PAD_DOWN
	jr nz, .decrementdigit
	ld a, [hl]
	and PAD_LEFT
	jr nz, .movecursorleft
	ld a, [hl]
	and PAD_RIGHT
	jr nz, .movecursorright
	and a
	ret

.movecursorleft
	ld hl, wMumBankDigitCursorPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.movecursorright
	ld hl, wMumBankDigitCursorPosition
	ld a, [hl]
	cp 5
	ret nc
	inc [hl]
	ret

.incrementdigit
	ld hl, .DigitQuantities
	call .getdigitquantity
	ld c, l
	ld b, h
	ld de, wStringBuffer2
	farcall GiveMoney
	ret

.decrementdigit
	ld hl, .DigitQuantities
	call .getdigitquantity
	ld c, l
	ld b, h
	ld de, wStringBuffer2
	farcall TakeMoney
	ret

.getdigitquantity
	ld a, [wMumBankDigitCursorPosition]
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	pop de
	ret

.DigitQuantities:
	for x, 5, -1, -1
		bigdt 10**x
	endr
	for x, 5, -1, -1
		bigdt 10**x
	endr
	for x, 5, -1, -1
		bigdt 9 * 10**x
	endr

MumLeavingText1:
	text_far _MumLeavingText1
	text_end

MumLeavingText2:
	text_far _MumLeavingText2
	text_end

MumLeavingText3:
	text_far _MumLeavingText3
	text_end

MumIsThisAboutYourMoneyText:
	text_far _MumIsThisAboutYourMoneyText
	text_end

MumBankWhatDoYouWantToDoText:
	text_far _MumBankWhatDoYouWantToDoText
	text_end

MumStoreMoneyText:
	text_far _MumStoreMoneyText
	text_end

MumTakeMoneyText:
	text_far _MumTakeMoneyText
	text_end

MumSaveMoneyText:
	text_far _MumSaveMoneyText
	text_end

MumHaventSavedThatMuchText:
	text_far _MumHaventSavedThatMuchText
	text_end

MumNotEnoughRoomInWalletText:
	text_far _MumNotEnoughRoomInWalletText
	text_end

MumInsufficientFundsInWalletText:
	text_far _MumInsufficientFundsInWalletText
	text_end

MumNotEnoughRoomInBankText:
	text_far _MumNotEnoughRoomInBankText
	text_end

MumStartSavingMoneyText:
	text_far _MumStartSavingMoneyText
	text_end

MumStoredMoneyText:
	text_far _MumStoredMoneyText
	text_end

MumTakenMoneyText:
	text_far _MumTakenMoneyText
	text_end

MumJustDoWhatYouCanText:
	text_far _MumJustDoWhatYouCanText
	text_end

Mum_SavedString:
	db "Saved@"

Mon_WithdrawString:
	db "Withdraw@"

Mum_DepositString:
	db "Deposit@"

Mum_HeldString:
	db "Held@"

BankOfMum_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 10
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Get@"
	db "Save@"
	db "Change@"
	db "Cancel@"
