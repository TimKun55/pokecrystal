	const_def
	const PINK_PAGE   ; 0
	const GREEN_PAGE  ; 1
	const BLUE_PAGE   ; 2
	const ORANGE_PAGE ; 3
DEF NUM_STAT_PAGES EQU const_value

DEF STAT_PAGE_MASK EQU %00000011

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
	ret
	
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
	ld a, [wSummaryScreenFlags]
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
	ld h, 0
	call SummaryScreen_SetJumptableIndex
	ret

.b_button
	ld h, 7
	call SummaryScreen_SetJumptableIndex
	ret

SummaryScreen_InitUpperHalf:
	call .PlaceHPBar
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	hlcoord 10, 0
	call GetPokemonNumber
	call PlaceString
	hlcoord 14, 0
	call PrintLevel
	ld hl, .NicknamePointers
	call GetNicknamePointer
	call CopyNickname
	hlcoord 8, 2
	call PlaceString
	hlcoord 18, 0
	call .PlaceGenderChar
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	call PlaceString
	call SummaryScreen_PlaceHorizontalDivider
	call SummaryScreen_PlacePageSwitchArrows
	call SummaryScreen_PlaceShinyIcon
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

.PlaceGenderChar:
	push hl
	farcall GetGender
	pop hl
	ret c
	ld a, $32 ; "♂"
	jr nz, .got_gender
	ld a, $33 ;  "♀"
.got_gender
	ld [hl], a
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname ; unused
	dw wBufferMonNickname

SummaryScreen_PlaceVerticalDivider: ; unreferenced
; The Japanese summary screen has a vertical divider.
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld a, $31 ; vertical divider
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret

SummaryScreen_PlaceHorizontalDivider:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $6e ; horizontal divider
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

SummaryScreen_PlacePageSwitchArrows:
	hlcoord 10, 6
	ld [hl], "◀"
	hlcoord 19, 6
	ld [hl], "▶"
	ret

SummaryScreen_PlaceShinyIcon:
	ld bc, wTempMonDVs
	farcall CheckShininess
	ret nc
	hlcoord 19, 0
	ld [hl], "⁂"
	ret

SummaryScreen_LoadGFX:
	ld a, [wBaseDexNo]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	xor a
	ldh [hBGMapMode], a
	call .ClearBox
	call .PageTilemap
	call .LoadPals
	ld hl, wSummaryScreenFlags
	bit 4, [hl]
	jr nz, .place_frontpic
	call SetDefaultBGPAndOBP
	ret

.place_frontpic
	call SummaryScreen_PlaceFrontpic
	ret

.ClearBox:
	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	call SummaryScreen_LoadPageIndicators
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	ret

.LoadPals:
	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld c, a
	farcall LoadSummaryScreenPals
	call DelayFrame
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	ret

.PageTilemap:
	ld a, [wSummaryScreenFlags]
	maskbits NUM_STAT_PAGES
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
; entries correspond to *_PAGE constants
	table_width 2, SummaryScreen_LoadGFX.Jumptable
	dw LoadPinkPage
	dw LoadGreenPage
	dw LoadBluePage
	dw LoadOrangePage
	assert_table_length NUM_STAT_PAGES

LoadPinkPage:
	hlcoord 0, 9
	ld b, $0
	predef DrawPlayerHP
;	hlcoord 8, 9
;	ld [hl], $41 ; right HP/exp bar end cap
	ld de, .Status_Text ; string for "STATUS/"
	hlcoord 0, 12
	call PlaceString
	ld de, .Type_Text ; string for "TYPE/"
	hlcoord 0, 14
	call PlaceString
	call PrintMonTypeTiles ; custom GFX function

	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 2, 14
	ld [hl], $36 ; Pokérus immunity face
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .done_status

	ld de, wTempMonStatus
	predef GetStatusConditionIndex
	ld a, d
	and a
	jr z, .StatusOK

	; status index in a
	ld hl, StatusIconGFX
	ld bc, 2 * LEN_2BPP_TILE
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $50
	lb bc, BANK(StatusIconGFX), 2
	call Request2bpp

	hlcoord 7, 12
	ld a, $50 ; status tile first half
	ld [hli], a
	inc a ; status tile 2nd half
	ld [hl], a
	
	jr .done_status
.HasPokerus:
	hlcoord 1, 13
	ld [hl], $37 ; left pkrs label
	hlcoord 2, 13
	ld [hl], $38 ; middle pkrs label
	hlcoord 3, 13
	ld [hl], $39 ; right pkrs label
	jr .NotImmuneToPkrs
.StatusOK:
	hlcoord 7, 12
	ld de, .OK_str
	call PlaceString
.done_status
	hlcoord 9, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	ld de, .ExpPointStr
	hlcoord 10, 9
	call PlaceString
	hlcoord 17, 14
	call .PrintNextLevel
	hlcoord 13, 10
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum
	call .CalcExpToNextLevel
	hlcoord 13, 13
	lb bc, 3, 7
	ld de, wExpToNextLevel
	call PrintNum
	ld de, .LevelUpStr
	hlcoord 11, 12
	call PlaceString
	ld de, .ToStr
	hlcoord 14, 14
	call PlaceString
	hlcoord 12, 16
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 16
	ld [hl], $70 ; left exp bar label
	hlcoord 11, 16
	ld [hl], $71 ; right exp bar label
	hlcoord 19, 16
	ld [hl], $6b ; exp bar end cap
	ret

.PrintNextLevel:
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

.Status_Text:
	db   "Status/@"
.Type_Text:
	db   "Type/@"
.OK_str:
	db "OK @"

.ExpPointStr:
	db "Exp Points@"

.LevelUpStr:
	db "Level Up@"

.ToStr:
	db "to@"

LoadGreenPage:
	ld de, .Item
	hlcoord 0, 8
	call PlaceString
	call .GetItemName
	hlcoord 8, 8
	call PlaceString
	ld de, .Move
	hlcoord 0, 10
	call PlaceString
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMoves
	hlcoord 12, 11
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	predef ListMovePP
	ret

.GetItemName:
	ld de, .ThreeDashes
	ld a, [wTempMonItem]
	and a
	ret z
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
	ret

.Item:
	db "Item@"

.ThreeDashes:
	db "---@"

.Move:
	db "Move@"

LoadBluePage:
	call .PlaceOTInfo
	hlcoord 10, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	hlcoord 11, 8
	ld bc, 6
	predef PrintTempMonStats
	ret

.PlaceOTInfo:
	ld de, IDNoString
	hlcoord 1, 8
	call PlaceString
	ld de, OTString
	hlcoord 1, 11
	call PlaceString
	hlcoord 1, 9
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum
	ld hl, .OTNamePointers
	call GetNicknamePointer
	call CopyNickname
	farcall CorrectNickErrors
	hlcoord 1, 12
	call PlaceString
	ld a, [wTempMonCaughtGender]
	and a
	jr z, .done
	cp $7f
	jr z, .done
	and CAUGHT_GENDER_MASK
	ld a, "♂"
	jr z, .got_gender
	ld a, "♀"
.got_gender
	hlcoord 9, 12
	ld [hl], a
.done
	call SummaryScreen_PrintHappiness
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

SummaryScreen_PrintHappiness:
	hlcoord 1, 16
	ld [hl], $35 ; heart icon
	
	hlcoord 3, 16
	lb bc, 1, 3
	ld de, wTempMonHappiness
	call PrintNum
	ld de, .HappinessString
	hlcoord 1, 14
	call PlaceString
	ld de, .outofMaxLoveString
	hlcoord 6, 16
	call PlaceString
	ret
.HappinessString:
	db "Happiness@"

.outofMaxLoveString:
	db "/255@"

LoadOrangePage:
	call SummaryScreen_placeCaughtTime
	call SummaryScreen_placeCaughtLocation
	call SummaryScreen_placeCaughtLevel
	call SummaryScreen_PrintDVs
	call SummaryScreen_PrintEVs
	ret

SummaryScreen_PrintEVs:
	hlcoord 13, 11
	ld de, .EVNamestring
	call PlaceString
	
	hlcoord 11, 12
	ld de, .EVHPstring
	call PlaceString
	hlcoord 15, 12
	lb bc, 1, 3
	ld de, wTempMonHPEV
	call PrintNum

	hlcoord 11, 13
	ld de, .EVAtkstring
	call PlaceString
	hlcoord 15, 13
	lb bc, 1, 3
	ld de, wTempMonAtkEV
	call PrintNum

	hlcoord 11, 14
	ld de, .EVDefstring
	call PlaceString
	hlcoord 15, 14
	lb bc, 1, 3
	ld de, wTempMonDefEV
	call PrintNum

	hlcoord 11, 15
	ld de, .EVSpAstring
	call PlaceString
	hlcoord 15, 15
	lb bc, 1, 3
	ld de, wTempMonSpclAtkEV
	call PrintNum

	hlcoord 11, 16
	ld de, .EVSpDstring
	call PlaceString
	hlcoord 15, 16
	lb bc, 1, 3
	ld de, wTempMonSpclDefEV
	call PrintNum

	hlcoord 11, 17
	ld de, .EVSpestring
	call PlaceString
	hlcoord 15, 17
	lb bc, 1, 3
	ld de, wTempMonSpdEV
	call PrintNum

.EVNamestring:
	db "EVs@"
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
	hlcoord 4, 11
	ld de, .DVNamestring
	call PlaceString
	hlcoord 2, 12
	ld de, .DVHPstring
	call PlaceString
	hlcoord 2, 13
	ld de, .DVAtkstring
	call PlaceString
	hlcoord 2, 14
	ld de, .DVDefstring
	call PlaceString
	hlcoord 2, 15
	ld de, .DVSpcstring
	call PlaceString
	hlcoord 2, 16
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
	hlcoord 6, 13
	call PrintNum

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
	hlcoord 6, 14
	call PrintNum

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
	hlcoord 6, 16 ; 1, 5, 9, 13
	call PrintNum

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
	hlcoord 6, 15
	call PrintNum
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
	hlcoord 6, 12 ; 1, 4, 7, 10, 13 
	call PrintNum
	ret

.DVNamestring:
	db "DVs@"
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

SummaryScreen_placeCaughtLocation:
	ld de, .MetAtMapString
	hlcoord 1, 8
	call PlaceString
	ld a, [wTempMonCaughtLocation]
	and CAUGHT_LOCATION_MASK
	jr z, .unknown_location
	cp LANDMARK_EVENT
	jr z, .unknown_location
	cp LANDMARK_GIFT
	jr z, .unknown_location
	ld e, a
	farcall GetLandmarkName
	ld de, wStringBuffer1
	hlcoord 2, 9
	call PlaceString
	ret	
.unknown_location:
	ld de, .MetUnknownMapString
	hlcoord 6, 8
	call PlaceString
	ret
.MetAtMapString:
	db "Met: @"
.MetUnknownMapString:
	db "via Trade@"

SummaryScreen_placeCaughtTime:
	; caught level
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK	
	and a
	jr z, .unknown_time

	; caught level
	xor a
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK
	and a
	jr z, .printnoneegg
	cp 1 ; egg level
	jr z, .printegginfo

.printnoneegg:
	ld a, [wTempMonCaughtTime]
	and CAUGHT_TIME_MASK
;	ret z ; no time
	rlca
	rlca
	dec a
	maskbits NUM_DAYTIMES
	ld hl, .times
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	ld de, wStringBuffer2
	hlcoord 6, 8
	call PlaceString
	ret

.printegginfo:
	ld a, [wTempMonCaughtTime]
	and CAUGHT_TIME_MASK
	rlca
	rlca
	dec a
	maskbits NUM_DAYTIMES
	ld hl, .times
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	ld de, wStringBuffer2
	hlcoord 10, 8
	call PlaceString
	ret

.unknown_time:
	ld de, .unknown_time_text
	hlcoord 6, 8
	call PlaceString
	ret

.times
	db "Morn@"
	db "Day@"
	db "Nite@"
	db "Eve@"

.unknown_time_text
	db "@"

SummaryScreen_placeCaughtLevel:
	; caught level
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK	
	and a
	jr z, .unknown_level
;	cp CAUGHT_EGG_LEVEL ; egg marker value
;	jr nz, .print
;	ld a, EGG_LEVEL ; egg hatch level
	cp 1 ; egg level
	jr z, .printegg

;.print
	ld [wTextDecimalByte], a
	hlcoord 12, 8
	ld de, wTextDecimalByte
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	hlcoord 11, 8
	ld [hl], "<LV>"
	ret

.printegg:
	ld de, .HatchedString
	hlcoord 1, 8
	call PlaceString
	ret

.unknown_level
	ld de, .MetUnknownLevelString
	hlcoord 6, 8
	call PlaceString
	ret  

.HatchedString:
	db "Hatched:"

.MetUnknownLevelString:
	db "@"

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
	hlcoord 0, 0
	call PrepMonFrontpic
	ret

.unown
	xor a
	ld [wBoxAlignment], a
	hlcoord 0, 0
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
	hlcoord 0, 0
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
	ld hl, vTiles2 tile " "
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
	ld b, SCGB_SUMMARY_SCREEN_HP_PALS
	call GetSGBLayout
	call SummaryScreen_PlaceHorizontalDivider
	ld de, EggString
	hlcoord 8, 1
	call PlaceString
	ld de, IDNoString
	hlcoord 8, 3
	call PlaceString
	ld de, OTString
	hlcoord 8, 5
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 3
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 5
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
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	call SetDefaultBGPAndOBP
	call DelayFrame
	hlcoord 0, 0
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

EggSoonString:
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString:
	db   "It moves around"
	next "inside sometimes."
	next "It must be close"
	next "to hatching.@"

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
	hlcoord 0, 0
	ld d, $0
	predef LoadMonAnimation
	ld hl, wSummaryScreenFlags
	set 6, [hl]
	ret

SummaryScreen_LoadPageIndicators:
	hlcoord 11, 5
	ld a, $43 ; " " " "
	call .load_square
	hlcoord 13, 5
	ld a, $3a ; first of 4 small square tiles
	call .load_square
	hlcoord 15, 5
	ld a, $43 ; " " " "
	call .load_square
	hlcoord 17, 5
	ld a, $3a ; " " " "
	call .load_square
	ld a, c
	cp PINK_PAGE
	hlcoord 11, 5
	jr z, .load_highlighted_square_alt
	cp GREEN_PAGE
	hlcoord 13, 5
	jr z, .load_highlighted_square
	cp BLUE_PAGE
	hlcoord 15, 5
	jr z, .load_highlighted_square_alt
	; must be ORANGE_PAGE
	hlcoord 17, 5
.load_highlighted_square
	ld a, $3e ; first of 4 large square tiles
.load_square
	push bc
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop bc
	ret
.load_highlighted_square_alt
	ld a, $47 ; first of 4 large square tiles, alternate Gray pixels for use of 3rd color slot
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
	ld bc, 4 * LEN_2BPP_TILE ; Type GFX is 4 tiles wide
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $4c
	lb bc, BANK(TypeLightIconGFX), 4 ; Bank in 'c', Number of Tiles in 'c'
	call Request2bpp

; placing the Type1 Tiles (from gfx\summary\types_light.png)
	hlcoord 5, 14
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
	ld bc, 4 * LEN_2BPP_TILE ; Type GFX is 4 Tiles Wide
	call AddNTimes ; type index needs to be in 'a'
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $5c
	lb bc, BANK(TypeDarkIconGFX), 4 ; Bank in 'c', Number of Tiles in 'c'
	call Request2bpp
	
; place Type 2 GFX
	hlcoord 5, 15
	ld [hl], $5c
	inc hl
	ld [hl], $5d
	inc hl
	ld [hl], $5e
	inc hl
	ld [hl], $5f
	ret
