SpriteAnimFrameData:
; entries correspond to SPRITE_ANIM_FRAMESET_* constants (see constants/sprite_anim_constants.asm)
	table_width 2
	dw .Frameset_00
	dw .Frameset_PartyMon
	dw .Frameset_PartyMonWithMail
	dw .Frameset_PartyMonWithItem
	dw .Frameset_PartyMonFast
	dw .Frameset_PartyMonWithMailFast
	dw .Frameset_PartyMonWithItemFast
	dw .Frameset_TextEntryCursor
	dw .Frameset_TextEntryCursorBig
	dw .Frameset_GameFreakLogo
	dw .Frameset_SlotsGolem
	dw .Frameset_SlotsChansey
	dw .Frameset_SlotsChansey2
	dw .Frameset_SlotsEgg
	dw .Frameset_RedWalk
	dw .Frameset_StillCursor
	dw .Frameset_TradePokeBall
	dw .Frameset_TradePokeBallWobble
	dw .Frameset_TradePoof
	dw .Frameset_TradeTubeBulge
	dw .Frameset_TrademonIcon
	dw .Frameset_TrademonBubble
	dw .Frameset_EvolutionBallOfLight
	dw .Frameset_RadioTuningKnob
	dw .Frameset_MagnetTrainRed
	dw .Frameset_Unused1C
	dw .Frameset_Leaf
	dw .Frameset_CutTree
	dw .Frameset_EggCrack
	dw .Frameset_EggHatch1
	dw .Frameset_EggHatch2
	dw .Frameset_EggHatch3
	dw .Frameset_EggHatch4
	dw .Frameset_HeadbuttTree
	dw .Frameset_BlueWalk
	dw .Frameset_MagnetTrainBlue
	dw .Frameset_IntroSuicune
	dw .Frameset_IntroSuicune2
	dw .Frameset_IntroPichu
	dw .Frameset_IntroWooper
	dw .Frameset_IntroUnown1
	dw .Frameset_IntroUnown2
	dw .Frameset_IntroUnown3
	dw .Frameset_IntroUnown4
	dw .Frameset_IntroUnownF2
	dw .Frameset_IntroSuicuneAway
	dw .Frameset_IntroUnownF
	dw .Frameset_CelebiLeft
	dw .Frameset_CelebiRight
	dw .Frameset_PCCursor
	dw .Frameset_PCCursorItem
	dw .Frameset_PCQuick
	dw .Frameset_PCMode
	dw .Frameset_PCMode2
	dw .Frameset_PCPack
	dw .Frameset_SlotsCoverWhite
	dw .Frameset_SlotsCoverGreen
	dw .Frameset_Surf_Pikachu
	dw .Frameset_Surf_Angle_00
	dw .Frameset_Surf_Angle_01
	dw .Frameset_Surf_Angle_02
	dw .Frameset_Surf_Angle_03
	dw .Frameset_Surf_Angle_04
	dw .Frameset_Surf_Angle_05
	dw .Frameset_Surf_Angle_06
	dw .Frameset_Surf_Angle_07
	dw .Frameset_Surf_Angle_08
	dw .Frameset_Surf_Angle_09
	dw .Frameset_Surf_Angle_10
	dw .Frameset_Surf_Angle_11
	dw .Frameset_Surf_Angle_12
	dw .Frameset_Surf_Angle_13
	dw .Frameset_Surf_ResultsPikachu
	dw .Frameset_Surf_LargeSplash
	dw .Frameset_Surf_StartText
	dw .Frameset_Surf_OhNoText
	dw .Frameset_Surf_WaterSpray
	dw .Frameset_Surf_Plus50
	dw .Frameset_Surf_Plus150
	dw .Frameset_Surf_Plus350
	dw .Frameset_Surf_Plus750
	dw .Frameset_Surf_Plus180
	dw .Frameset_Surf_Plus500
	dw .Frameset_Surf_IntroPikachu
	assert_table_length NUM_SPRITE_ANIM_FRAMESETS

.Frameset_00:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1, 32
	oamend

.Frameset_PartyMon:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_2,  8
	oamrestart

.Frameset_PartyMonWithMail:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	oamrestart

.Frameset_PartyMonWithItem:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	oamrestart

.Frameset_PartyMonFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_2,  4
	oamrestart

.Frameset_PartyMonWithMailFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  4
	oamrestart

.Frameset_PartyMonWithItemFast:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  4
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  4
	oamrestart

.Frameset_RedWalk:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8, B_OAM_XFLIP
	oamrestart

.Frameset_BlueWalk:
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_BLUE_WALK_2,  8, B_OAM_XFLIP
	oamrestart

.Frameset_MagnetTrainBlue:
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_BLUE_2,  8, B_OAM_XFLIP
	oamrestart

.Frameset_TextEntryCursor:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	oamwait 1
	oamrestart

.Frameset_TextEntryCursorBig:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	oamwait 1
	oamrestart

.Frameset_GameFreakLogo:
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,   1
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,   1
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1,  12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2,  12
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4,  32
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5,   3
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6,   3
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9,   4
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10, 10
	oamframe SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11,  7
	oamend

.Frameset_SlotsGolem:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7, B_OAM_XFLIP
	oamrestart

.Frameset_SlotsChansey:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3,  7
	oamrestart

.Frameset_SlotsChansey2:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamend

.Frameset_SlotsEgg:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_EGG, 20
	oamend

.Frameset_StillCursor:
	oamframe SPRITE_ANIM_OAMSET_STILL_CURSOR, 32
	oamend

.Frameset_TradePokeBall:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1, 32
	oamend

.Frameset_TradePokeBallWobble:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamrestart

.Frameset_TradePoof:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_1,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_2,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_3,  4
	oamdelete

.Frameset_TradeTubeBulge:
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
	oamrestart

.Frameset_TrademonIcon:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_1,  7
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_2,  7
	oamrestart

.Frameset_TrademonBubble:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE, 32
	oamend

.Frameset_EvolutionBallOfLight:
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamend

.Frameset_RadioTuningKnob:
	oamframe SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB, 32
	oamend

.Frameset_MagnetTrainRed:
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8, B_OAM_XFLIP
	oamrestart

.Frameset_Unknown1: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_43,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_44,  8
	oamrestart

.Frameset_Unknown2: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_45,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_46,  8
	oamrestart

.Frameset_Unknown3: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_47,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_48,  8
	oamrestart

.Frameset_Unknown4: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, B_OAM_YFLIP
	oamrestart

.Frameset_Unknown5: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4A, 32
	oamend

.Frameset_Unknown6: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4B, 32
	oamend

.Frameset_Unknown7: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4C, 32
	oamend

.Frameset_Unknown8: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4D, 32
	oamend

.Frameset_Unknown9: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4E,  3
	oamwait 3
	oamrestart

.Frameset_Unused1C:
	oamwait 32
	oamend

.Frameset_Leaf:
	oamframe SPRITE_ANIM_OAMSET_LEAF, 32
	oamend

.Frameset_CutTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,      2
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	oamdelete

.Frameset_EggCrack:
	oamframe SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	oamend

.Frameset_EggHatch1:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32
	oamend

.Frameset_EggHatch2:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, B_OAM_XFLIP
	oamend

.Frameset_EggHatch3:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, B_OAM_YFLIP
	oamend

.Frameset_EggHatch4:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, B_OAM_XFLIP, B_OAM_YFLIP
	oamend

.Frameset_HeadbuttTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,           2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	oamframe SPRITE_ANIM_OAMSET_TREE_1,           2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2, B_OAM_XFLIP
	oamrestart

.Frameset_IntroSuicune:
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4,  3
	oamrestart

.Frameset_IntroSuicune2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1,  7
	oamend

.Frameset_IntroPichu:
	oamframe SPRITE_ANIM_OAMSET_INTRO_PICHU_1, 32
	oamframe SPRITE_ANIM_OAMSET_INTRO_PICHU_2,  7
	oamframe SPRITE_ANIM_OAMSET_INTRO_PICHU_3,  7
	oamend

.Frameset_IntroWooper:
	oamframe SPRITE_ANIM_OAMSET_INTRO_WOOPER,  3
	oamend

.Frameset_IntroUnown1:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7
	oamdelete

.Frameset_IntroUnown2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, B_OAM_XFLIP
	oamdelete

.Frameset_IntroUnown3:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, B_OAM_YFLIP
	oamdelete

.Frameset_IntroUnown4:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_1,  3, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_2,  3, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_3,  7, B_OAM_XFLIP, B_OAM_YFLIP
	oamdelete

.Frameset_IntroUnownF2:
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3,  3
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4,  7
	oamframe SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5,  7
	oamend

.Frameset_IntroSuicuneAway:
	oamframe SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY,  3
	oamend

.Frameset_IntroUnownF:
	oamwait 0
	oamend

.Frameset_CelebiLeft:
	oamframe SPRITE_ANIM_OAMSET_CELEBI_1,  8
	oamframe SPRITE_ANIM_OAMSET_CELEBI_2,  8
	oamend

.Frameset_CelebiRight:
	oamframe SPRITE_ANIM_OAMSET_CELEBI_1,  8, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_CELEBI_2,  8, B_OAM_XFLIP
	oamend

.Frameset_PCCursor:
	oamframe SPRITE_ANIM_OAMSET_PC_CURSOR, 32
	oamrestart

.Frameset_PCCursorItem:
	; Conditionally switched to when dealing with items
	oamframe SPRITE_ANIM_OAMSET_PC_CURSOR_ITEM, 32
	oamrestart

.Frameset_PCQuick:
	oamframe SPRITE_ANIM_OAMSET_PC_QUICK, 8
	oamdelete

.Frameset_PCMode:
	oamframe SPRITE_ANIM_OAMSET_PC_MODE, 32
	oamrestart

.Frameset_PCMode2:
	oamframe SPRITE_ANIM_OAMSET_PC_MODE2, 32
	oamrestart

.Frameset_PCPack:
	oamframe SPRITE_ANIM_OAMSET_PC_PACK, 32
	oamrestart

.Frameset_SlotsCoverWhite:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_COVER_WHITE, 1
	oamend

.Frameset_SlotsCoverGreen:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_COVER_GREEN, 1
	oamend
; Surfing Pikachu framesets (appended)

.Frameset_Surf_Pikachu:
	oamframe SPRITE_ANIM_OAMSET_SURF_PIKACHU, 8
	oamrestart

.Frameset_Surf_Angle_00:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_00, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_01, 8
	oamrestart

.Frameset_Surf_Angle_01:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_02, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_03, 8
	oamrestart

.Frameset_Surf_Angle_02:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_04, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_05, 8
	oamrestart

.Frameset_Surf_Angle_03:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_06, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_07, 8
	oamrestart

.Frameset_Surf_Angle_04:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_08, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_09, 8
	oamrestart

.Frameset_Surf_Angle_05:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_10, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_11, 8
	oamrestart

.Frameset_Surf_Angle_06:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_12, 8
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_13, 8
	oamrestart

.Frameset_Surf_Angle_07:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_00, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_01, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_Angle_08:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_02, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_03, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_Angle_09:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_04, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_05, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_Angle_10:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_06, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_07, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_Angle_11:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_08, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_09, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_Angle_12:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_10, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_11, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_Angle_13:
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_12, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SURF_ANGLE_13, 8, B_OAM_XFLIP, B_OAM_YFLIP
	oamrestart

.Frameset_Surf_ResultsPikachu:
	oamframe SPRITE_ANIM_OAMSET_SURF_RESULTS_PIKACHU_1, 7
	oamframe SPRITE_ANIM_OAMSET_SURF_RESULTS_PIKACHU_2, 7
	oamrestart

.Frameset_Surf_LargeSplash:
	oamframe SPRITE_ANIM_OAMSET_SURF_SMALL_SPLASH, 2
	oamframe SPRITE_ANIM_OAMSET_SURF_LARGE_SPLASH, 2
	oamwait 8
	oamframe SPRITE_ANIM_OAMSET_SURF_EMPTY_BOARD, 2
	oamend

.Frameset_Surf_StartText:
	oamframe SPRITE_ANIM_OAMSET_SURF_START_TEXT, 32
	oamframe SPRITE_ANIM_OAMSET_SURF_START_TEXT, 32
	oamdelete

.Frameset_Surf_OhNoText:
	oamframe SPRITE_ANIM_OAMSET_SURF_OH_NO_TEXT, 32
	oamend

.Frameset_Surf_WaterSpray:
	oamframe SPRITE_ANIM_OAMSET_SURF_WATER_SPRAY, 1
	oamdelete

.Frameset_Surf_Plus50:
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_50, 4
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_50, 3
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_50, 2
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_50, 1
	oamdelete

.Frameset_Surf_Plus150:
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_150, 4
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_150, 3
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_150, 2
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_150, 1
	oamdelete

.Frameset_Surf_Plus350:
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_350, 4
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_350, 3
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_350, 2
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_350, 1
	oamdelete

.Frameset_Surf_Plus750:
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_750, 4
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_750, 3
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_750, 2
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_750, 1
	oamdelete

.Frameset_Surf_Plus180:
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_180, 4
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_180, 3
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_180, 2
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_180, 1
	oamdelete

.Frameset_Surf_Plus500:
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_500, 4
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_500, 3
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_500, 2
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_SURF_PLUS_500, 1
	oamdelete

.Frameset_Surf_IntroPikachu:
	oamframe SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU, 7
	oamframe SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU_2, 7
	oamframe SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU_3, 7
	oamframe SPRITE_ANIM_OAMSET_SURF_INTRO_PIKACHU_4, 7
	oamrestart
