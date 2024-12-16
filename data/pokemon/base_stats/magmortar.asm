	db MAGMORTAR ; 176

	db  75,  95,  67,  83, 125,  95
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, POISON ; type
	db 30 ; catch rate
	db 243 ; base exp
	db ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/magmortar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, THUNDERPUNCH, HEAT_WAVE, REST, ATTRACT, THIEF, FIRE_PUNCH, BODY_SLAM, SLUDGE, FEINT_ATTACK, STRENGTH, FLAMETHROWER, POISON_JAB, GUNK_SHOT, FOCUS_BLAST, GROWTH_PUNCH, FLAME_CHARGE, GIGA_IMPACT, SUNNY_DAY
	; end
