	db AZUMARILL ; 022

	db 100,  75,  80,  50,  75,  80
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 75 ; catch rate
	db 153 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 2 ; step cycles to hatch
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, SCALD, ENDURE, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, BODY_SLAM, BULLDOZE, HAIL, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, DISARM_VOICE, DRAIN_KISS, DAZZLINGLEAM, MOONBLAST, FOCUS_BLAST, GROWTH_PUNCH, WATER_PULSE, PLAY_ROUGH, GIGA_IMPACT, AQUA_TAIL, RAIN_DANCE
	; end
