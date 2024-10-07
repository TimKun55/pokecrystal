; npctrade struct members (see data/events/npc_trades.asm)
rsreset
DEF NPCTRADE_DIALOG   rb
DEF NPCTRADE_GIVEMON  rb
DEF NPCTRADE_GETMON   rb
DEF NPCTRADE_NICKNAME rb MON_NAME_LENGTH
DEF NPCTRADE_DVS      rw
DEF NPCTRADE_ITEM     rb
DEF NPCTRADE_OT_ID    rw
DEF NPCTRADE_OT_NAME  rb NAME_LENGTH
DEF NPCTRADE_GENDER   rb
                      rb_skip
DEF NPCTRADE_STRUCT_LENGTH EQU _RS

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_KYLE   ;  0	; VioletCity
	const NPC_TRADE_STAN   ;  1 ; AzaleaPokecenter1F
	const NPC_TRADE_MIKE   ;  2	; GoldenrodDeptStore5F
	const NPC_TRADE_JUNE   ;  3 ; GoldenrodUnderground
	const NPC_TRADE_SERENA ;  4	; EcruteakItemfinderHouse
	const NPC_TRADE_TIM    ;  5	; OlivineTimsHouse
	const NPC_TRADE_KAI    ;  6	; CianwoodMoveTutorHouse
	const NPC_TRADE_EMY    ;  7	; BlackthornEmysHouse
	const NPC_TRADE_CHRIS  ;  8	; PewterPokecenter1F
	const NPC_TRADE_KIM    ;  9	; Route14
	const NPC_TRADE_FOREST ; 10	; PowerPlant
DEF NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER
	const TRADE_GENDER_MALE
	const TRADE_GENDER_FEMALE

; TradeTexts indexes (see engine/events/npc_trade.asm)

; trade dialogs
	const_def
	const TRADE_DIALOG_INTRO
	const TRADE_DIALOG_CANCEL
	const TRADE_DIALOG_WRONG
	const TRADE_DIALOG_COMPLETE
	const TRADE_DIALOG_AFTER

; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_NEWBIE
	const TRADE_DIALOGSET_GIRL
