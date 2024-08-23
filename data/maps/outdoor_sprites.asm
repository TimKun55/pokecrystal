; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to MAPGROUP_* constants
	table_width 2, OutdoorSprites
	dw OlivineGroupSprites
	dw MahoganyGroupSprites
	dw DungeonsGroupSprites
	dw EcruteakGroupSprites
	dw BlackthornGroupSprites
	dw CinnabarGroupSprites
	dw CeruleanGroupSprites
	dw AzaleaGroupSprites
	dw LakeOfRageGroupSprites
	dw VioletGroupSprites
	dw GoldenrodGroupSprites
	dw VermilionGroupSprites
	dw PalletGroupSprites
	dw PewterGroupSprites
	dw FastShipGroupSprites
	dw IndigoGroupSprites
	dw FuchsiaGroupSprites
	dw LavenderGroupSprites
	dw SilverGroupSprites
	dw CableClubGroupSprites
	dw CeladonGroupSprites
	dw CianwoodGroupSprites
	dw ViridianGroupSprites
	dw NewBarkGroupSprites
	dw SaffronGroupSprites
	dw CherrygroveGroupSprites
	dw SafariGroupSprites
	assert_table_length NUM_MAP_GROUPS

; PalletTown and Route21 are connected
PalletGroupSprites:
; Route1, PalletTown
CinnabarGroupSprites:
; Route19, Route20, Route21, CinnabarIsland
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_SCHOOLBOY
	db SPRITE_BLUE
	db SPRITE_OFFICER
	db SPRITE_COOLTRAINER_F
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GUY
	; max 8 of 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db 0 ; end
	
ViridianGroupSprites:
; Route2, Route22, Route26, ViridianCity
PewterGroupSprites:
; Route3, PewterCity
	db SPRITE_GRAMPS
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_F
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BIRD_KEEPER
	db SPRITE_SCHOOLBOY
	db SPRITE_BEAUTY
	; max 9 of 9 walking sprites
	db SPRITE_BUG_MANIAC
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

; CeruleanCity and Route5 are connected
CeruleanGroupSprites:
; Route4, Route4ZapdosNest, Route5, Route 9, Route10North, Route24, Route25, CeruleanCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_BIRD_KEEPER
	db SPRITE_LASS
	db SPRITE_ROCKET ; doesn't walk? Spins on spot, then warps away
	db SPRITE_MISTY
	db SPRITE_AGATHA
	db SPRITE_SCHOOLBOY
	; max 9 of 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_SLOWBRO
	db SPRITE_LADY
	db SPRITE_ZAPDOS
	db 0 ; end
	
SaffronGroupSprites:
; Route9, Route10North, SaffronCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SCHOOLBOY
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	; max 7 of 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

VermilionGroupSprites:
; Route6, Route11, VermilionCity
	db SPRITE_POKEFAN_M
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_SCIENTIST
	db SPRITE_LADY
	db SPRITE_SCHOOLBOY
	db SPRITE_BIRD_KEEPER
	; 9 of max 9 walking sprites
	db SPRITE_BIG_SNORLAX
	db SPRITE_MACHOP
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

CeladonGroupSprites:
; Route7, Route16, Route17, CeladonCity
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BIKER
	db SPRITE_BUG_MANIAC
	; 7 of max 9 walking sprites
	db SPRITE_POLIWRATH
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

; Route12 and Route13 are connected
LavenderGroupSprites:
; Route8, Route12, Route10South, LavenderTown
FuchsiaGroupSprites:
; Route13, Route14, Route15, Route18, FuchsiaCity
	db SPRITE_POKEFAN_M
	db SPRITE_GRAMPS
	db SPRITE_SCHOOLBOY
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_BIKER
	db SPRITE_BIRD_KEEPER
	db SPRITE_SWIMMER_GUY
	; 9 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_LADY
	db SPRITE_LAPRAS_SAFARI
	db SPRITE_NIDOKING
	db SPRITE_NIDOQUEEN
	db SPRITE_PINSIR
	db SPRITE_TAUROS
	db SPRITE_TOGEKISS
	db 0 ; end

IndigoGroupSprites:
; Route23, IndigoPlateau
	db SPRITE_FALKNER
	db SPRITE_BUGSY
	db SPRITE_WHITNEY
	db SPRITE_MORTY
	db SPRITE_CHUCK
	db SPRITE_JASMINE
	db SPRITE_PRYCE
	db SPRITE_CLAIR
	; 8 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_NOCTOWL
	db SPRITE_SCYTHER
	db SPRITE_MILTANK
	db SPRITE_GENGAR
	db SPRITE_POLIWRATH
	db SPRITE_STEELIX
	db SPRITE_MAMOSWINE
	db SPRITE_KINGDRA
	db 0 ; end

; Route29 and CherrygroveCity are connected
NewBarkGroupSprites:
; Route27, Route29, NewBarkTown
CherrygroveGroupSprites:
; Route30, Route31, CherrygroveCity
	db SPRITE_RIVAL
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_YOUNGSTER
	db SPRITE_SCHOOLBOY
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	; max 9 of 9 walking sprites
	db SPRITE_BUG_MANIAC
	db SPRITE_RATTATA
	db SPRITE_RATTATA_BACK
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_HOOTHOOT
	db 0 ; end

VioletGroupSprites:
; Route32, VioletCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_SCHOOLBOY
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_OFFICER
	db SPRITE_BIRD_KEEPER
	db SPRITE_SUPER_NERD
	db SPRITE_BUG_CATCHER
	; 9 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

; Route37 and EcruteakCity are connected
EcruteakGroupSprites:
; Route35, Route36, Route37, EcruteakCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_SCHOOLBOY
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_OFFICER
	db SPRITE_BIRD_KEEPER
	db SPRITE_SUPER_NERD
	db SPRITE_BUG_CATCHER
	; 9 of max 9 walking sprites
	db SPRITE_SUDOWOODO
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_BUG_MANIAC
	db SPRITE_SUICUNE
	db SPRITE_TWIN
	db 0 ; end

AzaleaGroupSprites:
; Route33, AzaleaTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_TEACHER
	db SPRITE_ROCKET
	db SPRITE_RIVAL
	db SPRITE_LASS
	db SPRITE_PROTON
	; 8 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_SLOWPOKE
	db SPRITE_KURT
	db 0 ; end

GoldenrodGroupSprites:
; Route34, GoldenrodCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_OFFICER
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_ROCKET
	db SPRITE_LASS
	db SPRITE_LADY
	db SPRITE_SCHOOLBOY
	; 9 of max 9 walking sprites
	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_POKE_BALL
	db SPRITE_WHITNEY
	db 0 ; end

; OlivineCity and Route40 are connected
OlivineGroupSprites:
; Route38, Route39, OlivineCity
CianwoodGroupSprites:
; Route40, Route41, CianwoodCity, BattleTowerOutside
	db SPRITE_RIVAL
	db SPRITE_POKEFAN_M
	db SPRITE_LASS
	db SPRITE_LADY
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GUY
	db SPRITE_SAILOR
	db SPRITE_POKEFAN_F
	db SPRITE_EUSINE
	; 9 of max 9 walking sprites
	db SPRITE_MILTANK
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db SPRITE_BUG_MANIAC
	db SPRITE_YOUNGSTER
	db SPRITE_SCHOOLBOY
	db SPRITE_BIRD_KEEPER
	db SPRITE_BEAUTY
	db SPRITE_SUICUNE
	db 0 ; end

MahoganyGroupSprites:
; Route42, Route44, MahoganyTown
	db SPRITE_GRAMPS
	db SPRITE_SCHOOLBOY
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_BIRD_KEEPER
	; 9 of max 9 walking sprites
	db SPRITE_BUG_MANIAC
	db SPRITE_LADY
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db SPRITE_SUICUNE
	db 0 ; end

LakeOfRageGroupSprites:
; Route43, LakeOfRage
	db SPRITE_LANCE
	db SPRITE_GRAMPS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_LASS
	db SPRITE_SCHOOLBOY
	db SPRITE_LADY
	; 9 of max 9 walking sprites
	db SPRITE_GYARADOS
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

BlackthornGroupSprites:
; Route45, Route46, BlackthornCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_BLACK_BELT
	db SPRITE_COOLTRAINER_F
	db SPRITE_LADY
	; 9 of max 9 walking sprites
	db SPRITE_SCHOOLBOY
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db SPRITE_GLIGAR
	db 0 ; end

SilverGroupSprites:
; Route28, SilverCaveOutside
	; 0 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

DungeonsGroupSprites:
; NationalPark, NationalParkBugContest, RuinsOfAlphOutside
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKER
	db SPRITE_FISHER
	db SPRITE_SCIENTIST
	db SPRITE_SCHOOLBOY
	; 9 of max 9 walking sprites
	db SPRITE_GAMEBOY_KID
	db SPRITE_PERSIAN
	db SPRITE_LADY
	db SPRITE_POKE_BALL
	db 0 ; end

FastShipGroupSprites:
; OlivinePort, VermilionPort, MountMoonSquare, TinTowerRoof, Faraway Island
	db SPRITE_SAILOR
	db SPRITE_FISHING_GURU
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_CLEFAIRY
	; 6 of max 9 walking sprites
	db SPRITE_HO_OH
	db SPRITE_MEW
	db SPRITE_ROCK
	db 0 ; end

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end
	
SafariGroupSprites:
; SafariZoneHub, SafariZoneEast, SafariZoneNorth, SafariZoneWest
	db SPRITE_GENTLEMAN
	db SPRITE_LASS
	db SPRITE_FISHER
	db SPRITE_SCIENTIST
	db SPRITE_COOLTRAINER_F
	; 6 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end
