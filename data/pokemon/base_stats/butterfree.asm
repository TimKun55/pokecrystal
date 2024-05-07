	db BUTTERFREE ; 012

	db  60,  45,  50,  70,  90,  80
	evs  0,   0,   0,   0,   2,   1
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 160 ; base exp
	db NO_ITEM, SILVERPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 1 ; step cycles to hatch
	INCBIN "gfx/pokemon/butterfree/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, NIGHTMARE, MEGA_DRAIN, FLASH, DRAIN_KISS, SILVER_WIND, HURRICANE, ENERGY_BALL, ACROBATICS, SIGNAL_BEAM, GIGA_IMPACT
	; end
