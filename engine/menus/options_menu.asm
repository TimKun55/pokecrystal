; GetOptionPointer.Pointers indexes
	const_def
	const OPT_TEXT_SPEED    ; 0
	const OPT_BATTLE_SCENE  ; 1
	const OPT_BATTLE_STYLE  ; 2
	const OPT_SOUND         ; 3
	const OPT_RUNNING       ; 4
	const OPT_MENU_ACCOUNT  ; 5
	const OPT_FRAME         ; 6
	const OPT_FONT          ; 7
	const OPT_NO_RTC        ; 8
	const OPT_CANCEL        ; 9
DEF NUM_OPTIONS EQU const_value ; 10
; Leave the lower rows free for the selected option's description.
DEF NUM_VISIBLE_OPTIONS EQU 5
DEF OPTIONS_SCROLL_BOTTOM EQU NUM_OPTIONS - NUM_VISIBLE_OPTIONS

DEF OPTDESCSTATE_PAGE   EQU 0
DEF OPTDESCSTATE_SCROLL EQU 1
DEF OPTDESCSTATE_DONE   EQU 2
DEF OPTDESCSTATE_TYPING EQU 3

_Option:
	call ClearJoypad
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	call ClearTilemap
	call Options_LoadEdgeTiles
	call Options_DrawFrame
	ld b, CGB_PLAIN
	call GetCGBLayout
	ld hl, Options_BGPalettes
	ld de, wBGPals1
	ld bc, 1 palettes
	call FarCopyColorWRAM
	call SetDefaultBGPAndOBP
	xor a
	ld [wJumptableIndex], a
	ld a, $ff
	ld [wOptionsScrollPosition], a
	call Options_UpdateWindow
	call Options_UpdateDescription

	ld a, 1
	ldh [hBGMapMode], a
	call WaitBGMap

.joypad_loop
	call JoyTextDelay
	call DelayFrame
	call Options_UpdateDescriptionTyping
	call Options_AnimateDescriptionCursor
	ldh a, [hJoyPressed]
	and PAD_START | PAD_B
	jr nz, .ExitOptions
	ldh a, [hJoyPressed]
	and PAD_A
	jr z, .notA
	ld a, [wJumptableIndex]
	cp OPT_CANCEL
	jr z, .ExitOptions
	call PlayClickSFX
	call Options_AdvanceDescription
	jr .joypad_loop
.notA
	call OptionsControl
	jr c, .dpad
	call Options_SetRowContext
	call GetOptionPointer
	jr c, .ExitOptions
	jr .joypad_loop

.dpad
	call Options_UpdateWindow
	call Options_UpdateCursorPosition
	call Options_UpdateDescription
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

Options_LoadEdgeTiles:
	ld hl, .EdgeTiles
	ld de, vTiles2 tile $00
	lb bc, BANK(.EdgeTiles), 3
	jp DecompressRequest2bpp

.EdgeTiles:
	INCBIN "gfx/options/edge.2bpp.lz"

Options_BGPalettes:
	INCLUDE "gfx/options/options_bg.pal"

INCLUDE "data/options/options_descriptions.asm"

Options_DrawEdges:
	hlcoord 0, 0
	ld a, $01 ; left edge tile
	ld bc, SCREEN_WIDTH - 2
	ld d, 12
.edge_loop
	ld [hli], a
	inc a ; $02 = right edge tile
	add hl, bc
	ld [hli], a
	dec a ; $01 = left edge tile
	dec d
	jr nz, .edge_loop
	ret

Options_DrawFrame:
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call TextboxPalette
	jp Options_DrawEdges

Options_DrawDescriptionTextbox:
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	jp Textbox

Options_Names:
	table_width 2
	dw .TextSpeed
	dw .BattleScene
	dw .BattleStyle
	dw .Sound
	dw .Running
	dw .MenuAccount
	dw .Frame
	dw .Font
	dw .RTC
	dw .Done
	assert_table_length NUM_OPTIONS

.TextSpeed:   db "Text Speed@"
.BattleScene: db "Battle Scene@"
.BattleStyle: db "Battle Style@"
.Sound:       db "Sound@"
.Running:     db "Running Shoes@"
.MenuAccount: db "Menu Account@"
.Frame:       db "Frame@"
.Font:        db "Font@"
.RTC:         db "RTC@"
.Done:        db "Done@"

Options_TypePrefix: db "Type@"

Options_PlaceStrings:
	ld a, [wOptionsScrollPosition]
	cp OPTIONS_SCROLL_BOTTOM + 1
	jr c, .valid_scroll
	ld a, OPTIONS_SCROLL_BOTTOM
.valid_scroll
	ld b, a
	ld c, NUM_VISIBLE_OPTIONS
	hlcoord 2, 1
.loop
	push bc
	push hl

	; Option index = first visible option + row within the window.
	ld a, NUM_VISIBLE_OPTIONS
	sub c
	add b
	cp OPT_CANCEL + 1
	jr c, .valid_index
	ld a, OPT_CANCEL
.valid_index
	ld [wOptionsMenuRowSelection], a

	; Cache the value coordinate: one row down, nine columns right.
	ld de, SCREEN_WIDTH + 9
	add hl, de
	ld a, l
	ld [wOptionsMenuValueCoord], a
	ld a, h
	ld [wOptionsMenuValueCoord + 1], a

	pop hl
	push hl
	call Options_GetOptionName
	call PlaceString
	pop hl

	ld a, [wOptionsMenuRowSelection]
	cp OPT_CANCEL
	jr z, .next_row

	push hl
	ld de, SCREEN_WIDTH + 8
	add hl, de
	ld [hl], ':'
	inc hl
	ld a, [wOptionsMenuRowSelection]
	cp OPT_FRAME
	jr nz, .not_frame
	ld de, Options_TypePrefix
	call PlaceString
	jr .value_done
.not_frame
	cp OPT_FONT
	jr nz, .value_done
	ld de, Options_Names.Font
	call PlaceString
.value_done
	pop hl

.next_row
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	dec c
	jr nz, .loop
	ret

Options_GetOptionName:
; In: wOptionsMenuRowSelection = option index. Out: DE = name pointer. HL is preserved.
	ld a, [wOptionsMenuRowSelection]
	add a
	ld e, a
	ld d, 0
	push hl
	ld hl, Options_Names
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret

GetOptionPointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to OPT_* constants
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_Sound
	dw Options_Running
	dw Options_MenuAccount
	dw Options_Frame
	dw Options_Font
	dw Options_RealTimeClock
	dw Options_Done

	const_def
	const OPT_TEXT_SPEED_FAST ; 0
	const OPT_TEXT_SPEED_MED  ; 1
	const OPT_TEXT_SPEED_SLOW ; 2
	const OPT_TEXT_SPEED_NONE ; 3

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_NONE
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_FAST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_NONE + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Options_DisplayValue
	and a
	ret

.Strings:
; entries correspond to OPT_TEXT_SPEED_* constants
	dw .Fast
	dw .Mid
	dw .Slow
	dw .None

.Fast: db "Fast   @"
.Mid:  db "Mid    @"
.Slow: db "Slow   @"
.None: db "Instant@"

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c,
; with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_SLOW
	jr z, .slow
	cp TEXT_DELAY_FAST
	jr z, .fast
	cp TEXT_DELAY_NONE
	jr z, .none
	; none of the above
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret

.slow
	ld c, OPT_TEXT_SPEED_SLOW
	lb de, TEXT_DELAY_MED, TEXT_DELAY_NONE
	ret

.fast
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_NONE, TEXT_DELAY_MED
	ret

.none
	ld c, OPT_TEXT_SPEED_NONE
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_FAST
	ret

Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff

.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn

.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.ToggleOn:
	res BATTLE_SCENE, [hl]
	ld de, Options_OnText
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, Options_OffText

.Display:
	call Options_DisplayValue
	and a
	ret

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SHIFT, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SHIFT, [hl]
	ld de, .Set

.Display:
	call Options_DisplayValue
	and a
	ret

.Shift: db "Shift@"
.Set:   db "Set  @"

Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo

.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono

.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono

.SetMono:
	res STEREO, [hl]
	call RestartMapMusic

.ToggleMono:
	ld de, .Mono
	jr .Display

.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic

.ToggleStereo:
	ld de, .Stereo

.Display:
	call Options_DisplayValue
	and a
	ret

.Mono:   db "Mono  @"
.Stereo: db "Stereo@"

Options_Running:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit RUNNING, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit RUNNING, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit RUNNING, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res RUNNING, [hl]
	ld de, Options_OffText
	jr .Display

.ToggleOn:
	set RUNNING, [hl]
	ld de, Options_OnText

.Display:
	call Options_DisplayValue
	and a
	ret

Options_MenuAccount:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit MENU_ACCOUNT, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res MENU_ACCOUNT, [hl]
	ld de, Options_OffText
	jr .Display

.ToggleOn:
	set MENU_ACCOUNT, [hl]
	ld de, Options_OnText

.Display:
	call Options_DisplayValue
	and a
	ret

Options_Frame:
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .LeftPressed
	bit B_PAD_RIGHT, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	cp NUM_FRAMES
	jr nz, .Save
	xor a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a
	cp -1
	jr nz, .Save
	ld a, NUM_FRAMES - 1

.Save:
	ld [hl], a
UpdateFrame:
	ld a, [wTextboxFrame]
	add '1'
	call Options_DisplayNumber
	call LoadFontsExtra
	and a
	ret

Options_Font:
	ld hl, wFontType
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	cp NUM_FONTS
	jr nz, .Save
	xor a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a
	cp -1
	jr nz, .Save
	ld a, NUM_FONTS - 1

.Save:
	maskbits NUM_FONTS
	ld [hl], a
	; fallthrough
UpdateFont:
	ld a, [wFontType]
	add '1'
	call Options_DisplayNumber
	call LoadStandardFont
	and a
	ret

Options_RealTimeClock:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	and D_LEFT | D_RIGHT
	jr z, .Display
	ld a, [hl]
	bit NO_RTC, a
	jr nz, .SwitchOn
; Start the game's clock from the time it is now.
	call GetClock
	ld hl, wOptions2
	set NO_RTC, [hl]
	jr .Display

.SwitchOn:
; Set the cartridge's clock to the game's time, so nothing jumps.
	ld hl, wOptions2
	res NO_RTC, [hl]
	call SetClock

.Display:
	ld de, Options_OnText
	ld a, [wOptions2]
	bit NO_RTC, a
	jr z, .Place
	ld de, Options_OffText
.Place:
	call Options_DisplayValue
	ret

Options_OnText::  db "On @"
Options_OffText:: db "Off@"

Options_Done:
	ldh a, [hJoyPressed]
	and PAD_A
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp PAD_DOWN
	jr z, .DownPressed
	cp PAD_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp OPT_CANCEL ; maximum option index
	jr nz, .Increase
	ld [hl], OPT_TEXT_SPEED ; first option
	scf
	ret

.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a ; OPT_TEXT_SPEED, minimum option index
	jr nz, .Decrease
	ld [hl], NUM_OPTIONS ; decrements to OPT_CANCEL, maximum option index

.Decrease:
	dec [hl]
	scf
	ret

Options_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, 2 * NUM_VISIBLE_OPTIONS + 1
.loop
	ld [hl], ' '
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 1
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wOptionsScrollPosition]
	ld c, a
	ld a, b
	sub c
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], '▶'
	ret

; Scroll arrows on the right side of the menu box.
Options_UpdateArrows:
; Restore the rightmost interior cell, then show ▲ if scrolled down.
	lda_coord 17, 0
	ldcoord_a 18, 0
	ld a, [wOptionsScrollPosition]
	and a
	jr z, .no_up
	ld a, '▲'
	ldcoord_a 18, 0
.no_up
; Restore the rightmost interior cell above the description box, then show
; ▼ if there are more options below the current window.
	lda_coord 17, 11
	ldcoord_a 18, 11
	ld a, [wOptionsScrollPosition]
	cp OPTIONS_SCROLL_BOTTOM
	jr z, .done
	ld a, '▼'
	ldcoord_a 18, 11
.done
	ret

; Calculate the first option visible in the scrolling window.
Options_GetScrollPosition:
	ld a, [wOptionsScrollPosition]
	cp $ff
	jr nz, .have_offset
	xor a
	ret
.have_offset
	ld b, a
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .scroll_down
	cp D_UP
	jr z, .scroll_up
	ld a, b
	ret

.scroll_down
	ld a, [wJumptableIndex]
	cp OPT_TEXT_SPEED
	jr z, .top
	ld a, b
	add a, NUM_VISIBLE_OPTIONS - 1
	ld c, a
	ld a, [wJumptableIndex]
	cp c
	jr c, .keep_offset
	ld a, b
	cp OPTIONS_SCROLL_BOTTOM
	jr z, .keep_offset
	inc a
	ret

.scroll_up
	ld a, [wJumptableIndex]
	cp OPT_CANCEL
	jr z, .bottom
	ld a, b
	and a
	jr z, .keep_offset
	ld a, [wJumptableIndex]
	cp b
	jr c, .move_up
	jr z, .move_up
.keep_offset
	ld a, b
	ret
.move_up
	dec b
	ld a, b
	ret
.top
	xor a
	ret
.bottom
	ld a, OPTIONS_SCROLL_BOTTOM
	ret

; Redraw the option window, scrolling when the cursor reaches the last options.
Options_UpdateWindow:
	call Options_GetScrollPosition
	ld b, a
	ld a, [wOptionsScrollPosition]
	cp b
	jr z, .return
	ld a, b
	ld [wOptionsScrollPosition], a
	hlcoord 2, 1
	ld a, ' '
	ld b, 10
	ld c, 16
	call FillBoxWithByte
; FillBoxWithByte advances HL, so restore the label position.
	hlcoord 2, 1
	call Options_PlaceStrings
	call Options_UpdateCursorPosition
	call Options_UpdateValues
	call Options_UpdateArrows
.return
	ret

Options_UpdateValues:
	ld a, [wJumptableIndex]
	push af
	ldh a, [hJoyPressed]
	push af
	xor a
	ldh [hJoyPressed], a
	ld a, [wOptionsScrollPosition]
	ld [wJumptableIndex], a
	ld a, [wOptionsScrollPosition]
	cp OPTIONS_SCROLL_BOTTOM
	jr z, .four_options
	ld a, NUM_VISIBLE_OPTIONS
	jr .set_option_count
.four_options
	ld a, NUM_VISIBLE_OPTIONS - 1
.set_option_count
	ld b, a
.loop
	push bc
	call Options_SetRowContext
	call GetOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec b
	jr nz, .loop
	ld a, [wOptionsScrollPosition]
	cp 2
	jr c, .load_fonts_only
	ld a, OPT_FRAME
	ld [wJumptableIndex], a
	call Options_SetRowContext
	call UpdateFrame
	ld a, [wOptionsScrollPosition]
	cp 3
	jr c, .load_standard_font
	ld a, OPT_FONT
	ld [wJumptableIndex], a
	call Options_SetRowContext
	call UpdateFont
	jr .font_loaded
.load_fonts_only
	call LoadFontsExtra
.load_standard_font
	ld a, [wFontType]
	call LoadStandardFont
.font_loaded
	pop af
	ldh [hJoyPressed], a
	pop af
	ld [wJumptableIndex], a
	ret

; Redraw the description for the selected option.
Options_UpdateDescription:
	call Options_DrawDescriptionTextbox
	call Options_LookupDescription
	jp Options_StartDescriptionPage

; Point at the selected description in this ROM bank. The renderer reads it
; directly and stops at page markers without waiting for input.
Options_LookupDescription:
	ld a, [wJumptableIndex]
	add a
	ld e, a
	ld d, 0
	ld hl, OptionsDescriptions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, l
	ld [wOptionsMenuDescriptionAddr], a
	ld a, h
	ld [wOptionsMenuDescriptionAddr + 1], a
	xor a
	ld [wOptionsMenuDescriptionState], a
	ret

; Start the current description page. Text Speed uses the configured text
; speed so the player can see how fast the selected setting actually is.
; Instant text keeps the original immediate renderer.
Options_StartDescriptionPage:
	ld a, [wJumptableIndex]
	cp OPT_TEXT_SPEED
	jr nz, .instant
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	jr z, .instant

	ld a, [wOptionsMenuDescriptionState]
	cp OPTDESCSTATE_SCROLL
	jr z, .scroll
	xor a
	jr .set_scroll
.scroll
	ld a, TRUE
.set_scroll
	ld [wOptionsMenuDescriptionScroll], a

	ld hl, wOptionsMenuDescriptionAddr
	ld a, [hli]
	ld [wOptionsMenuDescriptionPageAddr], a
	ld a, [hl]
	ld [wOptionsMenuDescriptionPageAddr + 1], a

	xor a
	ld [wOptionsMenuDescriptionVisibleChars], a
	ld [wOptionsMenuDescriptionDelay], a
	ld a, OPTDESCSTATE_TYPING
	ld [wOptionsMenuDescriptionState], a
	call Options_RedrawTypingPage
	ret

.instant
	jp Options_PlaceDescriptionText

; Called once per frame by the Options loop. Reveals one character when the
; current frame delay has expired.
Options_UpdateDescriptionTyping:
	ld a, [wOptionsMenuDescriptionState]
	cp OPTDESCSTATE_TYPING
	ret nz
	ld a, [wOptionsMenuDescriptionDelay]
	and a
	jr z, .reveal
	dec a
	ld [wOptionsMenuDescriptionDelay], a
	jr nz, .done
.reveal
	jp Options_RedrawTypingPage
.done
	ret

; Redraw the current page with wOptionsMenuDescriptionVisibleChars characters
; shown. Control tokens are free; printable characters cost one delay each.
Options_RedrawTypingPage:
	call Options_ClearDescriptionRows

	ld hl, wOptionsMenuDescriptionPageAddr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a

	ld a, [wOptionsMenuDescriptionScroll]
	and a
	jr z, .fresh
	bccoord 1, 16
	jr .init_counts
.fresh
	bccoord 1, 14

.init_counts
	push bc
	ld hl, wOptionsMenuDescriptionVisibleChars
	inc [hl]
	ld b, [hl] ; characters still to write
	ld c, 0    ; total printable characters on this page
	pop hl     ; tilemap destination

.loop
	ld a, [de]
	cp '@'
	jr z, .stop
	cp '<PARA>'
	jr z, .stop
	cp '<CONT>'
	jr z, .stop
	cp '<PROMPT>'
	jr z, .stop
	cp '<DONE>'
	jr z, .stop
	cp '<LINE>'
	jr z, .new_line
	cp '<NEXT>'
	jr z, .new_line

	inc c
	ld a, b
	and a
	jr z, .no_write
	dec b
	ld a, [de] ; reload the character; A was clobbered by the count test
	ld [hli], a
.no_write
	inc de
	jr .loop

.new_line
	inc de
	hlcoord 1, 16
	jr .loop

.stop
	ld [wOptionsMenuDescriptionStopChar], a
	inc de
	ld a, e
	ld [wOptionsMenuDescriptionResumeAddr], a
	ld a, d
	ld [wOptionsMenuDescriptionResumeAddr + 1], a

	ld a, [wOptionsMenuDescriptionVisibleChars]
	cp c
	jr c, .still_typing

	ld a, [wOptionsMenuDescriptionStopChar]
	cp '<PARA>'
	jr z, .more_para
	cp '<CONT>'
	jr z, .more_cont

	call Options_HideDescriptionCursor
	ld a, OPTDESCSTATE_DONE
	ld [wOptionsMenuDescriptionState], a
	ret

.more_para
	call Options_CopyResumeAddr
	xor a ; OPTDESCSTATE_PAGE
	ld [wOptionsMenuDescriptionState], a
	jp Options_ShowDescriptionCursor

.more_cont
	call Options_CopyResumeAddr
	ld a, OPTDESCSTATE_SCROLL
	ld [wOptionsMenuDescriptionState], a
	jp Options_ShowDescriptionCursor

.still_typing
	; Use the currently selected speed for the next character. Changing the
	; setting mid-description takes effect immediately.
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ld [wOptionsMenuDescriptionDelay], a
	ret

Options_CopyResumeAddr:
	ld a, [wOptionsMenuDescriptionResumeAddr]
	ld [wOptionsMenuDescriptionAddr], a
	ld a, [wOptionsMenuDescriptionResumeAddr + 1]
	ld [wOptionsMenuDescriptionAddr + 1], a
	ret

; A button: advance one <PARA>/<CONT> page, or replay a finished description.
; While the Text Speed description is printing, A finishes the current page.
Options_AdvanceDescription:
	ld a, [wOptionsMenuDescriptionState]
	cp OPTDESCSTATE_TYPING
	jr z, .finish_typing
	cp OPTDESCSTATE_DONE
	jr nz, .advance
	call Options_UpdateDescription
	jr .redraw_edges
.finish_typing
	ld a, 254
	ld [wOptionsMenuDescriptionVisibleChars], a
	call Options_RedrawTypingPage
	jr .redraw_edges
.advance
	call Options_StartDescriptionPage
.redraw_edges
	jp ApplyTilemapInVBlank

; Print the current description page without ever waiting for a button.
Options_PlaceDescriptionText:
	ld a, [wOptionsMenuDescriptionState]
	cp OPTDESCSTATE_DONE
	ret z
	cp OPTDESCSTATE_SCROLL
	jr z, .scroll

	call Options_ClearDescriptionRows
	ld hl, wOptionsMenuDescriptionAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	bccoord 1, 14
	call Options_PrintDescriptionSegment
	jr .check_stop

.scroll
	call Options_HideDescriptionCursor
	call Options_ScrollDescriptionRows
	ld hl, wOptionsMenuDescriptionAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	bccoord 1, 16
	call Options_PrintDescriptionSegment

.check_stop
	ld a, [wOptionsMenuDescriptionStopChar]
	cp '<PARA>'
	jr z, .more_para
	cp '<CONT>'
	jr z, .more_cont

	call Options_HideDescriptionCursor
	ld a, OPTDESCSTATE_DONE
	ld [wOptionsMenuDescriptionState], a
	ret

.more_para
	call Options_SaveResumeAddr
	xor a ; OPTDESCSTATE_PAGE
	ld [wOptionsMenuDescriptionState], a
	jr Options_ShowDescriptionCursor

.more_cont
	call Options_SaveResumeAddr
	ld a, OPTDESCSTATE_SCROLL
	ld [wOptionsMenuDescriptionState], a
	jr Options_ShowDescriptionCursor

Options_ShowDescriptionCursor:
	ld a, '▼'
	ldcoord_a 18, 17
	ret

Options_SaveResumeAddr:
	ld a, e
	ld [wOptionsMenuDescriptionAddr], a
	ld a, d
	ld [wOptionsMenuDescriptionAddr + 1], a
	ret

Options_ClearDescriptionRows:
	call Options_HideDescriptionCursor
	ld a, ' '
	hlcoord 1, 14
	lb bc, 0, 18
	call ByteFill
	hlcoord 1, 16
	lb bc, 0, 18
	jp ByteFill

Options_HideDescriptionCursor:
	jp UnloadTextCursor

; Use the game's standard textbox cursor blink. The Options loop is
; nonblocking, so call the shared toggle directly instead of PromptButton.
Options_AnimateDescriptionCursor:
	ld a, [wOptionsMenuDescriptionState]
	cp OPTDESCSTATE_DONE
	ret z
	cp OPTDESCSTATE_TYPING
	ret z
	jp BlinkTextCursor

Options_ScrollDescriptionRows:
	hlcoord 1, 14
	decoord 1, 16
	ld b, 18
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .loop
	hlcoord 1, 16
	ld a, ' '
	lb bc, 0, 18
	jp ByteFill

; Print directly from ROM until the next page/scroll/end marker.
; In: HL = string pointer, BC = starting coordinates.
; Out: DE = resume pointer, wOptionsMenuDescriptionStopChar = stop marker.
Options_PrintDescriptionSegment:
	ld d, h
	ld e, l
	ld h, b
	ld l, c
.loop
	ld a, [de]
	cp '@'
	jr z, .found_stop
	cp '<PARA>'
	jr z, .found_stop
	cp '<CONT>'
	jr z, .found_stop
	cp '<PROMPT>'
	jr z, .found_stop
	cp '<DONE>'
	jr z, .found_stop
	cp '<LINE>'
	jr z, .new_line
	cp '<NEXT>'
	jr z, .new_line
	ld [hli], a
	inc de
	jr .loop

.new_line
	inc de
	hlcoord 1, 16
	jr .loop

.found_stop
	ld [wOptionsMenuDescriptionStopChar], a
	inc de
	ret

Options_DisplayValue:
	push de
	call Options_GetValuePosition
	pop de
	call PlaceString
	and a
	ret

Options_DisplayNumber:
	push af
	call Options_GetValuePosition
	ld bc, 5
	add hl, bc
	pop af
	ld [hl], a
	ret

Options_GetValuePosition:
	ld a, [wOptionsMenuValueCoord]
	ld l, a
	ld a, [wOptionsMenuValueCoord + 1]
	ld h, a
	ret

; Prepare the row state used by the value-drawing routines.
Options_SetRowContext:
	ld a, [wJumptableIndex]
	ld [wOptionsMenuRowSelection], a
	ld b, a
	ld a, [wOptionsScrollPosition]
	ld c, a
	ld a, b
	sub c
	cp NUM_VISIBLE_OPTIONS
	jr c, .valid_row
	ld a, NUM_VISIBLE_OPTIONS - 1
.valid_row
	ld hl, wTilemap + 2 * SCREEN_WIDTH + 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld a, l
	ld [wOptionsMenuValueCoord], a
	ld a, h
	ld [wOptionsMenuValueCoord + 1], a
	ret
