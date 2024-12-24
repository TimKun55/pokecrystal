	db QWILFISH ; 211

	db  65,  95,  85,  85,  80,  60
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 45 ; catch rate
	db 100 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/qwilfish/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, HEX, SNORE, BLIZZARD, ICY_WIND, PROTECT, SCALD, ENDURE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, DEFENSE_CURL, REST, ATTRACT, BODY_SLAM, SLUDGE, FEINT_ATTACK, HAIL, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, POISON_JAB, SIGNAL_BEAM, WATER_PULSE, GIGA_IMPACT, AQUA_TAIL, RAIN_DANCE
	; end
