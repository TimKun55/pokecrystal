	db ARBOK ; 024

	db  60,  95,  69,  80,  65,  79
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK ; type
	db 90 ; catch rate
	db 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/arbok/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, ROCK_TOMB, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, THIEF, SLUDGE, BULLDOZE, STRENGTH, POISON_JAB, GUNK_SHOT, DARK_PULSE, ROCK_TOMB, GIGA_IMPACT, SUNNY_DAY
	; end
