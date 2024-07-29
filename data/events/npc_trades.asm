MACRO npctrade
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	dw \8
	db \9, \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, GROWLITHE,  SUNFLORA,   "Sunflora@@@", $66, $96, SUN_STONE,    37460, "Mike@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, MAREEP, 	CORSOLA,    "Corsola@@@@", $86, $76, SITRUS_BERRY, 48926, "Kyle@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     GIRAFARIG,  SCIZOR,     "Scizor@@@@@", $98, $88, SCOPE_LENS,   29189, "Tim@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      SEAKING,    KINGDRA,    "Kingdra@@@@", $77, $66, SITRUS_BERRY, 00283, "Emy@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "Xatu@@@@@@@", $66, $96, LEPPA_BERRY,  15616, "Chris@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      PIDGEOT,    BLISSEY,    "Blissey@@@@", $66, $96, SITRUS_BERRY, 26491, "Kim@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, VILEPLUME,  NIDOKING,   "Nidoking@@@", $96, $66, LUM_BERRY,    50082, "Forest@@@@@", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES
