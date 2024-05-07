	db MAGCARGO ; 219

	db  60,  50, 120,  30,  90,  80
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK ; type
	db 75 ; catch rate
	db 154 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/magcargo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, ROCK_TOMB, EARTHQUAKE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, DEFENSE_CURL, HEAT_WAVE, REST, ATTRACT, BODY_SLAM, BULLDOZE, STRENGTH, FLAMETHROWER, STONE_EDGE, ROCK_BLAST, FLAME_CHARGE, SAND_TOMB, ROCK_TOMB, GIGA_IMPACT
	; end
