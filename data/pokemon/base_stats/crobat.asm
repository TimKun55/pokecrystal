	db CROBAT ; 169

	db  85,  90,  80, 130,  70,  80
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 204 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/crobat/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, HEAT_WAVE, REST, ATTRACT, THIEF, STEEL_WING, MEGA_DRAIN, BODY_SLAM, SLUDGE, FAINT_ATTACK, FLY, HURRICANE, X_SCISSOR, ACROBATICS, DARK_PULSE, NIGHT_SLASH, ZEN_HEADBUTT, GIGA_IMPACT
	; end
