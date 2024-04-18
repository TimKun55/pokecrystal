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
	assert_table_length NUM_MAP_GROUPS

; Route1 and ViridianCity are connected
; Route2 and PewterCity are connected
; PalletTown and Route21 are connected
PalletGroupSprites:
; Route1, PalletTown
ViridianGroupSprites:
; Route2, Route22, ViridianCity
PewterGroupSprites:
; Route3, PewterCity
CinnabarGroupSprites:
; Route19, Route20, Route21, CinnabarIsland
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_BLUE
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GUY
	; max 9 of 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db 0 ; end

; CeruleanCity and Route5 are connected
CeruleanGroupSprites:
; Route4, Route5, Route24, Route25, CeruleanCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKET
	db SPRITE_MISTY
	; max 9 of 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_SLOWPOKE
	db 0 ; end
	
SaffronGroupSprites:
; Route9, Route10North, SaffronCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKET
	db SPRITE_LADY
	; max 9 of 9 walking sprites
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
	; 7 of max 9 walking sprites
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
	; 6 of max 9 walking sprites
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
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_BIKER
	db SPRITE_LADY
	; 8 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
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
	db SPRITE_SCIZOR
	db SPRITE_MILTANK
	db SPRITE_GENGAR
	db SPRITE_POLIWRATH
	db SPRITE_STEELIX
	db SPRITE_MAMOSWINE
	db SPRITE_KINGDRA
	db 0 ; end

; Route29 and CherrygroveCity are connected
NewBarkGroupSprites:
; Route26, Route27, Route29, NewBarkTown
CherrygroveGroupSprites:
; Route30, Route31, CherrygroveCity
	db SPRITE_RIVAL
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_YOUNGSTER
	db SPRITE_RATTATA
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	; max 9 of 9 walking sprites
	db SPRITE_BUG_MANIAC
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_HOOTHOOT
	db 0 ; end

; Route37 and EcruteakCity are connected
VioletGroupSprites:
; Route32, Route35, Route36, Route37, VioletCity
EcruteakGroupSprites:
; EcruteakCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_OFFICER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BUG_CATCHER
	db SPRITE_SUPER_NERD
	db SPRITE_TWIN
	; 9 of max 9 walking sprites
	db SPRITE_SUDOWOODO
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_BUG_MANIAC
	db SPRITE_SUICUNE
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
	; 7 of max 9 walking sprites
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
	; 8 of max 9 walking sprites
	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_POKE_BALL
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
	db SPRITE_YOUNGSTER
	db SPRITE_BEAUTY
	db SPRITE_BUG_MANIAC
	db SPRITE_SUICUNE
	db 0 ; end

MahoganyGroupSprites:
; Route42, Route44, MahoganyTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_LADY
	; 9 of max 9 walking sprites
	db SPRITE_BUG_MANIAC
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
	db SPRITE_YOUNGSTER
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
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

SilverGroupSprites:
; Route28, SilverCaveOutside
	; 0 of max 9 walking sprites
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
	; 8 of max 9 walking sprites
	db SPRITE_GAMEBOY_KID
	db SPRITE_GROWLITHE
	db SPRITE_LADY
	db SPRITE_POKE_BALL
	db 0 ; end

FastShipGroupSprites:
; OlivinePort, VermilionPort, MountMoonSquare, TinTowerRoof
	db SPRITE_SAILOR
	db SPRITE_FISHING_GURU
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_CLEFAIRY
	; 6 of max 9 walking sprites
	db SPRITE_HO_OH
	db SPRITE_ROCK
	db 0 ; end

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end