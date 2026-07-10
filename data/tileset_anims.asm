MACRO tileframe
	if _NARG == 2
		dw \2 ; argument
	else
		dw 0
	endc
	dw \1 ; function
ENDM

Tileset0Anim:
TilesetKantoAnim:
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateBeachWater1Tile,       vTiles2 tile $5d
	tileframe AnimateBeachWater2Tile,       vTiles2 tile $5e
	tileframe AnimateBeachWater3Tile,       vTiles2 tile $6d
	tileframe AnimateBeachWater4Tile,       vTiles2 tile $6e
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateBuoyTiles,				vTiles2 tile $22
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetKanto3Anim:
TilesetKanto5Anim:
TilesetKanto6Anim:
TilesetKanto8Anim:
TilesetIndigoAnim:
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $3f
	tileframe AnimateBuoyTiles,				vTiles2 tile $22
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetKanto4Anim:
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $3f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetKanto2Anim:
TilesetKanto7Anim:
	tileframe AnimateFountainTile,			vTiles2 tile $5f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $3f
	tileframe AnimateBuoyTiles,				vTiles2 tile $22
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetParkAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe AnimateFountainTile,			vTiles2 tile $5f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetForestAnim:
	tileframe ForestTreeLeftAnimation
	tileframe ForestTreeRightAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe ForestTreeLeftAnimation2
	tileframe ForestTreeRightAnimation2
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateWaterTile,				vTiles2 tile $13
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohtoAnim:
	tileframe AnimateWhirlpoolTiles,		vTiles2 tile $30
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateWaterfallTiles,		vTiles2 tile $54
	tileframe AnimateBeachWater1Tile,       vTiles2 tile $5a
	tileframe AnimateBeachWater2Tile,       vTiles2 tile $5b
	tileframe AnimateBeachWater3Tile,       vTiles2 tile $5c
	tileframe AnimateBeachWater4Tile,       vTiles2 tile $5d
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $2c
	tileframe AnimateBuoyTiles,				vTiles2 tile $2d
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohto2Anim:
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateWaterfallTiles,		vTiles2 tile $54
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $2c
	tileframe AnimateBuoyTiles,				vTiles2 tile $2d
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohto3Anim:
	tileframe AnimateWhirlpoolTiles,		vTiles2 tile $30
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe WaitTileAnimation
	tileframe AnimateBeachWater1Tile,       vTiles2 tile $5a
	tileframe AnimateBeachWater2Tile,       vTiles2 tile $5b
	tileframe AnimateBeachWater3Tile,       vTiles2 tile $5c
	tileframe AnimateBeachWater4Tile,       vTiles2 tile $5d
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $2c
	tileframe AnimateBuoyTiles,				vTiles2 tile $2d
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohto4Anim:
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $3f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohto5Anim:
	tileframe AnimateWhirlpoolTiles,		vTiles2 tile $30
	tileframe WaitTileAnimation	
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateWaterfallTiles,		vTiles2 tile $54
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $3f
	tileframe AnimateBuoyTiles,				vTiles2 tile $6d
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohtoPeakAnim:
	tileframe AnimateWhirlpoolTiles,		vTiles2 tile $42
	tileframe WaitTileAnimation	
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateWaterfallTiles,		vTiles2 tile $03
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $14
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohtoModernAnim:
TilesetJohtoRuinsAnim:
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateWaterTile,				vTiles2 tile $3f
	tileframe AnimateBuoyTiles,				vTiles2 tile $6d
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetPortAnim:
	tileframe AnimatePortBuoyTiles,			vTiles2 tile $02
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateSeaWaterTile,			vTiles2 tile $01
	tileframe AnimateBuoyTiles,				vTiles2 tile $11
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetEFourChampionRoomAnim:
	tileframe AnimateKarenStar1Tile
	tileframe AnimateKarenStar2Tile
	tileframe AnimateKarenStar3Tile
	tileframe AnimateKarenStar4Tile
	tileframe AnimateLavaBubbleTile2,		vTiles2 tile $69
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateLavaBubbleTile1,		vTiles2 tile $6a
	tileframe WaitTileAnimation
	tileframe AnimateTorchTile,				vTiles2 tile $4d
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetCaveAnim:
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $14
	tileframe ScrollTileRightLeft,			wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $14
	tileframe AnimateWaterPalette
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateWaterfallTiles,		vTiles2 tile $6b
	tileframe AnimateLavaBubbleTile2,		vTiles2 tile $69
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateLavaBubbleTile1,		vTiles2 tile $6a
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetDarkCaveAnim:
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileRightLeft,			wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe AnimateWaterPalette
	tileframe FlickeringCaveEntrancePalette
	tileframe AnimateWaterfallTiles,		vTiles2 tile $02
	tileframe FlickeringCaveEntrancePalette
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetIcePathAnim:
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $20	
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileRightLeft,			wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $20
	tileframe FlickeringCaveEntrancePalette
	tileframe WaitTileAnimation
	tileframe FlickeringCaveEntrancePalette
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetTowerAnim:
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer9
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer10
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer7
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer8
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer5
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer6
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer3
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer4
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer1
	tileframe AnimateTowerPillarTile,		TowerPillarTilePointer2
	tileframe StandingTileFrame
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation

TilesetBattleTowerOutsideAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile,			vTiles2 tile $02
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetFarawayAnim:
	tileframe AnimateFarawayWaterTiles,		FarawayWaterFrames1
	tileframe AnimateFarawayWaterTiles,		FarawayWaterFrames2
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetTraditionalHouseAnim:
	tileframe AnimateFireTiles,				vTiles2 tile $58
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetGymJohtoAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $55
	tileframe WaitTileAnimation
	tileframe AnimateWaterfallTiles,		vTiles2 tile $1c
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetFacilityAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $61
	tileframe WaitTileAnimation
	tileframe AnimateFountainTile,			vTiles2 tile $6f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetGymKantoAnim:
TilesetJohtoHouseAnim:
TilesetKantoHouseAnim:
TilesetPokecenterAnim:
TilesetGateAnim:
TilesetLabAnim:
TilesetMartAnim:
TilesetMansionAnim:
TilesetGameCornerAnim:
TilesetTrainStationAnim:
TilesetLighthouseAnim:
TilesetPlayersRoomAnim:
TilesetBattleTowerInsideAnim:
TilesetRuinsOfAlphAnim:
TilesetRadioTowerAnim:
TilesetUndergroundAnim:
TilesetHoOhWordRoomAnim:
TilesetKabutoWordRoomAnim:
TilesetOmanyteWordRoomAnim:
TilesetAerodactylWordRoomAnim:
TilesetMuseumAnim:
TilesetDecoStoreAnim:
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe DoneTileAnimation
