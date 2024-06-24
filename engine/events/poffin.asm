Poffin_PrintTextWhichBerry:
	ld hl, .WhichBerryText
	call PrintText
	ret

.WhichBerryText:
	text_far _WhichBerryText
	text_end

Poffin_PrintTextHowMany:
	ld hl, .HowManyPoffinsText
	call PrintText
	ret

.HowManyPoffinsText:
	text_far _HowManyPoffinsText
	text_end

SelectBerryForPoffin:
	call LoadStandardMenuHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wPoffinBerryQuantity], a
.loop
	push bc
	call Poffin_PrintTextWhichBerry
	pop bc
	ld a, c
	ld [wMenuSelection], a
	call Poffin_SelectBerry
	ld a, c
	ld [wScriptVar], a
	and a
	jr z, .done
	ld [wCurItem], a
	ld a, [wMenuCursorY]
	ld c, a
	push bc
	call Poffin_PrintTextHowMany
	call Poffin_SelectQuantity
	pop bc
	jr nc, .loop
	ld a, [wItemQuantityChange]
	ld [wPoffinBerryQuantity], a
	call Poffin_GiveUpSelectedQuantityOfSelectedBerry

.done
	call Call_ExitMenu
	ret

Poffin_SelectBerry:
	farcall FindBerrysInBag
	jr c, .nope
	ld hl, .MenuHeader
	call CopyMenuHeader
	ld a, [wMenuSelection]
	ld [wMenuCursorPosition], a
	xor a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .nope
	ld a, [wMenuSelection]
	cp -1
	jr nz, .done

.nope
	xor a ; FALSE

.done
	ld c, a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 13, 10
	dw .MenuData
	db 1 ; default option

	db 0 ; unused

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 7 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wKurtApricornCount
	dba .Name
	dba .Quantity
	dba NULL

.Name:
	ld a, [wMenuSelection]
	and a
	ret z
	farcall PlaceMenuItemName
	ret

.Quantity:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	call Poffin_GetQuantityOfBerry
	ret z
	ld a, [wItemQuantityChange]
	ld [wMenuSelectionQuantity], a
	farcall PlaceMenuItemQuantity
	ret

Poffin_SelectQuantity:
	ld a, [wCurItem]
	ld [wMenuSelection], a
	call Poffin_GetQuantityOfBerry
	jr z, .done
	ld a, [wItemQuantityChange]
	ld [wItemQuantity], a
	ld a, $1
	ld [wItemQuantityChange], a
	ld hl, .MenuHeader
	call LoadMenuHeader
.loop
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call .PlaceBerryName
	call PlaceBerryQuantity
	call ApplyTilemap
	farcall Kurt_SelectQuantity_InterpretJoypad
	jr nc, .loop

	push bc
	call PlayClickSFX
	pop bc
	ld a, b
	cp -1
	jr z, .done
	ld a, [wItemQuantityChange]
	ld [wItemQuantityChange], a ; What is the point of this operation?
	scf

.done
	call CloseWindow
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 9, SCREEN_WIDTH - 1, 12
	dw NULL
	db -1 ; default option
	db 0

.PlaceBerryName:
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld d, h
	ld e, l
	farcall PlaceMenuItemName
	ret

PlaceBerryQuantity:
	call MenuBoxCoord2Tile
	ld de, 2 * SCREEN_WIDTH + 10
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChange
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

Poffin_GetQuantityOfBerry:
	push bc
	ld hl, wNumBerries
	ld a, [wCurItem]
	ld c, a
	ld b, 0
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	ld a, [hl]
	add b
	ld b, a
	jr nc, .loop
	ld b, -1

.done
	ld a, b
	sub 99
	jr c, .done2
	ld b, 99

.done2
	ld a, b
	ld [wItemQuantityChange], a
	and a
	pop bc
	ret

Poffin_GiveUpSelectedQuantityOfSelectedBerry:
; Get the quantity of Berrys of type [wCurItem]
; in the bag. Compatible with multiple stacks.

; Initialize the search.
	push de
	push bc
	ld hl, wNumBerries
	ld a, [wCurItem]
	ld c, a
	ld e, $0
	xor a
	ld [wCurItemQuantity], a
	ld a, -1
	ld [wApricorns], a

; Search for [wCurItem] in the bag.
.loop1
; Increase the total count.
	ld a, [wCurItemQuantity]
	inc a
	ld [wCurItemQuantity], a
; Get the index of the next item.
	inc hl
	ld a, [hli]
; If we've reached the end of the pocket, break.
	cp -1
	jr z, .okay1
; If we haven't found what we're looking for, continue.
	cp c
	jr nz, .loop1
; Increment the result counter and store the bag index of the match.
	ld d, $0
	push hl
	ld hl, wApricorns
	add hl, de
	inc e
	ld a, [wCurItemQuantity]
	dec a
	ld [hli], a
	ld a, -1
	ld [hl], a
	pop hl
	jr .loop1

.okay1
; How many stacks have we found?
	ld a, e
	and a
	jr z, .done
	dec a
	jr z, .OnlyOne
	ld hl, wApricorns

.loop2
	ld a, [hl]
	ld c, a
	push hl
.loop3
	inc hl
	ld a, [hl]
	cp -1
	jr z, .okay2
	ld b, a
	ld a, c
	call Poffin_GetAddressOfBerryQuantity
	ld e, a
	ld a, b
	call Poffin_GetAddressOfBerryQuantity
	sub e
	jr z, .equal
	jr c, .less
	jr .loop3

.equal
	ld a, c
	sub b
	jr nc, .loop3

.less
	ld a, c
	ld c, b
	ld [hl], a
	ld a, c
	pop hl
	ld [hl], a
	push hl
	jr .loop3

.okay2
	pop hl
	inc hl
	ld a, [hl]
	cp -1
	jr nz, .loop2

.OnlyOne:
	ld hl, wApricorns
.loop4
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [wCurItemQuantity], a
	call Poffin_GetRidOfItem
	pop hl
	ld a, [wItemQuantityChange]
	and a
	jr z, .done
	push hl
	ld a, [hli]
	ld c, a
.loop5
	ld a, [hli]
	cp -1
	jr z, .okay3
	cp c
	jr c, .loop5
	dec a
	dec hl
	ld [hli], a
	jr .loop5

.okay3
	pop hl
	inc hl
	jr .loop4

.done
	ld a, [wItemQuantityChange]
	and a
	pop bc
	pop de
	ret

Poffin_GetAddressOfBerryQuantity:
	push hl
	push bc
	ld hl, wNumBerries
	inc hl
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	pop bc
	pop hl
	ret

Poffin_GetRidOfItem:
	push bc
	ld hl, wNumBerries
	ld a, [wCurItemQuantity]
	ld c, a
	ld b, 0
	inc hl
	add hl, bc
	add hl, bc
	ld a, [wCurItem]
	ld c, a
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .done
	ld a, [wItemQuantityChange]
	ld c, a
	ld a, [hl]
	sub c
	ld b, c
	jr nc, .okay
	add c
	ld b, a

.okay
	push bc
	ld hl, wNumBerries
	ld a, b
	ld [wItemQuantityChange], a
	call TossItem
	pop bc
	ld a, c
	sub b

.done
	ld [wItemQuantityChange], a
	pop bc
	ret
