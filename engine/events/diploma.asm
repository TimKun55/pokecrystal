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
	hlcoord 16, 3
	call PlaceString
	ld de, wPlayerName
	hlcoord 10, 3
	call PlaceString
	ld de, .Certification1
	hlcoord 4, 5
	call PlaceString
	ld de, .Certification2
	hlcoord 3, 6
	call PlaceString
	ld de, .Certification3
	hlcoord 3, 7
	call PlaceString
	ld de, .Certification4
	hlcoord 4, 8
	call PlaceString
	ld de, .Congratulations
	hlcoord 2, 10
	call PlaceString
	ld de, .PlayTime
	hlcoord 10, 14
	call PlaceString
	hlcoord 10, 15
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], $48 ; colon
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
	db "Player:@"

.EmptyString:
	db "@"

.Certification1:
	db "This document@"
.Certification2:
	db "certifies that@"
.Certification3:
	db "you've completed@"
.Certification4:
	db "the #dex.@"
	
.Congratulations:
	db "Congratulations!@"

.PlayTime: db "Play Time@"

DiplomaGFX:
INCBIN "gfx/diploma/diploma.2bpp.lz"

DiplomaPage1Tilemap:
INCBIN "gfx/diploma/page1.tilemap"
