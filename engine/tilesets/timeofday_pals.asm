DummyPredef35:
DummyPredef36:
	ret

UpdateTimeOfDayPal::
	call UpdateTime
	ld a, [wTimeOfDay]
	ld [wCurTimeOfDay], a
	call GetTimePalette
	ld [wTimeOfDayPal], a
	ret

_TimeOfDayPals::
; return carry if pals are changed

; forced pals?
	ld hl, wTimeOfDayPalFlags
	bit 7, [hl]
	jr nz, .dontchange

; do we need to bother updating?
	ld a, [wTimeOfDay]
	ld hl, wCurTimeOfDay
	cp [hl]
	jr z, .dontchange

; if so, the time of day has changed
	ld a, [wTimeOfDay]
	ld [wCurTimeOfDay], a

; get palette id
	call GetTimePalette

; same palette as before?
	ld hl, wTimeOfDayPal
	cp [hl]
	jr z, .dontchange

; update palette id
	ld [wTimeOfDayPal], a

; save bg palette 7
	ld hl, wBGPals1 palette PAL_BG_TEXT

; save wram bank
	ldh a, [rSVBK]
	ld b, a

	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; push palette
	ld c, NUM_PAL_COLORS
.push
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push de
	dec c
	jr nz, .push

; restore wram bank
	ld a, b
	ldh [rSVBK], a

; update sgb pals
	ld b, SCGB_MAPPALS
	call GetSGBLayout

; restore bg palette 7
	ld hl, wOBPals1 - 1 ; last byte in wBGPals1

; save wram bank
	ldh a, [rSVBK]
	ld d, a

	ld a, BANK(wOBPals1)
	ldh [rSVBK], a

; pop palette
	ld e, NUM_PAL_COLORS
.pop
	pop bc
	ld [hl], c
	dec hl
	ld [hl], b
	dec hl
	dec e
	jr nz, .pop

; restore wram bank
	ld a, d
	ldh [rSVBK], a

; update palettes
	call _UpdateTimePals
	call DelayFrame

; successful change
	scf
	ret

.dontchange
; no change occurred
	and a
	ret

_UpdateTimePals::
	ld c, $9 ; normal
	call GetTimePalFade
	call DmgToCgbTimePals
	ret

FadeInFromWhite::
	ld c, $12
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsDecHL
	ret

FadeOutToWhite::
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsIncHL
	ret

FadeInPalettes::
	ld c, 10
	call FadePalettes
	ret

FadeOutPalettes::
	ld c, 10
	call FadeToWhite
	ret

BattleTowerFade:
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
.loop
	call DmgToCgbTimePals
	inc hl
	inc hl
	inc hl
	ld c, $7
	call DelayFrames
	dec b
	jr nz, .loop
	ret

FadeInFromBlack:
	ld c, $0
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsIncHL
	ret

FadeOutToBlack:
	ld c, $9
	call GetTimePalFade
	ld b, $4
	call ConvertTimePalsDecHL
	ret

FillWhiteBGColor:
; Copy white palette of wBGPals1 Pal0 into white palette of wBGPals1 Pal1-Pal6
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, wBGPals1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, wBGPals1 palette 1 color 0
	ld c, 6
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 3 colors
	inc hl
endr
	dec c
	jr nz, .loop

	pop af
	ldh [rSVBK], a
	ret

ReplaceTimeOfDayPals:
	ld a, [wMapTimeOfDay]
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .not_dark
	ld a, DARKNESS_PALSET
	jr .done

.not_dark:
	ld hl, .BrightnessLevels
	ld a, [wMapTimeOfDay]
	maskbits NUM_MAP_PALETTES
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
.done:
	ld [wTimeOfDayPalset], a
	ret

.BrightnessLevels:
; actual palettes used when time is
; EVE_F, NITE_F, DAY_F, MORN_F
	dc EVE_F,      NITE_F,     DAY_F,      MORN_F     ; PALETTE_AUTO
	dc DAY_F,      DAY_F,      DAY_F,      DAY_F      ; PALETTE_DAY
	dc NITE_F,     NITE_F,     NITE_F,     NITE_F     ; PALETTE_NITE
	dc MORN_F,     MORN_F,     MORN_F,     MORN_F     ; PALETTE_MORN
	dc EVE_F,      EVE_F,      EVE_F,      EVE_F      ; PALETTE_EVE

GetTimePalette:
	jumptable .TimePalettes, wTimeOfDay

.TimePalettes:
	dw .MorningPalette  ; MORN_F
	dw .DayPalette      ; DAY_F
	dw .NitePalette     ; NITE_F
	dw .EveningPalette  ; EVE_F

.MorningPalette:
	ld a, [wTimeOfDayPalset]
	and %00000011
	ret

.DayPalette:
	ld a, [wTimeOfDayPalset]
	and %00001100
	srl a
	srl a
	ret

.NitePalette:
	ld a, [wTimeOfDayPalset]
	and %00110000
	swap a
	ret

.EveningPalette:
	ld a, [wTimeOfDayPalset]
	and %11000000
	rlca
	rlca
	ret

DmgToCgbTimePals:
	push hl
	push de
	ld a, [hli]
	call DmgToCgbBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call DmgToCgbObjPals
	pop de
	pop hl
	ret

ConvertTimePalsIncHL:
.loop
	call DmgToCgbTimePals
	inc hl
	inc hl
	inc hl
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret

ConvertTimePalsDecHL:
.loop
	call DmgToCgbTimePals
	dec hl
	dec hl
	dec hl
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret

GetTimePalFade:
; check cgb
	ldh a, [hCGB]
	and a
	jr nz, .cgb

; else: dmg

; index
	ld a, [wTimeOfDayPal]
	and %11

; get fade table
	push bc
	ld c, a
	ld b, 0
	ld hl, .dmgfades
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

; get place in fade table
	ld b, 0
	add hl, bc
	ret

.cgb
	ld hl, .cgbfade
	ld b, 0
	add hl, bc
	ret

.dmgfades
	dw .morn
	dw .day
	dw .nite
	dw .darkness

.morn
	dc 3,3,3,3, 3,3,3,3, 3,3,3,3
	dc 3,3,3,2, 3,3,3,2, 3,3,3,2
	dc 3,3,2,1, 3,2,1,0, 3,2,1,0
	dc 3,2,1,0, 3,1,0,0, 3,1,0,0
	dc 2,1,0,0, 2,0,0,0, 2,0,0,0
	dc 1,0,0,0, 1,0,0,0, 1,0,0,0
	dc 0,0,0,0, 0,0,0,0, 0,0,0,0

.day
	dc 3,3,3,3, 3,3,3,3, 3,3,3,3
	dc 3,3,3,2, 3,3,3,2, 3,3,3,2
	dc 3,3,2,1, 3,2,1,0, 3,2,1,0
	dc 3,2,1,0, 3,1,0,0, 3,1,0,0
	dc 2,1,0,0, 2,0,0,0, 2,0,0,0
	dc 1,0,0,0, 1,0,0,0, 1,0,0,0
	dc 0,0,0,0, 0,0,0,0, 0,0,0,0

.nite
	dc 3,3,3,3, 3,3,3,3, 3,3,3,3
	dc 3,3,3,2, 3,3,3,2, 3,3,3,2
	dc 3,3,2,1, 3,2,1,0, 3,2,1,0
	dc 3,2,2,1, 3,1,0,0, 3,1,0,0
	dc 2,1,0,0, 2,0,0,0, 2,0,0,0
	dc 1,0,0,0, 1,0,0,0, 1,0,0,0
	dc 0,0,0,0, 0,0,0,0, 0,0,0,0

.darkness
	dc 3,3,3,3, 3,3,3,3, 3,3,3,3
	dc 3,3,3,2, 3,3,3,2, 3,3,3,3
	dc 3,3,3,2, 3,2,1,0, 3,3,3,3
	dc 3,3,3,1, 3,1,0,0, 3,3,3,3
	dc 3,3,3,1, 2,0,0,0, 3,3,3,3
	dc 0,0,0,0, 1,0,0,0, 0,0,0,0
	dc 0,0,0,0, 0,0,0,0, 0,0,0,0

.cgbfade
	dc 3,3,3,3, 3,3,3,3, 3,3,3,3
	dc 3,3,3,2, 3,3,3,2, 3,3,3,2
	dc 3,3,2,1, 3,3,2,1, 3,3,2,1
	dc 3,2,1,0, 3,2,1,0, 3,2,1,0
	dc 2,1,0,0, 2,1,0,0, 2,1,0,0
	dc 1,0,0,0, 1,0,0,0, 1,0,0,0
	dc 0,0,0,0, 0,0,0,0, 0,0,0,0
