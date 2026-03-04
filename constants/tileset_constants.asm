; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_JOHTO                ; 01
	const TILESET_JOHTO_MODERN         ; 02
	const TILESET_KANTO                ; 03
	const TILESET_BATTLE_TOWER_OUTSIDE ; 04
	const TILESET_JOHTO_HOUSE          ; 05      
	const TILESET_KANTO_HOUSE          ; 06
	const TILESET_POKECENTER           ; 07
	const TILESET_GATE                 ; 08
	const TILESET_PORT                 ; 09
	const TILESET_LAB                  ; 0a
	const TILESET_FACILITY             ; 0b
	const TILESET_MART                 ; 0c
	const TILESET_MANSION              ; 0d
	const TILESET_GAME_CORNER          ; 0e
	const TILESET_E_FOUR_CHAMPION_ROOM ; 0f
	const TILESET_TRADITIONAL_HOUSE    ; 10
	const TILESET_TRAIN_STATION        ; 11
	const TILESET_LIGHTHOUSE           ; 12
	const TILESET_PLAYERS_ROOM         ; 13
	const TILESET_BATTLE_TOWER_INSIDE  ; 14
	const TILESET_TOWER                ; 15
	const TILESET_CAVE                 ; 16
	const TILESET_PARK                 ; 17
	const TILESET_RUINS_OF_ALPH        ; 18
	const TILESET_RADIO_TOWER          ; 19
	const TILESET_UNDERGROUND          ; 1a
	const TILESET_ICE_PATH             ; 1b
	const TILESET_DARK_CAVE            ; 1c
	const TILESET_FOREST               ; 1d
	const TILESET_INDIGO               ; 1e
	const TILESET_JOHTO_2              ; 1f
	const TILESET_JOHTO_3              ; 20
	const TILESET_JOHTO_4              ; 21
	const TILESET_KANTO_2              ; 22
	const TILESET_KANTO_3              ; 23
	const TILESET_KANTO_4              ; 24
	const TILESET_KANTO_5              ; 25
	const TILESET_KANTO_6              ; 26
	const TILESET_JOHTO_RUINS          ; 27
	const TILESET_JOHTO_5              ; 28
	const TILESET_MUSEUM               ; 29
	const TILESET_KANTO_7              ; 2a
	const TILESET_DECO_STORE           ; 2b
	const TILESET_FARAWAY              ; 2c
	const TILESET_KANTO_8              ; 2d
	const TILESET_JOHTO_PEAK           ; 2e
	const TILESET_GYM_JOHTO            ; 2f
DEF NUM_TILESETS EQU const_value - 1

; wTileset struct size
DEF TILESET_LENGTH EQU 14

; roof length (see gfx/tilesets/roofs)
DEF ROOF_LENGTH EQU 9

; bg palette values (see gfx/tilesets/*_palette_map.asm)
; TilesetBGPalette indexes (see gfx/tilesets/bg_tiles.pal)
	const_def
	const PAL_BG_GRAY   ; 0
	const PAL_BG_RED    ; 1
	const PAL_BG_GREEN  ; 2
	const PAL_BG_WATER  ; 3
	const PAL_BG_YELLOW ; 4
	const PAL_BG_BROWN  ; 5
	const PAL_BG_ROOF   ; 6
	const PAL_BG_TEXT   ; 7
