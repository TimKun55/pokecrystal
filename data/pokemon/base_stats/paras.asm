	db PARAS ; 046

	db  35,  70,  55,  25,  45,  55
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/paras/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SWEET_SCENT, SNORE, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, AERIAL_ACE, REST, ATTRACT, THIEF, FURY_CUTTER, MEGA_DRAIN, SLUDGE, CUT, FLASH, X_SCISSOR, SUNNY_DAY
	; end
