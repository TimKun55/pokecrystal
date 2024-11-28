LoadSpecialMapPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr z, .darkness

.not_dark
    ld a, [wMapGroup]
    cp GROUP_SPROUT_TOWER_1F
    jr nz, .continue1
    ld a, [wMapNumber]
    cp MAP_CERULEAN_CAVE_1F
    jp z, .cavevolcano_palette
	cp MAP_CERULEAN_CAVE_2F
    jp z, .cavevolcano_palette
    cp MAP_CERULEAN_CAVE_B1F
    jp z, .cavevolcano_palette

.continue1
	cp GROUP_CINNABAR_POKECENTER_1F
    jr nz, .continue2
    ld a, [wMapNumber]
    cp MAP_CINNABAR_VOLCANO_1F
    jp z, .cavevolcano_palette
    cp MAP_CINNABAR_VOLCANO_2F
    jp z, .cavevolcano_palette

.continue2
	cp GROUP_FAST_SHIP_1F
    jr nz, .continue3
    ld a, [wMapNumber]
    cp MAP_FARAWAY_ISLAND_OUTSIDE
    jp z, .faraway_palette
	cp MAP_FARAWAY_ISLAND_INSIDE
    jp z, .faraway_palette

.continue3
    cp GROUP_CELADON_CITY
    jr nz, .continue4
    ld a, [wMapNumber]
    cp MAP_CELADON_GYM
    jp z, .gym_palette

.continue4
    cp GROUP_VIRIDIAN_CITY
    jr nz, .continue5
    ld a, [wMapNumber]
    cp MAP_VIRIDIAN_GYM
    jp z, .viridian_gym_palette

.continue5
    cp GROUP_SAFFRON_CITY
    jr nz, .continue6
    ld a, [wMapNumber]
    cp MAP_SAFFRON_GYM
    jp z, .saffron_gym_palette

.continue6
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
	cp TILESET_RUINS_OF_ALPH
	jr z, .ruins_of_alph
	jr .do_nothing

.darkness
	call LoadDarknessPalette
	scf
	ret

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

.ruins_of_alph
	call LoadRuinsOfAlphPalette
	scf
	ret

.gym_palette
	call LoadGymPalette
	scf
	ret

.viridian_gym_palette
	call LoadViridianGymPalette
	scf
	ret

.saffron_gym_palette
	call LoadSaffronGymPalette
	scf
	ret

.faraway_palette
	call LoadFarawayPalette
	scf
	ret

.cavevolcano_palette
	call LoadCaveVolcanoPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadDarknessPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, DarknessPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

DarknessPalette:
INCLUDE "gfx/tilesets/darkness.pal"

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

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

MansionPalette:
INCLUDE "gfx/tilesets/mansion.pal"

LoadPokeCenterPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeCenterPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
PokeCenterPalette:
INCLUDE "gfx/tilesets/pokecenter.pal"

LoadRuinsOfAlphPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RuinsOfAlphPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
RuinsOfAlphPalette:
INCLUDE "gfx/tilesets/ruins_of_alph.pal"

LoadGymPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GymPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
GymPalette:
INCLUDE "gfx/tilesets/gym_palette.pal"	

LoadFarawayPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, FarawayPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
FarawayPalette:
INCLUDE "gfx/tilesets/faraway_palette.pal"

LoadCaveVolcanoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CaveVolcanoPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
CaveVolcanoPalette:
INCLUDE "gfx/tilesets/cavevolcano_palette.pal"

LoadViridianGymPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, ViridianGymPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
ViridianGymPalette:
INCLUDE "gfx/tilesets/viridian_gym_palette.pal"

LoadSaffronGymPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, SaffronGymPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
SaffronGymPalette:
INCLUDE "gfx/tilesets/saffron_gym_palette.pal"

LoadSpecialNPCPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .do_nothing
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .do_nothing

;darkness
	call LoadNPCDarknessPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadNPCDarknessPalette:
	ld a, BANK(wOBPals1)
	ld de, wOBPals1
	ld hl, NPCDarknessPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

NPCDarknessPalette:
INCLUDE "gfx/overworld/npc_sprites_darkness.pal"
