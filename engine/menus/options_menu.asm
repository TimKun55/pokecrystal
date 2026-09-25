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
	const OPT_CANCEL        ; 8
DEF NUM_OPTIONS EQU const_value ; 9
; Leave the lower rows free for the selected option's description.
DEF NUM_VISIBLE_OPTIONS EQU 5
DEF OPTIONS_SCROLL_BOTTOM EQU 4

_Option:
	call ClearJoypad
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	call ClearTilemap
	call Options_DrawFrame
	xor a
	ld [wJumptableIndex], a
	ld a, $ff
	ld [wOptionsScrollPosition], a
	call Options_UpdateWindow
	call Options_UpdateDescription

	xor a
	ld [wJumptableIndex], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_GENERIC
	call GetSGBLayout
	call SetDefaultBGPAndOBP

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, .ExitOptions
	call OptionsControl
	jr c, .dpad
	call GetOptionPointer
	jr c, .ExitOptions

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

Options_DrawFrame:
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	jp Textbox

Options_DrawDescriptionTextbox:
	hlcoord 0, 13
	ld b, 3
	ld c, SCREEN_WIDTH - 2
	jp Textbox

StringOptions0:
	db "Text Speed<LF>"
	db "        :<LF>"
	db "Battle Scene<LF>"
	db "        :<LF>"
	db "Battle Style<LF>"
	db "        :<LF>"
	db "Sound<LF>"
	db "        :<LF>"
	db "Running Shoes<LF>"
	db "        :<LF>@"

StringOptions1:
	db "Battle Scene<LF>"
	db "        :<LF>"
	db "Battle Style<LF>"
	db "        :<LF>"
	db "Sound<LF>"
	db "        :<LF>"
	db "Running Shoes<LF>"
	db "        :<LF>"
	db "Menu Account<LF>"
	db "        :<LF>@"

StringOptions2:
	db "Battle Style<LF>"
	db "        :<LF>"
	db "Sound<LF>"
	db "        :<LF>"
	db "Running Shoes<LF>"
	db "        :<LF>"
	db "Menu Account<LF>"
	db "        :<LF>"
	db "Frame<LF>"
	db "        :Type<LF>@"

StringOptions3:
	db "Sound<LF>"
	db "        :<LF>"
	db "Running Shoes<LF>"
	db "        :<LF>"
	db "Menu Account<LF>"
	db "        :<LF>"
	db "Frame<LF>"
	db "        :Type<LF>"
	db "Font<LF>"
	db "        :Font<LF>@"

StringOptions4:
	db "Running Shoes<LF>"
	db "        :<LF>"
	db "Menu Account<LF>"
	db "        :<LF>"
	db "Frame<LF>"
	db "        :Type<LF>"
	db "Font<LF>"
	db "        :Font<LF>"
	db "Done@"

Options_PlaceStrings:
	ld a, [wOptionsScrollPosition]
	or a
	jr z, .string0
	cp 1
	jr z, .string1
	cp 2
	jr z, .string2
	cp 3
	jr z, .string3
	ld de, StringOptions4
	jr .place_string
.string0
	ld de, StringOptions0
	jr .place_string
.string1
	ld de, StringOptions1
	jr .place_string
.string2
	ld de, StringOptions2
	jr .place_string
.string3
	ld de, StringOptions3
.place_string
	call PlaceString
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
	dw Options_Done

	const_def
	const OPT_TEXT_SPEED_FAST ; 0
	const OPT_TEXT_SPEED_MED  ; 1
	const OPT_TEXT_SPEED_SLOW ; 2
	const OPT_TEXT_SPEED_NONE ; 3

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
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
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
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
	ld de, .On
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, .Off

.Display:
	call Options_DisplayValue
	and a
	ret

.On:  db "On @"
.Off: db "Off@"

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
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
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
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
	ld de, .Off
	jr .Display

.ToggleOn:
	set RUNNING, [hl]
	ld de, .On

.Display:
	call Options_DisplayValue
	and a
	ret

.Off: db "Off@"
.On:  db "On @"

Options_MenuAccount:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
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
	ld de, .Off
	jr .Display

.ToggleOn:
	set MENU_ACCOUNT, [hl]
	ld de, .On

.Display:
	call Options_DisplayValue
	and a
	ret

.Off: db "Off@"
.On:  db "On @"

Options_Frame:
	ld hl, wTextboxFrame
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

Options_Done:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp OPT_CANCEL ; maximum option index
	jr nz, .CheckMenuAccount
	ld [hl], OPT_TEXT_SPEED ; first option
	scf
	ret

.CheckMenuAccount: ; I have no idea why this exists...
	cp OPT_MENU_ACCOUNT
	jr nz, .Increase
	ld [hl], OPT_MENU_ACCOUNT

.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]

; Another thing where I'm not sure why it exists
	cp OPT_FRAME
	jr nz, .NotFrame
	ld [hl], OPT_MENU_ACCOUNT
	scf
	ret

.NotFrame:
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
	ld c, SCREEN_HEIGHT - 2
.loop
	ld [hl], ' '
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
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
	add a, 4
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
	hlcoord 2, 2
	ld a, ' '
	ld b, 11
	ld c, 16
	call FillBoxWithByte
; FillBoxWithByte advances HL, so restore the label position.
	hlcoord 2, 2
	call Options_PlaceStrings
	call Options_UpdateValues
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
	call UpdateFrame
	ld a, [wOptionsScrollPosition]
	cp 3
	jr c, .load_standard_font
	ld a, OPT_FONT
	ld [wJumptableIndex], a
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

; Redraw the two-line description for the selected option.
Options_UpdateDescription:
	call Options_DrawDescriptionTextbox
	ld a, [wJumptableIndex]
	call Options_GetDescriptionLine1
	push de
	hlcoord 2, 14
	ld a, ' '
	ld b, 3
	ld c, 16
	call FillBoxWithByte
	pop de
	hlcoord 2, 14
	call PlaceString
	call Options_GetDescriptionLine2
	hlcoord 2, 16
	call PlaceString
	ret

Options_GetDescriptionLine1:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	ret
.Pointers:
	dw OptionsDescriptionTextSpeed1
	dw OptionsDescriptionBattleScene1
	dw OptionsDescriptionBattleStyle1
	dw OptionsDescriptionSound1
	dw OptionsDescriptionRunning1
	dw OptionsDescriptionMenuAccount1
	dw OptionsDescriptionFrame1
	dw OptionsDescriptionFont1
	dw OptionsDescriptionDone1

OptionsDescriptionTextSpeed1: db "Change the speed@"
OptionsDescriptionTextSpeed2: db "of game text@"
OptionsDescriptionBattleScene1: db "Show animations@"
OptionsDescriptionBattleScene2: db "in battle@"
OptionsDescriptionBattleStyle1: db "Switch #mon@"
OptionsDescriptionBattleStyle2: db "in battle@"
OptionsDescriptionSound1: db "Play music in@"
OptionsDescriptionSound2: db "Mono or Stereo@"
OptionsDescriptionRunning1: db "Hold B to change@"
OptionsDescriptionRunning2: db "travel speed@"
OptionsDescriptionMenuAccount1: db "Show description@"
OptionsDescriptionMenuAccount2: db "for Menu options@"
OptionsDescriptionFrame1: db "Change the frame@"
OptionsDescriptionFrame2: db "for textboxes@"
OptionsDescriptionFont1: db "Change the font@"
OptionsDescriptionFont2: db "of game text@"
OptionsDescriptionDone1: db "Save changes@"
OptionsDescriptionDone2: db "and Exit@"

Options_GetDescriptionLine2:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	ret
.Pointers:
	dw OptionsDescriptionTextSpeed2
	dw OptionsDescriptionBattleScene2
	dw OptionsDescriptionBattleStyle2
	dw OptionsDescriptionSound2
	dw OptionsDescriptionRunning2
	dw OptionsDescriptionMenuAccount2
	dw OptionsDescriptionFrame2
	dw OptionsDescriptionFont2
	dw OptionsDescriptionDone2

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
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wOptionsScrollPosition]
	ld c, a
	ld a, b
	sub c
; BC already advances by two screen rows per option.
	ld hl, wTilemap + 3 * SCREEN_WIDTH + 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ret
