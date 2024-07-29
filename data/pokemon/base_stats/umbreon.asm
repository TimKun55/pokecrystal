	db UMBREON ; 197

	db  95,  65, 110,  65,  60, 130
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 45 ; catch rate
	db 197 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 3 ; step cycles to hatch
	INCBIN "gfx/pokemon/umbreon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, ATTRACT, NIGHTMARE, BODY_SLAM, FEINT_ATTACK, CUT, FLASH, DARK_PULSE, NIGHT_SLASH, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE
	; end
