CheckPartyFullAfterContest:
	ld a, [wContestMonSpecies]
	and a
	jp z, .DidntCatchAnything
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wContestMonSpecies]
	ld [hli], a
	ld [wCurSpecies], a
	ld a, -1
	ld [hl], a
	ld hl, wPartyMon1Species
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOTs
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname

.Party_SkipNickname:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wMonOrItemNameBuffer
	call CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	call SetCaughtData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, LANDMARK_NATIONAL_PARK
	or b
	ld [hl], a
	xor a
	ld [wContestMonSpecies], a
	and a ; BUGCONTEST_CAUGHT_MON
	ld [wScriptVar], a
	ret

.TryAddToBox:
	newfarcall NewStorageBoxPointer
	jr c, .BoxFull
	push bc
	xor a
	ld [wCurPartyMon], a
	ld hl, wContestMon
	ld de, wBufferMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, wPlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wBufferMonAltSpecies], a
	ld [wNamedObjectIndex], a
	call GetPokemonName
	pop bc
	ld a, b
	ld [wBufferMonBox], a
	ld a, c
	ld [wBufferMonSlot], a
	newfarcall UpdateStorageBoxMonFromTemp
	call GiveANickname_YesNo
	ld hl, wStringBuffer1
	jr c, .Box_SkipNickname
	ld a, BUFFERMON
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname
	ld hl, wMonOrItemNameBuffer

.Box_SkipNickname:
	ld de, wBufferMonNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	newfarcall UpdateStorageBoxMonFromTemp

.BoxFull:
	ld a, [wBufferMonLevel]
	ld [wCurPartyLevel], a
	call SetBoxMonCaughtData
	ld hl, wBufferMonCaughtLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, LANDMARK_NATIONAL_PARK
	or b
	ld [hl], a
	newfarcall UpdateStorageBoxMonFromTemp
	xor a
	ld [wContestMon], a
	ld a, BUGCONTEST_BOXED_MON
	ld [wScriptVar], a
	ret

.DidntCatchAnything:
	ld a, BUGCONTEST_NO_CATCH
	ld [wScriptVar], a
	ret

GiveANickname_YesNo:
	ld hl, CaughtAskNicknameText
	call PrintText
	jp YesNoBox

CaughtAskNicknameText:
	text_far _CaughtAskNicknameText
	text_end

SetCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtBall
	call GetPartyLocation
	call SetCaughtBall
SetBoxmonOrEggmonCaughtData:
	ld de, MON_CAUGHTLEVEL - MON_CAUGHTBALL
	add hl, de
	ld a, [wCurPartyLevel]
	ld [hl], a
	ld de, MON_CAUGHTDATA - MON_CAUGHTLEVEL
	add hl, de
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	and CAUGHT_TIME_MASK
	ld [hli], a
	call GetCaughtLocationLandmark
	ld b, a
	ld a, [wPlayerGender]
	rrca ; shift bit 0 (PLAYERGENDER_FEMALE_F) to bit 7 (CAUGHT_GENDER_MASK)
	or b
	ld [hl], a
	ret

GetCaughtLocationLandmark:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .notPokecenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .notPokecenter2F

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
.notPokecenter2F:
	jp GetWorldMapLocation

SetBoxMonCaughtData:
	ld hl, wBufferMonCaughtBall
	call SetCaughtBall
	call SetBoxmonOrEggmonCaughtData
	newfarjp UpdateStorageBoxMonFromTemp

SetGiftBoxMonCaughtData:
	ld hl, wBufferMonCaughtBall
	call SetGiftMonCaughtData
	newfarjp UpdateStorageBoxMonFromTemp

SetGiftPartyMonCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtBall
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData:
	ld a, CAUGHT_BALL_DEFAULT
	ld [hl], a
	ld de, MON_CAUGHTLEVEL - MON_CAUGHTBALL
	add hl, de
	ld a, [wCurPartyLevel]
	ld [hl], a
	ld de, MON_CAUGHTDATA - MON_CAUGHTLEVEL
	add hl, de
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	and CAUGHT_TIME_MASK
	or c
	ld [hli], a
	ld a, b
	and CAUGHT_BY_GIRL
	swap a
	ld e, a
	call GetCaughtLocationLandmark
	or e
	ld [hl], a
	ret

SetEggMonCaughtData:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtBall
	call GetPartyLocation
	push hl
	; An egg was not thrown in a ball; wCurItem is whatever the player last
	; had selected in the bag, so it must not be recorded here.
	ld a, CAUGHT_BALL_DEFAULT
	ld [hl], a
	ld a, [wCurPartyLevel]
	push af
	ld a, CAUGHT_EGG_LEVEL
	ld [wCurPartyLevel], a
	call SetBoxmonOrEggmonCaughtData
	pop af
	ld [wCurPartyLevel], a
	pop hl
	ld de, MON_CAUGHTDATA - MON_CAUGHTBALL
	add hl, de
	ld a, [hl]
	or MON_HATCHED
	ld [hl], a
	ret

SetCaughtBall:
; Records wCurItem as the ball the mon was caught with, or CAUGHT_BALL_DEFAULT
; if wCurItem isn't a ball. hl points at the mon's CaughtBall byte.
	ld a, [wCurItem]
	call NormalizeCaughtBall
	ld [hl], a
	ret

GetCaughtBall:
; hl points at a mon's CaughtBall byte.
; Returns a in a, defaulting to CAUGHT_BALL_DEFAULT if it isn't a ball.
	ld a, [hl]
	jp NormalizeCaughtBall

NormalizeCaughtBall:
; Input: a = a candidate ball item id.
; Output: a = a valid ball item id, or CAUGHT_BALL_DEFAULT if the candidate
; isn't a ball. Also the tail of GetCaughtBall, so `a` must be the raw byte.
; Clobbers b and c, and wItemAttributeValue. Preserves wCurItem.
	ld b, a
	ld c, a
	and a
	jr z, .default ; NO_ITEM
	cp NUM_ITEMS + 1
	jr nc, .default ; past the end of the item table
	ld a, [wCurItem]
	push af ; wCurItem must survive: callers read it after this (FRIEND_BALL)
	ld a, b
	ld [wCurItem], a
	ld a, ITEMATTR_POCKET
	newfarcall GetItemAttr ; returns the pocket in a; newfarcall preserves bc
	cp BALL
	jr nz, .not_ball
	ld a, b
	jr .result
.not_ball
	ld a, CAUGHT_BALL_DEFAULT
.result
	ld c, a
	pop af
	ld [wCurItem], a
	ld a, c
	ret
.default
	ld a, CAUGHT_BALL_DEFAULT
	ret
