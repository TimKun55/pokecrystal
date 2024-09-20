SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evolution_moves.asm"
INCLUDE "data/pokemon/evos_attacks_pointers.asm"
EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, MUD_SLAP
	db 19, RAZOR_LEAF
	db 21, SWEET_SCENT
	db 25, TAKE_DOWN
	db 28, GROWTH
	db 31, ENERGY_BALL
	db 34, ANCIENTPOWER
	db 37, HEALINGLIGHT
	db 41, SOLARBEAM
	db 45, SLUDGE_BOMB
	db 48, GIGA_DRAIN
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, MUD_SLAP
	db 21, RAZOR_LEAF
	db 24, SWEET_SCENT
	db 27, TAKE_DOWN
	db 30, GROWTH
	db 33, ENERGY_BALL
	db 37, ANCIENTPOWER
	db 41, HEALINGLIGHT
	db 45, SOLARBEAM
	db 49, SLUDGE_BOMB
	db 53, GIGA_DRAIN
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, MUD_SLAP
	db 21, RAZOR_LEAF
	db 24, SWEET_SCENT
	db 27, TAKE_DOWN
	db 30, GROWTH
	db 35, ENERGY_BALL
	db 40, ANCIENTPOWER
	db 44, HEALINGLIGHT
	db 49, SOLARBEAM
	db 53, SLUDGE_BOMB
	db 57, GIGA_DRAIN
	db 62, GUNK_SHOT
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, SMOKESCREEN
	db 15, METAL_CLAW
	db 18, RAGE
	db 22, FIRE_SPIN
	db 25, SCARY_FACE
	db 28, FLAME_CHARGE
	db 34, SLASH
	db 37, FLAMETHROWER
	db 43, DRAGON_PULSE
	db 49, CRUNCH
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, SMOKESCREEN
	db 15, METAL_CLAW
	db 19, RAGE
	db 24, FIRE_SPIN
	db 28, SCARY_FACE
	db 32, FLAME_CHARGE
	db 39, SLASH
	db 43, FLAMETHROWER
	db 50, DRAGON_PULSE
	db 54, CRUNCH
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, DRAGONBREATH
	db 1, OUTRAGE
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, SMOKESCREEN
	db 15, METAL_CLAW
	db 19, RAGE
	db 24, FIRE_SPIN
	db 28, SCARY_FACE
	db 32, FLAME_CHARGE
	db 35, WING_ATTACK
	db 41, SLASH
	db 47, FLAMETHROWER
	db 53, DRAGON_PULSE
	db 58, CRUNCH
	db 62, HEAT_WAVE
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, WATER_GUN
	db 10, HARDEN
	db 13, AQUA_JET
	db 16, BITE
	db 19, RAPID_SPIN
	db 22, PROTECT
	db 25, WATER_PULSE
	db 28, BUBBLEBEAM
	db 34, SLAM
	db 37, SCALD
	db 43, RAIN_DANCE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, HARDEN
	db 13, AQUA_JET
	db 16, BITE
	db 20, RAPID_SPIN
	db 24, PROTECT
	db 28, WATER_PULSE
	db 32, BUBBLEBEAM
	db 39, SLAM
	db 43, SCALD
	db 50, RAIN_DANCE
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, WATER_GUN
	db 10, HARDEN
	db 13, AQUA_JET
	db 16, BITE
	db 20, RAPID_SPIN
	db 24, PROTECT
	db 28, WATER_PULSE
	db 32, BUBBLEBEAM
	db 35, FLASH_CANNON
	db 41, SLAM
	db 47, SCALD
	db 53, RAIN_DANCE
	db 58, HYDRO_PUMP
	db 62, IRON_BASH
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 9, BUG_BITE
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, TACKLE
	db 1, STRING_SHOT
	db 11, BUG_BITE
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT	
	db 1, GUST
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 18, SUPERSONIC
	db 21, PSYBEAM
	db 24, SIGNAL_BEAM
	db 27, SAFEGUARD
	db 30, HYPNOSIS
	db 33, SILVER_WIND
	db 36, AIR_SLASH
	db 39, HEALINGLIGHT
	db 42, BUG_BUZZ
	db 45, PSYCHIC_M
	db 48, HURRICANE
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 9, BUG_BITE
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 11, BUG_BITE
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, FURY_STRIKES
	db 11, FURY_CUTTER
	db 14, FOCUS_ENERGY
	db 17, RAGE
	db 20, PURSUIT
	db 23, PIN_MISSILE
	db 26, SLUDGE
	db 29, AGILITY
	db 32, FEINT_ATTACK
	db 35, X_SCISSOR
	db 37, BUG_BUZZ
	db 40, AIR_SLASH
	db 43, SWORDS_DANCE
	db 46, POISON_JAB
	db 49, OUTRAGE
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SAND_ATTACK
	db 8, GUST
	db 12, QUICK_ATTACK
	db 16, TWISTER
	db 20, AERIAL_ACE
	db 24, SWIFT
	db 28, AGILITY
	db 32, WING_ATTACK
	db 36, STEEL_WING
	db 40, MIRROR_MOVE
	db 44, AIR_SLASH
	db 48, HURRICANE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SAND_ATTACK
	db 8, GUST
	db 12, QUICK_ATTACK
	db 16, TWISTER
	db 23, AERIAL_ACE
	db 27, SWIFT
	db 31, AGILITY
	db 37, WING_ATTACK
	db 42, STEEL_WING
	db 45, MIRROR_MOVE
	db 50, AIR_SLASH
	db 55, HURRICANE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SAND_ATTACK
	db 8, GUST
	db 12, QUICK_ATTACK
	db 16, TWISTER
	db 23, AERIAL_ACE
	db 27, SWIFT
	db 31, AGILITY
	db 40, WING_ATTACK
	db 44, STEEL_WING
	db 49, MIRROR_MOVE
	db 54, AIR_SLASH
	db 58, HEAT_WAVE
	db 62, HURRICANE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 4, QUICK_ATTACK
	db 7, FOCUS_ENERGY
	db 10, BITE
	db 13, PURSUIT
	db 16, HYPER_FANG
	db 21, CRUNCH
	db 25, FEINT_ATTACK
	db 28, SUPER_FANG
	db 31, TAKE_DOWN
	db 34, COUNTER
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 4, QUICK_ATTACK
	db 7, FOCUS_ENERGY
	db 10, BITE
	db 13, PURSUIT
	db 16, HYPER_FANG
	db 19, SCARY_FACE
	db 24, CRUNCH
	db 29, FEINT_ATTACK
	db 34, SUPER_FANG
	db 39, TAKE_DOWN
	db 44, COUNTER
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 4, LEER
	db 8, PURSUIT
	db 11, FURY_STRIKES
	db 15, AERIAL_ACE
	db 18, MIRROR_MOVE
	db 22, TAKE_DOWN
	db 25, AGILITY
	db 29, WING_ATTACK
	db 31, FOCUS_ENERGY
	db 37, DRILL_PECK
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 4, LEER
	db 8, PURSUIT
	db 11, FURY_STRIKES
	db 15, AERIAL_ACE
	db 18, MIRROR_MOVE
	db 24, TAKE_DOWN
	db 28, AGILITY
	db 32, WING_ATTACK
	db 36, FOCUS_ENERGY
	db 41, DRILL_PECK
	db 46, HURRICANE
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 4, POISON_STING
	db 8, BITE
	db 11, SCREECH
	db 14, PURSUIT
	db 17, ACID
	db 20, GLARE
	db 24, SLUDGE
	db 28, THIEF
	db 32, SLAM
	db 36, SLUDGE_BOMB
	db 40, HAZE
	db 44, GUNK_SHOT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 4, POISON_STING
	db 8, BITE
	db 11, SCREECH
	db 14, PURSUIT
	db 17, ACID
	db 21, CRUNCH
	db 25, GLARE
	db 29, SLUDGE
	db 31, THIEF
	db 35, SLAM
	db 40, SLUDGE_BOMB
	db 44, HAZE
	db 48, GUNK_SHOT
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db EVOLVE_ITEM, SUN_STONE, RAICHU_A
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 5, CHARM
	db 7, THUNDER_WAVE
	db 10, QUICK_ATTACK
	db 14, DOUBLE_KICK
	db 18, DOUBLE_TEAM
	db 21, SLAM
	db 24, SPARK
	db 28, IRON_TAIL
	db 32, EXTREMESPEED
	db 36, THUNDERBOLT
	db 40, SLAM
	db 44, AGILITY
	db 48, LIGHT_SCREEN
	db 52, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 4, POISON_STING
	db 7, SAND_ATTACK
	db 10, RAPID_SPIN
	db 13, PIN_MISSILE
	db 15, MAGNITUDE
	db 18, FURY_STRIKES
	db 23, SWIFT
	db 27, SAND_TOMB
	db 30, METAL_CLAW
	db 34, DIG
	db 37, SLASH
	db 41, SANDSTORM
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 4, POISON_STING
	db 7, SAND_ATTACK
	db 10, RAPID_SPIN
	db 13, PIN_MISSILE
	db 15, MAGNITUDE
	db 18, FURY_STRIKES
	db 25, SWIFT
	db 30, SAND_TOMB
	db 34, METAL_CLAW
	db 38, DIG
	db 42, SLASH
	db 47, SANDSTORM
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 5, LEER
	db 9, SCRATCH
	db 12, POISON_STING
	db 15, DOUBLE_KICK
	db 21, FURY_STRIKES
	db 25, BITE
	db 29, CHARM
	db 32, CRUNCH
	db 37, POISON_JAB
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 5, LEER
	db 9, SCRATCH
	db 12, POISON_STING
	db 15, DOUBLE_KICK
	db 23, FURY_STRIKES
	db 27, BITE
	db 33, CHARM
	db 37, CRUNCH
	db 42, POISON_JAB
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCRATCH
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 23, SAND_TOMB
	db 28, BODY_SLAM
	db 33, MAGNITUDE
	db 37, CRUNCH
	db 44, STRENGTH
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 5, PECK
	db 9, FOCUS_ENERGY
	db 12, POISON_STING
	db 15, DOUBLE_KICK
	db 21, FURY_STRIKES
	db 25, HORN_ATTACK
	db 29, CHARM
	db 32, HEADBUTT
	db 37, POISON_JAB
	db 41, MEGAHORN
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 5, PECK
	db 9, FOCUS_ENERGY
	db 12, POISON_STING
	db 15, DOUBLE_KICK
	db 23, FURY_STRIKES
	db 28, HORN_ATTACK
	db 33, CHARM
	db 37, HEADBUTT
	db 42, POISON_JAB
	db 48, MEGAHORN
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HORN_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 23, SAND_TOMB
	db 28, THRASH
	db 33, MAGNITUDE
	db 37, CRUNCH
	db 44, MEGAHORN
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, CHARM
	db 1, DISARM_VOICE
	db 4, ENCORE
	db 8, SING
	db 11, DOUBLESLAP
	db 14, DEFENSE_CURL
	db 17, DRAIN_KISS
	db 20, MINIMIZE
	db 23, DIZZY_PUNCH
	db 26, REFLECT
	db 29, DAZZLINGLEAM
	db 33, METRONOME
	db 37, BODY_SLAM
	db 40, HEALINGLIGHT
	db 44, BELLY_DRUM
	db 48, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 1, DISARM_VOICE
	db 1, METRONOME
	db 1, HEALINGLIGHT
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAIL_WHIP
	db 4, DISABLE
	db 9, QUICK_ATTACK
	db 12, CONFUSE_RAY
	db 16, FIRE_SPIN
	db 19, WILL_O_WISP
	db 23, HEX
	db 26, FLAME_WHEEL
	db 30, SAFEGUARD
	db 34, PSYBEAM
	db 38, DARK_PULSE
	db 42, SHADOW_BALL
	db 45, FLAMETHROWER
	db 49, OMINOUS_WIND
	db 53, FIRE_BLAST
	db 57, HEALINGLIGHT
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, WILL_O_WISP
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, HEX
	db 50, FLAMETHROWER
	db 54, OMINOUS_WIND
	db 58, FIRE_BLAST
	db 62, HEALINGLIGHT
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 3, DEFENSE_CURL
	db 6, TACKLE
	db 9, DISARM_VOICE
	db 12, DISABLE
	db 15, ROLLOUT
	db 19, DRAIN_KISS
	db 23, DOUBLESLAP
	db 27, DAZZLINGLEAM
	db 30, REST
	db 34, BODY_SLAM
	db 39, MOONBLAST
	db 45, TAKE_DOWN
	db 49, PLAY_ROUGH
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, MOONBLAST	
	db 1, SING
	db 1, DISARM_VOICE
	db 1, ROLLOUT
	db 1, DOUBLESLAP
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 4, SUPERSONIC
	db 8, GUST
	db 12, BITE
	db 16, SLUDGE
	db 20, CONFUSE_RAY
	db 24, WING_ATTACK
	db 28, MEAN_LOOK
	db 32, AIR_SLASH
	db 36, ACROBATICS
	db 40, HAZE
	db 44, SLUDGE_BOMB
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 4, SUPERSONIC
	db 8, GUST
	db 12, BITE
	db 16, SLUDGE
	db 20, CONFUSE_RAY
	db 26, WING_ATTACK
	db 31, MEAN_LOOK
	db 37, AIR_SLASH
	db 42, ACROBATICS
	db 48, HAZE
	db 52, SLUDGE_BOMB
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 5, ACID
	db 9, SWEET_SCENT
	db 14, MEGA_DRAIN
	db 16, POISONPOWDER
	db 18, STUN_SPORE
	db 20, SLEEP_POWDER
	db 23, SLUDGE
	db 27, GIGA_DRAIN
	db 32, HEALINGLIGHT
	db 39, ENERGY_BALL
	db 45, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 5, ACID
	db 9, SWEET_SCENT
	db 14, MEGA_DRAIN
	db 16, POISONPOWDER
	db 18, STUN_SPORE
	db 20, SLEEP_POWDER
	db 26, SLUDGE
	db 31, GIGA_DRAIN
	db 35, HEALINGLIGHT
	db 44, ENERGY_BALL
	db 50, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, SLEEP_POWDER
	db 1, SLUDGE
	db 1, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, ABSORB
	db 5, LEECH_LIFE
	db 8, STUN_SPORE
	db 12, BUG_BITE
	db 15, MEGA_DRAIN
	db 19, POISONPOWDER
	db 25, SPORE
	db 28, SLASH
	db 31, GROWTH
	db 34, GIGA_DRAIN
	db 37, PAIN_SPLIT
	db 40, ENERGY_BALL
	db 44, X_SCISSOR
	db 48, HEALINGLIGHT
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, ABSORB
	db 5, LEECH_LIFE
	db 8, STUN_SPORE
	db 12, BUG_BITE
	db 15, MEGA_DRAIN
	db 19, POISONPOWDER
	db 23, FURY_CUTTER
	db 28, SPORE
	db 32, SLASH
	db 35, CURSE
	db 38, GIGA_DRAIN
	db 41, PAIN_SPLIT
	db 44, HEX
	db 48, ENERGY_BALL
	db 51, SHADOW_BALL
	db 54, X_SCISSOR
	db 58, HEALINGLIGHT
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 5, SUPERSONIC
	db 10, CONFUSION
	db 14, LEECH_LIFE
	db 17, POISONPOWDER
	db 20, BUG_BITE
	db 23, PSYBEAM
	db 26, STUN_SPORE
	db 29, SLEEP_POWDER
	db 33, SIGNAL_BEAM
	db 36, ZEN_HEADBUTT
	db 41, BUG_BUZZ
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, SILVER_WIND
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 5, SUPERSONIC
	db 10, CONFUSION
	db 14, LEECH_LIFE
	db 17, POISONPOWDER
	db 20, BUG_BITE
	db 23, PSYBEAM
	db 26, STUN_SPORE
	db 29, SLEEP_POWDER
	db 30, GUST
	db 35, SIGNAL_BEAM
	db 40, ZEN_HEADBUTT
	db 45, BUG_BUZZ
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 5, GROWL
	db 9, MAGNITUDE
	db 14, PURSUIT
	db 17, BULLDOZE
	db 20, ANCIENTPOWER
	db 24, SAND_TOMB
	db 27, METAL_CLAW
	db 31, DIG
	db 35, SLASH
	db 39, NIGHT_SLASH
	db 43, EARTHQUAKE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 5, GROWL
	db 9, MAGNITUDE
	db 14, PURSUIT
	db 17, BULLDOZE
	db 20, ANCIENTPOWER
	db 24, SAND_TOMB
	db 25, TRI_ATTACK
	db 30, METAL_CLAW
	db 35, DIG
	db 41, SLASH
	db 47, NIGHT_SLASH
	db 53, EARTHQUAKE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 6, BITE
	db 9, FURY_STRIKES	
	db 12, SCREECH
	db 15, PURSUIT
	db 18, BULK_UP
	db 21, PAY_DAY
	db 25, SLASH
	db 30, NASTY_PLOT
	db 34, CHARM
	db 38, SLAM
	db 42, PLAY_ROUGH
	db 48, NIGHT_SLASH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 6, BITE
	db 9, FURY_STRIKES	
	db 12, SCREECH
	db 15, PURSUIT
	db 18, BULK_UP
	db 21, PAY_DAY
	db 25, SLASH
	db 27, SWIFT
	db 32, NASTY_PLOT
	db 36, CHARM
	db 42, SLAM
	db 48, PLAY_ROUGH
	db 52, NIGHT_SLASH
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, WATER_GUN
	db 8, CONFUSION
	db 11, FURY_STRIKES
	db 14, DISABLE
	db 17, WATER_PULSE
	db 20, SCREECH
	db 23, ZEN_HEADBUTT
	db 26, RAIN_DANCE
	db 32, SLASH
	db 38, NASTY_PLOT
	db 42, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, WATER_GUN
	db 8, CONFUSION
	db 11, FURY_STRIKES
	db 14, DISABLE
	db 17, WATER_PULSE
	db 20, SCREECH
	db 23, ZEN_HEADBUTT
	db 26, AQUA_JET
	db 32, SLASH
	db 35, PSYBEAM
	db 40, NASTY_PLOT
	db 45, AMNESIA
	db 48, HYDRO_PUMP
	db 52, PSYCHIC_M
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LOW_KICK
	db 5, FURY_STRIKES
	db 10, KARATE_CHOP
	db 14, PURSUIT
	db 18, SEISMIC_TOSS
	db 22, SWAGGER
	db 25, CROSS_CHOP
	db 30, REVERSAL
	db 33, FEINT_ATTACK
	db 36, THRASH
	db 40, SCREECH
	db 44, OUTRAGE
	db 48, MEGA_PUNCH
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LOW_KICK
	db 5, FURY_STRIKES
	db 10, KARATE_CHOP
	db 14, PURSUIT
	db 18, SEISMIC_TOSS
	db 22, SWAGGER
	db 25, CROSS_CHOP
	db 27, RAGE
	db 31, REVERSAL
	db 35, FEINT_ATTACK
	db 39, THRASH
	db 44, SCREECH
	db 48, OUTRAGE
	db 53, MEGA_PUNCH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, GROWL
	db 1, BITE
	db 6, EMBER
	db 9, LEER
	db 12, BULK_UP
	db 15, FIRE_SPIN
	db 17, SAFEGUARD
	db 20, REVERSAL
	db 23, DOUBLE_KICK
	db 26, FLAME_WHEEL
	db 29, AGILITY
	db 32, FLAME_CHARGE
	db 35, THRASH
	db 37, FLAMETHROWER
	db 40, CRUNCH
	db 43, OUTRAGE
	db 46, PLAY_ROUGH
	db 49, HEAT_WAVE
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAKE_DOWN
	db 1, FLAME_WHEEL
	db 1, PLAY_ROUGH
	db 1, EXTREMESPEED
	db 1, FLAME_CHARGE
	db 50, FLAMETHROWER
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, SWEET_KISS
	db 1, TACKLE
	db 1, WATER_GUN
	db 5, HYPNOSIS
	db 8, DOUBLESLAP
	db 12, AQUA_JET
	db 15, MUD_SLAP
	db 19, BUBBLEBEAM
	db 24, RAIN_DANCE
	db 28, BODY_SLAM
	db 32, BELLY_DRUM
	db 36, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_HELD_LEVEL, KINGS_ROCK, 35, POLITOED
	db 0 ; no more evolutions
	db 1, SWEET_KISS
	db 1, TACKLE
	db 1, WATER_GUN
	db 5, HYPNOSIS
	db 8, DOUBLESLAP
	db 12, AQUA_JET
	db 15, MUD_SLAP
	db 19, BUBBLEBEAM
	db 24, RAIN_DANCE
	db 29, MEGA_PUNCH
	db 35, BODY_SLAM
	db 40, BELLY_DRUM
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULK_UP
	db 1, AQUA_JET
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, KARATE_CHOP
	db 30, MACH_PUNCH
	db 35, GROWTH_PUNCH
	db 40, VITAL_THROW
	db 45, CROSS_CHOP
	db 50, LOCK_ON
	db 55, DYNAMICPUNCH
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 40, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, REFLECT
	db 26, ZEN_HEADBUTT
	db 29, LIGHT_SCREEN
	db 32, RECOVER
	db 35, BARRIER
	db 38, BATON_PASS
	db 41, CONFUSE_RAY
	db 44, PSYCHIC_M
	db 47, FUTURE_SIGHT
	db 0 ; no more level-up moves	
	
AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, REFLECT
	db 26, ZEN_HEADBUTT
	db 29, LIGHT_SCREEN
	db 32, RECOVER
	db 35, BARRIER
	db 38, BATON_PASS
	db 45, CONFUSE_RAY
	db 51, PSYCHIC_M
	db 57, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, KARATE_CHOP
	db 10, FOCUS_ENERGY
	db 13, SEISMIC_TOSS
	db 16, MACH_PUNCH
	db 19, FORESIGHT
	db 23, BULK_UP
	db 26, REVERSAL
	db 31, VITAL_THROW
	db 35, SCARY_FACE
	db 39, DRAIN_PUNCH
	db 43, CROSS_CHOP
	db 47, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 40, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, KARATE_CHOP
	db 10, FOCUS_ENERGY
	db 13, SEISMIC_TOSS
	db 16, MACH_PUNCH
	db 19, FORESIGHT
	db 23, BULK_UP
	db 26, REVERSAL
	db 34, VITAL_THROW
	db 39, SCARY_FACE 
	db 43, DRAIN_PUNCH 
	db 47, MEGA_PUNCH
	db 52, CROSS_CHOP
	db 58, DYNAMICPUNCH
	db 0 ; no more level-up moves	

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, KARATE_CHOP
	db 10, FOCUS_ENERGY
	db 13, SEISMIC_TOSS
	db 16, MACH_PUNCH
	db 19, FORESIGHT
	db 23, BULK_UP
	db 26, REVERSAL
	db 34, VITAL_THROW
	db 39, SCARY_FACE 
	db 45, DRAIN_PUNCH 
	db 49, MEGA_PUNCH
	db 55, CROSS_CHOP
	db 61, DYNAMICPUNCH
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 14, SLEEP_POWDER
	db 16, POISONPOWDER
	db 18, STUN_SPORE
	db 22, ACID
	db 25, RAZOR_LEAF
	db 29, SWEET_SCENT
	db 32, ENERGY_BALL
	db 36, HEALINGLIGHT
	db 40, SLAM
	db 44, POISON_JAB
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 14, SLEEP_POWDER
	db 16, POISONPOWDER
	db 18, STUN_SPORE
	db 23, ACID
	db 27, RAZOR_LEAF
	db 32, SWEET_SCENT
	db 38, ENERGY_BALL
	db 42, HEALINGLIGHT
	db 46, SLAM
	db 50, POISON_JAB
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEALINGLIGHT
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 5, SUPERSONIC
	db 9, WATER_GUN
	db 13, CONSTRICT
	db 17, ACID
	db 20, WRAP
	db 23, HEX
	db 26, BUBBLEBEAM
	db 29, SLUDGE
	db 32, BARRIER
	db 35, WATER_PULSE
	db 39, SCREECH
	db 43, POISON_JAB
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 5, SUPERSONIC
	db 9, WATER_GUN
	db 13, CONSTRICT
	db 17, ACID
	db 20, WRAP
	db 23, HEX
	db 26, BUBBLEBEAM
	db 29, SLUDGE
	db 35, BARRIER
	db 39, WATER_PULSE
	db 43, SCREECH
	db 49, POISON_JAB
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 4, MUD_SLAP
	db 7, RAPID_SPIN
	db 10, ROLLOUT
	db 14, MAGNITUDE
	db 17, ROCK_THROW
	db 20, BULLDOZE
	db 23, ROCK_BLAST
	db 27, ANCIENTPOWER
	db 30, SANDSTORM
	db 35, ROCK_SLIDE
	db 38, EARTHQUAKE
	db 41, EXPLOSION
	db 45, STONE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 40, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 4, MUD_SLAP
	db 7, RAPID_SPIN
	db 10, ROLLOUT
	db 14, MAGNITUDE
	db 17, ROCK_THROW
	db 20, BULLDOZE
	db 23, ROCK_BLAST
	db 28, ANCIENTPOWER
	db 32, SANDSTORM
	db 37, ROCK_SLIDE
	db 41, EARTHQUAKE
	db 46, EXPLOSION
	db 50, STONE_EDGE
	db 0 ; no more level-up moves	

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 4, MUD_SLAP
	db 7, RAPID_SPIN
	db 10, ROLLOUT
	db 14, MAGNITUDE
	db 17, ROCK_THROW
	db 20, BULLDOZE
	db 23, ROCK_BLAST
	db 28, ANCIENTPOWER
	db 32, SANDSTORM
	db 37, ROCK_SLIDE
	db 44, EARTHQUAKE
	db 50, EXPLOSION
	db 56, STONE_EDGE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, TAIL_WHIP
	db 9, EMBER
	db 13, LOW_KICK
	db 17, FIRE_SPIN
	db 21, DOUBLE_KICK
	db 25, STOMP
	db 29, TAKE_DOWN
	db 32, FLAME_CHARGE
	db 35, HI_JUMP_KICK
	db 38, AGILITY
	db 41, FLAMETHROWER
	db 45, EXTREMESPEED
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_JAB
	db 1, TACKLE
	db 1, GROWL
	db 4, TAIL_WHIP
	db 9, EMBER
	db 13, LOW_KICK
	db 17, FIRE_SPIN
	db 21, DOUBLE_KICK
	db 25, STOMP
	db 29, TAKE_DOWN
	db 32, FLAME_CHARGE
	db 35, HI_JUMP_KICK
	db 38, AGILITY
	db 39, MEGAHORN
	db 43, FURY_STRIKES
	db 47, FLAMETHROWER
	db 51, EXTREMESPEED
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 32, SLOWBRO
	db EVOLVE_HELD_LEVEL, KINGS_ROCK, 32, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 4, GROWL
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, DISABLE
	db 16, HEADBUTT
	db 20, WATER_PULSE
	db 24, PSYBEAM
	db 28, ZEN_HEADBUTT
	db 31, AMNESIA
	db 37, SURF
	db 41, RAIN_DANCE
	db 48, PSYCHIC_M
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 4, GROWL
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, DISABLE
	db 16, HEADBUTT
	db 20, WATER_PULSE
	db 24, PSYBEAM
	db 28, ZEN_HEADBUTT
	db 31, AMNESIA
	db 36, HARDEN
	db 43, SURF
	db 47, RAIN_DANCE
	db 54, PSYCHIC_M
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, SUPERSONIC
	db 1, TACKLE
	db 5, THUNDERSHOCK
	db 8, THUNDER_WAVE
	db 11, FLASH
	db 14, LIGHT_SCREEN
	db 17, SONICBOOM
	db 20, SPARK
	db 24, SWIFT
	db 27, SCREECH
	db 31, CHARGE_BEAM
	db 34, AGILITY
	db 37, THUNDERBOLT
	db 40, LOCK_ON
	db 43, IRON_BASH
	db 46, ZAP_CANNON
	db 49, FLASH_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, MAGNEZONE
	db 0 ; no more evolutions
	db 1, SUPERSONIC
	db 1, TACKLE
	db 5, THUNDERSHOCK
	db 8, THUNDER_WAVE
	db 11, FLASH
	db 14, LIGHT_SCREEN
	db 17, SONICBOOM
	db 20, SPARK
	db 24, SWIFT
	db 27, SCREECH
	db 29, TRI_ATTACK
	db 34, CHARGE_BEAM
	db 37, AGILITY
	db 41, THUNDERBOLT
	db 44, LOCK_ON
	db 47, IRON_BASH
	db 51, ZAP_CANNON
	db 55, FLASH_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_JAB
	db 1, BATON_PASS
	db 1, PECK
	db 1, MUD_SLAP
	db 1, LEER
	db 5, FURY_STRIKES
	db 10, AERIAL_ACE
	db 15, RAZOR_LEAF
	db 20, WING_ATTACK
	db 25, SWORDS_DANCE
	db 30, AGILITY
	db 34, SLASH
	db 38, NIGHT_SLASH
	db 42, AIR_SLASH
	db 46, FALSE_SWIPE
	db 50, ACROBATICS
	db 54, HURRICANE
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 6, QUICK_ATTACK
	db 8, RAGE
	db 11, FURY_STRIKES
	db 15, PURSUIT
	db 19, BATON_PASS
	db 22, DOUBLE_KICK
	db 26, AGILITY
	db 29, DOUBLE_TEAM
	db 33, SWORDS_DANCE
	db 40, THRASH
	db 43, DRILL_PECK
	db 47, REVERSAL
	db 50, HI_JUMP_KICK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULLDOZE
	db 1, PECK
	db 1, GROWL
	db 6, QUICK_ATTACK
	db 8, RAGE
	db 11, FURY_STRIKES
	db 15, PURSUIT
	db 19, BATON_PASS
	db 22, DOUBLE_KICK
	db 26, AGILITY
	db 29, DOUBLE_TEAM
	db 30, TRI_ATTACK
	db 36, SWORDS_DANCE
	db 43, LOW_KICK
	db 47, DRILL_PECK
	db 52, REVERSAL
	db 56, HI_JUMP_KICK
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 3, GROWL
	db 7, WATER_GUN
	db 11, ICY_WIND
	db 16, RAIN_DANCE
	db 20, AQUA_JET
	db 24, AURORA_BEAM
	db 27, REST
	db 31, BUBBLEBEAM
	db 36, TAKE_DOWN
	db 40, ICE_BEAM
	db 43, SAFEGUARD
	db 46, HAIL
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, SIGNAL_BEAM
	db 1, HEADBUTT
	db 3, GROWL
	db 7, WATER_GUN
	db 11, ICY_WIND
	db 16, RAIN_DANCE
	db 20, AQUA_JET
	db 24, AURORA_BEAM
	db 27, REST
	db 31, BUBBLEBEAM
	db 33, ICICLE_SPEAR
	db 38, TAKE_DOWN
	db 45, ICE_BEAM
	db 49, SAFEGUARD
	db 52, HAIL
	db 56, WATERFALL
	db 60, MEGAHORN
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SMOG
	db 4, HARDEN
	db 8, MUD_SLAP
	db 11, DISABLE
	db 15, PURSUIT
	db 18, SLUDGE
	db 21, MINIMIZE
	db 24, TOXIC
	db 27, FEINT_ATTACK
	db 30, SCREECH
	db 33, SLUDGE_BOMB
	db 36, THIEF
	db 39, ACID_ARMOR
	db 42, GUNK_SHOT
	db 45, DARK_PULSE
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SMOG
	db 4, HARDEN
	db 8, MUD_SLAP
	db 11, DISABLE
	db 15, PURSUIT
	db 18, SLUDGE
	db 21, MINIMIZE
	db 24, TOXIC
	db 27, FEINT_ATTACK
	db 30, SCREECH
	db 33, SLUDGE_BOMB
	db 36, THIEF
	db 42, ACID_ARMOR
	db 50, GUNK_SHOT
	db 58, DARK_PULSE
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 5, WATER_GUN
	db 8, SUPERSONIC
	db 13, ICICLE_SPEAR
	db 17, PROTECT
	db 20, LEER
	db 28, BUBBLEBEAM
	db 32, AURORA_BEAM
	db 38, WHIRLPOOL
	db 43, BARRIER
	db 48, ICE_BEAM
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYDRO_PUMP
	db 1, HARDEN
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 28, ICICLE_SPEAR
	db 32, SPIKES
	db 40, ICICLE_CRASH
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 7, SPITE
	db 10, SMOG
	db 13, MEAN_LOOK
	db 16, CURSE
	db 20, NIGHT_SHADE
	db 24, CONFUSE_RAY
	db 28, SLUDGE
	db 32, DARK_PULSE
	db 36, DREAM_EATER
	db 39, DESTINY_BOND
	db 42, HEX
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 7, SPITE
	db 10, SMOG
	db 13, MEAN_LOOK
	db 16, CURSE
	db 20, NIGHT_SHADE
	db 24, CONFUSE_RAY
	db 29, SLUDGE
	db 34, DARK_PULSE
	db 39, DREAM_EATER
	db 43, DESTINY_BOND
	db 47, HEX
	db 52, SLUDGE_BOMB
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 7, SPITE
	db 10, SMOG
	db 13, MEAN_LOOK
	db 16, CURSE
	db 20, NIGHT_SHADE
	db 24, CONFUSE_RAY
	db 29, SLUDGE
	db 34, DARK_PULSE
	db 39, DREAM_EATER
	db 45, DESTINY_BOND
	db 50, HEX
	db 55, SLUDGE_BOMB
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_HELD_LEVEL, METAL_COAT, 34, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 5, WRAP
	db 8, HARDEN
	db 11, ROCK_THROW
	db 14, MAGNITUDE
	db 17, RAGE
	db 20, SAND_TOMB
	db 24, ROCK_TOMB
	db 27, BULLDOZE
	db 32, SANDSTORM
	db 36, ROCK_SLIDE
	db 40, SLAM
	db 44, DRAGONBREATH
	db 48, STONE_EDGE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HYPNOSIS
	db 4, DISABLE
	db 7, CONFUSION
	db 10, PURSUIT
	db 13, HEADBUTT
	db 16, SMOG
	db 19, THIEF
	db 21, PSYBEAM
	db 24, BARRIER
	db 28, FEINT_ATTACK
	db 33, ZEN_HEADBUTT
	db 36, BELLY_DRUM
	db 39, DREAM_EATER
	db 42, PSYCHIC_M
	db 45, NASTY_PLOT
	db 48, FUTURE_SIGHT
	db 51, DARK_PULSE
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HYPNOSIS
	db 4, DISABLE
	db 7, CONFUSION
	db 10, PURSUIT
	db 13, HEADBUTT
	db 16, SMOG
	db 19, THIEF
	db 21, PSYBEAM
	db 24, BARRIER
	db 28, FEINT_ATTACK
	db 36, ZEN_HEADBUTT
	db 40, BELLY_DRUM
	db 44, DREAM_EATER
	db 48, PSYCHIC_M
	db 52, NASTY_PLOT
	db 56, FUTURE_SIGHT
	db 60, DARK_PULSE
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, AQUA_JET
	db 1, LEER
	db 4, SCRATCH
	db 10, HARDEN
	db 14, METAL_CLAW
	db 18, MUD_SLAP
	db 24, BUBBLEBEAM
	db 27, STOMP
	db 31, PROTECT
	db 34, SLAM
	db 41, WATERFALL
	db 48, X_SCISSOR
	db 53, REVERSAL
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, AQUA_JET
	db 1, LEER
	db 4, SCRATCH
	db 10, HARDEN
	db 14, METAL_CLAW
	db 18, MUD_SLAP
	db 24, BUBBLEBEAM
	db 27, STOMP
	db 34, PROTECT
	db 38, SLAM
	db 45, WATERFALL
	db 52, X_SCISSOR
	db 58, REVERSAL
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, THUNDERSHOCK
	db 9, SCREECH
	db 14, SONICBOOM
	db 19, CHARGE_BEAM
	db 23, ROLLOUT
	db 27, SPARK
	db 30, LIGHT_SCREEN
	db 33, THUNDERBOLT
	db 37, SWIFT
	db 41, EXPLOSION
	db 44, MIRROR_COAT
	db 49, THUNDER
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, THUNDERSHOCK
	db 9, SCREECH
	db 14, SONICBOOM
	db 19, CHARGE_BEAM
	db 23, ROLLOUT
	db 27, SPARK
	db 30, LIGHT_SCREEN
	db 34, THUNDERBOLT
	db 40, SWIFT
	db 45, EXPLOSION
	db 50, MIRROR_COAT
	db 55, THUNDER
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, ABSORB
	db 1, HYPNOSIS
	db 6, REFLECT
	db 11, LEECH_SEED
	db 16, CONFUSION
	db 19, STUN_SPORE
	db 21, POISONPOWDER
	db 23, SLEEP_POWDER
	db 26, MEGA_DRAIN
	db 30, PSYBEAM
	db 33, ANCIENTPOWER
	db 37, HEALINGLIGHT
	db 40, ENERGY_BALL
	db 43, PSYCHIC_M
	db 47, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, ABSORB
	db 1, HYPNOSIS
	db 1, CONFUSION
	db 1, STOMP
	db 33, ZEN_HEADBUTT
	db 37, DRAGONBREATH
	db 43, ENERGY_BALL
	db 47, PSYCHIC_M
	db 53, DRAGON_PULSE
	db 57, PETAL_DANCE
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, MUD_SLAP
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, FOCUS_ENERGY
	db 13, HEADBUTT
	db 17, MAGNITUDE
	db 21, BULLDOZE
	db 25, RAGE
	db 29, BONE_CLUB
	db 33, FALSE_SWIPE
	db 37, THRASH
	db 41, EARTHQUAKE
	db 46, TAKE_DOWN
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, MUD_SLAP
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, FOCUS_ENERGY
	db 13, HEADBUTT
	db 17, MAGNITUDE
	db 21, BULLDOZE
	db 25, RAGE
	db 32, BONE_CLUB
	db 36, FALSE_SWIPE
	db 41, THRASH
	db 46, EARTHQUAKE
	db 52, TAKE_DOWN
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 1, BULK_UP
	db 1, PURSUIT
	db 1, LOW_KICK
	db 19, DOUBLE_KICK
	db 23, BULK_UP
	db 26, LOCK_ON
	db 29, FOCUS_ENERGY
	db 32, MEGA_KICK
	db 35, FORESIGHT
	db 38, LOW_KICK
	db 43, ENDURE
	db 46, HI_JUMP_KICK
	db 49, REVERSAL
	db 53, FOCUS_BLAST
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH_PUNCH
	db 1, BULK_UP
	db 1, PURSUIT
	db 19, GROWTH_PUNCH
	db 23, BULK_UP
	db 26, MACH_PUNCH
	db 29, THUNDERPUNCH
	db 32, ICE_PUNCH
	db 35, FIRE_PUNCH
	db 37, PURSUIT
	db 43, MEGA_PUNCH
	db 46, PROTECT
	db 49, DRAIN_PUNCH
	db 53, FOCUS_BLAST
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LICK
	db 1, DEFENSE_CURL
	db 7, ROLLOUT
	db 12, SUPERSONIC
	db 15, WRAP	
	db 19, DISABLE
	db 23, HEADBUTT
	db 27, SCREECH
	db 30, STOMP
	db 33, ZEN_HEADBUTT
	db 37, SLAM
	db 42, BELLY_DRUM
    db 46, BODY_SLAM
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SMOG
	db 7, SMOKESCREEN
	db 12, THIEF
	db 17, WILL_O_WISP
	db 21, SLUDGE
	db 25, HAZE
	db 30, SLUDGE_BOMB
	db 36, DESTINY_BOND
	db 41, EXPLOSION
	db 45, GUNK_SHOT
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SMOG
	db 7, SMOKESCREEN
	db 12, THIEF
	db 17, WILL_O_WISP
	db 21, SLUDGE
	db 25, HAZE
	db 30, SLUDGE_BOMB
	db 38, DESTINY_BOND
	db 44, EXPLOSION
	db 51, GUNK_SHOT
	db 57, HEAT_WAVE
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, HORN_ATTACK
	db 10, ROCK_THROW
	db 14, MAGNITUDE
	db 18, FURY_STRIKES
	db 22, STOMP
	db 26, SCARY_FACE
	db 30, BULLDOZE
	db 34, ROCK_BLAST
	db 38, TAKE_DOWN
	db 44, STONE_EDGE
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 6, HORN_ATTACK
	db 10, ROCK_THROW
	db 14, MAGNITUDE
	db 18, FURY_STRIKES
	db 22, STOMP
	db 26, SCARY_FACE
	db 30, BULLDOZE
	db 34, ROCK_BLAST
	db 38, TAKE_DOWN
	db 48, STONE_EDGE
	db 54, EARTHQUAKE
	db 58, MEGAHORN
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, DISARM_VOICE
	db 13, FRESH_SNACK
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 29, SING
	db 34, BODY_SLAM
	db 38, DAZZLINGLEAM
	db 43, DEFENSE_CURL
	db 49, LIGHT_SCREEN
	db 57, GIGA_IMPACT
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 4, SLEEP_POWDER
	db 7, ABSORB
	db 10, WRAP
	db 13, POISONPOWDER
	db 15, VINE_WHIP
	db 18, GROWTH
	db 21, MEGA_DRAIN
	db 24, STUN_SPORE
	db 27, HEALINGLIGHT
	db 31, SLAM
	db 35, GIGA_DRAIN
	db 40, ANCIENTPOWER
	db 45, BODY_SLAM
	db 50, ENERGY_BALL
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, DIZZY_PUNCH
	db 1, LEER
	db 7, LOW_KICK
	db 11, BITE
	db 15, HEADBUTT
	db 19, DOUBLE_KICK
	db 23, RAGE
	db 27, TAKE_DOWN
	db 31, MACH_PUNCH
	db 35, ENDURE
	db 38, CRUNCH
	db 42, OUTRAGE
	db 46, MEGA_PUNCH
	db 50, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 4, SMOKESCREEN
	db 7, LEER
	db 10, AQUA_JET
	db 14, TWISTER
	db 18, FOCUS_ENERGY
	db 22, BUBBLEBEAM
	db 26, DRAGONBREATH
	db 30, WATER_PULSE
	db 34, AGILITY
	db 38, RAIN_DANCE
	db 42, HYDRO_PUMP
	db 48, DRAGON_PULSE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_HELD_LEVEL, DRAGON_SCALE, 42, KINGDRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 4, SMOKESCREEN
	db 7, LEER
	db 10, AQUA_JET
	db 14, TWISTER
	db 18, FOCUS_ENERGY
	db 22, BUBBLEBEAM
	db 26, DRAGONBREATH
	db 30, WATER_PULSE
	db 36, AGILITY
	db 40, RAIN_DANCE
	db 45, HYDRO_PUMP
	db 51, DRAGON_PULSE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 5, SUPERSONIC
	db 10, WATER_GUN
	db 15, HORN_ATTACK
	db 20, REVERSAL
	db 25, WATER_PULSE
	db 29, FURY_STRIKES
	db 38, WATERFALL
	db 43, BODY_SLAM
	db 48, MEGAHORN
	db 52, AGILITY
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 5, SUPERSONIC
	db 10, WATER_GUN
	db 15, HORN_ATTACK
	db 20, REVERSAL
	db 25, WATER_PULSE
	db 29, FURY_STRIKES
	db 41, WATERFALL
	db 49, BODY_SLAM
	db 54, MEGAHORN
	db 61, AGILITY
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 12, RAPID_SPIN
	db 15, SWIFT
	db 18, BUBBLEBEAM
	db 21, CONFUSE_RAY
	db 24, RECOVER
	db 27, MINIMIZE
	db 30, REFLECT
	db 34, DAZZLINGLEAM
	db 37, LIGHT_SCREEN
	db 41, PSYCHIC_M
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, PSYBEAM
	db 1, BUBBLEBEAM
	db 44, LIGHT_SCREEN
	db 50, TRI_ATTACK
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, CONFUSION
	db 10, DISARM_VOICE
	db 14, SUBSTITUTE
	db 18, DOUBLESLAP
	db 21, LIGHT_SCREEN
	db 21, REFLECT
	db 24, DRAIN_KISS
	db 27, ENCORE
	db 30, PSYBEAM
	db 33, DAZZLINGLEAM
	db 37, ZEN_HEADBUTT
	db 41, BATON_PASS
	db 45, SAFEGUARD
	db 49, MOONBLAST
	db 53, PSYCHIC_M
	db 0 ; no more level-up moves
	
ScytherEvosAttacks:
	db EVOLVE_HELD_LEVEL, METAL_COAT, 34, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 5, FOCUS_ENERGY
	db 9, PURSUIT
	db 12, FALSE_SWIPE
	db 16, WING_ATTACK
	db 20, AGILITY
	db 24, BUG_BITE
	db 28, AERIAL_ACE
	db 32, SLASH
	db 36, NIGHT_SLASH
	db 40, SWORDS_DANCE
	db 44, DOUBLE_TEAM
	db 48, AIR_SLASH
	db 52, X_SCISSOR
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, PETAL_DANCE
	db 1, TACKLE
	db 1, LICK
	db 1, CONFUSION
	db 6, SING
	db 9, SCREECH
	db 13, POWDER_SNOW
	db 16, DOUBLESLAP
	db 19, ICY_WIND
	db 22, METRONOME
	db 25, DRAIN_KISS
	db 28, ICE_PUNCH
	db 31, MEAN_LOOK
	db 34, PSYBEAM
	db 38, BODY_SLAM
	db 42, HAIL
	db 46, NASTY_PLOT
	db 50, PSYCHIC_M
	db 54, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, THUNDERSHOCK
	db 6, DOUBLE_KICK
	db 9, THUNDER_WAVE		
	db 12, LOW_KICK
	db 15, SWIFT
	db 18, MACH_PUNCH
	db 21, SPARK
	db 24, GROWTH_PUNCH
	db 27, LIGHT_SCREEN
	db 30, THUNDERPUNCH
	db 33, VITAL_THROW
	db 36, CHARGE_BEAM
	db 39, SCREECH
	db 42, CROSS_CHOP
	db 45, THUNDERBOLT
	db 48, FOCUS_BLAST
	db 51, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 6, SMOG
	db 9, SMOKESCREEN
	db 12, ACID
	db 15, PURSUIT
	db 18, FIRE_SPIN
	db 21, SLUDGE
	db 24, FLAME_WHEEL
	db 27, CONFUSE_RAY
	db 30, FIRE_PUNCH
	db 33, FEINT_ATTACK
	db 36, POISON_JAB 
	db 39, FLAME_CHARGE
	db 42, SUNNY_DAY
	db 45, FLAMETHROWER
	db 48, GUNK_SHOT
	db 51, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, FOCUS_ENERGY
	db 1, TACKLE
	db 4, WRAP
	db 8, BUG_BITE
	db 12, SEISMIC_TOSS
	db 15, HARDEN
	db 18, RAGE
	db 21, ROCK_THROW
	db 24, VITAL_THROW
	db 28, X_SCISSOR
	db 33, FEINT_ATTACK
	db 38, FOCUS_BLAST
	db 44, MEGAHORN
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, RAGE
	db 10, HORN_ATTACK
	db 13, SCARY_FACE
	db 17, PURSUIT
	db 20, QUICK_ATTACK
	db 24, REST
	db 28, FOCUS_ENERGY
	db 33, SWAGGER
	db 38, ZEN_HEADBUTT
	db 41, THRASH
	db 45, TAKE_DOWN
	db 50, MEGAHORN
	db 54, GIGA_IMPACT
	db 58, OUTRAGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 10, TACKLE
	db 30, REVERSAL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATERFALL
	db 1, THRASH
	db 1, BITE
	db 22, LEER
	db 25, WATER_PULSE
	db 27, DRAGON_RAGE
	db 30, GUST
	db 33, TWISTER
	db 36, SCARY_FACE
	db 39, RAIN_DANCE
	db 42, CRUNCH
	db 46, DRAGON_PULSE
	db 49, HYPER_BEAM
	db 52, HYDRO_PUMP
	db 55, HURRICANE
	db 58, OUTRAGE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 4, BITE
	db 8, MIST
	db 12, ICY_WIND
	db 16, BODY_SLAM
	db 20, CONFUSE_RAY
	db 24, WATER_PULSE
	db 28, FUTURE_SIGHT
	db 32, ICE_BEAM
	db 36, RAIN_DANCE
	db 40, SAFEGUARD
	db 44, HYDRO_PUMP
	db 48, DRAGON_PULSE
	db 52, BLIZZARD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_ITEM, SUN_STONE, ESPEON
	db EVOLVE_ITEM, MOON_STONE, UMBREON
	db EVOLVE_HAPPINESS, TR_ANYTIME, SYLVEON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 4, SAND_ATTACK
	db 7, DOUBLE_KICK
	db 10, SWIFT
	db 13, QUICK_ATTACK
	db 16, MUD_SLAP
	db 20, BITE
	db 23, CHARM
	db 27, BODY_SLAM
	db 31, SLAM
	db 34, BATON_PASS
	db 38, TAKE_DOWN
	db 42, REVERSAL
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 4, SAND_ATTACK
	db 7, DOUBLE_KICK
	db 10, SWIFT
	db 13, QUICK_ATTACK
	db 16, WATER_GUN
	db 20, AURORA_BEAM
	db 25, RECOVER
	db 30, WATER_PULSE
	db 36, HAZE
	db 42, BUBBLEBEAM
	db 47, ACID_ARMOR
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 4, SAND_ATTACK
	db 7, DOUBLE_KICK
	db 10, SWIFT
	db 13, QUICK_ATTACK
	db 16, THUNDERSHOCK
	db 20, LIGHT_SCREEN
	db 25, PIN_MISSILE
	db 30, CHARGE_BEAM
	db 36, AGILITY
	db 42, THUNDER_WAVE
	db 47, THUNDERBOLT
	db 52, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 4, SAND_ATTACK
	db 7, DOUBLE_KICK
	db 10, SWIFT
	db 13, QUICK_ATTACK
	db 16, EMBER
	db 20, FIRE_SPIN
	db 25, BITE
	db 30, FLAME_CHARGE
	db 36, SMOG
	db 42, FLAMETHROWER
	db 47, SLAM
	db 52, FIRE_BLAST
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_HELD_LEVEL, UP_GRADE, 40, PORYGON2
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, CONVERSION
	db 1, TACKLE
	db 6, THUNDERSHOCK
	db 10, CONFUSION
	db 14, AGILITY
	db 17, RECOVER
	db 21, PSYBEAM
	db 25, SIGNAL_BEAM
	db 28, BARRIER
	db 31, CHARGE_BEAM
	db 35, AURORA_BEAM
	db 38, THUNDERBOLT
	db 41, TRI_ATTACK
	db 45, LOCK_ON
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 4, WATER_GUN
	db 8, MUD_SLAP
	db 12, LEER
	db 16, ROCK_THROW
	db 20, BITE
	db 24, BUBBLEBEAM
	db 28, ROCK_BLAST
	db 32, ROLLOUT
	db 36, PROTECT 
	db 41, ANCIENTPOWER
	db 45, HYDRO_PUMP
	db 49, STONE_EDGE
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 4, WATER_GUN
	db 8, MUD_SLAP
	db 12, LEER
	db 16, ROCK_THROW
	db 20, BITE
	db 24, BUBBLEBEAM
	db 28, ROCK_BLAST
	db 32, ROLLOUT
	db 36, ICICLE_SPEAR 
	db 39, PROTECT
	db 45, ANCIENTPOWER
	db 49, HYDRO_PUMP
	db 53, STONE_EDGE
	db 57, CRUNCH
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 4, ABSORB
	db 8, MUD_SLAP
	db 12, LEER
	db 16, ROCK_THROW
	db 20, ENDURE
	db 24, METAL_CLAW
	db 28, ROCK_BLAST
	db 32, AQUA_JET
	db 36, MEGA_DRAIN
	db 41, SCREECH
	db 45, ANCIENTPOWER
	db 49, GIGA_DRAIN
	db 53, STONE_EDGE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 4, ABSORB
	db 8, MUD_SLAP
	db 12, LEER
	db 16, ROCK_THROW
	db 20, ENDURE
	db 24, METAL_CLAW
	db 28, ROCK_BLAST
	db 32, AQUA_JET
	db 36, MEGA_DRAIN
	db 39, SLASH
	db 45, SCREECH
	db 49, ANCIENTPOWER
	db 53, GIGA_DRAIN
	db 57, STONE_EDGE
	db 61, NIGHT_SLASH
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRAGONBREATH
	db 1, DRAGON_RAGE
	db 5, AGILITY
	db 10, BITE
	db 15, ROCK_THROW
	db 20, SUPERSONIC
	db 25, WING_ATTACK
	db 30, ROCK_SLIDE
	db 36, SCARY_FACE
	db 42, TAKE_DOWN
	db 48, ANCIENTPOWER 
	db 54, IRON_BASH
	db 59, HYPER_BEAM
	db 64, STONE_EDGE
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, DEFENSE_CURL
	db 8, AMNESIA
	db 12, LICK
	db 17, RAGE
	db 21, TAKE_DOWN
	db 25, ROLLOUT
	db 29, HEADBUTT
	db 32, REST
	db 34, SNORE
	db 37, BODY_SLAM
	db 41, BELLY_DRUM
	db 46, ZEN_HEADBUTT
	db 50, OUTRAGE
	db 57, CRUNCH
	db 62, GIGA_IMPACT
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 9, MIST
	db 14, SAFEGUARD
	db 19, AERIAL_ACE
	db 24, ICY_WIND
	db 29, AGILITY
	db 34, LOCK_ON
	db 39, AURORA_BEAM
	db 44, WING_ATTACK
	db 49, ICICLE_SPEAR
	db 54, AIR_SLASH
	db 59, ICE_BEAM
	db 64, REFLECT
	db 69, ACROBATICS
	db 74, BLIZZARD
	db 79, HAIL
	db 90, AEROBLAST
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 9, THUNDER_WAVE
	db 14, SAFEGUARD
	db 19, AERIAL_ACE
	db 24, SPARK
	db 29, AGILITY
	db 34, PROTECT
	db 39, CHARGE_BEAM
	db 44, WING_ATTACK
	db 49, DRILL_PECK
	db 54, AIR_SLASH
	db 59, THUNDERBOLT
	db 64, LIGHT_SCREEN
	db 69, ACROBATICS
	db 74, THUNDER
	db 79, RAIN_DANCE
	db 90, AEROBLAST
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, EMBER
	db 9, WILL_O_WISP
	db 14, SAFEGUARD
	db 19, AERIAL_ACE
	db 24, FIRE_SPIN
	db 29, AGILITY
	db 34, ENDURE
	db 39, FLAME_WHEEL
	db 44, WING_ATTACK
	db 49, HEAT_WAVE
	db 54, AIR_SLASH
	db 59, FLAMETHROWER
	db 64, NASTY_PLOT
	db 69, ACROBATICS
	db 74, FIRE_BLAST
	db 79, SUNNY_DAY
	db 90, AEROBLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 7, THUNDER_WAVE
	db 12, TWISTER
	db 16, AQUA_JET
	db 21, DRAGON_RAGE
	db 26, SLAM
	db 31, AGILITY
	db 37, SAFEGUARD
	db 43, DRAGON_PULSE
	db 49, HYPER_BEAM
	db 55, OUTRAGE
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 7, THUNDER_WAVE
	db 12, TWISTER
	db 16, AQUA_JET
	db 21, DRAGON_RAGE
	db 26, SLAM
	db 35, AGILITY
	db 41, SAFEGUARD
	db 47, DRAGON_PULSE
	db 53, HYPER_BEAM
	db 60, OUTRAGE
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 7, THUNDER_WAVE
	db 12, TWISTER
	db 16, AQUA_JET
	db 21, DRAGON_RAGE
	db 26, SLAM
	db 35, AGILITY
	db 41, SAFEGUARD
	db 47, DRAGON_PULSE
	db 54, AERIAL_ACE
	db 60, HYPER_BEAM
	db 65, HURRICANE
	db 70, OUTRAGE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, DISABLE
	db 11, BARRIER
	db 22, SWIFT
	db 33, CALM_MIND
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, AMNESIA
	db 88, RECOVER
	db 99, SAFEGUARD
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, CONFUSION
	db 10, TRANSFORM
	db 20, MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, ANCIENTPOWER
	db 60, FUTURE_SIGHT
	db 70, NASTY_PLOT
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 12, HEALINGLIGHT
	db 15, SLEEP_POWDER
	db 17, REFLECT
	db 20, DISARM_VOICE
	db 24, ENERGY_BALL
	db 28, ANCIENTPOWER
	db 31, LIGHT_SCREEN
	db 34, BODY_SLAM
	db 39, SAFEGUARD
	db 42, GIGA_DRAIN
	db 45, OUTRAGE
	db 48, SOLARBEAM
	db 51, MOONBLAST
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 12, HEALINGLIGHT
	db 15, SLEEP_POWDER
	db 18, REFLECT
	db 22, DISARM_VOICE
	db 26, ENERGY_BALL
	db 30, ANCIENTPOWER
	db 36, LIGHT_SCREEN
	db 40, BODY_SLAM
	db 43, SAFEGUARD
	db 47, GIGA_DRAIN
	db 51, OUTRAGE
	db 55, SOLARBEAM
	db 59, MOONBLAST
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, RAZOR_LEAF
	db 9, POISONPOWDER
	db 12, HEALINGLIGHT
	db 15, SLEEP_POWDER
	db 18, REFLECT
	db 22, DISARM_VOICE
	db 26, ENERGY_BALL
	db 30, ANCIENTPOWER
	db 31, DRAGONBREATH
	db 37, LIGHT_SCREEN
	db 43, BODY_SLAM
	db 45, SAFEGUARD
	db 49, GIGA_DRAIN
	db 53, OUTRAGE
	db 57, SOLARBEAM
	db 62, MOONBLAST
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, EMBER
	db 10, SMOKESCREEN
	db 13, QUICK_ATTACK
	db 16, DEFENSE_CURL
	db 19, FLAME_WHEEL
	db 23, SWIFT
	db 27, FLAME_CHARGE
	db 31, DIG
	db 37, REVERSAL
	db 40, FLAMETHROWER
	db 46, ROLLOUT
	db 49, TAKE_DOWN
	db 55, EARTHQUAKE
	db 58, FIRE_BLAST
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, EMBER
	db 10, SMOKESCREEN
	db 13, QUICK_ATTACK
	db 18, DEFENSE_CURL
	db 22, FLAME_WHEEL
	db 26, SWIFT
	db 30, FLAME_CHARGE
	db 34, DIG
	db 38, REVERSAL
	db 42, FLAMETHROWER
	db 46, ROLLOUT
	db 50, TAKE_DOWN
	db 54, EARTHQUAKE
	db 59, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, EMBER
	db 10, SMOKESCREEN
	db 13, QUICK_ATTACK
	db 18, DEFENSE_CURL
	db 22, FLAME_WHEEL
	db 26, SWIFT
	db 30, FLAME_CHARGE
	db 34, DIG
	db 35, SHADOW_BALL
	db 40, REVERSAL
	db 47, FLAMETHROWER
	db 51, ROLLOUT
	db 54, TAKE_DOWN
	db 58, EARTHQUAKE
	db 62, FIRE_BLAST
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 9, RAGE
	db 12, BITE
	db 15, SCARY_FACE
	db 19, METAL_CLAW
	db 22, REVERSAL
	db 25, SCALD
	db 28, CRUNCH
	db 34, ANCIENTPOWER
	db 37, SLASH
	db 41, SCREECH
	db 44, WATERFALL
	db 48, THRASH
	db 52, DRAGON_PULSE
	db 56, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 9, RAGE
	db 12, BITE
	db 15, SCARY_FACE
	db 21, METAL_CLAW
	db 24, REVERSAL
	db 27, SCALD
	db 31, CRUNCH
	db 36, ANCIENTPOWER
	db 40, SLASH
	db 44, SCREECH
	db 47, WATERFALL
	db 51, THRASH
	db 55, DRAGON_PULSE
	db 59, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, WATER_GUN
	db 9, RAGE
	db 12, BITE
	db 15, SCARY_FACE
	db 21, METAL_CLAW
	db 24, REVERSAL
	db 27, SCALD
	db 29, NIGHT_SLASH
	db 34, CRUNCH
	db 38, ANCIENTPOWER
	db 43, SLASH
	db 46, SCREECH
	db 50, WATERFALL
	db 53, THRASH
	db 58, DRAGON_PULSE
	db 62, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 10, FORESIGHT
	db 13, FURY_STRIKES
	db 16, DIZZY_PUNCH
	db 19, SUPER_FANG
	db 23, HEADBUTT
	db 26, REST
	db 30, SLAM
	db 34, AMNESIA
	db 38, SLASH
	db 42, BATON_PASS
	db 46, BODY_SLAM
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, DEFENSE_CURL
	db 7, QUICK_ATTACK
	db 10, FORESIGHT
	db 13, FURY_STRIKES
	db 17, DIZZY_PUNCH
	db 21, SUPER_FANG
	db 25, HEADBUTT
	db 28, REST
	db 33, SLAM
	db 37, AMNESIA
	db 41, SLASH
	db 46, BATON_PASS
	db 52, BODY_SLAM
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, FORESIGHT
	db 7, PECK
	db 10, HYPNOSIS
	db 13, CONFUSION
	db 16, GUST
	db 19, ZEN_HEADBUTT
	db 22, REFLECT
	db 25, TAKE_DOWN
	db 28, AIR_SLASH
	db 31, PSYCHIC_M
	db 34, WING_ATTACK
	db 38, DREAM_EATER
	db 42, MOONBLAST
	db 46, HURRICANE
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, FORESIGHT
	db 7, PECK
	db 10, HYPNOSIS
	db 13, CONFUSION
	db 16, GUST
	db 19, ZEN_HEADBUTT
	db 19, NIGHT_SHADE
	db 21, CONFUSION
	db 25, REFLECT
	db 29, TAKE_DOWN
	db 33, AIR_SLASH
	db 37, PSYCHIC_M
	db 41, WING_ATTACK
	db 44, DREAM_EATER
	db 48, OMINOUS_WIND
	db 52, MOONBLAST
	db 56, HURRICANE
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, GUST
	db 8, SUPERSONIC
	db 12, DIZZY_PUNCH
	db 15, LIGHT_SCREEN
	db 15, REFLECT
	db 15, SAFEGUARD
	db 18, MACH_PUNCH	
	db 23, BATON_PASS
	db 26, SILVER_WIND
	db 30, SWIFT
	db 34, ACROBATICS
	db 37, BUG_BUZZ
	db 42, AIR_SLASH
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, GUST
	db 8, SUPERSONIC
	db 12, DIZZY_PUNCH
	db 15, LIGHT_SCREEN
	db 15, REFLECT
	db 15, SAFEGUARD
	db 17, NASTY_PLOT
	db 18, MACH_PUNCH
	db 25, BATON_PASS
	db 28, MEGA_PUNCH
	db 32, SILVER_WIND
	db 36, SWIFT
	db 40, ACROBATICS
	db 44, BUG_BUZZ
	db 48, AIR_SLASH
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 4, SCARY_FACE
	db 7, CONSTRICT
	db 10, LEECH_LIFE
	db 13, GROWTH
	db 16, PURSUIT
	db 19, NIGHT_SHADE
	db 23, FURY_STRIKES
	db 26, BUG_BITE
	db 29, AGILITY
	db 32, FEINT_ATTACK
	db 35, POISON_JAB
	db 38, X_SCISSOR
	db 41, PSYCHIC_M
	db 44, NIGHT_SLASH
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 4, SCARY_FACE
	db 7, CONSTRICT
	db 10, LEECH_LIFE
	db 13, GROWTH
	db 16, PURSUIT
	db 19, NIGHT_SHADE
	db 21, SWORDS_DANCE
	db 25, FURY_STRIKES
	db 29, BUG_BITE
	db 32, AGILITY
	db 36, FEINT_ATTACK
	db 40, POISON_JAB
	db 45, X_SCISSOR
	db 50, PSYCHIC_M
	db 55, NIGHT_SLASH
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, X_SCISSOR
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 4, SUPERSONIC
	db 8, GUST
	db 12, BITE
	db 16, SLUDGE
	db 20, CONFUSE_RAY
	db 26, WING_ATTACK
	db 31, MEAN_LOOK
	db 37, AIR_SLASH
	db 42, ACROBATICS
	db 48, HAZE
	db 52, SLUDGE_BOMB
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, SUPERSONIC
	db 5, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 13, BUBBLEBEAM
	db 17, CONFUSE_RAY		
	db 20, SPARK
	db 23, SIGNAL_BEAM
	db 26, REVERSAL
	db 31, THUNDERBOLT
	db 34, RECOVER
	db 37, TAKE_DOWN
	db 40, HYDRO_PUMP
	db 44, LIGHT_SCREEN
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, SUPERSONIC
	db 5, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 13, BUBBLEBEAM
	db 17, CONFUSE_RAY		
	db 20, SPARK
	db 23, SIGNAL_BEAM
	db 26, REVERSAL
	db 32, THUNDERBOLT
	db 36, RECOVER
	db 40, TAKE_DOWN
	db 44, HYDRO_PUMP
	db 49, LIGHT_SCREEN
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, SUPERSONIC
	db 1, TACKLE
	db 5, THUNDERSHOCK
	db 8, THUNDER_WAVE
	db 11, FLASH
	db 14, LIGHT_SCREEN
	db 17, SONICBOOM
	db 20, SPARK
	db 24, SWIFT
	db 27, SCREECH
	db 29, TRI_ATTACK
	db 34, CHARGE_BEAM
	db 37, AGILITY
	db 41, THUNDERBOLT
	db 44, LOCK_ON
	db 47, IRON_BASH
	db 51, ZAP_CANNON
	db 55, FLASH_CANNON
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 4, WATER_GUN	
	db 8, ROLLOUT
	db 12, BUBBLEBEAM
	db 15, SAFEGUARD
	db 18, RECOVER
	db 21, CONFUSE_RAY
	db 25, ICICLE_SPEAR
	db 28, BARRIER
	db 31, ROCK_BLAST
	db 35, SURF
	db 38, MIRROR_COAT
	db 41, ANCIENTPOWER
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 5, CHARM
	db 10, DISARM_VOICE
	db 14, SWEET_KISS
	db 18, DRAIN_KISS
	db 22, METRONOME
	db 26, FRESH_SNACK
	db 31, DAZZLINGLEAM
	db 38, SAFEGUARD
	db 43, BODY_SLAM
	db 47, MOONBLAST
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, TOGEKISS
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 4, CHARM
	db 10, DISARM_VOICE
	db 14, SWEET_KISS
	db 18, DRAIN_KISS
	db 22, METRONOME
	db 26, FRESH_SNACK
	db 31, DAZZLINGLEAM
	db 38, WING_ATTACK
	db 42, BODY_SLAM
	db 47, ANCIENTPOWER
	db 54, MOONBLAST
	db 58, BATON_PASS
	db 0 ; no more level-up moves

TogekissEvosAttacks:
	db 0 ; no more evolutions
	db 1, DISARM_VOICE
	db 1, FUTURE_SIGHT
	db 1, AIR_SLASH
	db 1, EXTREMESPEED
	db 1, HURRICANE
	db 1, FRESH_SNACK
	db 1, MOONBLAST
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, PECK
	db 1, LEER
	db 6, NIGHT_SHADE
	db 10, CONFUSION
	db 14, GUST
	db 17, HYPNOSIS
	db 20, PSYBEAM
	db 23, WING_ATTACK
	db 28, FUTURE_SIGHT
	db 32, CONFUSE_RAY
	db 36, OMINOUS_WIND
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, PECK
	db 1, LEER
	db 6, NIGHT_SHADE
	db 10, CONFUSION
	db 14, GUST
	db 17, HYPNOSIS
	db 20, PSYBEAM
	db 23, WING_ATTACK
	db 24, AIR_SLASH
	db 32, FUTURE_SIGHT
	db 38, CONFUSE_RAY
	db 44, OMINOUS_WIND
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 11, MUD_SLAP
	db 14, CHARGE_BEAM
	db 17, COTTON_SPORE
	db 21, SPARK
	db 26, TAKE_DOWN
	db 30, THUNDERBOLT
	db 33, SAFEGUARD
	db 36, DAZZLINGLEAM
	db 39, LIGHT_SCREEN
	db 42, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 11, MUD_SLAP
	db 14, CHARGE_BEAM
	db 18, COTTON_SPORE
	db 23, SPARK
	db 28, TAKE_DOWN
	db 32, THUNDERBOLT
	db 36, SAFEGUARD
	db 40, DAZZLINGLEAM
	db 44, LIGHT_SCREEN
	db 48, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, THUNDER_WAVE
	db 8, THUNDERSHOCK
	db 11, MUD_SLAP
	db 14, CHARGE_BEAM
	db 18, COTTON_SPORE
	db 23, SPARK
	db 28, TAKE_DOWN
	db 29, THUNDERPUNCH
	db 35, THUNDERBOLT
	db 39, SAFEGUARD
	db 43, DRAGONBREATH
	db 47, DAZZLINGLEAM
	db 52, LIGHT_SCREEN
	db 56, THUNDER
	db 60, DRAGON_PULSE
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, SLEEP_POWDER
	db 1, MEGA_DRAIN
	db 1, ACID
	db 30, DRAIN_KISS
	db 35, GIGA_DRAIN
	db 40, DAZZLINGLEAM
	db 45, ENERGY_BALL
	db 50, MOONBLAST
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 13, ROLLOUT
	db 16, AQUA_JET
	db 19, DRAIN_KISS
	db 22, BUBBLEBEAM
	db 26, DAZZLINGLEAM
	db 30, TAKE_DOWN
	db 34, RAIN_DANCE
	db 38, PLAY_ROUGH
	db 42, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 13, ROLLOUT
	db 16, AQUA_JET
	db 20, DRAIN_KISS
	db 25, BUBBLEBEAM
	db 30, DAZZLINGLEAM
	db 36, TAKE_DOWN
	db 40, RAIN_DANCE
	db 44, PLAY_ROUGH
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUBSTITUTE
	db 1, REVERSAL
	db 6, LOW_KICK
	db 10, ROCK_THROW
	db 19, FEINT_ATTACK
	db 22, ANCIENTPOWER
	db 25, PROTECT
	db 28, ROCK_TOMB
	db 31, SAND_TOMB
	db 34, ROCK_SLIDE
	db 37, COUNTER
	db 40, SLAM
	db 43, TAKE_DOWN
	db 47, STONE_EDGE
	db 50, BODY_SLAM
	db 53, IRON_BASH
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, SING
	db 30, RAIN_DANCE
	db 35, BUBBLEBEAM
	db 40, SWAGGER
	db 45, WATER_PULSE
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, HEALINGLIGHT
	db 7, TACKLE
	db 10, GUST
	db 13, POISONPOWDER
	db 15, LEECH_SEED
	db 17, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 24, COTTON_SPORE
	db 28, ACROBATICS
	db 32, GIGA_DRAIN
	db 36, ENERGY_BALL
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, HEALINGLIGHT
	db 7, TACKLE
	db 10, GUST
	db 13, POISONPOWDER
	db 15, LEECH_SEED
	db 17, SLEEP_POWDER
	db 22, MEGA_DRAIN
	db 26, COTTON_SPORE
	db 31, ACROBATICS
	db 35, GIGA_DRAIN
	db 40, ENERGY_BALL
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, HEALINGLIGHT
	db 7, TACKLE
	db 10, GUST
	db 13, POISONPOWDER
	db 15, LEECH_SEED
	db 17, SLEEP_POWDER
	db 22, MEGA_DRAIN
	db 26, COTTON_SPORE
	db 33, ACROBATICS
	db 37, GIGA_DRAIN
	db 43, ENERGY_BALL
	db 50, HURRICANE
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 4, SAND_ATTACK
	db 8, DOUBLESLAP
	db 12, BATON_PASS
	db 19, FURY_STRIKES
	db 24, ACROBATICS
	db 27, SWIFT
	db 36, SCREECH
	db 46, AGILITY
	db 51, NASTY_PLOT
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, DEFENSE_CURL
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF
	db 19, PROTECT
	db 22, GIGA_DRAIN
	db 25, SUNNY_DAY
	db 28, HEALINGLIGHT
	db 31, SOLARBEAM
	db 34, TAKE_DOWN
	db 37, ENERGY_BALL
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, EMBER
	db 1, TACKLE
	db 1, GROWTH
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF
	db 19, PROTECT
	db 22, GIGA_DRAIN
	db 25, SUNNY_DAY
	db 28, FLAME_CHARGE
	db 31, PETAL_DANCE
	db 34, FLAMETHROWER
	db 37, SOLARBEAM
	db 40, FIRE_BLAST
	db 43, ENERGY_BALL
	db 47, HEAT_WAVE
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEECH_LIFE
	db 6, QUICK_ATTACK
	db 10, DOUBLE_TEAM
	db 14, SONICBOOM
	db 16, AERIAL_ACE
	db 20, BUG_BITE
	db 24, PROTECT
	db 28, TWISTER
	db 32, WING_ATTACK
	db 36, SILVER_WIND
	db 40, AIR_SLASH
	db 44, DRAGON_PULSE
	db 48, BUG_BUZZ
	db 52, HURRICANE
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 5, MUD_SLAP
	db 9, SCARY_FACE
	db 12, MAGNITUDE
	db 15, HEADBUTT
	db 19, RECOVER
	db 23, AMNESIA
	db 26, BULLDOZE
	db 29, RAIN_DANCE
	db 32, HYDRO_PUMP
	db 36, EARTHQUAKE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 5, MUD_SLAP
	db 9, SCARY_FACE
	db 12, MAGNITUDE
	db 15, HEADBUTT
	db 19, RECOVER
	db 25, AMNESIA
	db 28, BULLDOZE
	db 31, RAIN_DANCE
	db 35, HYDRO_PUMP
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 10, QUICK_ATTACK
	db 15, MUD_SLAP
	db 16, CONFUSION
	db 20, SWIFT
	db 25, BITE
	db 30, PSYBEAM
	db 36, HEALINGLIGHT
	db 42, CALM_MIND
	db 47, PSYCHIC_M
	db 52, FUTURE_SIGHT
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 10, QUICK_ATTACK
	db 15, MUD_SLAP
	db 16, PURSUIT
	db 20, SWIFT
	db 25, BITE
	db 30, CONFUSE_RAY
	db 36, HEALINGLIGHT
	db 42, MEAN_LOOK
	db 47, SCREECH 
	db 52, FEINT_ATTACK
	db 0 ; no more level-up moves

SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 10, QUICK_ATTACK
	db 15, MUD_SLAP
	db 16, DISARM_VOICE
	db 20, SWIFT
	db 25, DRAIN_KISS
	db 30, CHARM
	db 36, FRESH_SNACK
	db 42, DAZZLINGLEAM
	db 47, LIGHT_SCREEN 
	db 52, MOONBLAST
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 4, GROWL
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, DISABLE
	db 16, HEADBUTT
	db 20, WATER_PULSE
	db 24, PSYBEAM
	db 28, ZEN_HEADBUTT
	db 31, AMNESIA
	db 36, HARDEN
	db 41, SURF
	db 45, SWAGGER
	db 49, RAIN_DANCE
	db 54, PSYCHIC_M
	db 59, NASTY_PLOT
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, LEER
	db 7, HORN_ATTACK
	db 10, HYPNOSIS
	db 13, STOMP
	db 16, SAND_ATTACK
	db 19, CONFUSION
	db 21, TAKE_DOWN
	db 24, CONFUSE_RAY
	db 27, NASTY_PLOT
	db 31, PSYBEAM
	db 35, BODY_SLAM
	db 40, ZEN_HEADBUTT
	db 45, PSYCHIC_M
	db 50, MEGAHORN
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 1, OMINOUS_WIND
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, CONFUSION
	db 10, PURSUIT
	db 14, STOMP
	db 17, PSYBEAM
	db 22, AGILITY
	db 28, BATON_PASS
	db 32, ZEN_HEADBUTT
	db 36, DAZZLINGLEAM
	db 40, CRUNCH
	db 46, PSYCHIC_M
	db 51, NASTY_PLOT
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 25, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 6, FOCUS_ENERGY
	db 9, BUG_BITE
	db 12, SUBSTITUTE
	db 17, RAPID_SPIN
	db 20, DEFENSE_CURL
	db 25, SPIKES
	db 31, TAKE_DOWN
	db 36, EARTHQUAKE
	db 40, BUG_BUZZ
	db 46, EXPLOSION
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, TACKLE
	db 1, PROTECT
	db 6, FOCUS_ENERGY
	db 9, BUG_BITE
	db 12, SUBSTITUTE
	db 17, RAPID_SPIN
	db 20, DEFENSE_CURL
	db 24, FLASH_CANNON
	db 25, SPIKES
	db 30, BIDE
	db 35, TAKE_DOWN
	db 41, EARTHQUAKE
	db 48, BUG_BUZZ
	db 52, EXPLOSION
	db 56, IRON_BASH
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, DEFENSE_CURL
	db 6, ROLLOUT
	db 9, PURSUIT
	db 12, SCREECH
	db 15, MUD_SLAP
	db 18, ANCIENTPOWER
	db 21, DIG
	db 24, BULK_UP
	db 27, DRAGONBREATH
	db 30, SLAM
	db 33, GLARE
	db 36, BODY_SLAM
	db 39, AIR_SLASH
	db 43, EARTHQUAKE
	db 46, ENDURE
	db 49, GIGA_IMPACT
	db 52, DRAGON_PULSE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, MUD_SLAP
	db 8, HARDEN
	db 12, AERIAL_ACE
	db 16, QUICK_ATTACK
	db 20, FEINT_ATTACK
	db 24, BUG_BITE
	db 28, SAND_TOMB
	db 32, ACROBATICS
	db 36, SLASH
	db 40, WING_ATTACK
	db 44, EARTHQUAKE
	db 50, X_SCISSOR
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 5, WRAP
	db 8, HARDEN
	db 11, ROCK_THROW
	db 14, MAGNITUDE
	db 17, IRON_TAIL
	db 20, ROCK_TOMB
	db 24, SAND_TOMB
	db 27, BULLDOZE
	db 32, SANDSTORM
	db 36, ROCK_SLIDE
	db 40, SLAM
	db 44, DRAGONBREATH
	db 48, CRUNCH
	db 52, IRON_BASH
	db 56, STONE_EDGE
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 12, DISARM_VOICE
	db 16, BITE
	db 20, LICK
	db 24, DRAIN_KISS
	db 28, ROAR
	db 32, RAGE
	db 36, DAZZLINGLEAM
	db 40, TAKE_DOWN
	db 44, CRUNCH
	db 48, PLAY_ROUGH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULK_UP
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 12, DISARM_VOICE	
	db 16, BITE
	db 20, LICK
	db 22, KARATE_CHOP
	db 27, DRAIN_KISS
	db 31, ROAR
	db 35, RAGE
	db 39, VITAL_THROW
	db 43, DAZZLINGLEAM
	db 47, DRAIN_PUNCH
	db 51, CRUNCH
	db 55, PLAY_ROUGH
	db 60, CROSS_CHOP
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 1, POISON_STING
	db 7, WATER_GUN
	db 10, DEFENSE_CURL
	db 14, PIN_MISSILE
	db 18, BUBBLEBEAM
	db 22, SLUDGE
	db 26, ROLLOUT
	db 30, TOXIC
	db 34, TAKE_DOWN
	db 38, POISON_JAB
	db 42, HYDRO_PUMP
	db 48, GUNK_SHOT
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 5, FOCUS_ENERGY
	db 9, PURSUIT
	db 12, FALSE_SWIPE
	db 16, WING_ATTACK
	db 20, AGILITY
	db 24, BUG_BITE
	db 28, METAL_CLAW
	db 32, SLASH
	db 36, NIGHT_SLASH
	db 40, SWORDS_DANCE
	db 44, DOUBLE_TEAM
	db 48, AIR_SLASH
	db 52, X_SCISSOR
	db 56, IRON_BASH
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, HARDEN
	db 5, WRAP
	db 8, ROLLOUT
	db 12, ENCORE
	db 16, ROCK_THROW
	db 19, BIDE
	db 22, BUG_BITE
	db 28, SAFEGUARD
	db 32, GROWTH
	db 36, ROCK_SLIDE
	db 40, REST
	db 44, BUG_BUZZ
	db 50, STONE_EDGE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SLASH
	db 1, BULK_UP
	db 1, TACKLE
	db 1, LEER
	db 1, HORN_ATTACK
	db 1, ENDURE
	db 9, BUG_BITE
	db 13, FURY_STRIKES
	db 18, LOW_KICK
	db 23, AERIAL_ACE
	db 27, KARATE_CHOP
	db 31, SEISMIC_TOSS
	db 36, TAKE_DOWN
	db 40, CROSS_CHOP
	db 47, REVERSAL
	db 53, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 5, POWDER_SNOW
	db 8, QUICK_ATTACK
	db 11, FURY_STRIKES
	db 14, FEINT_ATTACK
	db 18, ICY_WIND
	db 22, BEAT_UP
	db 25, METAL_CLAW
	db 28, AGILITY
	db 32, SLASH
	db 36, HAIL
	db 40, ICE_BEAM
	db 44, NASTY_PLOT
	db 48, HEALINGLIGHT
	db 52, X_SCISSOR
	db 56, NIGHT_SLASH
	db 60, ICICLE_CRASH
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 5, LICK
	db 9, FURY_STRIKES
	db 12, FOCUS_ENERGY
	db 15, FEINT_ATTACK
	db 18, THIEF
	db 22, BELLY_DRUM
	db 25, CHARM
	db 28, SLASH
	db 32, REST
	db 32, SNORE
	db 38, PLAY_ROUGH
	db 41, THRASH
	db 45, MEGA_PUNCH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 5, LICK
	db 9, FURY_STRIKES
	db 12, FOCUS_ENERGY
	db 15, FEINT_ATTACK
	db 18, THIEF
	db 22, BELLY_DRUM
	db 25, CHARM
	db 28, SLASH
	db 29, MAGNITUDE
	db 35, REST
	db 35, SNORE
	db 40, PLAY_ROUGH
	db 45, BULLDOZE
	db 49, THRASH
	db 53, MEGA_PUNCH
	db 57, EARTHQUAKE
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 29, MAGCARGO
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, SMOG
	db 5, EMBER
	db 8, ROCK_THROW
	db 11, HARDEN
	db 15, FIRE_SPIN
	db 18, SMOKESCREEN
	db 22, ANCIENTPOWER
	db 25, FLAME_WHEEL
	db 28, ROCK_SLIDE
	db 32, FLAME_CHARGE
	db 35, AMNESIA
	db 38, BODY_SLAM
	db 41, FLAMETHROWER
	db 44, RECOVER
	db 48, HEAT_WAVE
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, SMOG
	db 5, EMBER
	db 8, ROCK_THROW
	db 11, HARDEN
	db 15, FIRE_SPIN
	db 18, SMOKESCREEN
	db 22, ANCIENTPOWER
	db 25, FLAME_WHEEL
	db 28, SANDSTORM
	db 30, ROCK_SLIDE
	db 33, FLAME_CHARGE
	db 37, AMNESIA
	db 42, BODY_SLAM
	db 46, FLAMETHROWER
	db 50, ROCK_BLAST
	db 54, RECOVER
	db 59, HEAT_WAVE
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 25, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 5, BITE
	db 8, POWDER_SNOW
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, MAGNITUDE
	db 21, ICY_WIND
	db 25, HAIL
	db 28, TAKE_DOWN
	db 35, BULLDOZE
	db 37, EARTHQUAKE
	db 41, BLIZZARD
	db 45, AMNESIA
	db 48, ICICLE_CRASH
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db EVOLVE_LEVEL, 40, MAMOSWINE
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, PECK
	db 1, HORN_ATTACK
	db 1, FORESIGHT
	db 5, BITE
	db 8, POWDER_SNOW
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, MAGNITUDE
	db 21, ICY_WIND
	db 25, HAIL
	db 28, TAKE_DOWN
	db 32, FURY_STRIKES
	db 37, BULLDOZE
	db 41, EARTHQUAKE
	db 46, BLIZZARD
	db 52, AMNESIA
	db 58, ICICLE_CRASH
	db 0 ; no more level-up moves

MamoswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, PECK
	db 1, HORN_ATTACK
	db 1, FORESIGHT
	db 5, BITE
	db 8, POWDER_SNOW
	db 11, MUD_SLAP
	db 14, ENDURE
	db 18, MAGNITUDE
	db 21, ICY_WIND
	db 25, HAIL
	db 28, TAKE_DOWN
	db 32, FURY_STRIKES
	db 37, BULLDOZE
	db 41, EARTHQUAKE
	db 47, BLIZZARD
	db 54, ICICLE_CRASH
	db 60, AMNESIA
	db 65, SCARY_FACE
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 6, LOCK_ON
	db 10, PSYBEAM
	db 14, CHARGE_BEAM
	db 18, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 27, FOCUS_ENERGY
	db 32, WATER_PULSE
	db 36, SIGNAL_BEAM
	db 40, ICE_BEAM
	db 44, GUNK_SHOT
	db 48, HYDRO_PUMP
	db 52, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_BLAST
	db 1, WATER_GUN
	db 6, LOCK_ON
	db 10, PSYBEAM
	db 14, CHARGE_BEAM
	db 18, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 24, OCTAZOOKA
	db 30, FOCUS_ENERGY
	db 36, WATER_PULSE
	db 40, SIGNAL_BEAM
	db 44, ICE_BEAM
	db 48, GUNK_SHOT
	db 52, HYDRO_PUMP
	db 56, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 4, METRONOME
	db 7, PECK
	db 10, PRESENT
	db 13, POWDER_SNOW
	db 17, GUST
	db 20, PRESENT
	db 23, ICY_WIND
	db 26, FRESH_SNACK
	db 30, PRESENT
	db 33, AERIAL_ACE
	db 37, AURORA_BEAM
	db 40, PRESENT
	db 43, BELLY_DRUM
	db 46, ICICLE_SPEAR
	db 50, PRESENT
	db 53, ACROBATICS
	db 56, ICE_BEAM
	db 60, PRESENT
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, SIGNAL_BEAM
	db 1, TACKLE
	db 1, WATER_GUN
	db 5, GUST
	db 9, SUPERSONIC
	db 14, BUBBLEBEAM
	db 17, CONFUSE_RAY
	db 20, AQUA_JET
	db 24, WING_ATTACK
	db 27, AGILITY
	db 33, AERIAL_ACE
	db 38, WATER_PULSE
	db 42, AIR_SLASH
	db 46, ACROBATICS
	db 50, TAKE_DOWN
	db 54, HYDRO_PUMP
	db 58, HURRICANE
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 6, SAND_ATTACK
	db 10, SPIKES
	db 14, METAL_CLAW
	db 18, AERIAL_ACE
	db 22, FURY_STRIKES
	db 26, AGILITY
	db 30, WING_ATTACK
	db 34, STEEL_WING
	db 38, SLASH
	db 42, SCREECH
	db 46, NIGHT_SLASH
	db 50, DRILL_PECK
	db 54, IRON_BASH
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 5, ROAR
	db 9, SMOG
	db 12, WILL_O_WISP
	db 15, BITE
	db 18, FLAME_WHEEL
	db 21, PURSUIT
	db 25, FLAME_CHARGE
	db 30, FEINT_ATTACK
	db 34, FIRE_SPIN
	db 38, CRUNCH
	db 43, NASTY_PLOT
	db 47, FLAMETHROWER
	db 53, DARK_PULSE
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 5, ROAR
	db 9, SMOG
	db 12, WILL_O_WISP
	db 15, BITE
	db 18, FLAME_WHEEL
	db 21, PURSUIT
	db 26, FLAME_CHARGE
	db 32, FEINT_ATTACK
	db 37, FIRE_SPIN
	db 42, CRUNCH
	db 48, NASTY_PLOT
	db 53, FLAMETHROWER
	db 59, DARK_PULSE
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 4, SMOKESCREEN
	db 7, LEER
	db 10, AQUA_JET
	db 14, TWISTER
	db 18, FOCUS_ENERGY
	db 22, BUBBLEBEAM
	db 26, DRAGONBREATH
	db 26, BUBBLEBEAM
	db 30, WATER_PULSE
	db 36, AGILITY
	db 41, RAIN_DANCE
	db 48, HYDRO_PUMP
	db 56, DRAGON_PULSE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, DEFENSE_CURL
	db 6, REVERSAL
	db 9, ROLLOUT
	db 12, MAGNITUDE
	db 15, ENDURE
	db 18, SAND_TOMB
	db 22, SLAM
	db 28, BULLDOZE
	db 33, TAKE_DOWN 
	db 37, CHARM
	db 42, TAKE_DOWN
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, GROWL
	db 1, DEFENSE_CURL
	db 6, RAPID_SPIN
	db 9, ROLLOUT
	db 12, MAGNITUDE
	db 15, ENDURE
	db 18, SAND_TOMB
	db 22, SLAM
	db 24, FURY_STRIKES
	db 28, FLASH
	db 31, BULLDOZE
	db 34, SCARY_FACE
	db 37, ROCK_TOMB
	db 41, FLASH_CANNON
	db 45, EARTHQUAKE
	db 49, IRON_BASH
	db 53, GIGA_IMPACT
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, MISMAGIUS
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 5, LICK
	db 8, DISARM_VOICE
	db 12, CONFUSE_RAY
	db 15, MEAN_LOOK
	db 20, HEX
	db 24, OMINOUS_WIND
	db 28, PSYBEAM
	db 32, DAZZLINGLEAM
	db 36, DARK_PULSE
	db 42, PAIN_SPLIT
	db 46, SHADOW_BALL
	db 52, NASTY_PLOT
	db 0 ; no more level-up moves

MismagiusEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAMETHROWER
	db 1, NASTY_PLOT
	db 1, SHADOW_BALL
	db 1, DARK_PULSE
	db 1, DAZZLINGLEAM
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRIPLE_KICK
	db 1, FOCUS_ENERGY
	db 1, PURSUIT
	db 1, QUICK_ATTACK
	db 19, TRIPLE_KICK
	db 23, BULK_UP
	db 26, RAPID_SPIN
	db 29, COUNTER
	db 32, QUICK_ATTACK
	db 35, PURSUIT
	db 38, FORESIGHT
	db 43, AGILITY
	db 46, PROTECT
	db 49, FOCUS_BLAST
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, HONCHKROW
	db 0 ; no more evolutions
	db 1, PECK
	db 6, PURSUIT
	db 10, GUST
	db 14, HAZE
	db 18, NIGHT_SHADE
	db 22, AERIAL_ACE
	db 26, THIEF
	db 30, WING_ATTACK
	db 34, SWAGGER
	db 38, FEINT_ATTACK
	db 42, MEAN_LOOK
	db 46, OMINOUS_WIND
	db 50, NASTY_PLOT
	db 54, DRILL_PECK
	db 58, NIGHT_SLASH
	db 62, HURRICANE
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, DARK_PULSE
	db 1, HURRICANE
	db 1, NASTY_PLOT
	db 1, HAZE
	db 1, NIGHT_SLASH
	db 66, DARK_PULSE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, CONVERSION
	db 1, TACKLE
	db 6, THUNDERSHOCK
	db 10, CONFUSION
	db 14, AGILITY
	db 17, RECOVER
	db 21, PSYBEAM
	db 25, SIGNAL_BEAM
	db 28, BARRIER
	db 31, CHARGE_BEAM
	db 35, AURORA_BEAM
	db 38, THUNDERBOLT
	db 41, TRI_ATTACK
	db 45, LOCK_ON
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, DEFENSE_CURL
	db 10, STOMP
	db 13, FRESH_SNACK
	db 17, DIZZY_PUNCH
	db 21, ZEN_HEADBUTT
	db 25, ROLLOUT
	db 30, BIDE
	db 35, HEADBUTT
	db 40, HEAL_BELL
	db 45, PLAY_ROUGH
	db 50, BODY_SLAM
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, DISARM_VOICE
	db 13, FRESH_SNACK
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 29, SING
	db 34, BODY_SLAM
	db 38, DAZZLINGLEAM
	db 43, DEFENSE_CURL
	db 49, LIGHT_SCREEN
	db 57, GIGA_IMPACT
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 9, THUNDERSHOCK
	db 14, ROAR
	db 19, THUNDER_WAVE
	db 24, QUICK_ATTACK
	db 29, PURSUIT
	db 34, REFLECT
	db 39, CHARGE_BEAM
	db 44, FEINT_ATTACK
	db 49, SPARK
	db 54, EXTREMESPEED
	db 59, CRUNCH
	db 64, THUNDERBOLT
	db 69, RAIN_DANCE
	db 74, FOCUS_BLAST
	db 79, HIDDEN_POWER
	db 90, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 9, EMBER
	db 14, ROAR
	db 19, FIRE_SPIN
	db 24, STOMP
	db 29, PURSUIT
	db 34, LIGHT_SCREEN
	db 39, FLAME_CHARGE
	db 44, SWAGGER
	db 49, FLAME_WHEEL
	db 54, EXTREMESPEED
	db 59, CRUNCH
	db 64, FLAMETHROWER
	db 69, SUNNY_DAY
	db 74, HEAT_WAVE
	db 79, HIDDEN_POWER
	db 90, SACRED_FIRE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 9, BUBBLEBEAM
	db 14, ROAR
	db 19, GUST
	db 24, ICY_WIND
	db 29, PURSUIT
	db 34, LIGHT_SCREEN
	db 39, WATER_PULSE
	db 44, MIRROR_COAT
	db 49, AURORA_BEAM
	db 54, EXTREMESPEED
	db 59, ZEN_HEADBUTT
	db 64, ICE_BEAM
	db 69, RAIN_DANCE
	db 74, BLIZZARD
	db 79, HIDDEN_POWER
	db 90, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, BITE
	db 5, ROCK_THROW
	db 9, SANDSTORM
	db 13, SCREECH
	db 17, RAGE
	db 22, SCARY_FACE
	db 25, ROCK_SLIDE
	db 29, THRASH
	db 32, DARK_PULSE
	db 36, CRUNCH
	db 40, EARTHQUAKE
	db 44, STONE_EDGE
	db 48, OUTRAGE
	db 52, GIGA_IMPACT
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, BITE
	db 5, ROCK_THROW
	db 9, SANDSTORM
	db 13, SCREECH
	db 17, RAGE
	db 22, SCARY_FACE
	db 25, ROCK_SLIDE
	db 29, THRASH
	db 34, DARK_PULSE
	db 39, CRUNCH
	db 45, EARTHQUAKE
	db 51, STONE_EDGE
	db 57, OUTRAGE
	db 63, GIGA_IMPACT
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, BITE
	db 5, ROCK_THROW
	db 9, SANDSTORM
	db 13, SCREECH
	db 17, RAGE
	db 22, SCARY_FACE
	db 25, ROCK_SLIDE
	db 29, THRASH
	db 34, DARK_PULSE
	db 39, CRUNCH
	db 45, EARTHQUAKE
	db 51, STONE_EDGE
	db 60, OUTRAGE
	db 70, GIGA_IMPACT
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 11, SAFEGUARD
	db 22, PSYBEAM
	db 33, RECOVER
	db 44, HYDRO_PUMP
	db 55, AEROBLAST
	db 66, SWIFT
	db 77, PSYCHIC_M
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 11, SAFEGUARD
	db 22, FLAME_WHEEL
	db 33, RECOVER
	db 44, FIRE_BLAST
	db 55, SACRED_FIRE
	db 66, SWIFT
	db 77, PSYCHIC_M
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, DISARM_VOICE
	db 1, RECOVER
	db 1, HEAL_BELL
	db 5, RAZOR_LEAF
	db 10, SAFEGUARD
	db 18, ENERGY_BALL
	db 27, ANCIENTPOWER
	db 36, BATON_PASS
	db 45, DRAIN_KISS
	db 54, GIGA_DRAIN
	db 63, DAZZLINGLEAM
	db 72, SPORE
	db 81, MOONBLAST
	db 90, PETAL_DANCE
	db 0 ; no more level-up moves

RaichuAEvosAttacks:
	db 0 ; no more evolutions
	db 1, CALM_MIND
	db 1, THUNDERSHOCK
	db 1, SURF
	db 1, PSYCHIC_M
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves