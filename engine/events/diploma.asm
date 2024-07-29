_Diploma:
	call PlaceDiplomaOnScreen
	call WaitPressAorB_BlinkCursor
	ret

PlaceDiplomaOnScreen:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD
	ld hl, DiplomaGFX
	ld de, vTiles2
	call Decompress
	ld hl, DiplomaPage1Tilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .Player
	hlcoord 2, 3
	call PlaceString
	ld de, .EmptyString
	hlcoord 15, 3
	call PlaceString
	ld de, wPlayerName
	hlcoord 9, 3
	call PlaceString
	ld de, .Certification
	hlcoord 2, 6
	call PlaceString
	ld de, .GameFreak
	hlcoord 9, 12
	call PlaceString
	ld de, .PlayTime
	hlcoord 10, 14
	call PlaceString
	hlcoord 10, 15
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], $67 ; colon
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call DelayFrame
	ret

.Player:
	db "Player@"

.EmptyString:
	db "@"

.Certification:
	db   "Certified #dex"
	next "completionist."
	next "Congratulations!"
	db   "@"

.PlayTime: db "Play Time@"
.GameFreak: db "Game Freak@"

DiplomaGFX:
INCBIN "gfx/diploma/diploma.2bpp.lz"

DiplomaPage1Tilemap:
INCBIN "gfx/diploma/page1.tilemap"

DiplomaPage2Tilemap:
INCBIN "gfx/diploma/page2.tilemap"
