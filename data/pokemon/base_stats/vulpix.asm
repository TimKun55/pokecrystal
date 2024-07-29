	db VULPIX ; 037

	db  38,  41,  40,  65,  50,  65
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 63 ; base exp
	db ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/vulpix/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, HEX, SNORE, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, HEAT_WAVE, REST, ATTRACT, FEINT_ATTACK, FLAMETHROWER, ENERGY_BALL, DARK_PULSE, FLAME_CHARGE, ZEN_HEADBUTT, SUNNY_DAY
	; end
