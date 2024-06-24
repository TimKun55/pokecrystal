	db MOLTRES ; 146

	db  90, 100,  90,  90, 125,  85
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/moltres/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, FIRE_BLAST, SWIFT, HEAT_WAVE, REST, STEEL_WING, BODY_SLAM, FLY, FLAMETHROWER, HURRICANE, ACROBATICS, FLAME_CHARGE, AIR_SLASH, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
