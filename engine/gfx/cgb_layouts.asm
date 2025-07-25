; Replaces the functionality of sgb.asm to work with CGB hardware.

CheckCGB:
	ldh a, [hCGB]
	and a
	ret

LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_DEFAULT
	jr nz, .not_default
	ld a, [wDefaultSGBLayout]
.not_default
	cp SCGB_PARTY_MENU_HP_BARS
	jp z, CGB_ApplyPartyMenuHPPals
	call ResetBGPals
	ld l, a
	ld h, 0
	add hl, hl
	ld de, CGBLayoutJumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	push de
	jp hl
.done:
	ret

CGBLayoutJumptable:
; entries correspond to SCGB_* constants (see constants/scgb_constants.asm)
	table_width 2, CGBLayoutJumptable
	dw _CGB_BattleGrayscale
	dw _CGB_BattleColors
	dw _CGB_PokegearPals
	dw _CGB_SummaryScreenHPPals
	dw _CGB_Pokedex
	dw _CGB_Pokedex_EvoPage
	dw _CGB_Pokedex_PicsPage
	dw _CGB_SlotMachine
	dw _CGB_BetaTitleScreen
	dw _CGB_GSIntro
	dw _CGB_Diploma
	dw _CGB_MapPals
	dw _CGB_PartyMenu
	dw _CGB_Evolution
	dw _CGB_GSTitleScreen
	dw _CGB_Generic
	dw _CGB_MoveList
	dw _CGB_BetaPikachuMinigame
	dw _CGB_PokedexSearchOption
	dw _CGB_BetaPoker
	dw _CGB_Pokepic
	dw _CGB_MagnetTrain
	dw _CGB_PackPals
	dw _CGB_TrainerCard
	dw _CGB_TrainerCardJohto
	dw _CGB_TrainerCardKanto
	dw _CGB_PokedexUnownMode
	dw _CGB_BillsPC
	dw _CGB_UnownPuzzle
	dw _CGB_GamefreakLogo
	dw _CGB_PlayerOrMonFrontpicPals
	dw _CGB_TradeTube
	dw _CGB_TrainerOrMonFrontpicPals
	dw _CGB_MysteryGift
	dw _CGB_Unused1E
	dw _CGB_IntroPals
	dw _CGB_IntroGenderPals
	dw _CGB_NamingScreen
	dw _CGB_BuyMenu
	dw _CGB_Plain
	assert_table_length NUM_SCGB_LAYOUTS

_CGB_BattleGrayscale:
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1 palette PAL_BATTLE_BG_EXP
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wOBPals1
	ld c, 2
	call CopyPalettes
	jr _CGB_FinishBattleScreenLayout

_CGB_BattleColors:
	ld de, wBGPals1
	call GetBattlemonBackpicPalettePointer
	push hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER
	call GetEnemyFrontpicPalettePointer
	push hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY
	ld a, [wEnemyHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY_HP
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER_HP
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_EXP
;	ld hl, BallHUDPalette
;	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_5
	ld de, wOBPals1
	pop hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_OB_ENEMY
	pop hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_OB_PLAYER
	
	call LoadPlayerBattleCGBLayoutStatusIconPalette
	call LoadEnemyBattleCGBLayoutStatusIconPalette
	
	ld a, SCGB_BATTLE_COLORS
	ld [wDefaultSGBLayout], a
	call ApplyPals
_CGB_FinishBattleScreenLayout:
	call InitPartyMenuBGPal7
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call ByteFill
	hlcoord 0, 4, wAttrmap
	lb bc, 8, 10
	ld a, PAL_BATTLE_BG_PLAYER
	call FillBoxCGB
	hlcoord 10, 0, wAttrmap
	lb bc, 7, 10
	ld a, PAL_BATTLE_BG_ENEMY
	call FillBoxCGB
	hlcoord 0, 0, wAttrmap
	lb bc, 4, 10
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call FillBoxCGB
	hlcoord 1, 1, wAttrmap
	ld a, PAL_BATTLE_BG_EXP
	ld [hl], a
	hlcoord 8, 1, wAttrmap
	ld a, PAL_BATTLE_BG_EXP
	ld [hl], a
	hlcoord 10, 7, wAttrmap
	lb bc, 5, 10
	ld a, PAL_BATTLE_BG_PLAYER_HP
	call FillBoxCGB
	hlcoord 12, 11, wAttrmap
	lb bc, 1, 7
	ld a, PAL_BATTLE_BG_EXP
	call FillBoxCGB
	hlcoord 18, 8, wAttrmap
	ld a, PAL_BATTLE_BG_EXP
	ld [hl], a
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	call ByteFill

; flip reused tiles
; HUD vertical bar thingy
;	hlcoord 18, 10, wAttrmap
;	ld bc, 1
;	ld a, PAL_BATTLE_BG_PLAYER_HP
;	set 5, a ; flips tiles on x axis
;	call ByteFill

; player exp
;	hlcoord 10, 11, wAttrmap
;	lb bc, 1, 8
;	ld a, PAL_BATTLE_BG_EXP
;	set 5, a ; flips tiles on x axis
;	call FillBoxCGB

; status icons
	; enemy
	hlcoord 2, 1, wAttrmap
	lb bc, 1, 2
	ld a, $6
	call FillBoxCGB
	; player's
	hlcoord 11, 8, wAttrmap
	lb bc, 1, 2
	ld a, $6
	call FillBoxCGB

; check if we're in the MoveInfoBox
	hlcoord 0, 12
	ld a, [hl]
	cp $be
	jr nz, .done

	; Move Type and Category pal
	hlcoord 7, 11, wAttrmap
	ld bc, 2
	ld a, $5
	call ByteFill
	hlcoord 2, 11, wAttrmap
	ld bc, 4
	ld a, $5
	call ByteFill

.done
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrmap
	ret

InitPartyMenuBGPal7:
	farcall Function100dc0
Mobile_InitPartyMenuBGPal7:
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

InitPartyMenuBGPal0:
	farcall Function100dc0
	ld hl, PartyMenuGenderPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 0
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

_CGB_PokegearPals:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld hl, FemalePokegearPals
	jr .got_pals

.male
	ld hl, MalePokegearPals
.got_pals
	ld de, wBGPals1
	ld bc, 8 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

;	ld de, wBGPals1 palette 7
;	ld a, PREDEFPAL_POKEGEAR_TOD_ICONS
;	call GetPredefPal
;	call LoadHLPaletteIntoDE

; for johto map arrow on dex area map
;	hlcoord 18, 16, wAttrmap
;	ld bc, 1 ; 1 tile
;	ld a, 0 ; palette 0
;	set 5, a ; flip on y axis
;	call ByteFill

	ld hl, PokegearOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	call FarCopyColorWRAM
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_SummaryScreenHPPals:
	ld de, wBGPals1
	ld a, [wCurHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; hp palette, palette 0
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon palette, palette 1
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; exp palette, palette 2

	ld hl, SummaryScreenPagePals
	ld de, wBGPals1 palette 3 ; palettes 3 & 4
	ld bc, 2 palettes ; pink, green, blue, ( and orange page) palettes
	; NOTE: Won't hurt anything if you don't have a 4th summary page, just leave it
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; BG_5

	call LoadSummaryScreenStatusIconPalette

; Load Pokemon's Type Palette(s)
	call GetBaseData
	ld a, [wBaseType1]
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
; load the 1st type pal 
	; type index is already in c
	ld de, wBGPals1 palette 7 + 2 ; slot 2 of pal 7, byte 1
	call LoadMonBaseTypePal	

	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	jr z, .palettes_done
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
; load the 2nd type pal 
	; type index is already in c
	ld de, wBGPals1 palette 7 + 4 ; slot 3 of pal 7, byte 1
	call LoadMonBaseTypePal	
.palettes_done
	call WipeAttrmap

	hlcoord 0, 0, wAttrmap
	lb bc, 8, SCREEN_WIDTH
	ld a, $1 ; mon palette
	call FillBoxCGB

	hlcoord 12, 16, wAttrmap
	ld bc, 8
	ld a, $2 ; exp palette
	call ByteFill
	
; page indicator boxes
	hlcoord 11, 5, wAttrmap
	lb bc, 2, 4 ; 2 Tiles in HEIGHT, 4 Tiles in WIDTH
	ld a, $3 ; pink & green page palette 
	call FillBoxCGB

	hlcoord 15, 5, wAttrmap
	lb bc, 2, 4 ; 2 Tiles in HEIGHT, 4 Tiles in WIDTH
	ld a, $4 ; blue & orange box palette
	call FillBoxCGB

; gender icon
	hlcoord 18, 0, wAttrmap
	ld bc, 1
	ld a, $5 ; gender palette
	call ByteFill

; mon status
	hlcoord 7, 12, wAttrmap
	lb bc, 1, 2 ; 1 Tile in HEIGHT, 2 Tiles in WIDTH 
	ld a, $6 ; mon base type light/dark pals
	call FillBoxCGB

; mon type(s) 
	hlcoord 5, 14, wAttrmap
	lb bc, 2, 4 ; 2 Tiles in HEIGHT, 4 Tiles in WIDTH 
	ld a, $7 ; mon base type light/dark pals
	call FillBoxCGB

	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

SummaryScreenPagePals:
INCLUDE "gfx/summary/pages.pal"

SummaryScreenPals:
INCLUDE "gfx/summary/summary.pal"

_CGB_Pokedex:
	ld de, wBGPals1
	; ld a, PREDEFPAL_POKEDEX
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld hl, PokedexQuestionMarkPalette
	call LoadHLPaletteIntoDE ; green question mark palette
	jr .got_palette

.is_pokemon
	call GetMonPalettePointer
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	inc hl
	inc hl
	inc hl
	inc hl
.not_shiny
	call LoadPalette_White_Col1_Col2_Black ; mon palette

; black background for Pal 7
	ld de, wBGPals1 palette 7 ; First color slot of Pal 7	
	call LoadSingleBlackPal ; loads black into slot 1 of pal 7, since it is normally white
							; but pokedex has black background
; mon type 1	
	ld a, [wTempSpecies]
	ld [wCurSpecies], a	
	call GetBaseData
	ld a, [wBaseType1]
	
IF SWAP_DARK_GHOST_TYPES == TRUE
	cp GHOST
	jr nz, .check_dark
	ld a, DARK
	jr .done1
.check_dark
	cp DARK
	jr nz, .done1
	ld a, GHOST
.done1
ENDC

	ld c, a ; farcall will clobber a for the bank
	predef GetMonTypeIndex

IF USE_GEN3_STYLE_TYPE_GFX == TRUE
; load the 1st type pal 
	; type index is already in c
	ld de, wBGPals1 palette 7 + 2 ; slot 2 of pal 7
	farcall LoadMonBaseTypePal	; loads type color into slot 2 of pal 7
ENDC

; mon type 2
	ld a, [wBaseType2]
	ld c, a ; farcall will clobber a for the bank
	ld a, [wBaseType1]
	cp c
	jr z, .same_type

IF SWAP_DARK_GHOST_TYPES == TRUE
	ld a, c
	cp GHOST
	jr nz, .check_dark2
	ld a, DARK
	jr .done2
.check_dark2
	cp DARK
	jr nz, .done2
	ld a, GHOST
.done2
	ld c, a	
ENDC
	
	predef GetMonTypeIndex

IF USE_GEN3_STYLE_TYPE_GFX == TRUE
; load the 2nd type pal 
	; type index is already in c
	ld de, wBGPals1 palette 7 + 4 ; slot 3 of pal 7
	farcall LoadMonBaseTypePal ; loads type color into slot 3 of pal 7
	jr .got_palette
ENDC

.same_type
IF USE_GEN3_STYLE_TYPE_GFX == TRUE
	ld de, wBGPals1 palette 7 + 4 ; slot 3 of pal 7
	call LoadSingleBlackPal
ENDC

.got_palette
	call WipeAttrmap
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; green question mark palette
	call FillBoxCGB

IF USE_GEN3_STYLE_TYPE_GFX == TRUE
; mon base types
	hlcoord 9, 4, wAttrmap
	lb bc, 1, 8
	ld a, 7 | VRAM_BANK_1 ; mon base type pals ; VRAM 1
	call FillBoxCGB
ENDC

	call InitPartyMenuOBPals
	ld hl, PokedexCursorPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

; category enclosure + page nums + A >
	hlcoord 18, 5, wAttrmap
	ld bc, 2
	ld a, 0 | VRAM_BANK_1 ; dex pal PREDEFPAL_POKEDEX
	call ByteFill
	hlcoord 18, 7, wAttrmap
	ld bc, 2
	ld a, 0 | VRAM_BANK_1 ; dex pal PREDEFPAL_POKEDEX
	call ByteFill

	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Pokedex_EvoPage:
	call WipeAttrmap

	ld de, wBGPals1
	; ld a, PREDEFPAL_POKEDEX
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette

	ld de, wBGPals1 palette 6
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette	

; main screen within border, vram 1
	hlcoord 1, 1, wAttrmap
	lb bc, 16, 19
	ld a, 0 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

IF USE_GEN3_STYLE_TYPE_GFX == TRUE
; mon slot 1 types
	hlcoord 16, 2, wAttrmap
	lb bc, 2, 4
	ld a, 1 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; mon slot 2 types
	hlcoord 16, 5, wAttrmap
	lb bc, 2, 4
	ld a, 2 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; mon slot 3 types
	hlcoord 16, 8, wAttrmap
	lb bc, 3, 4
	ld a, 3 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; mon slot 4 types
	hlcoord 16, 12, wAttrmap
	lb bc, 3, 4
	ld a, 4 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
ENDC

; flip bottom row of sprite icon borders
	hlcoord 1, 4, wAttrmap
	ld bc, 4
	ld a, 0 | Y_FLIP | VRAM_BANK_1 ; VRAM 1
	call ByteFill
	hlcoord 1, 8, wAttrmap
	ld bc, 4
	call ByteFill	
	hlcoord 1, 12, wAttrmap
	ld bc, 4
	call ByteFill	
	hlcoord 1, 16, wAttrmap
	ld bc, 4
	call ByteFill				

	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Pokedex_PicsPage:
	call WipeAttrmap
	ld de, wBGPals1
	; ld a, PREDEFPAL_POKEDEX
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
; pokemon pals
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	inc hl
	inc hl
	inc hl
	inc hl
.not_shiny
	call LoadPalette_White_Col1_Col2_Black ; mon palette
; secondary pokedex pal
	ld de, wBGPals1 palette 6
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette	
	
	ld de, wBGPals1 palette 6
	call LoadSingleBlackPal
; black background
	ld de, wBGPals1 palette 7	
	call LoadSingleBlackPal

; animated front pic
	hlcoord 2, 2, wAttrmap
	lb bc, 7, 7
	ld a, 1 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; ; back pic
	hlcoord 12, 2, wAttrmap
	lb bc, 6, 6
	ld a, 1 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; sprite box border
	hlcoord 1, 13, wAttrmap
	lb bc, 4, 4
	ld a, 0 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; page/up down arrows
	hlcoord 9, 0, wAttrmap
	ld [hl], 0 ; remove VRAM 1 bit
	hlcoord 19, 0, wAttrmap
	ld [hl], 0 ; remove VRAM 1 bit

; animated icon, upper right corner fix
	hlcoord 4, 13, wAttrmap
	ld [hl], 0 | X_FLIP | VRAM_BANK_1
; animated icon, lower right corner fix
	hlcoord 4, 16, wAttrmap
	ld [hl], 0 | X_FLIP | Y_FLIP | VRAM_BANK_1
; animated icon, lower left corner fix
	hlcoord 1, 16, wAttrmap
	ld [hl], 0 | Y_FLIP | VRAM_BANK_1		
; sprite border right side
	hlcoord 4, 14, wAttrmap
	ld [hl], 0 | X_FLIP | VRAM_BANK_1
	hlcoord 4, 15, wAttrmap
	ld [hl], 0 | X_FLIP | VRAM_BANK_1
; page bottom border row, bottom of sprite border	
	hlcoord 2, 16, wAttrmap
	ld bc, 2
	ld a, 0 | Y_FLIP | VRAM_BANK_1
	call ByteFill


IF USING_INCREASED_SPRITE_ANIMATION == FALSE
; > CRY, set VRAM	
	hlcoord 14, 0, wAttrmap
	lb bc, 1, 2
	ld a, 0 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
ENDC

	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

CheckPokedexColor:
	ld a, [wCurPokedexColor]
	cp DEXCOLOR_BLUE
	jr nz, .Purple
	ld a, PREDEFPAL_TRADE_TUBE
	ret

.Purple
	cp DEXCOLOR_PURPLE
	jr nz, .Brown
	ld a, PREDEFPAL_RB_PURPLEMON
	ret

.Brown
	cp DEXCOLOR_BROWN
	jr nz, .Green
	ld a, PREDEFPAL_RB_BROWNMON
	ret

.Green
	cp DEXCOLOR_GREEN
	jr nz, .Pink
	ld a, PREDEFPAL_RB_GREENMON
	ret

.Pink
	cp DEXCOLOR_PINK
	jr nz, .Yellow
	ld a, PREDEFPAL_RB_PINKMON
	ret

.Yellow
	cp DEXCOLOR_YELLOW
	jr nz, .Cyan
	ld a, PREDEFPAL_RB_YELLOWMON
	ret

.Cyan
	cp DEXCOLOR_CYAN
	jr nz, .Gray
	ld a, PREDEFPAL_RB_CYANMON
	ret

.Gray
	cp DEXCOLOR_GRAY
	jr nz, .Red
	ld a, PREDEFPAL_CGB_BADGE
	ret

.Red
	ld a, PREDEFPAL_POKEDEX
	ret

PokedexQuestionMarkPalette:
INCLUDE "gfx/pokedex/question_mark.pal"

PokedexCursorPalette:
INCLUDE "gfx/pokedex/cursor.pal"

_CGB_BillsPC:
	newfarcall GetBoxTheme
BillsPC_PreviewTheme:
	; hl = BillsPC_ThemePals + a * 4 * 2
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, BillsPC_ThemePals
	add hl, de
	; Load palettes
	ld de, wBGPals1
	push hl
	ld c, 2 * 2
	call LoadHLBytesIntoDE
	pop hl
	ld c, 2 * 2
	call LoadHLBytesIntoDE
	push hl
	ld hl, wBGPals1 palette 0
	ld c, 1 * 2
	call LoadHLBytesIntoDE
	pop hl
	ld c, 2 * 2
	call LoadHLBytesIntoDE
	ld hl, BillsPC_WhitePalette
	call LoadHLPaletteIntoDE
	ld hl, wBGPals1 palette 0
	ld de, wBGPals1 palette 3
	ld c, 1 * 2
	call LoadHLBytesIntoDE
	
	ld hl, ExpBarPalette
	ld c, a
	ld b, 0
	add hl, bc
	ld de, wBGPals1 palette 0 + 2 ; slot 2 of pal 0
	ld c, 4 ; 2 colors (4 bytes)
	call LoadCPaletteBytesFromHLIntoDE
	
	ld a, [wBillsPC_ApplyThemePals]
	and a
	jr nz, .apply_pals
	ld de, wOBPals1 palette 1
	ld hl, BillsPC_CursorPalette
	push hl
	call LoadHLPaletteIntoDE
	pop hl
	call LoadHLPaletteIntoDE
	ld hl, BillsPC_PackPalette
	ld de, wOBPals1 palette 4
	call LoadHLPaletteIntoDE
	ld hl, BillsPC_WhitePalette
	ld de, wOBPals1 palette 6
	jp LoadHLPaletteIntoDE
.apply_pals
	newfarjp BillsPC_SetPals

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
.GotPalette:
	call WipeAttrmap
	hlcoord 1, 4, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; mon palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Unknown: ; unreferenced
	ld hl, BillsPCOrangePalette
	call LoadHLPaletteIntoDE
	jr .GotPalette

.GetMonPalette: ; unreferenced
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
.GotPalette:
	call WipeAttrmap
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; mon palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

BillsPCOrangePalette:
INCLUDE "gfx/pc/orange.pal"

_CGB_PokedexUnownMode:
	ld de, wBGPals1
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	hlcoord 7, 5, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; mon palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_SlotMachine:
	ld hl, SlotMachinePals
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrmap
	hlcoord 0, 2, wAttrmap
	lb bc, 10, 3
	ld a, $2 ; "3" palette
	call FillBoxCGB
	hlcoord 17, 2, wAttrmap
	lb bc, 10, 3
	ld a, $2 ; "3" palette
	call FillBoxCGB
	hlcoord 0, 4, wAttrmap
	lb bc, 6, 3
	ld a, $3 ; "2" palette
	call FillBoxCGB
	hlcoord 17, 4, wAttrmap
	lb bc, 6, 3
	ld a, $3 ; "2" palette
	call FillBoxCGB
	hlcoord 0, 6, wAttrmap
	lb bc, 2, 3
	ld a, $4 ; "1" palette
	call FillBoxCGB
	hlcoord 17, 6, wAttrmap
	lb bc, 2, 3
	ld a, $4 ; "1" palette
	call FillBoxCGB
	hlcoord 4, 2, wAttrmap
	lb bc, 2, 12
	ld a, $1 ; Vileplume palette
	call FillBoxCGB
	hlcoord 3, 2, wAttrmap
	lb bc, 10, 1
	ld a, $1 ; lights palette
	call FillBoxCGB
	hlcoord 16, 2, wAttrmap
	lb bc, 10, 1
	ld a, $1 ; lights palette
	call FillBoxCGB
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7 ; text palette
	call ByteFill
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaTitleScreen:
	ld hl, PalPacket_BetaTitleScreen + 1
	call CopyFourPalettes
	call WipeAttrmap
	ld de, wOBPals1
	ld a, PREDEFPAL_PACK
	call GetPredefPal
	call LoadHLPaletteIntoDE
	hlcoord 0, 6, wAttrmap
	lb bc, 12, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSIntro:
	ld b, 0
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .ShellderLaprasScene
	dw .JigglypuffPikachuScene
	dw .StartersCharizardScene

.ShellderLaprasScene:
	ld hl, .ShellderLaprasBGPalette
	ld de, wBGPals1
	call LoadHLPaletteIntoDE
	ld hl, .ShellderLaprasOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call WipeAttrmap
	ret

.ShellderLaprasBGPalette:
INCLUDE "gfx/intro/gs_shellder_lapras_bg.pal"

.ShellderLaprasOBPals:
INCLUDE "gfx/intro/gs_shellder_lapras_ob.pal"

.JigglypuffPikachuScene:
	ld de, wBGPals1
	ld a, PREDEFPAL_GS_INTRO_JIGGLYPUFF_PIKACHU_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE

	ld de, wOBPals1
	ld a, PREDEFPAL_GS_INTRO_JIGGLYPUFF_PIKACHU_OB
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

.StartersCharizardScene:
	ld hl, PalPacket_Pack + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_GS_INTRO_STARTERS_TRANSITION
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

_CGB_BetaPoker:
	ld hl, BetaPokerPals
	ld de, wBGPals1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_Diploma:
	ld hl, DiplomaPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	call WipeAttrmap
	call ApplyAttrmap

	hlcoord 2, 0, wAttrmap
	lb bc, 2, 1
	ld a, $1 
	call FillBoxCGB
	call ApplyAttrmap

	hlcoord 17, 0, wAttrmap
	lb bc, 2, 1
	ld a, $1 
	call FillBoxCGB
	call ApplyAttrmap

	hlcoord 3, 0, wAttrmap
	lb bc, 2, 14
	ld a, $2 
	call FillBoxCGB
	call ApplyAttrmap
	
	hlcoord 1, 12, wAttrmap
	lb bc, 5, 9
	ld a, $3 
	call FillBoxCGB
	call ApplyAttrmap

	hlcoord 4, 14, wAttrmap
	lb bc, 1, 3
	ld a, $4 
	call FillBoxCGB
	call ApplyAttrmap

	hlcoord 3, 15, wAttrmap
	lb bc, 1, 5
	ld a, $4 
	call FillBoxCGB
	call ApplyAttrmap

	hlcoord 17, 15, wAttrmap
	lb bc, 2, 2
	ld a, $5 
	call FillBoxCGB
	call ApplyAttrmap

	hlcoord 5, 17, wAttrmap
	lb bc, 1, 10
	ld a, $6 
	call FillBoxCGB
	call ApplyAttrmap
	ret

_CGB_MapPals:
	call LoadMapPals
	ld a, SCGB_MAPPALS
	ld [wDefaultSGBLayout], a
	ret

_CGB_PartyMenu:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuBGPal0
	call InitPartyMenuBGPal7	
	call InitPartyMenuOBPals
	call InitPartyMenuStatusPals ; this is the new function added in engine\gfx\color.asm

	ld a, [wPartyCount]
	and a
	ret z
	ld c, a ; max number of Party Mons
	ld b, 0 ; how many checked so far
	hlcoord 3, 2, wAttrmap ; matches the new location specified in PlacePartyMonStatus, in party_menu.asm
.loop
	push bc ; party pokemon count (up to six) left, in 'c', number already done in 'b'
	push hl ; hlcoord 3, 2, wAttrmap, will become adjusted based on which Party member we're working on
	; checking for egg, skipping to next party mon if so
	ld a, LOW(wPartySpecies)
	add b
	ld e, a
	ld a, HIGH(wPartySpecies)
	adc 0
	ld d, a
	; 'de' now contains fully adjusted pointer to current Pokemon species in the Party
	ld a, [de] ; the species
	cp EGG
	jr z, .next

	; not an egg
	push hl ; which row we are printing on, based on hlcoord 3, 2, wAttrmap
	ld a, b ; number of Pokemon in Party checked so far
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Status ; more pointer math to calc the pointer to Status Condition of the Party Mon
	call AddNTimes ; adds 'hl' to 'bc' number of times specified in 'a'
	ld e, l
	ld d, h
	farcall GetStatusConditionIndex ; expects the pointer in 'de'
	; returns Status Condition Index in 'd'
	ld a, d ; status condition index
	pop hl ; which row we are printing on, based on hlcoord 3, 2, wAttrmap
	and a
	jr z, .next ; Status is "OK", nothing else to be done for this Mon
	; get the right Pal for the status condition index, which is in 'a' 
	ld b, $1 ; PSN status index
	ld c, $4 ; PSN pal, includes Toxic, they use same pal
	cp b
	jr z, .done
	ld b, $2 ; PAR status index
	ld c, $5 ; PAR pal
	cp b
	jr z, .done
	ld b, $3 ; SLP status index
	ld c, $6 ; SLP pal
	cp b
	jr z, .done
	ld b, $4 ; BRN Status Index
	ld c, $4 ; BRN pal
	cp b
	jr z, .done
	ld b, $5 ; FRZ Status Index
	ld c, $5 ; FRZ pal
	cp b
	jr z, .done
	; if we are here, only status left is FNT
	ld c, $6 ; FNT pal
.done
	; hlcoord is already done and ready: hlcoord 3, 2, wAttrmap + (Party Mon Row x2)
	ld a, c ; the Status palette
	lb bc, 1, 2 ; box 1 Tile in HEIGHT, 2 Tiles in WIDTH.
	call FillBoxCGB
.next
	pop hl ; 
	ld de, SCREEN_WIDTH * 2 ; adjusts hl to two rows down
	add hl, de
	pop bc ; party pokemon count (up to six) left, in 'c', number already done in 'b'
	inc b ; number of Party Mons checked so far, used in various calculations
	dec c ; number of party mons left to check, stop when 0
	jr nz, .loop
	; done with all party pokemon
	call ApplyAttrmap
	ret

_CGB_Evolution:
	ld de, wBGPals1
	ld a, c
	and a
	jr z, .pokemon
	ld a, PREDEFPAL_BLACKOUT
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jr .got_palette

.pokemon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.got_palette
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSTitleScreen:
	ld hl, UnusedGSTitleBGPals
	ld de, wBGPals1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld hl, UnusedGSTitleOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, SCGB_GENERIC
	ld [wDefaultSGBLayout], a
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Generic:
	ld hl, DiplomaPalettes
	ld de, wBGPals1
	assert DiplomaPalettes + 8 palettes == PartyMenuOBPals
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, PalPacket_Generic + 1
	call CopyFourPalettes
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_UNOWN_PUZZLE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals1
	ld a, LOW(palred 31 + palgreen 0 + palblue 0)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 0 + palblue 0)
	ld [hl], a
	pop af
	ldh [rSVBK], a
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_TrainerCard:
	ld de, wBGPals1
	xor a ; ETHAN
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black

	ld hl, MainCardPals
	ld de, wBGPals1 palette 2
	ld bc, 3 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; chris
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; ethan
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB

	hlcoord 2, 15, wAttrmap
	lb bc, 2, 2
	ld a, $2
	call FillBoxCGB

	hlcoord 5, 15, wAttrmap
	lb bc, 2, 2
	ld a, $3
	call FillBoxCGB

	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

MainCardPals:
INCLUDE "gfx/trainer_card/main_card.pal"

_CGB_TrainerCardJohto:
	ld de, wBGPals1
	xor a ; ETHAN
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BUGSY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, WHITNEY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, MORTY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, CHUCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
;	ld a, JASMINE
;	call GetTrainerPalettePointer
;	call LoadPalette_White_Col1_Col2_Black
	ld a, PRYCE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black

	ld hl, MainCardPals
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, .JohtoBadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; ethan
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; ethan
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB

;	hlcoord 1, 8, wAttrmap
;	lb bc, 1, SCREEN_WIDTH -2
;	ld a, $7
;	call FillBoxCGB

	hlcoord 3, 10, wAttrmap
	lb bc, 3, 3
	ld a, $1 ; falkner
	call FillBoxCGB
	hlcoord 7, 10, wAttrmap
	lb bc, 3, 3
	ld a, $2 ; bugsy
	call FillBoxCGB
	hlcoord 11, 10, wAttrmap
	lb bc, 3, 3
	ld a, $3 ; whitney
	call FillBoxCGB
	hlcoord 15, 10, wAttrmap
	lb bc, 3, 3
	ld a, $4 ; morty
	call FillBoxCGB
	hlcoord 3, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; chuck
	call FillBoxCGB
	hlcoord 7, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; jasmine
	call FillBoxCGB
	hlcoord 11, 13, wAttrmap
	lb bc, 3, 3
	ld a, $6 ; pryce
	call FillBoxCGB
	; clair uses kris's palette
;	ld a, [wPlayerGender]
;	and a
;	push af
;	jr z, .got_gender3
	hlcoord 15, 13, wAttrmap
	lb bc, 3, 3
	ld a, $1
	call FillBoxCGB
;.got_gender3
;	pop af
;	ld c, $0
;	jr nz, .got_gender4
;	inc c
;.got_gender4
;	ld a, c
;	hlcoord 18, 1, wAttrmap
;	ld [hl], a
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.JohtoBadgePalettes:
INCLUDE "gfx/trainer_card/johto_badges.pal"

_CGB_TrainerCardKanto:
 	ld de, wBGPals1
	xor a ; ETHAN & MISTY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, LT_SURGE ; ERIKA
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, SABRINA
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, JANINE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BROCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
;	ld a, BLAINE
;	call GetTrainerPalettePointer
;	call LoadPalette_White_Col1_Col2_Black
	ld a, BLUE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black

	ld hl, MainCardPals
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	
	ld hl, .KantoBadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	
	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; ethan
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; ethan
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB

;	hlcoord 1, 8, wAttrmap
;	lb bc, 1, SCREEN_WIDTH -2
;	ld a, $7
;	call FillBoxCGB

	hlcoord 3, 10, wAttrmap ; 11, 10, wAttrmap
	lb bc, 3, 3
	ld a, $2 ; lt.surge / erika
	call FillBoxCGB
	hlcoord 7, 10, wAttrmap ; 7, 13, wAttrmap
	lb bc, 3, 3	
	ld a, $3 ; sabrina / blaine
	call FillBoxCGB
	hlcoord 11, 10, wAttrmap ; 7, 10, wAttrmap
	lb bc, 3, 3	
	ld a, $0 ; misty / ethan
	call FillBoxCGB
	hlcoord 15, 10, wAttrmap
	lb bc, 3, 3	
	ld a, $2 ; erika / lt.surge
	call FillBoxCGB
	hlcoord 3, 13, wAttrmap
	lb bc, 3, 3	
	ld a, $4 ; janine
	call FillBoxCGB
	hlcoord 7, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; brock
	call FillBoxCGB
	hlcoord 11, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; blaine / sabrina
	call FillBoxCGB
	hlcoord 15, 13, wAttrmap
	lb bc, 3, 3
	ld a, $6 ; blue
	call FillBoxCGB
	; top-right corner still uses the border's palette
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender3
	ld a, $0 ; ethan
.got_gender3
	hlcoord 18, 1, wAttrmap
	ld [hl], a
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.KantoBadgePalettes:
INCLUDE "gfx/trainer_card/kanto_badges.pal"

KantoCardPals:
INCLUDE "gfx/trainer_card/kanto_card.pal"

_CGB_MoveList:
	ld de, wBGPals1
	ld a, PREDEFPAL_GOLDENROD
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap

; Category Icon Pals
	ld hl, Moves + MOVE_TYPE
	ld a, [wCurSpecies]
	dec a
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	and ~TYPE_MASK ; Specific to Phys/Spec split
	swap a ; Specific to Phys/Spec split
	srl a  ; Specific to Phys/Spec split
	srl a  ; Specific to Phys/Spec split
	dec a  ; Specific to Phys/Spec split
	add a ; double the index
	add a ; quadrouple the index
	; since entries of CategoryIconPals are 4 bytes (2 colors, 2 bytes each) instead of normal 2 bytes (1 color) 
	ld hl, CategoryIconPals
	ld c, a
	ld b, 0
	add hl, bc
	ld de, wBGPals1 palette 2 + 2 ; slot 2 of pal 2
	ld c, 4 ; 2 colors (4 bytes)
	call LoadCPaletteBytesFromHLIntoDE

; Type Icon Pals
	ld hl, Moves + MOVE_TYPE
	ld a, [wCurSpecies]
	dec a
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	and TYPE_MASK
	ld c, a ; farcall will clobber a for the bank
	farcall GetMonTypeIndex
	ld a, c
	ld hl, TypeIconPals
	add a ; double the index, entries of TypeIconPals are 2 bytes (1 color). Same as a list of pointers
	ld c, a
	ld b, 0
	add hl, bc
	ld de, wBGPals1 palette 2 + 6 ; slot 4 of palette 2
	ld c, 2 ; 1 color (2 bytes)
	call LoadCPaletteBytesFromHLIntoDE

	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_5

; Type and Category tiles
	hlcoord 11, 12, wAttrmap
	ld bc, 8 ; area 1 Tile in HEIGHT, 8 Tiles in WIDTH
	ld a, $2 ; Palette 2
	call ByteFill
	
; fix left menu arrow, since we dont have left facing arrow
	hlcoord 16, 0, wAttrmap
	ld bc, 1 ; 1x1 Square
	xor a ; pal 0, default palette
	set 5, a ; flip on x axis
	call ByteFill	

	hlcoord 9, 0, wAttrmap
	ld bc, 1
	ld a, $3
	call ByteFill
	
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaPikachuMinigame:
	ld hl, PalPacket_BetaPikachuMinigame + 1
	call CopyFourPalettes
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_PokedexSearchOption:
	ld de, wBGPals1
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_PackPals:
; pack pals
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial_female

	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male

.tutorial_female
	ld hl, .KrisPackPals
	jr .got_gender

.male
	ld hl, .EthanPackPals

.got_gender
	ld de, wBGPals1
	ld bc, 4 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrmap

	hlcoord 0, 0, wAttrmap ; ◀▶ POCKET
	lb bc, 1, 10
	ld a, $0
	call FillBoxCGB

	hlcoord 10, 0, wAttrmap ; ▼▲ ITEMS
	lb bc, 1, 10
	ld a, $2
	call FillBoxCGB

	hlcoord 7, 2, wAttrmap ; red arrow
	lb bc, 9, 1
	ld a, $1
	call FillBoxCGB

	hlcoord 0, 3, wAttrmap ; pocket picture
	lb bc, 4, 5
	ld a, $2
	call FillBoxCGB

;	hlcoord 1, 8, wAttrmap ; item icon
;	lb bc, 3, 3
;	ld a, $3
;	call FillBoxWithByte

;	hlcoord 0, 7, wAttrmap
;	lb bc, 3, 5
;	ld a, $4
;	call FillBoxCGB
;	hlcoord 0, 3, wAttrmap
;	lb bc, 5, 5
;	ld a, $5
;	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.EthanPackPals:
INCLUDE "gfx/pack/pack.pal"

.KrisPackPals:
INCLUDE "gfx/pack/pack_f.pal"

_CGB_Pokepic:
	call _CGB_MapPals
	ld de, SCREEN_WIDTH
	hlcoord 0, 0, wAttrmap
	ld a, [wMenuBorderTopCoord]
.loop
	and a
	jr z, .found_top
	dec a
	add hl, de
	jr .loop

.found_top
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, PAL_BG_GRAY
	call FillBoxCGB
	call ApplyAttrmap
	ret

_CGB_MagnetTrain: ; unused
	ld hl, PalPacket_MagnetTrain + 1
	call CopyFourPalettes
	call WipeAttrmap
	hlcoord 0, 4, wAttrmap
	lb bc, 10, SCREEN_WIDTH
	ld a, PAL_BG_GREEN
	call FillBoxCGB
	hlcoord 0, 6, wAttrmap
	lb bc, 6, SCREEN_WIDTH
	ld a, PAL_BG_RED
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_GamefreakLogo:
	ld de, wBGPals1
	ld a, PREDEFPAL_GAMEFREAK_LOGO_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld hl, .GamefreakDittoPalette
	ld de, wOBPals1
	call LoadHLPaletteIntoDE
	ld hl, .GamefreakDittoPalette
	ld de, wOBPals1 palette 1
	call LoadHLPaletteIntoDE
	ret

.GamefreakDittoPalette:
INCLUDE "gfx/splash/ditto.pal"

_CGB_PlayerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

_CGB_Unused1E:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_IntroPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black

	ld hl, IntroGradientPalette
	ld de, wBGPals1 palette 1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	call WipeAttrmap

	hlcoord 0, 0, wAttrmap
	lb bc, 3, 20
	ld a, $1
	call FillBoxWithByte
	call ApplyAttrmap
	call ApplyPals
	ret

_CGB_IntroGenderPals:
	ld de, wBGPals1
	xor a ; ETHAN
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black

	ld hl, IntroGradientPalette
	ld de, wBGPals1 palette 2
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	call WipeAttrmap

	hlcoord 0, 0, wAttrmap
	lb bc, 3, 20
	ld a, $2
	call FillBoxWithByte

	hlcoord 13, 4, wAttrmap
	lb bc, 8, 5
	ld a, $1
	call FillBoxWithByte

	call ApplyAttrmap
	call ApplyPals
	ret

IntroGradientPalette:
INCLUDE "gfx/new_game/intro_gradient.pal"

_CGB_NamingScreen:
	ld hl, NamingScreenPalettes
	ld de, wBGPals1
	ld bc, 2 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	call WipeAttrmap

	hlcoord 0, 0, wAttrmap
	lb bc, 6, 20
	ld a, $1
	call FillBoxWithByte

	hlcoord 0, 15, wAttrmap
	lb bc, 3, 20
	ld a, $1
	call FillBoxWithByte

	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ret

NamingScreenPalettes:
INCLUDE "gfx/naming_screen/naming_screen.pal"

_CGB_BuyMenu:
	ld hl, MartMenuPals
.ok
	ld de, wBGPals1
	ld bc, 3 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	call WipeAttrmap

	hlcoord 6, 4, wAttrmap
	lb bc, 7, 1
	ld a, $2
	call FillBoxWithByte

;	hlcoord 1, 8, wAttrmap ; item icon
;	lb bc, 3, 3
;	ld a, $7
;	call FillBoxWithByte

	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ret

MartMenuPals:
INCLUDE "gfx/mart/mart.pal"

_CGB_TradeTube:
	ld hl, PalPacket_TradeTube + 1
	call CopyFourPalettes
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld de, wOBPals1 palette 7
	ld a, PREDEFPAL_TRADE_TUBE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

_CGB_TrainerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

_CGB_MysteryGift:
	ld hl, .MysteryGiftPalettes
	ld de, wBGPals1
	ld bc, 2 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	hlcoord 3, 7, wAttrmap
	lb bc, 8, 14
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 5, wAttrmap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 16, wAttrmap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 0, wAttrmap
	lb bc, 17, 2
	ld a, $1
	call FillBoxCGB
	hlcoord 18, 5, wAttrmap
	lb bc, 12, 1
	ld a, $1
	call FillBoxCGB
	call ApplyAttrmap
	ret

.MysteryGiftPalettes:
INCLUDE "gfx/mystery_gift/mystery_gift.pal"

GS_CGB_MysteryGift: ; unreferenced
	ld hl, .MysteryGiftPalette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	call ApplyAttrmap
	ret

.MysteryGiftPalette:
INCLUDE "gfx/mystery_gift/gs_mystery_gift.pal"

_CGB_Plain:
	ld b, 8
	ld de, wBGPals1
.loop
	ld hl, Gen1DiplomaPalette
	call LoadHLPaletteIntoDE
	dec b
	jr nz, .loop

	; de == wOBPals1
	ld hl, PokegearOBPals
	ld c, 8 palettes
	call LoadHLBytesIntoDE

	call WipeAttrmap
	jp ApplyAttrmap

Gen1DiplomaPalette:
INCLUDE "gfx/diploma/plain.pal" ; todo: replace this polished port

PokegearOBPals:
INCLUDE "gfx/icons/icons.pal" ; todo: replace this polished port
