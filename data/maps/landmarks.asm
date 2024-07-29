MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4, Landmarks
	landmark  -8, -16, SpecialMapName
	landmark 132, 100, NewBarkTownName
	landmark 112, 100, Route29Name
	landmark  92, 100, CherrygroveCityName
	landmark  92,  80, Route30Name
	landmark  88,  60, Route31Name
	landmark  76,  60, VioletCityName
	landmark  77,  58, SproutTowerName
	landmark  76,  92, Route32Name
	landmark  68,  76, RuinsOfAlphName
	landmark  76, 124, UnionCaveName
	landmark  68, 124, Route33Name
	landmark  60, 124, SlowpokeWellName
	landmark  52, 124, AzaleaTownName
	landmark  44, 124, IlexForestName
	landmark  44, 108, Route34Name
	landmark  44,  92, GoldenrodCityName
	landmark  42,  92, RadioTowerName
	landmark  44,  76, Route35Name
	landmark  44,  60, NationalParkName
	landmark  60,  60, Route36Name
	landmark  60,  52, Route37Name
	landmark  60,  44, EcruteakCityName
	landmark  62,  42, TinTowerName
	landmark  58,  42, BurnedTowerName
	landmark  44,  44, Route38Name
	landmark  28,  48, Route39Name
	landmark  28,  60, OlivineCityName
	landmark  30,  62, LighthouseName
	landmark  20,  52, BattleTowerName
	landmark  20,  72, Route40Name
	landmark  20,  92, WhirlIslandsName
	landmark  20, 100, Route41Name
	landmark  12, 100, CianwoodCityName
	landmark  88,  44, Route42Name
	landmark  76,  44, MtMortarName
	landmark 100,  44, MahoganyTownName
	landmark 100,  36, Route43Name
	landmark 100,  28, LakeOfRageName
	landmark 108,  44, Route44Name
	landmark 116,  44, IcePathName
	landmark 124,  44, BlackthornCityName
	landmark 124,  36, DragonsDenName
	landmark 124,  64, Route45Name
	landmark 108,  68, DarkCaveName
	landmark 116,  88, Route46Name
	landmark 144, 100, Route27Name
	landmark 144,  66, MtSilverName
	assert_table_length KANTO_LANDMARK
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  68, Route2Name
	landmark  52,  60, ViridianForestName
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  92,  52, Route4Name
	landmark 108,  52, CeruleanCityName
	landmark 108,  40, Route24Name
	landmark 120,  36, Route25Name
	landmark 108,  60, Route5Name
	landmark 116,  76, UndergroundName
	landmark 108,  76, Route6Name
	landmark 108,  84, VermilionCityName
	landmark 116,  84, DiglettsCaveName
	landmark  96,  68, Route7Name
	landmark 120,  68, Route8Name
	landmark 120,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  60, Route10Name
	landmark 140,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 136,  68, LavRadioTowerName
	landmark  84,  68, CeladonCityName
	landmark 108,  68, SaffronCityName
	landmark 124,  84, Route11Name
	landmark 132,  84, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 108, Route14Name
	landmark 104, 116, Route15Name
	landmark  76,  68, Route16Name
	landmark  76,  92, Route17Name
	landmark  84, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 108, SafariZoneName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  40,  76, Route22Name
	landmark  28,  60, Route23Name
	landmark  28,  44, VictoryRoadName
	landmark  28,  36, IndigoPlateauName
	landmark  28,  88, Route26Name
	landmark  28, 100, TohjoFallsName
	landmark  16,  76, Route28Name
	landmark 100,  44, CeruleanCaveName
	landmark 140, 116, FastShipName
	landmark 164, 148, FarawayIslandName ; off Map
	assert_table_length NUM_LANDMARKS

NewBarkTownName:     db "New Bark<BSP>Town@"
CherrygroveCityName: db "Cherrygrove<BSP>City@"
VioletCityName:      db "Violet City@"
AzaleaTownName:      db "Azalea Town@"
GoldenrodCityName:   db "Goldenrod<BSP>City@"
EcruteakCityName:    db "Ecruteak<BSP>City@"
OlivineCityName:     db "Olivine<BSP>City@"
CianwoodCityName:    db "Cianwood<BSP>City@"
MahoganyTownName:    db "Mahogany<BSP>Town@"
BlackthornCityName:  db "Blackthorn<BSP>City@"
LakeOfRageName:      db "Lake Of<BSP>Rage@"
MtSilverName:        db "Mt.Silver@"
SproutTowerName:     db "Sprout<BSP>Tower@"
RuinsOfAlphName:     db "Ruins<BSP>Of Alph@"
UnionCaveName:       db "Union Cave@"
SlowpokeWellName:    db "Slowpoke<BSP>Well@"
RadioTowerName:      db "Radio Tower@"
PowerPlantName:      db "Power Plant@"
NationalParkName:    db "National<BSP>Park@"
TinTowerName:        db "Tin Tower@"
LighthouseName:      db "Lighthouse@"
WhirlIslandsName:    db "Whirl<BSP>Islands@"
MtMortarName:        db "Mt.Mortar@"
DragonsDenName:      db "Dragon's<BSP>Den@"
IcePathName:         db "Ice Path@"
NotApplicableName:   db "N/A@" ; unreferenced ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "Pallet Town@"
ViridianCityName:    db "Viridian<BSP>City@"
PewterCityName:      db "Pewter City@"
CeruleanCityName:    db "Cerulean<BSP>City@"
LavenderTownName:    db "Lavender<BSP>Town@"
VermilionCityName:   db "Vermilion<BSP>City@"
CeladonCityName:     db "Celadon<BSP>City@"
SaffronCityName:     db "Saffron<BSP>City@"
FuchsiaCityName:     db "Fuchsia<BSP>City@"
CinnabarIslandName:  db "Cinnabar<BSP>Island@"
IndigoPlateauName:   db "Indigo<BSP>Plateau@"
VictoryRoadName:     db "Victory<BSP>Road@"
MtMoonName:          db "Mt.Moon@"
RockTunnelName:      db "Rock Tunnel@"
LavRadioTowerName:   db "Lav<BSP>Radio Tower@"
SilphCoName:         db "Silph Co.@" ; unreferenced
SafariZoneName:      db "Safari<BSP>Zone@"
SeafoamIslandsName:  db "Seafoam<BSP>Islands@"
PokemonMansionName:  db "#mon<BSP>Mansion@" ; unreferenced
CeruleanCaveName:    db "Cerulean<BSP>Cave@"
Route1Name:          db "Route 1@"
Route2Name:          db "Route 2@"
Route3Name:          db "Route 3@"
Route4Name:          db "Route 4@"
Route5Name:          db "Route 5@"
Route6Name:          db "Route 6@"
Route7Name:          db "Route 7@"
Route8Name:          db "Route 8@"
Route9Name:          db "Route 9@"
Route10Name:         db "Route 10@"
Route11Name:         db "Route 11@"
Route12Name:         db "Route 12@"
Route13Name:         db "Route 13@"
Route14Name:         db "Route 14@"
Route15Name:         db "Route 15@"
Route16Name:         db "Route 16@"
Route17Name:         db "Route 17@"
Route18Name:         db "Route 18@"
Route19Name:         db "Route 19@"
Route20Name:         db "Route 20@"
Route21Name:         db "Route 21@"
Route22Name:         db "Route 22@"
Route23Name:         db "Route 23@"
Route24Name:         db "Route 24@"
Route25Name:         db "Route 25@"
Route26Name:         db "Route 26@"
Route27Name:         db "Route 27@"
Route28Name:         db "Route 28@"
Route29Name:         db "Route 29@"
Route30Name:         db "Route 30@"
Route31Name:         db "Route 31@"
Route32Name:         db "Route 32@"
Route33Name:         db "Route 33@"
Route34Name:         db "Route 34@"
Route35Name:         db "Route 35@"
Route36Name:         db "Route 36@"
Route37Name:         db "Route 37@"
Route38Name:         db "Route 38@"
Route39Name:         db "Route 39@"
Route40Name:         db "Route 40@"
Route41Name:         db "Route 41@"
Route42Name:         db "Route 42@"
Route43Name:         db "Route 43@"
Route44Name:         db "Route 44@"
Route45Name:         db "Route 45@"
Route46Name:         db "Route 46@"
DarkCaveName:        db "Dark Cave@"
IlexForestName:      db "Ilex<BSP>Forest@"
BurnedTowerName:     db "Burned<BSP>Tower@"
FastShipName:        db "Fast Ship@"
FarawayIslandName:   db "Faraway<BSP>Island@"
ViridianForestName:  db "Viridian<BSP>Forest@"
DiglettsCaveName:    db "Diglett's<BSP>Cave@"
TohjoFallsName:      db "Tohjo Falls@"
UndergroundName:     db "Underground@"
BattleTowerName:     db "Battle<BSP>Tower@"
SpecialMapName:      db "Special@"
