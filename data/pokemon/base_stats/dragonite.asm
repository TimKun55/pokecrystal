	db DRAGONITE ; 149

	db  91, 134,  95,  80, 100, 100
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 4 ; step cycles to hatch
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, ROCK_TOMB, IRON_TAIL, DRAGONBREATH, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, AERIAL_ACE, FIRE_BLAST, SWIFT, THUNDERPUNCH, HEAT_WAVE, REST, ATTRACT, STEEL_WING, FIRE_PUNCH, FURY_CUTTER, BODY_SLAM, BULLDOZE, HAIL, FLY, SURF, STRENGTH, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, STONE_EDGE, HURRICANE, GROWTH_PUNCH, WATER_PULSE, AIR_SLASH, ROCK_TOMB, GIGA_IMPACT, AQUA_TAIL, RAIN_DANCE, SANDSTORM
	; end
