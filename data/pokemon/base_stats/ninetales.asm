	db NINETALES ; 038

	db  73,  76,  75, 100,  81, 100
	evs  0,   0,   0,   1,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GHOST ; type
	db 75 ; catch rate
	db 178 ; base exp
	db ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninetales/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, HEX, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, HEAT_WAVE, REST, ATTRACT, BODY_SLAM, FAINT_ATTACK, FLAMETHROWER, ENERGY_BALL, DARK_PULSE, FLAME_CHARGE, ZEN_HEADBUTT, GIGA_IMPACT, SUNNY_DAY
	; end
