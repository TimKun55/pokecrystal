MACRO npctrade
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	dw \8
	db \9, \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, MAREEP, 	CORSOLA,    "Nemo@@@@@@@", $9b, $af, SITRUS_BERRY, 48926, "Kyle@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     WOOPER,     MARILL,     "Mary@@@@@@@", $f7, $a7, HONDEW_BERRY, 57031, "Stan@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, GROWLITHE,  SUNFLORA,   "Solfleur@@@", $66, $cf, SUN_STONE,    37460, "Mike@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     SNUBBULL,   GRIMER,     "Frank@@@@@@", $f9, $a9, QUALOT_BERRY, 46210, "June@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    CHIKORITA,  BULBASAUR,  "Berny@@@@@@", $9b, $bf, POMEG_BERRY,  00147, "Aizen@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    CYNDAQUIL,  CHARMANDER, "Lizzy@@@@@@", $c9, $9f, POMEG_BERRY,  00147, "Aizen@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    TOTODILE,   SQUIRTLE,   "Umigame@@@@", $79, $9f, POMEG_BERRY,  00147, "Aizen@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      MANTINE,    OCTILLERY,  "Okutank@@@@", $7a, $9f, KELPSY_BERRY, 09874, "Serena@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     MILTANK,    SCIZOR,     "Hassam@@@@@", $fa, $86, SCOPE_LENS,   59189, "Tim@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    LEDIAN,     FORRETRESS, "Foretos@@@@", $9f, $99, BERRY_JUICE,  62680, "Kai@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      SEAKING,    KINGDRA,    "Kaiba@@@@@@", $79, $9f, SITRUS_BERRY, 00283, "Emy@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "Natio@@@@@@", $6a, $bf, LEPPA_BERRY,  15616, "Chris@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      PIDGEOT,    BLISSEY,    "Happinas@@@", $66, $6f, LUCKY_EGG,    26491, "Kim@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, VILEPLUME,  NIDOKING,   "Nidoking@@@", $f9, $a6, LUM_BERRY,    50082, "Forest@@@@@", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES
