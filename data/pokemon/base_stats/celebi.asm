	db CELEBI ; 251

	db 100, 100, 100, 100, 100, 100
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, GRASS ; type
	db 45 ; catch rate
	db 200 ; base exp
	db LUM_BERRY, LUM_BERRY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/celebi/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, CALM_MIND, HIDDEN_POWER, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, AERIAL_ACE, SWIFT, DEFENSE_CURL, REST, NIGHTMARE, MEGA_DRAIN, BODY_SLAM, SLUDGE, CHARGE_BEAM, FLASH, DISARM_VOICE, DRAIN_KISS, DAZZLINGLEAM, MOONBLAST, SILVER_WIND, ENERGY_BALL, SIGNAL_BEAM, WATER_PULSE, ZEN_HEADBUTT, PLAY_ROUGH, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE, SANDSTORM
	; end
