	const_def
	const PINK_PAGE   ; 0
	const GREEN_PAGE  ; 1
	const BLUE_PAGE   ; 2
	const ORANGE_PAGE ; 3
DEF NUM_STAT_PAGES EQU const_value

DEF STAT_PAGE_MASK EQU %00000011

; wSummaryScreenFlags bit 2: the blue page has been switched to its EVs, which A toggles.
DEF BLUE_EVS_BIT EQU 2

; The labels that sit in the panel above the bottom box.
	const_def
	const EXP_LABEL   ; 0
	const ITEM_LABEL  ; 1
	const DV_LABEL    ; 2
	const EV_LABEL    ; 3
	const MET_LABEL   ; 4
DEF NUM_PAGE_LABELS EQU const_value

; Caught ball icon
DEF CAUGHT_BALL_X        EQU 17
DEF CAUGHT_BALL_Y        EQU 7
DEF CAUGHT_BALL_TILE     EQU $78 ; the 8x8 ball, drawn with BG palette 4
DEF CAUGHT_BALL_RIM_L    EQU $74 ; sheet order: left, right, bottom, top
DEF CAUGHT_BALL_RIM_R    EQU $75
DEF CAUGHT_BALL_RIM_B    EQU $76
DEF CAUGHT_BALL_RIM_T    EQU $77

CaughtBallTiles:
; Ball item id -> tile index in SummaryScreenBallGFX, terminated by -1.
	db POKE_BALL,     0
	db GREAT_BALL,    1
	db ULTRA_BALL,    2
	db MASTER_BALL,   3
	db LEVEL_BALL,    4
	db LURE_BALL,     5
	db MOON_BALL,     6
	db FRIEND_BALL,   7
	db FAST_BALL,     8
	db HEAVY_BALL,    9
	db LOVE_BALL,    10
	db NET_BALL,     11
	db DUSK_BALL,    12
	db PREMIER_BALL, 13
	db PARK_BALL,    14
	db -1

; Page 1's window frame.
DEF SUM_RBOX_TL  EQU $38 ; right box, top-left corner
DEF SUM_RBOX_T   EQU $3b ; right box, top edge
DEF SUM_RBOX_L   EQU $39 ; right box, left edge
DEF SUM_RBOX_BL  EQU $3a ; right box, bottom-left corner
DEF SUM_RBOX_B   EQU $3c ; right box, bottom edge
DEF SUM_BBOX_T   EQU $3d ; bottom box, top edge
DEF SUM_EXP_TC   EQU $47 ; page label panel, top corner
DEF SUM_EXP_SB   EQU $48 ; page label panel, side and bottom
DEF SUM_PKR      EQU $36 ; pokerus, infected
DEF SUM_PKR_CURED EQU $37 ; pokerus, cured

; The page label itself
DEF PAGE_LABEL_TILE  EQU $79 ; 6 tiles at $79-$7e, written by .PlacePageLabel
DEF ITEM_ICON_TILE  EQU $52 ; 9 tiles at $52-$5a, written by the green page
DEF INFO_TILE_X     EQU 15
DEF INFO_TILE_Y     EQU 2
DEF INFO_TILE_FIRST EQU $6c ; 4 tiles at $6c-$6f, written by the green page
DEF DV_STAR_TILE    EQU $4a ; sheet tile 25, already resident from the $31-$50 load

; The Hidden Power line on page 4 is drawn in the Unown font,
; but only loads the necessary tiles in.
DEF HIDDEN_POWER_LABEL_TILE EQU $52
DEF HIDDEN_POWER_TYPE_TILE  EQU $54

; The last tile this feature may write. $5c is where page 1's type icon lives.
DEF HIDDEN_POWER_LAST_TILE EQU $5b

; The middle column of the right box, which spans columns 7 to 19.
DEF HIDDEN_POWER_CENTER_X   EQU 13

BattleSummaryScreenInit:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, SummaryScreenInit

	ld a, [wBattleMode]
	and a
	jr z, SummaryScreenInit
	jr _MobileSummaryScreenInit

SummaryScreenInit:
	ld hl, SummaryScreenMain
	jr SummaryScreenInit_gotaddress

_MobileSummaryScreenInit:
	ld hl, SummaryScreenMobile
	jr SummaryScreenInit_gotaddress

SummaryScreenInit_gotaddress:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations
	ld a, [wBoxAlignment] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wSummaryScreenFlags]
	ld c, a

	push bc
	push hl
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	farcall SummaryScreen_LoadFont
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTilemap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wSummaryScreenFlags], a
	pop af
	ld [wBoxAlignment], a
	pop af
	ldh [hMapAnims], a
	ret

SummaryScreenMain:
	xor a
	ld [wJumptableIndex], a
	ld [wSummaryScreenFlags], a ; PINK_PAGE
.loop
	ld a, [wJumptableIndex]
	and ~(1 << 7)
	ld hl, SummaryScreenPointerTable
	rst JumpTable
	call SummaryScreen_WaitAnim
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	ret

SummaryScreenMobile:
	xor a
	ld [wJumptableIndex], a
	ld [wSummaryScreenFlags], a ; PINK_PAGE
.loop
	farcall Mobile_SetOverworldDelay
	ld a, [wJumptableIndex]
	and $7f
	ld hl, SummaryScreenPointerTable
	rst JumpTable
	call SummaryScreen_WaitAnim
	farcall MobileComms_CheckInactivityTimer
	jr c, .exit
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop

.exit
	ret

SummaryScreenPointerTable:
	dw MonSummaryInit       ; regular pokémon
	dw EggSummaryInit       ; egg
	dw SummaryScreenWaitCry
	dw EggSummaryJoypad
	dw SummaryScreen_LoadPage
	dw SummaryScreenWaitCry
	dw MonSummaryJoypad
	dw SummaryScreen_Exit

SummaryScreen_WaitAnim:
	ld hl, wSummaryScreenFlags
	bit 6, [hl]
	jr nz, .try_anim
	bit 5, [hl]
	jr nz, .finish
	call DelayFrame
	ret

.try_anim
	farcall SetUpPokeAnim
	jr nc, .finish
	ld hl, wSummaryScreenFlags
	res 6, [hl]
.finish
	ld hl, wSummaryScreenFlags
	res 5, [hl]
	farcall HDMATransferTilemapToWRAMBank3
	ret

SummaryScreen_SetJumptableIndex:
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

SummaryScreen_Exit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

MonSummaryInit:
	ld hl, wSummaryScreenFlags
	res 6, [hl]
	call ClearBGPalettes
	call ClearTilemap
	farcall HDMATransferTilemapToWRAMBank3
	call SummaryScreen_CopyToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call SummaryScreen_InitUpperHalf
	ld hl, wSummaryScreenFlags
	set 4, [hl]
	ld h, 4
	call SummaryScreen_SetJumptableIndex
	ret

.egg
	ld h, 1
	call SummaryScreen_SetJumptableIndex
	ret

EggSummaryInit:
	call EggSummaryScreen
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

EggSummaryJoypad:
	call SummaryScreen_GetJoypad
	bit A_BUTTON_F, a
	jr nz, .quit
if DEF(_DEBUG)
	cp START
	jr z, .hatch
endc
	and D_DOWN | D_UP | A_BUTTON | B_BUTTON
	jp SummaryScreen_JoypadAction

.quit
	ld h, 7
	call SummaryScreen_SetJumptableIndex
	ret

if DEF(_DEBUG)
.hatch
	ld a, [wMonType]
	or a
	jr nz, .skip
	push bc
	push de
	push hl
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Happiness
	call AddNTimes
	ld [hl], 1
	ld a, 1
	ld [wTempMonHappiness], a
	ld a, 127
	ld [wStepCount], a
	ld de, .HatchSoonString
	hlcoord 8, 17
	call PlaceString
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	pop hl
	pop de
	pop bc
.skip
	xor a
	jp SummaryScreen_JoypadAction

.HatchSoonString:
	db "▶Hatch Soon!@"
endc

SummaryScreen_LoadPage:
	call SummaryScreen_LoadGFX
	ld hl, wSummaryScreenFlags
	res 4, [hl]
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

MonSummaryJoypad:
	call SummaryScreen_GetJoypad
	jr nc, .next
	ld h, 0
	call SummaryScreen_SetJumptableIndex
	ret

.next
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
	jp SummaryScreen_JoypadAction

SummaryScreenWaitCry:
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

SummaryScreen_CopyToTempMon:
	ld a, [wMonType]
	cp BUFFERMON
	jr nz, .not_tempmon
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBufferMon
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .done

.not_tempmon
	farcall CopyMonToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .done
	ld a, [wMonType]
	cp BOXMON
	jr c, .done
	farcall CalcTempmonStats
.done
	and a
	ret

SummaryScreen_GetJoypad:
	call GetJoypad
	ldh a, [hJoyPressed]
	and a
	ret

SummaryScreen_JoypadAction:
	push af
	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	pop af
	bit B_BUTTON_F, a
	jp nz, .b_button
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	jr .done

.d_down
	ld a, [wMonType]
	cp BUFFERMON
	jr z, .next_storage
	cp BOXMON
	jr nc, .done
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, .done
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.d_up
	ld a, [wMonType]
	cp BUFFERMON
	jr z, .prev_storage
	ld a, [wCurPartyMon]
	and a
	jr z, .done
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.a_button
	jp .press_a

.d_right
	inc c
	ld a, ORANGE_PAGE ; last page
	cp c
	jr nc, .set_page
	ld c, PINK_PAGE ; first page
	jr .set_page

.d_left
	ld a, c
	dec c
	and a ; cp PINK_PAGE ; first page
	jr nz, .set_page
	ld c, ORANGE_PAGE ; last page
	jr .set_page

.prev_storage
	newfarcall PrevStorageBoxMon
	jr nz, .load_storage_mon
.done
	ret

.set_page
	ld hl, wSummaryScreenFlags
	res BLUE_EVS_BIT, [hl]
	ld a, [hl]
	and ~STAT_PAGE_MASK
	or c
	ld [wSummaryScreenFlags], a
	ld h, 4
	call SummaryScreen_SetJumptableIndex
	ret

.next_storage
	newfarcall NextStorageBoxMon
	jr z, .done
.load_storage_mon
	ld a, [wBufferMonAltSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
.load_mon
	ld hl, wSummaryScreenFlags
	res BLUE_EVS_BIT, [hl]
	ld h, 0
	call SummaryScreen_SetJumptableIndex
	ret

.b_button
	ld h, 7
	call SummaryScreen_SetJumptableIndex
	ret

.press_a:
; On the green page it opens the move screen.
; On the blue page it flips the bottom box between the DVs and the EVs.
	ld a, c
	cp BLUE_PAGE
	jr z, .blue_evs
	jr .move_screen

.blue_evs:
	ld hl, wSummaryScreenFlags
	bit BLUE_EVS_BIT, [hl]
	jr nz, .blue_back_to_dvs
	set BLUE_EVS_BIT, [hl]
	jr .blue_reload
.blue_back_to_dvs:
	res BLUE_EVS_BIT, [hl]
.blue_reload:
	ld h, 4
	call SummaryScreen_SetJumptableIndex
	ret

.move_screen:
	ld a, [wMonType]
	and a
	jr nz, .done
	ld a, c
	cp GREEN_PAGE
	jr nz, .done
	farcall ManagePokemonMoves
	jr .load_mon

SummaryScreen_InitUpperHalf:
	call .PlaceHPBar
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a

	ld a, [wTempMonPokerusStatus]
	ld a, [wMonType]
	cp BOXMON
	jr z, .done_status

	ld de, wTempMonStatus
	predef GetStatusConditionIndex
	ld a, d
	and a
	jr z, .done_status

	; status index in a
	ld hl, SummaryStatusIconGFX
	ld bc, 2 * TILE_SIZE
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $50
	lb bc, BANK(SummaryStatusIconGFX), 2
	call Request2bpp

	hlcoord 12, 0
	ld a, $50 ; status tile first half
	ld [hli], a
	inc a ; status tile 2nd half
	ld [hl], a
	
.done_status
	call SummaryScreen_PlacePageSwitchArrows
	ret

.PlaceHPBar:
	ld hl, wTempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	farcall ComputeHPBarPixels
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_SUMMARY_SCREEN_HP_PALS
	call GetSGBLayout
	call DelayFrame
	ret

.PlaceLevelAndGender:
	hlcoord 2, 8
	lb bc, 3, 3 ; the item icon
	call ClearBox

	ld a, [wMonType]
	cp PARTYMON
	jr z, .print
	cp BUFFERMON
	jr nz, .done
.print
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .done
	hlcoord 1, 9
	call PrintLevel
	hlcoord 5, 9
	push hl
	farcall GetGender
	pop hl
	ret c
	ld a, $32
	jr nz, .got_gender
	ld a, $33
.got_gender:
	ld [hl], a
.done
	ret

.GetBallTile:
	ld hl, CaughtBallTiles
.tile_loop
	ld a, [hli]
	cp $ff
	jr z, .tile_done
	cp b
	jr z, .tile_found
	inc hl
	jr .tile_loop
.tile_done
	ld c, 0 ; unknown ball
	ret
.tile_found
	ld c, [hl]
	ret

SummaryScreen_PlacePageSwitchArrows:
	hlcoord 14, 0
	ld [hl], $40 ; left arrow
	inc hl
	ld [hl], $43 ; "page"
	inc hl
	ld [hl], $44 ; "page"
	inc hl
	ld [hl], $45 ; "page"
	inc hl
	ld [hl], $46 ; "page"
	inc hl
	ld [hl], $41 ; right arrow
	ret

EggSummaryScreen_PlacePageBorder:
	hlcoord 0, 9 ; top of orange box
	ld a, SUM_BBOX_T
	ld b, SCREEN_WIDTH
.lower_top
	ld [hli], a
	dec b
	jr nz, .lower_top

	hlcoord 8, 0 ; top left corner and top of blue box
	ld a, SUM_RBOX_TL
	ld [hli], a
	ld a, SUM_RBOX_T
	ld b, SCREEN_WIDTH - 9
.upper_top
	ld [hli], a
	dec b
	jr nz, .upper_top

	hlcoord 8, 1 ; left side of blue box
	ld a, SUM_RBOX_L
	ld de, SCREEN_WIDTH
	ld b, 7
.upper_left
	ld [hl], a
	add hl, de
	dec b
	jr nz, .upper_left

	hlcoord 8, 8 ; bottom left corner and bottom of blue box
	ld a, SUM_RBOX_BL
	ld [hli], a
	ld a, SUM_RBOX_B
	ld b, SCREEN_WIDTH - 9
.upper_bottom
	ld [hli], a
	dec b
	jr nz, .upper_bottom
	ret

SummaryScreen_PlaceShinyIcon:
	ld bc, wTempMonDVs
	farcall CheckShininess
	ret nc
	hlcoord 6, 8
	ld [hl], '⁂'
	ret

SummaryScreen_PlacePokerusIcon:
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .has_pokerus
	ld a, b
	and $f0
	ret z
	ld a, SUM_PKR_CURED
	jr .place
.has_pokerus:
	ld a, SUM_PKR
.place:
	hlcoord 0, 9
	ld [hl], a
	ret

SummaryScreen_LoadGFX:
	ld a, [wBaseDexNo]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	xor a
	ldh [hBGMapMode], a
	call .ClearBox

	call SummaryScreen_InitUpperHalf.PlaceLevelAndGender
	call SummaryScreen_PlaceShinyIcon
	call SummaryScreen_PlacePokerusIcon
	call .PageTilemap

	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	call SummaryScreen_LoadPageIndicators
	call .LoadPals
	ld hl, wSummaryScreenFlags
	bit 4, [hl]
	jr nz, .place_frontpic
	call SetDefaultBGPAndOBP
	jr .push_map

.place_frontpic
	call SummaryScreen_PlaceFrontpic
.push_map
	call CopyTilemapAtOnce
	ld a, [wBaseDexNo]
	ld [wCurSpecies], a
	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	farcall LoadSummaryScreenPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	call DelayFrame ; the vblank that puts the colour on screen
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	ret

.ClearBox:
	hlcoord 8, 2
	lb bc, 8, 12
	call ClearBox

	hlcoord 0, 10
	lb bc, 8, 20
	call ClearBox
	ret

.LoadPals:
	call .PlaceItemIconAttrmap
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PlaceItemIconAttrmap:
	ld a, $1 ; the mon palette: the level's own ground
	cp c
	jr nz, .have_pal
	ld a, [wTempMonItem]
	and a
	jr nz, .have_item
	ld a, $1 ; green page, but nothing held: the level stays, so mon palette
	jr .have_pal
.have_item
	ld a, $5 ; the ball/item palette
.have_pal
	hlcoord 2, 8, wAttrmap
	lb bc, 3, 3
	newfarcall FillBoxCGB
	ret

.PageTilemap:
	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
; entries correspond to *_PAGE constants
	table_width 2
	dw LoadPinkPage
	dw LoadGreenPage
	dw LoadBluePage
	dw LoadOrangePage
	assert_table_length NUM_STAT_PAGES

PlaceSummaryBoxes:
	push af
	hlcoord 7, 1 ; top left corner of top box
	ld a, SUM_RBOX_TL
	ld [hli], a
	ld a, SUM_RBOX_T
	ld bc, 12
	call ByteFill
	hlcoord 7, 2 ; left side of top box
	ld a, SUM_RBOX_L
	lb bc, 9, 1
	call FillBoxWithByte
	hlcoord 7, 11 ; bottom left corner of top box
	ld a, SUM_RBOX_BL
	ld [hli], a
	ld a, SUM_RBOX_B
	ld bc, 12
	call ByteFill

	hlcoord 8, 2 ; clear top box info
	lb bc, 9, 12
	call ClearBox

	hlcoord 0, 12 ; top edge of bottom box
	ld a, SUM_BBOX_T
	ld bc, SCREEN_WIDTH
	call ByteFill

	hlcoord 1, 11 ; top right, page label
	ld a, SUM_EXP_TC
	ld [hl], a
	hlcoord 5, 11 ; top left, page label
	ld a, SUM_EXP_TC
	ld [hl], a
	hlcoord 1, 12 ; bottom right, page label
	ld a, SUM_EXP_SB
	ld [hl], a
	hlcoord 5, 12 ; bottom left, page label
	ld a, SUM_EXP_SB
	ld [hl], a
	pop af
	ld c, a
; fallthrough
.PlacePageLabel:
	ld hl, .PageLabelOffsets
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, SummaryScreenPageLabelGFX
	add hl, de
	ld d, h
	ld e, l
	ld hl, vTiles2 tile PAGE_LABEL_TILE
	lb bc, BANK(SummaryScreenPageLabelGFX), 6
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	call Request2bpp
	pop af
	ldh [rVBK], a
	hlcoord 2, 11 ; the label's top row
	ld a, PAGE_LABEL_TILE
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 2, 12 ; the label's bottom row
	ld a, PAGE_LABEL_TILE + 3
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

; The table_width and assert_table_length are needed.
; assert_table_length measures back to the last table_width, and without
; one here it would count from some unrelated table further up the file.
	table_width 2
.PageLabelOffsets:
	dw 0    ; EXP_LABEL
	dw 96   ; ITEM_LABEL
	dw 192  ; DV_LABEL
	dw 288  ; EV_LABEL
	dw 384  ; MET_LABEL
	assert_table_length NUM_PAGE_LABELS

LoadPinkPage:
	ld a, EXP_LABEL
	call PlaceSummaryBoxes
	hlcoord 0, 0
	lb bc, 1, 11
	call ClearBox

; dex number
	hlcoord 8, 2
	ld [hl], '№'
	inc hl
	ld [hl], '.'
	inc hl
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndex], a
	hlcoord 10, 2
	call GetPokemonNumber
	call PlaceString

; nickname
	ld hl, .NicknamePointers
	call GetNicknamePointer
	call CopyNickname
	hlcoord 8, 4
	call PlaceString

; species name
	hlcoord 9, 5
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndex], a ; same shared slot as the dex number above; see there
	call GetPokemonName
	call PlaceString

; type icons, on the same row as the caught ball
	call PrintMonTypeTiles

; caught ball and its rim, hard right on the type row
	hlcoord CAUGHT_BALL_X, CAUGHT_BALL_Y
	call .PlaceCaughtBallIcon

; OT and trainer id
	call PlaceOTInfo

; experience information
	ld de, .ExpPointStr
	hlcoord 1, 13
	call PlaceString

	hlcoord 12, 13
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum

	call .CalcExpToNextLevel
	hlcoord 12, 15
	lb bc, 3, 7
	ld de, wExpToNextLevel
	call PrintNum

	ld de, .ToNextLvStr
	hlcoord 1, 15
	call PlaceString

	hlcoord 3, 17
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 1, 17
	ld [hl], $70 ; left exp bar label
	hlcoord 2, 17
	ld [hl], $71 ; right exp bar label
	hlcoord 10, 17
	ld [hl], $6b ; exp bar end cap

	ld de, .ToStr
	hlcoord 13, 17
	call PlaceString
	call .PrintNextLevel
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname

.PlaceCaughtBallIcon:
	push hl
	ld hl, wTempMonCaughtBall
	call GetCaughtBall ; falls back to CAUGHT_BALL_DEFAULT
	ld b, a
	push bc ; AddNTimes and Request2bpp both use bc
	call SummaryScreen_InitUpperHalf.GetBallTile
	ld a, c
	ld hl, SummaryScreenBallGFX
	ld bc, TILE_SIZE
	call AddNTimes
	ld d, h
	ld e, l

	ld hl, vTiles2 tile CAUGHT_BALL_TILE
	lb bc, BANK(SummaryScreenBallGFX), 1
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	call Request2bpp
	pop af
	ldh [rVBK], a
	pop bc
	pop hl
	ld a, CAUGHT_BALL_TILE
	ld [hl], a

	ld de, SummaryScreenBallRimGFX
	ld hl, vTiles2 tile CAUGHT_BALL_RIM_L
	lb bc, BANK(SummaryScreenBallRimGFX), 4
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	call Request2bpp
	pop af
	ldh [rVBK], a

	hlcoord CAUGHT_BALL_X, CAUGHT_BALL_Y - 1
	ld a, CAUGHT_BALL_RIM_T
	ld [hl], a
	hlcoord CAUGHT_BALL_X - 1, CAUGHT_BALL_Y
	ld a, CAUGHT_BALL_RIM_L
	ld [hl], a
	hlcoord CAUGHT_BALL_X + 1, CAUGHT_BALL_Y
	ld a, CAUGHT_BALL_RIM_R
	ld [hl], a
	hlcoord CAUGHT_BALL_X, CAUGHT_BALL_Y + 1
	ld a, CAUGHT_BALL_RIM_B
	ld [hl], a
	ret

.PrintNextLevel:
	hlcoord 16, 17
	ld a, [wTempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .AtMaxLevel
	inc a
	ld [wTempMonLevel], a
.AtMaxLevel:
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wExpToNextLevel + 2], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wExpToNextLevel + 1], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wExpToNextLevel], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wExpToNextLevel
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.ExpPointStr:
	db "Exp Points@"

.ToNextLvStr:
	db "To Next Lv@"

.ToStr:
	db "to@"

PlaceOTInfo:
	ld de, IDNoString
	hlcoord 8, 10
	call PlaceString

	hlcoord 12, 10
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum
	ld hl, .OTNamePointers
	call GetNicknamePointer
	call CopyNickname
	farcall CorrectNickErrors

	ld de, OTString
	hlcoord 8, 9
	call PlaceString

	ld de, wStringBuffer1
	hlcoord 11, 9
	call PlaceString
	ld a, [wTempMonCaughtGender]
	and a
	jr z, .done
	cp $7f
	jr z, .done
	and CAUGHT_GENDER_MASK
	ld a, $32 ; '♂'
	jr z, .got_gender
	ld a, $33 ; '♀'
.got_gender
	hlcoord 19, 9
	ld [hl], a
.done
	ret

.OTNamePointers:
	dw wPartyMonOTs
	dw wOTPartyMonOTs
	dw wBufferMonOT ; unused
	dw wBufferMonOT ; unused
	dw wBufferMonOT ; unused
	dw wBufferMonOT

IDNoString:
	db "<ID>№.@"

OTString:
	db "OT:@"

LoadGreenPage:
	ld a, ITEM_LABEL
	call PlaceSummaryBoxes
	ld a, [wMonType]
	and a ; PARTYMON
	call z, .PlaceInfoPrompt
	call .PlaceItemIcon
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 8, 3
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMoves
	hlcoord 12, 4
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMovePP

	call .GetItemName
	hlcoord 1, 13
	call PlaceString
	call .PrintItemDescription
	ret

.PlaceInfoPrompt:
	ld hl, vTiles2 tile INFO_TILE_FIRST
	ld de, SummaryInfoTilesGFX
	lb bc, BANK(SummaryInfoTilesGFX), 4
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	call Request2bpp
	pop af
	ldh [rVBK], a

	hlcoord INFO_TILE_X, INFO_TILE_Y
	ld a, INFO_TILE_FIRST
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	ret

.PlaceItemIcon:
	ld a, [wTempMonItem]
	and a
	ret z
	ld c, a
	ld de, vTiles2 tile ITEM_ICON_TILE
	ld a, 1
	ld [wItemIconPatchCorners], a
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	farcall DecompressItemIcon
	pop af
	ldh [rVBK], a
	hlcoord 2, 8
	ld de, SCREEN_WIDTH - 3
	lb bc, 3, 3
	ld a, ITEM_ICON_TILE
.icon_row
	ld [hli], a
	inc a
	dec c
	jr nz, .icon_row
	ld c, 3
	add hl, de
	dec b
	jr nz, .icon_row
	ld a, ' '
	hlcoord 1, 9
	ld [hl], a
	hlcoord 5, 9
	ld [hl], a
	ret

.PrintItemDescription:
	ld a, [wTempMonItem]
	and a
	ret z
	ld [wCurSpecies], a
	decoord 1, 15
	farcall PrintItemDescription
	ret

.GetItemName:
	ld de, .NoHeldItem
	ld a, [wTempMonItem]
	and a
	ret z
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
	ret

.NoHeldItem:
	db "No Held Item@"

LoadBluePage:
	ld hl, wSummaryScreenFlags
	bit BLUE_EVS_BIT, [hl]
	jr nz, .evs_label
	ld a, DV_LABEL
	jr .have_label
.evs_label
	ld a, EV_LABEL
.have_label
	call PlaceSummaryBoxes
	hlcoord 8, 3
	ld de, .HPString
	call PlaceString

	hlcoord 11, 4
	ld b, $0
	call SummaryScreenDrawPlayerHP
	hlcoord 19, 4
	ld [hl], $6b ; right HP/exp bar end cap

	hlcoord 8, 5
	ld de, .AttackString
	call PlaceString
	hlcoord 8, 6
	ld de, .DefenseString
	call PlaceString
	hlcoord 8, 7
	ld de, .SpAttackString
	call PlaceString
	hlcoord 8, 8
	ld de, .SpDefenseString
	call PlaceString
	hlcoord 8, 9
	ld de, .SpeedString
	call PlaceString

	hlcoord 17, 5
	ld de, wTempMonAttack
	call .PrintTempMonStats
	hlcoord 17, 6
	ld de, wTempMonDefense
	call .PrintTempMonStats
	hlcoord 17, 7
	ld de, wTempMonSpclAtk
	call .PrintTempMonStats
	hlcoord 17, 8
	ld de, wTempMonSpclDef
	call .PrintTempMonStats
	hlcoord 17, 9
	ld de, wTempMonSpeed
	call .PrintTempMonStats

; The box shows the DVs or the EVs, never both.
	hlcoord 0, 13
	lb bc, 5, SCREEN_WIDTH
	call ClearBox
	ld hl, wSummaryScreenFlags
	bit BLUE_EVS_BIT, [hl]
	jr nz, .print_evs
	call SummaryScreen_PrintDVs
	ret

.print_evs
	call SummaryScreen_PrintEVs
	ret

.HPString:
	db "HP@"

.AttackString:
	db "Attack@"

.DefenseString:
	db "Defense@"

.SpAttackString:
	db "Spcl.Atk@"

.SpDefenseString:
	db "Spcl.Def@"

.SpeedString:
	db "Speed@"

.PrintTempMonStats:
	lb bc, 2, 3
	call PrintNum
	ret

SummaryScreenDrawPlayerHP:
	ld a, $1
	ld [wWhichHPBar], a
	push hl
	push bc
; box mons have full HP
	ld a, [wMonType]
	cp BOXMON
	jr z, .at_least_1_hp

	ld a, [wTempMonHP]
	ld b, a
	ld a, [wTempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .at_least_1_hp

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .fainted

.at_least_1_hp
	ld a, [wTempMonMaxHP]
	ld d, a
	ld a, [wTempMonMaxHP + 1]
	ld e, a
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon

	ld b, d
	ld c, e

.not_boxmon
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.fainted
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	bccoord 2, -1, 0
	add hl, bc
	ld de, wTempMonHP
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon_2
	ld de, wTempMonMaxHP
.not_boxmon_2
	lb bc, 2, 3
	call PrintNum

	ld a, '/'
	ld [hli], a

; Print max HP
	ld de, wTempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret

SummaryScreen_PrintEVs:
	hlcoord 2, 14
	ld de, .EVHPstring
	call PlaceString
	hlcoord 6, 14
	lb bc, 1, 3
	ld de, wTempMonHPEV
	call PrintNum
	hlcoord 9, 14
	call .MaybeEVStar

	hlcoord 2, 15
	ld de, .EVAtkstring
	call PlaceString
	hlcoord 6, 15
	lb bc, 1, 3
	ld de, wTempMonAtkEV
	call PrintNum
	hlcoord 9, 15
	call .MaybeEVStar

	hlcoord 11, 15
	ld de, .EVDefstring
	call PlaceString
	hlcoord 15, 15
	lb bc, 1, 3
	ld de, wTempMonDefEV
	call PrintNum
	hlcoord 18, 15
	call .MaybeEVStar

	hlcoord 2, 16
	ld de, .EVSpAstring
	call PlaceString
	hlcoord 6, 16
	lb bc, 1, 3
	ld de, wTempMonSpclAtkEV
	call PrintNum
	hlcoord 9, 16
	call .MaybeEVStar

	hlcoord 11, 16
	ld de, .EVSpDstring
	call PlaceString
	hlcoord 15, 16
	lb bc, 1, 3
	ld de, wTempMonSpclDefEV
	call PrintNum
	hlcoord 18, 16
	call .MaybeEVStar

	hlcoord 11, 14
	ld de, .EVSpestring
	call PlaceString
	hlcoord 15, 14
	lb bc, 1, 3
	ld de, wTempMonSpdEV
	call PrintNum
	hlcoord 18, 14
	call .MaybeEVStar
	ret
.MaybeEVStar
	ld a, [de]
	cp MAX_EV
	ret nz
	ld a, DV_STAR_TILE
	ld [hl], a
	ret

.EVHPstring:
	db "HP :@"
.EVAtkstring:
	db "Atk:@"
.EVDefstring:
	db "Def:@"
.EVSpAstring:
	db "SpA:@"
.EVSpDstring:
	db "SpD:@"
.EVSpestring:
	db "Spe:@"	

SummaryScreen_PrintDVs:
	hlcoord 2, 14
	ld de, .DVHPstring
	call PlaceString
	
	hlcoord 2, 15
	ld de, .DVAtkstring
	call PlaceString
	
	hlcoord 11, 15
	ld de, .DVDefstring
	call PlaceString
	
	hlcoord 2, 16
	ld de, .DVSpcstring
	call PlaceString
	
	hlcoord 11, 14
	ld de, .DVSpestring
	call PlaceString

	; we're using wPokedexStatus because why not, nobody using it atm lol
	; ATK DV
	ld a, [wTempMonDVs] ; only get the first byte of the word
	and %11110000 ; most significant nybble of first byte in word-sized wTempMonDVs
	swap a ; so we can print it properly
	ld [wPokedexStatus], a
	ld c, 0
	; calc HP stat contribution
	and 1 ; a still has the ATK DV
	jr z, .atk_not_odd
	ld a, 0
	add 8
	ld b, 0
	ld c, a
	;
.atk_not_odd
	push bc
	ld de, wPokedexStatus
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2 ; bytes, digits
	hlcoord 6, 15
	call PrintNum
	hlcoord 8, 15
	call .MaybeDVStar

	; DEF DV
	ld a, [wTempMonDVs] ; only get the first byte of the word
	and %00001111 ; least significant nybble, don't need to swap the bits of the byte
	ld [wPokedexStatus], a ;DEF
	; calc HP stat contribution
	pop bc
	and 1 ; a still has the DEF DV
	jr z, .def_not_odd
	ld a, c
	add 4
	ld b, 0
	ld c, a
	;
.def_not_odd
	push bc
	ld de, wPokedexStatus
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2 ; bytes, digits
	hlcoord 15, 15
	call PrintNum
	hlcoord 17, 15
	call .MaybeDVStar

	; SPE DV
	ld a, [wTempMonDVs + 1] ; second byte of word
	and %11110000 ; most significant nybble of 2nd byte in word-sized wTempMonDVs
	swap a ; so we can print it properly
	ld [wPokedexStatus], a ;SPEED
	; calc HP stat contribution
	pop bc
	and 1 ; a still has the SPEED DV
	jr z, .speed_not_odd
	ld a, c
	add 2
	ld b, 0
	ld c, a
	;
.speed_not_odd
	push bc
	ld de, wPokedexStatus
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2 ; bytes, digits
	hlcoord 15, 14 ; 1, 5, 9, 13
	call PrintNum
	hlcoord 17, 14
	call .MaybeDVStar

	; SPC DV
	ld a, [wTempMonDVs + 1] ; second byte of word
	and %00001111 ; least significant nybble, don't need to swap the bits of the byte
	ld [wPokedexStatus], a ;SPC
	; calc HP stat contribution
	pop bc
	and 1 ; a still has the DEF DV
	jr z, .spc_not_odd
	ld a, c
	add 1
	ld b, 0
	ld c, a
	;
.spc_not_odd
	push bc
	ld de, wPokedexStatus
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2 ; bytes, digits
	hlcoord 6, 16
	call PrintNum
	hlcoord 8, 16
	call .MaybeDVStar
	; hlcoord 18, 15 ; 1, 4, 7, 10, 13 
	; call PrintNum

	; HP
	; HP DV is determined by the last bit of each of these four DVs
	; odd Attack DV adds 8, Defense adds 4, Speed adds 2, and Special adds 1
	;For example, a Lugia with the DVs 5 Atk, 15 Def, 13 Spe, and 13 Spc will have:
	; 5 Attack = Odd, HP += 8
	; 15 Defense = Odd, HP += 4
	; 13 Speed = Odd, HP += 2
	; 13 Special = Odd, HP += 1
	;resulting in an HP stat of 15
	; THANKS SMOGON
	; going to "and 1" each final value and push a counter to stack to preserve it
	pop bc
	ld a, c
	ld [wPokedexStatus], a
	ld de, wPokedexStatus
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2 ; bytes, digits
	hlcoord 6, 14 ; 1, 4, 7, 10, 13 
	call PrintNum
	hlcoord 8, 14
	call .MaybeDVStar
	ret
.MaybeDVStar
	ld a, [wPokedexStatus]
	cp 15
	ret nz
	ld a, DV_STAR_TILE
	ld [hl], a
	ret

.DVHPstring:
	db "HP :@"
.DVAtkstring:
	db "Atk:@"
.DVDefstring:
	db "Def:@"
.DVSpcstring:
	db "Spc:@"
.DVSpestring:
	db "Spe:@"

LoadOrangePage:
	ld a, MET_LABEL
	call PlaceSummaryBoxes
	call SummaryScreen_PrintHappiness

; Hide Hidden Power information until TM10 is received.
	ld de, EVENT_GOT_TM10_HIDDEN_POWER
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .no_hidden_power
	call SummaryScreen_PrintHiddenPower

.no_hidden_power
	call SummaryScreen_placeCaughtVerb
	call SummaryScreen_placeCaughtTime
	call SummaryScreen_placeCaughtLocation
	call SummaryScreen_placeCaughtLevel
	ret

SummaryScreen_PrintHappiness:
	hlcoord 9, 5
	ld [hl], $35 ; heart icon
	
	hlcoord 11, 5
	lb bc, 1, 3
	ld de, wTempMonHappiness
	call PrintNum
	ld de, .HappinessString
	hlcoord 9, 3
	call PlaceString
	ld de, .outofMaxLoveString
	hlcoord 14, 5
	call PlaceString
	ret

.HappinessString:
	db "Happiness@"

.outofMaxLoveString:
	db "/255@"

SummaryScreen_PrintHiddenPower:
	ld de, wTempMonDVs
	farcall GetHiddenPowerType
	ld a, b
	ld [wNamedObjectIndex], a
	farcall GetTypeName

	ld de, .HiddenPowerDashesString
	hlcoord 11, 8 ; the rule, centred on HIDDEN_POWER_CENTER_X
	call PlaceString

	ld de, .HiddenPowerString
	ld c, HIDDEN_POWER_LABEL_TILE
	call .CopyGlyphs
	hlcoord HIDDEN_POWER_CENTER_X, 8
	ld de, .HiddenPowerString
	ld c, HIDDEN_POWER_LABEL_TILE
	call .PlaceGlyphs

	ld de, wStringBuffer1
	ld c, HIDDEN_POWER_TYPE_TILE
	call .CopyGlyphs

; Centre the type name under the HiddenPowerString.
	ld a, c
	sub HIDDEN_POWER_TYPE_TILE
	dec a
	srl a
	ld b, a
	ld a, HIDDEN_POWER_CENTER_X
	sub b
	ld c, a
	ld b, 0
	ld hl, wTilemap + 9 * SCREEN_WIDTH
	add hl, bc

	ld de, wStringBuffer1
	ld c, HIDDEN_POWER_TYPE_TILE
	call .PlaceGlyphs
	ret

.HiddenPowerDashesString:
	db "-    -@"

.HiddenPowerString:
	db "HP@"

.CopyGlyphs:
.copy_loop
	ld a, c
	cp HIDDEN_POWER_LAST_TILE + 1
	jr nc, .copy_done
	ld a, [de]
	cp '@'
	ret z
	inc de
	call SummaryScreen_CopyUnownGlyph
	inc c
	jr .copy_loop
.copy_done:
	ret

.PlaceGlyphs:
.place_loop
	ld a, c
	cp HIDDEN_POWER_LAST_TILE + 1
	jr nc, .place_done
	ld a, [de]
	cp '@'
	ret z
	inc de
	ld a, c
	ld [hli], a
	inc c
	jr .place_loop
.place_done:
	ret

SummaryScreen_CopyUnownGlyph:
	push de
	push bc
	and $1f
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, UnownFont
	add hl, de
	push hl
	ld a, c
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, vTiles2
	add hl, de
	pop de
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	ld b, BANK(UnownFont)
	ld c, 1
	call Get2bpp
	pop af
	ldh [rVBK], a
	pop bc
	pop de
	ret

SummaryScreen_placeCaughtLocation:
	ld a, [wTempMonCaughtLocation]
	and CAUGHT_LOCATION_MASK
	jr z, .unknown_location
	cp LANDMARK_UNKNOWN
	jr z, .unknown_location
	cp LANDMARK_TRADE
	jr z, .unknown_location
	cp LANDMARK_GIFT
	jr z, .was_gift
	ld e, a
	farcall GetLandmarkName
	ld de, wStringBuffer1
	hlcoord 1, 16
	call PlaceString
	ret	

.was_gift:
	ld de, .GiftString
	hlcoord 1, 16
	call PlaceString
	ret
.unknown_location:
	ld de, .MetUnknownMapString
	hlcoord 1, 16
	call PlaceString
	ret

.MetUnknownMapString:
	db "Via Trade@"
.GiftString:
	db "Gift@"

SummaryScreen_placeCaughtVerb:
	ld a, [wTempMonCaughtTime]
	and CAUGHT_VERB_MASK
	cp MON_TRADE
	ld de, .tradedString
	jr z, .print
	cp MON_GIFT
	ld de, .giftString
	jr z, .print
	cp MON_HATCHED
	ld de, .hatchedString
	jr z, .print
	ld de, .caughtString
.print
	hlcoord 5, 13
	call PlaceString
	ret

.tradedString:
	db "- Traded -@"
.giftString:
	db "- Gifted -@"
.hatchedString:
	db "- Hatched -@"
.caughtString:
	db "- Caught -@"

SummaryScreen_placeCaughtTime:
	ld a, [wTempMonCaughtLevel]
	and a
	jr z, .unknown_time
	hlcoord 3, 14
	jr PlaceCaughtTimeOfDay

.unknown_time:
	ld de, .unknown_time_text
	hlcoord 3, 14
	call PlaceString
	ret

.times
	db "Morning at@"
	db "    Day at@"
	db "  Night at@"
	db "Evening at@"

.unknown_time_text
	db "Unknown at@"

PlaceCaughtTimeOfDay:
	push hl
	ld a, [wTempMonCaughtTime]
	and CAUGHT_TIME_MASK
	rlca
	rlca
	dec a
	maskbits NUM_DAYTIMES
	ld hl, SummaryScreen_placeCaughtTime.times
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	pop hl
	ld de, wStringBuffer2
	jp PlaceString

SummaryScreen_placeCaughtLevel:
	ld a, [wTempMonCaughtLevel]
	and a
	jr z, .unknown_level
	cp MAX_LEVEL + 1
	jr nc, .unknown_level
	cp CAUGHT_EGG_LEVEL ; egg marker value
	jr nz, .print
	ld a, EGG_LEVEL ; egg hatch level
.print
	ld [wTextDecimalByte], a
	hlcoord 15, 14
	ld de, wTextDecimalByte
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	hlcoord 14, 14
	ld [hl], '<LV>'
	ret

.unknown_level
	ld de, .MetUnknownLevelString
	hlcoord 15, 14
	call PlaceString
	ret  

.MetUnknownLevelString:
	db "??@"

SummaryScreen_PlaceFrontpic:
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call SummaryScreen_GetAnimationParam
	jr c, .egg
	and a
	jr z, .no_cry
	jr .cry

.egg
	call .AnimateEgg
	call SetDefaultBGPAndOBP
	ret

.no_cry
	call .AnimateMon
	call SetDefaultBGPAndOBP
	ret

.cry
	call SetDefaultBGPAndOBP
	call .AnimateMon
	ld a, [wCurPartySpecies]
	call PlayMonCry2
	ret

.AnimateMon:
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown
	hlcoord 0, 1
	call PrepMonFrontpic
	ret

.unown
	xor a
	ld [wBoxAlignment], a
	hlcoord 0, 1
	call _PrepMonFrontpic
	ret

.AnimateEgg:
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unownegg
	ld a, TRUE
	ld [wBoxAlignment], a
	call .get_animation
	ret

.unownegg
	xor a
	ld [wBoxAlignment], a
	call .get_animation
	ret

.get_animation
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c
	call SummaryScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	hlcoord 0, 1
	ld d, $0
	ld e, ANIM_MON_MENU
	predef LoadMonAnimation
	ld hl, wSummaryScreenFlags
	set 6, [hl]
	ret

SummaryScreen_GetAnimationParam:
	ld a, [wMonType]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw .PartyMon
	dw .OTPartyMon
	dw .BoxMon ; unused
	dw .Tempmon ; unused
	dw .Wildmon
	dw .Buffermon

.PartyMon:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	jr .CheckEggFaintedSlp

.OTPartyMon:
	xor a
	ret

.BoxMon:
.Buffermon
.Tempmon:
	ld bc, wTempMonSpecies
	jr .CheckEggFaintedSlp ; utterly pointless

.CheckEggFaintedSlp:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	call CheckFaintedSlp
	jr c, .FaintedSlp
.egg
	xor a
	scf
	ret

.Wildmon:
	ld a, $1
	and a
	ret

.FaintedSlp:
	xor a
	ret

SummaryScreen_LoadTextboxSpaceGFX:
	nop
	push hl
	push de
	push bc
	push af
	call DelayFrame
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	ld hl, vTiles2 tile ' '
	call Get2bpp
	pop af
	ldh [rVBK], a
	pop af
	pop bc
	pop de
	pop hl
	ret

EggSummaryScreen:
	xor a
	ldh [hBGMapMode], a
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_EGG_SUMMARY_SCREEN
	call GetSGBLayout
	call EggSummaryScreen_PlacePageBorder
	ld de, EggString
	hlcoord 2, 0
	call PlaceString

	hlcoord 11, 2
	ld [hl], '№'
	inc hl
	ld [hl], '.'

	ld de, ThreeQMarkString
	hlcoord 13, 2
	call PlaceString

	ld de, OTString
	hlcoord 10, 4
	call PlaceString
	ld de, IDNoString
	hlcoord 10, 6
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 13, 4
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 13, 6
	call PlaceString
	
	ld de, EggWatchString
	hlcoord 3, 10
	call PlaceString

if DEF(_DEBUG)
	ld de, .PushStartString
	hlcoord 8, 17
	call PlaceString
	jr .placed_push_start

.PushStartString:
	db "▶Push START.@"

.placed_push_start
endc
	ld a, [wTempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $2
	jr c, .picked
	ld de, EggCloseString
	cp $5
	jr c, .picked
	ld de, EggMoreTimeString
	cp $12
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 12
	call PlaceString
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	call SetDefaultBGPAndOBP
	call DelayFrame
	hlcoord 0, 1
	call PrepMonFrontpic
	farcall HDMATransferTilemapToWRAMBank3
	call SummaryScreen_AnimateEgg

	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	ret

EggString:
	db "Egg@"

FiveQMarkString:
	db "?????@"

ThreeQMarkString:
	db "???@"

EggWatchString:
	db "- Egg Watch -@"

EggSoonString:
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString:
	db   "It sometimes moves"
	next "around. It must be"
	next "close to hatching.@"

EggMoreTimeString:
	db   "Wonder what's"
	next "inside? It needs"
	next "more time, though.@"

EggALotMoreTimeString:
	db   "This Egg needs a"
	next "lot more time to"
	next "hatch.@"

SummaryScreen_AnimateEgg:
	call SummaryScreen_GetAnimationParam
	ret nc
	ld a, [wTempMonHappiness]
	ld e, $7
	cp 6
	jr c, .animate
	ld e, $8
	cp 11
	jr c, .animate
	ret

.animate
	push de
	ld a, $1
	ld [wBoxAlignment], a
	call SummaryScreen_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	pop de
	hlcoord 0, 1
	ld d, $0
	predef LoadMonAnimation
	ld hl, wSummaryScreenFlags
	set 6, [hl]
	ret

SummaryScreen_LoadPageIndicators:
	hlcoord 15, 1
	ld [hl], $3f ; not selected tab
	call .load_square
	hlcoord 16, 1
	ld [hl], $3f ; not selected tab
	call .load_square
	hlcoord 17, 1
	ld [hl], $3f ; not selected tab
	call .load_square
	hlcoord 18, 1
	ld [hl], $3f ; not selected tab
	call .load_square
	ld a, c
	cp PINK_PAGE
	hlcoord 15, 1
	jr z, .load_highlighted_square_alt
	cp GREEN_PAGE
	hlcoord 16, 1
	jr z, .load_highlighted_square
	cp BLUE_PAGE
	hlcoord 17, 1
	jr z, .load_highlighted_square_alt
	; must be ORANGE_PAGE
	hlcoord 18, 1
.load_highlighted_square
	ld [hl], $3e ; selected tab (light grey)
.load_square
	ret
.load_highlighted_square_alt
	ld [hl], $3e ; selected tab (dark grey)
	jr .load_square

CopyNickname:
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	push de
	call CopyBytes
	pop de
	ret

GetNicknamePointer:
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp BUFFERMON
	ret z
	ld a, [wCurPartyMon]
	jp SkipNames

CheckFaintedSlp:
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .fainted_slp
	ld hl, MON_STATUS
	add hl, bc
	ld a, [hl]
	and SLP_MASK
	jr nz, .fainted_slp
	and a
	ret

.fainted_slp
	scf
	ret
	
PrintMonTypeTiles:
	call GetBaseData
	ld a, [wBaseType1]
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
	ld a, c
	ld hl, TypeLightIconGFX ; from gfx\summary\types_light.png
	ld bc, 4 * TILE_SIZE ; Type GFX is 4 tiles wide
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $4c
	lb bc, BANK(TypeLightIconGFX), 4 ; Bank in 'c', Number of Tiles in 'c'
	call Request2bpp

; placing the Type1 Tiles (from gfx\summary\types_light.png)
	hlcoord 8, 7
	ld [hl], $4c
	inc hl
	ld [hl], $4d
	inc hl
	ld [hl], $4e
	inc hl
	ld [hl], $4f
	inc hl
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	ret z; Pokemon only has one Type

	; Load Type2 GFX
	; 2nd Type
	ld c, a ; Pokemon's second type
	farcall GetMonTypeIndex
	ld a, c
	ld hl, TypeDarkIconGFX ; from gfx\summary\types_dark.png
	ld bc, 4 * TILE_SIZE ; Type GFX is 4 Tiles Wide
	call AddNTimes ; type index needs to be in 'a'
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $5c
	lb bc, BANK(TypeDarkIconGFX), 4 ; Bank in 'c', Number of Tiles in 'c'
	call Request2bpp

; place Type 2 GFX
	hlcoord 12, 7
	ld [hl], $5c
	inc hl
	ld [hl], $5d
	inc hl
	ld [hl], $5e
	inc hl
	ld [hl], $5f
	ret
