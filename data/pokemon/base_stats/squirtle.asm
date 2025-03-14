	db SQUIRTLE ; 007

	db  44,  48,  65,  43,  50,  64
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/squirtle/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, SCALD, ENDURE, ROCK_TOMB, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, HAIL, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, GROWTH_PUNCH, WATER_PULSE, ZEN_HEADBUTT, ROCK_TOMB, IRON_DEFENSE, AQUA_TAIL, RAIN_DANCE
	; end
