	db EKANS ; 023

	db  35,  60,  44,  55,  40,  54
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 255 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/ekans/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, PROTECT, GIGA_DRAIN, ENDURE, ROCK_TOMB, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, THIEF, SLUDGE, BULLDOZE, STRENGTH, POISON_JAB, GUNK_SHOT, DARK_PULSE, ROCK_TOMB, AQUA_TAIL, SUNNY_DAY
	; end
