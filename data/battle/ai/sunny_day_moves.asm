; AI_SMART encourages Sunny Day if it also knows these moves.

SunnyDayMoves:
; BUG: "Smart" AI does not encourage Sunny Day when it knows Solar Beam, Flame Wheel, or Moonlight during Sunny Day (see docs/bugs_and_glitches.md)
	db FIRE_PUNCH
	db EMBER
	db FLAMETHROWER
	db SOLARBEAM
	db FIRE_SPIN
	db FIRE_BLAST
	db FLAME_WHEEL
	db SACRED_FIRE
	db FLAME_CHARGE
	db HEAT_WAVE
	db -1 ; end