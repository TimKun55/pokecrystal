	db RAIKOU ; 243

	db  90,  85,  75, 115, 115, 100
	evs  0,   0,   0,   2,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/raikou/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ZAP_CANNON, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, SCALD, ENDURE, IRON_TAIL, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, BODY_SLAM, FEINT_ATTACK, BULLDOZE, CHARGE_BEAM, CUT, STRENGTH, FLASH, THUNDERBOLT, SIGNAL_BEAM, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
