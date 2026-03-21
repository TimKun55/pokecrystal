DefaultOptions:
; wOptions: fast text speed
	db TEXT_DELAY_FAST
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: normal
	db GBPRINTER_NORMAL
; wFontType: font normal
	db FONT_NORMAL
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT

	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
