; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_VIOLET    ; 0
	const ROOF_OLIVINE   ; 2
	const ROOF_GOLDENROD ; 3
	const ROOF_ECRUTEAK
	const ROOF_BLACKTHORN
DEF NUM_ROOFS EQU const_value

MapGroupRoofs:
; entries correspond to MAPGROUP_* constants
; values are indexes for Roofs (see below)
	table_width 1, MapGroupRoofs
	db -1              ;  0
	db ROOF_OLIVINE    ;  1 (Olivine)
	db ROOF_BLACKTHORN ;  2 (Mahogany)
	db -1              ;  3
	db ROOF_ECRUTEAK   ;  4 (Ecruteak)
	db ROOF_BLACKTHORN ;  5 (Blackthorn)
	db -1              ;  6
	db -1              ;  7
	db -1              ;  8 (Azalea)
	db ROOF_BLACKTHORN ;  9 (Lake of Rage)
	db ROOF_VIOLET     ; 10 (Violet)
	db ROOF_GOLDENROD  ; 11 (Goldenrod)
	db -1              ; 12
	db -1              ; 13
	db -1              ; 14
	db -1              ; 15
	db -1              ; 16
	db -1              ; 17
	db -1              ; 18
	db -1		       ; 19 (Silver Cave)
	db -1              ; 20
	db -1              ; 21
	db ROOF_OLIVINE    ; 22 (Cianwood)
	db -1              ; 23
	db -1              ; 24 (New Bark)
	db -1              ; 25
	db -1              ; 26 (Cherrygrove)
	db -1              ; 27 (Safari Zone)
	db -1              ; 28 (Battle Tower)
	assert_table_length NUM_MAP_GROUPS + 1

Roofs:
; entries correspond to ROOF_* constants
	table_width ROOF_LENGTH * LEN_2BPP_TILE, Roofs
INCBIN "gfx/tilesets/roofs/violet.2bpp"
INCBIN "gfx/tilesets/roofs/olivine.2bpp"
INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
INCBIN "gfx/tilesets/roofs/ecruteak.2bpp"
INCBIN "gfx/tilesets/roofs/blackthorn.2bpp"
	assert_table_length NUM_ROOFS
