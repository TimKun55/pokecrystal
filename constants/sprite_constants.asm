; sprite ids
; OverworldSprites indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE ; 00
	const SPRITE_ETHAN ; 01
	const SPRITE_ETHAN_BIKE ; 02
	const SPRITE_GAMEBOY_KID ; 03
	const SPRITE_RIVAL ; 04
	const SPRITE_OAK ; 05
	const SPRITE_RED ; 06
	const SPRITE_BLUE ; 07
	const SPRITE_BILL ; 08
	const SPRITE_ELDER ; 09
	const SPRITE_JANINE ; 0a
	const SPRITE_KURT ; 0b
	const SPRITE_MUM ; 0c
	const SPRITE_BLAINE ; 0d
	const SPRITE_REDS_MUM ; 0e
	const SPRITE_DAISY ; 0f
	const SPRITE_ELM ; 10
	const SPRITE_WILL ; 11
	const SPRITE_FALKNER ; 12
	const SPRITE_WHITNEY ; 13
	const SPRITE_BUGSY ; 14
	const SPRITE_MORTY ; 15
	const SPRITE_CHUCK ; 16
	const SPRITE_JASMINE ; 17
	const SPRITE_PRYCE ; 18
	const SPRITE_CLAIR ; 19
	const SPRITE_BROCK ; 1a
	const SPRITE_KAREN ; 1b
	const SPRITE_BRUNO ; 1c
	const SPRITE_MISTY ; 1d
	const SPRITE_LANCE ; 1e
	const SPRITE_SURGE ; 1f
	const SPRITE_ERIKA ; 20
	const SPRITE_KOGA ; 21
	const SPRITE_SABRINA ; 22
	const SPRITE_COOLTRAINER_M ; 23
	const SPRITE_COOLTRAINER_F ; 24
	const SPRITE_BUG_CATCHER ; 25
	const SPRITE_TWIN ; 26
	const SPRITE_YOUNGSTER ; 27
	const SPRITE_LASS ; 28
	const SPRITE_TEACHER ; 29
	const SPRITE_BEAUTY ; 2a
	const SPRITE_SUPER_NERD ; 2b
	const SPRITE_ROCKER ; 2c
	const SPRITE_POKEFAN_M ; 2d
	const SPRITE_POKEFAN_F ; 2e
	const SPRITE_GRAMPS ; 2f
	const SPRITE_GRANNY ; 30
	const SPRITE_SWIMMER_GUY ; 31
	const SPRITE_SWIMMER_GIRL ; 32
	const SPRITE_BIG_SNORLAX ; 33
	const SPRITE_SURFING_PIKACHU ; 34
	const SPRITE_ROCKET ; 35
	const SPRITE_ROCKET_GIRL ; 36
	const SPRITE_NURSE ; 37
	const SPRITE_LINK_RECEPTIONIST ; 38
	const SPRITE_CLERK ; 39
	const SPRITE_FISHER ; 3a
	const SPRITE_FISHING_GURU ; 3b
	const SPRITE_SCIENTIST ; 3c
	const SPRITE_KIMONO_GIRL ; 3d
	const SPRITE_SAGE ; 3e
	const SPRITE_BUG_MANIAC ; 3f
	const SPRITE_GENTLEMAN ; 40
	const SPRITE_BLACK_BELT ; 41
	const SPRITE_RECEPTIONIST ; 42
	const SPRITE_OFFICER ; 43
	const SPRITE_CAL ; 44
	const SPRITE_SLOWPOKE_2 ; 45
	const SPRITE_CAPTAIN ; 46
	const SPRITE_BIG_LAPRAS ; 47
	const SPRITE_GYM_GUIDE ; 48
	const SPRITE_SAILOR ; 49
	const SPRITE_BIKER ; 4a
	const SPRITE_PHARMACIST ; 4b
	const SPRITE_CLEFAIRY_WALKING ; 4c
	const SPRITE_ETHAN_SURF ; 4d
	const SPRITE_KRIS_SURF ; 4e
	const SPRITE_RATTATA_BACK ; 4f
	const SPRITE_BIG_ONIX ; 50
	const SPRITE_N64 ; 51
	const SPRITE_SUDOWOODO ; 52
	const SPRITE_AMPHAROS ; 53
	const SPRITE_BALL_BOOK_POKEDEX ; 54
	const SPRITE_ELECTRIC_FENCE_LEFT ; 55
	const SPRITE_LYRA ; 56
	const SPRITE_VIRTUAL_BOY ; 57
	const SPRITE_ELECTRIC_FENCE_RIGHT ; 58
	const SPRITE_ROCK ; 59
	const SPRITE_BOULDER ; 5a
	const SPRITE_SNES ; 5b
	const SPRITE_FAMICOM ; 5c
	const SPRITE_FRUIT_TREE ; 5d
	const SPRITE_TROPHY ; 5e
	const SPRITE_HIKER ; 5f
	const SPRITE_KRIS ; 60
	const SPRITE_KRIS_BIKE ; 61
	const SPRITE_SUICUNE ; 62
	const SPRITE_ENTEI ; 63
	const SPRITE_RAIKOU ; 64
	const SPRITE_DRAGONITE ; 65
	const SPRITE_FARFETCH_D_ILEX ; 66
	const SPRITE_LAPRAS_SAFARI ; 67
	const SPRITE_RHYDON_WALKING ; 68
	const SPRITE_MEW ; 69
	const SPRITE_HEX_MANIAC ; 6a
	const SPRITE_GIOVANNI ; 6b
	const SPRITE_LADY ; 6c
	const SPRITE_AGATHA ; 6d
	const SPRITE_LORELEI ; 6e
	const SPRITE_ARCHER ; 6f
	const SPRITE_ARIANA ; 70
	const SPRITE_PETREL ; 71
	const SPRITE_PROTON ; 72
	const SPRITE_EUSINE ; 73
	const SPRITE_SCHOOLBOY ; 74
	const SPRITE_BIRD_KEEPER ; 75
	const SPRITE_FOSSILS ; 76
DEF NUM_OVERWORLD_SPRITES EQU const_value - 1

; SpriteMons indexes (see data/sprites/sprite_mons.asm)
	const_next $80
DEF SPRITE_POKEMON EQU const_value
	const SPRITE_BULBASAUR ; 80      ; DOLL
	const SPRITE_CHARMANDER ; 81     ; DOLL
	const SPRITE_SQUIRTLE ; 82       ; DOLL
	const SPRITE_BUTTERFREE ; 83     ; Route34IlexForestGate
	const SPRITE_BEEDRILL ; 84       ; Route2ViridianForestGate
	const SPRITE_PIDGEY ; 85         ; MrFujisHouse, VioletNicknameSpeechHouse
	const SPRITE_PIDGEOT ; 86        ; SaffronAviculturalSociety1F
	const SPRITE_RATTATA ; 87        ; Route30
	const SPRITE_RATICATE ; 88       ; ViridianNicknameSpeechHouse
	const SPRITE_FARFETCH_D ; 89     ; ViridianNicknameSpeechHouse
	const SPRITE_PIKACHU ; 8a        ; DOLL, PlayersHouse1F, PlayersNeighborsHouse
	const SPRITE_RAICHU  ; 8b        ; VermilionGym, DOLL
	const SPRITE_NIDORAN_F ; 8c      ; CeladonMansion1F
	const SPRITE_NIDOQUEEN ; 8d      ; FuchsiaCity
	const SPRITE_NIDORAN_M ; 8e      ; PewterNidoranSpeechHouse
	const SPRITE_NIDORINO ; 8f       ; MrFujisHouse
	const SPRITE_NIDOKING ; 90       ; FuchsiaCity
	const SPRITE_CLEFAIRY ; 91       ; DOLL, CeladonMansion1F, CopycatsHouse2F, MountMoonGiftShop, MountMoonSquare, PokemonFanClub
	const SPRITE_JIGGLYPUFF ; 92     ; DOLL, CeladonHomeDecorStore1F, PewterPokecenter1F, RadioTower2F
	const SPRITE_ZUBAT ; 93          ; CeruleanTradeSpeechHouse
	const SPRITE_ODDISH ; 94         ; DOLL
	const SPRITE_PARASECT ; 95       ; ViridianForestRoute2Gate
	const SPRITE_DIGLETT ; 96        ; DOLL, CeladonHomeDecorStore4F, CeruleanPoliceStation
	const SPRITE_MEOWTH ; 97         ; CeladonMansion1F, RadioTower4F
	const SPRITE_PERSIAN ; 98        ; NationalPark
	const SPRITE_PSYDUCK ; 99        ; MrFujisHouse
	const SPRITE_ARCANINE ; 9a       ; ViridianGym
	const SPRITE_POLIWRATH ; 9b      ; CeladonCity, CianwoodGym, Route23
	const SPRITE_ABRA ; 9c           ; IndigoPlateauPokecenter1F
	const SPRITE_ALAKAZAM ; 9d       ; SaffronGym
	const SPRITE_MACHOP ; 9e         ; VermilionCity
	const SPRITE_MACHOKE ; 9f        ; GoldenrodDeptStoreB1F
	const SPRITE_MACHAMP ; a0        ; BrunosRoom
	const SPRITE_TENTACOOL ; a1      ; DOLL
	const SPRITE_SLOWPOKE ; a2       ; AzaleaTown, KurtsHouse, SlowpokeWellB1F
	const SPRITE_SLOWBRO ; a3        ; CeruleanCity
	const SPRITE_MAGNEMITE ; a4      ; PlayersNeighborsHouse
	const SPRITE_PINECO ; a5         ; Ilex Forest (Static, Shiny, after Diploma)
	const SPRITE_DODRIO ; a6         ; CopycatsHouse2F, SaffronAviculturalSociety1F
	const SPRITE_GRIMER ; a7         ; DOLL, CeladonHomeDecorStore4F
	const SPRITE_SHELLDER ; a8       ; DOLL, CeladonHomeDecorStore4F
	const SPRITE_GENGAR ; a9         ; DOLL, CeladonHomeDecorStore4F, CopycatsHouse2F, EcruteakGym, Route23
	const SPRITE_ONIX ; aa           ; PewterGym
	const SPRITE_VOLTORB ; ab        ; DOLL
	const SPRITE_ELECTRODE ; ac      ; TeamRocketBaseB2F
	const SPRITE_MAGMORTAR ; ad      ; Seafoam Gym
	const SPRITE_HITMONCHAN ; ae     ; NONE
	const SPRITE_WEEZING ; af        ; FuchsiaGym
	const SPRITE_CHANSEY ; b0        ; All PokeCenters
	const SPRITE_KANGASKHAN ; b1     ; CeruleanTradeSpeechHouse
	const SPRITE_STARMIE ; b2        ; CeruleanGym
	const SPRITE_SCYTHER ; b3        ; AzaleaGym, Route23
	const SPRITE_MAGMAR ; b4         ; Seafoam Gym
	const SPRITE_PINSIR ; b5         ; FuchsiaCity
	const SPRITE_TAUROS ; b6         ; FuchsiaCity
	const SPRITE_MAGIKARP ; b7       ; DOLL, CeladonHomeDecorStore1F
	const SPRITE_GYARADOS ; b8       ; LakeOfRage
	const SPRITE_EEVEE ; b9          ; DOLL
	const SPRITE_GLIGAR ; ba         ; Route 45 (Static, Shiny, after Diploma)
	const SPRITE_ARTICUNO ; bb       ; Seafoam Islands, SaffronAviculturalSociety3F
	const SPRITE_ZAPDOS ; bc         ; Route4ZapdosNest, SaffronAviculturalSociety3F
	const SPRITE_MOLTRES ; bd        ; CinnabarMoltresNest, SaffronAviculturalSociety3F
	const SPRITE_DRATINI ; be        ; BlackthornDragonSpeechHouse
	const SPRITE_MEWTWO ; bf         ; CeruleanCaveB1F
	const SPRITE_CHIKORITA ; c0      ; DOLL, GoldenrodHomeDecorStore1F
	const SPRITE_BAYLEEF ; c1        ; PokemonFanClub
	const SPRITE_CYNDAQUIL ; c2      ; DOLL, GoldenrodHomeDecorStore1F 
	const SPRITE_TOTODILE ; c3       ; DOLL, GoldenrodHomeDecorStore1F
	const SPRITE_HOOTHOOT ; c4       ; NewBarkTown, VioletGym
	const SPRITE_NOCTOWL ; c5        ; Route23, VioletGym
	const SPRITE_CROBAT ; c6         ; KogasRoom
	const SPRITE_TOGEKISS ; c7       ; Route14
	const SPRITE_XATU ; c8           ; WillsRoom
	const SPRITE_MAREEP ; c9         ; DOLL, VioletPrimosHouse
	const SPRITE_BELLOSSOM ; ca      ; CeladonGym, CopycatsHouse2F, GoldenrodFlowerShop
	const SPRITE_WOOPER ; cb         ; VioletPrimosHouse, Union Cave B2F (Static, Shiny, after Diploma)
	const SPRITE_SYLVEON ; cc        ; EcruteakFairyFamilyHouse
	const SPRITE_UNOWN_T ; cd        ; RuinsOfAlphGSBallChamber
	const SPRITE_STEELIX ; ce        ; OlivineGym, Route23 
	const SPRITE_SNUBBULL ; cf       ; DOLL
	const SPRITE_WEAVILE ; d0        ; UndergroundRoom
	const SPRITE_TEDDIURSA ; d1      ; DOLL
	const SPRITE_SLUGMA ; d2         ; VioletPrimosHouse
	const SPRITE_MAGCARGO ; d3       ; NONE
	const SPRITE_PILOSWINE ; d4      ; MahoganyGym
	const SPRITE_MAMOSWINE ; d5      ; MahoganyGym, Route23
	const SPRITE_SKARMORY ; d6       ; Route28SteelWingHouse, SaffronAviculturalSociety2F
	const SPRITE_HOUNDOOM ; d7       ; KarensRoom
	const SPRITE_KINGDRA ; d8        ; BlackthornGym1F, IndigoPlateau
	const SPRITE_TYROGUE ; d9        ; NONE
	const SPRITE_PIKACHU_P ; da      ; MtSilverPeak
	const SPRITE_MURKROW ; db        ; SaffronAviculturalSociety2F, TeamRocketBaseB3F
	const SPRITE_MILTANK ; dc        ; GoldenrodGym, Route23, Route39, Route39Barn
	const SPRITE_BLISSEY ; dd        ; CopycatsHouse1F
	const SPRITE_LUGIA ; de          ; WhirlIslandLugiaChamber
	const SPRITE_HO_OH ; df          ; TinTowerRoof
DEF NUM_POKEMON_SPRITES EQU const_value - SPRITE_POKEMON

; special GetMonSprite values (see engine/overworld/overworld.asm)
	const_next $e0
	const SPRITE_DAY_CARE_MON_1 ; e0
	const SPRITE_DAY_CARE_MON_2 ; e1

; wVariableSprites indexes (see wram.asm)
	const_next $f0
DEF SPRITE_VARS EQU const_value
	const SPRITE_CONSOLE ; f0
	const SPRITE_DOLL_1 ; f1
	const SPRITE_DOLL_2 ; f2
	const SPRITE_BIG_DOLL ; f3
	const SPRITE_FUCHSIA_GYM_1 ; f4
	const SPRITE_FUCHSIA_GYM_2 ; f5
	const SPRITE_FUCHSIA_GYM_3 ; f6
	const SPRITE_FUCHSIA_GYM_4 ; f7
	const SPRITE_COPYCAT ; f8
	const SPRITE_JANINE_IMPERSONATOR ; f9
	const SPRITE_FAKE_DIRECTOR ; fa
