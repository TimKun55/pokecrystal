Pokedex_GBS_Stats:
	ld de, BS_HP_text
	hlcoord 3, 10
	call PlaceString ; TEXT for 'HP' name
	
	ld de, BS_ATK_text
	hlcoord 3, 11
	call PlaceString ; TEXT for 'ATK' name
	
	ld de, BS_DEF_text
	hlcoord 12, 11
	call PlaceString ; TEXT for 'DEF' name
	
	ld de, BS_SPCL_text
	hlcoord 3, 12
	call PlaceString ; TEXT for 'SPCL' name
	
	ld de, BS_SPCLDEF_text
	hlcoord 12, 12
	call PlaceString 
	
	ld de, BS_SPEED_text
	hlcoord 12, 10
	call PlaceString 

	hlcoord 7, 10
	ld de, wBaseHP
	ld c, 3 ;digits
	ld b, 1 ;bytes
	call PrintNum
	hlcoord 16, 10
	ld de, wBaseSpeed
	ld c, 3 ;digits
	ld b, 1 ;bytes
	call PrintNum

	hlcoord 7, 11
	ld de, wBaseAttack
	ld c, 3 ;digits
	ld b, 1 ;bytes
	call PrintNum
	hlcoord 16, 11
	ld de, wBaseDefense
	ld c, 3 ;digits
	ld b, 1 ;bytes
	call PrintNum

	hlcoord 7, 12
	ld de, wBaseSpecialAttack
	ld c, 3 ;digits
	ld b, 1 ;bytes
	call PrintNum
	hlcoord 16, 12
	ld de, wBaseSpecialDefense
	ld c, 3 ;digits
	ld b, 1 ;bytes
	call PrintNum

	hlcoord 3, 14
	ld de, .BS_Total_text
	call PlaceString

	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	
	ld h, 0
	ld a, [wBaseHP]
	ld l, a
	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseSpeed]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseAttack]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseDefense]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseSpecialAttack]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseSpecialDefense]
	ld l, a
	add hl, bc

	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

	hlcoord 15, 14
	ld de, wCurDamage
	lb bc, 2, 3
	call PrintNum

	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ret
.BS_Total_text:
	db "Base Total:@"

BS_HP_text:
	db " HP@"
BS_SPEED_text:
	db "Spe@"
BS_ATK_text:
	db "Atk@"
BS_DEF_text:
	db "Def@"
BS_SPCL_text:
	db "SpA@"
BS_SPCLDEF_text:
	db "SpD@"

Pokedex_Get_Items:
; TODO: Add code to differentiate same items in both entries, special cases
	hlcoord 3, 10
	ld de, .BS_ITEM_text
	call PlaceString
	hlcoord 3, 11
	ld de, .BS_ITEM1
	call PlaceString
	hlcoord 3, 12
	ld de, .BS_ITEM2
	call PlaceString

.WildHeldItems1:
	ld de, .ThreeDashes
	ld a, [wBaseItem1]
	and a
	jr z, .Item1Done
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
.Item1Done
	hlcoord 7, 11
	call PlaceString
.WildHeldItems2:
	ld de, .ThreeDashes
	ld a, [wBaseItem2]
	and a
	jr z, .Item2Done
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
.Item2Done
	hlcoord 7, 12
	call PlaceString
	ret
.ThreeDashes:
	db "---@"
.BS_ITEM_text:
	db "Wild Held Items:@"
.BS_ITEM1:
	db "[1]@"
.BS_ITEM2:
	db "[2]@"

Pokedex_EggG_SetUp:
	ld a, [wBaseEggGroups]
	push af
	and $f
	ld b, a
	pop af
	and $f0
	swap a
	ld c, a
	hlcoord 3, 10
	ld de, .BS_Egg_text1
	push bc
	call PlaceString
	pop bc
	call Pokedex_Get_EggGroup
	hlcoord 4, 11
	push bc
	call PlaceString
	pop bc
	ld a, b
	cp c
	jr z, .EggGroups_DONE
;;; Print second egg group
	hlcoord 3, 10
	ld de, .BS_Egg_text2
	push bc
	call PlaceString
	pop bc
	ld b, c
	call Pokedex_Get_EggGroup
	hlcoord 4, 12
	call PlaceString ;no longer need to preserve bc
.EggGroups_DONE
	ret
.BS_Egg_text1:
	db "Egg Group: @"
.BS_Egg_text2:
	db "Egg Groups: @"


Pokedex_Get_EggGroup:
;; have the fixed group num in 'a' already
;; return 'de' as the text for matching group
	ld a, b
	ld de, .EggG_Monster_text
	cp EGG_MONSTER
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Amphibian_text
	cp EGG_WATER_1
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Bug_text
	cp EGG_BUG
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Flying_text
	cp EGG_FLYING
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Field_text
	cp EGG_GROUND
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Fairy_text
	cp EGG_FAIRY
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Grass_text
	cp EGG_PLANT
	jr z, .Eggret
	ld a, b
	ld de, .EggG_HumanLike_text
	cp EGG_HUMANSHAPE
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Invertebrate_text
	cp EGG_WATER_3
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Mineral_text
	cp EGG_MINERAL
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Amorphous_text
	cp EGG_INDETERMINATE
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Fish_text
	cp EGG_WATER_2
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Dragon_text
	cp EGG_DRAGON
	jr z, .Eggret
	ld a, b
	ld de, .EggG_Ditto_text
	cp EGG_DITTO
	jr z, .Eggret
	ld de, DexEntry_NONE_text
.Eggret
	ret
;;;Egg Groups
.EggG_Monster_text:
	db "Monster@"
.EggG_Amphibian_text:
	db "Amphibian@"
.EggG_Bug_text:
	db "Bug@"
.EggG_Flying_text:
	db "Flying@"
.EggG_Field_text:
	db "Field@"
.EggG_Fairy_text:
	db "Fairy@"
.EggG_Grass_text:
	db "Grass@"
.EggG_HumanLike_text:
	db "Humane-Like@"
.EggG_Invertebrate_text:
	db "Invertebrate@"
.EggG_Mineral_text:
	db "Mineral@"
.EggG_Amorphous_text:
	db "Amorphous@"
.EggG_Fish_text:
	db "Fish@"
.EggG_Ditto_text:
	db "ALL@"
.EggG_Dragon_text:
	db "Dragon@"

Pokedex_Get_GenderRatio::
	hlcoord 3, 15
	ld de, .GR_Text
	call PlaceString
	ld a, [wBaseGender]
	ld de, .GR_always_fem
	cp GENDER_F100
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_always_male
	cp GENDER_F0
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_QuarterF
	cp GENDER_F25
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_Equal
	cp GENDER_F50
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_QuartM
	cp GENDER_F75
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_MostMale
	cp GENDER_F12_5
	jr z, .GR_print
	ld de, DexEntry_NONE_text
.GR_print
	hlcoord 14, 15
	call PlaceString
	ret

.GR_Text
	db "Gender <%>: @"
.GR_always_fem:
	db "♀ Only@"
.GR_always_male
	db "♂ Only@"
.GR_QuarterF
	db "1♀:4♂@"
.GR_Equal
	db "1♂:1♀@"
.GR_QuartM
	db "4♀:1♂@"
.GR_MostMale
	db "8♂:1♀@"

Pokedex_CatchRate:
	hlcoord 3, 15
	ld de, .BS_Catchrate
	call PlaceString
	hlcoord 15, 15
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	ld de, wBaseCatchRate
	call PrintNum
	ret
;Catch Rate
.BS_Catchrate:
	db "Catch Rate: @"

Pokedex_Get_Growth::
;Growth rate
	; hlcoord 3, 14
	; ld de, .BS_Growth_text
	; call PlaceString
	ld a, [wBaseGrowthRate]
	ld de, .growth_Medfast
	cp GROWTH_MEDIUM_FAST
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_slightfast
	cp GROWTH_SLIGHTLY_FAST
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_slightslow
	cp GROWTH_SLIGHTLY_SLOW
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_medslow
	cp GROWTH_MEDIUM_SLOW
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_fast
	cp GROWTH_FAST
	jr z, .Growth_print
	ld de, .growth_slow
.Growth_print
	hlcoord 3, 15
	call PlaceString
	ret
; .BS_Growth_text:
; 	db "GROWTH RATE: @"
.growth_Medfast:
	db "Med. Fast Growth@"
.growth_slightfast
	db "Sml. Fast Growth@"
.growth_slightslow
	db "Sml. Slow Growth@"
.growth_medslow
	db "Med. Slow Growth@"
.growth_fast
	db "Fast Growth@"
.growth_slow
	db "Slow Growth@"

Pokedex_PrintBaseExp:
; wBaseExp
	hlcoord 3, 14
	ld de, .Exp_text
	call PlaceString
	hlcoord 14, 14
	ld de, wBaseExp
	; lb bc, PRINTNUM_LEFTALIGN | 1, 3
	lb bc, 1, 3
	call PrintNum
	ret
.Exp_text:
	db "Exp Yield:@"

Pokedex_PrintHatchSteps:
; wBaseEggSteps
	hlcoord 3, 13
	ld de, .HatchSteps_text
	call PlaceString
	hlcoord 14, 13
	ld de, wBaseEggSteps
	lb bc, 1, 3
	call PrintNum
	ret
.HatchSteps_text:
	db "Egg Cycles:@"

Pokedex_PrintBaseEVs:
; wBaseHPAtkDefSpdEVs
; wBaseSpAtkSpDefEVs
; +	db (\1 << 6) | (\2 << 4) | (\3 << 2) | \4
; +	db (\5 << 6) | (\6 << 4)
	ld de, .EVyield_text
	hlcoord 3, 10
	call PlaceString
	
	ld a, $6
	ld [wStatsScreenFlags], a
	jp .prep_stack
.start_print
	ld a, [wBaseHPAtkDefSpdEVs]
	and %11000000
	jr z, .ev_atk
	swap a
	srl a
	srl a
	pop hl
	add a, "0"
	ld [hl], a
	pop hl
	ld de, BS_HP_text
	call PlaceString
	call .dec_stack_count
.ev_atk
	ld a, [wBaseHPAtkDefSpdEVs]
	and %00110000
	jr z, .ev_def
	swap a
	pop hl
	add a, "0"
	ld [hl], a
	pop hl
	ld de, BS_ATK_text
	call PlaceString
	call .dec_stack_count
.ev_def
	ld a, [wBaseHPAtkDefSpdEVs]
	and %00001100
	jr z, .ev_speed
	srl a
	srl a
	pop hl
	add a, "0"
	ld [hl], a
	pop hl
	ld de, BS_DEF_text
	call PlaceString
	call .dec_stack_count
.ev_speed
	ld a, [wBaseHPAtkDefSpdEVs]
	and %00000011
	jr z, .ev_spatk
	pop hl
	add a, "0"
	ld [hl], a

	pop hl
	ld de, BS_SPEED_text
	call PlaceString
	call .dec_stack_count
.ev_spatk
	ld a, [wBaseSpAtkSpDefEVs]
	and %11000000
	jr z, .ev_spdef
	swap a
	srl a
	srl a
	pop hl
	add a, "0"
	ld [hl], a
	pop hl
	ld de, BS_SPCL_text
	call PlaceString
	call .dec_stack_count
.ev_spdef
	ld a, [wBaseSpAtkSpDefEVs]
	and %00110000
	jr z, .ev_done
	swap a
	pop hl
	add a, "0"
	ld [hl], a
	pop hl
	ld de, BS_SPCLDEF_text
	call PlaceString
	call .dec_stack_count
.ev_done
	ld a, [wStatsScreenFlags]
	and a
	ret z
	call .dec_stack_count
	pop hl
	pop hl
	jr .ev_done
.EVyield_text:
	db "EV Yield:@"

.prep_stack
	hlcoord 12, 13
	push hl
	hlcoord 16, 13
	push hl
	hlcoord 4, 13
	push hl
	hlcoord 8, 13
	push hl
	hlcoord 12, 12
	push hl
	hlcoord 16, 12
	push hl
	hlcoord 4, 12
	push hl
	hlcoord 8, 12
	push hl
	hlcoord 12, 11
	push hl
	hlcoord 16, 11
	push hl
	hlcoord 4, 11
	push hl
	hlcoord 8, 11
	push hl
	jp .start_print
.dec_stack_count:
	ld a, [wStatsScreenFlags]
	dec a
	ld [wStatsScreenFlags], a
	ret

Pokedex_HeightWeight:
; height string
	hlcoord 3, 14
	ld de, .Height
	call PlaceString

; weight string	
	hlcoord 3, 15
	ld de, .Weight
	call PlaceString
; kgs string
	hlcoord 14, 15
	ld de, .Kilos
	call PlaceString

; get pokemon's dex entry ptr in b:de
	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld h, d
	ld l, e
; skip species nickname
.loop1
	ld a, b ; bank
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1

; hl should now be at height
	push hl ; keep the ptr, for weight
	ld a, b ; bank
	push af ; keep bank
	call GetFarWord
	ld a, h
	ld [wPoisonStepCount], a
	ld a, l
	ld [wPoisonStepCount + 1], a
	ld de, wPoisonStepCount
; Print the height, with two of the four digits in front of the decimal point
	hlcoord 11, 14
	lb bc, 2, (2 << 4) | 4
	call PrintNum
; get weight
	pop af ; bank
	pop hl ; ptr
	inc hl
	inc hl
	call GetFarWord
	ld a, h
	ld [wPoisonStepCount], a
	ld a, l
	ld [wPoisonStepCount + 1], a
	ld de, wPoisonStepCount
; Print the weight, with four of the five digits in front of the decimal point
	hlcoord 9, 15
	lb bc, 2, (4 << 4) | 5
	call PrintNum

; Replace the decimal point with a m symbol
	hlcoord 13, 14
	ld [hl], $5e
	inc hl
	inc hl
	inc hl
	ld [hl], $5f
	ret
.Height:
	db "Height@" ;   ? ?? @" ; HT  ?'??"
.Weight:
	db "Weight@" ;   ???lb@"
.Kilos:
	db "0Kg@"