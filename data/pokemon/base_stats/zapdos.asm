	db ZAPDOS ; 145

	db  90,  90,  85, 100, 125,  90
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp
	db BRIGHTPOWDER, BRIGHTPOWDER ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/zapdos/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, HEAT_WAVE, REST, STEEL_WING, BODY_SLAM, CHARGE_BEAM, FLY, FLASH, THUNDERBOLT, HURRICANE, ACROBATICS, SIGNAL_BEAM, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
