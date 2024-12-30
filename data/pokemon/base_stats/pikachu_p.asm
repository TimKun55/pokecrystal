	db PIKACHU_P ; 025

	db  45,  80,  50, 120,  75,  60
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 82 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/pikachu_p/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, CALM_MIND, HIDDEN_POWER, SNORE, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, CHARGE_BEAM, STRENGTH, FLASH, THUNDERBOLT, DISARM_VOICE, DRAIN_KISS, SIGNAL_BEAM, PLAY_ROUGH, RAIN_DANCE
	; end
