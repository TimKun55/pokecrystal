Fonts: ; used only for BANK(Fonts)

FontNormal:
INCBIN "gfx/font/normal.1bpp"

FontSerif:
INCBIN "gfx/font/serif.1bpp"

FontMicr:
INCBIN "gfx/font/micr.1bpp"

FontSmall:
INCBIN "gfx/font/small.1bpp"

FontBattleExtra:
INCBIN "gfx/font/font_battle_extra.2bpp"

Frames:
	table_width TEXTBOX_FRAME_TILES * LEN_1BPP_TILE
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
INCBIN "gfx/frames/9.1bpp"
	assert_table_length NUM_FRAMES

SummaryScreenPageTilesGFX:
INCBIN "gfx/summary/summary_tiles.2bpp"

EnemyHPBarBorderGFX:
INCBIN "gfx/battle/enemy_hp_bar_border.1bpp"

ExpBarGFX:
INCBIN "gfx/battle/expbar.2bpp"

TownMapGFX:
INCBIN "gfx/pokegear/town_map.2bpp.lz"

TextboxSpaceGFX:
; SummaryScreen_LoadTextboxSpaceGFX reads 2bpp; LoadFrame reads first half as 1bpp
INCBIN "gfx/font/space.2bpp"

MobilePhoneTilesGFX:
INCBIN "gfx/mobile/phone_tiles.2bpp"

INCLUDE "gfx/footprints.asm"
