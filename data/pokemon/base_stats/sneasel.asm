	db SNEASEL ; 215

	db  60, 105,  75, 115,  35,  80
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, ICE ; type
	db 60 ; catch rate
	db 132 ; base exp
	db NO_ITEM, QUICK_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/sneasel/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, ATTRACT, THIEF, FURY_CUTTER, NIGHTMARE, BODY_SLAM, FEINT_ATTACK, HAIL, CUT, SURF, STRENGTH, ICE_BEAM, POISON_JAB, X_SCISSOR, ICICLE_SPEAR, DARK_PULSE, NIGHT_SLASH, GROWTH_PUNCH, GIGA_IMPACT, RAIN_DANCE
	; end
