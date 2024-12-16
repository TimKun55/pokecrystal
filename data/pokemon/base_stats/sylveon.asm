	db SYLVEON ; 252

	db  95,  65,  65,  60, 110, 130
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 3 ; step cycles to hatch
	INCBIN "gfx/pokemon/sylveon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, BODY_SLAM, DISARM_VOICE, DRAIN_KISS, DAZZLINGLEAM, MOONBLAST , SUNNY_DAY, RAIN_DANCE
	; end
