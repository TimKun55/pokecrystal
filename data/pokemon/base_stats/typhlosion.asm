	db TYPHLOSION ; 157

	db  78,  84,  78, 100, 109,  85
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 209 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/typhlosion/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, ROCK_TOMB, IRON_TAIL, EARTHQUAKE, RETURN, DIG, MUD_SLAP, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, DEFENSE_CURL, THUNDERPUNCH, HEAT_WAVE, REST, ATTRACT, FIRE_PUNCH, FURY_CUTTER, BODY_SLAM, BULLDOZE, CUT, STRENGTH, FLAMETHROWER, FOCUS_BLAST, GROWTH_PUNCH, FLAME_CHARGE, ROCK_TOMB, PLAY_ROUGH, GIGA_IMPACT
	; end