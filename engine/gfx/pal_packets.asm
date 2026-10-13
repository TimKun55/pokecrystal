; Palette packet data shared by the CGB layout engine.
;
; Each table is a plain 4-entry list of predef palette indices, read
; sequentially with CopyPalettes.

PalPacket_BattleGrayscale:
	db PREDEFPAL_BLACKOUT
	db PREDEFPAL_BLACKOUT
	db PREDEFPAL_BLACKOUT
	db PREDEFPAL_BLACKOUT

PalPacket_PartyMenu:
	db PREDEFPAL_PARTY_ICON
	db PREDEFPAL_HP_GREEN
	db PREDEFPAL_HP_YELLOW
	db PREDEFPAL_HP_RED

PalPacket_Generic:
	db PREDEFPAL_DIPLOMA
	db PREDEFPAL_ROUTES
	db PREDEFPAL_ROUTES
	db PREDEFPAL_ROUTES

PalPacket_UnownPuzzle:
	db PREDEFPAL_UNOWN_PUZZLE
	db PREDEFPAL_UNOWN_PUZZLE
	db PREDEFPAL_UNOWN_PUZZLE
	db PREDEFPAL_UNOWN_PUZZLE
