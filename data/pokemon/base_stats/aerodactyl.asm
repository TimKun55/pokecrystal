	db AERODACTYL ; 142

	db  80, 105,  65, 130,  60,  75
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 3 ; step cycles to hatch
	INCBIN "gfx/pokemon/aerodactyl/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, ROCK_TOMB, IRON_TAIL, DRAGONBREATH, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, FIRE_BLAST, SWIFT, HEAT_WAVE, REST, ATTRACT, STEEL_WING, BODY_SLAM, BULLDOZE, FLY, FLAMETHROWER, STONE_EDGE, HURRICANE, ROCK_BLAST, ROCK_TOMB, GIGA_IMPACT, AQUA_TAIL, RAIN_DANCE, SANDSTORM
	; end
