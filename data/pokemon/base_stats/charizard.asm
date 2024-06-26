	db CHARIZARD ; 006

	db  78,  84,  78, 100, 109,  85
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/charizard/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, ROCK_TOMB, IRON_TAIL, DRAGONBREATH, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, FIRE_BLAST, SWIFT, DEFENSE_CURL, HEAT_WAVE, REST, ATTRACT, STEEL_WING, FIRE_PUNCH, FURY_CUTTER, BODY_SLAM, BULLDOZE, CUT, FLY, STRENGTH, FLAMETHROWER, HURRICANE, ACROBATICS, FOCUS_BLAST, GROWTH_PUNCH, FLAME_CHARGE, AIR_SLASH, ROCK_TOMB, GIGA_IMPACT, SUNNY_DAY, SANDSTORM
	; end
