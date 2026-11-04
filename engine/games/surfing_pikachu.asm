; Surfing Pikachu minigame engine
; Ported from pokeyellow-master

SurfingPikachu::
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
; clear any stale VBlank hook and its state
	xor a
	ldh [hVBlankHookFunction], a
	ldh [hSurfingRedrawMode], a
	ldh [hSurfingVBCopySize], a
	call ClearBGPalettes
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD

; set up VBlank hook trampoline
	ld hl, .LCDCallbackPoint
	ld de, SurfingPikachu_LCDCallback
	ld bc, .LCDCallbackPoint_End - .LCDCallbackPoint
	call CopyBytes
; The trampoline runs from WRAM, so the reserved buffer must hold all of it.
ASSERT .LCDCallbackPoint_End - .LCDCallbackPoint <= 32, \
	"SurfingPikachu_LCDCallback is too small for the trampoline"
; The VBlank hook is the second entry point of the trampoline, so the hook
; function has to jump into the middle of the copied block - not at its start
; (that is the LCD/STAT entry).
	ld a, JP_INSTRUCTION
	ldh [hVBlankHookFunction + 0], a
	ld a, LOW(SurfingPikachu_LCDCallback + (.LCDCallbackPoint_VblankHook - .LCDCallbackPoint))
	ldh [hVBlankHookFunction + 1], a
	ld a, HIGH(SurfingPikachu_LCDCallback + (.LCDCallbackPoint_VblankHook - .LCDCallbackPoint))
	ldh [hVBlankHookFunction + 2], a

; Load graphics, tilemap and palettes. Ordering matters: the LCD is already
; off here, so the VRAM writes stick. This routine also zeroes the minigame
; state and initialises HP/speed/wave heights, which the game logic depends on.
	call SurfingPikachuMinigame_LoadGraphics
	call SurfingPikachuMinigame_LoadGFXAndLayout
	call SurfingPikachuMinigameIntro
	ld a, [wSurfingMinigameRoutineNumber]
	bit 7, a
	jp nz, .exit
; the intro overwrites part of Graphics2 and Graphics1 with Graphics3, so restore
; just those bytes, then reload the gameplay tilemaps and palettes
	call DisableLCD
	call SurfingPikachuMinigame_RestoreIntroOverlap
	call ClearSprites
	farcall ClearSpriteAnims
	call SurfingPikachuMinigame_LoadGFXAndLayout

	ld a, LCDC_ON | LCDC_WIN_9C00 | LCDC_WIN_ON | LCDC_OBJ_ON | LCDC_BG_ON
	ldh [rLCDC], a
	call EnableLCD

; Disable the VBlank copier so it can't overwrite the VBlank hook's tilemap updates.
	xor a
	ldh [hBGMapMode], a

; STAT interrupt used for per-scanline wave in Yellow. pokecrystal's
; init.asm already selects STAT_MODE_0 (HBlank) and IE_DEFAULT already
; contains IE_STAT, so the interrupt is live by default; the handler itself
; is the generic hFunction trampoline in HRAM (reti unless a scene installs
; its own callback).
; master loop
.master_loop:
	ld a, [wSurfingMinigameRoutineNumber]
	bit 7, a
	jr nz, .exit
	call SurfingPikachu_GetJoypad_3FrameBuffer
	call RunSurfingMinigameRoutine
	; `callfar` loads the target's bank into a, which would clobber the offset
	; argument of PlaySpriteAnimationsFromOAMOffset, so store the offset here
	; and enter the update loop directly.
	ld a, 15 * OBJ_SIZE ; leave OAM sprites 0-14 to the static layout
	ld [wCurSpriteOAMAddr], a
	callfar DoNextFrameForAllSprites
	call SurfingMinigame_MoveClouds
	call DelayFrame
	call SurfingMinigame_UpdateMusicTempo
	jr .master_loop

; (gameplay routines will be added here)

.exit:
; teardown. ExitAllMenus restores the map tileset/palettes and fades back in,
; but it does not undo the LCD/scroll/sprite state the minigame changed, so
; reset those here.
	xor a
	ldh [hVBlankHookFunction], a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	farcall ClearSpriteAnims
	call ClearSprites
; Disarm the per-scanline wave before clearing its pointer: with the trampoline
; still set to `jp`, LCDGeneric would write the zeroed pointer index to rJOYP.
	ld a, RETI_INSTRUCTION
	ldh [hFunctionInstruction], a
	xor a
	ldh [hLCDCPointer], a
	ldh [hSCX], a
	ldh [hSCY], a
; the minigame pins the banked WRAM to the palette/LY-override bank; put it back
	ldh [rSVBK], a
	ld a, SCREEN_HEIGHT_PX ; keep the window below the visible screen
	ldh [hWY], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call DelayFrame
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ret

.LCDCallbackPoint:
	push af
	ld a, BANK(.VBlankHookPayload)
	ld [rROMB0], a
	jp .VBlankHookPayload
.LCDCallbackPoint_JumpBack:
	ldh a, [hROMBank]
	ld [rROMB0], a
	pop af
	reti
.LCDCallbackPoint_VblankHook:
	ld a, BANK(.VBlankHookPayload)
	ld [rROMB0], a
	jp .VBlankHookPayload
.LCDCallbackPoint_VblankHook_JumpBack:
	ldh a, [hROMBank]
	ld [rROMB0], a
	rst Bankswitch
	ret
.LCDCallbackPoint_End:

.VBlankHookPayload:
; count down the held-button sample timer (Yellow decrements hFrameCounter in
; its VBlank handler; the minigame reloads this one with 2 when it samples)
	ldh a, [hSurfingJoypadTimer]
	and a
	jr z, .no_joypad_tick
	dec a
	ldh [hSurfingJoypadTimer], a
.no_joypad_tick:
	ldh a, [hSurfingRedrawMode]
	and a
	jr z, .skip_redraw
	xor a
	ldh [hSurfingRedrawMode], a
	ld hl, wRedrawRowOrColumnSrcTiles
	ldh a, [hSurfingRedrawDest]
	ld e, a
	ldh a, [hSurfingRedrawDest + 1]
	ld d, a
	ld c, SCREEN_HEIGHT
.loop_redraw
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, TILEMAP_WIDTH - 1
	add e
	ld e, a
	jr nc, .no_carry_redraw
	inc d
.no_carry_redraw
	ld a, d
	and HIGH(TILEMAP_AREA - 1)
	or HIGH(vTilemap0)
	ld d, a
	dec c
	jr nz, .loop_redraw
.skip_redraw:
	ldh a, [hSurfingVBCopySize]
	and a
	jr z, .skip_vbcopy
	xor a
	ldh [rVBK], a
	ldh a, [hSurfingVBCopySource + 1]
	ld h, a
	ldh a, [hSurfingVBCopySource]
	ld l, a
	ldh a, [hSurfingVBCopyDest + 1]
	ld d, a
	ldh a, [hSurfingVBCopyDest]
	ld e, a
	ld a, [hl]
	ld [de], a
	xor a
	ld [hSurfingVBCopySize], a
.skip_vbcopy:
	ret

; include gameplay routines
; --- gameplay routines (consolidated from surfing_pikachu_gameplay.asm) ---

; Surfing Pikachu gameplay routines
; Ported from pokeyellow-master

DEF SURFING_MINIGAME_FLAT_WATER_Y EQU $74
DEF SURFING_MINIGAME_CENTER_X     EQU SCREEN_WIDTH_PX / 2 + OAM_X_OFS

; Pikachu states (see wSurfingMinigamePikachuState)
	const_def
	const SURFING_MINIGAME_PIKACHU_STATE_RIDING      ; 0
	const SURFING_MINIGAME_PIKACHU_STATE_JUMPING     ; 1
	const SURFING_MINIGAME_PIKACHU_STATE_LANDING     ; 2
	const SURFING_MINIGAME_PIKACHU_STATE_CRASHED     ; 3
	const SURFING_MINIGAME_PIKACHU_STATE_GAME_END    ; 4
	const SURFING_MINIGAME_PIKACHU_STATE_INIT_RESULTS ; 5
	const SURFING_MINIGAME_PIKACHU_STATE_UPDATE_RESULTS ; 6

; Yellow stores the landing quality in Pikachu's frameset ID. Crystal's frameset
; IDs index a shared global table, so the value lives in its own variable instead.
; The quality values are unchanged: 1 (best) .. 7 (wipeout).

; 8.8 fixed point constants (Yellow used the same 8.8 format via -Q8)
DEF SURFING_MINIGAME_FIXED_0_25      EQU $0040
DEF SURFING_MINIGAME_FIXED_0_5       EQU $0080
DEF SURFING_MINIGAME_FIXED_1_128     EQU $0002
DEF SURFING_MINIGAME_FIXED_NEG_0_25  EQU $ffc0
DEF SURFING_MINIGAME_FIXED_NEG_0_5   EQU $ff80

; Surfing Pikachu object spawn IDs (see SurfingPikachuObjectSpawnData)
DEF SURFING_MINIGAME_OBJ_PLUS500 EQU SPRITE_ANIM_OBJ_SURF_PLUS500
DEF SURFING_MINIGAME_OBJ_PLUS180 EQU SPRITE_ANIM_OBJ_SURF_PLUS180
DEF SURFING_MINIGAME_OBJ_PLUS50  EQU SPRITE_ANIM_OBJ_SURF_PLUS50
DEF SURFING_MINIGAME_OBJ_OH_NO   EQU SPRITE_ANIM_OBJ_SURF_OH_NO

; Yellow's animated_object member names, aliased to Crystal's struct fields.
; The struct layouts are identical (16 bytes, same order).
DEF ANIM_OBJ_INDEX           EQU SPRITEANIMSTRUCT_INDEX
DEF ANIM_OBJ_FRAME_SET       EQU SPRITEANIMSTRUCT_FRAMESET_ID
DEF ANIM_OBJ_CALLBACK        EQU SPRITEANIMSTRUCT_ANIM_SEQ_ID
DEF ANIM_OBJ_TILE            EQU SPRITEANIMSTRUCT_TILE_ID
DEF ANIM_OBJ_X_COORD         EQU SPRITEANIMSTRUCT_XCOORD
DEF ANIM_OBJ_Y_COORD         EQU SPRITEANIMSTRUCT_YCOORD
DEF ANIM_OBJ_X_OFFSET        EQU SPRITEANIMSTRUCT_XOFFSET
DEF ANIM_OBJ_Y_OFFSET        EQU SPRITEANIMSTRUCT_YOFFSET
DEF ANIM_OBJ_DURATION        EQU SPRITEANIMSTRUCT_DURATION
DEF ANIM_OBJ_DURATION_OFFSET EQU SPRITEANIMSTRUCT_DURATIONOFFSET
DEF ANIM_OBJ_FRAME_IDX       EQU SPRITEANIMSTRUCT_FRAME
DEF ANIM_OBJ_FIELD_B         EQU SPRITEANIMSTRUCT_JUMPTABLE_INDEX
DEF ANIM_OBJ_FIELD_C         EQU SPRITEANIMSTRUCT_VAR1
DEF ANIM_OBJ_FIELD_D         EQU SPRITEANIMSTRUCT_VAR2
DEF ANIM_OBJ_FIELD_E         EQU SPRITEANIMSTRUCT_VAR3
DEF ANIM_OBJ_FIELD_F         EQU SPRITEANIMSTRUCT_VAR4

RunSurfingMinigameRoutine:
	ld a, [wSurfingMinigameRoutineNumber]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw SurfingMinigame_StartGame
	dw SurfingMinigame_RunGame
	dw SurfingMinigame_WaitToShowResults
	dw SurfingMinigame_ScrollToResultsScreen
	dw SurfingMinigame_DrawResultsScreenAndWait
	dw SurfingMinigame_WriteHPLeftAndWait
	dw SurfingMinigame_WriteRadnessAndWait
	dw SurfingMinigame_WriteTotalAndWait
	dw SurfingMinigame_AddRemainingHPToTotalAndWait
	dw SurfingMinigame_AddRadnessToTotalAndWait
	dw SurfingMinigame_WaitLast
	dw SurfingMinigame_ExitOnPressA
	dw SurfingMinigame_GameOver

SurfingPikachu_GetJoypad_3FrameBuffer:
; Yellow calls Joypad here to refresh the held-button mirror. In pokecrystal the
; raw state is sampled in VBlank (UpdateJoypad), but hJoyDown is only updated by
; GetJoypad, which normally runs in the overworld/menu loops - not while the
; minigame owns the main loop. Without this call hJoyDown stays frozen at
; whatever it was when the minigame started, so the player cannot steer.
	call GetJoypad
	ldh a, [hSurfingJoypadTimer]
	and a
	jr nz, .delayed
	ldh a, [hJoyDown]
	ld [hSurfingJoypadBuffer], a
	ld a, $2 ; sample held input once every three frames
	ldh [hSurfingJoypadTimer], a
	ret
.delayed
	xor a
	ld [hSurfingJoypadBuffer], a
	ret

SurfingMinigame_StartGame:
	ld a, SPRITE_ANIM_OBJ_SURF_START
	lb de, $48, $e0
	call InitSpriteAnimStruct
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, TRUE
	ld [wSurfingMinigameMusicTempoEnabled], a
	ret

; values for wSurfingMinigameMusicTempoEnabled
DEF SURFING_MINIGAME_TEMPO_SPEED EQU 1 ; follow Pikachu's speed
DEF SURFING_MINIGAME_TEMPO_RESET EQU 2 ; return to the song's normal tempo

; Yellow speeds the music up as Pikachu gets faster. Its sound engine keeps one
; global tempo; Crystal keeps one per channel, so the same 16-bit value has to
; be written to every music channel.
; The update waits until each music channel is on the last frame of its note
; delay, so the new tempo starts on the same note boundary everywhere - this is
; what Yellow's wChannelNoteDelayCounters check does.
SurfingMinigame_UpdateMusicTempo:
	ld a, [wSurfingMinigameMusicTempoEnabled]
	and a
	ret z

	; NOTE_DURATION < 2 means the channel parses its next note on this frame's
	; sound update, so changing the tempo now applies to that note.
	ld a, [wChannel1 + CHANNEL_NOTE_DURATION]
	cp 2
	ret nc
	ld a, [wChannel2 + CHANNEL_NOTE_DURATION]
	cp 2
	ret nc
	ld a, [wChannel3 + CHANNEL_NOTE_DURATION]
	cp 2
	ret nc

	ld a, [wSurfingMinigameMusicTempoEnabled]
	cp SURFING_MINIGAME_TEMPO_RESET
	jr nz, .follow_speed
	xor a
	ld [wSurfingMinigameMusicTempoEnabled], a
	ld de, 117
	jp SurfingMinigame_SetMusicTempo

.follow_speed:
	; de = ((speed & $3ff) >> 7) * 2, exactly as in Yellow
	ld a, [wSurfingMinigamePikachuSpeed]
	ld e, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	and $3
	ld d, a
	sla e
	rl d
	ld e, d
	ld d, 0
	ld hl, .Tempos
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wSurfingMinigameMusicTempo
	ld a, [hli]
	cp e
	jr nz, SurfingMinigame_SetMusicTempo
	ld a, [hl]
	cp d
	ret z
	jr SurfingMinigame_SetMusicTempo

.Tempos:
	dw 117
	dw 109
	dw 101
	dw  93
	dw  85

SurfingMinigame_SetMusicTempo:
; de = tempo to use for every music channel
	ld hl, wSurfingMinigameMusicTempo
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wChannel1 + CHANNEL_TEMPO
	ld c, NUM_MUSIC_CHANS
.loop
	ld [hl], e
	inc hl
	ld [hl], d
	dec hl
	push de
	ld de, CHANNEL_STRUCT_LENGTH
	add hl, de
	pop de
	dec c
	jr nz, .loop
	ret

SurfingMinigame_RunGame:
	ld a, [wSurfingMinigameDistance]
	cp $18
	jr nc, .finished
	ld hl, wSurfingMinigamePikachuHP
	ld a, [hli]
	or [hl]
	and a
	jr z, .dead
	call Random
	ld [wSurfingMinigameWaveRandomValue], a
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	call SurfingMinigame_ScrollAndGenerateBGMap
	call SurfingMinigame_UpdatePikachuDistance
	call SurfingMinigame_Deduct1HP
	call SurfingMinigame_DrawHP
	ret
.finished
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, SURFING_MINIGAME_TEMPO_RESET
	ld [wSurfingMinigameMusicTempoEnabled], a
	ld a, 192
	ld [wSurfingMinigameRoutineDelay], a
	ret
.dead
	ld a, TRUE
	ld [wSurfingMinigameGameOver], a
	ld a, $c
	ld [wSurfingMinigameRoutineNumber], a
	ld a, $80
	ld [wSurfingMinigameGameOverDelay], a
	ld a, SURFING_MINIGAME_OBJ_OH_NO
	lb de, $88, 88
	call InitSpriteAnimStruct
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], $80
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld [hl], $80
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], $30
	ld a, SURFING_MINIGAME_TEMPO_RESET
	ld [wSurfingMinigameMusicTempoEnabled], a
	ret

SurfingMinigame_WaitToShowResults:
; Match Yellow: keep the water undulating, bob Pikachu on the wave, and
; CoastAfterGoal (scroll forward + generate beach columns) so any wave that
; was on screen when the run ended scrolls off during the delay instead of
; lingering into the shore-surf transition.
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	call SurfingMinigame_CoastAfterGoal
	call SurfingMinigame_RunDelayTimer
	jr c, .done
	ret
.done
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, $90
	ldh [hSCX], a
	ld a, $72
	ld [wSurfingMinigameWaveFunctionNumber], a
	ld a, 4
	ld [wSurfingMinigamePikachuState], a
; seed the override table for the shore-surf transition
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a
	xor a
	ld [wSurfingMinigameSCX], a
	ld [wSurfingMinigameSCX2], a
	ld [wSurfingMinigameSCXHi], a
	ret

SurfingMinigame_CoastAfterGoal:
	ld a, $a0 ; generate tiles ahead of the viewport
	ld [wSurfingMinigameXOffset], a
	ldh a, [hSCX]
	ld h, a
	ld a, [wSurfingMinigameSCX]
	ld l, a
	ld de, $0900 ; 9.0 pixels per frame
	add hl, de
	ld a, l
	ld [wSurfingMinigameSCX], a
	ld a, h
	ldh [hSCX], a
	jp SurfingMinigame_GenerateBGMap

SurfingMinigame_ScrollToResultsScreen:
; Keep the water animating during the shore surf: keep the LCDGeneric hook armed
; so the surface keeps its undulation instead of freezing into a flat plane.
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a
	ldh a, [hSCX]
	and a
	jp z, .shoreFinished
; keep the surface undulating and let the beach transition generate as Pikachu
; surfs to shore (GenerateBGMap is required for the scroll to terminate)
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	ldh a, [hSCX]
	dec a
	dec a
	dec a
	dec a
	ldh [hSCX], a
	ld a, TILEMAP_WIDTH_PX - 32
	ld [wSurfingMinigameXOffset], a
	call SurfingMinigame_GenerateBGMap
	ret
.shoreFinished
	xor a
	ld [wSurfingMinigamePikachuSpeed], a
	ld [wSurfingMinigamePikachuSpeed + 1], a
; shore surf done: disarm the scanline wave so the beach results screen is flat,
; and stop the VBlank column copier so it can no longer overwrite the beach
; tilemap with stale wave columns.
	ld a, RETI_INSTRUCTION
	ldh [hFunctionInstruction], a
	xor a
	ldh [hLCDCPointer], a
	ldh [hSurfingRedrawMode], a
	ldh [hSurfingVBCopySize], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, 5
	ld [wSurfingMinigamePikachuState], a
	ret

SurfingMinigame_DrawResultsScreenAndWait:
	call SurfingMinigame_DrawResultsScreen
	ld a, 32
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_WriteHPLeftAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_WriteHPLeft
	ld a, 64
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_WriteRadnessAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_WriteRadness
	ld a, 64
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_WriteTotalAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_WriteTotal
	ld a, 64
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_AddRemainingHPToTotalAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_AddRemainingHPToTotal
	push af
	call SurfingMinigame_BCDPrintTotalScore
	ld a, 1
	ldh [hBGMapMode], a
	pop af
	ret nc
	ld a, 64
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_AddRadnessToTotalAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_AddRadnessToTotal
	push af
	call SurfingMinigame_BCDPrintTotalScore
	ld a, 1
	ldh [hBGMapMode], a
	pop af
	ret nc
	ld a, 128
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	call DidPlayerGetAHighScore
	ret nc
	call SurfingMinigame_PrintTextHiScore
	ld a, SURFING_MINIGAME_PIKACHU_STATE_UPDATE_RESULTS
	ld [wSurfingMinigamePikachuState], a
	ret

SurfingMinigame_WaitLast:
	call SurfingMinigame_RunDelayTimer
	ret nc
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_ExitOnPressA:
	ld a, [hSurfingJoypadBuffer]
	and PAD_A
	ret z
	ld a, $80
	ld [wSurfingMinigameRoutineNumber], a
	ret

SurfingMinigame_GameOver:
	ld a, [wSurfingMinigameGameOverDelay]
	and a
	jr z, .done
	dec a
	ld [wSurfingMinigameGameOverDelay], a
	ret
.done
	ld a, [hSurfingJoypadBuffer]
	and PAD_A
	ret z
	ld a, $80
	ld [wSurfingMinigameRoutineNumber], a
	ret

SurfingMinigame_RunDelayTimer:
	ld a, [wSurfingMinigameRoutineDelay]
	and a
	jr z, .done
	dec a
	ld [wSurfingMinigameRoutineDelay], a
	and a
	ret
.done
	scf
	ret

SurfingMinigame_UpdatePikachuDistance:
	ld a, [wSurfingMinigameDistance + 1]
	ld c, a
	ld a, [wSurfingMinigamePikachuSpeed]
	ld e, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld d, a
	ld hl, wSurfingMinigameDistance + 2
	ld a, [hl]
	add e
	ld [hl], a
	dec hl
	ld a, [hl]
	adc d
	ld [hl], a
	dec hl
	ld a, [hl]
	adc 0
	ld [hl], a
; every 32768 units of distance walked (bit 7 of the middle byte flips), nudge
; the progress marker sprite left by one pixel
	ld a, [wSurfingMinigameDistance + 1]
	xor c
	and $80
	ret z
	ld hl, wShadowOAMSprite04XCoord
	dec [hl]
	ret

SurfingMinigame_Deduct1HP:
	ld hl, wSurfingMinigamePikachuHP
	ld e, $99
	call .BCD_Deduct
	ret nc
	inc hl
	ld e, $99
.BCD_Deduct:
	ld a, [hl]
	and a
	jr z, .rollOver
	sub $1
	daa
	ld [hl], a
	and a
	ret
.rollOver
	ld [hl], e
	scf
	ret

SurfingMinigame_UpdateLYOverrides:
	ld hl, wLYOverrides + 2 * TILE_HEIGHT
	ld de, wLYOverrides + 2 * TILE_HEIGHT + 1
	ld c, SCREEN_HEIGHT_PX - 2 * TILE_HEIGHT
	ld a, [hl]
	push af
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [hl], a
	ret

SurfingMinigame_SetPikachuHeight:
	ldh a, [hSCX]
	and TILE_WIDTH ; select one of the two adjacent wave-height samples
	jr nz, .rightHalf
	ld hl, wSurfingMinigameWaveHeight + 7
	jr .gotWaveHeight

.rightHalf
	ld hl, wSurfingMinigameWaveHeight + 8
.gotWaveHeight
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $c5 ; rising slope
	jr z, .risingSlope
	cp $e3 ; wave crest
	jr z, .waveCrest
	cp $c6 ; falling slope
	jr z, .fallingSlope
	ld a, [hl]
	ld [wSurfingMinigamePikachuObjectHeight], a
	ret

.risingSlope
.waveCrest
	ldh a, [hSCX]
	and $7 ; horizontal pixel within the current tile
	ld e, a
	ld a, [hl]
	sub e
	ld [wSurfingMinigamePikachuObjectHeight], a
	ret

.fallingSlope
	ldh a, [hSCX]
	and $7 ; horizontal pixel within the current tile
	add [hl]
	ld [wSurfingMinigamePikachuObjectHeight], a
	ret

SurfingMinigame_ReadBGMapBuffer:
	ldh a, [hSCX]
	add 9 * TILE_WIDTH ; sample the wave nine tiles into the viewport
	ld e, a
	; convert the pixel X coordinate to a tile coordinate
	srl e
	srl e
	srl e
	ld d, $0
	ld hl, vTilemap0
	add hl, de
	ld a, [wSurfingMinigamePikachuObjectHeight]
	; convert Pikachu's pixel Y coordinate to a tile coordinate
	srl a
	srl a
	srl a
	ld c, a
.loop
	ld a, c
	and a
	jr z, .copy
	dec c
	ld de, TILEMAP_WIDTH
	add hl, de
	ld a, h
	and HIGH(TILEMAP_AREA - 1)
	or HIGH(vTilemap0)
	ld h, a
	jr .loop

.copy
	ld de, wSurfingMinigameBGMapReadBuffer
	ld a, e
	ldh [hSurfingVBCopyDest], a
	ld a, d
	ldh [hSurfingVBCopyDest + 1], a
	ld a, l
	ldh [hSurfingVBCopySource], a
	ld a, h
	ldh [hSurfingVBCopySource + 1], a
	ld a, 1 ; copy one tile during VBlank
	ldh [hSurfingVBCopySize], a
	ret

SurfingMinigame_ScrollAndGenerateBGMap:
	ld a, $a0 ; generate tiles ahead of the viewport
	ld [wSurfingMinigameXOffset], a
	ldh a, [hSCX]
	ld h, a
	ld a, [wSurfingMinigameSCX]
	ld l, a
	ld de, $0180 ; 1.5 pixels per frame
	add hl, de
	ld a, l
	ld [wSurfingMinigameSCX], a
	ld a, h
	ldh [hSCX], a
SurfingMinigame_GenerateBGMap:
	ld hl, wSurfingMinigameSCX2
	ldh a, [hSCX]
	cp [hl]
	ret z
	ld [hl], a
	and $f0 ; align to a two-tile boundary
	ld hl, wSurfingMinigameSCXHi
	cp [hl]
	ret z
	ld [hl], a
	call SurfingMinigame_GetWaveDataPointers
	; b and c contain the height of the next wave to appear
	; on screen, in number of pixels from the top of the screen
	ld a, b
	ld [wSurfingMinigameWaveHeightBuffer], a
	ld a, c
	ld [wSurfingMinigameWaveHeightBuffer + 1], a
	push de
	ld hl, wSurfingMinigameWaveHeight
	ld de, wSurfingMinigameWaveHeight + 2
	ld c, SCREEN_WIDTH - 2
.copyLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copyLoop
	ld a, [wSurfingMinigameWaveHeightBuffer]
	ld [hli], a
	ld a, [wSurfingMinigameWaveHeightBuffer + 1]
	ld [hl], a
	pop de
	ld hl, wRedrawRowOrColumnSrcTiles
	ld c, SurfingMinigameWavePattern01 - SurfingMinigameWavePattern00
.loop
	ld a, [de]
	call .CopyRedrawSrcTiles
	inc de
	dec c
	jr nz, .loop
	ld a, [wSurfingMinigameXOffset]
	ld e, a
	ldh a, [hSCX]
	add e
	and $f0 ; align to a two-tile boundary
	srl a
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, vTilemap0
	add hl, de
	ld a, l
	ldh [hSurfingRedrawDest], a
	ld a, h
	ldh [hSurfingRedrawDest + 1], a
	ld a, $1
	ldh [hSurfingRedrawMode], a
	ret

.CopyRedrawSrcTiles:
	push de
	push hl
	ld l, a
	ld h, $0
	ld de, SurfingMinigame_BGMetatileTable
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	pop de
	ret

SurfingMinigame_GetWaveDataPointers:
	ld a, [wSurfingMinigameWaveFunctionNumber]
	ld e, a
	ld d, $0
	ld hl, .WaveFunctions
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.WaveFunctions:
	; Each state selects the next 8-metatile slice of a wave sequence.
	dw SurfingMinigame_ChooseNextWaveSequence ; 00

	dw SurfingMinigame_LoadWavePattern13AndAdvance ; 01
	dw SurfingMinigame_LoadWavePattern14AndAdvance ; 02
	dw SurfingMinigame_LoadWavePattern15AndAdvance ; 03
	dw SurfingMinigame_LoadWavePattern16AndAdvance ; 04
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 05
	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 06
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 07
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 08
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 09
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 0a
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 0b
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 0c
	dw SurfingMinigame_LoadFlatWaveAndReset ; 0d

	dw SurfingMinigame_LoadWavePattern08AndAdvance ; 0e
	dw SurfingMinigame_LoadWavePattern09AndAdvance ; 0f
	dw SurfingMinigame_LoadWavePattern0AAndAdvance ; 10
	dw SurfingMinigame_LoadWavePattern0BAndAdvance ; 11
	dw SurfingMinigame_LoadWavePattern0CAndAdvance ; 12
	dw SurfingMinigame_LoadWavePattern0DAndAdvance ; 13
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 14
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 15
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 16
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 17
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 18
	dw SurfingMinigame_LoadFlatWaveAndReset ; 19

	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 1a
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 1b
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 1c
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 1d
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 1e
	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 1f
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 20
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 21
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 22
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 23
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 24
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 25
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 26
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 27
	dw SurfingMinigame_LoadFlatWaveAndReset ; 28

	dw SurfingMinigame_LoadWavePattern13AndAdvance ; 29
	dw SurfingMinigame_LoadWavePattern14AndAdvance ; 2a
	dw SurfingMinigame_LoadWavePattern15AndAdvance ; 2b
	dw SurfingMinigame_LoadWavePattern16AndAdvance ; 2c
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 2d
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 2e
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 2f
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 30
	dw SurfingMinigame_LoadFlatWaveAndReset ; 31

	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 32
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 33
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 34
	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 35
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 36
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 37
	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 38
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 39
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 3a
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3b
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3c
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3d
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3e
	dw SurfingMinigame_LoadFlatWaveAndReset ; 3f

	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 40
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 41
	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 42
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 43
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 44
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 45
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 46
	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 47
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 48
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 49
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 4a
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 4b
	dw SurfingMinigame_LoadFlatWaveAndReset ; 4c

	dw SurfingMinigame_LoadWavePattern08AndAdvance ; 4d
	dw SurfingMinigame_LoadWavePattern09AndAdvance ; 4e
	dw SurfingMinigame_LoadWavePattern0AAndAdvance ; 4f
	dw SurfingMinigame_LoadWavePattern0BAndAdvance ; 50
	dw SurfingMinigame_LoadWavePattern0CAndAdvance ; 51
	dw SurfingMinigame_LoadWavePattern0DAndAdvance ; 52
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 53
	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 54
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 55
	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 56
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 57
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 58
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 59
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 5a
	dw SurfingMinigame_LoadFlatWaveAndReset ; 5b

	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 5c
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 5d
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 5e
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 5f
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 60
	dw SurfingMinigame_LoadWavePattern13AndAdvance ; 61
	dw SurfingMinigame_LoadWavePattern14AndAdvance ; 62
	dw SurfingMinigame_LoadWavePattern15AndAdvance ; 63
	dw SurfingMinigame_LoadWavePattern16AndAdvance ; 64
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 65
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 66
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 67
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 68
	dw SurfingMinigame_LoadFlatWaveAndReset ; 69

	dw SurfingMinigame_LoadWavePattern01AndAdvance ; 6a
	dw SurfingMinigame_LoadWavePattern02AndAdvance ; 6b
	dw SurfingMinigame_LoadWavePattern03AndAdvance ; 6c
	dw SurfingMinigame_LoadWavePattern04AndAdvance ; 6d
	dw SurfingMinigame_LoadWavePattern05AndAdvance ; 6e
	dw SurfingMinigame_LoadWavePattern06AndAdvance ; 6f
	dw SurfingMinigame_LoadWavePattern07AndAdvance ; 70
	dw SurfingMinigame_LoadFlatWave ; 71

	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 72
	dw SurfingMinigame_LoadWavePattern1CAndAdvance ; 73
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 74
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 75
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 76
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 77
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 78
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 79
	dw SurfingMinigame_LoadBeachPatternAndAdvance ; 7a
	dw SurfingMinigame_LoadBeachPatternAndReset ; 7b

SurfingMinigame_ChooseNextWaveSequence:
	ld a, [wSurfingMinigameDistance]
	cp $16
	jr c, .checkParam
	jr z, .bigKahuna
	jr nc, .gotWave
.bigKahuna
	ld a, $6a
	jr .gotNextFn

.checkParam
	ld a, [wSurfingMinigameWaveRandomValue]
	and a
	jr z, .gotWave
	dec a
	and $7
	ld e, a
	ld d, $0
	ld hl, SurfingMinigame_WaveSequenceStarts
	add hl, de
	ld a, [hl]
.gotNextFn
	ld [wSurfingMinigameWaveFunctionNumber], a
.gotWave
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameWavePattern00
	ret

SurfingMinigame_WaveSequenceStarts:
	; Starting states for the eight randomly selected wave sequences.
	db $01, $0e, $1a, $29, $32, $40, $4d, $5c

; b and c are the left and right wave heights in screen pixels.
; de points to the eight metatiles that form the next course slice.
SurfingMinigame_LoadWavePattern00AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameWavePattern00
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern01AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern01
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern02AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern02
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern03AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 5 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern03
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern04AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 6 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 6 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern04
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern05AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 6 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 5 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern05
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern06AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern06
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern07AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern07
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern08AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern08
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern09AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern09
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0AAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 5 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern0A
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0BAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 5 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 5 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern0B
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0CAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern0C
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0DAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern0D
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0EAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern0E
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0FAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern0F
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern10AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern10
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern11AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 4 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern11
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern12AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern12
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern13AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern13
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern14AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern14
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern15AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 3 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern15
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern16AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern16
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern17AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern17
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern18AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern18
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern19AndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 2 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern19
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern1AAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern1A
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern1BAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT, SURFING_MINIGAME_FLAT_WATER_Y - 1 * TILE_HEIGHT
	ld de, SurfingMinigameWavePattern1B
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern1CAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameWavePattern1C
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadBeachPatternAndAdvance:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameBeachPattern
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadBeachPatternAndReset:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameBeachPattern
; stay on the beach pattern instead of resetting to 0, which would restart the
; gameplay wave sequences during the shore-surf transition
	ld a, $7a
	ld [wSurfingMinigameWaveFunctionNumber], a
	ret

SurfingMinigame_LoadFlatWaveAndReset:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameWavePattern00
	jp SurfingMinigame_ResetWaveSequence

SurfingMinigame_LoadFlatWave:
	lb bc, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_FLAT_WATER_Y
	ld de, SurfingMinigameWavePattern00
	ret

SurfingMinigame_AdvanceWaveFunction:
	ld hl, wSurfingMinigameWaveFunctionNumber
	inc [hl]
	ret

SurfingMinigame_ResetWaveSequence:
	xor a
	ld [wSurfingMinigameWaveFunctionNumber], a
	ret

SurfingMinigame_LYOverridesInitialSineWave:
; a sine wave with amplitude 2
	db  0,  0,  0,  1,  1,  1,  1,  2
	db  2,  2,  1,  1,  1,  1,  0,  0
	db  0,  0,  0, -1, -1, -1, -1, -2
	db -2, -2, -1, -1, -1, -1,  0,  0
SurfingMinigame_LYOverridesInitialSineWaveEnd:

SurfingMinigame_BGMetatileTable: ; metatiles of 2x2 tiles
	db $e9, $e9, $e9, $e9 ; 00 ; sky block (blank)
	db $d0, $d0, $d0, $d0 ; 01 ; water block
	db $d0, $c1, $c1, $c5 ; 02
	db $c2, $d0, $c6, $c2 ; 03
	db $c5, $c5, $c5, $c5 ; 04
	db $c6, $c6, $c6, $c6 ; 05
	db $c5, $c3, $c3, $c7 ; 06
	db $c4, $c6, $c7, $c4 ; 07
	db $d0, $d0, $e0, $e1 ; 08
	db $d0, $d0, $e2, $c2 ; 09
	db $e3, $e1, $c3, $c7 ; 0a
	db $e2, $c6, $c7, $c4 ; 0b
	db $c5, $e3, $c5, $e3 ; 0c ; unused, identical to 11
	db $e2, $c6, $e2, $c6 ; 0d
	db $c7, $c7, $c7, $c7 ; 0e ; solid blue
	db $e3, $e1, $e3, $e1 ; 0f
	db $d0, $e0, $c1, $e3 ; 10
	db $c5, $e3, $c5, $e3 ; 11
	db $d1, $d1, $d2, $d2 ; 12 ; beach top block
	db $d2, $d2, $d2, $d2 ; 13 ; beach sand block
	db $d3, $d4, $d5, $d0 ; 14 ; beach shore block
	db $e1, $e2, $e1, $e2 ; 15

SurfingMinigameWavePattern00:
	db $00, $00, $00, $01, $01, $01, $01, $01
SurfingMinigameWavePattern01:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern02:
	db $00, $00, $00, $01, $02, $04, $06, $0e
SurfingMinigameWavePattern03:
	db $00, $00, $00, $10, $11, $06, $0e, $0e
SurfingMinigameWavePattern04:
	db $00, $00, $00, $15, $15, $0e, $0e, $0e
SurfingMinigameWavePattern05:
	db $00, $00, $00, $03, $05, $07, $0e, $0e
SurfingMinigameWavePattern06:
	db $00, $00, $00, $01, $03, $05, $07, $0e
SurfingMinigameWavePattern07:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern08:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern09:
	db $00, $00, $00, $01, $02, $04, $06, $0e
SurfingMinigameWavePattern0A:
	db $00, $00, $00, $08, $0f, $0a, $0e, $0e
SurfingMinigameWavePattern0B:
	db $00, $00, $00, $09, $0d, $0b, $0e, $0e
SurfingMinigameWavePattern0C:
	db $00, $00, $00, $01, $03, $05, $07, $0e
SurfingMinigameWavePattern0D:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern0E:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern0F:
	db $00, $00, $00, $01, $10, $11, $06, $0e
SurfingMinigameWavePattern10:
	db $00, $00, $00, $01, $15, $15, $0e, $0e
SurfingMinigameWavePattern11:
	db $00, $00, $00, $01, $03, $05, $07, $0e
SurfingMinigameWavePattern12:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern13:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern14:
	db $00, $00, $00, $01, $08, $0f, $0a, $0e
SurfingMinigameWavePattern15:
	db $00, $00, $00, $01, $09, $0d, $0b, $0e
SurfingMinigameWavePattern16:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern17:
	db $00, $00, $00, $01, $01, $10, $11, $06
SurfingMinigameWavePattern18:
	db $00, $00, $00, $01, $01, $15, $15, $0e
SurfingMinigameWavePattern19:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern1A:
	db $00, $00, $00, $01, $01, $08, $0f, $0a
SurfingMinigameWavePattern1B:
	db $00, $00, $00, $01, $01, $09, $0d, $0b
SurfingMinigameWavePattern1C:
	db $00, $00, $00, $14, $14, $14, $14, $14
SurfingMinigameBeachPattern:
	db $00, $00, $00, $12, $13, $13, $13, $13

SurfingMinigame_DPadAction:
	ld de, hSurfingJoypadBuffer
	ld a, [de]
	and PAD_LEFT
	jr nz, .dLeft
	ld a, [de]
	and PAD_RIGHT
	jr nz, .dRight
	ret

.dLeft
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld [hl], $0
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $b
	jr c, .dLeftSkip
	call .StartTrick
	ld hl, wSurfingMinigameTrickFlags
	set 0, [hl]
.dLeftSkip
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld a, [hl]
	cp SPRITE_ANIM_FRAMESET_SURF_ANGLE_13
	jr nc, .dLeftReset
	inc [hl]
	ret

.dLeftReset
	ld [hl], SPRITE_ANIM_FRAMESET_SURF_ANGLE_00
	ret

.dRight
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld [hl], $0
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $d
	jr c, .dRightSkip
	call .StartTrick
	ld hl, wSurfingMinigameTrickFlags
	set 1, [hl]
.dRightSkip
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld a, [hl]
	cp SPRITE_ANIM_FRAMESET_SURF_ANGLE_00
	jr z, .dRightReset
	dec [hl]
	ret

.dRightReset
	ld [hl], SPRITE_ANIM_FRAMESET_SURF_ANGLE_13
	ret

.StartTrick:
	call SurfingMinigame_IncreaseRadnessMeter
	xor a
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld [hl], a
; The flip can fire while the jump SFX is still playing (the jump SFX lasts
; longer than the jump itself). SFX_SURFING_FLIP is lower priority than
; SFX_SURFING_JUMP, so PlaySFX would otherwise skip it -- and _PlaySFX would
; also clear channel 8, cutting the jump SFX short. Temporarily mark channel 8
; as inactive so PlaySFX leaves it alone, force the priority check to pass,
; then restore channel 8's state so the jump SFX keeps playing.
	ld hl, wChannel8Flags1
	ld a, [hl]
	push af
	res SOUND_CHANNEL_ON, [hl]
	ld a, $ff
	ld [wCurSFX], a
	ld de, SFX_SURFING_FLIP
	call PlaySFX
	pop af
	ld [wChannel8Flags1], a
	ret

SurfingMinigame_TileInteraction:
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
; Yellow compares the value of the frame-set field (SurfingAngle00..13 are
; framesets 1..14 there) against 1..7, so it is really the board angle at the
; moment of landing that decides the quality. pokecrystal's SURF_ANGLE_00 is
; frameset $3a, so shift the id down to Yellow's numbering first.
	ld a, [hl]
	sub SPRITE_ANIM_FRAMESET_SURF_ANGLE_00 - 1
	ld [wSurfingMinigameLandingQuality], a
	cp 8
	jr nc, .wipeout
	ld e, a
	ld d, 0
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $c5 ; rising slope
	ld hl, .RisingSlopeOutcomes
	jr z, .lookUp
	cp $c6 ; falling slope
	ld hl, .FallingSlopeOutcomes
	jr z, .lookUp
	cp $e1 ; wave face
	ld hl, .WaveOutcomes
	jr z, .lookUp
	cp $e3 ; wave crest
	ld hl, .WaveOutcomes
	jr z, .lookUp
	ld hl, .FlatOutcomes
.lookUp
	add hl, de
	ld a, [hl]
	cp LANDING_WIPEOUT
	jr z, .wipeout
	cp LANDING_HARD
	jr z, .hardLanding
	cp LANDING_ROUGH
	jr z, .roughLanding
	jr .cleanLanding

.hardLanding
	call SurfingMinigame_ReduceSpeedBy128
	jr .cleanLanding

.roughLanding
	call SurfingMinigame_ReduceSpeedBy64
.cleanLanding
	ld de, SFX_SURFING_LAND
	call PlaySFX
	and a
	ret

.wipeout
	ld a, SURFING_MINIGAME_FIXED_0_25
	ld [wSurfingMinigamePikachuSpeed], a
	xor a
	ld [wSurfingMinigamePikachuSpeed + 1], a
	scf
	ret

DEF LANDING_CLEAN   EQU 0
DEF LANDING_ROUGH   EQU 1
DEF LANDING_HARD    EQU 2
DEF LANDING_WIPEOUT EQU 3

; Indexed by landing quality (0-7). Index 0 and any unlisted value are wipeouts.
.FlatOutcomes:
	db LANDING_WIPEOUT, LANDING_WIPEOUT, LANDING_HARD, LANDING_ROUGH, LANDING_CLEAN, LANDING_ROUGH, LANDING_HARD, LANDING_WIPEOUT
.RisingSlopeOutcomes:
	db LANDING_WIPEOUT, LANDING_WIPEOUT, LANDING_WIPEOUT, LANDING_WIPEOUT, LANDING_HARD, LANDING_ROUGH, LANDING_CLEAN, LANDING_ROUGH
.FallingSlopeOutcomes:
	db LANDING_WIPEOUT, LANDING_ROUGH, LANDING_CLEAN, LANDING_ROUGH, LANDING_HARD, LANDING_WIPEOUT, LANDING_WIPEOUT, LANDING_WIPEOUT
.WaveOutcomes:
	db LANDING_WIPEOUT, LANDING_WIPEOUT, LANDING_HARD, LANDING_ROUGH, LANDING_CLEAN, LANDING_CLEAN, LANDING_ROUGH, LANDING_HARD

SurfingMinigame_SpeedUpPikachu:
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	cp $2
	ret nc
	ld h, a
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld de, SURFING_MINIGAME_FIXED_1_128 ; increase speed by 1/128 per frame
	add hl, de
	ld a, h
	ld [wSurfingMinigamePikachuSpeed + 1], a
	ld a, l
	ld [wSurfingMinigamePikachuSpeed], a
	ret

SurfingMinigame_ReduceSpeedBy64:
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	and a
	jr nz, .go
	ld a, [wSurfingMinigamePikachuSpeed]
	cp SURFING_MINIGAME_FIXED_0_25 ; avoid underflow when reducing speed
	jr nc, .go
	xor a
	ld [wSurfingMinigamePikachuSpeed], a
	ret

.go
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld h, a
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld de, SURFING_MINIGAME_FIXED_NEG_0_25 ; reduce speed after a rough landing
	add hl, de
	ld a, h
	ld [wSurfingMinigamePikachuSpeed + 1], a
	ld a, l
	ld [wSurfingMinigamePikachuSpeed], a
	ret

SurfingMinigame_ReduceSpeedBy128:
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	and a
	jr nz, .go
	ld a, [wSurfingMinigamePikachuSpeed]
	cp SURFING_MINIGAME_FIXED_0_5 ; avoid underflow when reducing speed
	jr nc, .go
	xor a
	ld [wSurfingMinigamePikachuSpeed], a
	ret

.go
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld h, a
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld de, SURFING_MINIGAME_FIXED_NEG_0_5 ; reduce speed after a hard landing
	add hl, de
	ld a, h
	ld [wSurfingMinigamePikachuSpeed + 1], a
	ld a, l
	ld [wSurfingMinigamePikachuSpeed], a
	ret

SurfingMinigame_TryStartJump:
	ldh a, [hSCX]
	and $7 ; horizontal pixel within the current tile
	cp $3
	jr c, .noJump
	cp $5
	jr nc, .noJump
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $e3 ; wave crest
	jr nz, .noJump
	call SurfingMinigame_GetSpeedDividedBy32
	cp $a
	jr c, .noJump
	ld [wSurfingMinigameJumpArcMagnitude], a
	call SurfingMinigame_ResetJumpArc
	scf
	ret

.noJump
	and a
	ret

SurfingMinigame_UpdateSurfingFrame:
	ldh a, [hSCX]
	and $7 ; horizontal pixel within the current tile
	cp $3
	ret c
	cp $5
	ret nc
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $c5 ; rising slope
	jr z, .risingSlope
	cp $e3 ; wave crest
	jr z, .risingSlope
	cp $c6 ; falling slope
	jr z, .fallingSlope
	call SurfingMinigame_UpdateBoardAngle
	ld a, SPRITE_ANIM_FRAMESET_SURF_ANGLE_03
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld [hl], a
	ret

; Yellow indexes SurfingPikachuFrames directly (1 = SurfingAngle00), so its
; hardcoded 6/2 here mean SurfingAngle05/SurfingAngle01. pokecrystal's frameset
; ids are offset by one (SURF_ANGLE_00 = SurfingAngle00), so the raw Yellow
; values would land on FRAMESET_02..06 (party menu sprites) instead.
.risingSlope
	ld a, SPRITE_ANIM_FRAMESET_SURF_ANGLE_05
	jr .selectFrame

.fallingSlope
	ld a, SPRITE_ANIM_FRAMESET_SURF_ANGLE_01
.selectFrame
	ld e, a
	ld a, [wSurfingMinigameBoardAngleOffset]
	dec a
	add e
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld [hl], a
	ret

SurfingMinigame_UpdateBoardAngle:
	ld hl, wSurfingMinigameBoardAngleTimer
	ld a, [hl]
	inc [hl]
	and $7 ; update the board angle every eight frames
	ret nz
	ld a, [wSurfingMinigameBoardAngleDecreasing]
	and a
	jr z, .increase
	ld a, [wSurfingMinigameBoardAngleOffset]
	and a
	jr z, .startIncreasing
	dec a
	ld [wSurfingMinigameBoardAngleOffset], a
	ret

.startIncreasing
	xor a
	ld [wSurfingMinigameBoardAngleDecreasing], a
	ret

.increase
	ld a, [wSurfingMinigameBoardAngleOffset]
	cp $2
	jr z, .startDecreasing
	inc a
	ld [wSurfingMinigameBoardAngleOffset], a
	ret

.startDecreasing
	ld a, $1
	ld [wSurfingMinigameBoardAngleDecreasing], a
	ret

SurfingMinigame_GetSpeedDividedBy32:
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, h
	ret

SurfingMinigame_SpawnWaterSpray:
	ld hl, wSurfingMinigameWaterSprayCounter
	ld a, [hl]
	inc [hl]
	and $3
	ret nz
	call .GetYCoord
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, SPRITE_ANIM_OBJ_SURF_WATER_SPRAY
	push bc
	call InitSpriteAnimStruct
	pop bc
	ret

.GetYCoord:
	ldh a, [hSCX]
	and TILE_WIDTH ; select one of the two adjacent wave-height samples
	jr nz, .getHeightPlus9
	ld hl, wSurfingMinigameWaveHeight + 8
	jr .gotHL

.getHeightPlus9
	ld hl, wSurfingMinigameWaveHeight + 9
.gotHL
	ld a, [wSurfingMinigameBGMapReadBuffer + 1]
	cp $c5 ; rising slope
	jr z, .risingSlope
	cp $e3 ; wave crest
	jr z, .waveCrest
	cp $c6 ; falling slope
	jr z, .fallingSlope
	ld a, [hl]
	ret

.risingSlope
.waveCrest
	ldh a, [hSCX]
	and $7 ; horizontal pixel within the current tile
	ld e, a
	ld a, [hl]
	sub e
	ret

.fallingSlope
	ldh a, [hSCX]
	and $7 ; horizontal pixel within the current tile
	add [hl]
	ret

SurfingMinigame_MoveBannerToCenter:
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld a, [hl]
	cp SURFING_MINIGAME_CENTER_X
	ret z
	add 4 ; move four pixels per frame
	ld [hl], a
	ret

SurfingMinigameAnimatedObjectFn_FlippingPika:
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	dec [hl]
	ld d, a
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	inc [hl]
	call SurfingMinigame_Sprites_Sine
	cp $80
	jr nc, .positive
	xor $ff
	inc a
.positive
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

SurfingMinigameAnimatedObjectFn_IntroAnimationPikachu:
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $1
	ret z
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld a, [hl]
	cp $c0 ; fully off the right side of the screen
	jr z, .done
	inc [hl]
	ret

.done
	ld a, $1
	ld [wSurfingMinigameIntroAnimationFinished], a
	call SurfingMinigame_DeinitializeSprite
	ret

SurfingMinigame_MoveClouds:
	ld a, [wSurfingMinigameCloudScrollFraction]
	ld e, a
	ld d, $0
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld h, a
	add hl, de
	ld a, l
	ld [wSurfingMinigameCloudScrollFraction], a
	ld d, h
	ld hl, wShadowOAMSprite05XCoord
	ld e, 9 ; number of cloud sprites
.loop
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec e
	jr nz, .loop
	ret

SurfingMinigameAnimatedObjectFn_Pikachu:
	ld a, [wSurfingMinigamePikachuState]
	ld e, a
	ld d, $0
	ld hl, .StateFunctions
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.StateFunctions:
	dw SurfingMinigame_UpdateRidingPikachu   ; 0
	dw SurfingMinigame_UpdateJumpingPikachu  ; 1
	dw SurfingMinigame_UpdateLandingPikachu  ; 2
	dw SurfingMinigame_UpdateCrashedPikachu  ; 3
	dw SurfingMinigame_UpdateGameEndPikachu  ; 4
	dw SurfingMinigame_InitResultsPikachu    ; 5
	dw SurfingMinigame_UpdateResultsPikachu  ; 6

SurfingMinigame_UpdateRidingPikachu:
	ld a, [wSurfingMinigameGameOver]
	and a
	jr nz, .gameOver
	call SurfingMinigame_SpawnWaterSpray
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	call SurfingMinigame_TryStartJump
	jr c, .startedJump
	call SurfingMinigame_UpdateSurfingFrame
	call SurfingMinigame_SpeedUpPikachu
	ret

.startedJump
	call SurfingMinigame_UpdateSurfingFrame
	ld a, SURFING_MINIGAME_PIKACHU_STATE_JUMPING
	ld [wSurfingMinigamePikachuState], a
	xor a
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld [hl], a
	ld [wSurfingMinigameRadnessMeter], a
	ld [wSurfingMinigameTrickFlags], a
	ld de, SFX_SURFING_JUMP
	call PlaySFX
	ret

.gameOver
	xor a
	ld [wSurfingMinigamePikachuSpeed], a
	ld [wSurfingMinigamePikachuSpeed + 1], a
	ld a, SURFING_MINIGAME_PIKACHU_STATE_GAME_END
	ld [wSurfingMinigamePikachuState], a
	call SurfingMinigame_UpdateSurfingFrame
	ret

SurfingMinigame_UpdateJumpingPikachu:
	call SurfingMinigame_DPadAction
	call SurfingMinigame_UpdatePikachuHeight
	ret nc
	call SurfingMinigame_TileInteraction
	jr c, .crash
	call SurfingMinigame_CalculateAndAddRadnessFromStunt
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], $0
	ld a, SURFING_MINIGAME_PIKACHU_STATE_LANDING
	ld [wSurfingMinigamePikachuState], a
	ret

.crash
	ld a, SURFING_MINIGAME_PIKACHU_STATE_CRASHED
	ld [wSurfingMinigamePikachuState], a
	ld a, $60 ; crash animation duration in frames
	ld [wSurfingMinigameCrashTimer], a
	ld a, SPRITE_ANIM_FRAMESET_SURF_LARGE_SPLASH
	call SurfingMinigame_ReinitSpriteAnimFrame
	; Yellow clears channel 8's sound ID so the crash always interrupts the
	; jump sound. Crystal's PlaySFX uses one global priority value instead, so
	; raise it to the crash's ID to force the same behavior.
	ld a, SFX_SURFING_CRASH
	ld [wCurSFX], a
	ld de, SFX_SURFING_CRASH
	call PlaySFX
	ret

SurfingMinigame_UpdateLandingPikachu:
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	cp $20 ; landing splash lasts 32 frames
	jr nc, .done
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld d, $4
	call SurfingMinigame_Sprites_Sine
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	call SurfingMinigame_SpawnWaterSpray
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	ret

.done
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], $0
	ld a, SURFING_MINIGAME_PIKACHU_STATE_RIDING
	ld [wSurfingMinigamePikachuState], a
	ret

SurfingMinigame_UpdateCrashedPikachu:
	ld hl, wSurfingMinigameCrashTimer
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	ret

.done
	ld a, SURFING_MINIGAME_PIKACHU_STATE_RIDING
	ld [wSurfingMinigamePikachuState], a
	ld a, SPRITE_ANIM_FRAMESET_SURF_ANGLE_03
	call SurfingMinigame_ReinitSpriteAnimFrame
	ret

SurfingMinigame_UpdateGameEndPikachu:
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	call SurfingMinigame_UpdateSurfingFrame
	ret

SurfingMinigame_InitResultsPikachu:
	ld a, SPRITE_ANIM_FRAMESET_SURF_RESULTS_PIKACHU
	call SurfingMinigame_ReinitSpriteAnimFrame
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], $0
	ret

SurfingMinigame_UpdateResultsPikachu:
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	and $3f ; 64-frame bobbing cycle
	cp $20 ; only apply the sine offset during the second half
	jr c, .resetOffset
	ld d, $10
	call SurfingMinigame_Sprites_Sine
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.resetOffset
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], $0
	ret

; --- local copies of sprite-anim helpers -------------------------------------
; The routines of the same name live in engine/sprite_anims/core.asm (bank $23).
; This engine runs in its own ROMX section (bank $94), so a plain `call` there
; would execute unrelated bytes. These copies keep the calls same-bank and,
; unlike `callfar`, preserve the `a` register that the inputs live in.

SurfingMinigame_Sprites_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave

SurfingMinigame_DeinitializeSprite:
; Clear the index field of the struct in bc.
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], 0
	ret

SurfingMinigame_ReinitSpriteAnimFrame:
; a = frameset id, bc = struct
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], -1
	ret

SurfingMinigame_DrawHP:
; Draw the two-digit HP value into the two pairs of digit sprites placed by
; SurfingPikachuMinigame_InitStaticSpriteLayout (tiles $d0-$d9).
	ld de, wSurfingMinigamePikachuHP + 1
	ld hl, wShadowOAMSprite00TileID
	ld a, [de]
	call .PlaceBCDNumber
	ld hl, wShadowOAMSprite02TileID
	ld a, [de]
.PlaceBCDNumber:
	ld c, a
	swap a
	and $f
	add $d6
	ld [hli], a
	inc hl
	inc hl
	inc hl
	ld a, c
	and $f
	add $d6
	ld [hl], a
	dec de
	ret

SurfingMinigame_DrawResultsScreen:
; Lay out the beach scene and the score textbox. The tilemap is written to
; wTilemap, so let VBlank copy it to VRAM (hBGMapMode = 1 keeps copying every
; frame, matching Yellow's hAutoBGTransferEnabled).
	ld hl, wTilemap
	ld bc, SCREEN_AREA
	ld a, $e9
	call ByteFill
	ld hl, .BeachOutroTilemap
	decoord 0, 6
	ld bc, .BeachOutroTilemapEnd - .BeachOutroTilemap
	call CopyBytes
	call .PlaceTextbox

; Set up attr map for results screen.
	ld hl, wAttrmap
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
; rows 6-15: cols 0-9 = BG 1, cols 10-19 = BG 2
	ld hl, wAttrmap + 6 * SCREEN_WIDTH
	ld b, 10
.resultsAttrRow:
	ld c, 10
	ld a, SURF_PAL_BG_SAND
.resultsAttrCol1:
	ld [hli], a
	dec c
	jr nz, .resultsAttrCol1
	ld c, 10
	ld a, SURF_PAL_BG_WATER
.resultsAttrCol2:
	ld [hli], a
	dec c
	jr nz, .resultsAttrCol2
	dec b
	jr nz, .resultsAttrRow
; results box (rows 1-9, cols 1-18): BG 4
	ld hl, wAttrmap + 1 * SCREEN_WIDTH + 1
	ld b, 9
.resultsBoxRow:
	ld c, 18
	ld a, SURF_PAL_BG_EXTRA
.resultsBoxCol:
	ld [hli], a
	dec c
	jr nz, .resultsBoxCol
	ld a, l
	add 2  ; skip to next row (20 - 18 = 2)
	ld l, a
	jr nc, .noCarryResults
	inc h
.noCarryResults:
	dec b
	jr nz, .resultsBoxRow
; copy the attr map to VRAM so the box (and the beach) take effect
	farcall ApplyAttrmap
; hide the cloud sprites that are still part of the static layout
	ld hl, wShadowOAMSprite05XCoord
	ld bc, 9 * OBJ_SIZE
	xor a
	call ByteFill
; Copy wTilemap to the visible BG map rather than wherever the previous screen
; (the boot screens point it at vTilemap1) left it.
	ld a, HIGH(vTilemap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vTilemap0)
	ldh [hBGMapAddress], a
	ld a, 1
	ldh [hBGMapMode], a
	ret

.BeachOutroTilemap:
	INCBIN "gfx/surfing_pikachu/beach_outro.tilemap"
.BeachOutroTilemapEnd:

.PlaceTextbox:
	hlcoord 1, 1
	lb de, $3a, $3b
	ld a, $3f
	call .placeRow
	hlcoord 1, 2
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 3
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 4
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 5
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 6
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 7
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 8
	lb de, $3e, $3e
	ld a, $e9
	call .placeRow
	hlcoord 1, 9
	lb de, $3c, $3d
	ld a, $3f
	call .placeRow
	ret

.placeRow:
	ld [hl], d
	inc hl
	ld c, SCREEN_WIDTH - 4 ; box interior width
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld [hl], e
	ret

SurfingMinigame_WriteHPLeft:
	ld de, .HP_Left
	hlcoord 2, 2
	call SurfingMinigame_PrintText
	call SurfingMinigame_BCDPrintHPLeft
	ld a, 1
	ldh [hBGMapMode], a
	ret

.HP_Left:
	db "HP Left", 0

SurfingMinigame_AddRemainingHPToTotal:
	ld hl, wSurfingMinigamePikachuHP
	jr SurfingMinigame_TransferToTotal

SurfingMinigame_TransferToTotal:
; hl = little-endian BCD score to move into the total, up to 99 points per call.
; Carry is set, with no sound, if the score runs out before 99 points.
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld e, c
	ld d, 1
	ld a, b
	and a
	jr nz, .full
	ld a, c
	cp $99
	jr nz, .subtract
.full
	ld e, $99
	ld d, 0
.subtract
	ld a, [hl]
	sub e
	daa
	ld [hli], a
	ld a, [hl]
	sbc 0
	daa
	ld [hld], a
	call SurfingMinigame_AddPointsToTotal
	ld a, d
	and a
	jr nz, .ranOut
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	and a
	ret

.ranOut
	scf
	ret

SurfingMinigame_BCDPrintHPLeft:
	hlcoord 10, 2
	ld de, wSurfingMinigamePikachuHP + 1
	ld a, [de]
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	ld a, [de]
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	inc hl
	ld de, SurfingMinigame_PtsText
	call SurfingMinigame_PrintText
	ret

SurfingMinigame_WriteRadness:
	ld de, .Radness
	hlcoord 2, 4
	call SurfingMinigame_PrintText
	call SurfingMinigame_BCDPrintRadness
	ld a, 1
	ldh [hBGMapMode], a
	ret

.Radness:
	db "Radness", 0

SurfingMinigame_AddRadnessToTotal:
	ld hl, wSurfingMinigameRadnessScore
	jr SurfingMinigame_TransferToTotal

SurfingMinigame_BCDPrintRadness:
	ld a, [wSurfingMinigameRadnessScore + 1]
	hlcoord 10, 4
	call SurfingPikachu_PlaceBCDNumber
	ld a, [wSurfingMinigameRadnessScore]
	hlcoord 12, 4
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	inc hl
	ld de, SurfingMinigame_PtsText
	call SurfingMinigame_PrintText
	ret

SurfingMinigame_AddPointsToTotal:
	ld a, [wSurfingMinigameTotalScore]
	add e
	daa
	ld [wSurfingMinigameTotalScore], a
	ld a, [wSurfingMinigameTotalScore + 1]
	adc $0
	daa
	ld [wSurfingMinigameTotalScore + 1], a
	ret nc
	ld a, $99
	ld [wSurfingMinigameTotalScore], a
	ld [wSurfingMinigameTotalScore + 1], a
	ret

SurfingMinigame_BCDPrintTotalScore:
	ld a, [wSurfingMinigameTotalScore + 1]
	hlcoord 10, 6
	call SurfingPikachu_PlaceBCDNumber
	ld a, [wSurfingMinigameTotalScore]
	hlcoord 12, 6
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	inc hl
	ld de, SurfingMinigame_PtsText
	call SurfingMinigame_PrintText
	ret

SurfingMinigame_WriteTotal:
	ld de, .Total
	hlcoord 2, 6
	call SurfingMinigame_PrintText
; Yellow prints the radness digits here as well (the routine was reused for
; the total row), and then overwrites the right-hand side with the total.
	call SurfingMinigame_BCDPrintRadness
	call SurfingMinigame_BCDPrintTotalScore
	ld a, 1
	ldh [hBGMapMode], a
	ret

.Total:
	db "Total", 0

DidPlayerGetAHighScore:
	ld hl, wSurfingMinigameHiScore + 1
	ld a, [wSurfingMinigameTotalScore + 1]
	cp [hl]
	jr c, .notHighScore
	jr nz, .highScore
	dec hl
	ld a, [wSurfingMinigameTotalScore]
	cp [hl]
	jr c, .notHighScore
	jr nz, .highScore
.notHighScore
	call WaitSFX
	and a
	ret

.highScore
	ld a, [wSurfingMinigameTotalScore]
	ld [wSurfingMinigameHiScore], a
	ld a, [wSurfingMinigameTotalScore + 1]
	ld [wSurfingMinigameHiScore + 1], a
	call WaitSFX
	ld de, SFX_ITEM
	call PlaySFX
	scf
	ret

SurfingMinigame_PrintTextHiScore:
	ld de, .Hi_Score
	hlcoord 6, 8
	call SurfingMinigame_PrintText
	ld a, 1
	ldh [hBGMapMode], a
	ret

.Hi_Score:
	db "Hi-Score#", 0 ; # is the double exclamation mark tile

SurfingMinigame_ResetJumpArc:
	xor a
	ld [wSurfingMinigameJumpDescending], a
	ld [wSurfingMinigameJumpArcFraction], a
	ret

SurfingMinigame_UpdatePikachuHeight:
	ld a, [wSurfingMinigameJumpDescending]
	and a
	jr nz, .descending
	ld a, [wSurfingMinigameJumpArcMagnitude]
	ld d, a
	ld a, [wSurfingMinigameJumpArcFraction]
	or d
	jr z, .done
	ld a, [wSurfingMinigameJumpArcFraction]
	ld e, a
	ld hl, SURFING_MINIGAME_FIXED_NEG_0_5 ; decrease jump velocity
	add hl, de
	ld a, l
	ld [wSurfingMinigameJumpArcFraction], a
	ld a, h
	ld [wSurfingMinigameJumpArcMagnitude], a

	; -(4 * a ** 2)
	ld e, a
	ld d, $0
	call SurfingMinigame_NTimesDE
	ld e, l
	ld d, h
	ld a, $4
	call SurfingMinigame_NTimesDE
	ld a, l
	xor $ff
	inc a
	ld l, a
	ld a, h
	xor $ff
	ld h, a

	push hl
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld d, [hl]
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld e, [hl]
	pop hl

	add hl, de
	ld e, l
	ld d, h

	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], d
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], e
	and a
	ret

.done
	ld a, $1
	ld [wSurfingMinigameJumpDescending], a
	and a
	ret

.descending
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld e, a
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	cp SCREEN_HEIGHT_PX
	jr nc, .okay
	cp e
	jr nc, .reset
.okay
	ld a, [wSurfingMinigameJumpArcMagnitude]
	ld d, a
	ld a, [wSurfingMinigameJumpArcFraction]
	ld e, a
	ld hl, SURFING_MINIGAME_FIXED_0_5 ; increase fall velocity
	add hl, de
	ld a, l
	ld [wSurfingMinigameJumpArcFraction], a
	ld a, h
	ld [wSurfingMinigameJumpArcMagnitude], a

	; 4 * a ** 2
	ld e, a
	ld d, $0
	call SurfingMinigame_NTimesDE
	ld e, l
	ld d, h
	ld a, $4
	call SurfingMinigame_NTimesDE

	push hl
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld d, [hl]
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld e, [hl]
	pop hl

	add hl, de
	ld e, l
	ld d, h

	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], d
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], e
	and a
	ret

.reset
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], $0
	scf
	ret

SurfingMinigame_NTimesDE:
	ld hl, $0
.loop
	srl a
	jr nc, .noAdd
	add hl, de
.noAdd
	sla e
	rl d
	and a
	jr nz, .loop
	ret

SurfingMinigame_IncreaseRadnessMeter:
	ld a, [wSurfingMinigameRadnessMeter]
	inc a
	cp $4
	jr c, .cap
	ld a, $3
.cap
	ld [wSurfingMinigameRadnessMeter], a
	ret

SurfingMinigame_CalculateAndAddRadnessFromStunt:
	; Compute the amount of radness points from the
	; current trick based on the number of
	; consecutive flips
	; Single flip:                +0050
	; 2 of the same flip:         +0150
	; 3 or more of the same flip: +0350
	; 2 different flips:          +0180
	; 3 or more different flips:  +0500
	ld a, [wSurfingMinigameRadnessMeter]
	and a
	ret z
	ld a, [wSurfingMinigameTrickFlags]
	and $3
	cp $3 ; did a combination of front and back flips
	jr z, .mixedChain
	ld a, [wSurfingMinigameRadnessMeter]
	dec a
	add a
	ld e, a
	ld d, 0
	ld hl, .SingleFlipRadness
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call SurfingMinigame_AddRadness
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	sub $10
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, [wSurfingMinigameRadnessMeter]
	; radness meter 1..3 selects the +50/+150/+350 popup, which are
	; consecutive in the Crystal object table (Yellow assumed ids 4..6).
	add SURFING_MINIGAME_OBJ_PLUS50 - 1
	push bc
	call InitSpriteAnimStruct
	pop bc
	ret

.mixedChain
	ld a, [wSurfingMinigameRadnessMeter]
	cp $3
	jr c, .add180RadnessPoints
	ld de, $0500
	call SurfingMinigame_AddRadness
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	sub $10
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, SURFING_MINIGAME_OBJ_PLUS500
	push bc
	call InitSpriteAnimStruct
	pop bc
	ret

.add180RadnessPoints
	ld de, $0180
	call SurfingMinigame_AddRadness
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	sub $10
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, SURFING_MINIGAME_OBJ_PLUS180
	push bc
	call InitSpriteAnimStruct
	pop bc
	ret

.SingleFlipRadness:
	dw $0050, $0150, $0350

SurfingMinigame_AddRadness:
; de = amount to add to the radness score, as 4-digit BCD
	ld a, [wSurfingMinigameRadnessScore]
	add e
	daa
	ld [wSurfingMinigameRadnessScore], a
	ld a, [wSurfingMinigameRadnessScore + 1]
	adc d
	daa
	ld [wSurfingMinigameRadnessScore + 1], a
	ret nc
	ld a, $99
	ld [wSurfingMinigameRadnessScore], a
	ld [wSurfingMinigameRadnessScore + 1], a
	ret

; de = 0-terminated ASCII string, hl = destination in wTilemap
SurfingMinigame_PrintText:
.loop
	ld a, [de]
	and a
	ret z
	inc de
	call SurfingMinigame_CharToFontTile
	ld [hli], a
	jr .loop

DEF FONT_TILE_BASE EQU $00 ; tile ID of font glyph 0 (font is loaded at tile $00)
; a = ASCII character, returns a = tile ID of the glyph in the font
; A-Z = 0-25, a-z = 26-51, ! = 52, !! = 53 (written as #), - = 54, : = 55, space = 56
SurfingMinigame_CharToFontTile:
	cp 'a'
	jr c, .notLower
	cp 'z' + 1
	jr nc, .notLower
	sub 'a' - (26 + FONT_TILE_BASE)
	ret

.notLower
	cp 'A'
	jr c, .notUpper
	cp 'Z' + 1
	jr nc, .notUpper
	sub 'A' - FONT_TILE_BASE
	ret

.notUpper
	cp ' '
	jr nz, .notSpace
	ld a, 56 + FONT_TILE_BASE
	ret

.notSpace
	cp '!'
	jr nz, .notBang
	ld a, 52 + FONT_TILE_BASE
	ret

.notBang
	cp '#'
	jr nz, .notDoubleBang
	ld a, 53 + FONT_TILE_BASE
	ret

.notDoubleBang
	cp '-'
	jr nz, .notHyphen
	ld a, 54 + FONT_TILE_BASE
	ret

.notHyphen
	cp ':'
	jr nz, .notColon
	ld a, 55 + FONT_TILE_BASE
	ret

.notColon
	ld a, 56 + FONT_TILE_BASE ; unknown characters print as a space
	ret

SurfingMinigame_PtsText:
	db "Pts", 0

SurfingPikachu_PlaceBCDNumber:
; writes two digits from a (BCD) using the digit tiles ($d0-$d9)
	ld c, a
	swap a
	and $f
	add $d6
	ld [hli], a
	ld a, c
	and $f
	add $d6
	ld [hl], a
	dec de
	ret

SurfingPikachuMinigameIntro:
; LoadGFXAndLayout leaves rSVBK banked to wLYOverrides (bank 1). The intro
; works in bank 0 (wTilemap, sprite anims), so reset the bank first.
	xor a
	ldh [rSVBK], a
	call SurfingPikachu_ClearTileMap
	call ClearSprites
; The gameplay setup that ran first (to load Graphics2 for this screen) also
; armed the per-scanline wave, which would distort the title screen. Disarm the
; trampoline before clearing the pointer (see the teardown in the engine shell).
	ld a, RETI_INSTRUCTION
	ldh [hFunctionInstruction], a
	xor a
	ldh [hLCDCPointer], a
	call DisableLCD
	xor a
	ldh [hBGMapMode], a
	farcall ClearSpriteAnims

; Graphics3 (the intro Pikachu and the title screen tiles) is loaded starting at
; tile $50, so the intro-Pikachu sprite frames land in vTiles0 (sprite-only)
; and the title-screen tiles continue into vTiles1 (BG-visible).
	ld a, BANK(SurfingPikachu1Graphics3)
	ld hl, SurfingPikachu1Graphics3
	ld de, vTiles0 tile $50
	ld bc, SurfingPikachu1Graphics3End - SurfingPikachu1Graphics3
	call FarCopyBytes

	call DrawSurfingPikachuMinigameIntroBackground

; Fill wAttrmap with title attrs: rows 0-5 = 0, rows 6-17 cols 0-7 = 1, cols 8-19 = 2.
	ld hl, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	xor a
	call ByteFill
	ld hl, wAttrmap + 6 * SCREEN_WIDTH
	ld b, 12
.tAttrRow:
	ld c, 8
	ld a, SURF_PAL_BG_SAND
.tAttrCol1:
	ld [hli], a
	dec c
	jr nz, .tAttrCol1
	ld c, 12
	ld a, SURF_PAL_BG_WATER
.tAttrCol2:
	ld [hli], a
	dec c
	jr nz, .tAttrCol2
	dec b
	jr nz, .tAttrRow

; popup box (rows 8-14, cols 4-14): BG 4
	ld hl, wAttrmap + 8 * SCREEN_WIDTH + 4
	ld b, 7
.titlePopupAttrRow:
	ld c, 11
	ld a, SURF_PAL_BG_EXTRA
.titlePopupAttrCol:
	ld [hli], a
	dec c
	jr nz, .titlePopupAttrCol
	ld a, l
	add SCREEN_WIDTH - 11
	ld l, a
	jr nc, .noCarryTitlePopup
	inc h
.noCarryTitlePopup:
	dec b
	jr nz, .titlePopupAttrRow

; Transfer wAttrmap -> vAttrmap0 while the LCD is off.
	farcall ApplyAttrmap

; Fully transfer the intro tilemap to VRAM while the LCD is off, so the screen
; shows the complete beach on the first frame. Disable the VBlank copier too,
; so it cannot overwrite vTilemap0 with stale/partial content.
	xor a
	ldh [rSVBK], a
	ld hl, wTilemap
	ld de, vTilemap0
	ld c, SCREEN_HEIGHT
.copyRow:
	push bc
	ld b, SCREEN_WIDTH
.copyCol:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyCol
	ld a, 12
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry:
	pop bc
	dec c
	jr nz, .copyRow
	xor a
	ldh [hBGMapMode], a


	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, SCREEN_HEIGHT_PX ; keep the window below the visible screen
	ldh [hWY], a

	ld a, LCDC_ON | LCDC_WIN_9C00 | LCDC_WIN_ON | LCDC_OBJ_ON | LCDC_BG_ON
	ldh [rLCDC], a
	call EnableLCD

; show the title screen (the VBlank copier moves six rows per frame)
	ld a, HIGH(vTilemap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vTilemap0)
	ldh [hBGMapAddress], a
; Keep auto-transfer off: vTilemap0 already has the full beach (copied above),
; so the VBlank copier can't overwrite it with partial/stale content.
	xor a
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
; DMG registers (ignored in CGB mode); palettes were already applied in LoadGFXAndLayout.
	ld a, %11100100
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	call DelayFrame

	ld de, MUSIC_SURFING_PIKACHU
	call PlayMusic

; wait for A (start) or B (exit) with the title shown and Pikachu not yet on screen
	call SurfingMinigame_TitleChoice
	ld a, [wSurfingMinigameRoutineNumber]
	bit 7, a
	ret nz
; A: remove the popup, then Pikachu paddles out to sea and the game starts
	call SurfingMinigame_HideTitlePopup
	ld a, SPRITE_ANIM_OBJ_SURF_INTRO_PIKACHU
	lb de, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_CENTER_X
	call InitSpriteAnimStruct
	xor a
	ld [wSurfingMinigameIntroAnimationFinished], a
.loop
	ld a, [wSurfingMinigameIntroAnimationFinished]
	and a
	ret nz
	xor a
	ld [wCurSpriteOAMAddr], a
	callfar DoNextFrameForAllSprites
	call DelayFrame
	jr .loop

DrawSurfingPikachuMinigameIntroBackground:
	ld hl, wTilemap
	ld bc, SCREEN_AREA
	ld a, $e9
	call ByteFill
	ld hl, SurfingMinigame_BeachIntroTilemap
	decoord 0, 6
	ld bc, 12 * SCREEN_WIDTH
	call CopyBytes
	ld de, SurfingMinigame_TitleTilemap
	hlcoord 4, 0
	lb bc, 6, 12 ; title graphic dimensions: rows, columns
	call .CopyBox
	call SurfingMinigame_DrawTitlePopup
	ret

.CopyBox:
.copyRow
	push bc
	push hl
.copyColumn
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copyColumn
	ld bc, SCREEN_WIDTH
	pop hl
	add hl, bc
	pop bc
	dec b
	jr nz, .copyRow
	ret

SurfingMinigame_BeachIntroTilemap:
	INCBIN "gfx/surfing_pikachu/beach_intro.tilemap"
SurfingMinigame_BeachIntroTilemapEnd:
	ASSERT SurfingMinigame_BeachIntroTilemapEnd - SurfingMinigame_BeachIntroTilemap == 12 * SCREEN_WIDTH
; boxed "A: Start / B: Exit" message on the title screen: 9 x 3 inside, rows 9-13
SurfingMinigame_DrawTitlePopup:
	ld hl, .PopupTop
	decoord 4, 8
	ld bc, 11
	call CopyBytes
	ld hl, .PopupMiddle
	decoord 4, 9
	ld bc, 11
	call CopyBytes
	ld hl, .PopupMiddle
	decoord 4, 10
	ld bc, 11
	call CopyBytes
	ld hl, .PopupMiddle
	decoord 4, 11
	ld bc, 11
	call CopyBytes
	ld hl, .PopupMiddle
	decoord 4, 12
	ld bc, 11
	call CopyBytes
	ld hl, .PopupMiddle
	decoord 4, 13
	ld bc, 11
	call CopyBytes
	ld hl, .PopupBottom
	decoord 4, 14
	ld bc, 11
	call CopyBytes
	ld de, .PopupHiScore
	hlcoord 5, 9
	call SurfingMinigame_PrintText
	hlcoord 7, 10
	call SurfingMinigame_PrintTitleHiScore
	ld de, .PopupStart
	hlcoord 5, 12
	call SurfingMinigame_PrintText
	ld de, .PopupExit
	hlcoord 5, 13
	call SurfingMinigame_PrintText
	ret

.PopupTop:
	db $3a, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3b
.PopupMiddle:
	db $3e, $e9, $e9, $e9, $e9, $e9, $e9, $e9, $e9, $e9, $3e
.PopupBottom:
	db $3c, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3d
.PopupHiScore:
	db "Hi-Score", 0
.PopupStart:
	db "A: Start", 0
.PopupExit:
	db "B: Exit", 0

; prints the hi score as four digits at hl; shows "---" when there is no hi score
SurfingMinigame_PrintTitleHiScore:
	ld a, [wSurfingMinigameHiScore]
	ld b, a
	ld a, [wSurfingMinigameHiScore + 1]
	or b
	jr nz, .hasHiScore
	ld a, 54 + FONT_TILE_BASE ; '-'
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
.hasHiScore
	ld a, [wSurfingMinigameHiScore + 1]
	call SurfingMinigame_PrintBCDByte
	ld a, [wSurfingMinigameHiScore]
	call SurfingMinigame_PrintBCDByte
	ret

; a = BCD byte, hl = destination; writes two digit tiles and advances hl by 2
SurfingMinigame_PrintBCDByte:
	ld c, a
	swap a
	and $f
	add $d6
	ld [hli], a
	ld a, c
	and $f
	add $d6
	ld [hli], a
	ret

; redraws the beach over the popup box and copies it to VRAM
SurfingMinigame_HideTitlePopup:
	ld hl, SurfingMinigame_BeachIntroTilemap
	decoord 0, 6
	ld bc, 12 * SCREEN_WIDTH
	call CopyBytes
; restore the beach attr map (undo the popup's BG4 colouring)
	ld hl, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	xor a
	call ByteFill
	ld hl, wAttrmap + 6 * SCREEN_WIDTH
	ld b, 12
.hideTitleAttrRow:
	ld c, 8
	ld a, SURF_PAL_BG_SAND
.hideTitleAttrCol1:
	ld [hli], a
	dec c
	jr nz, .hideTitleAttrCol1
	ld c, 12
	ld a, SURF_PAL_BG_WATER
.hideTitleAttrCol2:
	ld [hli], a
	dec c
	jr nz, .hideTitleAttrCol2
	dec b
	jr nz, .hideTitleAttrRow
	farcall ApplyAttrmap
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ret

; waits for a button on the title screen: A starts the game, B exits the minigame
SurfingMinigame_TitleChoice:
.waitRelease
	call DelayFrame
	call SurfingPikachu_GetJoypad_3FrameBuffer
	ld a, [hSurfingJoypadBuffer]
	and PAD_A | PAD_B
	jr nz, .waitRelease
.waitPress
	call DelayFrame
	call SurfingPikachu_GetJoypad_3FrameBuffer
	ld a, [hSurfingJoypadBuffer]
	and PAD_A
	ret nz
	ld a, [hSurfingJoypadBuffer]
	and PAD_B
	jr z, .waitPress
	ld a, $80
	ld [wSurfingMinigameRoutineNumber], a
	ret

SurfingMinigame_TitleTilemap:
	INCBIN "gfx/surfing_pikachu/title.tilemap"
SurfingMinigame_TitleTilemapEnd:
	ASSERT SurfingMinigame_TitleTilemapEnd - SurfingMinigame_TitleTilemap == 6 * 12

SurfingPikachuMinigame_LoadGraphics:
	ld a, BANK(SurfingPikachu1Graphics1)
	ld hl, SurfingPikachu1Graphics1
	ld de, vTiles2
	ld bc, SurfingPikachu1Graphics1End - SurfingPikachu1Graphics1
	call FarCopyBytes
; text font: now stored in Graphics1 (1a), which is loaded above.
	ld a, BANK(SurfingPikachu1Graphics2)
	ld hl, SurfingPikachu1Graphics2
	ld de, vTiles0
	ld bc, SurfingPikachu1Graphics2End - SurfingPikachu1Graphics2
	call FarCopyBytes
	ret

SurfingPikachuMinigame_RestoreIntroOverlap:
; Graphics3 was copied starting at tile $50, overwriting part of Graphics2.
; Restore exactly that region from Graphics2 so gameplay gets its tiles back.
	ld a, BANK(SurfingPikachu1Graphics2)
	ld hl, SurfingPikachu1Graphics2 + $500
	ld de, vTiles0 tile $50
	ld bc, SurfingPikachu1Graphics3End - SurfingPikachu1Graphics3
	call FarCopyBytes
	ret

ASSERT SurfingPikachu1Graphics3End - SurfingPikachu1Graphics3 <= 2048, \
	"intro graphics must fit in the upper half of Graphics2"

SurfingPikachuMinigame_LoadGFXAndLayout:
	call SurfingPikachu_ClearTileMap
	call DisableLCD

; zero all minigame state
	ld hl, wSurfingMinigameData
	ld bc, wSurfingMinigameDataEnd - wSurfingMinigameData
	xor a
	call ByteFill

; wLYOverrides lives in the banked WRAM (bank 1) in pokecrystal, whereas
; Yellow's copy sits in its always-mapped $c700 area. Select that bank for the
; rest of the minigame so the gameplay code that shifts the table and the LCD
; interrupt handler (LCDGeneric) both see the real bytes.
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	xor a
	ldh [rVBK], a
	ldh [hBGMapMode], a

; Yellow does NOT load SurfingPikachu1Graphics3 here: it only does so in
; SurfingPikachuMinigameIntro (the beach scene), where the tiles are copied to
; vChars1. In the gameplay scene vChars1 keeps the upper half of
; SurfingPikachu1Graphics2, which is where the water tile ($0b) and the
; status bar tiles ($15-$1c) live - copying Graphics3 over it would both
; destroy those tiles and spill 176 bytes into SurfingPikachu1Graphics1
; at vTiles2.

; clear both BG maps and the attribute map
	xor a
	ldh [rVBK], a
	ld hl, vTilemap0
	ld bc, 2 * TILEMAP_AREA
	ld a, $e9
	call ByteFill

; water tile across the playfield
	hlbgcoord 0, 6, vTilemap0
	ld bc, 12 * TILEMAP_WIDTH
	ld a, $d0
	call ByteFill

; window attr map (vAttrmap1 at $9C00, bank 1): cleared to BG 2
	xor a
	ldh [hBGMapMode], a
	ld a, 1
	ldh [rVBK], a
	ld hl, vAttrmap1
	ld bc, TILEMAP_AREA
	ld a, 2
	call ByteFill

	xor a
	ldh [rVBK], a
; fill wAttrmap (WRAM, 20-wide) for the VBlank copier
	ld hl, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	xor a
	call ByteFill
	ld hl, wAttrmap + 6 * SCREEN_WIDTH
	ld bc, 12 * SCREEN_WIDTH
	ld a, SURF_PAL_BG_WATER
	call ByteFill

; the wave scrolls across all 32 columns of the BG map, but ApplyAttrmap only
; copies the 20 visible ones, so fill the full width of vAttrmap0 here
	ld a, 1
	ldh [rVBK], a
	ld hl, vAttrmap0
	ld bc, TILEMAP_AREA
	xor a
	call ByteFill
	ld hl, vAttrmap0 + 6 * TILEMAP_WIDTH
	ld bc, 12 * TILEMAP_WIDTH
	ld a, SURF_PAL_BG_WATER
	call ByteFill
	xor a
	ldh [hBGMapMode], a
; ensure attr map is transferred to VRAM (this overwrites bank 1 at vAttrmap0,
; so the gameplay attrs must be written to wAttrmap before this point)
	farcall ApplyAttrmap

	xor a
	ldh [rVBK], a

; spawn surfing Pikachu
	ld a, SPRITE_ANIM_OBJ_SURF_PIKACHU
	lb de, SURFING_MINIGAME_FLAT_WATER_Y, SURFING_MINIGAME_CENTER_X
	call InitSpriteAnimStruct
	ld a, SURFING_MINIGAME_FLAT_WATER_Y
	ld [wSurfingMinigamePikachuObjectHeight], a

	call SurfingMinigame_InitScanlineOverrides

	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7e
	ldh [hWY], a
	ld a, LOW(SURFING_MINIGAME_FIXED_0_25) ; 0.25 in 8.8 fixed point
	ld [wSurfingMinigamePikachuSpeed], a
	xor a
	ld [wSurfingMinigamePikachuSpeed + 1], a

; initial HP: $6000 in little-endian BCD
	xor a
	ld [wSurfingMinigamePikachuHP], a
	ld a, $60
	ld [wSurfingMinigamePikachuHP + 1], a

	ld hl, wSurfingMinigameWaveHeight
	ld bc, SCREEN_WIDTH
	ld a, SURFING_MINIGAME_FLAT_WATER_Y
	call ByteFill

	call SurfingPikachuMinigame_InitStaticSpriteLayout
	call SurfingPikachuMinigame_DrawStaticTilemapLayout
	call SurfingPikachuMinigame_ColourPalmTiles

; The playfield is written straight to VRAM (and thereafter maintained by the
; VBlank hook), so the tilemap copier must be switched off. If hBGMapMode is
; left nonzero, VBlank's UpdateBGMap keeps copying the stale wTilemap over
; vTilemap0 in thirds, wiping the generated waves. Yellow does the same thing by
; clearing hAutoBGTransferEnabled.
	xor a
	ldh [hBGMapMode], a
	ldh [hBGMapThird], a

; palettes (GBC direct: colour-index order, no DMG shade indirection)
; Save both ROM and WRAM banks, switch to ROM bank 89 and WRAM bank 5,
; copy palette data, then restore both.
	ldh a, [hROMBank]
	push af
	ldh a, [rWBK]
	push af
	ld a, BANK(SurfingPikachu)
	rst Bankswitch
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, SurfingPikachuPalettes
	ld de, wBGPals1 palette 0
	ld bc, 5 palettes          ; BG 0-4 (sky/logo, sand, water, palm, extra)
	call CopyBytes
	ld hl, SurfingPikachuPalettes + 5 palettes
	ld de, wOBPals1 palette 0
	ld bc, 5 palettes          ; OBJ 0-4
	call CopyBytes
	pop af
	ldh [rWBK], a
	pop af
	rst Bankswitch

; DMG registers (ignored in CGB mode; kept for completeness)
	ld a, %11100100
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a

; Apply the freshly loaded palettes to hardware immediately (with the LCD still
; off) so the first frame after EnableLCD does not flash the previous/zeroed
; palette. ApplyPals backs up wBGPals1 into wBGPals2; ForceUpdateCGBPals writes
; that to the CGB palette memory without waiting for a VBlank.
	farcall ApplyPals
	call ForceUpdateCGBPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a

; Per-scanline wave. Yellow installs a STAT (HBlank) handler that copies
; wLYOverrides[rLY] into rSCY, which makes the water surface undulate while the
; BG map itself stays put. pokecrystal ships the same handler as LCDGeneric,
; reached through the hFunction trampoline in HRAM: init.asm points the
; trampoline at LCDGeneric and leaves the instruction byte at `reti`, so a
; scene only has to switch the byte to `jp` and say where to write.
; The pointer must be set before the `jp` is armed, otherwise LCDGeneric would
; write to whatever hLCDCPointer happened to hold ($ff00 + 0 = rJOYP).
	ld a, LOW(LCDGeneric)
	ldh [hFunctionTargetLo], a
	ld a, HIGH(LCDGeneric)
	ldh [hFunctionTargetHi], a
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a
	ld a, JP_INSTRUCTION
	ldh [hFunctionInstruction], a

	ret

SurfingMinigame_InitScanlineOverrides:
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	ld de, $0
.loop
	ld a, e
	and SurfingMinigame_LYOverridesInitialSineWaveEnd - SurfingMinigame_LYOverridesInitialSineWave - 1
	ld e, a
	push hl
	ld hl, SurfingMinigame_LYOverridesInitialSineWave
	add hl, de
	ld a, [hl]
	pop hl
	ld [hli], a
	inc e
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

SurfingPikachuMinigame_InitStaticSpriteLayout:
	ld hl, wShadowOAM ; Yellow's wSpriteDataEnd (start of the OAM shadow buffer)
	ld de, SurfingPikachuHPDigitTiles
	ld b, $97 ; HP digits: OAM Y
	ld c, $80 ; OAM X
	ld a, $4
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
	ld de, SurfingPikachuMiniPikachuTile
	ld b, $96 ; progress marker: OAM Y
	ld c, $50 ; OAM X
	ld a, $1
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
	ld de, SurfingPikachuWideCloudTiles
	ld b, $14 ; wide cloud: OAM Y
	ld c, $20 ; OAM X
	ld a, $5
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
	ld de, SurfingPikachuNarrowCloudTiles
	ld b, $20 ; narrow cloud: OAM Y
	ld c, $80 ; OAM X
	ld a, $4
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
; recolour the static sprites: progress marker -> OBJ 3, clouds -> OBJ 2
	ld a, SURF_PAL_OBJ_SURF
	ld [wShadowOAMSprite04Attributes], a
	ld hl, wShadowOAMSprite05Attributes
	ld b, 9
.cloudPalLoop:
	ld [hl], SURF_PAL_OBJ_CLOUDS
	ld de, 4
	add hl, de
	dec b
	jr nz, .cloudPalLoop
	ret

SurfingPikachuMinigame_PlaceSpriteRowFromTiles:
.loop
	push af
	ld [hl], b
	inc hl
	ld [hl], c
	inc hl
	ld a, [de]
	ld [hl], a
	inc hl
	ld [hl], $0
	inc hl
	ld a, c
	add TILE_WIDTH
	ld c, a
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

SurfingPikachuMiniPikachuTile:
	db $b9

SurfingPikachuHPDigitTiles:
	db $d6, $d6, $d6, $d6

SurfingPikachuWideCloudTiles:
	db $a6, $a7, $a7, $a8, $a9

SurfingPikachuNarrowCloudTiles:
	db $a6, $a7, $a8, $a9

SurfingPikachuMinigame_DrawStaticTilemapLayout:
	debgcoord 1, 1, vTilemap1
	ld hl, SurfingPikachuStatusBarTiles
	ld c, $9
.copyTileRow
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyTileRow
	hlbgcoord 1, 0, vTilemap1
	ld [hl], $e4
	hlbgcoord 2, 0, vTilemap1
	ld [hl], $e5
	hlbgcoord 12, 1, vTilemap1
	ld [hl], $b6
	hlbgcoord 13, 1, vTilemap1
	ld [hl], $b7
	ret

; Colour any window cell showing a palm tile ($e4-$e7) with BG 3. The palm is in
; the first two window rows, so only those rows are scanned.
SurfingPikachuMinigame_ColourPalmTiles:
	ld hl, vTilemap1
	ld bc, 2 * TILEMAP_WIDTH
.loop
	xor a
	ldh [rVBK], a
	ld a, [hl]
	sub $e4
	cp 4
	jr nc, .next
	ld a, 1
	ldh [rVBK], a
	ld a, SURF_PAL_BG_PALM
	ld [hl], a
.next
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	xor a
	ldh [rVBK], a
	ret

SurfingPikachuStatusBarTiles:
	db $e6, $e7, $e8, $e8, $e8, $e8, $e8, $e8, $e8

SurfingPikachu_ClearTileMap:
	hlcoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	ld a, $e9
	call ByteFill
	ret


; Palette slot assignments (CGB). BG 0-7 / OBJ 0-7 available.
; Keep these in sync with the .pal file and the FarCopyWRAM calls in
; SurfingPikachuMinigame_LoadGFXAndLayout.
DEF PAL_BG_PLAYFIELD  EQU 0  ; BG 0: water, sky, beach (playfield)
DEF PAL_BG_TITLE      EQU 1  ; BG 1: beach title screen
DEF PAL_OBJ_PIKACHU   EQU 0  ; OBJ 0: Pikachu, HP digits, clouds, marker
DEF PAL_OBJ_SPLASH    EQU 1  ; OBJ 1: splashes, banners, water spray

SurfingPikachuPalettes::
	INCLUDE "gfx/surfing_pikachu/surfing_pikachu.pal"

; Palette slot assignments (CGB).
DEF SURF_PAL_BG_SKY_LOGO EQU 0  ; BG 0: sky, 1st/2nd logo colour, black
DEF SURF_PAL_BG_SAND     EQU 1  ; BG 1: white, light sand, dark sand, black
DEF SURF_PAL_BG_WATER    EQU 2  ; BG 2: white, light sand, water, black
DEF SURF_PAL_BG_PALM     EQU 3  ; BG 3: white, light sand, palm trunk, leaves
DEF SURF_PAL_BG_EXTRA    EQU 4  ; BG 4: (placeholder) all black
DEF SURF_PAL_OBJ_PIKACHU EQU 0  ; OBJ 0: Pikachu + surfboard
DEF SURF_PAL_OBJ_TEXT    EQU 1  ; OBJ 1: text "Oh no..", "Start", "Goal", splashes and water spray
DEF SURF_PAL_OBJ_CLOUDS  EQU 2  ; OBJ 2: clouds
DEF SURF_PAL_OBJ_SURF    EQU 3  ; OBJ 3: surf icon, plus points
DEF SURF_PAL_OBJ_SPLASH  EQU 4  ; OBJ 4: splashes, water spray

SurfingPikachu1Graphics1:: INCBIN "gfx/surfing_pikachu/surfing_pikachu_1a.2bpp"
SurfingPikachu1Graphics1End:
SurfingPikachu1Graphics2:: INCBIN "gfx/surfing_pikachu/surfing_pikachu_1b.2bpp"
SurfingPikachu1Graphics2End:
SurfingPikachu1Graphics3:: INCBIN "gfx/surfing_pikachu/surfing_pikachu_1c.2bpp"
SurfingPikachu1Graphics3End: