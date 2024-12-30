; code from Polished/Rangi's tutorial, palettes by Major Agnostic
MACRO icon_pals
	dn PAL_ICON_\1, PAL_ICON_\2
ENDM

MonMenuIconPals:
	table_width 1, MonMenuIconPals
	;         normal, shiny
	icon_pals GREEN,  YELLOW ; BULBASAUR
	icon_pals GREEN,  YELLOW ; IVYSAUR
	icon_pals GREEN,  YELLOW ; VENUSAUR
	icon_pals RED,    YELLOW ; CHARMANDER
	icon_pals RED,    YELLOW ; CHARMELEON
	icon_pals RED,    GRAY   ; CHARIZARD
	icon_pals BLUE,   GRAY   ; SQUIRTLE
	icon_pals BLUE,   GRAY   ; WARTORTLE
	icon_pals BLUE,   PURPLE ; BLASTOISE
	icon_pals GREEN,  YELLOW ; CATERPIE
	icon_pals GREEN,  RED    ; METAPOD
	icon_pals BLUE,   PINK   ; BUTTERFREE
	icon_pals RED,    YELLOW ; WEEDLE
	icon_pals YELLOW, GREEN  ; KAKUNA
	icon_pals YELLOW, GREEN  ; BEEDRILL
	icon_pals BROWN,  YELLOW ; PIDGEY
	icon_pals BROWN,  YELLOW ; PIDGEOTTO
	icon_pals BROWN,  YELLOW ; PIDGEOT
	icon_pals PURPLE, BROWN  ; RATTATA
	icon_pals BROWN,  RED    ; RATICATE
	icon_pals BLUE,   GREEN  ; MARILL			; replaced Spearow
	icon_pals BLUE,   YELLOW ; AZUMARILL		; replaced Fearow
	icon_pals PURPLE, GREEN  ; EKANS
	icon_pals PURPLE, YELLOW ; ARBOK
	icon_pals YELLOW, RED    ; PIKACHU
	icon_pals YELLOW, RED    ; RAICHU
	icon_pals BROWN,  GRAY   ; SANDSHREW
	icon_pals BROWN,  RED    ; SANDSLASH
	icon_pals BLUE,   PINK   ; NIDORAN_F
	icon_pals BLUE,   PINK   ; NIDORINA
	icon_pals BLUE,   GRAY   ; NIDOQUEEN
	icon_pals PURPLE, BLUE   ; NIDORAN_M
	icon_pals PURPLE, BLUE   ; NIDORINO
	icon_pals PURPLE, BLUE   ; NIDOKING
	icon_pals PINK,   GREEN  ; CLEFAIRY
	icon_pals PINK,   GREEN  ; CLEFABLE
	icon_pals RED,    YELLOW ; VULPIX
	icon_pals YELLOW, GRAY   ; NINETALES
	icon_pals BLUE,   GREEN  ; JIGGLYPUFF
	icon_pals PINK,   PURPLE ; WIGGLYTUFF
	icon_pals BLUE,   GREEN  ; ZUBAT
	icon_pals BLUE,   GREEN  ; GOLBAT
	icon_pals GREEN,  YELLOW ; ODDISH
	icon_pals RED,    YELLOW ; GLOOM
	icon_pals RED,    YELLOW ; VILEPLUME
	icon_pals RED,    YELLOW ; PARAS
	icon_pals RED,    YELLOW ; PARASECT
	icon_pals RED,    BLUE   ; VENONAT
	icon_pals PURPLE, BLUE   ; VENOMOTH
	icon_pals BROWN,  BLUE   ; DIGLETT
	icon_pals BROWN,  BLUE   ; DUGTRIO
	icon_pals BROWN,  RED    ; MEOWTH
	icon_pals BROWN,  PINK   ; PERSIAN
	icon_pals YELLOW, BLUE   ; PSYDUCK
	icon_pals BLUE,   PINK   ; GOLDUCK
	icon_pals BROWN,  GREEN  ; MANKEY
	icon_pals BROWN,  GREEN  ; PRIMEAPE
	icon_pals RED,    YELLOW ; GROWLITHE
	icon_pals RED,    YELLOW ; ARCANINE
	icon_pals RED,    PINK   ; POLIWAG
	icon_pals BLUE,   GRAY   ; POLIWHIRL
	icon_pals BLUE,   GREEN  ; POLIWRATH
	icon_pals YELLOW, PINK   ; ABRA
	icon_pals YELLOW, PINK   ; KADABRA
	icon_pals YELLOW, PINK   ; ALAKAZAM
	icon_pals GRAY,   GREEN  ; MACHOP
	icon_pals GRAY,   GREEN  ; MACHOKE
	icon_pals GRAY,   GREEN  ; MACHAMP
	icon_pals GREEN,  YELLOW ; BELLSPROUT
	icon_pals GREEN,  YELLOW ; WEEPINBELL
	icon_pals GREEN,  YELLOW ; VICTREEBEL
	icon_pals BLUE,   GREEN  ; TENTACOOL
	icon_pals BLUE,   GREEN  ; TENTACRUEL
	icon_pals GRAY,   YELLOW ; GEODUDE
	icon_pals GRAY,   YELLOW ; GRAVELER
	icon_pals GRAY,   YELLOW ; GOLEM
	icon_pals RED,    BLUE   ; PONYTA
	icon_pals RED,    PURPLE ; RAPIDASH
	icon_pals PINK,   PURPLE ; SLOWPOKE
	icon_pals PINK,   BLUE   ; SLOWBRO
	icon_pals GRAY,   BROWN  ; MAGNEMITE
	icon_pals GRAY,   BROWN  ; MAGNETON
	icon_pals BROWN,  RED    ; FARFETCH_D
	icon_pals BROWN,  GREEN  ; DODUO
	icon_pals BROWN,  GREEN  ; DODRIO
	icon_pals GRAY,   BROWN  ; SEEL
	icon_pals GRAY,   BROWN  ; DEWGONG
	icon_pals PURPLE, GREEN  ; GRIMER
	icon_pals PURPLE, GREEN  ; MUK
	icon_pals PURPLE, YELLOW ; SHELLDER
	icon_pals PURPLE, BLUE   ; CLOYSTER
	icon_pals PURPLE, BLUE   ; GASTLY
	icon_pals PURPLE, BLUE   ; HAUNTER
	icon_pals PURPLE, BLUE   ; GENGAR
	icon_pals GRAY,   BROWN  ; ONIX
	icon_pals YELLOW, PINK   ; DROWZEE
	icon_pals YELLOW, PINK   ; HYPNO
	icon_pals RED,    YELLOW ; KRABBY
	icon_pals RED,    GREEN  ; KINGLER
	icon_pals RED,    BLUE   ; VOLTORB
	icon_pals RED,    BLUE   ; ELECTRODE
	icon_pals PINK,   YELLOW ; EXEGGCUTE
	icon_pals GREEN,  BROWN  ; EXEGGUTOR
	icon_pals BROWN,  GREEN  ; CUBONE
	icon_pals BROWN,  GREEN  ; MAROWAK
	icon_pals BROWN,  GREEN  ; HITMONLEE
	icon_pals BROWN,  BLUE   ; HITMONCHAN
	icon_pals PURPLE, GRAY   ; KOFFING			; replaced Lickitung
	icon_pals PURPLE, GRAY   ; WEEZING			; moved Koffing
	icon_pals GRAY,   BROWN  ; RHYHORN			; moved Weezing
	icon_pals GRAY,   YELLOW ; RHYDON			; moved Rhyhorn
	icon_pals PINK,   GREEN  ; CHANSEY			; moved Rhydon
	icon_pals BLUE,   GREEN  ; TANGELA			; moved Chansey
	icon_pals BROWN,  GREEN  ; KANGASKHAN		; moved Tangela
	icon_pals BLUE,   GRAY   ; HORSEA			; moved Kangaskhan
	icon_pals BLUE,   PURPLE ; SEADRA			; moved Horsea
	icon_pals RED,    BLUE   ; TOGEPI			; moved Seadra
	icon_pals RED,    BLUE   ; TOGETIC			; replaced Goldeen
	icon_pals RED,    BLUE   ; TOGEKISS			; replaced Seaking
	icon_pals BROWN,  GRAY   ; STARYU
	icon_pals PURPLE, BLUE   ; STARMIE
	icon_pals RED,    GREEN  ; MR_MIME
	icon_pals GREEN,  GRAY   ; SCYTHER
	icon_pals RED,    PURPLE ; JYNX
	icon_pals YELLOW, BROWN  ; ELECTABUZZ
	icon_pals RED,    PINK   ; MAGMAR
	icon_pals BROWN,  BLUE   ; PINSIR
	icon_pals BROWN,  GREEN  ; TAUROS
	icon_pals RED,    YELLOW ; MAGIKARP
	icon_pals BLUE,   RED    ; GYARADOS
	icon_pals BLUE,   PURPLE ; LAPRAS
	icon_pals PURPLE, BLUE   ; DITTO
	icon_pals BROWN,  GRAY   ; EEVEE
	icon_pals BLUE,   PURPLE ; VAPOREON
	icon_pals YELLOW, GREEN  ; JOLTEON
	icon_pals RED,    BROWN  ; FLAREON
	icon_pals RED,    BLUE   ; PORYGON
	icon_pals BLUE,   PURPLE ; OMANYTE
	icon_pals BLUE,   PURPLE ; OMASTAR
	icon_pals BROWN,  GREEN  ; KABUTO
	icon_pals BROWN,  GREEN  ; KABUTOPS
	icon_pals GRAY,   PINK   ; AERODACTYL
	icon_pals BROWN,  BLUE   ; SNORLAX
	icon_pals BLUE,   GRAY   ; ARTICUNO
	icon_pals YELLOW, BROWN  ; ZAPDOS
	icon_pals RED,    PINK   ; MOLTRES
	icon_pals BLUE,   PINK   ; DRATINI
	icon_pals BLUE,   PINK   ; DRAGONAIR
	icon_pals RED,    GREEN  ; DRAGONITE
	icon_pals PURPLE, GREEN  ; MEWTWO
	icon_pals PINK,   BLUE   ; MEW
	icon_pals GREEN,  YELLOW ; CHIKORITA
	icon_pals GREEN,  YELLOW ; BAYLEEF
	icon_pals GREEN,  YELLOW ; MEGANIUM
	icon_pals RED,    PURPLE ; CYNDAQUIL
	icon_pals RED,    PURPLE ; QUILAVA
	icon_pals RED,    PURPLE ; TYPHLOSION
	icon_pals BLUE,   GRAY   ; TOTODILE
	icon_pals BLUE,   GRAY   ; CROCONAW
	icon_pals BLUE,   GRAY   ; FERALIGATR
	icon_pals BROWN,  YELLOW ; SENTRET
	icon_pals BROWN,  PINK   ; FURRET
	icon_pals BROWN,  YELLOW ; HOOTHOOT
	icon_pals BROWN,  YELLOW ; NOCTOWL
	icon_pals RED,    YELLOW ; LEDYBA
	icon_pals RED,    YELLOW ; LEDIAN
	icon_pals GREEN,  BLUE   ; SPINARAK
	icon_pals RED,    PURPLE ; ARIADOS
	icon_pals PURPLE, PINK   ; CROBAT
	icon_pals BLUE,   GRAY   ; CHINCHOU
	icon_pals BLUE,   PURPLE ; LANTURN
	icon_pals GRAY,   BROWN  ; MAGNEZONE			; replaced Pichu
	icon_pals GRAY,   RED    ; RHYPERIOR			; replaced Cleffa
	icon_pals BLUE,   GREEN  ; TANGROWTH			; replaced Igglybuff
	icon_pals YELLOW, BROWN  ; ELECTIVIRE			; replaced Togepi
	icon_pals RED,    PINK   ; MAGMORTAR			; replaced Togetic
	icon_pals GREEN,  GRAY   ; NATU
	icon_pals GREEN,  GRAY   ; XATU
	icon_pals BLUE,   PINK   ; MAREEP
	icon_pals PINK,   PURPLE ; FLAAFFY
	icon_pals YELLOW, PINK   ; AMPHAROS
	icon_pals GREEN,  PURPLE ; BELLOSSOM
	icon_pals GREEN,  RED    ; SUDOWOODO			; moved Marill
	icon_pals GREEN,  PURPLE ; POLITOED				; moved Azumarill
	icon_pals GREEN,  YELLOW ; SUNKERN				; moved Sudowoodo
	icon_pals GREEN,  YELLOW ; SUNFLORA				; moved Politoed
	icon_pals RED,    GREEN  ; HOPPIP
	icon_pals GREEN,  PURPLE ; SKIPLOOM
	icon_pals BLUE,   PINK   ; JUMPLUFF
	icon_pals RED,    BLUE   ; YANMA				; removed Aipom
	icon_pals GREEN,  BLUE   ; YANMEGA				; removed Sunkern
	icon_pals BLUE,   PURPLE ; MURKROW				; removed Sunflora
	icon_pals BLUE,   PURPLE ; HONCHKROW			; removed Yanma
	icon_pals BLUE,   PINK   ; WOOPER
	icon_pals BLUE,   PINK   ; QUAGSIRE
	icon_pals PURPLE, GREEN  ; ESPEON
	icon_pals GRAY,   BLUE   ; UMBREON
	icon_pals PINK,   BLUE   ; SLOWKING				; moved Murkrow
	icon_pals PURPLE, YELLOW ; MISDREAVUS			; moved Slowking
	icon_pals PURPLE, YELLOW ; MISMAGIUS			; moved Misdreavus
	icon_pals GRAY,   BLUE   ; UNOWN
	icon_pals BLUE,   PURPLE ; WOBBUFFET
	icon_pals RED,    BLUE   ; GIRAFARIG
	icon_pals BLUE,   YELLOW ; PINECO
	icon_pals GRAY,   YELLOW ; FORRETRESS
	icon_pals BLUE,   PINK   ; DUNSPARCE
	icon_pals PINK,   BLUE   ; CORSOLA				; moved Gligar
	icon_pals GRAY,   BROWN  ; STEELIX
	icon_pals PINK,   GRAY   ; SNUBBULL
	icon_pals PURPLE, BROWN  ; GRANBULL
	icon_pals BLUE,   PURPLE ; QWILFISH
	icon_pals RED,    GREEN  ; SCIZOR
	icon_pals RED,    BLUE   ; SHUCKLE
	icon_pals BLUE,   PURPLE ; HERACROSS
	icon_pals RED,    PURPLE ; DELIBIRD				; moved Sneasel
	icon_pals BROWN,  GREEN  ; TEDDIURSA
	icon_pals BROWN,  GREEN  ; URSARING
	icon_pals RED,    GRAY   ; SLUGMA
	icon_pals RED,    PURPLE ; MAGCARGO
	icon_pals BROWN,  GRAY   ; SWINUB
	icon_pals BROWN,  YELLOW ; PILOSWINE
	icon_pals BROWN,  GREEN  ; MAMOSWINE			; moved Corsola
	icon_pals BLUE,   PURPLE ; REMORAID
	icon_pals RED,    GREEN  ; OCTILLERY
	icon_pals BLUE,   GRAY   ; PHANPY				; moved Delibird
	icon_pals GRAY,   BROWN  ; DONPHAN				; moved Mantine
	icon_pals GRAY,   BROWN  ; SKARMORY
	icon_pals RED,    BLUE   ; HOUNDOUR
	icon_pals RED,    BLUE   ; HOUNDOOM
	icon_pals BLUE,   PURPLE ; KINGDRA
	icon_pals BLUE,   GRAY   ; MANTINE				; moved Phanpy
	icon_pals RED,    PINK   ; SNEASEL				; moved Donphan
	icon_pals PURPLE, PINK   ; WEAVILE				; moved Porygon2
	icon_pals PURPLE, BLUE   ; GLIGAR				; replaced Stantler
	icon_pals PURPLE, BLUE   ; GLISCOR				; moved Smeargle
	icon_pals BROWN,  GREEN  ; SMEARGLE				; moved Tyrogue
	icon_pals BROWN,  BLUE   ; TYROGUE				; moved Hitmontop
	icon_pals BROWN,  PURPLE ; HITMONTOP			; replaced Smoochum
	icon_pals RED,    BLUE   ; PORYGON2				; replaced Elekid
	icon_pals RED,    BLUE   ; PORYGON_Z			; replaced Magby
	icon_pals PINK,   BLUE   ; MILTANK
	icon_pals PINK,   PURPLE ; BLISSEY
	icon_pals YELLOW, RED    ; RAIKOU
	icon_pals RED,    BROWN  ; ENTEI
	icon_pals BLUE,   GRAY   ; SUICUNE
	icon_pals GREEN,  YELLOW ; LARVITAR
	icon_pals BLUE,   PURPLE ; PUPITAR
	icon_pals GREEN,  BROWN  ; TYRANITAR
	icon_pals BLUE,   RED    ; LUGIA
	icon_pals RED,    BROWN  ; HO_OH
	icon_pals GREEN,  PINK   ; CELEBI
	icon_pals PINK,   BLUE   ; SYLVEON
	icon_pals YELLOW, RED    ; PIKACHU_P
	assert_table_length NUM_POKEMON
	icon_pals GREEN,  BLUE   ; EGG
	assert_table_length EGG