	db HITMONTOP ; 238

	db  50,  95,  95,  70,  35, 110
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 138 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmontop/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, PROTECT, ENDURE, ROCK_TOMB, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, REST, ATTRACT, THIEF, BODY_SLAM, BULLDOZE, STRENGTH, STONE_EDGE, FOCUS_BLAST, GROWTH_PUNCH, GIGA_IMPACT, SUNNY_DAY
	; end
