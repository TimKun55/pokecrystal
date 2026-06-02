UpdateItemDescriptionAndBagQuantity:
	call _MartPlaceInBagQuantity
UpdateItemDescription:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farcall PrintItemDescription
	ret

_MartPlaceInBagQuantity:
	farcall UpdateItemDescription
	farcall CheckItemPocket
	ld a, [wItemAttributeValue]
	cp ITEM
	jr z, .get_item_pocket
	cp BALL
	jr z, .get_ball_pocket
	cp MEDICINE
	jr z, .get_medicine_pocket
	cp BERRIES
	jr z, .get_berry_pocket
;	cp TM01
	ret

.get_item_pocket
	ld hl, wNumItems
	jr .check_bag

.get_ball_pocket
	ld hl, wNumBalls
	jr .check_bag

.get_medicine_pocket
	ld hl, wNumMedicines
	jr .check_bag

.get_berry_pocket
	ld hl, wNumBerries
.check_bag
	ld a, [wCurItem]
	ld c, a
	ld b, $0
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
	ld [wMenuSelectionQuantity], a
	and a

	farcall PlaceItemInBagQuantity
	ret

