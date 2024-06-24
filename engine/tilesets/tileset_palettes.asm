LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	cp TILESET_POKECENTER
	jr z, .pokecenter
	cp TILESET_TRAIN_STATION
	jr z, .trainstation
	jr .do_nothing

.battle_tower_inside
	call LoadBattleTowerInsidePalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret
	
.pokecenter
	call LoadPokeCenterPalette
	scf
	ret

.trainstation
	call LoadTrainStationPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadPokeCenterPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeCenterPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
PokeCenterPalette:
INCLUDE "gfx/tilesets/pokecenter.pal"

LoadTrainStationPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, TrainStationPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
TrainStationPalette:
INCLUDE "gfx/tilesets/train_station.pal"	
