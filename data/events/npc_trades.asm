MACRO npctrade
; dialog set, requested mon, offered mon, nickname,
; DVs: HP, Atk, Def, Spe, Sp.Atk, Sp.Def (each 0-15),
; shiny/nature, gender (MALE/FEMALE), item, OT ID, OT name, gender requested
; The personality high byte stores gender as GENDER_MASK for female, 0 for male.
; This fork's MALE/FEMALE constants are 0/1, so scale them into that bit here.
	db \1, \2, \3
	dname \4, NAME_LENGTH
	dn \5, \6, \7, \8, \9, \<10>
	db \<11>, \<12> * GENDER_MASK
	db \<13>
	dw \<14>
	dname \<15>, NAME_LENGTH
	db \<16>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH; Wanted      Given       Nickname    HP Atk Def Spe SpA SpD  Nature Gender  Held Item     OT ID  OT name   Condition
	npctrade TRADE_DIALOGSET_COLLECTOR, MAREEP, 	CORSOLA,    "Nemo",      9, 11, 10, 10, 15, 10, HARDY, FEMALE, SITRUS_BERRY, 48926, "Kyle",   TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     WOOPER,     MARILL,     "Mary",      7, 15, 11,  9,  8,  9, HARDY, MALE,   HONDEW_BERRY, 57031, "Stan",   TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, GROWLITHE,  SUNFLORA,   "Solfleur",  6,  6, 12, 11, 15, 12, HARDY, FEMALE, SUN_STONE,    37460, "Mike",   TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     SNUBBULL,   GRIMER,     "Frank",     9, 15, 11,  9, 14, 14, HARDY, MALE,   QUALOT_BERRY, 46210, "June",   TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    CHIKORITA,  CHARMANDER, "Lizzy",    12,  9,  9, 12, 15, 10, HARDY, MALE,   POMEG_BERRY,  00147, "Aizen",  TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    CYNDAQUIL,  SQUIRTLE,   "Umigame",   7,  9,  9, 11, 15, 12, HARDY, MALE,   POMEG_BERRY,  00147, "Aizen",  TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    TOTODILE,   BULBASAUR,  "Berny",     9, 11, 11, 14, 15, 14, HARDY, MALE,   POMEG_BERRY,  00147, "Aizen",  TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      MANTINE,    OCTILLERY,  "Okutank",   7, 10,  9, 14, 15, 10, HARDY, FEMALE, KELPSY_BERRY, 09874, "Serena", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     MILTANK,    SCIZOR,     "Hassam",   10, 15, 11,  6,  6, 14, HARDY, MALE,   SCOPE_LENS,   59189, "Tim",    TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    LEDIAN,     FORRETRESS, "Foretos",   9, 15, 14,  9,  4, 14, HARDY, MALE,   BERRY_JUICE,  62680, "Kai",    TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      KINGLER,    KINGDRA,    "Kaiba",     7,  9,  9, 15, 15,  9, HARDY, FEMALE, SITRUS_BERRY, 00283, "Emy",    TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "Natio",     6, 10, 11, 10, 15, 11, HARDY, FEMALE, LEPPA_BERRY,  15616, "Chris",  TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      PIDGEOT,    BLISSEY,    "Happinas",  6,  6,  6, 14, 15, 14, HARDY, FEMALE, LUCKY_EGG,    26491, "Kim",    TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, VILEPLUME,  NIDOKING,   "Nidoking",  9, 15, 10,  6, 10, 10, HARDY, MALE,   LUM_BERRY,    50082, "Forest", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES
