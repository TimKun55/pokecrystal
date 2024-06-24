	db MANTINE ; 226

	db  85,  40,  70,  70,  80, 140
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db 25 ; catch rate
	db 168 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/mantine/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, SCALD, ENDURE, ROCK_TOMB, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, AERIAL_ACE, SWIFT, REST, ATTRACT, BODY_SLAM, BULLDOZE, HAIL, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, ROCK_BLAST, GUNK_SHOT, ACROBATICS, SIGNAL_BEAM, WATER_PULSE, ROCK_TOMB, GIGA_IMPACT, RAIN_DANCE
	; end
