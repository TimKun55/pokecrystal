	db QUAGSIRE ; 195

	db  95,  85,  85,  35,  65,  65
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 90 ; catch rate
	db 137 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/quagsire/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, SCALD, ENDURE, ROCK_TOMB, IRON_TAIL, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, DEFENSE_CURL, REST, ATTRACT, BODY_SLAM, SLUDGE, BULLDOZE, HAIL, SURF, STRENGTH, FLASH, WHIRLPOOL, ICE_BEAM, STONE_EDGE, DRAIN_PUNCH, FOCUS_BLAST, GROWTH_PUNCH, SAND_TOMB, WATER_PULSE, ROCK_TOMB, GIGA_IMPACT, RAIN_DANCE, SANDSTORM
	; end
