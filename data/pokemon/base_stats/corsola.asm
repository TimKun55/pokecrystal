	db CORSOLA ; 207

	db  65,  65,  95,  35,  90,  95
	evs  0,   0,   1,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, ROCK ; type
	db 60 ; catch rate
	db 113 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/corsola/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, CALM_MIND, HIDDEN_POWER, SNORE, PROTECT, SCALD, ENDURE, ROCK_TOMB, EARTHQUAKE, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, BODY_SLAM, BULLDOZE, HAIL, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM, STONE_EDGE, ROCK_BLAST, ICICLE_SPEAR, WATER_PULSE, ROCK_TOMB, IRON_DEFENSE, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
