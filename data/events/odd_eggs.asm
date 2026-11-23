DEF NUM_ODD_EGGS EQU 14

; The probability table still has one entry per egg: non-shiny, shiny, repeated
; for each species. The data table below stores one entry per species because
; both entries of a pair share the species and its four moves. The low bit of
; the selected probability index is the shiny flag.

DEF odd_egg_prob_total = 0

MACRO odd_egg_prob
	DEF odd_egg_prob_total += \1
	dw odd_egg_prob_total * $ffff / 100
ENDM

OddEggProbabilities:
; entries correspond to OddEggs pairs (below)
	table_width 2
; Pikachu
	odd_egg_prob 12
	odd_egg_prob  2
; Chinchou
	odd_egg_prob 12
	odd_egg_prob  2
; Sneasel
	odd_egg_prob 12
	odd_egg_prob  2
; Swinub
	odd_egg_prob 12
	odd_egg_prob  2
; Houndour
	odd_egg_prob 12
	odd_egg_prob  2
; Chansey
	odd_egg_prob 13
	odd_egg_prob  2
; Tyrogue
	odd_egg_prob 13
	odd_egg_prob  2
	assert_table_length NUM_ODD_EGGS
	assert odd_egg_prob_total == 100, "OddEggProbabilities sum to {d:odd_egg_prob_total}%, not 100%!"

OddEggs:
; species followed by the four fixed moves
	table_width ODD_EGG_STRUCT_LENGTH
	db PIKACHU
	db THUNDERSHOCK, CHARM, SURF, 0
	db CHINCHOU
	db WATER_GUN, SUPERSONIC, LIGHT_SCREEN, 0
	db SNEASEL
	db SCRATCH, POWDER_SNOW, DIZZY_PUNCH, 0
	db SWINUB
	db TACKLE, MUD_SLAP, ICICLE_SPEAR, 0
	db HOUNDOUR
	db LEER, EMBER, ROAR, PURSUIT
	db CHANSEY
	db TACKLE, GROWL, DIZZY_PUNCH, 0
	db TYROGUE
	db TACKLE, FOCUS_ENERGY, FORESIGHT, DIZZY_PUNCH
	assert_table_length NUM_ODD_EGG_SPECIES
