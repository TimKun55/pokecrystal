LoadOverworldMonIcon:
	ld a, e
	ld [wCurIcon], a
	cp ICON_UNOWN
	jr nz, .not_unown

	ld a, [wCurIconForm]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, UnownIconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	lb bc, BANK("Unown Icons"), 8
	ret

.not_unown
	; fallthrough
_LoadOverworldMonIcon:
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	jp GetIconBank

SetMenuMonIconColor:
	push hl
	push de
	push bc
	push af

	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	call GetMenuMonIconPalette
	ld hl, wShadowOAMSprite00Attributes
	jp _ApplyMenuMonIconColor

SetMenuMonIconColor_NoShiny:
	push hl
	push de
	push bc
	push af

	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	and a
	call GetMenuMonIconPalette_PredeterminedShininess
	ld hl, wShadowOAMSprite00Attributes
	jp _ApplyMenuMonIconColor

LoadPartyMenuMonIconColors:
	push hl
	push de
	push bc
	push af

	ld a, [wPartyCount]
	sub c
	ld [wCurPartyMon], a
	ld e, a
	ld d, 0

	ld hl, wPartyMon1Item
	call GetPartyLocation
	ld a, [hl]
	ld [wCurIconMonHasItemOrMail], a

	ld a, [wCurPartyMon]
	add 2 ; mon minis use palette [wCurPartyMon]+2
	push af
	ld a, [wCurPartyMon]
	swap a
	ld e, a
	ld d, 0
	ld hl, wShadowOAMSprite00Attributes
	add hl, de
	pop af

	ld de, 4
	ld [hl], a ; top left
	add hl, de
	ld [hl], a ; top right
	add hl, de
	ld [hl], a ; bottom right
	add hl, de
	ld [hl], a ; bottom left
	ld a, [wCurIconMonHasItemOrMail]
	and a
	jr z, _FinishMenuMonIconColor
	ld de, -4
	add hl, de
	xor a ; item or mail uses palette 0
	ld [hl], a
	jr _FinishMenuMonIconColor

_ApplyMenuMonIconColor:
	ld c, 4
	ld de, 4
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	; fallthrough
_FinishMenuMonIconColor:
	pop af
	pop bc
	pop de
	pop hl
	ret

GetMonPalInBCDE:
; Sets BCDE to mon icon palette.
; Input: c = species, b = shininess (1=true, 0=false)
	ld hl, MonMenuIconPals
	dec c

	; This sets z if mon is shiny.
	dec b
	ld b, 0
	add hl, bc
	ld a, [hl]
	jr z, .shiny
	swap a
.shiny
	and $f

	; Now we have the target color. Get the palette (+ 2 to avoid white).
	ld hl, PartyMenuOBPals + 2
	ld bc, 1 palettes
	call AddNTimes

	push hl
	ld a, BANK(PartyMenuOBPals)
	call GetFarWord
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	ld a, BANK(PartyMenuOBPals)
	call GetFarWord
	ld d, h
	ld e, l
	ret

GetMenuMonIconPalette:
	ld c, l
	ld b, h
	farcall CheckShininess
GetMenuMonIconPalette_PredeterminedShininess:
	push af
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, MonMenuIconPals
	add hl, bc
	ld e, [hl]
	pop af
	ld a, e
	jr c, .shiny
	swap a
.shiny
	and $f
	ld e, a
	ret

LoadMenuMonIcon:
	push hl
	push de
	push bc
	call .LoadIcon
	pop bc
	pop de
	pop hl
	ret

.LoadIcon:
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to MONICON_* constants
	dw PartyMenu_InitAnimatedMonIcon    ; MONICON_PARTYMENU
	dw NamingScreen_InitAnimatedMonIcon ; MONICON_NAMINGSCREEN
	dw MoveList_InitAnimatedMonIcon     ; MONICON_MOVES
	dw Trade_LoadMonIconGFX             ; MONICON_TRADE
	dw Pokedex_InitAnimatedMonIcon      ; MONICON_DEX

PartyMenu_InitAnimatedMonIcon:
	call InitPartyMenuIcon
	call .SpawnItemIcon
	call SetPartyMonIconAnimSpeed
	ret

.SpawnItemIcon:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callfar ItemIsMail
	pop bc
	pop hl
	jr c, .mail
	ld a, SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM
	jr .got_frameset

.mail
	ld a, SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL
.got_frameset
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

InitPartyMenuIcon:
	call LoadPartyMenuMonIconColors
	ld a, [wCurIconTile]
	push af
	ldh a, [hObjectStructIndex]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	push hl
	ld [wCurIcon], a
	pop hl
	ld a, MON_DVS
	call GetPartyParamLocation
	ld e, l
	ld d, h
	call GetMemMiniGFX
	ldh a, [hObjectStructIndex]
; y coord
	add a
	add a
	add a
	add a
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	pop af
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	ret

SetPartyMonIconAnimSpeed:
	push bc
	ldh a, [hObjectStructIndex]
	ld b, a
	call .getspeed
	ld a, b
	pop bc
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ret

.getspeed
	farcall PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, .speeds
	add hl, de
	ld b, [hl]
	ret

.speeds
	db $00 ; HP_GREEN
	db $40 ; HP_YELLOW
	db $80 ; HP_RED

NamingScreen_InitAnimatedMonIcon:
	xor a
	ldh [hObjectStructIndex], a       ; the mini is the first sprite on this screen
	ld hl, wTempMonDVs
	ld b, h
	ld c, l
	ld a, [wTempIconSpecies]
	call NamingScreen_SetMiniPalette
	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	ld de, wTempMonDVs
	xor a
	call GetMiniGFX
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ret

MoveList_InitAnimatedMonIcon:
	ld a, MON_DVS
	call GetPartyParamLocation
	push hl
	ld b, h
	ld c, l
	ld a, [wTempIconSpecies]
	ld e, a
	farcall LoadMoveMenuMonPalette
	ld a, 1 ; mini uses OBJ palette 1
	ld hl, wShadowOAMSprite00Attributes
	ld de, 4
	ld c, 4
.set_palette
	ld [hl], a
	add hl, de
	dec c
	jr nz, .set_palette
	pop hl
	ld a, [wTempIconSpecies]
	push hl
	pop de
	ld [wCurIcon], a
	xor a
	call GetMiniGFX
	ld d, 3 * TILE_WIDTH + 2 ; depixel 3, 4, 2, 4
	ld e, 4 * TILE_WIDTH + 4
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ret

Pokedex_InitAnimatedMonIcon:
	ld a, [wCurPartySpecies]
	push af
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a

	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	cp ICON_UNOWN
	jr nz, .normal_mini
	farcall Pokedex_SetUnownLetter
	call Pokedex_LoadUnownMiniGFX
	jr .mini_done
.normal_mini
	ld de, wTempMonDVs
	call GetMemMiniGFX
.mini_done

	ld a, [wSummaryScreenFlags]
	cp 11
	jr nz, .evo_page
	ld a, -1
	ld [wSummaryScreenFlags], a
	ld d, $88
	ld e, $20
	jr .setxdone
.evo_page
	ld a, [wSummaryScreenFlags]
	inc a
; y coord
	ld c, 32
	call SimpleMultiply
	add $28
	ld d, a
; x coord
	ld e, $19
.setxdone
; type is partymon icon
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct

	ld a, [wCurIconTile]
	sub 10
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL

	; OAM slot = number of active sprite structs before this one
	ld hl, wSpriteAnimationStructs
	ld d, 0
.count_structs
	ld a, h
	cp b
	jr nz, .not_this_struct
	ld a, l
	cp c
	jr z, .counted
.not_this_struct
	ld a, [hl]
	and a
	jr z, .inactive_struct
	inc d
.inactive_struct
	ld a, l
	add SPRITEANIMSTRUCT_LENGTH
	ld l, a
	jr nc, .count_structs
	inc h
	jr .count_structs
.counted
	ld a, d
	ldh [hObjectStructIndex], a

	; mini palette: Pics uses OBJ palette 4, Evo slot n uses palette n+4
	ld a, [wSummaryScreenFlags]
	cp -1
	ld a, 4
	jr z, .mini_palette
	ld a, [wSummaryScreenFlags]
	add 5
.mini_palette
	ld b, a
	ld a, [wTempIconSpecies]
	call Pokedex_ApplyMiniPalette

	pop af
	ld [wCurPartySpecies], a
	ret

; ---- Pokedex minis --------------------------------------------------------
; The mini takes OBJ palette N (4 on Pics, 4-7 for Evo slots 0-3).
; InitPartyMenuOBPals rewrites all of wOBPals1 on each layout load, so the
; Pics page calls Pokedex_ReapplyPicsMini after each one.

Pokedex_ReapplyPicsMini::
	xor a
	ldh [hObjectStructIndex], a
	ld a, [wTempIconSpecies]
	ld b, 4
Pokedex_ApplyMiniPalette:
; a = species, b = OBJ palette number
	push bc
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl                        ; 8 bytes per species entry
	ld bc, PokemonPalettes
	add hl, bc                        ; hl = palette entry for species a
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	ld de, 4
	add hl, de
.not_shiny
	pop bc                            ; b = palette number
	ld a, b
	push af                           ; keep palette number for the sprite
	push hl                           ; keep source address
	ld a, b
	add a
	add a
	add a                             ; 8 bytes per palette
	ld e, a
	ld d, 0
	ld hl, wOBPals1 + 2
	add hl, de
	ld d, h
	ld e, l                           ; de = destination
	pop hl                            ; hl = source address
	ld c, 4                           ; 4 bytes = the mon's two colours
	ld b, BANK(PokemonPalettes)
	ldh a, [rWBK]
	push af                           ; save the current WRAM bank
	ld a, BANK(wOBPals1)
	ldh [rWBK], a                     ; select the palette buffer's bank
.copy
	ld a, b
	call GetFarByte                   ; a = byte at bank b : hl, preserves hl
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .copy
	pop af
	ldh [rWBK], a                     ; restore the WRAM bank
	pop af                            ; a = palette number
	push af
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, wOBPals1
	add hl, de
	ld c, 4
.paint
	ld a, $1f
	ld [hli], a
	xor a
	ld [hli], a
	dec c
	jr nz, .paint
	pop af
	call Pokedex_SetMiniPalette
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

Pokedex_SetMiniPalette:
; a = OBJ palette number
	push hl
	push de
	push bc
	push af
	ld hl, wShadowOAMSprite00Attributes
	push af                    ; keep palette number, ldh below overwrites a
	ldh a, [hObjectStructIndex]
	swap a
	ld d, 0
	ld e, a
	add hl, de
	pop af
	jp _ApplyMenuMonIconColor

Trade_LoadMonIconGFX:
	; hl = wPlayerTrademonDVs or wOTTrademonDVs
	ld h, b
	ld l, c
	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	ld [wCurIcon], a
	push hl
	ld b, h
	ld c, l
	ld a, [wTempIconSpecies]
	call Trade_SetMiniPalette
	pop hl
	ld a, $40
	ld [wCurIconTile], a
	ld de, wTempMonDVs
	call GetMemMiniGFX
	call Trade_LoadMonMask
	ret

Trade_SetMiniPalette:
; a = species, bc = DV pointer. Writes the mini's colours to OBJ palette 0.
	push bc
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl                        ; 8 bytes per species entry
	ld de, PokemonPalettes
	add hl, de                        ; hl = palette entry for species a
	pop bc                            ; bc = DV pointer
	push hl
	farcall CheckShininess            ; carry = shiny, from DVs in bc
	pop hl
	jr nc, .not_shiny
	ld de, 4
	add hl, de
.not_shiny
	ld c, 4                           ; 4 bytes = the mon's two colours
	ld b, BANK(PokemonPalettes)
	ld de, wOBPals1 + 2               ; OBJ palette 0, colours 1-2
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rWBK], a
.copy
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .copy
	pop af
	ldh [rWBK], a
	; paint colour 0 white and colour 3 black for palette 0 (colours 1-2 are the mon's)
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rWBK], a
	ld hl, wOBPals1
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hl], a
	ld hl, wOBPals1 + 6
	ld a, $00
	ld [hli], a
	ld [hl], a
	pop af
	ldh [rWBK], a
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

GetSpeciesIcon:
; Load species icon into VRAM at tile a
	push de
	ld a, MON_DVS
	call GetPartyParamLocation
	call SetMenuMonIconColor
	ld a, [wTempIconSpecies]
	push hl
	pop hl
	ld [wCurIcon], a
	pop de
	ld a, e
	ld e, l
	ld d, h
	call GetIconGFX
	ret

FlyFunction_GetMonIcon:
	push de
	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	pop de
	ld a, e
	call GetIcon_a
; fallthrough
SetOWFlyMonColor:
	; Edit the OBJ 0 palette so that the cursor Pokémon has the right colors.
	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	ld a, MON_DVS
	call GetPartyParamLocation
	call GetMenuMonIconPalette
	add a
	add a
	add a
	ld e, a
	farcall SetFirstOBJPalette
	ret

GetMemIconGFX:
	ld a, [wCurIconTile]
GetIconGFX:
	call GetIcon_a
	ld de, 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call Get2bppViaHDMA
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	call Trade_LoadMonMask
	ret

HeldItemIcons:
INCBIN "gfx/summary/mail.2bpp"
INCBIN "gfx/summary/item.2bpp"

GetIcon_de:
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a:
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon:
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	push de
	ld de, vTiles0
	add hl, de
	pop de
	push hl

	push hl
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .not_unown
	ld l, e
	ld h, d
	predef GetUnownLetter
	ld a, [wUnownLetter]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, UnownIconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	lb bc, BANK("Unown Icons"), 8
	pop hl
	jr .continue

.not_unown
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	call GetIconBank
.continue
	call Get2bppViaHDMA
	pop hl
	ret

GetIconBank:
	ld a, [wCurIcon]
	cp MAGIKARP ; first species in "Mon Icons 2"
	lb bc, BANK("Mon Icons 1"), 8
	ret c
	ld b, BANK("Mon Icons 2")
	ret

GetMemMiniGFX:
	ld a, [wCurIconTile]
	call GetMiniGFX
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

GetMiniGFX:
; Load the mini for wCurIcon into VRAM starting from tile a, followed by the held item tiles.
; de = DVs
	ld l, a
	ld h, 0
	call GetMini
	ld de, 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	jp Get2bppViaHDMA

GetMini:
; Load mini graphics for wCurIcon into VRAM starting from tile hl.
; de = DVs, used to pick the Unown form.
rept 4
	add hl, hl
endr
	push de
	ld de, vTiles0
	add hl, de
	pop de
	push hl

	push hl
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .not_unown
	ld l, e
	ld h, d
	predef GetUnownLetter
	ld a, [wUnownLetter]
	ld l, a
	ld h, 0
	ld de, MiniUnownPointers
	jr .got_index

.not_unown
	ld l, a
	ld h, 0
	ld de, MiniIconPointers

.got_index
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld c, 8
	pop hl
	call Get2bppViaHDMA
	pop hl
	ret

GetStorageIcon_a:
; Load frame 1 icon graphics into VRAM starting from tile a
	ld l, a ; no-optimize hl|bc|de = a * 16 (rept)
	ld h, 0
rept 4
	add hl, hl
endr
	ld de, vTiles0
	add hl, de
	; fallthrough
GetStorageIcon:
	push hl
	call LoadStorageMini
	pop hl
	newfarjp BillsPC_SafeGet2bpp

LoadStorageMini:
; Output: b = bank, de = frame 1 of the mini for wCurIcon (wCurIconForm for Unown), c = 4 tiles
	ld de, MiniIconPointers
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .got_index
	ld de, MiniUnownPointers
	ld a, [wCurIconForm]
.got_index
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld c, 4
	ret

FreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wMenuCursorY]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, SPRITE_ANIM_FUNC_NULL
	jr .ok

.loadwithtwo
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SWITCH

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

UnfreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
.loop
	ld a, [hl]
	and a
	jr z, .next
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_PARTY_MON
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

HoldSwitchmonIcon:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wSwitchMon]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .is_switchmon
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SELECTED
	jr .join_back

.is_switchmon
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SWITCH
.join_back
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

Pokedex_SetUnownLetter::
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .ok
	inc a                             ; no Unown seen yet: show A
.ok
	ld [wUnownLetter], a
	ret

Pokedex_LoadUnownMiniGFX:
; Loads the Unown mini for wUnownLetter (already set) into VRAM at
; wCurIconTile, followed by the held-item tiles, then advances wCurIconTile.
	ld a, [wCurIconTile]
	ld l, a
	ld h, 0
rept 4
	add hl, hl
endr
	ld de, vTiles0
	add hl, de
	push hl                          ; destination for the mini
	ld a, [wUnownLetter]
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc                       ; hl = letter * 3
	ld de, MiniUnownPointers
	add hl, de
	ld a, [hli]
	ld b, a                          ; bank of the mini data
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a                          ; de = mini data
	pop hl                           ; hl = destination
	ld c, 8
	call Get2bppViaHDMA
	ld de, 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call Get2bppViaHDMA
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

NamingScreen_SetMiniPalette:
; a = species, bc = DV pointer. Writes the mini's colours to OBJ palette 4
; and points the icon at palette 4.
	push bc
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl                        ; 8 bytes per species entry
	ld de, PokemonPalettes
	add hl, de                        ; hl = palette entry for the species
	pop bc                            ; bc = DV pointer
	push hl
	farcall CheckShininess            ; carry = shiny, from the DVs in bc
	pop hl
	jr nc, .not_shiny
	ld de, 4
	add hl, de
.not_shiny
	ld c, 4                           ; 4 bytes = the mon's two colours
	ld b, BANK(PokemonPalettes)
	ld de, wOBPals1 + 4 * 8 + 2       ; OBJ palette 4, colours 1-2
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rWBK], a
.copy
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .copy
	pop af
	ldh [rWBK], a
	ld a, 4
	call Pokedex_SetMiniPalette
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

FlyMap_LoadMiniGFX::
; Loads the party mon's mini to tile $08 and its silhouette mask to tile $18.
	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	ld a, MON_DVS
	call GetPartyParamLocation
	ld de, wTempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, 8                          ; mini tile index
	ld de, wTempMonDVs
	call GetMini
	call FlyMap_LoadSilhouetteGFX
	ret

FlyMap_LoadSilhouetteGFX:
; Loads the mask for wCurIcon (or wUnownLetter for Unown) to vTiles0 tile $18.
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr z, .unown
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc                        ; hl = index * 3
	ld de, MiniMaskPointers
	jr .got_entry
.unown
	ld a, [wUnownLetter]
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc                        ; hl = letter * 3
	ld de, MiniUnownMaskPointers
.got_entry
	add hl, de
	ld a, [hli]
	ld b, a                           ; bank of the mask data
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a                           ; de = mask data
	ld hl, vTiles0 tile $18
	ld c, 8
	call Get2bppViaHDMA
	ret

FlyMap_SetMiniPalette::
; Gives the picker's mini OBJ palette 4. Call after PokegearOBPals has been copied.
	ld hl, wSpriteAnimationStructs
	ld d, 0                           ; active structs before this one = OAM slot
	ld b, NUM_SPRITE_ANIM_STRUCTS
.find
	ld a, [hl]
	and a
	jr z, .inactive
	push hl
	push bc
	ld bc, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	cp 8
	jr z, .found
	inc d
.inactive
	ld a, l
	add SPRITEANIMSTRUCT_LENGTH
	ld l, a
	jr nc, .next
	inc h
.next
	dec b
	jr nz, .find
	ret                               ; no mini found
.found
	ld a, d
	ldh [hObjectStructIndex], a
	ld a, [wTempIconSpecies]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, PokemonPalettes
	add hl, de
	ld bc, wTempMonDVs
	push hl
	farcall CheckShininess            ; carry = shiny, from the DVs in bc
	pop hl
	jr nc, .not_shiny
	ld de, 4
	add hl, de
.not_shiny
	ld c, 4
	ld b, BANK(PokemonPalettes)
	ld de, wOBPals2 + 4 * 8 + 2       ; OBJ palette 4, colours 1-2
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rWBK], a
.copy
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .copy
	pop af
	ldh [rWBK], a
	ld a, 4
	call Pokedex_SetMiniPalette
	ldh a, [hObjectStructIndex]
	inc a                             ; the silhouette is the sprite after the mini
	ldh [hObjectStructIndex], a
	ld a, 5
	call Pokedex_SetMiniPalette
	ld hl, wOBPals2 + 5 * 8 + 6       ; palette 5, colour 3 = white
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rWBK], a
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hl], a
	pop af
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

LoadStorageMask::
; Output: b = bank, de = mask frame 1 for wCurIcon (wCurIconForm for Unown), c = 4 tiles
	ld de, MiniMaskPointers
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .got_table
	ld de, MiniUnownMaskPointers
	ld a, [wCurIconForm]
.got_table
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc                        ; hl = index * 3
	add hl, de
	ld a, [hli]
	ld b, a                           ; bank of the mask data
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a                           ; de = mask data
	ld c, 4                           ; frame 1 only
	ret

Trade_CompositeMiniMask:
; Composite the mini's mask into its VRAM tiles so that transparent
; pixels inside the silhouette become opaque white (palette colour 3).
; Mini is expected at vTiles0 tile $62 (8 tiles); mask from MiniMaskPointers.
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .not_unown
	ld de, MiniUnownMaskPointers
	ld a, [wCurIconForm]
	jr .got
.not_unown
	ld de, MiniMaskPointers
	ld a, [wCurIcon]
.got
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc                 ; *3
	add hl, de
	ld a, [hli]
	ld b, a                    ; b = mask bank
	ld a, [hli]
	ld h, [hl]
	ld l, a                    ; hl = mask ptr
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld de, vTiles0 tile $62    ; de = mini VRAM ptr
	ld c, 64                   ; 8 tiles * 8 rows
.row_loop
	ld a, [hl]
	ld b, a                    ; b = mask low
	inc hl
	ld a, [hl]
	or b                       ; a = mask low | mask high = maskFg
	ld b, a                    ; b = maskFg
	inc hl
	push hl                    ; save mask ptr
	ld a, [de]
	ld h, a                    ; h = mini low
	inc de
	ld a, [de]
	or h                       ; a = mini low | mini high
	cpl                        ; a = ~(mini low | mini high)
	and b                      ; a = to_set
	ld b, a                    ; b = to_set
	dec de
	ld a, [de]
	or b
	ld [de], a                 ; mini low |= to_set
	inc de
	ld a, [de]
	or b
	ld [de], a                 ; mini high |= to_set
	inc de
	pop hl                     ; restore mask ptr
	dec c
	jr nz, .row_loop
	pop af
	rst Bankswitch
	ret

Trade_LoadMonMask::
; Loads the full 8-tile mask for wCurIcon (wCurIconForm for Unown) to tile $6A,
; and sets OBJ palette 6 colour 3 to white in wOBPals2 for the trade animation.
	ld de, MiniMaskPointers
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .got_table
	ld de, MiniUnownMaskPointers
	ld a, [wCurIconForm]
.got_table
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, vTiles0 tile $50
	ld c, 8
	call Request2bpp

	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rSVBK], a
	ld hl, wOBPals2 palette 6 + 6
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hl], a
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

INCLUDE "data/pokemon/menu_icons.asm"

INCLUDE "data/pokemon/menu_icon_pals.asm"

INCLUDE "data/pokemon/icon_pointers.asm"

INCLUDE "data/pokemon/unown_icon_pointers.asm"

INCLUDE "data/pokemon/mini_icon_pointers.asm"
