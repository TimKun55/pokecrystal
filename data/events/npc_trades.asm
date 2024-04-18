MACRO npctrade
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	dw \8
	db \9, \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, GROWLITHE,  SUNFLORA,   "SUNFLORA@@@", $96, $66, SUN_STONE,    37460, "MIKE@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, MAREEP, 	CORSOLA,    "CORSOLA@@@@", $96, $66, SITRUS_BERRY, 48926, "KYLE@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     GIRAFARIG,  SCIZOR,     "SCIZOR@@@@@", $98, $88, SCOPE_LENS,   29189, "TIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      SEAKING,    KINGDRA,    "KINGDRA@@@@", $77, $66, SITRUS_BERRY, 00283, "EMY@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "XATU@@@@@@@", $96, $86, LEPPA_BERRY,  15616, "CHRIS@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      PIDGEOT,    BLISSEY,    "BLISSEY@@@@", $96, $66, SITRUS_BERRY, 26491, "KIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, VILEPLUME,  NIDOKING,   "NIDOKING@@@", $96, $66, LUM_BERRY,    50082, "FOREST@@@@@", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES
