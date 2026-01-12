Pokedex_PlaceAnimatedFrontpic:
	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a
	ld [wCurPartySpecies], a
	farcall Pokedex_GetSelectedMon
	call GetBaseData
	ld hl, wTempMonDVs
	predef GetUnownLetter
	ld bc, wTempSpecies
	call SetDefaultBGPAndOBP
	call .AnimateMon
	call SetDefaultBGPAndOBP
	ret

.AnimateMon:
	ld hl, wSummaryScreenFlags
	set 5, [hl]
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	hlcoord 2, 2
	
;;; Taken from _PrepMonFrontPic
	push hl
	ld de, vTiles2
	predef GetMonFrontpic
	pop hl
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wBoxAlignment], a

.get_animation
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a

	farcall Pokedex_LoadTextboxSpaceGFX
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	hlcoord 2, 2
	ld d, $0
	ld e, ANIM_MON_MENU
	predef LoadMonAnimation
	ld hl, wSummaryScreenFlags
	set 6, [hl]
	ret

Pokedex_PlayMonCry_AnimateFrontpic:
	xor a
	ld [wPokedexEntryType], a
.loop
	call .Pokedex_WaitAnim
	call .PokedexWaitCry
	ld a, [wPokedexEntryType]
	;bit 7, a
	cp 255
	jr nz, .loop
	xor a
	ld [wPokedexEntryType], a

	call WaitBGMap
	ret

.PokedexWaitCry:
	ld a, [wPokedexEntryType]
	inc a
	ld [wPokedexEntryType], a
	callfar PlaySpriteAnimations
	ret

.Pokedex_WaitAnim:
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
	ret
.finish
	ld hl, wSummaryScreenFlags
	res 5, [hl]
	farcall HDMATransferTilemapToWRAMBank3
	ret

Pokedex_PlaceBackPic:
	ld a, $1
	ldh [rVBK], a
	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a
	call GetBaseData
	ld hl, wTempMonDVs
	predef GetUnownLetter
	ld de, vTiles0 tile $d0
	predef GetMonBackpic
	ld a, $d0
	ldh [hGraphicStartTile], a
	lb bc, 6, 6
	hlcoord 12, 2
	predef PlaceGraphic

	ld a, $0
	ldh [rVBK], a
	ret

Pokedex_place_Mon_Icon:
	push af
	push bc
	push de
	push hl

IF USING_INCREASED_SPRITE_ANIMATION == FALSE
; sprite box border
	hlcoord 1, 13
	ld [hl], $70
	inc hl
	ld a, $72
	ld [hli], a
	ld [hli], a
	ld [hl], $70
	hlcoord 1, 14
	ld [hl], $71
	hlcoord 1, 15
	ld [hl], $71

	hlcoord 4, 14
	ld [hl], $71
	hlcoord 4, 15
	ld [hl], $71
	hlcoord 1, 16
	ld [hl], $70
	inc hl
	ld bc, 2
	ld a, $72
	call ByteFill
	ld [hl], $70
ENDC

; load the icon sprite
	ld a, 11
	ld [wSummaryScreenFlags], a
	xor a
	ldh [hObjectStructIndex], a
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_DEX
	rst FarCall
	farcall SetDexMonIconColor_SpritePage
	pop hl
	pop de
	pop bc
	pop af
	ret

Dex_Pics_DrawBorder:
	hlcoord 0, 0
	lb bc, 16, 18
	call Pokedex_Pics_Page_PlaceBorder

	hlcoord 1, 1
	lb bc, 7, 7
	call Pokedex_Pics_Page_PlaceInBorder

	hlcoord 11, 1
	lb bc, 6, 6
	call Pokedex_Pics_Page_PlaceInBorder

	hlcoord 1, 13
	lb bc, 2, 2
	call Pokedex_Pics_Page_PlaceInBorder

	hlcoord 10, 14
	; hlcoord 10, 17
	ld a, $41 ; START >
	ld [hli], a
	inc a ; ld a, $42 ; START >
	ld [hli], a
	inc a ; ld a, $43 ; START >
	ld [hli], a
;IF USING_INCREASED_SPRITE_ANIMATION == FALSE
	ld a, $62 ; > CRY 
	ld [hli], a
	inc a ; ld a, $63 ; > CRY [VRAM 1] @ 14, 17
	ld [hli], a

	hlcoord 10, 16
	ld a, $48 ; SELECT >
	ld [hli], a
	ld a, $49 ; SELECT >
	ld [hli], a
	ld a, $43 ; SELECT >
	ld [hli], a
	ld a, $44 ; > SHINY
	ld [hli], a
	ld a, $5f ; SHINY 2
	ld [hli], a
	inc a ; $60, SHINY 3
	ld [hli], a

	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	jr z, .caught_ball_done
	hlcoord 6, 10
	ld [hl], $4f ; pokeball icon
.caught_ball_done	
	hlcoord 4, 11
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	ld [hl], "<DEX_⁂>"
	jr .shiny_done
.not_shiny
	ld [hl], " "
.shiny_done
; SELECT > SHINY START > CRY
	
; up/down arrows	
	hlcoord 18, 0
	ld [hl], $3f
	; inc hl
	; ld [hl], $72
	hlcoord 18, 17
	ld [hl], $40
	ret

IF USING_INCREASED_SPRITE_ANIMATION == TRUE
cry_text:
	db "Cry@"
ENDC

Pokedex_Pics_Page_PlaceBorder:
	push hl
	ld a, $33
	ld [hli], a
	ld d, $34
	call .FillRow
	ld a, $35
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $36
	ld [hli], a
	ld d, $7f
	call .FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $38
	ld [hli], a
	ld d, $39
	call .FillRow
	ld a, $3a
	ld [hl], a
	ret

.FillRow:
	ld e, c
.row_loop
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .row_loop


Pokedex_Pics_Page_PlaceInBorder:
	push hl
	ld a, $75
	ld [hli], a
	ld d, $76
	call .FillRow
	ld a, $77
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $78
	ld [hli], a
	ld d, $7f
	call .FillRow
	ld a, $79
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $7a
	ld [hli], a
	ld d, $7b
	call .FillRow
	ld a, $7c
	ld [hl], a
	ret

.FillRow:
	ld e, c
.row_loop
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .row_loop
