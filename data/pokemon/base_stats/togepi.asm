	db TOGEPI ; 117

	db  35,  20,  65,  20,  40,  65
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/togepi/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, ROCK_SMASH, CALM_MIND, HIDDEN_POWER, SNORE, PROTECT, ENDURE, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, FIRE_BLAST, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, ATTRACT, FLASH, FLAMETHROWER, DISARM_VOICE, DRAIN_KISS, DAZZLINGLEAM, MOONBLAST, SIGNAL_BEAM, WATER_PULSE, ZEN_HEADBUTT, PLAY_ROUGH, SUNNY_DAY, RAIN_DANCE
	; end
