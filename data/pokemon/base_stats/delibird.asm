	db DELIBIRD ; 225

	db  45,  55,  45,  75,  65,  45
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 45 ; catch rate
	db 183 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/delibird/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, REST, ATTRACT, THIEF, BODY_SLAM, HAIL, FLY, ICE_BEAM, HURRICANE, GUNK_SHOT, ICICLE_SPEAR, ACROBATICS, SIGNAL_BEAM, GROWTH_PUNCH, AIR_SLASH, GIGA_IMPACT, RAIN_DANCE
	; end
