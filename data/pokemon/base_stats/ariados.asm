	db ARIADOS ; 168

	db  70,  90,  70,  40,  60,  70
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, DARK ; type
	db 90 ; catch rate
	db 134 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/ariados/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, HEX, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DIG, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, THIEF, MEGA_DRAIN, SLUDGE, FEINT_ATTACK, FLASH, POISON_JAB, X_SCISSOR, SIGNAL_BEAM, NIGHT_SLASH, GIGA_IMPACT, SUNNY_DAY
	; end
