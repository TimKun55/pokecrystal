	db NIDORAN_F ; 029

	db  55,  47,  52,  41,  40,  40
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 235 ; catch rate
	db 59 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidoran_f/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, DEFENSE_CURL, REST, ATTRACT, THIEF, SLUDGE, THUNDERBOLT, POISON_JAB, WATER_PULSE, SUNNY_DAY, RAIN_DANCE
	; end
