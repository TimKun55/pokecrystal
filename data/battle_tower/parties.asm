BattleTowerMons:
; 10 groups (one per floor level) of 21 mons (BATTLETOWER_NUM_UNIQUE_MON).
; Compact rows store only species, item, moves, EVs, DVs, personality,
; happiness and level. Stats, PP, OT/caught data and status are derived at load.
	table_width BATTLETOWER_MON_STRUCT_LENGTH

; BattleTowerMons group 1

	db JOLTEON
	db LUM_BERRY
	db THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 11, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db ESPEON
	db LEFTOVERS
	db MUD_SLAP, PSYCHIC_M, CALM_MIND, TOXIC
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 13, 15, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db UMBREON
	db SITRUS_BERRY
	db SHADOW_BALL, IRON_TAIL, MUD_SLAP, TOXIC
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 11, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db WOBBUFFET
	db FOCUS_BAND
	db COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 7, 15, 13, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db KANGASKHAN
	db LUM_BERRY
	db REVERSAL, HYPER_BEAM, EARTHQUAKE, ATTRACT
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 5, 14, 15, 12, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db CORSOLA
	db SCOPE_LENS
	db SURF, PSYCHIC_M, RECOVER, ANCIENTPOWER
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db MILTANK
	db SITRUS_BERRY
	db BLIZZARD, EARTHQUAKE, HYPER_BEAM, TOXIC
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 11, 11, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db AERODACTYL
	db LEFTOVERS
	db HYPER_BEAM, SUPERSONIC, EARTHQUAKE, BITE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 11, 15, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db LAPRAS
	db LUM_BERRY
	db BLIZZARD, SURF, THUNDERBOLT, PSYCHIC_M
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db SNEASEL
	db SITRUS_BERRY
	db SLASH, FEINT_ATTACK, SURF, BLIZZARD
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 11, 11, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db PORYGON2
	db BRIGHTPOWDER
	db PSYCHIC_M, BLIZZARD, HYPER_BEAM, TRI_ATTACK
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 11, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db MISDREAVUS
	db FOCUS_BAND
	db DRAIN_KISS, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db HOUNDOUR
	db SITRUS_BERRY
	db FEINT_ATTACK, SOLARBEAM, ROAR, SUNNY_DAY
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db GIRAFARIG
	db KINGS_ROCK
	db PSYBEAM, MUD_SLAP, SHADOW_BALL, AGILITY
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 13, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db BLISSEY
	db QUICK_CLAW
	db HEADBUTT, SOLARBEAM, ROLLOUT, STRENGTH
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 12, 13, 15, 12, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db SNORLAX
	db LUM_BERRY
	db HEADBUTT, PROTECT, SNORE, SURF
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db EXEGGUTOR
	db KINGS_ROCK
	db TOXIC, GIGA_DRAIN, THIEF, CONFUSION
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db HERACROSS
	db SITRUS_BERRY
	db REVERSAL, ENDURE, COUNTER, ROCK_SMASH
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 7, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 10 ; Level

	db UNOWN
	db ORAN_BERRY
	db HIDDEN_POWER, OMINOUS_WIND, 0, 0
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 15, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, UNOWN_Z ; nature/form
	db 0 ; Happiness
	db 10 ; Level

	db TAUROS
	db KINGS_ROCK
	db HEADBUTT, SWAGGER, TAIL_WHIP, ICY_WIND
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 6, 5, 5, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 0 ; Happiness
	db 10 ; Level

	db MR__MIME
	db QUICK_CLAW
	db TOXIC, BULK_UP, FIRE_PUNCH, HEADBUTT
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 7, 3, 6, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 10 ; Level


; BattleTowerMons group 2

	db UMBREON
	db LEFTOVERS
	db PROTECT, TOXIC, MUD_SLAP, ATTRACT
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 12, 15, 11, 12, 12 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db STARMIE
	db SITRUS_BERRY
	db RECOVER, PSYCHIC_M, SURF, CALM_MIND
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 11, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db GYARADOS
	db LUM_BERRY
	db HYPER_BEAM, DRAGON_RAGE, THUNDERBOLT, FIRE_BLAST
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 10, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db STEELIX
	db SITRUS_BERRY
	db ROAR, IRON_TAIL, SWAGGER, EARTHQUAKE
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 15, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db ALAKAZAM
	db BERRY_JUICE
	db PSYCHIC_M, CALM_MIND, TOXIC, CHARGE_BEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db ARCANINE
	db BRIGHTPOWDER
	db FLAMETHROWER, ROAR, HYPER_BEAM, IRON_TAIL
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 11, 15, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db HERACROSS
	db FOCUS_BAND
	db ENDURE, REVERSAL, MEGAHORN, EARTHQUAKE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db EXEGGUTOR
	db LEFTOVERS
	db HYPER_BEAM, PSYCHIC_M, TOXIC, DREAM_EATER
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db AERODACTYL
	db SITRUS_BERRY
	db REST, HYPER_BEAM, EARTHQUAKE, DRAGON_RAGE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 11, 11, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db BLISSEY
	db BRIGHTPOWDER
	db PSYCHIC_M, DAZZLINGLEAM, FRESH_SNACK, COUNTER
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 11, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db LAPRAS
	db SITRUS_BERRY
	db PSYCHIC_M, THUNDERBOLT, BLIZZARD, CONFUSE_RAY
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 13, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db PIKACHU
	db LIGHT_BALL
	db THUNDERBOLT, THUNDER_WAVE, STRENGTH, TOXIC
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 12, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db SCIZOR
	db FOCUS_BAND
	db STEEL_WING, SLASH, TOXIC, SANDSTORM
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db HITMONCHAN
	db SITRUS_BERRY
	db THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MEGA_PUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 11, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db TAUROS
	db BRIGHTPOWDER
	db THUNDERBOLT, EARTHQUAKE, HYPER_BEAM, BLIZZARD
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db AZUMARILL
	db MYSTIC_WATER
	db SURF, BLIZZARD, ATTRACT, RAIN_DANCE
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 13, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db MILTANK
	db KINGS_ROCK
	db EARTHQUAKE, THUNDER, ATTRACT, SURF
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db WIGGLYTUFF
	db SITRUS_BERRY
	db HYPER_BEAM, BLIZZARD, FIRE_BLAST, ATTRACT
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 12, 7, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 20 ; Level

	db WIGGLYTUFF
	db PINK_BOW
	db PSYCHIC_M, SWAGGER, MUD_SLAP, HEADBUTT
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 12, 7, 7, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 0 ; Happiness
	db 20 ; Level

	db NIDOKING
	db ORAN_BERRY
	db BLIZZARD, EARTHQUAKE, SURF, THUNDERPUNCH
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 5, 6, 4, 6, 6 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 0 ; Happiness
	db 20 ; Level

	db QUAGSIRE
	db QUICK_CLAW
	db AMNESIA, EARTHQUAKE, SURF, RAIN_DANCE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 5, 5, 4, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 20 ; Level


; BattleTowerMons group 3

	db JOLTEON
	db LUM_BERRY
	db THUNDERBOLT, THUNDER_WAVE, ROAR, MUD_SLAP
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 11, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db POLIWRATH
	db BRIGHTPOWDER
	db DOUBLE_TEAM, SURF, WATER_PULSE, FOCUS_BLAST
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 15, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db STARMIE
	db LEFTOVERS
	db THUNDER_WAVE, PSYCHIC_M, RECOVER, SURF
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 15, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db JYNX
	db SITRUS_BERRY
	db BLIZZARD, SING, DREAM_EATER, ATTRACT
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 12, 15, 11, 14, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, SLUDGE_BOMB, SLASH, MUD_SLAP
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db BELLOSSOM
	db BRIGHTPOWDER
	db GIGA_DRAIN, SUNNY_DAY, SOLARBEAM, DOUBLE_TEAM
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 15, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db BLISSEY
	db LEFTOVERS
	db TOXIC, REFLECT, FRESH_SNACK, PROTECT
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db HOUNDOOM
	db CHARCOAL
	db FLAMETHROWER, CRUNCH, SHADOW_BALL, DREAM_EATER
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db MACHAMP
	db LUM_BERRY
	db CROSS_CHOP, ICE_PUNCH, EARTHQUAKE, FIRE_BLAST
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 11, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db CROBAT
	db SITRUS_BERRY
	db ATTRACT, CONFUSE_RAY, TOXIC, WING_ATTACK
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 14, 15, 13, 12, 12 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db PORYGON2
	db BRIGHTPOWDER
	db PSYCHIC_M, RECOVER, HYPER_BEAM, TRI_ATTACK
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 15, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db MAROWAK
	db THICK_CLUB
	db EARTHQUAKE, RETURN, HYPER_BEAM, BULLDOZE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 255 ; Happiness
	db 30 ; Level

	db ELECTRODE
	db BRIGHTPOWDER
	db LIGHT_SCREEN, THUNDERBOLT, PROTECT, THUNDER
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db LAPRAS
	db LEFTOVERS
	db RAIN_DANCE, WATER_GUN, ICY_WIND, STRENGTH
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db LANTURN
	db SITRUS_BERRY
	db RAIN_DANCE, THUNDER, SURF, REVERSAL
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db ESPEON
	db LUM_BERRY
	db CONFUSION, SWIFT, TOXIC, CALM_MIND
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db TENTACRUEL
	db KINGS_ROCK
	db WRAP, TOXIC, SLUDGE_BOMB, BUBBLEBEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db GENGAR
	db SITRUS_BERRY
	db THIEF, LICK, NIGHT_SHADE, GIGA_DRAIN
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 7, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 30 ; Level

	db URSARING
	db SITRUS_BERRY
	db HEADBUTT, PROTECT, ROAR, LEER
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 7, 7, 4, 5, 5 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 30 ; Level

	db FARFETCH_D
	db LEEK
	db SLASH, POISON_JAB, WING_ATTACK, SWORDS_DANCE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 6, 7, 7, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 30 ; Level

	db PRIMEAPE
	db LUM_BERRY
	db LOW_KICK, KARATE_CHOP, REVERSAL, FOCUS_ENERGY
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 7, 7, 6, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 30 ; Level


; BattleTowerMons group 4

	db TAUROS
	db SITRUS_BERRY
	db RETURN, HYPER_BEAM, EARTHQUAKE, IRON_TAIL
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 255 ; Happiness
	db 40 ; Level

	db KINGDRA
	db LEFTOVERS
	db SURF, DRAGONBREATH, HYPER_BEAM, BLIZZARD
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db SNORLAX
	db QUICK_CLAW
	db ATTRACT, BODY_SLAM, BULK_UP, EARTHQUAKE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db LAPRAS
	db LEFTOVERS
	db THUNDERBOLT, ICE_BEAM, CONFUSE_RAY, SURF
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db STEELIX
	db SITRUS_BERRY
	db SANDSTORM, IRON_TAIL, EARTHQUAKE, TOXIC
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db ALAKAZAM
	db KINGS_ROCK
	db PSYCHIC_M, THUNDERPUNCH, RECOVER, FIRE_PUNCH
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db STARMIE
	db LEFTOVERS
	db BLIZZARD, THUNDERBOLT, SURF, PSYCHIC_M
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 11, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db WOBBUFFET
	db SITRUS_BERRY
	db COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 15, 14, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db GOLEM
	db FOCUS_BAND
	db EXPLOSION, EARTHQUAKE, MEGA_PUNCH, ROCK_SLIDE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db SCIZOR
	db SCOPE_LENS
	db SLASH, STEEL_WING, PURSUIT, HYPER_BEAM
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 11, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, HYPER_BEAM, SLUDGE_BOMB, MUD_SLAP
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 11, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db SLOWBRO
	db LUM_BERRY
	db SURF, PSYCHIC_M, EARTHQUAKE, BLIZZARD
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 15, 12, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db PORYGON2
	db NO_ITEM
	db CHARGE_BEAM, CONVERSION, PSYBEAM, THIEF
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 9, 11, 12, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db ARCANINE
	db CHARCOAL
	db FLAME_CHARGE, LEER, BODY_SLAM, ROAR
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 11, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db FORRETRESS
	db LEFTOVERS
	db RAPID_SPIN, PROTECT, TOXIC, SANDSTORM
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 10, 7, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db OMASTAR
	db SITRUS_BERRY
	db CURSE, WATER_GUN, ANCIENTPOWER, ROCK_SMASH
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db CHARIZARD
	db KINGS_ROCK
	db FIRE_SPIN, DRAGON_RAGE, FLY, SLASH
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db EXEGGUTOR
	db BRIGHTPOWDER
	db ENERGY_BALL, STOMP, CALM_MIND, PSYCHIC_M
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 7, 14, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 40 ; Level

	db HYPNO
	db BRIGHTPOWDER
	db CONFUSION, THUNDERPUNCH, HEADBUTT, DISABLE
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 7, 7, 7, 10, 10 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 40 ; Level

	db MUK
	db QUICK_CLAW
	db SCREECH, TOXIC, SLUDGE, HARDEN
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 7, 5, 6, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 40 ; Level

	db ELECTABUZZ
	db KINGS_ROCK
	db LIGHT_SCREEN, THUNDERPUNCH, SWIFT, SNORE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 6, 5, 7, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 40 ; Level


; BattleTowerMons group 5

	db KINGDRA
	db WISE_GLASSES
	db SURF, HYPER_BEAM, BLIZZARD, DRAGONBREATH
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db HOUNDOOM
	db LUM_BERRY
	db REST, CRUNCH, DREAM_EATER, FLAMETHROWER
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 13, 15, 12, 12 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db SHUCKLE
	db LEFTOVERS
	db SANDSTORM, REST, TOXIC, WRAP
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 12, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db SNORLAX
	db LEFTOVERS
	db HYPER_BEAM, EARTHQUAKE, SURF, BULK_UP
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db LAPRAS
	db SITRUS_BERRY
	db THUNDERBOLT, SURF, CONFUSE_RAY, BLIZZARD
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db JOLTEON
	db KINGS_ROCK
	db THUNDERBOLT, THUNDER_WAVE, SHADOW_BALL, HIDDEN_POWER
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 13, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db SCIZOR
	db LEFTOVERS
	db GIGA_IMPACT, SLASH, AGILITY, METAL_CLAW
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 15, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db SLOWKING
	db CHESTO_BERRY
	db REST, SURF, PSYCHIC_M, AMNESIA
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 15 ; Happiness
	db 50 ; Level

	db MACHAMP
	db SITRUS_BERRY
	db CROSS_CHOP, EARTHQUAKE, FIRE_BLAST, THUNDERPUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 12, 15, 15, 14, 12, 12 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 13 ; Happiness
	db 50 ; Level

	db STARMIE
	db SCOPE_LENS
	db THUNDER_WAVE, RECOVER, THUNDERBOLT, SURF
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 15, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db DUGTRIO
	db KINGS_ROCK
	db EARTHQUAKE, SLASH, HYPER_BEAM, SLUDGE_BOMB
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 7, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db ELECTRODE
	db LUM_BERRY
	db THUNDERBOLT, EXPLOSION, MIRROR_COAT, REST
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 7, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db AERODACTYL
	db KINGS_ROCK
	db GIGA_IMPACT, EARTHQUAKE, ROCK_SLIDE, IRON_TAIL
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db CROBAT
	db LEFTOVERS
	db CONFUSE_RAY, WING_ATTACK, SLUDGE_BOMB, TOXIC
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 15, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db ZAPDOS
	db LIFE_ORB
	db DRILL_PECK, THUNDERBOLT, THUNDER_WAVE, HYPER_BEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db SKARMORY
	db SITRUS_BERRY
	db SANDSTORM, FLY, STEEL_WING, TOXIC
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 7, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db FORRETRESS
	db LEFTOVERS
	db SANDSTORM, TOXIC, EXPLOSION, SWAGGER
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 12, 15, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db STEELIX
	db LUM_BERRY
	db SANDSTORM, IRON_TAIL, REST, EARTHQUAKE
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level

	db GIRAFARIG
	db SCOPE_LENS
	db DREAM_EATER, CRUNCH, PSYCHIC_M, EARTHQUAKE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 4, 5, 5, 6, 6 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 50 ; Level

	db GYARADOS
	db MUSCLE_BAND
	db GIGA_IMPACT, AQUA_TAIL, RAIN_DANCE, OUTRAGE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 7, 5, 6, 5, 5 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 50 ; Level

	db ARTICUNO
	db LIFE_ORB
	db ICE_BEAM, AERIAL_ACE, WATER_PULSE, SIGNAL_BEAM
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 4, 5, 5, 6, 6 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 0 ; Happiness
	db 50 ; Level


; BattleTowerMons group 6

	db KINGDRA
	db WISE_GLASSES
	db DRAGON_PULSE, SURF, HYPER_BEAM, BLIZZARD
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db TYRANITAR
	db MUSCLE_BAND
	db CRUNCH, EARTHQUAKE, ROCK_SLIDE, GIGA_IMPACT
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db HOUNDOOM
	db LUM_BERRY
	db FLAMETHROWER, CRUNCH, DREAM_EATER, REST
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db PORYGON2
	db LEFTOVERS
	db HYPER_BEAM, RECOVER, TOXIC, THUNDERBOLT
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 13, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db MACHAMP
	db LIFE_ORB
	db FIRE_PUNCH, DRAIN_PUNCH, THUNDERPUNCH, EARTHQUAKE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db ZAPDOS
	db LIFE_ORB
	db HEAT_WAVE, AIR_SLASH, THUNDERBOLT, THUNDER_WAVE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db WOBBUFFET
	db SITRUS_BERRY
	db COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db AERODACTYL
	db LEFTOVERS
	db GIGA_IMPACT, ROCK_SLIDE, EARTHQUAKE, IRON_BASH
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db DRAGONITE
	db MUSCLE_BAND
	db GIGA_IMPACT, ICE_BEAM, THUNDERBOLT, OUTRAGE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db UMBREON
	db SITRUS_BERRY
	db MUD_SLAP, HEALINGLIGHT, PSYCHIC_M, FEINT_ATTACK
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db ARCANINE
	db CHARCOAL
	db FLAMETHROWER, CRUNCH, EXTREMESPEED, IRON_TAIL
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db SKARMORY
	db LUM_BERRY
	db STEEL_WING, FLY, TOXIC, PROTECT
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db BLISSEY
	db LEFTOVERS
	db FRESH_SNACK, TOXIC, PROTECT, PSYCHIC_M
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 12, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db SNORLAX
	db LEFTOVERS
	db ROCK_SLIDE, SURF, BODY_SLAM, EARTHQUAKE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 10, 15, 12, 12 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db HERACROSS
	db FOCUS_BAND
	db REVERSAL, MEGAHORN, EARTHQUAKE, COUNTER
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 15, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db JYNX
	db LUM_BERRY
	db BLIZZARD, PSYCHIC_M, SHADOW_BALL, DRAIN_KISS
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 15, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db BLASTOISE
	db SCOPE_LENS
	db AQUA_TAIL, IRON_BASH, RAPID_SPIN, BLIZZARD
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db RHYDON
	db QUICK_CLAW
	db EARTHQUAKE, AQUA_TAIL, IRON_TAIL, ROCK_SLIDE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 11, 15, 10, 10 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 60 ; Level

	db SANDSLASH
	db SCOPE_LENS
	db EARTHQUAKE, SLASH, POISON_JAB, NIGHT_SLASH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 7, 6, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 0 ; Happiness
	db 60 ; Level

	db PARASECT
	db LIFE_ORB
	db SPORE, GIGA_DRAIN, HEX, SLUDGE_BOMB
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 3, 6, 6, 5, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 60 ; Level

	db GOLEM
	db LIFE_ORB
	db EXPLOSION, EARTHQUAKE, FIRE_PUNCH, ROCK_TOMB
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 7, 6, 5, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 60 ; Level


; BattleTowerMons group 7

	db JOLTEON
	db LUM_BERRY
	db THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db VAPOREON
	db LEFTOVERS
	db BLIZZARD, SHADOW_BALL, SURF, MUD_SLAP
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 15, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db UMBREON
	db SITRUS_BERRY
	db FEINT_ATTACK, HEALINGLIGHT, MUD_SLAP, TOXIC
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db BLISSEY
	db SITRUS_BERRY
	db COUNTER, FRESH_SNACK, SHADOW_BALL, THUNDERBOLT
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 15, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db SNORLAX
	db LEFTOVERS
	db ROCK_SLIDE, EARTHQUAKE, ZEN_HEADBUTT, GROWTH_PUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db HOUNDOOM
	db KINGS_ROCK
	db DARK_PULSE, FLAMETHROWER, SHADOW_BALL, NASTY_PLOT
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 12, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db TYRANITAR
	db LEFTOVERS
	db EARTHQUAKE, CRUNCH, STONE_EDGE, GIGA_IMPACT
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 11, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db ZAPDOS
	db LIFE_ORB
	db THUNDERBOLT, AIR_SLASH, THUNDER_WAVE, HYPER_BEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 11, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db EXEGGUTOR
	db LUM_BERRY
	db REST, EXPLOSION, PSYCHIC_M, GIGA_DRAIN
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db UMBREON
	db SITRUS_BERRY
	db HEALINGLIGHT, FEINT_ATTACK, PSYCHIC_M, SHADOW_BALL
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db GYARADOS
	db MUSCLE_BAND
	db AQUA_TAIL, CRUNCH, GIGA_IMPACT, BULLDOZE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 11, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db QUAGSIRE
	db LUM_BERRY
	db EARTHQUAKE, SURF, SLUDGE_BOMB, IRON_TAIL
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 13, 14, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db URSARING
	db SCOPE_LENS
	db SLASH, EARTHQUAKE, HYPER_BEAM, THUNDERPUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db MR__MIME
	db KINGS_ROCK
	db REFLECT, FIRE_PUNCH, PSYCHIC_M, ENCORE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 11, 13, 15, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db PRIMEAPE
	db QUICK_CLAW
	db CROSS_CHOP, ICE_PUNCH, THUNDERPUNCH, ROCK_SLIDE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db GIRAFARIG
	db SITRUS_BERRY
	db AGILITY, BATON_PASS, CRUNCH, EARTHQUAKE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db HITMONLEE
	db FOCUS_BAND
	db REVERSAL, ENDURE, BODY_SLAM, MEGA_KICK
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db HERACROSS
	db BRIGHTPOWDER
	db REVERSAL, ENDURE, MEGAHORN, EARTHQUAKE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 7, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 70 ; Level

	db VENUSAUR
	db BRIGHTPOWDER
	db SUNNY_DAY, SOLARBEAM, HEALINGLIGHT, HYPER_BEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 7, 6, 4, 4, 4 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 70 ; Level

	db CHARIZARD
	db SCOPE_LENS
	db SLASH, EARTHQUAKE, HYPER_BEAM, FLAMETHROWER
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 5, 6, 4, 4, 4 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 0 ; Happiness
	db 70 ; Level

	db BLASTOISE
	db QUICK_CLAW
	db HYDRO_PUMP, ICE_PUNCH, HYPER_BEAM, IRON_TAIL
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 7, 6, 6, 4, 4 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 0 ; Happiness
	db 70 ; Level


; BattleTowerMons group 8

	db JOLTEON
	db LUM_BERRY
	db THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db SNORLAX
	db LEFTOVERS
	db ZEN_HEADBUTT, BELLY_DRUM, GROWTH_PUNCH, EARTHQUAKE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 11, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db HOUNDOOM
	db CHESTO_BERRY
	db REST, CRUNCH, FLAMETHROWER, SUNNY_DAY
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 13, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db TAUROS
	db LIFE_ORB
	db EARTHQUAKE, BODY_SLAM, IRON_TAIL, HYPER_BEAM
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db LAPRAS
	db CHESTO_BERRY
	db REST, SURF, CONFUSE_RAY, PSYCHIC_M
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 15, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db TYRANITAR
	db LUM_BERRY
	db REST, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 15, 13, 11, 11 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db GENGAR
	db SITRUS_BERRY
	db THUNDERBOLT, SHADOW_BALL, CONFUSE_RAY, THIEF
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 13, 14, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db FORRETRESS
	db LEFTOVERS
	db IRON_BASH, TOXIC, EARTHQUAKE, SWAGGER
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db KINGDRA
	db CHESTO_BERRY
	db REST, SURF, BLIZZARD, DRAGON_PULSE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db DRAGONITE
	db SITRUS_BERRY
	db THUNDER_WAVE, AQUA_TAIL, THUNDERBOLT, OUTRAGE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db PORYGON2
	db LIFE_ORB
	db THUNDERBOLT, RECOVER, HYPER_BEAM, TRI_ATTACK
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 15, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db JYNX
	db QUICK_CLAW
	db SING, BLIZZARD, DREAM_EATER, PSYCHIC_M
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 15, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db MANTINE
	db SITRUS_BERRY
	db SURF, CONFUSE_RAY, BLIZZARD, WING_ATTACK
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 13, 12, 12 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db SKARMORY
	db QUICK_CLAW
	db STEEL_WING, FLY, MUD_SLAP, TOXIC
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db MOLTRES
	db LIFE_ORB
	db FLAMETHROWER, HURRICANE, STEEL_WING, HYPER_BEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db AERODACTYL
	db LUM_BERRY
	db HYPER_BEAM, REST, EARTHQUAKE, STONE_EDGE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 15, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db ELECTRODE
	db KINGS_ROCK
	db THUNDERBOLT, EXPLOSION, MIRROR_COAT, TOXIC
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 15, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db DUGTRIO
	db SITRUS_BERRY
	db SLASH, EARTHQUAKE, THIEF, MUD_SLAP
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 13, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 80 ; Level

	db VICTREEBEL
	db QUICK_CLAW
	db GIGA_DRAIN, SLUDGE_BOMB, HYPER_BEAM, TOXIC
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 5, 6, 5, 6, 5, 5 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 80 ; Level

	db PINSIR
	db LIFE_ORB
    db GIGA_IMPACT, X_SCISSOR, STRENGTH, TOXIC
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 7, 4, 6, 4, 4 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 80 ; Level

	db GRANBULL
	db BRIGHTPOWDER
	db DRAIN_PUNCH, SHADOW_BALL, GIGA_IMPACT, THUNDERPUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 7, 6, 5, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 80 ; Level


; BattleTowerMons group 9

	db UMBREON
	db LEFTOVERS
	db NIGHT_SLASH, MUD_SLAP, IRON_TAIL, CONFUSE_RAY
	db 252, 0, 0, 0, 6, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CAREFUL, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db DRAGONITE
	db LIFE_ORB
	db FIRE_PUNCH, GIGA_IMPACT, OUTRAGE, STEEL_WING
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db STARMIE
	db LEFTOVERS
	db ICE_BEAM, THUNDERBOLT, SURF, PSYCHIC_M
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 15, 13, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db CLOYSTER
	db LEFTOVERS
	db ICICLE_CRASH, POISON_JAB, SURF, BODY_SLAM
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 13, 11, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db CROBAT
	db SITRUS_BERRY
	db SLUDGE_BOMB, ACROBATICS, CONFUSE_RAY, X_SCISSOR
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 12, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db PORYGON2
	db QUICK_CLAW
	db TOXIC, THUNDERBOLT, RECOVER, HYPER_BEAM
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db KINGDRA
	db LEFTOVERS
	db DRAGON_PULSE, SURF, HYPER_BEAM, BLIZZARD
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db TYRANITAR
	db QUICK_CLAW
	db GIGA_IMPACT, CRUNCH, EARTHQUAKE, STONE_EDGE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db LAPRAS
	db CHESTO_BERRY
	db REST, SURF, THUNDERBOLT, ICE_BEAM
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db ESPEON
	db LIFE_ORB
	db PSYCHIC_M, SHADOW_BALL, DRAIN_KISS, CALM_MIND
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db MACHAMP
	db LIFE_ORB
	db CROSS_CHOP, DRAIN_PUNCH, STONE_EDGE, EARTHQUAKE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db SNORLAX
	db LIFE_ORB
	db REST, SNORE, ZEN_HEADBUTT, BODY_SLAM
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 15, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db ARCANINE
	db CHESTO_BERRY
	db SUNNY_DAY, FLAMETHROWER, EXTREMESPEED, REST
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db BLISSEY
	db LEFTOVERS
	db SOLARBEAM, SUNNY_DAY, FRESH_SNACK, FIRE_BLAST
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 11, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db HOUNDOOM
	db BRIGHTPOWDER
	db FLAMETHROWER, DARK_PULSE, SUNNY_DAY, SOLARBEAM
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 11, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db SKARMORY
	db QUICK_CLAW
	db SANDSTORM, STEEL_WING, TOXIC, RETURN
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 14, 15, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 255 ; Happiness
	db 90 ; Level

	db SHUCKLE
	db LEFTOVERS
	db TOXIC, WRAP, PROTECT, ENCORE
	db 252, 0, 252, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db IMPISH, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db FLAREON
	db CHESTO_BERRY
	db FLAME_CHARGE, BODY_SLAM, MUD_SLAP, DOUBLE_TEAM
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 15, 15, 7, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 90 ; Level

	db MILTANK
	db LEFTOVERS
	db FRESH_SNACK, EARTHQUAKE, ATTRACT, BODY_SLAM
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 7, 4, 7, 5, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 90 ; Level

	db TAUROS
	db LIFE_ORB
	db MEGAHORN, GIGA_IMPACT, OUTRAGE, EARTHQUAKE
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 6, 5, 7, 6, 6 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 0 ; Happiness
	db 90 ; Level

	db MUK
	db QUICK_CLAW
	db TOXIC, GUNK_SHOT, DRAIN_PUNCH, FEINT_ATTACK
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 5, 4, 4, 4, 4 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 90 ; Level


; BattleTowerMons group 10

	db HOUNDOOM
	db CHESTO_BERRY
	db DARK_PULSE, FLAMETHROWER, NASTY_PLOT, REST
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 13, 13 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db MACHAMP
	db LIFE_ORB
	db DRAIN_PUNCH, EARTHQUAKE, STONE_EDGE, THIEF
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db KINGDRA
	db CHOICE_SPECS
	db SCALD, DRAGON_PULSE, ICE_BEAM, SLUDGE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 15, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db JOLTEON
	db LUM_BERRY
	db THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, MUD_SLAP
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db TAUROS
	db LIFE_ORB
	db GIGA_IMPACT, EARTHQUAKE, IRON_TAIL, ZEN_HEADBUTT
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db ARCANINE
	db LEFTOVERS
	db FLAME_CHARGE, EXTREMESPEED, IRON_TAIL, PLAY_ROUGH
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 13, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db CHARIZARD
	db SCOPE_LENS
	db FIRE_BLAST, HURRICANE, ANCIENTPOWER, DRAGON_PULSE
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 13, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db ELECTRODE
	db BRIGHTPOWDER
	db THUNDER_WAVE, THUNDERBOLT, EXPLOSION, MIRROR_COAT
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db RHYDON
	db MUSCLE_BAND
	db AQUA_TAIL, EARTHQUAKE, GIGA_IMPACT, STONE_EDGE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db STEELIX
	db LEFTOVERS
	db EARTHQUAKE, GIGA_IMPACT, IRON_BASH, STONE_EDGE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 13, 13, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db FARFETCH_D
	db LEEK
	db AERIAL_ACE, SLASH, POISON_JAB, NIGHT_SLASH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 12, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db MISDREAVUS
	db FOCUS_BAND
	db DRAIN_KISS, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	db 6, 0, 0, 252, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 11, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db TIMID, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db SNEASEL
	db MUSCLE_BAND
	db NIGHT_SLASH, ICICLE_CRASH, X_SCISSOR, POISON_JAB
	db 6, 252, 0, 252, 0, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 13, 14, 15, 15 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db JOLLY, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db SCIZOR
	db QUICK_CLAW
	db IRON_BASH, X_SCISSOR, SLASH, TOXIC
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 15, 11, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db BLISSEY
	db LEFTOVERS
	db THUNDERBOLT, BLIZZARD, FIRE_BLAST, FRESH_SNACK
	db 252, 6, 0, 0, 0, 252 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 14, 13, 13, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db CALM, GENDER_MASK ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db PILOSWINE
	db MUSCLE_BAND
	db STONE_EDGE, ICICLE_CRASH, GIGA_IMPACT, EARTHQUAKE
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 15, 14, 15, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db EXEGGUTOR
	db WISE_GLASSES
	db PSYCHIC_M, TOXIC, SLUDGE_BOMB, GIGA_DRAIN
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 10, 15, 14, 15, 14, 14 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db OMASTAR
	db LEFTOVERS
	db SURF, ANCIENTPOWER, BLIZZARD, TOXIC
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 13, 15, 11, 14, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, MALE ; nature/gender
	db 100 ; Happiness
	db 100 ; Level

	db GOLEM
	db MUSCLE_BAND
	db GROWTH_PUNCH, EARTHQUAKE, STONE_EDGE, FIRE_PUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 8, 7, 4, 4, 6, 6 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 100 ; Level

	db HITMONCHAN
	db MUSCLE_BAND
	db DRAIN_PUNCH, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH
	db 252, 252, 0, 0, 6, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 6, 6, 7, 7, 6, 6 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db ADAMANT, MALE ; nature/gender
	db 0 ; Happiness
	db 100 ; Level

	db LANTURN
	db SCOPE_LENS
	db HYDRO_PUMP, RAIN_DANCE, ZAP_CANNON, SIGNAL_BEAM
	db 252, 6, 0, 0, 252, 0 ; EVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	dn 11, 7, 6, 5, 7, 7 ; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def
	db MODEST, GENDER_MASK ; nature/gender
	db 0 ; Happiness
	db 100 ; Level

	assert_table_length 10 * BATTLETOWER_NUM_UNIQUE_MON
