	db HONCHKROW ; 193

	db 100, 125,  52,  71, 105,  52
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 30 ; catch rate
	db 187 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/honchkrow/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, CALM_MIND, HIDDEN_POWER, HEX, SNORE, ICY_WIND, PROTECT, ENDURE, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, DREAM_EATER, HEAT_WAVE, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, BODY_SLAM, FEINT_ATTACK, FLY, HURRICANE, ACROBATICS, DARK_PULSE, NIGHT_SLASH, AIR_SLASH, GIGA_IMPACT, SUNNY_DAY
	; end
