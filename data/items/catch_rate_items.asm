; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db ITEM_BE, ORAN_BERRY
	db ITEM_BF, ORAN_BERRY
	db TM_CALM_MIND, ORAN_BERRY
	db TM_ICE_PUNCH, ORAN_BERRY
	db TM_HEAT_WAVE, ORAN_BERRY
	db -1,      ORAN_BERRY
	db 0 ; end