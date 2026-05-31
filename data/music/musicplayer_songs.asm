SECTION "MusicPlayer Songs", ROMX

MusicPlayerSongs::
	; Reorder this list to change the Music Player track order.
	db 117
	db MUSIC_TITLE, MUSIC_CRYSTAL_OPENING, MUSIC_GS_OPENING, MUSIC_GS_OPENING_2
	db MUSIC_MAIN_MENU, MUSIC_SHOW_ME_AROUND, MUSIC_BICYCLE, MUSIC_BICYCLE_RB
	db MUSIC_SURF, MUSIC_SURF_RBY
	db MUSIC_MOBILE_ADAPTER_MENU, MUSIC_MOBILE_ADAPTER, MUSIC_PRINTER
	db MUSIC_ROUTE_29, MUSIC_ROUTE_30, MUSIC_ROUTE_36, MUSIC_ROUTE_37
	db MUSIC_NEW_BARK_TOWN, MUSIC_CHERRYGROVE_CITY, MUSIC_VIOLET_CITY, MUSIC_AZALEA_TOWN
	db MUSIC_GOLDENROD_CITY, MUSIC_ECRUTEAK_CITY, MUSIC_CIANWOOD_CITY
	db MUSIC_LAKE_OF_RAGE, MUSIC_BATTLE_TOWER_THEME, MUSIC_BATTLE_TOWER_LOBBY, MUSIC_DARK_CAVE
	db MUSIC_UNION_CAVE, MUSIC_NATIONAL_PARK, MUSIC_RUINS_OF_ALPH_INTERIOR, MUSIC_TIN_TOWER
	db MUSIC_SPROUT_TOWER, MUSIC_BURNED_TOWER, MUSIC_DANCING_HALL, MUSIC_LIGHTHOUSE
	db MUSIC_ROCKET_HIDEOUT, MUSIC_DRAGONS_DEN, MUSIC_BUG_CATCHING_CONTEST_RANKING, MUSIC_BUG_CATCHING_CONTEST
	db MUSIC_SS_AQUA, MUSIC_GAME_CORNER, MUSIC_GYM, MUSIC_POKEMON_CENTER
	db MUSIC_POKEMART_HGSS, MUSIC_MAGNET_TRAIN, MUSIC_MOBILE_CENTER, 
	db MUSIC_ROUTE_1, MUSIC_ROUTE_2, MUSIC_ROUTE_3, 
	db MUSIC_ROUTE_12, MUSIC_ROUTE_24, MUSIC_ROUTE_26
	db MUSIC_PALLET_TOWN, MUSIC_VIRIDIAN_CITY, MUSIC_CERULEAN_CITY, MUSIC_VERMILION_CITY
	db MUSIC_CELADON_CITY, MUSIC_LAVENDER_TOWN, MUSIC_CINNABAR_ISLAND
	db MUSIC_MT_MOON, MUSIC_MT_MOON_SQUARE, MUSIC_SAFARI_ZONE, MUSIC_CERULEAN_CAVE
	db MUSIC_VICTORY_ROAD, MUSIC_INDIGO_PLATEAU, MUSIC_HALL_OF_FAME, MUSIC_ABANDONED_SHIP
	db MUSIC_PROF_OAK, MUSIC_PROF_ELM, MUSIC_MUM, MUSIC_CLAIR
	db MUSIC_ROCKET_OVERTURE, MUSIC_BUENAS_PASSWORD, MUSIC_HIKER_ENCOUNTER, MUSIC_LASS_ENCOUNTER
	db MUSIC_OFFICER_ENCOUNTER, MUSIC_KIMONO_ENCOUNTER, MUSIC_YOUNGSTER_ENCOUNTER, MUSIC_BEAUTY_ENCOUNTER
	db MUSIC_POKEMANIAC_ENCOUNTER, MUSIC_SAGE_ENCOUNTER, MUSIC_EUSINE_ENCOUNTER, MUSIC_ROCKET_ENCOUNTER
	db MUSIC_ROCKET_BATTLE, MUSIC_RIVAL_ENCOUNTER, MUSIC_RIVAL_BATTLE, MUSIC_RIVAL_AFTER
	db MUSIC_LYRA_ENCOUNTER, MUSIC_LYRA_DEPARTURE, MUSIC_JOHTO_TRAINER_BATTLE, MUSIC_KANTO_TRAINER_BATTLE
	db MUSIC_TRAINER_VICTORY, MUSIC_JOHTO_GYM_LEADER_BATTLE, MUSIC_KANTO_GYM_LEADER_BATTLE, MUSIC_GYM_VICTORY
	db MUSIC_CHAMPION_BATTLE, MUSIC_KANTO_WILD_BATTLE, MUSIC_JOHTO_WILD_BATTLE, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	db MUSIC_SUICUNE_BATTLE, MUSIC_LUGIA_BATTLE, MUSIC_HO_OH_BATTLE, MUSIC_KANTO_LEGEND_BATTLE
	db MUSIC_WILD_VICTORY, MUSIC_POKEMON_TALK, MUSIC_POKEMON_CHANNEL, MUSIC_POKE_FLUTE_CHANNEL
	db MUSIC_RUINS_OF_ALPH_RADIO, MUSIC_POKEMON_LULLABY, MUSIC_POKEMON_MARCH, MUSIC_LAKE_OF_RAGE_ROCKET_RADIO
	db MUSIC_CAPTURE, MUSIC_EVOLUTION, MUSIC_HEAL
	db MUSIC_CREDITS, MUSIC_POST_CREDITS
	db -1

MusicPlayerSongNamePointers::
	table_width 3
	dba .None
	dba .Title
	dba .Route1
	dba .Route3
	dba .Route12
	dba .MagnetTrain
	dba .KantoGymBattle
	dba .KantoTrainerBattle
	dba .KantoWildBattle
	dba .PokemonCenter
	dba .HikerEncounter
	dba .LassEncounter
	dba .OfficerEncounter
	dba .HealPokemon
	dba .LavenderTown
	dba .Route2
	dba .MtMoon
	dba .ShowMeAround
	dba .GameCorner
	dba .Bicycle
	dba .HallOfFame
	dba .ViridianCity
	dba .CeladonCity
	dba .TrainerVictory
	dba .WildVictory
	dba .GymVictory
	dba .MtMoonSquare
	dba .Gym
	dba .PalletTown
	dba .OaksPokemonTalk
	dba .ProfOak
	dba .RivalEncounter
	dba .AfterRivalFight
	dba .Surf
	dba .Evolution
	dba .NationalPark
	dba .Credits
	dba .AzaleaTown
	dba .CherrygroveCity
	dba .KimonoEncounter
	dba .UnionCave
	dba .JohtoWildBattle
	dba .JohtoTrainerBattle
	dba .Route30
	dba .EcruteakCity
	dba .VioletCity
	dba .JohtoGymBattle
	dba .ChampionBattle
	dba .RivalBattle
	dba .RocketBattle
	dba .ElmsLab
	dba .DarkCave
	dba .Route29
	dba .Route36
	dba .SSAqua
	dba .YoungsterEncounter
	dba .BeautyEncounter
	dba .RocketEncounter
	dba .PokemaniacEncounter
	dba .SageEncounter
	dba .NewBarkTown
	dba .GoldenrodCity
	dba .VermilionCity
	dba .PokemonChannel
	dba .PokeFluteChannel
	dba .TinTower
	dba .SproutTower
	dba .BurnedTower
	dba .Lighthouse
	dba .LakeOfRage
	dba .IndigoPlateau
	dba .Route37
	dba .RocketHideout
	dba .DragonsDen
	dba .JohtoWildBattleNight
	dba .RuinsOfAlphRadio
	dba .SuccessfulCapture
	dba .Route26
	dba .Mum
	dba .VictoryRoad
	dba .PokemonLullaby
	dba .PokemonMarch
	dba .GSOpening
	dba .GSOpening2
	dba .MainMenu
	dba .RuinsOfAlphInterior
	dba .RocketOverture
	dba .DancingHall
	dba .BugContestRanking
	dba .BugContest
	dba .RocketRadio
	dba .Printer
	dba .PostCredits
; new to Crystal
	dba .Clair
	dba .MobileAdapterMenu
	dba .MobileAdapter
	dba .BuenasPassword
	dba .EusineEncounter
	dba .CrystalOpening
	dba .BattleTowerTheme
	dba .SuicuneBattle
	dba .BattleTowerLobby
	dba .MobileCenter
	dba .LugiaBattle
	dba .HoOhBattle
	dba .KantoLegendary
	dba .SafariZone
	dba .CinnabarIsland
	dba .AbandonedShip
	dba .CeruleanCave
	dba .LyraEncounter
	dba .LyraDeparture
	dba .PokemartHGSS
	dba .KantoBicycle
	dba .KantoSurf
	dba .CeruleanCity
	dba .Route24
	dba .CianwoodCity

	assert_table_length NUM_MUSIC_SONGS

.None:                db "       None@"
.Title:               db "       Title@"
.Route1:              db "     Route 1@"
.Route3:              db "     Route 3@"
.Route12:             db "     Route 12@"
.MagnetTrain:         db "   Magnet Train@"
.KantoGymBattle:      db " Kanto Gym Battle@"
.KantoTrainerBattle:  db "   Kanto Trainer@"
.KantoWildBattle:     db "    Kanto Wild@"
.PokemonCenter:       db "  #mon Center@"
.HikerEncounter:      db "  Hiker Encounter@"
.LassEncounter:       db "  Lass Encounter@"
.OfficerEncounter:    db " Officer Encounter@"
.HealPokemon:         db "   Heal Pokemon@"
.LavenderTown:        db "   Lavender Town@"
.Route2:              db "     Route 2@"
.MtMoon:              db "     Mt. Moon@"
.ShowMeAround:        db "  Show Me Around@"
.GameCorner:          db "    Game Corner@"
.Bicycle:             db "   Johto Bicycle@"
.HallOfFame:          db "   Hall of Fame@"
.ViridianCity:        db "   Viridian City@"
.CeladonCity:         db "   Celadon City@"
.TrainerVictory:      db "  Trainer Victory@"
.WildVictory:         db "   Wild Victory@"
.GymVictory:          db "   Gym Victory@"
.MtMoonSquare:        db "  Mt. Moon Square@"
.Gym:                 db "        Gym@"
.PalletTown:          db "    Pallet Town@"
.OaksPokemonTalk:     db "     Oak's Talk@"
.ProfOak:             db "     Prof. Oak@"
.RivalEncounter:      db "  Rival Encounter@"
.AfterRivalFight:     db "    After Rival@"
.Surf:                db "    Johto Surf@"
.Evolution:           db "     Evolution@"
.NationalPark:        db "   National Park@"
.Credits:             db "      Credits@"
.AzaleaTown:          db "    Azalea Town@"
.CherrygroveCity:     db " Cherrygrove City@"
.KimonoEncounter:     db " Kimono Encounter@"
.UnionCave:           db "    Union Cave@"
.JohtoWildBattle:     db "    Johto Wild@"
.JohtoTrainerBattle:  db "   Johto Trainer@"
.Route30:             db "     Route 30@"
.EcruteakCity:        db "   Ecruteak City@"
.VioletCity:          db "    Violet City@"
.JohtoGymBattle:      db " Johto Gym Battle@"
.ChampionBattle:      db "  Champion Battle@"
.RivalBattle:         db "   Rival Battle@"
.RocketBattle:        db "   Rocket Battle@"
.ElmsLab:             db "     Elm's Lab@"
.DarkCave:            db "     Dark Cave@"
.Route29:             db "     Route 29@"
.Route36:             db "     Route 36@"
.SSAqua:              db "     S.S. Aqua@"
.YoungsterEncounter:  db "  Youngster Enc.@"
.BeautyEncounter:     db " Beauty Encounter@"
.RocketEncounter:     db " Rocket Encounter@"
.PokemaniacEncounter: db "  #maniac Enc.@"
.SageEncounter:       db "  Sage Encounter@"
.NewBarkTown:         db "   New Bark Town@"
.GoldenrodCity:       db "  Goldenrod City@"
.VermilionCity:       db "  Vermilion City@"
.PokemonChannel:      db "  #mon Channel@"
.PokeFluteChannel:    db "    # Flute@"
.TinTower:            db "     Tin Tower@"
.SproutTower:         db "   Sprout Tower@"
.BurnedTower:         db "   Burned Tower@"
.Lighthouse:          db "    Lighthouse@"
.LakeOfRage:          db "   Lake of Rage@"
.IndigoPlateau:       db "  Indigo Plateau@"
.Route37:             db "     Route 37@"
.RocketHideout:       db "  Rocket Hideout@"
.DragonsDen:          db "    Dragon's Den@"
.JohtoWildBattleNight: db "  Johto Wild Nite@"
.RuinsOfAlphRadio:    db "    Alph Radio@"
.SuccessfulCapture:   db "  Caught #mon!@"
.Route26:             db "     Route 26@"
.Mum:                 db "        Mum@"
.VictoryRoad:         db "   Victory Road@"
.PokemonLullaby:      db "  #mon Lullaby@"
.PokemonMarch:        db "   #mon March@"
.GSOpening:           db "   G.S. Opening@"
.GSOpening2:          db "  G.S. Opening 2@"
.MainMenu:            db "     Main Menu@"
.RuinsOfAlphInterior: db "   Alph Interior@"
.RocketOverture:      db "  Rocket Overture@"
.DancingHall:         db "   Dancing Hall@"
.BugContestRanking:   db "   Bug Contest 1@"
.BugContest:          db "   Bug Contest 2@"
.RocketRadio:         db "   Rocket Radio@"
.Printer:             db "      Printer@"
.PostCredits:         db "   Post Credits@"
.Clair:               db "       Clair@"
.MobileAdapterMenu:   db " Mobile Adapter 1@"
.MobileAdapter:       db " Mobile Adapter 2@"
.BuenasPassword:      db "  Buena's Password@"
.EusineEncounter:     db " Eusine Encounter@"
.CrystalOpening:      db "  Crystal Opening@"
.BattleTowerTheme:    db "   Battle Tower@"
.SuicuneBattle:       db "  Suicune Battle@"
.BattleTowerLobby:    db "    Tower Lobby@"
.MobileCenter:        db "Mobile # Center@"
.LugiaBattle:         db "   Lugia Battle@"
.HoOhBattle:          db "   Ho-Oh Battle@"
.KantoLegendary:      db "  Kanto Legendary@"
.SafariZone:          db "    Safari Zone@"
.CinnabarIsland:      db "  Cinnabar Island@"
.AbandonedShip:       db "  Far Away Island@"
.CeruleanCave:        db "   Cerulean Cave@"
.LyraEncounter:       db "  Lyra Encounter@"
.LyraDeparture:       db "  Lyra Departure@"
.PokemartHGSS:        db "   #mart HGSS@"
.KantoBicycle:        db "   Kanto Bicycle@"
.KantoSurf:           db "    Kanto Surf@"
.CeruleanCity:        db "   Cerulean City@"
.Route24:             db "     Route 24@"
.CianwoodCity:        db "   Cianwood City@"
