_MusicPlayer:
	xor a
	ld [wUnusedScriptByte], a
	ld a, 1
	ld [wTempByteValue], a

	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites

	ld hl, MusicPlayerPalettes
	ld de, wBGPals1
	ld bc, 2 palettes
	call FarCopyColorWRAM

	ld hl, MusicPlayerGFX
	ld de, vTiles2
	lb bc, BANK(MusicPlayerGFX), 25
	call DecompressRequest2bpp

	ld hl, MusicPlayerTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes

	call .DrawMusicPlayer

	call WaitBGMap
	ld b, SCGB_MUSIC_PLAYER
	call GetSGBLayout
	call SetDefaultBGPAndOBP

.loop
	call .GetMusicPlayerJoypad
	bit B_BUTTON_F, a
	jr nz, .exit
	bit START_F, a
	jr nz, .save
	bit D_LEFT_F, a
	jr nz, .prev
	bit A_BUTTON_F, a
	jr nz, .play
	bit SELECT_F, a
	jr nz, .default
	bit D_RIGHT_F, a
	jr nz, .next
	jr .loop

.prev
	call .PreviousSong
	call .RefreshSongName
	jr .loop

.play
	call .PlaySelectedSong
	jr .loop

.save
	call .SavePersistentBattleSong
	call .RefreshSongName
	jr .loop

.default
	call .ClearPersistentBattleSong
	call .RefreshSongName
	jr .loop

.next
	call .NextSong
	call .RefreshSongName
	jr .loop

.exit
	call UpdateSprites
	call WaitBGMap
	ld hl, .ExitScript
	call QueueScript
	ld a, [wUnusedScriptByte]
	and a
	ret z
	; Only restart the area's BGM if the player actually previewed a song.
	call RestartMapMusic
	ret

.PreviousSong:
	ld a, [wTempByteValue]
	dec a
	jr nz, .store_previous
	call .GetSongCount
.store_previous
	ld [wTempByteValue], a
	ret

.NextSong:
	ld a, [wTempByteValue]
	inc a
	ld b, a
	call .GetSongCount
	cp b
	ld a, b
	jr nc, .store_next
	ld a, 1
.store_next
	ld [wTempByteValue], a
	ret

.GetSongCount:
	ld hl, MusicPlayerSongs
	ld a, BANK(MusicPlayerSongs)
	call GetFarByte
	ret

.GetSelectedSongID:
	ld a, [wTempByteValue]
	dec a
	ld c, a
	ld b, 0
	ld hl, MusicPlayerSongs + 1
	add hl, bc
	ld a, BANK(MusicPlayerSongs)
	call GetFarByte
	ret

.PlaySelectedSong:
	call .GetSelectedSongID
	ld e, a
	ld d, 0
	ld a, 1
	ld [wUnusedScriptByte], a
	call PlayMusic2
	ret

.SavePersistentBattleSong:
	call .GetSelectedSongID
	ld [wPersistentBattleMusicOverride], a
	xor a
	ld [wPersistentBattleMusicOverride + 1], a
	ret

.ClearPersistentBattleSong:
	xor a
	ld [wPersistentBattleMusicOverride], a
	ld [wPersistentBattleMusicOverride + 1], a
	ret

.PlaceCurrentSongName:
	hlcoord 1, 6
	lb bc, 1, 18
	call ClearBox
	call .GetCurrentSongName
	hlcoord 1, 6
	call FarPlaceString
	ret

.PlaceSavedSongName:
	hlcoord 1, 9
	lb bc, 1, 18
	call ClearBox
	ld a, [wPersistentBattleMusicOverride]
	and a
	jr nz, .saved_song
	ld a, [wPersistentBattleMusicOverride + 1]
	and a
	jr nz, .saved_song
	ld de, .DefaultName
	hlcoord 7, 9
	call PlaceString
	ret

.saved_song
	ld a, [wPersistentBattleMusicOverride]
	call .GetSongName
	hlcoord 1, 9
	call FarPlaceString
	ret

.RefreshSongName:
	call .PlaceCurrentSongName
	call .PlaceSavedSongName
	call ApplyTilemap
	ret

.GetCurrentSongName:
	call .GetSelectedSongID

.GetSongName:
	; Read the far pointer for the selected song name from the packed pointer table.
	ld hl, MusicPlayerSongNamePointers
	ld c, 3
	ld b, 0
	call AddNTimes
	ld a, BANK(MusicPlayerSongNamePointers)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(MusicPlayerSongNamePointers)
	call GetFarByte
	ld e, a
	inc hl
	ld a, BANK(MusicPlayerSongNamePointers)
	call GetFarByte
	ld d, a
	ret

.DrawMusicPlayer:
	hlcoord 4, 1
	ld de, .Title
	call PlaceString
	hlcoord 1, 5
	ld de, .CurrentLabel
	call PlaceString
	call .PlaceCurrentSongName
	hlcoord 4, 8
	ld de, .SavedLabel
	call PlaceString
	call .PlaceSavedSongName
	hlcoord 1, 12
	ld de, .ABButtons
	call PlaceString
	hlcoord 1, 14
	ld de, .StartButton
	call PlaceString
	hlcoord 1, 16
	ld de, .SelectButton
	call PlaceString
	call ApplyTilemap
	ret

.GetMusicPlayerJoypad:
.wait
	call JoyTextDelay_ForcehJoyDown
	ld a, c
	and A_BUTTON | B_BUTTON | SELECT | START
	jr nz, .done_repeat
	ldh a, [hJoyPressed]
	and D_LEFT | D_RIGHT
	jr nz, .done
	jr .wait

.done_repeat
	ld a, c
.done
	ret

.ExitScript:
	refreshmap
	closetext
	end

.ABButtons:
	db " A: Play  B: Quit@"

.StartButton:
	db " Start: Set Track@"

.SelectButton:
	db " Select: Default@"

.CurrentLabel:
	db "← Current Track: →@"

.SavedLabel:
	db "Battle Track:@"

.DefaultName:
	db "Default@"

.Title:
	db "Music Player@"

MusicPlayerPalettes:
INCBIN "gfx/music_player/music_player.pal"

MusicPlayerGFX:
INCBIN "gfx/music_player/music_player.2bpp.lz"

MusicPlayerTilemap:
INCBIN "gfx/music_player/music_player.tilemap"