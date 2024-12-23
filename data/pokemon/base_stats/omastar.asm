	db OMASTAR ; 139

	db  70,  60, 125,  55, 115,  70
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 3 ; step cycles to hatch
	INCBIN "gfx/pokemon/omastar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, SCALD, ENDURE, ROCK_TOMB, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, BODY_SLAM, HAIL, SURF, WHIRLPOOL, ICE_BEAM, STONE_EDGE, ROCK_BLAST, WATER_PULSE, ROCK_TOMB, GIGA_IMPACT, IRON_DEFENSE, RAIN_DANCE, SANDSTORM
	; end
