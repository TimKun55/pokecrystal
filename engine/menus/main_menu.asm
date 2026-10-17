	; MainMenuItems indexes
	const_def
	const MAINMENU_NEW_GAME ; 0
	const MAINMENU_CONTINUE ; 1
	const MAINMENU_MYSTERY  ; 2

	; MainMenu.Strings and MainMenu.Jumptable indexes
	const_def
	const MAINMENUITEM_CONTINUE       ; 0
	const MAINMENUITEM_NEW_GAME       ; 1
	const MAINMENUITEM_OPTION         ; 2
	const MAINMENUITEM_MYSTERY_GIFT   ; 3
	const MAINMENUITEM_DEBUG_ROOM     ; 4

MainMenu:
	farcall DeleteSavedMusic
.loop
	xor a
	ld [wDisableTextAcceleration], a
	call ClearTilemapEtc
	ld b, CGB_GENERIC
	call GetCGBLayout
	call SetDefaultBGPAndOBP
	ld hl, wGameTimerPaused
	res GAME_TIMER_COUNTING_F, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MainMenuJoypadLoop
	call CloseWindow
	jr c, .quit
	call ClearTilemap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr .loop

.quit
	ret

if DEF(_DEBUG)
MainMenu_DebugRoom:
	farcall _DebugRoom
	ret
endc

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 3, 15, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
; entries correspond to MAINMENUITEM_* constants
	db "Continue@"
	db "New Game@"
	db "Option@"
	db "Mystery Gift@"
if DEF(_DEBUG)
	db "DEBUG ROOM@"
endc

.Jumptable:
; entries correspond to MAINMENUITEM_* constants
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Option
	dw MainMenu_MysteryGift
if DEF(_DEBUG)
	dw MainMenu_DebugRoom
endc

MainMenuItems:
; entries correspond to MAINMENU_* constants

	; MAINMENU_NEW_GAME
	db 2
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db -1

	; MAINMENU_CONTINUE
	db 3 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MYSTERY
	db 4 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MYSTERY_GIFT
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

MainMenu_GetWhichMenu:
	nop
	nop
	nop
	ld a, [wSaveFileExists]
	and a
	jr nz, .next
	ld a, MAINMENU_NEW_GAME
	ret

.next
	ldh a, [hCGB]
	cp TRUE
	ld a, MAINMENU_CONTINUE
	ret nz
	ld a, BANK(sNumDailyMysteryGiftPartnerIDs)
	call OpenSRAM
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp -1 ; locked?
	call CloseSRAM
	jr nz, .mystery_gift
	ld a, MAINMENU_CONTINUE
	ret

.mystery_gift
	ld a, MAINMENU_MYSTERY
	ret

MainMenuJoypadLoop:
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp PAD_B
	jr z, .b_button
	cp PAD_A
	jr z, .a_button
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret

MainMenu_PrintCurrentTimeAndDay:
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call .PlaceBox
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.PlaceBox:
	call CheckRTCStatus
	and %10000000 ; Day count exceeded 16383
	jr nz, .TimeFail
	hlcoord 0, 14
	lb bc, 2, 18
	call Textbox
	ret

.TimeFail:
	call SpeechTextbox
	ret

.PlaceTime:
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, .PrintTimeNotSet
	call UpdateTime
	call GetWeekday
	ld b, a
	decoord 2, 15
	call .PrintDayOfWeek
	decoord 9, 16
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
	ld [hl], ':'
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.minString: ; unreferenced
	db "min.@"

.PrintTimeNotSet:
	hlcoord 3, 15
	ld de, .TimeNotSetString
	call PlaceString
	ret

.TimeNotSetString:
	db "Time Not Set@"

.MainMenuTimeUnknownText: ; unreferenced
	text_far _MainMenuTimeUnknownText
	text_end

.PrintDayOfWeek:
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	ret

.Days:
	db "Sun@"
	db "Mon@"
	db "Tues@"
	db "Wednes@"
	db "Thurs@"
	db "Fri@"
	db "Satur@"
.Day:
	db "day@"

ClearTilemapEtc:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	ret

MainMenu_NewGame:
	farcall NewGame
	ret

MainMenu_Option:
	farcall Option
	ret

MainMenu_Continue:
	farcall Continue
	ret

MainMenu_MysteryGift:
	farcall MysteryGift
	ret
