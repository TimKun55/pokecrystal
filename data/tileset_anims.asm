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
TilesetKanto3Anim:
TilesetKanto4Anim:
TilesetKanto5Anim:
TilesetKanto6Anim:
TilesetKanto8Anim:
TilesetIndigoAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation
	
TilesetKanto2Anim:
TilesetKanto7Anim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe AnimateFountainTile,			vTiles2 tile $5f
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
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
	tileframe AnimateFlowerTile
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
	tileframe AnimateFlowerTile
	tileframe AnimateWaterTile,				vTiles2 tile $13
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohtoAnim:
TilesetJohto3Anim:
TilesetJohto5Anim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $54 ; waterfall
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $54 ; waterfall
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames1
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames2
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames3
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames4
	tileframe AnimateWhirlpoolTile,			WaterfallBottomFrames
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohtoPeakAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $03 ; waterfall
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $03 ; waterfall?
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames1
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames2
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames3
	tileframe AnimateWhirlpoolTile,			WhirlpoolFrames4
	tileframe AnimateWhirlpoolTile,			WaterfallBottomPeakFrames
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohto2Anim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $54 ; waterfall
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $54 ; waterfall?
	tileframe AnimateWhirlpoolTile,			WaterfallBottomFrames
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetJohto4Anim:
TilesetJohtoModernAnim:
TilesetJohtoRuinsAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateFlowerTile
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetPortAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $01
	tileframe WaitTileAnimation
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

TilesetEFourChampionRoomAnim:
	tileframe AnimateKarenStar1Tile
	tileframe AnimateKarenStar2Tile
	tileframe AnimateKarenStar3Tile
	tileframe AnimateKarenStar4Tile
	tileframe AnimateLavaBubbleTile2
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateLavaBubbleTile1
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetCaveAnim:
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileRightLeft,			wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe AnimateWaterPalette
	tileframe FlickeringCaveEntrancePalette
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $40 ; waterfall
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $40 ; waterfall
	tileframe AnimateWhirlpoolTile,			WaterfallBottomFrames
	tileframe FlickeringCaveEntrancePalette
	tileframe AnimateLavaBubbleTile2
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe AnimateLavaBubbleTile1
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
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
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $40 ; waterfall
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $40 ; waterfall
	tileframe AnimateWhirlpoolTile,			WaterfallBottomFrames
	tileframe FlickeringCaveEntrancePalette
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetIcePathAnim:
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $14	
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileRightLeft,			wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $14
	tileframe FlickeringCaveEntrancePalette
	tileframe WaitTileAnimation
	tileframe FlickeringCaveEntrancePalette
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $35
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe FlickeringCaveEntrancePalette
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $35
	tileframe FlickeringCaveEntrancePalette
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
	tileframe AnimateFlower2Tile
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
	tileframe AnimateWhirlpoolTile,			FireFrames1
	tileframe AnimateWhirlpoolTile,			FireFrames2
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe WaitTileAnimation
	tileframe StandingTileFrame8
	tileframe DoneTileAnimation

TilesetGymJohtoAnim:
	tileframe AnimateWaterTile,				vTiles2 tile $55
	tileframe WaitTileAnimation
	tileframe ReadTileToAnimBuffer,			vTiles2 tile $56 ; waterfall
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe ScrollTileDown,				wTileAnimBuffer
	tileframe WriteTileFromAnimBuffer,		vTiles2 tile $56 ; waterfall
	tileframe AnimateWhirlpoolTile,			WaterfallBottomFrames
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
