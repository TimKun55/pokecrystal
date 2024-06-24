	db OCTILLERY ; 224

	db  75, 105,  75,  45, 105,  75
	evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/octillery/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, SCALD, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, THIEF, BODY_SLAM, SLUDGE, CHARGE_BEAM, SURF, WHIRLPOOL, FLAMETHROWER, ICE_BEAM, ENERGY_BALL, ROCK_BLAST, GUNK_SHOT, SIGNAL_BEAM, WATER_PULSE, GIGA_IMPACT, RAIN_DANCE
	; end
