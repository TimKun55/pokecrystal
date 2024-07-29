	db GLIGAR ; 207

	db  70,  90, 105,  85,  40,  80
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FLYING ; type
	db 60 ; catch rate
	db 108 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/gligar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, PROTECT, ENDURE, ROCK_TOMB, IRON_TAIL, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, AERIAL_ACE, SWIFT, REST, ATTRACT, THIEF, FURY_CUTTER, BODY_SLAM, SLUDGE, FEINT_ATTACK, BULLDOZE, CUT, STRENGTH, POISON_JAB, X_SCISSOR, ACROBATICS, DARK_PULSE, SAND_TOMB, ROCK_TOMB, SUNNY_DAY, SANDSTORM
	; end
