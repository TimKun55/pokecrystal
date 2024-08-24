	db MILTANK ; 241

	db  95,  80, 105, 100,  40,  70
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 200 ; base exp
	db MOOMOO_MILK, MOOMOO_MILK ; items
	db GENDER_F100 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/miltank/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SWEET_SCENT, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, ROCK_TOMB, IRON_TAIL, THUNDER, EARTHQUAKE, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, FIRE_PUNCH, BODY_SLAM, BULLDOZE, SURF, STRENGTH, THUNDERBOLT, ICE_BEAM, FOCUS_BLAST, GROWTH_PUNCH, WATER_PULSE, ZEN_HEADBUTT, ROCK_TOMB, PLAY_ROUGH, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
