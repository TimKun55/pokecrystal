FruitTreeScript::
	callasm GetCurTreeFruit
	opentext
	readmem wCurFruit
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext FruitBearingTreeText
	promptbutton
	callasm TryResetFruitTrees
	callasm CheckFruitTree
	iffalse .fruit
	writetext NothingHereText
	waitbutton
	checkitem MULCH
	iffalse .end
	writetext WantToUseMulchText
	yesorno
	iffalse .end
	takeitem MULCH
	readmem wCurFruit
	callasm FertilizedFruitTree
	writetext UsedMulchText
	waitbutton
	sjump .end

.fruit
	farwritetext _HeyItsFruitText
	callasm GetFruitTreeCount
	ifequal FRUIT_TREE_1_MIN, .try_one
	ifequal FRUIT_TREE_2, .try_two
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $3
	iffalse .try_two
	promptbutton
	writetext ObtainedThreeFruitText
	sjump .continue
.try_two
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $2
	iffalse .try_one
	promptbutton
	writetext ObtainedTwoFruitText
	sjump .continue
.try_one
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $1
	iffalse .packisfull
	promptbutton
	writetext ObtainedFruitText
.continue
	callasm PickedFruitTree
	specialsound
	itemnotify
	sjump .end

.packisfull
	promptbutton
	writetext FruitPackIsFullText
	waitbutton

.end
	closetext
	end

GetFruitTreeCount:
	ld a, 3
	call RandomRange
	inc a
	ld [wScriptVar], a
	ret

GetCurTreeFruit:
	ld a, [wCurFruitTree]
	dec a
	call GetFruitTreeItem
	ld [wCurFruit], a
	ret

TryResetFruitTrees:
	ld hl, wDailyFlags1
	bit DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret nz
	jp ResetFruitTrees

CheckFruitTree:
	ld b, 2
	call GetFruitTreeFlag
	ld a, c
	ld [wScriptVar], a
	ret

PickedFruitTree:
	farcall StubbedTrainerRankings_FruitPicked
	ld b, 1
	jp GetFruitTreeFlag

ResetFruitTrees:
	xor a
	ld hl, wFruitTreeFlags
rept (NUM_FRUIT_TREES + 7) / 8 - 1
	ld [hli], a
endr
	ld [hl], a
	ld hl, wDailyFlags1
	set DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret

FertilizedFruitTree:
	ld b, RESET_FLAG
GetFruitTreeFlag:
	push hl
	push de
	ld a, [wCurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, wFruitTreeFlags
	call FlagAction
	pop de
	pop hl
	ret

GetFruitTreeItem:
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, FruitTreeItems
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

INCLUDE "data/items/fruit_trees.asm"

FruitBearingTreeText:
	text_far _FruitBearingTreeText
	text_end

HeyItsFruitText:
	text_far _HeyItsFruitText
	text_end

ObtainedFruitText:
	text_far _ObtainedFruitText
	text_end
	
ObtainedTwoFruitText:
	text_far _ObtainedTwoFruitText
	text_end

ObtainedThreeFruitText:
	text_far _ObtainedThreeFruitText
	text_end

FruitPackIsFullText:
	text_far _FruitPackIsFullText
	text_end

NothingHereText:
	text_far _NothingHereText
	text_end

WantToUseMulchText:
	text_far _WantToUseMulchText
	text_end

UsedMulchText:
	text_far _UsedMulchText
	text_end
	
DEF FRUIT_TREE_1_MIN EQU 1
DEF FRUIT_TREE_2     EQU 2
DEF FRUIT_TREE_3_MAX EQU 3
