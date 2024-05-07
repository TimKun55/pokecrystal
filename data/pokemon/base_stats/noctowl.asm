	db NOCTOWL ; 164

	db 100,  50,  50,  70,  96,  96
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/noctowl/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, HEAT_WAVE, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, BODY_SLAM, FAINT_ATTACK, FLY, FLASH, MOONBLAST, SILVER_WIND, HURRICANE, ACROBATICS, ZEN_HEADBUTT, AIR_SLASH, GIGA_IMPACT
	; end
