Core2_NewTurnEndEffects:
	call HandleLeftovers
	call HandleLeppaberry
	call HandleSafeguard
	call HandleScreens
	ret

HandleLeftovers:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jr .do_it

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn
.do_it

	callfar GetUserItem
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld a, b
	cp HELD_LEFTOVERS
	ret nz

	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP

.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z

.restore
	farcall GetSixteenthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP
	ld hl, BattleText_TargetRecoveredWithItem
	jp StdBattleTextbox

HandleLeppaberry:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	callfar GetUserItem
	ld a, b
	cp HELD_RESTORE_PP
	jr nz, .quit
	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wPartyMon1Moves
	ld a, [wCurBattleMon]
	call GetPartyLocation
	ldh a, [hBattleTurn]
	and a
	jr z, .wild
	ld de, wWildMonPP
	ld hl, wWildMonMoves
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wOTPartyMon1Moves
	ld a, [wCurOTMon]
	call GetPartyLocation

.wild
	ld c, $0
.loop
	ld a, [hl]
	and a
	jr z, .quit
	ld a, [de]
	and PP_MASK
	jr z, .restore
	inc hl
	inc de
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop

.quit
	ret

.restore
	; lousy hack
	ld a, [hl]
	cp SKETCH
	ld b, 1
	jr z, .sketch
	ld b, 5
.sketch
	ld a, [de]
	add b
	ld [de], a
	push bc
	push bc
	ld a, [hl]
	ld [wTempByteValue], a
	ld de, wBattleMonMoves - 1
	ld hl, wBattleMonPP
	ldh a, [hBattleTurn]
	and a
	jr z, .player_pp
	ld de, wEnemyMonMoves - 1
	ld hl, wEnemyMonPP
.player_pp
	inc de
	pop bc
	ld b, 0
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	pop de
	pop bc

	ld a, [wTempByteValue]
	cp [hl]
	jr nz, .skip_checks
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerSubStatus5]
	jr z, .check_transform
	ld a, [wEnemySubStatus5]
.check_transform
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .skip_checks
	ld a, [de]
	add b
	ld [de], a
.skip_checks
	callfar GetUserItem
	ld a, [hl]
	ld [wNamedObjectIndex], a
	xor a
	ld [hl], a
	call GetPartymonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .consume_item
	ld a, [wBattleMode]
	dec a
	jr z, .skip_consumption
	call GetOTPartymonItem

.consume_item
	xor a
	ld [hl], a

.skip_consumption
	call GetItemName
	call SwitchTurnCore
	call ItemRecoveryAnim
	call SwitchTurnCore
	ld hl, BattleText_UserRecoveredPPUsing
	jp StdBattleTextbox

HandleSafeguard:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .player1
	call .CheckPlayer
	jr .CheckEnemy

.player1
	call .CheckEnemy
.CheckPlayer:
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, wPlayerSafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [wPlayerScreens], a
	xor a
	jr .print

.CheckEnemy:
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, wEnemySafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [wEnemyScreens], a
	ld a, $1

.print
	ldh [hBattleTurn], a
	ld hl, BattleText_SafeguardFaded
	jp StdBattleTextbox

HandleScreens:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .Both
	call .CheckPlayer
	jr .CheckEnemy

.Both:
	call .CheckEnemy

.CheckPlayer:
	call SetPlayerTurn
	ld de, .Your
	call .Copy
	ld hl, wPlayerScreens
	ld de, wPlayerLightScreenCount
	jr .TickScreens

.CheckEnemy:
	call SetEnemyTurn
	ld de, .Enemy
	call .Copy
	ld hl, wEnemyScreens
	ld de, wEnemyLightScreenCount

.TickScreens:
	bit SCREENS_LIGHT_SCREEN, [hl]
	call nz, .LightScreenTick
	bit SCREENS_REFLECT, [hl]
	call nz, .ReflectTick
	ret

.Copy:
	ld hl, wStringBuffer1
	jp CopyName2

.Your:
	db "Your@"
.Enemy:
	db "Enemy@"

.LightScreenTick:
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_LIGHT_SCREEN, [hl]
	push hl
	push de
	ld hl, BattleText_MonsLightScreenFell
	call StdBattleTextbox
	pop de
	pop hl
	ret

.ReflectTick:
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_REFLECT, [hl]
	ld hl, BattleText_MonsReflectFaded
	jp StdBattleTextbox

GetTrainerBackpic:
; Load the player character's backpic (6x6) into VRAM starting from vTiles2 tile $31.

; Special exception for Lyra.
	ld b, BANK(LyraBackpic)
	ld hl, LyraBackpic
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .Decompress

; What gender are we?
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .Ethan
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .Ethan

; It's a girl.
	farcall GetKrisBackpic
	ret

.Ethan:
; It's a boy.
	ld b, BANK(EthanBackpic)
	ld hl, EthanBackpic

.Decompress:
	ld de, vTiles2 tile $31
	ld c, 7 * 7
	predef DecompressGet2bpp
	ret

HandleEncore:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .player_1
	call .do_player
	jr .do_enemy

.player_1
	call .do_enemy
.do_player
	ld hl, wPlayerSubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [wPlayerEncoreCount]
	dec a
	ld [wPlayerEncoreCount], a
	jr z, .end_player_encore
	ld hl, wBattleMonPP
	ld a, [wCurMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ret nz

.end_player_encore
	ld hl, wPlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	call SetEnemyTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextbox

.do_enemy
	ld hl, wEnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [wEnemyEncoreCount]
	dec a
	ld [wEnemyEncoreCount], a
	jr z, .end_enemy_encore
	ld hl, wEnemyMonPP
	ld a, [wCurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ret nz

.end_enemy_encore
	ld hl, wEnemySubStatus5
	res SUBSTATUS_ENCORED, [hl]
	call SetPlayerTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextbox

CheckAmuletCoin:
	ld a, [wBattleMonItem]
	ld b, a
	callfar GetItemHeldEffect
	ld a, b
	cp HELD_AMULET_COIN
	ret nz
	ld a, 1
	ld [wAmuletCoin], a
	ret

HandleFutureSight:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, wPlayerFutureSightCount
	ldh a, [hBattleTurn]
	and a
	jr z, .okay
	ld hl, wEnemyFutureSightCount

.okay
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	cp $1
	ret nz

	ld hl, BattleText_TargetWasHitByFutureSight
	call StdBattleTextbox

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	push af
	ld a, FUTURE_SIGHT
	ld [hl], a

	callfar UpdateMoveData
	xor a
	ld [wAttackMissed], a
	ld [wAlreadyDisobeyed], a
	ld a, EFFECTIVE
	ld [wTypeModifier], a
	callfar DoMove
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	pop af
	ld [hl], a

	call UpdateBattleMonInParty
	jp UpdateEnemyMonInParty

CheckRedsPikachu:
;CheckBoostingAbilities:
	call HandleRedsPikachuOffenses
	call HandleRedsPikachuDefenses
	ret

HandleRedsPikachuOffenses:
	; Only apply on enemy turn (Red's side)
	ldh a, [hBattleTurn]
	and a
	ret z              ; enemy's turn → return

	; Check trainer is Red
	ld a, [wOtherTrainerClass]
	cp RED
	ret nz

	; Check species is Pikachu
	ld a, [wEnemyMonSpecies]
	cp PIKACHU
	ret nz

; boost by 50%
	ld a, 50
	add 100
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	jp Divide

HandleRedsPikachuDefenses:
	; this only applies when it's the player's turn
	ldh a, [hBattleTurn]
	and a
	ret nz              ; player turn → return

	; Check trainer is Red
	ld a, [wOtherTrainerClass]
	cp RED
	ret nz

	; Check species is Pikachu
	ld a, [wEnemyMonSpecies]
	cp PIKACHU
	ret nz

; boost by 50%
	ld a, 50
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	jp Divide

WriteDownOldStatsForGainCalculation::
	inc hl ; Max HP.
	inc hl ; Max HP + 1.
	inc hl ; Atk high byte (big-endian).
	ld a, [hli]
	ld [wTempMonLevelUpStatGain + 0], a ; Atk.
	inc hl

	ld a, [hli]
	ld [wTempMonLevelUpStatGain + 1], a ; Def.
	inc hl

	ld a, [hli]
	ld [wTempMonLevelUpStatGain + 4], a ; Speed.
	inc hl

	ld a, [hli]
	ld [wTempMonLevelUpStatGain + 2], a ; Special atk.
	inc hl

	ld a, [hl]
	ld [wTempMonLevelUpStatGain + 3], a ; Special def.
	ret

GetWeatherImage:
	ld a, [wBattleWeather]
	ld de, ClearWeatherImage
	lb bc, PAL_BATTLE_OB_BLUE, 4
	cp WEATHER_NONE
	jr z, .done
	ld de, RainWeatherImage
	lb bc, PAL_BATTLE_OB_BLUE, 4
	cp WEATHER_RAIN
	jr z, .done
	ld de, HailWeatherImage
	lb bc, PAL_BATTLE_OB_BLUE, 4
	cp WEATHER_HAIL
	jr z, .done
	ld de, SunWeatherImage
	ld b, PAL_BATTLE_OB_YELLOW
	cp WEATHER_SUN
	jr z, .done
	ld de, SandstormWeatherImage
	ld b, PAL_BATTLE_OB_BROWN
	cp WEATHER_SANDSTORM
	ret nz
	
.done
	push bc
	ld b, BANK(WeatherImages) ; c = 4
	ld hl, vTiles0
	call Request2bpp
	pop bc
	ld hl, wShadowOAMSprite00
	ld de, .WeatherImageOAMData
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	jr nz, .loop
	ret

.WeatherImageOAMData
; positions are backwards since
; we load them in reverse order
	db $90, $1c ; y/x - bottom right
	db $90, $14 ; y/x - bottom left
	db $88, $1c ; y/x - top right
	db $88, $14 ; y/x - top left

TrainerBattleInfo:
	farcall EmptyBattleTextbox
;	call .BlankBGMap
	call ClearSprites
	push hl
	push de
	push bc
	xor a
	ld [wTrainerInfoPage], a
	call UpdatePageText
	call StatChangesInfoBox
	call WaitButtonInfoTrainer
	jp PopBCDEHL

.BlankBGMap:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld hl, wDecompressScratch
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	ld a, ' '
	call ByteFill

	ld de, wDecompressScratch
	hlbgcoord 0, 0
	lb bc, BANK(@), (BG_MAP_WIDTH * BG_MAP_HEIGHT) / LEN_2BPP_TILE
	call Request2bpp

	pop af
	ldh [rSVBK], a
	ret

StatChangesInfoBox:
	hlcoord 0, 0 ; player
	lb bc, 14, 8
	call Textbox

	hlcoord 10, 0 ; enemy
	lb bc, 14, 8
	call Textbox
	
	hlcoord 1, 0
	ld de, MainText.player
	call PlaceString
	ld de, StatTexts.attack
	lb bc, 1, 2
	ld hl, wPlayerStatLevels
	call StatChangesInfoBoxLoop
	
	hlcoord 11, 0
	ld de, MainText.enemy
	call PlaceString
	ld de, StatTexts.attack
	lb bc, 11, 2
	ld hl, wEnemyStatLevels
	; fallthrough
	
StatChangesInfoBoxLoop:
	push hl
	call CoordsBCtoHL
	ld a, c
	cp 16
	jr nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 6				; b = 7 or 17
	ld b, a
	pop hl
	call PrintStatChangeValue
	inc hl				; hl = StatLevel + 1
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 6
	ld b, a
	inc c
	inc c
	jr StatChangesInfoBoxLoop
.finish
	pop hl
	ret

PrintStatChangeValue: ; Input is hl (either wPlayerStatX or wEnemyStatX) and bc (coords to place text)
	push de
	push hl
	push bc
	ld de, wStringBuffer4
	ld a, TX_START
	ld [de], a
	inc de
	ld a, [hl]  	; Stat
	ld c, a
	cp 7			; 7 = no changes
	jr c, .lowered
	jr z, .same
	ld a, '▲'
	ld [de], a
	inc de
	ld a, c
	sub 7			; a = a - 7
	jr .insert
.same
	ld a, '▲'
	ld [de], a
	inc de
	xor a
	jr .insert
.lowered
	ld a, '▼'
	ld [de], a
	inc de
	ld a, 7
	sub c
.insert
	add '0'
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a		; Terminate string
	inc de
	ld [de], a		; Terminate string
	ld hl, wStringBuffer4
	pop bc
	push bc
	push hl
	call CoordsBCtoHL
	ld b, h
	ld c, l
	pop hl
	call PrintTextboxTextAt
	pop bc
	pop hl
	pop de
	ret

StatsInfoBox:
	hlcoord 0, 0 ; player
	lb bc, 14, 8
	call Textbox

	hlcoord 10, 0 ; enemy
	lb bc, 14, 8
	call Textbox

	hlcoord 1, 0
	ld de, MainText.player
	call PlaceString
	ld de, StatTexts
	lb bc, 1, 2
	ld hl, wBattleMonMaxHP
	call StatsInfoBoxLoop
	
	hlcoord 11, 0
	ld de, MainText.enemy
	call PlaceString
	ld de, StatTexts
	lb bc, 11, 2
	ld hl, wEnemyMonMaxHP
	jp StatsInfoBoxLoop

StatsInfoBoxLoop:
	push hl
	call CoordsBCtoHL
	ld a, c
	cp 14
	jr nc, .finish
	push bc
	call PlaceString
	pop bc
	ld a, b
	add 4				; b = 6 or 16
	ld b, a
	pop hl
	push de
	ld d, h
	ld e, l
	push hl
	call CoordsBCtoHL
	push bc
	lb bc, 2, 4
	call PrintNum
	pop bc
	pop hl
	pop de
	inc hl
	inc hl
	inc de				; de gets increased to the end of the string in PlaceString, so increase it 1 more for the next string
	ld a, b
	sub 4
	ld b, a
	inc c
	inc c
	jr StatsInfoBoxLoop
.finish
	pop hl
	ret

FieldStatusPagesLayout:
	hlcoord 0, 0 ; weather text box
	lb bc, 2, 18
	call Textbox

	hlcoord 0, 4 ; player
	lb bc, 10, 8
	call Textbox

	hlcoord 10, 4 ; enemy
	lb bc, 10, 8
	call Textbox
.weather
	hlcoord 6, 0
	ld de, FieldTexts.weather
	call PlaceString
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ld de, FieldTexts.hail
	jr z, .done
	cp WEATHER_SUN
	ld de, FieldTexts.sun
	jr z, .done
	cp WEATHER_RAIN
	ld de, FieldTexts.rain
	jr z, .done
	cp WEATHER_SANDSTORM
	ld de, FieldTexts.sand
	jr z, .done
	ld de, FieldTexts.none
.done
	hlcoord 1, 1
	call PlaceString

	call GetWeatherImage

	ld a, [wBattleWeather]
	cp WEATHER_NONE
	jr z, .skip_weather_turns
	ld de, wStringBuffer5
	ld a, [wWeatherCount]
	cp 10
	ld de, FieldTexts.infinite
	jr nc, .not_1_turn
	ld de, wWeatherCount
	ld hl, FieldTexts.infinite
	lb bc, 1, 1
	call FieldInfoBoxPlaceElement
	ld a, [wWeatherCount]
	cp 1
	ld de, FieldTexts.turnsleft
	jr nz, .not_1_turn
	ld de, FieldTexts.turnleft
.not_1_turn
	hlcoord 2, 2
	call PlaceString
.skip_weather_turns
	hlcoord 1, 4
	ld de, MainText.player
	call PlaceString	
	hlcoord 11, 4
	ld de, MainText.enemy
	call PlaceString
	lb bc, 1, 5
	ret

FieldInfoBox1:
	call FieldStatusPagesLayout

; spikes
	lb bc, 1, 5
	ld de, FieldTexts.spikes
	call FieldInfoBox1Spikes

; confused
	ld de, FieldTexts.confused
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .enemy_confuse
	lb bc, 1, 7
	call FieldInfoBoxStatus
.enemy_confuse
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .player_encore
	lb bc, 11, 7
	call FieldInfoBoxStatus

; encored
.player_encore
	ld de, FieldTexts.encored
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	jr z, .enemy_encore
	lb bc, 1, 9
	call FieldInfoBoxStatus
.enemy_encore
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_ENCORED, a
	jr z, .player_disable
	lb bc, 11, 9
	call FieldInfoBoxStatus

; disabled
.player_disable
	ld de, FieldTexts.disabled
	ld a, [wDisabledMove]
	and a
	jr z, .enemy_disable
	lb bc, 1, 11
	call FieldInfoBoxStatus
.enemy_disable
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .player_toxic
	lb bc, 11, 11
	call FieldInfoBoxStatus

; toxic
.player_toxic
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr z, .enemy_toxic
	lb bc, 1, 13
	ld de, wPlayerToxicCount
	call FieldInfoBox1Toxic
.enemy_toxic
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	ret z
	lb bc, 11, 13
	ld de, wEnemyToxicCount
	jp FieldInfoBox1Toxic

FieldInfoBox2:
	call FieldStatusPagesLayout

; safeguard
	lb bc, 1, 6
	call FieldInfoBox2Safeguard

.handle_reflect
; reflect
	lb bc, 1, 9
	call FieldInfoBox2Reflect
; light screen
	lb bc, 1, 12
	jp FieldInfoBox2LScreen

FieldInfoBox2Reflect: ; input: bc -> coords
	ld hl, wPlayerScreens
	ld de, wPlayerReflectCount
	bit 4, [hl]
	jr z, .enemy
	ld hl, FieldTexts.reflect
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemyReflectCount
	bit 4, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.reflect
	jp FieldInfoBoxPlaceElement
	
FieldInfoBox2LScreen: ; input: bc -> coords
	ld hl, wPlayerScreens
	ld de, wPlayerLightScreenCount
	bit 3, [hl]
	jr z, .enemy
	ld hl, FieldTexts.lightscreen
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemyLightScreenCount
	bit 3, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.lightscreen
	jp FieldInfoBoxPlaceElement

FieldInfoBox1Spikes: ; input: bc -> coords
	ld hl, wPlayerScreens
	bit 0, [hl]
	jr z, .enemy
	push de
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	pop de
.enemy
	ld hl, wEnemyScreens
	bit 0, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	call CoordsBCtoHL
	jp PlaceString

FieldInfoBox2Safeguard:
	ld hl, wPlayerScreens
	ld de, wPlayerSafeguardCount
	bit 2, [hl]
	jr z, .enemy
	ld hl, FieldTexts.safeguard
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
.enemy
	ld hl, wEnemyScreens
	ld de, wEnemySafeguardCount
	bit 2, [hl]
	ret z
	ld a, b
	add 10
	ld b, a
	ld hl, FieldTexts.safeguard
	jp FieldInfoBoxPlaceElement

FieldInfoBoxStatus: ; input: bc -> coords, de -> text
	push de
	call CoordsBCtoHL
	call PlaceString
	pop de
	ret
	
FieldInfoBox1Toxic: ; input: bc -> coords , de -> count
	ld hl, FieldTexts.toxic
	push hl
	push bc
	call FieldInfoBoxPlaceElement
	pop bc
	pop hl
	ret
	
FieldInfoBoxPlaceElement: ; input: bc -> coords, hl -> Field text, de -> Count
	push de
	ld d, h
	ld e, l
	call CoordsBCtoHL
	push bc
	call PlaceString
	pop bc
	inc c
	call CoordsBCtoHL
	pop de
	push de
	ld a, [de]
	ld de, wStringBuffer5
	add '0'
	ld [de], a
	ld a, TX_END
	inc de
	ld [de], a
	dec de
	push bc
	call PlaceString
	pop bc
	pop de
	ld a, [de]
	cp 1
	ld de, FieldTexts.turns
	jr nz, .not_1_turn
	ld de, FieldTexts.turn
.not_1_turn
	inc b
	call CoordsBCtoHL
	jp PlaceString

MainText:
.page1:
	db "◀ Page 1/4 ▶@"
.page1_content:
	db "Stat Changes  @"

.page2:
	db "◀ Page 2/4 ▶@"
.page2_content:
	db "Actual Stats  @"

.page3:
	db "◀ Page 3/4 ▶@"
.page3_content:
	db "Field/Status 1@"

.page4:
	db "◀ Page 4/4 ▶@"
.page4_content:
	db "Field/Status 2@"

.player:
	db " Player @"
	
.enemy:
	db " Enemy @"

StatTexts:
.health:
	db "HP:  @"

.attack:
	db "Atk: @"

.defense:
	db "Def: @"

.speed:
	db "Spe: @"
	
.sattack:
	db "SAtk:@"
	
.sdefense:
	db "SDef:@"
	
.accuracy:
	db "Acc: @"
	
.evasiveness:
	db "Eva:@"

FieldTexts:
.weather:
	db " Weather@"
	
.none:
	db "Normal@"
	
.sun:
	db "Sunny@"

.rain:
	db "Raining@"
	
.sand:
	db "Sandstorm@"
	
.hail:
	db "Hail@"
	
.spikes:
	db "Spikes@"

.toxic:
	db "Toxic@"

.reflect:
	db "Reflect@"
	
.lightscreen:
	db "L.Screen@"

.safeguard:
	db "S.Guard@"

.confused:
	db "Confused@"
	
.encored:
	db "Encored@"
	
.disabled:
	db "Disabled@"

.turnsleft:
	db " turns left@"

.turnleft:
	db " turn left@"

.infinite:
	db "@"
	
.turns:
	db " turns@"

.turn:
	db " turn@"

JoyWaitAorBorDPADInfoTrainer:
.loop
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
	ldh a, [hJoyPressed]
	and D_RIGHT
	call nz, InfoBoxRightPress
	ldh a, [hJoyPressed]
	and D_LEFT
	call nz, InfoBoxLeftPress
	call UpdateTimeAndPals
	jr .loop

WaitButtonInfoTrainer:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call WaitBGMap
	call JoyWaitAorBorDPADInfoTrainer
	pop af
	ldh [hOAMUpdate], a
	ret
	
; ========================
; Left button navigation
; ========================
InfoBoxLeftPress:
	; play switching pockets SFX	
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX

	ld a, [wTrainerInfoPage]
	cp 0
	jr z, .jump_to_page_4
	cp 1
	jr z, .jump_to_page_1
	cp 2
	jr z, .jump_to_page_2
	cp 3
	ret nz
.jump_to_page_3
	call DecreasePage
	call UpdatePageText
	jp FieldInfoBox1

.jump_to_page_1
	call DecreasePage
	call UpdatePageText
	jp StatChangesInfoBox

.jump_to_page_2
	call DecreasePage
	call UpdatePageText
	jp StatsInfoBox

.jump_to_page_4
	call DecreasePage
	call UpdatePageText
	jp FieldInfoBox2

; ========================
; Right button navigation
; ========================
InfoBoxRightPress:
	; play switching pockets SFX	
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX

	ld a, [wTrainerInfoPage]
	cp 0
	jr z, .jump_to_page_2
	cp 1
	jr z, .jump_to_page_3
	cp 2
	jr z, .jump_to_page_4
	call IncreasePage
	call UpdatePageText
	jp StatChangesInfoBox

.jump_to_page_2
	call IncreasePage
	call UpdatePageText
	jp StatsInfoBox

.jump_to_page_3
	call IncreasePage
	call UpdatePageText
	jp FieldInfoBox1

.jump_to_page_4
	call IncreasePage
	call UpdatePageText
	jp FieldInfoBox2

; ========================
; Page counter functions
; ========================
IncreasePage:
	ld a, [wTrainerInfoPage]
	inc a
	cp 4                     ; Pages 0..4 (inclusive)
	jr c, .store
	xor a                    ; Wrap to page 0
.store
	ld [wTrainerInfoPage], a
	ret

DecreasePage:
	ld a, [wTrainerInfoPage]
	or a
	jr nz, .dec
	ld a, 4                  ; Wrap to last page
.dec
	dec a
	ld [wTrainerInfoPage], a
	ret

; ========================
; Update text for each page
; ========================
UpdatePageText:
	hlcoord 4, 17
	ld a, [wTrainerInfoPage]

	cp 1
	jr z, .page_2
	cp 2
	jr z, .page_3
	cp 3
	jr z, .page_4

; Default: page 0
	ld de, MainText.page1
	call PlaceString
	ld de, MainText.page1_content
	jr .done

.page_2
	ld de, MainText.page2
	call PlaceString
	ld de, MainText.page2_content
	jr .done

.page_3
	ld de, MainText.page3
	call PlaceString
	ld de, MainText.page3_content
	jr .done

.page_4
	ld de, MainText.page4
	call PlaceString
	ld de, MainText.page4_content
.done
	hlcoord 4, 16
	jp PlaceString

CoordsBCtoHL:
	ld hl, wTilemap
	ld a, c
	push bc
	ld c, SCREEN_WIDTH
	call HLMultiply
	pop bc
	ld a, b
	add l
	ld l, a
	ret nc
	inc h
	ret

HLMultiply:
; Returns hl + a * c
	and a
	ret z
	
	push bc
	ld b, a
	xor a
.loop
	add c
	jr nc, .nocarry
	inc h
.nocarry
	dec b
	jr nz, .loop
	ld c, a
	add hl, bc
	pop bc
	ret
