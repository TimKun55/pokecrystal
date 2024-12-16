	db PORYGON_Z ; 240

	db  85,  80,  70,  90, 135,  75
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, ELECTRIC ; type
	db 30 ; catch rate
	db 241 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/porygon_z/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, THIEF, NIGHTMARE, BODY_SLAM, CHARGE_BEAM, FLASH, THUNDERBOLT, ICE_BEAM, SIGNAL_BEAM, ZEN_HEADBUTT, GIGA_IMPACT, SUNNY_DAY, RAIN_DANCE
	; end
