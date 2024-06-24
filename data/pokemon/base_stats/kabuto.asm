	db KABUTO ; 140

	db  30,  80,  90,  55,  55,  45
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 3 ; step cycles to hatch
	INCBIN "gfx/pokemon/kabuto/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, SCALD, GIGA_DRAIN, ENDURE, ROCK_TOMB, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, REST, ATTRACT, THIEF, HAIL, MEGA_DRAIN, ICE_BEAM, STONE_EDGE, ROCK_BLAST, WATER_PULSE, ROCK_TOMB, RAIN_DANCE, SANDSTORM
	; end
