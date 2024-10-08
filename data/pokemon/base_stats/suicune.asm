	db SUICUNE ; 245

	db 100,  75, 115,  85,  90, 115
	evs  0,   0,   1,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 3 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/suicune/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, CALM_MIND, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, SCALD, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, BODY_SLAM, FEINT_ATTACK, BULLDOZE, HAIL, CUT, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, SIGNAL_BEAM, WATER_PULSE, AIR_SLASH, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
