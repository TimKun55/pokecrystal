MACRO tileset
	dba \1GFX, \1Meta, \1Coll, \1Attr
	dw \1Anim
ENDM

; Associated data:
; - The *GFX, *Meta, *Coll and *Attr are defined in gfx/tilesets.asm
; - The *Anim are defined in engine/tilesets/tileset_anims.asm

Tilesets::
; entries correspond to TILESET_* constants (see constants/tileset_constants.asm)
	table_width TILESET_LENGTH, Tilesets
	tileset Tileset0
	tileset TilesetJohto
	tileset TilesetJohtoModern
	tileset TilesetKanto
	tileset TilesetBattleTowerOutside
	tileset TilesetJohtoHouse
	tileset TilesetKantoHouse
	tileset TilesetPokecenter
	tileset TilesetGate
	tileset TilesetPort
	tileset TilesetLab
	tileset TilesetFacility
	tileset TilesetMart
	tileset TilesetMansion
	tileset TilesetGameCorner
	tileset TilesetEliteFourRoom
	tileset TilesetTraditionalHouse
	tileset TilesetTrainStation
	tileset TilesetChampionsRoom
	tileset TilesetLighthouse
	tileset TilesetPlayersRoom
	tileset TilesetBattleTowerInside
	tileset TilesetTower
	tileset TilesetCave
	tileset TilesetPark
	tileset TilesetRuinsOfAlph
	tileset TilesetRadioTower
	tileset TilesetUnderground
	tileset TilesetIcePath
	tileset TilesetDarkCave
	tileset TilesetForest
	tileset TilesetIndigo
	tileset TilesetJohto2
	tileset TilesetJohto3
	tileset TilesetJohto4
	tileset TilesetKanto2
	tileset TilesetKanto3
	tileset TilesetKanto4
	tileset TilesetKanto5
	tileset TilesetKanto6
	tileset TilesetJohtoRuins
	tileset TilesetJohto5
	tileset TilesetMuseum
	tileset TilesetKanto7
	tileset TilesetDecoStore
	tileset TilesetFaraway
	assert_table_length NUM_TILESETS + 1
