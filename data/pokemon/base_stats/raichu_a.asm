	db RAICHU_A ; 026

	db  60,  85,  50, 110,  95,  85
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 122 ; base exp
	db NO_ITEM, ORAN_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/raichu_a/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, BODY_SLAM, CHARGE_BEAM, SURF, STRENGTH, FLASH, THUNDERBOLT, DISARM_VOICE, DRAIN_KISS, DAZZLINGLEAM, SIGNAL_BEAM, FOCUS_BLAST, ZEN_HEADBUTT, PLAY_ROUGH, GIGA_IMPACT, RAIN_DANCE
	; end
