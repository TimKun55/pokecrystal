	db FERALIGATR ; 160

	db  85, 105, 100,  78,  79,  83
	evs  0,   2,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 210 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/feraligatr/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, SCALD, ENDURE, ROCK_TOMB, IRON_TAIL, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, AERIAL_ACE, REST, ATTRACT, FURY_CUTTER, BODY_SLAM, FEINT_ATTACK, BULLDOZE, HAIL, CUT, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM, NIGHT_SLASH, FOCUS_BLAST, GROWTH_PUNCH, WATER_PULSE, ROCK_TOMB, GIGA_IMPACT, RAIN_DANCE
	; end
