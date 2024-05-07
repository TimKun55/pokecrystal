	db RAICHU ; 026

	db  60,  85,  55, 110,  95,  80
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/raichu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, BODY_SLAM, CHARGE_BEAM, STRENGTH, FLASH, THUNDERBOLT, DISARM_VOICE, DRAIN_KISS, SIGNAL_BEAM, FOCUS_BLAST, PLAY_ROUGH, GIGA_IMPACT
	; end
