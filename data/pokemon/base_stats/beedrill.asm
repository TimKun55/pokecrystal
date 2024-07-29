	db BEEDRILL ; 015

	db  65,  90,  40,  75,  45,  80
	evs  0,   2,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/beedrill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, AERIAL_ACE, SWIFT, REST, ATTRACT, FURY_CUTTER, SLUDGE, FEINT_ATTACK, CUT, POISON_JAB, SILVER_WIND, X_SCISSOR, ACROBATICS, NIGHT_SLASH, GIGA_IMPACT, SUNNY_DAY
	; end
