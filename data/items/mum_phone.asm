MACRO mumitem
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MumItems_1:
	mumitem      0,   500, MUM_ITEM, SUPER_POTION
	mumitem      0,    90, MUM_ITEM, ANTIDOTE
	mumitem      0,    90, MUM_ITEM, POKE_BALL
	mumitem      0,   450, MUM_ITEM, ESCAPE_ROPE
	mumitem      0,   250, MUM_ITEM, GREAT_BALL
.End

MumItems_2:
	mumitem    900,   500, MUM_ITEM, SUPER_POTION
	mumitem   4000,   270, MUM_ITEM, REPEL
	mumitem   7000,  1000, MUM_ITEM, HYPER_POTION
	mumitem  10000,  2000, MUM_ITEM, MOON_STONE
	mumitem  15000,  2000, MUM_ITEM, SUN_STONE
	mumitem  19000,  7600, MUM_ITEM, HP_UP
	mumitem  30000, 11000, MUM_DOLL, DECO_SHELLDER_DOLL
	mumitem  40000,  2500, MUM_ITEM, FULL_RESTORE
	mumitem  50000,  8700, MUM_DOLL, PP_UP
	mumitem 100000,  4000, MUM_DOLL, MAX_REVIVE
.End

	dt 0 ; unused
