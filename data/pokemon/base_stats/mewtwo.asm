	db MEWTWO ; 150

	db 106, 110,  90, 130, 154,  90
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 220 ; base exp
	db NO_ITEM, BERSERK_GENE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/mewtwo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, CALM_MIND, HIDDEN_POWER, HEX, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, ROCK_TOMB, SOLARBEAM, IRON_TAIL, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, AERIAL_ACE, FIRE_BLAST, SWIFT, THUNDERPUNCH, DREAM_EATER, REST, FIRE_PUNCH, NIGHTMARE, BODY_SLAM, BULLDOZE, CHARGE_BEAM, HAIL, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, POISON_JAB, STONE_EDGE, ENERGY_BALL, DRAIN_PUNCH, DARK_PULSE, SIGNAL_BEAM, NIGHT_SLASH, FOCUS_BLAST, GROWTH_PUNCH, WATER_PULSE, ZEN_HEADBUTT, ROCK_TOMB, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE
	; end
