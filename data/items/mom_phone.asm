MACRO momitem
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MomItems_1:
	momitem      0,   500, MOM_ITEM, SUPER_POTION
	momitem      0,    90, MOM_ITEM, ANTIDOTE
	momitem      0,    90, MOM_ITEM, POKE_BALL
	momitem      0,   450, MOM_ITEM, ESCAPE_ROPE
	momitem      0,   250, MOM_ITEM, GREAT_BALL
.End

MomItems_2:
	momitem    900,   500, MOM_ITEM, SUPER_POTION
	momitem   4000,   270, MOM_ITEM, REPEL
	momitem   7000,  1000, MOM_ITEM, HYPER_POTION
	momitem  10000,  2000, MOM_ITEM, MOON_STONE
	momitem  15000,  2000, MOM_ITEM, SUN_STONE
	momitem  19000,  7600, MOM_ITEM, HP_UP
	momitem  30000, 11000, MOM_DOLL, DECO_SHELLDER_DOLL
	momitem  40000,  2500, MOM_ITEM, FULL_RESTORE
	momitem  50000,  8700, MOM_DOLL, PP_UP
	momitem 100000,  4000, MOM_DOLL, MAX_REVIVE
.End

	dt 0 ; unused
