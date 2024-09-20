MACRO tilecoll
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

TilesetKantoGFX::
INCBIN "gfx/tilesets/kanto.2bpp.lz"

TilesetKantoMeta::
INCBIN "data/tilesets/kanto_metatiles.bin"

TilesetKantoColl::
INCLUDE "data/tilesets/kanto_collision.asm"

Tileset0GFX::
TilesetJohtoGFX::
INCBIN "gfx/tilesets/johto.2bpp.lz"

Tileset0Meta::
TilesetJohtoMeta::
INCBIN "data/tilesets/johto_metatiles.bin"


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPortGFX::
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta::
INCBIN "data/tilesets/port_metatiles.bin"

TilesetKantoHouseGFX::
INCBIN "gfx/tilesets/kanto_house.2bpp.lz"

TilesetKantoHouseMeta::
INCBIN "data/tilesets/kanto_house_metatiles.bin"

TilesetKantoHouseColl::
INCLUDE "data/tilesets/kanto_house_collision.asm"

TilesetMansionGFX::
INCBIN "gfx/tilesets/mansion.2bpp.lz"

TilesetMansionMeta::
INCBIN "data/tilesets/mansion_metatiles.bin"

TilesetMansionColl::
INCLUDE "data/tilesets/mansion_collision.asm"


SECTION "Tileset Data 3", ROMX

TilesetTowerGFX::
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta::
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl::
INCLUDE "data/tilesets/tower_collision.asm"

TilesetLabGFX::
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl::
INCLUDE "data/tilesets/lab_collision.asm"

TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"

TilesetGameCornerGFX::
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta::
INCBIN "data/tilesets/game_corner_metatiles.bin"

TilesetGameCornerColl::
INCLUDE "data/tilesets/game_corner_collision.asm"


SECTION "Tileset Data 4", ROMX

TilesetEliteFourRoomGFX::
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"

TilesetEliteFourRoomMeta::
INCBIN "data/tilesets/elite_four_room_metatiles.bin"

TilesetEliteFourRoomColl::
INCLUDE "data/tilesets/elite_four_room_collision.asm"

TilesetParkGFX::
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkMeta::
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl::
INCLUDE "data/tilesets/park_collision.asm"

TilesetRadioTowerGFX::
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetRadioTowerMeta::
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl::
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetUndergroundGFX::
INCBIN "gfx/tilesets/underground.2bpp.lz"

TilesetUndergroundMeta::
INCBIN "data/tilesets/underground_metatiles.bin"

TilesetUndergroundColl::
INCLUDE "data/tilesets/underground_collision.asm"


SECTION "Tileset Data 5", ROMX

TilesetBattleTowerInsideGFX::
INCBIN "gfx/tilesets/battle_tower_inside.2bpp.lz"

TilesetBattleTowerInsideMeta::
INCBIN "data/tilesets/battle_tower_inside_metatiles.bin"

TilesetBattleTowerInsideColl::
INCLUDE "data/tilesets/battle_tower_inside_collision.asm"

TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"

TilesetJohtoModernGFX::
INCBIN "gfx/tilesets/johto_modern.2bpp.lz"

TilesetJohtoModernMeta::
INCBIN "data/tilesets/johto_modern_metatiles.bin"

TilesetJohtoModernColl::
INCLUDE "data/tilesets/johto_modern_collision.asm"

TilesetTraditionalHouseGFX::
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta::
INCBIN "data/tilesets/traditional_house_metatiles.bin"


SECTION "Tileset Data 6", ROMX

TilesetChampionsRoomGFX::
INCBIN "gfx/tilesets/champions_room.2bpp.lz"

TilesetChampionsRoomMeta::
INCBIN "data/tilesets/champions_room_metatiles.bin"

TilesetChampionsRoomColl::
INCLUDE "data/tilesets/champions_room_collision.asm"

TilesetJohtoHouseGFX::
INCBIN "gfx/tilesets/johto_house.2bpp.lz"

TilesetJohtoHouseMeta::
INCBIN "data/tilesets/johto_house_metatiles.bin"

TilesetJohtoHouseColl::
INCLUDE "data/tilesets/johto_house_collision.asm"

TilesetLighthouseMeta::
INCBIN "data/tilesets/lighthouse_metatiles.bin"

TilesetLighthouseColl::
INCLUDE "data/tilesets/lighthouse_collision.asm"

TilesetForestColl::
INCLUDE "data/tilesets/forest_collision.asm"

TilesetFacilityMeta::
INCBIN "data/tilesets/facility_metatiles.bin"

TilesetHoOhWordRoomColl::
TilesetKabutoWordRoomColl::
TilesetOmanyteWordRoomColl::
TilesetAerodactylWordRoomColl::
INCLUDE "data/tilesets/beta_word_room_collision.asm"

TilesetTrainStationMeta::
INCBIN "data/tilesets/train_station_metatiles.bin"


SECTION "Tileset Data 7", ROMX

TilesetRuinsOfAlphGFX::
TilesetHoOhWordRoomGFX::
TilesetKabutoWordRoomGFX::
TilesetOmanyteWordRoomGFX::
TilesetAerodactylWordRoomGFX::
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"

TilesetRuinsOfAlphMeta::
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"

TilesetRuinsOfAlphColl::
INCLUDE "data/tilesets/ruins_of_alph_collision.asm"

TilesetBattleTowerOutsideGFX::
INCBIN "gfx/tilesets/battle_tower_outside.2bpp.lz"

TilesetFacilityGFX::
INCBIN "gfx/tilesets/facility.2bpp.lz"

TilesetCaveGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin"

TilesetCaveColl::
INCLUDE "data/tilesets/cave_collision.asm"


SECTION "Tileset Data 8", ROMX

TilesetHoOhWordRoomMeta::
INCBIN "data/tilesets/ho_oh_word_room_metatiles.bin"

TilesetKabutoWordRoomMeta::
INCBIN "data/tilesets/kabuto_word_room_metatiles.bin"

TilesetOmanyteWordRoomMeta::
INCBIN "data/tilesets/omanyte_word_room_metatiles.bin"

TilesetAerodactylWordRoomMeta::
INCBIN "data/tilesets/aerodactyl_word_room_metatiles.bin"


SECTION "Tileset Data 9", ROMX

Tileset0Attr::
TilesetJohtoAttr::
INCBIN "data/tilesets/johto_attributes.bin"

TilesetJohtoModernAttr::
INCBIN "data/tilesets/johto_modern_attributes.bin"

TilesetBattleTowerOutsideAttr::
INCBIN "data/tilesets/battle_tower_outside_attributes.bin"

TilesetJohtoHouseAttr::
INCBIN "data/tilesets/Johto_house_attributes.bin"

TilesetKantoHouseAttr::
INCBIN "data/tilesets/kanto_house_attributes.bin"

TilesetPokecenterAttr::
INCBIN "data/tilesets/pokecenter_attributes.bin"

TilesetGateAttr::
INCBIN "data/tilesets/gate_attributes.bin"



SECTION "Tileset Data 10", ROMX

TilesetFacilityAttr::
INCBIN "data/tilesets/facility_attributes.bin"

TilesetMartAttr::
INCBIN "data/tilesets/mart_attributes.bin"

TilesetMansionAttr::
INCBIN "data/tilesets/mansion_attributes.bin"

TilesetGameCornerAttr::
INCBIN "data/tilesets/game_corner_attributes.bin"

TilesetEliteFourRoomAttr::
INCBIN "data/tilesets/elite_four_room_attributes.bin"

TilesetTraditionalHouseAttr::
INCBIN "data/tilesets/traditional_house_attributes.bin"

TilesetTrainStationAttr::
INCBIN "data/tilesets/train_station_attributes.bin"

TilesetChampionsRoomAttr::
INCBIN "data/tilesets/champions_room_attributes.bin"

TilesetLighthouseAttr::
INCBIN "data/tilesets/lighthouse_attributes.bin"

TilesetPlayersRoomAttr::
INCBIN "data/tilesets/players_room_attributes.bin"

TilesetPokeComCenterAttr::
INCBIN "data/tilesets/pokecom_center_attributes.bin"

TilesetBattleTowerInsideAttr::
INCBIN "data/tilesets/battle_tower_inside_attributes.bin"

TilesetIcePathAttr::
INCBIN "data/tilesets/ice_path_attributes.bin"


SECTION "Tileset Data 11", ROMX

TilesetCaveAttr::
INCBIN "data/tilesets/cave_attributes.bin"

TilesetRuinsOfAlphAttr::
INCBIN "data/tilesets/ruins_of_alph_attributes.bin"

TilesetRadioTowerAttr::
INCBIN "data/tilesets/radio_tower_attributes.bin"

TilesetUndergroundAttr::
INCBIN "data/tilesets/underground_attributes.bin"

TilesetForestAttr::
INCBIN "data/tilesets/forest_attributes.bin"

TilesetHoOhWordRoomAttr::
INCBIN "data/tilesets/ho_oh_word_room_attributes.bin"

TilesetKabutoWordRoomAttr::
INCBIN "data/tilesets/kabuto_word_room_attributes.bin"

TilesetOmanyteWordRoomAttr::
INCBIN "data/tilesets/omanyte_word_room_attributes.bin"

TilesetAerodactylWordRoomAttr::
INCBIN "data/tilesets/aerodactyl_word_room_attributes.bin"

TilesetPlayersRoomColl::
INCLUDE "data/tilesets/players_room_collision.asm"


SECTION "Tileset Data 12", ROMX

TilesetJohto2Meta::
INCBIN "data/tilesets/johto_2_metatiles.bin"

TilesetJohto2Coll::
INCLUDE "data/tilesets/johto_2_collision.asm"

TilesetJohto2Attr::
INCBIN "data/tilesets/johto_2_attributes.bin"


SECTION "Tileset Data 13", ROMX

TilesetJohto3GFX::
INCBIN "gfx/tilesets/johto_3.2bpp.lz"

TilesetJohto3Attr::
INCBIN "data/tilesets/johto_3_attributes.bin"

TilesetJohto3Meta::
INCBIN "data/tilesets/johto_3_metatiles.bin"

TilesetJohto3Coll::
INCLUDE "data/tilesets/johto_3_collision.asm"


SECTION "Tileset Data 14", ROMX

TilesetPortAttr::
INCBIN "data/tilesets/port_attributes.bin"

TilesetLabAttr::
INCBIN "data/tilesets/lab_attributes.bin"

TilesetIcePathGFX::
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

TilesetPlayersRoomGFX::
INCBIN "gfx/tilesets/players_room.2bpp.lz"

TilesetKantoAttr::
INCBIN "data/tilesets/kanto_attributes.bin"

TilesetFacilityColl::
INCLUDE "data/tilesets/facility_collision.asm"

TilesetPortColl::
INCLUDE "data/tilesets/port_collision.asm"

TilesetTrainStationGFX::
INCBIN "gfx/tilesets/train_station.2bpp.lz"


SECTION "Tileset Data 15", ROMX

TilesetIndigoAttr::
INCBIN "data/tilesets/indigo_attributes.bin"

TilesetKanto2GFX::
INCBIN "gfx/tilesets/kanto_2.2bpp.lz"

TilesetKanto2Attr::
INCBIN "data/tilesets/kanto_2_attributes.bin"

TilesetKanto2Meta::
INCBIN "data/tilesets/kanto_2_metatiles.bin"

TilesetKanto2Coll::
INCLUDE "data/tilesets/kanto_2_collision.asm"

TilesetKanto3Coll::
INCLUDE "data/tilesets/kanto_3_collision.asm"


SECTION "Tileset Data 16", ROMX

TilesetKanto3GFX::
INCBIN "gfx/tilesets/kanto_3.2bpp.lz"

TilesetKanto3Attr::
INCBIN "data/tilesets/kanto_3_attributes.bin"

TilesetKanto3Meta::
INCBIN "data/tilesets/kanto_3_metatiles.bin"

TilesetKanto4GFX::
INCBIN "gfx/tilesets/kanto_4.2bpp.lz"

TilesetForestMeta::
INCBIN "data/tilesets/forest_metatiles.bin"

TilesetIcePathMeta::
INCBIN "data/tilesets/ice_path_metatiles.bin"

TilesetIcePathColl::
INCLUDE "data/tilesets/ice_path_collision.asm"


SECTION "Tileset Data 17", ROMX

TilesetKanto4Attr::
INCBIN "data/tilesets/kanto_4_attributes.bin"

TilesetKanto4Meta::
INCBIN "data/tilesets/kanto_4_metatiles.bin"

TilesetKanto4Coll::
INCLUDE "data/tilesets/kanto_4_collision.asm"

TilesetParkAttr::
INCBIN "data/tilesets/park_attributes.bin"

TilesetIndigoColl::
INCLUDE "data/tilesets/indigo_collision.asm"

TilesetIndigoGFX::
INCBIN "gfx/tilesets/indigo.2bpp.lz"

TilesetIndigoMeta::
INCBIN "data/tilesets/indigo_metatiles.bin"


SECTION "Tileset Data 18", ROMX

TilesetForestGFX::
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetDarkCaveGFX::
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"

TilesetTrainStationColl::
INCLUDE "data/tilesets/train_station_collision.asm"

Tileset0Coll::
TilesetJohtoColl::
INCLUDE "data/tilesets/johto_collision.asm"

TilesetLighthouseGFX::
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"

TilesetTowerAttr::
INCBIN "data/tilesets/tower_attributes.bin"

TilesetDarkCaveMeta::
INCBIN "data/tilesets/dark_cave_metatiles.bin"

TilesetDarkCaveColl::
INCLUDE "data/tilesets/dark_cave_collision.asm"

TilesetDarkCaveAttr::
INCBIN "data/tilesets/dark_cave_attributes.bin"

TilesetKanto5Meta::
INCBIN "data/tilesets/kanto_5_metatiles.bin"

TilesetKanto5Coll::
INCLUDE "data/tilesets/kanto_5_collision.asm"


SECTION "Tileset Data 19", ROMX

TilesetKanto5GFX::
INCBIN "gfx/tilesets/kanto_5.2bpp.lz"

TilesetKanto5Attr::
INCBIN "data/tilesets/kanto_5_attributes.bin"

TilesetPlayersRoomMeta::
INCBIN "data/tilesets/players_room_metatiles.bin"

TilesetJohto4Coll::
INCLUDE "data/tilesets/johto_4_collision.asm"

TilesetJohto4Meta::
INCBIN "data/tilesets/johto_4_metatiles.bin"

TilesetJohto4GFX::
INCBIN "gfx/tilesets/johto_4.2bpp.lz"

TilesetKanto6Attr::
INCBIN "data/tilesets/kanto_6_attributes.bin"


SECTION "Tileset Data 20", ROMX

TilesetKanto6Coll::
INCLUDE "data/tilesets/kanto_6_collision.asm"

TilesetKanto6Meta::
INCBIN "data/tilesets/kanto_6_metatiles.bin"

TilesetKanto6GFX::
INCBIN "gfx/tilesets/kanto_6.2bpp.lz"

TilesetBattleTowerOutsideMeta::
INCBIN "data/tilesets/battle_tower_outside_metatiles.bin"

TilesetBattleTowerOutsideColl::
INCLUDE "data/tilesets/battle_tower_outside_collision.asm"

TilesetTraditionalHouseColl::
INCLUDE "data/tilesets/traditional_house_collision.asm"

TilesetJohto4Attr::
INCBIN "data/tilesets/johto_4_attributes.bin"

TilesetJohto2GFX::
INCBIN "gfx/tilesets/johto_2.2bpp.lz"
