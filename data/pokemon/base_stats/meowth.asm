	db MEOWTH ; 052

	db  40,  45,  35,  90,  40,  40
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 69 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/meowth/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SNORE, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, ATTRACT, THIEF, NIGHTMARE, FEINT_ATTACK, THUNDERBOLT, GUNK_SHOT, DARK_PULSE, NIGHT_SLASH, WATER_PULSE, PLAY_ROUGH, SUNNY_DAY
	; end
