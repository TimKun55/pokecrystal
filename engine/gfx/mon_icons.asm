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


GetMenuMonIconPalette:
	ld c, l
	ld b, h
	farcall CheckShininess
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
	ld a, [wCurIconTile]
	call GetMiniGFX
	call AdvanceMiniTile
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
	call GetMiniNoItem
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
	call GetMiniNoItem
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
	ld a, [wUnownLetter]
	ld [wCurIconForm], a
	ld de, 0
	ld a, [wCurIconTile]
	call GetMiniNoItem
	call AdvanceMiniTile
	jr .mini_done
.normal_mini
	ld de, wTempMonDVs
	ld a, [wCurIconTile]
	call GetMiniNoItem
	call AdvanceMiniTile
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
	ld b, BANK(PokemonPalettes)
	ld c, BANK(wOBPals1)
	call CopyMiniPaletteBytes
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
	ld a, [wCurIconTile]
	call GetMiniNoItem
	call AdvanceMiniTile
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .skip_form
	ld a, [wUnownLetter]
	ld [wCurIconForm], a
.skip_form
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
	ld b, BANK(PokemonPalettes)
	ld c, BANK(wOBPals1)
	ld de, wOBPals1 + 2
	call CopyMiniPaletteBytes
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


HeldItemIcons:
INCBIN "gfx/summary/mail.2bpp"
INCBIN "gfx/summary/item.2bpp"


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

GetMiniNoItem:
; Load the mini for wCurIcon into VRAM starting from tile a (8 tiles, no held item).
; de = DVs
	ld l, a
	ld h, 0
	jp GetMini

AdvanceMiniTile:
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

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
	ld a, d
	or e
	jr nz, .have_dvs
	ld a, [wCurIconForm]
	jr .got_form
.have_dvs
	ld l, e
	ld h, d
	predef GetUnownLetter
	ld a, [wUnownLetter]
.got_form
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
	ld b, BANK(PokemonPalettes)
	ld c, BANK(wOBPals1)
	ld de, wOBPals1 + 4 * 8 + 2
	call CopyMiniPaletteBytes
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
	ld a, [wCurIcon]
	cp ICON_UNOWN
	jr nz, .skip_form
	ld a, [wUnownLetter]
	ld [wCurIconForm], a
.skip_form
	call FlyMap_LoadSilhouetteGFX
	ret

FlyMap_LoadSilhouetteGFX:
; Loads the mask for wCurIcon (wCurIconForm for Unown) to vTiles0 tile $18.
	call LoadStorageMask
	ld c, 8
	ld hl, vTiles0 tile $18
	call Get2bppViaHDMA
	ret

FlyMap_SetMiniPalette::
; Gives the picker's mini OBJ palette 4. Call after PokegearOBPals has been copied.
	call FlyMap_FindMiniStruct
	jr nc, .not_found
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
	ld b, BANK(PokemonPalettes)
	ld c, BANK(wOBPals2)
	ld de, wOBPals2 + 4 * 8 + 2
	call CopyMiniPaletteBytes
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
.not_found
	ret

FlyMap_FindMiniStruct::
; Returns carry set and hl = sprite struct with tile id $08 if found.
; d = number of active structs before it. Carry clear (hl = 0) if not found.
; Preserves bc.
	ld hl, wSpriteAnimationStructs
	ld d, 0
	ld e, NUM_SPRITE_ANIM_STRUCTS
.loop
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
	cp $08
	jr z, .found
	inc d
.inactive
	ld a, l
	add SPRITEANIMSTRUCT_LENGTH
	ld l, a
	jr nc, .next
	inc h
.next
	dec e
	jr nz, .loop
	or a
	ld hl, 0
	ret
.found
	scf
	ret

CopyMiniPaletteBytes::
; Copy 4 bytes from bank b:hl to de, with de in WRAM bank c.
; Preserves b? b is source bank (used in loop); c is overwritten (dest bank).
	ldh a, [rWBK]
	push af
	ld a, c
	ldh [rWBK], a
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, b
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	pop af
	ldh [rWBK], a
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


Trade_LoadMonMask::
; Loads the full 8-tile mask for wCurIcon (wCurIconForm for Unown) to tile $6A,
; and sets OBJ palette 6 colour 3 to white in wOBPals2 for the trade animation.
	call LoadStorageMask
	ld c, 8
	ld hl, vTiles0 tile $50
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

; ---- Trainer info (Actual Stats page) minis --------------------------------
; Player's battle mon: OBJ palette 4, tiles $40-$47, top-left of the player box.
; Enemy's battle mon:  OBJ palette 5, tiles $50-$57, top-left of the enemy box.

DEF TRAINER_INFO_PLAYER_TILE EQU $40
DEF TRAINER_INFO_ENEMY_TILE  EQU $50

TrainerInfo_ShowMinis::
	callfar ClearSpriteAnims2
	call TrainerInfo_ShowPlayerMini
	jp TrainerInfo_ShowEnemyMini

TrainerInfo_ShowPlayerMini:
	ld a, [wBattleMonSpecies]
	ld [wCurIcon], a
	ld de, wBattleMonDVs
	ld a, TRAINER_INFO_PLAYER_TILE
	call GetMiniNoItem                ; 8 tiles from $40, DVs in de
	ld d, $38                         ; y: row 7
	ld e, $20                         ; x: column 4
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct        ; bc = struct
	ret c                             ; no free struct: give up
	ld hl, wBattleMonDVs
	ld d, 4
	ld e, TRAINER_INFO_PLAYER_TILE
	jp TrainerInfo_FinishMini

TrainerInfo_ShowEnemyMini:
	ld a, [wEnemyMonSpecies]
	ld [wCurIcon], a
	ld de, wEnemyMonDVs
	ld a, TRAINER_INFO_ENEMY_TILE
	call GetMiniNoItem
	ld d, $38                         ; y: row 7
	ld e, $70                         ; x: column 14
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ret c                             ; no free struct: give up
	ld hl, wEnemyMonDVs
	ld d, 5
	ld e, TRAINER_INFO_ENEMY_TILE
; fallthrough
; bc = sprite struct, hl = DV pointer, d = OBJ palette, e = first tile
TrainerInfo_FinishMini:
	push hl
	push de
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	call TrainerInfo_SetOAMSlot       ; sets hObjectStructIndex from bc
	pop de
	pop hl
	ld a, [wCurIcon]
	jp TrainerInfo_SetMiniPalette

; bc = sprite struct. hObjectStructIndex = number of active structs before it.
TrainerInfo_SetOAMSlot:
	ld hl, wSpriteAnimationStructs
	ld d, 0
.count
	ld a, h
	cp b
	jr nz, .not_this
	ld a, l
	cp c
	jr z, .counted
.not_this
	ld a, [hl]
	and a
	jr z, .inactive
	inc d
.inactive
	ld a, l
	add SPRITEANIMSTRUCT_LENGTH
	ld l, a
	jr nc, .count
	inc h
	jr .count
.counted
	ld a, d
	ldh [hObjectStructIndex], a
	ret

; a = species, hl = DV pointer, d = OBJ palette number
; Same colour copy as NamingScreen_SetMiniPalette, but for any palette and
; shiny is decided by these DVs, not by the Pokedex toggle.
TrainerInfo_SetMiniPalette:
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, PokemonPalettes
	add hl, de
	pop bc                            ; bc = DV pointer
	push hl
	farcall CheckShininess            ; carry = shiny
	pop hl
	jr nc, .not_shiny
	ld de, 4
	add hl, de
.not_shiny
	pop de                            ; d = palette number
	push de
	push hl                           ; source
	ld a, d
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, wOBPals1 + 2
	add hl, de
	ld d, h
	ld e, l                           ; de = destination
	pop hl
	ld b, BANK(PokemonPalettes)
	ld c, BANK(wOBPals1)
	call CopyMiniPaletteBytes
	pop de                            ; d = palette number
	push de
	ld a, d
	add a
	add a
	add a                             ; a = palette * 8
	ld e, a
	ld d, 0
	ld hl, wOBPals1 + 6               ; colour 3 of the palette
	add hl, de
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rWBK], a
	xor a
	ld [hli], a                       ; black, low byte
	ld [hl], a                        ; black, high byte
	pop af
	ldh [rWBK], a
	pop de
	ld a, d
	call Pokedex_SetMiniPalette       ; uses hObjectStructIndex
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

; Deactivates both minis and clears OAM. Called on page change and on exit.
TrainerInfo_HideMinis::
	ld hl, wSpriteAnimationStructs
	ld e, NUM_SPRITE_ANIM_STRUCTS
.loop
	ld a, [hl]
	and a
	jr z, .next
	push hl
	ld bc, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld a, [hl]
	pop hl
	cp TRAINER_INFO_PLAYER_TILE
	jr z, .deactivate
	cp TRAINER_INFO_ENEMY_TILE
	jr nz, .next
.deactivate
	xor a
	ld [hl], a
.next
	ld a, l
	add SPRITEANIMSTRUCT_LENGTH
	ld l, a
	jr nc, .no_carry
	inc h
.no_carry
	dec e
	jr nz, .loop
	jp ClearSprites

INCLUDE "data/pokemon/menu_icon_pals.asm"

INCLUDE "data/pokemon/icon_pointers.asm"

INCLUDE "data/pokemon/unown_icon_pointers.asm"

INCLUDE "data/pokemon/mini_icon_pointers.asm"
