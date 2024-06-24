	db TENTACRUEL ; 073

	db  80,  70,  65, 100,  80, 120
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/tentacruel/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, HEX, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, SCALD, GIGA_DRAIN, ENDURE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, MEGA_DRAIN, BODY_SLAM, SLUDGE, HAIL, CUT, SURF, WHIRLPOOL, ICE_BEAM, DAZZLINGLEAM, POISON_JAB, WATER_PULSE, GIGA_IMPACT, RAIN_DANCE
	; end
