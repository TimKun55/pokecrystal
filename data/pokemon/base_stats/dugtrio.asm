	db DUGTRIO ; 051

	db  35, 100,  50, 120,  50,  70
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/dugtrio/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, ROCK_TOMB, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, AERIAL_ACE, REST, ATTRACT, THIEF, BODY_SLAM, FEINT_ATTACK, BULLDOZE, CUT, STONE_EDGE, ROCK_BLAST, NIGHT_SLASH, SAND_TOMB, ROCK_TOMB, GIGA_IMPACT, SUNNY_DAY
	; end
