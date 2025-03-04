; Constants for momitem offsets (see data/items/mom_phone.asm)
rsreset
DEF MOMITEM_TRIGGER rb 3 ; 0
DEF MOMITEM_COST    rb 3 ; 3
DEF MOMITEM_KIND    rb   ; 6
DEF MOMITEM_ITEM    rb   ; 7
DEF MOMITEM_SIZE EQU _RS ; 8

; momitem kind values
	const_def 1
	const MUM_ITEM
	const MUM_DOLL

MumTriesToBuySomething::
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret nz
	call GetMapPhoneService
	and a
	ret nz
	xor a
	ld [wWhichMumItemSet], a
	call CheckBalance_MumItem2
	ret nc
	call Mum_GiveItemOrDoll
	ret nc
	ld b, BANK(.Script)
	ld de, .Script
	farcall LoadMemScript
	scf
	ret

.Script:
	callasm .ASMFunction
	farsjump Script_ReceivePhoneCall

.ASMFunction:
	call MumBuysItem_DeductFunds
	call Mum_GetScriptPointer
	ld a, [wWhichMumItemSet]
	and a
	jr nz, .ok
	ld hl, wWhichMumItem
	inc [hl]
.ok
	ld a, PHONE_MUM
	ld [wCurCaller], a
	ld bc, wCallerContact
	ld hl, PHONE_CONTACT_TRAINER_CLASS
	add hl, bc
	ld [hl], TRAINER_NONE
	inc hl
	ld [hl], PHONE_MUM
	ld hl, PHONE_CONTACT_SCRIPT2_BANK
	add hl, bc
	ld a, BANK(Mum_GetScriptPointer)
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ret

CheckBalance_MumItem2:
	ld a, [wWhichMumItem]
	cp (MumItems_2.End - MumItems_2) / MUMITEM_SIZE
	jr nc, .nope
	call GetItemFromMum
	assert MUMITEM_TRIGGER == 0
	ld a, [hli]
	ldh [hMoneyTemp], a
	ld a, [hli]
	ldh [hMoneyTemp + 1], a
	ld a, [hli]
	ldh [hMoneyTemp + 2], a
	ld de, wMumsMoney
	ld bc, hMoneyTemp
	farcall CompareMoney
	jr nc, .have_enough_money

.nope
	jr .check_have_2300

.have_enough_money
	scf
	ret

.check_have_2300
	ld hl, hMoneyTemp
	ld [hl], HIGH(MUM_MONEY >> 8)
	inc hl
	ld [hl], HIGH(MUM_MONEY) ; mid
	inc hl
	ld [hl], LOW(MUM_MONEY)
.loop
	ld de, wMumItemTriggerBalance
	ld bc, wMumsMoney
	farcall CompareMoney
	jr z, .exact
	jr nc, .less_than
	call .AddMoney
	jr .loop

.less_than
	xor a
	ret

.exact
	call .AddMoney
	ld a, (MumItems_1.End - MumItems_1) / MUMITEM_SIZE
	call RandomRange
	inc a
	ld [wWhichMumItemSet], a
	scf
	ret

.AddMoney:
	ld de, wMumItemTriggerBalance
	ld bc, hMoneyTemp
	farcall AddMoney
	ret

MumBuysItem_DeductFunds:
	call GetItemFromMum
	ld de, MUMITEM_COST
	add hl, de
	ld a, [hli]
	ldh [hMoneyTemp], a
	ld a, [hli]
	ldh [hMoneyTemp + 1], a
	ld a, [hli]
	ldh [hMoneyTemp + 2], a
	ld de, wMumsMoney
	ld bc, hMoneyTemp
	farcall TakeMoney
	ret

Mum_GiveItemOrDoll:
	call GetItemFromMum
	ld de, MUMITEM_KIND
	add hl, de
	ld a, [hli]
	cp MUM_ITEM
	jr z, .not_doll
	assert MUMITEM_KIND + 1 == MUMITEM_ITEM
	ld a, [hl]
	ld c, a
	ld b, 1
	farcall DecorationFlagAction_c
	scf
	ret

.not_doll
	ld a, [hl]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumPCItems
	call ReceiveItem
	ret

Mum_GetScriptPointer:
	call GetItemFromMum
	ld de, MUMITEM_KIND
	add hl, de
	ld a, [hli]
	ld de, .ItemScript
	cp MUM_ITEM
	ret z
	ld de, .DollScript
	ret

.ItemScript:
	writetext MumHiHowAreYouText
	writetext MumFoundAnItemText
	writetext MumBoughtWithYourMoneyText
	writetext MumItsInPCText
	end

.DollScript:
	writetext MumHiHowAreYouText
	writetext MumFoundADollText
	writetext MumBoughtWithYourMoneyText
	writetext MumItsInYourRoomText
	end

GetItemFromMum:
	ld a, [wWhichMumItemSet]
	and a
	jr z, .zero
	dec a
	ld de, MumItems_1
	jr .GetFromList1

.zero
	ld a, [wWhichMumItem]
	cp (MumItems_2.End - MumItems_2) / MUMITEM_SIZE
	jr c, .ok
	xor a

.ok
	ld de, MumItems_2

.GetFromList1:
	ld l, a
	ld h, 0
	assert MUMITEM_SIZE == 8
rept 3 ; multiply hl by MUMITEM_SIZE
	add hl, hl
endr
	add hl, de
	ret

INCLUDE "data/items/mum_phone.asm"

MumHiHowAreYouText:
	text_far _MumHiHowAreYouText
	text_end

MumFoundAnItemText:
	text_far _MumFoundAnItemText
	text_end

MumBoughtWithYourMoneyText:
	text_far _MumBoughtWithYourMoneyText
	text_end

MumItsInPCText:
	text_far _MumItsInPCText
	text_end

MumFoundADollText:
	text_far _MumFoundADollText
	text_end

MumItsInYourRoomText:
	text_far _MumItsInYourRoomText
	text_end


DummyPredef3A_DummyData: ; unreferenced
	db 0

DummyPredef3A:
	ret

DummyPredef3A_DummyFunction: ; unreferenced
	ret
