; these blocks all use COLL_CUT_TREE in one quadrant
CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_JOHTO_2,      .johto2
	dbw TILESET_JOHTO_3,      .johto3
	dbw TILESET_JOHTO_MODERN, .johto_modern
	dbw TILESET_KANTO,        .kanto
	dbw TILESET_KANTO_2,      .kanto2
	dbw TILESET_KANTO_3,      .kanto3
	dbw TILESET_KANTO_4,      .kanto4
	dbw TILESET_PARK,         .park
	dbw TILESET_FOREST,       .forest
	db -1 ; end

.johto:
.johto2:
.johto3:
.johto_modern:
.kanto:
.kanto2:
.kanto3:
.kanto4:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $03, $04, 1 ; grass
	db $13, $04, 1 ; grass
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $02, $01, 1 ; grass
	db $47, $46, 1 ; grass
	db $1f, $43, 0 ; cut tree
	db -1 ; end


; these blocks all use COLL_WHIRLPOOL in one quadrant
WhirlpoolBlockPointers:
	dbw TILESET_JOHTO,   .johto
	dbw TILESET_JOHTO_2, .johto2
	dbw TILESET_JOHTO_3, .johto3
	db -1 ; end

.johto:
.johto2:
.johto3:
; facing block, replacement block, animation
	db $23, $26, 0
	db -1 ; end
