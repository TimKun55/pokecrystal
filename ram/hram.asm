SECTION "HRAM", HRAM

hROMBankBackup:: db
hFarByte::
hTempBank:: db
hSRAMBank:: db

hRTCDayHi::   db
hRTCDayLo::   db
hRTCHours::   db
hRTCMinutes:: db
hRTCSeconds:: db

	ds 2

hHours:: db
	ds 1
hMinutes:: db
	ds 1
hSeconds:: db
	ds 1

	ds 1

hVBlankCounter:: db

	ds 1

hROMBank:: db
hVBlank:: db
hMapEntryMethod:: db

hMenuReturn:: db
hUnusedByte:: db

hJoypadReleased:: db
hJoypadPressed::  db
hJoypadDown::     db
hJoypadSum::      db
hJoyReleased::    db
hJoyPressed::     db
hJoyDown::        db
hJoyLast::        db

hInMenu:: db

	ds 1

hGraphicStartTile:: db
hMoveMon:: db

UNION
hMapObjectIndex:: db
hObjectStructIndex:: db
NEXTU
hConnectionStripLength:: db
hConnectedMapWidth:: db
ENDU

hEnemyMonSpeed:: dw

UNION
; math-related values

UNION
; inputs to Multiply
	ds 1
hMultiplicand:: ds 3
hMultiplier::   db
NEXTU
; result of Multiply
hProduct::      ds 4
NEXTU
; inputs to Divide
hDividend::     ds 4
hDivisor::      db
NEXTU
; results of Divide
hQuotient::     ds 4
hRemainder::    db
ENDU

hMathBuffer:: ds 5

NEXTU
; PrintNum scratch space
hPrintNumBuffer:: ds 10
ENDU

UNION
hUsedSpriteIndex:: db
hUsedSpriteTile::  db
NEXTU
hCurSpriteXCoord::   db
hCurSpriteYCoord::   db
hCurSpriteXPixel::   db
hCurSpriteYPixel::   db
hCurSpriteTile::     db
hCurSpriteOAMFlags:: db
ENDU

hMoneyTemp:: ds 3

hLCDCPointer::     db
hLYOverrideStart:: db
hLYOverrideEnd::   db

	ds 1 ; Collapsed from: UnusedMobileBuffer (unused mobile buffer)
hSerialReceivedNewData::     db
hSerialConnectionStatus::    db
hSerialIgnoringInitialData:: db
hSerialSend::                db
hSerialReceive::             db

hSCX::           db
hSCY::           db
hWX::            db
hWY::            db
hTilesPerCycle:: db
hBGMapMode::     db
hBGMapHalf:: ; used in newbox
hBGMapThird::    db
hBGMapAddress::  dw

hOAMUpdate:: db

hSPBuffer::  dw

hBGMapUpdate::    db
hBGMapTileCount:: db

	ds 1

hMapAnims::      db
hTileAnimFrame:: db

hLastTalked:: db

hRandomAdd:: db
hRandomSub:: db

hUnusedBackup:: db

hBattleTurn::
; Which trainer's turn is it? 0: player, 1: opponent trainer
	db

hCGBPalUpdate:: db
hCGB::          db
hSGB::          db

hDMATransfer:: db
	ds 1 ; Collapsed from: UnusedMobileFlag
hSystemBooted:: db

if DEF(_DEBUG)
hDebugRoomMenuPage::
endc

hFarCallSavedA:: db
hFarCallSavedHL::
hFarCallSavedL:: db
hFarCallSavedH:: db

hLCDInterruptFunction::
hFunctionInstruction:: db ; $c3 jp or $d9 reti
hFunctionTarget::
hFunctionTargetLo:: db
hFunctionTargetHi:: db

hDelayFrameLY:: db

hVBlankHookFunction::
	ds 1	; $00 [nop] (nothing)
			; $c3 [jp]
			; $c9 [ret]
	dw

hSurfingRedrawMode::   db
hSurfingRedrawDest::   dw
hSurfingVBCopySource:: dw
hSurfingVBCopyDest::   dw
hSurfingVBCopySize::   db
hSurfingJoypadBuffer:: db
; Counts down once per VBlank and reloads to 2 whenever the minigame samples
; the held buttons, so input is polled once every three frames (Yellow's
; hFrameCounter use). It must not reuse hVBlankCounter: that is pokecrystal's
; frame clock, and overwriting it stalls DelayFrame.
hSurfingJoypadTimer:: db

ENDSECTION
