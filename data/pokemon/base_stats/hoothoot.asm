	db HOOTHOOT ; 163

	db  60,  30,  30,  50,  36,  56
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 58 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/hoothoot/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, CALM_MIND, HIDDEN_POWER, SNORE, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, DREAM_EATER, HEAT_WAVE, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, FEINT_ATTACK, FLY, FLASH, MOONBLAST, SILVER_WIND, ACROBATICS, ZEN_HEADBUTT, AIR_SLASH, SUNNY_DAY
	; end
