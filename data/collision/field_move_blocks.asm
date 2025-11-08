; these blocks all use COLL_CUT_TREE in one quadrant
CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_JOHTO_2,      .johto_2
	dbw TILESET_JOHTO_3,      .johto_3
	dbw TILESET_JOHTO_MODERN, .johto_modern
	dbw TILESET_INDIGO,       .indigo
	dbw TILESET_KANTO,        .kanto
	dbw TILESET_KANTO_2,      .kanto_2
	dbw TILESET_KANTO_3,      .kanto_3
	dbw TILESET_KANTO_4,      .kanto_4
	dbw TILESET_KANTO_5,      .kanto_5
	dbw TILESET_KANTO_6,      .kanto_6
	dbw TILESET_PARK,         .park
	dbw TILESET_FOREST,       .forest
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $c0, $bf, 0 ; tree
	db -1 ; end

.johto_2
.johto_3
.johto_modern
.kanto:
.kanto_2
.kanto_3
.kanto_4
.kanto_5
.kanto_6
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db -1 ; end

.indigo
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $61, $88, 1 ; grass
	db $62, $64, 1 ; grass
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $13, $03, 1 ; grass (NationalPark)
	db $03, $04, 1 ; grass (NationalPark)
	db $53, $4f, 1 ; grass (SafariZone)
	db $4f, $4d, 1 ; grass (SafariZone)
	db $70, $6c, 1 ; grass (SafariZone)
	db $71, $6d, 1 ; grass (SafariZone)
	db $72, $6e, 1 ; grass (SafariZone)	
	db $73, $6f, 1 ; grass (SafariZone)
	db $76, $74, 1 ; grass (SafariZone)
	db $77, $75, 1 ; grass (SafariZone)
	db $7a, $78, 1 ; grass (SafariZone)
	db $7b, $79, 1 ; grass (SafariZone)
	db $74, $4d, 1 ; grass (SafariZone)
	db $75, $4d, 1 ; grass (SafariZone)
	db $78, $4d, 1 ; grass (SafariZone)
	db $79, $4d, 1 ; grass (SafariZone)
	db $97, $73, 1 ; grass (SafariZone)
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $1f, $43, 0 ; tree (IlexForest)
	db $02, $01, 1 ; grass (IlexForest)
	db $32, $0d, 1 ; grass (IlexForest)
	db $33, $12, 1 ; grass (IlexForest)
	db $36, $15, 1 ; grass (IlexForest)
	db $37, $16, 1 ; grass (IlexForest)
	db $47, $46, 1 ; grass (ViridianForest)
	db $5c, $68, 1 ; grass (ViridianForest)
	db $61, $69, 1 ; grass (ViridianForest)
	db -1 ; end


; these blocks all use COLL_WHIRLPOOL in one quadrant
WhirlpoolBlockPointers:
	dbw TILESET_JOHTO,   .johto
	dbw TILESET_JOHTO_3, .johto_3
	dbw TILESET_JOHTO_PEAK, .johto_peak
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $23, $26, 0
	db $9f, $21, 0
	db -1 ; end

.johto_3
; facing block, replacement block, animation
	db $23, $26, 0
	db -1 ; end

.johto_peak
; facing block, replacement block, animation
	db $2e, $30, 0
	db $2f, $30, 0
	db -1 ; end