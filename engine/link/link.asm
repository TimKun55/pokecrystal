LinkCommunications:
	call ClearBGPalettes
	ld c, 80
	call DelayFrames
	call ClearScreen
	call ClearSprites
	call UpdateSprites
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld c, 80
	call DelayFrames
	call ClearScreen
	call UpdateSprites
	call LoadStandardFont
	call LoadFontsBattleExtra
	farcall LinkComms_LoadPleaseWaitTextboxBorderGFX
	call WaitBGMap2
	hlcoord 3, 8
	ld b, 2
	ld c, 12
	ld d, h
	ld e, l
	farcall LinkTextbox2
	hlcoord 4, 10
	ld de, String_PleaseWait
	call PlaceString
	call SetTradeRoomBGPals
	call WaitBGMap2
	ld hl, wLinkByteTimeout
	assert LOW(SERIAL_LINK_BYTE_TIMEOUT) == 0
	xor a ; LOW(SERIAL_LINK_BYTE_TIMEOUT)
	ld [hli], a
	ld [hl], HIGH(SERIAL_LINK_BYTE_TIMEOUT)
Gen2ToGen2LinkComms:
	call ClearLinkData
	call Link_PrepPartyData_Gen2
	call FixDataForLinkTransfer
	call CheckLinkTimeout_Gen2
	ld a, [wScriptVar]
	and a
	jp z, LinkTimeout
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .player_1

	ld c, 3
	call DelayFrames
	xor a
	ldh [hSerialSend], a
	ld a, SC_INTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a

	call DelayFrame
	xor a
	ldh [hSerialSend], a
	ld a, SC_INTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a

.player_1
	ld de, MUSIC_NONE
	call PlayMusic
	vc_patch Wireless_net_delay_8
if DEF(_CRYSTAL11_VC)
	ld c, 26
else
	ld c, 3
endc
	vc_patch_end
	call DelayFrames
	xor a
	ldh [rIF], a
	ld a, IE_SERIAL
	ldh [rIE], a

	ld hl, wLinkBattleRNPreamble
	ld de, wOTLinkBattleRNData
	ld bc, SERIAL_RN_PREAMBLE_LENGTH + SERIAL_RNS_LENGTH
	vc_hook Wireless_ExchangeBytes_RNG_state
	call Serial_ExchangeBytes
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a

	ld hl, wLinkSendParty
	ld de, wLinkReceivedPartyData
	ld bc, wLinkSendPartyEnd - wLinkSendParty
	vc_hook Wireless_ExchangeBytes_party_structs
	call Serial_ExchangeBytes
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a ; wLinkReceivedPartyEnd

	ld hl, wPlayerPatchLists
	ld de, wOTPatchLists
	ld bc, SERIAL_PATCH_LIST_LENGTH
	vc_hook Wireless_ExchangeBytes_patch_lists
	call Serial_ExchangeBytes

	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jr nz, .not_trading
	ld hl, wLinkSendMail
	ld de, wLinkReceivedMail
	ld bc, wLinkSendMailEnd - wLinkSendMail
	vc_hook Wireless_ExchangeBytes_mail
	call ExchangeBytes
.not_trading

	xor a
	ldh [rIF], a
	ld a, IE_JOYPAD | IE_SERIAL | IE_TIMER | IE_VBLANK
	ldh [rIE], a
	ld de, MUSIC_NONE
	call PlayMusic

	call Link_CopyRandomNumbers

	ld hl, wLinkReceivedPartyData
	call Link_FindFirstNonControlCharacter_SkipZero
	ld de, wLinkPlayerPartyData
	ld bc, wLinkPlayerPartyDataEnd - wLinkPlayerPartyData
	call Link_CopyOTData

	ld de, wOTPatchLists
	ld hl, wLinkPlayerPatchedData
	ld c, 2 ; number of patch lists
.party_patch_loop
	ld a, [de]
	inc de
	and a
	jr z, .party_patch_loop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .party_patch_loop
	cp SERIAL_NO_DATA_BYTE
	jr z, .party_patch_loop
	cp SERIAL_PATCH_LIST_PART_TERMINATOR
	jr z, .next_patch_list
	push hl
	push bc
	ld b, 0
	dec a
	ld c, a
	add hl, bc
	ld a, SERIAL_NO_DATA_BYTE
	ld [hl], a
	pop bc
	pop hl
	jr .party_patch_loop

.next_patch_list
	ld hl, wLinkPlayerPatchedData + SERIAL_PATCH_DATA_SIZE
	dec c
	jr nz, .party_patch_loop

	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jp nz, .skip_mail

; if we're in Trade Center, process received raw mail data
	ld hl, wLinkReceivedMail
.find_mail_preamble
	ld a, [hli]
	cp SERIAL_MAIL_PREAMBLE_BYTE
	jr nz, .find_mail_preamble
.skip_mail_preamble
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .skip_mail_preamble
	cp SERIAL_MAIL_PREAMBLE_BYTE
	jr z, .skip_mail_preamble
	dec hl

	ld de, wLinkReceivedMailMessages
	ld bc, wLinkDataEnd - wLinkReceivedMail ; should be wLinkReceivedMailEnd - wLinkReceivedMail
	call CopyBytes

; Replace SERIAL_MAIL_REPLACEMENT_BYTE with SERIAL_NO_DATA_BYTE across all mail
; message bodies.
	ld hl, wLinkReceivedMailMessages
	ld bc, (MAIL_MSG_LENGTH + 1) * PARTY_LENGTH
.mail_body_patch_loop
	ld a, [hl]
	cp SERIAL_MAIL_REPLACEMENT_BYTE
	jr nz, .okay
	ld [hl], SERIAL_NO_DATA_BYTE
.okay
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .mail_body_patch_loop

	ld de, wLinkReceivedMailPatchSet
.mail_metadata_patch_loop
	ld a, [de]
	inc de
	cp SERIAL_PATCH_LIST_PART_TERMINATOR
	jr z, .start_copying_mail
	ld hl, wLinkReceivedMailMetadata
	dec a
	ld b, 0
	ld c, a
	add hl, bc
	ld [hl], SERIAL_NO_DATA_BYTE
	jr .mail_metadata_patch_loop

.start_copying_mail
	ld hl, wLinkReceivedMailMessages
	ld de, wLinkOTMail
	ld b, PARTY_LENGTH
.copy_mail_loop
	push bc
	ld bc, MAIL_MSG_LENGTH + 1
	call CopyBytes
	ld a, LOW(MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1))
	add e
	ld e, a
	ld a, HIGH(MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1))
	adc d
	ld d, a
	pop bc
	dec b
	jr nz, .copy_mail_loop

	ld de, wLinkOTMail
	ld b, PARTY_LENGTH
.copy_author_loop
	push bc
	ld a, LOW(MAIL_MSG_LENGTH + 1)
	add e
	ld e, a
	ld a, HIGH(MAIL_MSG_LENGTH + 1)
	adc d
	ld d, a
	ld bc, MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)
	call CopyBytes
	pop bc
	dec b
	jr nz, .copy_author_loop

	ld b, PARTY_LENGTH
	ld de, wLinkOTMail
.translate_mail_loop
	push bc
	push de
	farcall ParseMailLanguage
	ld a, c
	or a ; MAIL_LANG_ENGLISH
	jr z, .next
	sub MAIL_LANG_ITALIAN
	jr nc, .italian_spanish
	farcall ConvertEnglishMailToFrenchGerman
	jr .next

.italian_spanish
	cp (MAIL_LANG_SPANISH + 1) - MAIL_LANG_ITALIAN
	jr nc, .next
	farcall ConvertEnglishMailToSpanishItalian

.next
	pop de
	ld hl, MAIL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop bc
	dec b
	jr nz, .translate_mail_loop

	ld de, wLinkOTMailEnd
	xor a
	ld [de], a

.skip_mail
	ld hl, wLinkPlayerName
	ld de, wOTPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	ld de, wOTPartyCount
	ld bc, 1 + PARTY_LENGTH + 1
	call CopyBytes

	ld de, wOTPlayerID
	ld bc, 2
	call CopyBytes

	ld de, wOTPartyMons
	ld bc, wOTPartyDataEnd - wOTPartyMons
	call CopyBytes

	ld a, LOW(wOTPartyMonOTs)
	ld [wUnusedNamesPointer], a
	ld a, HIGH(wOTPartyMonOTs)
	ld [wUnusedNamesPointer + 1], a

	ld de, MUSIC_NONE
	call PlayMusic
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ld c, 66
	call z, DelayFrames
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr nz, .ready_to_trade
	ld a, [wLinkOtherPlayerGender]
	dec a
	jr z, .is_female
	ld a, CAL
	jr .done
.is_female
	ld a, LINK_KRIS
.done
	ld [wOtherTrainerClass], a
	call ClearScreen
	farcall Link_WaitBGMap

	ld hl, wOptions
	ld a, [hl]
	push af
	and 1 << STEREO
	or TEXT_DELAY_MED
	ld [hl], a
	ld hl, wOTPlayerName
	ld de, wOTClassName
	ld bc, NAME_LENGTH
	call CopyBytes
	call ReturnToMapFromSubmenu
	ld a, [wDisableTextAcceleration]
	push af
	ld a, 1
	ld [wDisableTextAcceleration], a
	ldh a, [rIE]
	push af
	ldh a, [rIF]
	push af
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	set B_IE_STAT, a
	ldh [rIE], a
	pop af
	ldh [rIF], a

	; LET'S DO THIS
	predef StartBattle

	ldh a, [rIF]
	ld h, a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ld a, h
	ldh [rIF], a
	pop af
	ld [wDisableTextAcceleration], a
	pop af
	ld [wOptions], a

	farcall LoadPokemonData
	jp ExitLinkCommunications

.ready_to_trade
	ld de, MUSIC_ROUTE_30
	call PlayMusic
	jp InitTradeMenuDisplay

LinkTimeout:
	ld de, .LinkTimeoutText
	ld b, 10
.loop
	call DelayFrame
	call LinkDataReceived
	dec b
	jr nz, .loop
	xor a
	ld [hld], a
	ld [hl], a
	ldh [hVBlank], a
	push de
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	push de
	ld d, h
	ld e, l
	farcall LinkTextbox2
	pop de
	pop hl
	bccoord 1, 14
	call PrintTextboxTextAt
	ld c, 15
	call FadeToWhite
	call ClearScreen
	ld b, CGB_GENERIC
	call GetCGBLayout
	call WaitBGMap2
	ret

.LinkTimeoutText:
	text_far _LinkTimeoutText
	text_end

ExchangeBytes:
; This is similar to Serial_ExchangeBytes,
; but without a SERIAL_PREAMBLE_BYTE check.
	ld a, TRUE
	ldh [hSerialIgnoringInitialData], a
.loop
	ld a, [hl]
	ldh [hSerialSend], a
	call Serial_ExchangeByte
	push bc
	ld b, a
	inc hl
	ld a, 48
.wait
	dec a
	jr nz, .wait
	ldh a, [hSerialIgnoringInitialData]
	and a
	ld a, b
	pop bc
	jr z, .load
	dec hl
	xor a
	ldh [hSerialIgnoringInitialData], a
	jr .loop

.load
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

String_PleaseWait:
	db "Please Wait!@"

ClearLinkData:
	ld hl, wLinkData
	ld bc, wLinkDataEnd - wLinkData
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

FixDataForLinkTransfer:
	ld hl, wLinkBattleRNPreamble
	ld a, SERIAL_PREAMBLE_BYTE
	ld b, SERIAL_RN_PREAMBLE_LENGTH
.preamble_loop
	ld [hli], a
	dec b
	jr nz, .preamble_loop

; Initialize random seed, making sure special bytes are omitted
	assert wLinkBattleRNPreamble + SERIAL_RN_PREAMBLE_LENGTH == wLinkBattleRNs
	ld b, SERIAL_RNS_LENGTH
.rn_loop
	call Random
	cp SERIAL_PREAMBLE_BYTE
	jr nc, .rn_loop
	ld [hli], a
	dec b
	jr nz, .rn_loop

; Clear the patch list
	ld hl, wPlayerPatchLists
	ld a, SERIAL_PREAMBLE_BYTE
rept SERIAL_PATCH_PREAMBLE_LENGTH
	ld [hli], a
endr
	ld b, SERIAL_PATCH_LIST_LENGTH
	xor a
.clear_loop
	ld [hli], a
	dec b
	jr nz, .clear_loop

; Loop through all the patchable link data
	ld hl, wLinkSendPartyPartyEnd
	ld de, wPlayerPatchLists + SERIAL_RNS_LENGTH
	lb bc, 0, 0
.patch_loop
; If we're processing the first patch area, check if we've reached the end
	inc c
	ld a, c
	cp SERIAL_PATCH_DATA_SIZE + 1
	jr z, .data1_done

	ld a, b
	dec a
	jr nz, .process
; If we're processing the second patch area, check if we've reached the end
	push bc
	ld b, 2 + PARTYMON_STRUCT_LENGTH * PARTY_LENGTH - SERIAL_PATCH_DATA_SIZE + 1
.got_size
	ld a, c
	cp b
	pop bc
	jr z, .data2_done

.process
; Replace the "no data" byte, and record it in the array
	inc hl
	ld a, [hl]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .patch_loop
	ld a, c
	ld [de], a
	inc de
	ld [hl], SERIAL_PATCH_REPLACEMENT_BYTE
	jr .patch_loop

.data1_done
	ld a, SERIAL_PATCH_LIST_PART_TERMINATOR
	ld [de], a
	inc de
	lb bc, 1, 0
	jr .patch_loop

.data2_done
	ld a, SERIAL_PATCH_LIST_PART_TERMINATOR
	ld [de], a
	ret

Link_PrepPartyData_Gen2:
	ld de, wLinkSendParty
	ld a, SERIAL_PREAMBLE_BYTE
	ld b, SERIAL_PREAMBLE_LENGTH
.preamble_loop
	ld [de], a
	inc de
	dec b
	jr nz, .preamble_loop

	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	ld hl, wPartyCount
	ld bc, 1 + PARTY_LENGTH + 1
	call CopyBytes

	ld hl, wPlayerID
	ld bc, 2
	call CopyBytes

	ld hl, wPartyMon1Species
	ld bc, PARTY_LENGTH * PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld hl, wPartyMonOTs
	ld bc, PARTY_LENGTH * NAME_LENGTH
	call CopyBytes

	ld hl, wPartyMonNicknames
	ld bc, PARTY_LENGTH * MON_NAME_LENGTH
	call CopyBytes

; Okay, we did all that.  Now, are we in the trade center?
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	ret nz

; Fill 5 bytes at wLinkSendMailPreamble with $20
	ld de, wLinkSendMail
	ld a, SERIAL_MAIL_PREAMBLE_BYTE
	call Link_CopyMailPreamble

; Copy all the mail messages to wLinkSendMailMessages
	ld a, BANK(sPartyMail)
	call OpenSRAM
	ld hl, sPartyMail
	ld b, PARTY_LENGTH
.message_loop
	push bc
	ld bc, MAIL_MSG_LENGTH + 1
	call CopyBytes
	ld bc, MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)
	add hl, bc
	pop bc
	dec b
	jr nz, .message_loop

; Copy the mail data to wLinkSendMailMetadata
	ld hl, sPartyMail
	ld b, PARTY_LENGTH
.metadata_loop
	push bc
	ld bc, MAIL_MSG_LENGTH + 1
	add hl, bc
	ld bc, MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)
	call CopyBytes
	pop bc
	dec b
	jr nz, .metadata_loop

; Translate the messages if necessary
	ld b, PARTY_LENGTH
	ld de, sPartyMail
	ld hl, wLinkSendMailMessages
.translate_loop
	push bc
	push hl
	push de
	push hl
	farcall ParseMailLanguage
	pop de
	ld a, c
	or a ; MAIL_LANG_ENGLISH
	jr z, .translate_next
	sub MAIL_LANG_ITALIAN
	jr nc, .italian_spanish
	farcall ConvertFrenchGermanMailToEnglish
	jr .translate_next
.italian_spanish
	cp (MAIL_LANG_SPANISH + 1) - MAIL_LANG_ITALIAN
	jr nc, .translate_next
	farcall ConvertSpanishItalianMailToEnglish
.translate_next
	pop de
	ld hl, MAIL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, MAIL_MSG_LENGTH + 1
	add hl, bc
	pop bc
	dec b
	jr nz, .translate_loop
	call CloseSRAM

; The SERIAL_NO_DATA_BYTE value isn't allowed anywhere in message text
	ld hl, wLinkSendMailMessages
	ld bc, (MAIL_MSG_LENGTH + 1) * PARTY_LENGTH
.message_patch_loop
	ld a, [hl]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .message_patch_skip
	ld [hl], SERIAL_MAIL_REPLACEMENT_BYTE
.message_patch_skip
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .message_patch_loop

; Calculate the patch offsets for the mail metadata
	ld hl, wLinkSendMailMetadata
	ld de, wLinkSendMailPatchSet
	ld b, (MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)) * PARTY_LENGTH
	ld c, 0
.metadata_patch_loop
	inc c
	ld a, [hl]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .metadata_patch_skip
	ld [hl], SERIAL_PATCH_REPLACEMENT_BYTE
	ld a, c
	ld [de], a
	inc de
.metadata_patch_skip
	inc hl
	dec b
	jr nz, .metadata_patch_loop
	ld a, SERIAL_PATCH_LIST_PART_TERMINATOR
	ld [de], a
	ret

Link_CopyMailPreamble:
; fill 5 bytes with the value of a, starting at de
	ld c, SERIAL_MAIL_PREAMBLE_LENGTH
.loop
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

Link_CopyOTData:
.loop
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .loop
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Link_CopyRandomNumbers:
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld hl, wOTLinkBattleRNData
	call Link_FindFirstNonControlCharacter_AllowZero
	ld de, wLinkBattleRNs
	ld c, SERIAL_RNS_LENGTH
.loop
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .loop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .loop
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

Link_FindFirstNonControlCharacter_SkipZero:
.loop
	ld a, [hli]
	and a
	jr z, .loop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .loop
	cp SERIAL_NO_DATA_BYTE
	jr z, .loop
	dec hl
	ret

Link_FindFirstNonControlCharacter_AllowZero:
.loop
	ld a, [hli]
	cp SERIAL_PREAMBLE_BYTE
	jr z, .loop
	cp SERIAL_NO_DATA_BYTE
	jr z, .loop
	dec hl
	ret

InitTradeMenuDisplay:
	call ClearScreen
	call LoadTradeScreenBorderGFX
	farcall InitTradeSpeciesList
	xor a
	ld hl, wOtherPlayerLinkMode
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 1
	ld [wMenuCursorY], a
	inc a
	ld [wPlayerLinkAction], a
	jp LinkTrade_PlayerPartyMenu

LinkTrade_OTPartyMenu:
	ld a, OTPARTYMON
	ld [wMonType], a
	ld a, PAD_A | PAD_UP | PAD_DOWN
	ld [wMenuJoypadFilter], a
	ld a, [wOTPartyCount]
	ld [w2DMenuNumRows], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 9
	ld [w2DMenuCursorInitY], a
	ld a, 6
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [wMenuCursorX], a
	ln a, 1, 0
	ld [w2DMenuCursorOffsets], a
	ld a, MENU_UNUSED_3
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a

LinkTradeOTPartymonMenuLoop:
	farcall LinkTradeMenu
	ld a, d
	and a
	jp z, LinkTradePartiesMenuMasterLoop
	bit B_PAD_A, a
	jr z, .not_a_button
	ld a, INIT_ENEMYOT_LIST
	ld [wInitListType], a
	callfar InitList
	ld hl, wOTPartyMon1Species
	farcall LinkMonSummaryScreen
	jp LinkTradePartiesMenuMasterLoop

.not_a_button
	bit B_PAD_UP, a
	jr z, .not_d_up
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wOTPartyCount]
	cp b
	jp nz, LinkTradePartiesMenuMasterLoop
	xor a
	ld [wMonType], a
	call HideCursor
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], ' '
	pop bc
	pop hl
	ld a, [wPartyCount]
	ld [wMenuCursorY], a
	jr LinkTrade_PlayerPartyMenu

.not_d_up
	bit B_PAD_DOWN, a
	jp z, LinkTradePartiesMenuMasterLoop
	jp LinkTradeOTPartymonMenuCheckCancel

LinkTrade_PlayerPartyMenu:
	farcall InitMG_Mobile_LinkTradePalMap
	xor a
	ld [wMonType], a
	ld a, PAD_A | PAD_UP | PAD_DOWN
	ld [wMenuJoypadFilter], a
	ld a, [wPartyCount]
	ld [w2DMenuNumRows], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 1
	ld [w2DMenuCursorInitY], a
	ld a, 6
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [wMenuCursorX], a
	ln a, 1, 0
	ld [w2DMenuCursorOffsets], a
	ld a, MENU_UNUSED_3
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	call WaitBGMap2

LinkTradePartymonMenuLoop:
	farcall LinkTradeMenu
	ld a, d
	and a
	jr nz, .check_joypad
	jp LinkTradePartiesMenuMasterLoop

.check_joypad
	bit B_PAD_A, a
	jr z, .not_a_button
	jp LinkTrade_TradeStatsMenu

.not_a_button
	bit B_PAD_DOWN, a
	jr z, .not_d_down
	ld a, [wMenuCursorY]
	dec a
	jp nz, LinkTradePartiesMenuMasterLoop
	ld a, OTPARTYMON
	ld [wMonType], a
	call HideCursor
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], ' '
	pop bc
	pop hl
	ld a, 1
	ld [wMenuCursorY], a
	jp LinkTrade_OTPartyMenu

.not_d_down
	bit B_PAD_UP, a
	jr z, LinkTradePartiesMenuMasterLoop
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wPartyCount]
	cp b
	jr nz, LinkTradePartiesMenuMasterLoop
	call HideCursor
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], ' '
	pop bc
	pop hl
	jp LinkTradePartymonMenuCheckCancel

LinkTradePartiesMenuMasterLoop:
	ld a, [wMonType]
	and a
	jp z, LinkTradePartymonMenuLoop ; PARTYMON
	jp LinkTradeOTPartymonMenuLoop  ; OTPARTYMON

LinkTrade_TradeStatsMenu:
	call LoadTilemapToTempTilemap
	ld a, [wMenuCursorY]
	push af
	hlcoord 0, 15
	ld b, 1
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 2, 16
	ld de, .String_Stats_Trade
	call PlaceString
	farcall Link_WaitBGMap

.joy_loop
	ld a, ' '
	ldcoord_a 11, 16
	ld a, PAD_A | PAD_B | PAD_RIGHT
	ld [wMenuJoypadFilter], a
	ld a, 1
	ld [w2DMenuNumRows], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 16
	ld [w2DMenuCursorInitY], a
	ld a, 1
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [wMenuCursorY], a
	ld [wMenuCursorX], a
	ln a, 2, 0
	ld [w2DMenuCursorOffsets], a
	xor a
	ld [w2DMenuFlags1], a
	ld [w2DMenuFlags2], a
	call ScrollingMenuJoypad
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit B_PAD_B, a
	jr z, .show_stats
.b_button
	pop af
	ld [wMenuCursorY], a
	call SafeLoadTempTilemapToTilemap
	jp LinkTrade_PlayerPartyMenu

.d_right
	ld a, ' '
	ldcoord_a 1, 16
	ld a, PAD_A | PAD_B | PAD_LEFT
	ld [wMenuJoypadFilter], a
	ld a, 1
	ld [w2DMenuNumRows], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 16
	ld [w2DMenuCursorInitY], a
	ld a, 11
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [wMenuCursorY], a
	ld [wMenuCursorX], a
	ln a, 2, 0
	ld [w2DMenuCursorOffsets], a
	xor a
	ld [w2DMenuFlags1], a
	ld [w2DMenuFlags2], a
	call ScrollingMenuJoypad
	bit B_PAD_LEFT, a
	jp nz, .joy_loop
	bit B_PAD_B, a
	jr nz, .b_button
	jr .try_trade

.show_stats
	pop af
	ld [wMenuCursorY], a
	ld a, INIT_PLAYEROT_LIST
	ld [wInitListType], a
	callfar InitList
	farcall LinkMonSummaryScreen
	call SafeLoadTempTilemapToTilemap
	hlcoord 6, 1
	lb bc, 6, 1
	ld a, ' '
	call LinkEngine_FillBox
	hlcoord 17, 1
	lb bc, 6, 1
	ld a, ' '
	call LinkEngine_FillBox
	jp LinkTrade_PlayerPartyMenu

.try_trade
	call PlaceHollowCursor
	pop af
	ld [wMenuCursorY], a
	dec a
	ld [wCurTradePartyMon], a
	ld [wPlayerLinkAction], a
	farcall PlaceWaitingTextAndSyncAndExchangeNybble
	ld a, [wOtherPlayerLinkMode]
	cp $f
	jp z, InitTradeMenuDisplay
	ld [wCurOTTradePartyMon], a
	call LinkTradePlaceArrow
	ld c, 100
	call DelayFrames
	farcall ValidateOTTrademon
	jr c, .abnormal
	farcall CheckAnyOtherAliveMonsForTrade
	jp nc, LinkTrade
	xor a
	ld [wUnusedLinkAction], a
	ld [wOtherPlayerLinkAction], a
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	farcall Link_WaitBGMap
	ld hl, .LinkTradeCantBattleText
	bccoord 1, 14
	call PrintTextboxTextAt
	jr .cancel_trade

.abnormal
	xor a
	ld [wUnusedLinkAction], a
	ld [wOtherPlayerLinkAction], a
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	farcall Link_WaitBGMap
	ld hl, .LinkAbnormalMonText
	bccoord 1, 14
	call PrintTextboxTextAt

.cancel_trade
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String_TooBadTheTradeWasCanceled
	call PlaceString
	ld a, $1
	ld [wPlayerLinkAction], a
	farcall PlaceWaitingTextAndSyncAndExchangeNybble
	ld c, 100
	call DelayFrames
	jp InitTradeMenuDisplay

.LinkTradeCantBattleText:
	text_far _LinkTradeCantBattleText
	text_end

.String_Stats_Trade:
	db "Stats     Trade@"

.LinkAbnormalMonText:
	text_far _LinkAbnormalMonText
	text_end

LinkTradeOTPartymonMenuCheckCancel:
	ld a, [wMenuCursorY]
	cp 1
	jp nz, LinkTradePartiesMenuMasterLoop
	call HideCursor

	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], ' '
	pop bc
	pop hl
	; fallthrough

LinkTradePartymonMenuCheckCancel:
.loop1
	ld a, '▶'
	ldcoord_a 9, 17
.loop2
	call JoyTextDelay
	ldh a, [hJoyLast]
	and a
	jr z, .loop2
	bit B_PAD_A, a
	jr nz, .a_button
	push af
	ld a, ' '
	ldcoord_a 9, 17
	pop af
	bit B_PAD_UP, a
	jr z, .d_up
	ld a, [wOTPartyCount]
	ld [wMenuCursorY], a
	jp LinkTrade_OTPartyMenu

.d_up
	ld a, $1
	ld [wMenuCursorY], a
	jp LinkTrade_PlayerPartyMenu

.a_button
	ld a, '▷'
	ldcoord_a 9, 17
	ld a, $f
	ld [wPlayerLinkAction], a
	farcall PlaceWaitingTextAndSyncAndExchangeNybble
	ld a, [wOtherPlayerLinkMode]
	cp $f
	jr nz, .loop1
	; fallthrough

ExitLinkCommunications:
	ld c, 15
	call FadeToWhite
	call ClearScreen
	ld b, CGB_GENERIC
	call GetCGBLayout
	call WaitBGMap2
	xor a
	ld [wUnusedLinkCommunicationByte], a
	xor a
	ldh [rSB], a
	ldh [hSerialSend], a
	ld a, SC_INTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
	vc_hook ExitLinkCommunications_ret
	ret

GSPlaceTradeScreenFooter: ; unreferenced
; Fill the screen footer with pattern tile
	hlcoord 0, 16
	ld a, $7e
	ld bc, 2 * SCREEN_WIDTH
	call ByteFill
; Clear out area for cancel string
	hlcoord 1, 16
	ld a, ' '
	ld bc, SCREEN_WIDTH - 2
	call ByteFill
; Place the string
	hlcoord 2, 16
	ld de, .CancelString
	jp PlaceString

.CancelString:
	db "Cancel@"

LinkTradePlaceArrow:
; Indicates which pokemon the other player has selected to trade
	ld a, [wOtherPlayerLinkMode]
	hlcoord 6, 9
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], '▷'
	ret

LinkEngine_FillBox:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

LinkTrade:
	xor a
	ld [wUnusedLinkAction], a
	ld [wOtherPlayerLinkAction], a
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	farcall Link_WaitBGMap
	ld a, [wCurTradePartyMon]
	ld hl, wPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wBufferTrademonNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, LinkAskTradeForText
	bccoord 1, 14
	call PrintTextboxTextAt
	call LoadStandardMenuHeader
	hlcoord 10, 7
	ld b, 3
	ld c, 7
	call LinkTextboxAtHL
	ld de, String_TradeCancel
	hlcoord 12, 8
	call PlaceString
	ld a, 8
	ld [w2DMenuCursorInitY], a
	ld a, 11
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 2
	ld [w2DMenuNumRows], a
	xor a
	ld [w2DMenuFlags1], a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, PAD_A  | PAD_B
	ld [wMenuJoypadFilter], a
	ld a, 1
	ld [wMenuCursorY], a
	ld [wMenuCursorX], a
	farcall Link_WaitBGMap
	call ScrollingMenuJoypad
	push af
	call Call_ExitMenu
	call WaitBGMap2
	pop af
	bit B_PAD_B, a
	jr nz, .canceled
	ld a, [wMenuCursorY]
	dec a
	jr z, .try_trade

.canceled
	ld a, $1
	ld [wPlayerLinkAction], a
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String_TooBadTheTradeWasCanceled
	call PlaceString
	farcall PlaceWaitingTextAndSyncAndExchangeNybble
	jp InitTradeMenuDisplay_Delay

.try_trade
	ld a, $2
	ld [wPlayerLinkAction], a
	farcall PlaceWaitingTextAndSyncAndExchangeNybble
	ld a, [wOtherPlayerLinkMode]
	dec a
	jr nz, .do_trade
; If we're here, the other player canceled the trade
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String_TooBadTheTradeWasCanceled
	call PlaceString
	jp InitTradeMenuDisplay_Delay

.do_trade
	ld hl, sPartyMail
	ld a, [wCurTradePartyMon]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(sPartyMail)
	call OpenSRAM
	ld d, h
	ld e, l
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	ld a, [wCurTradePartyMon]
	ld c, a
.copy_mail
	inc c
	ld a, c
	cp PARTY_LENGTH
	jr z, .copy_player_data
	push bc
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop bc
	jr .copy_mail

.copy_player_data
	ld hl, sPartyMail
	ld a, [wPartyCount]
	dec a
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld hl, wLinkOTMail
	ld a, [wCurOTTradePartyMon]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM

; Buffer player data
; nickname
	ld hl, wPlayerName
	ld de, wPlayerTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes
; species
	ld a, [wCurTradePartyMon]
	ld hl, wPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wPlayerTrademonSpecies], a
	push af
; OT name
	ld a, [wCurTradePartyMon]
	ld hl, wPartyMonOTs
	call SkipNames
	ld de, wPlayerTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
; ID
	ld hl, wPartyMon1ID
	ld a, [wCurTradePartyMon]
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonID], a
	ld a, [hl]
	ld [wPlayerTrademonID + 1], a
; DVs
	ld hl, wPartyMon1DVs
	ld a, [wCurTradePartyMon]
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonDVs], a
	ld a, [hl]
	ld [wPlayerTrademonDVs + 1], a
; caught data
	ld a, [wCurTradePartyMon]
	ld hl, wPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a

; Buffer other player data
; nickname
	ld hl, wOTPlayerName
	ld de, wOTTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes
; species
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wOTTrademonSpecies], a
; OT name
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartyMonOTs
	call SkipNames
	ld de, wOTTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
; ID
	ld hl, wOTPartyMon1ID
	ld a, [wCurOTTradePartyMon]
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonID], a
	ld a, [hl]
	ld [wOTTrademonID + 1], a
; DVs
	ld hl, wOTPartyMon1DVs
	ld a, [wCurOTTradePartyMon]
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
; caught data
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a

	ld a, [wCurTradePartyMon]
	ld [wCurPartyMon], a
	ld hl, wPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wCurTradePartyMon], a

	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	callfar RemoveMonFromParty
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, [wCurOTTradePartyMon]
	push af
	ld hl, wOTPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wCurOTTradePartyMon], a

	ld c, 100
	call DelayFrames
	call ClearTilemap
	call LoadFontsBattleExtra
	ld b, CGB_GENERIC
	call GetCGBLayout
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .player_2
	predef TradeAnimation
	jr .done_animation

.player_2
	predef TradeAnimationPlayer2

.done_animation
	pop af
	ld c, a
	ld [wCurPartyMon], a
	ld hl, wOTPartySpecies
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld hl, wOTPartyMon1Species
	ld a, c
	call GetPartyLocation
	ld de, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	predef AddTempmonToParty
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	callfar EvolvePokemon
	call ClearScreen
	call LoadTradeScreenBorderGFX
	call SetTradeRoomBGPals
	farcall Link_WaitBGMap

; Check if either of the Pokémon sent was a Mew or Celebi, and send a different
; byte depending on that. Presumably this would've been some prevention against
; illicit trade machines, but it doesn't seem like a very effective one.
; Removing this code breaks link compatibility with the vanilla gen2 games, but
; has otherwise no consequence.
	ld b, 1
	pop af
	ld c, a
	cp MEW
	jr z, .send_checkbyte
	ld a, [wCurPartySpecies]
	cp MEW
	jr z, .send_checkbyte
	ld b, 2
	ld a, c
	cp CELEBI
	jr z, .send_checkbyte
	ld a, [wCurPartySpecies]
	cp CELEBI
	jr z, .send_checkbyte

; Send the byte in a loop until the desired byte has been received.
	ld b, 0
.send_checkbyte
	ld a, b
	ld [wPlayerLinkAction], a
	push bc
	call Serial_PlaceWaitingTextAndSyncAndExchangeNybble
	pop bc
	ld a, b
	and a
	jr z, .save
	ld a, [wOtherPlayerLinkAction]
	cp b
	jr nz, .send_checkbyte

.save
	farcall SaveAfterLinkTrade
	ld c, 40
	call DelayFrames
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String_TradeCompleted
	call PlaceString
	farcall Link_WaitBGMap
	vc_hook Trade_save_game_end
	ld c, 50
	call DelayFrames
	jp Gen2ToGen2LinkComms

InitTradeMenuDisplay_Delay:
	ld c, 100
	call DelayFrames
	jp InitTradeMenuDisplay

String_TradeCancel:
	db   "Trade"
	next "Cancel@"

LinkAskTradeForText:
	text_far _LinkAskTradeForText
	text_end

String_TradeCompleted:
	db   "Trade completed!@"

String_TooBadTheTradeWasCanceled:
	db   "Too bad! The trade"
	next "was canceled!@"

LinkTextboxAtHL:
	ld d, h
	ld e, l
	farcall LinkTextbox
	ret

LoadTradeScreenBorderGFX:
	farcall _LoadTradeScreenBorderGFX
	ret

SetTradeRoomBGPals:
	farcall LoadTradeRoomBGPals ; just a nested farcall; so wasteful
	call SetDefaultBGPAndOBP
	ret

PlaceTradeScreenTextbox: ; unreferenced
	hlcoord 0, 0
	ld b, 6
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 0, 8
	ld b, 6
	ld c, 18
	call LinkTextboxAtHL
	farcall PlaceTradePartnerNamesAndParty
	ret

INCLUDE "engine/movie/trade_animation.asm"

WaitForOtherPlayerToExit:
	ld c, 3
	call DelayFrames
	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a
	xor a
	ldh [rSB], a
	ldh [hSerialReceive], a
	ld a, SC_INTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
	ld c, 3
	call DelayFrames
	xor a
	ldh [rSB], a
	ldh [hSerialReceive], a
	ld a, SC_EXTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_EXTERNAL
	ldh [rSC], a
	ld c, 3
	call DelayFrames
	xor a
	ldh [rSB], a
	ldh [hSerialReceive], a
	ldh [rSC], a
	ld c, 3
	call DelayFrames
	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a
	ldh a, [rIF]
	push af
	xor a
	ldh [rIF], a
	ld a, IE_DEFAULT
	ldh [rIE], a
	pop af
	ldh [rIF], a
	ld hl, wLinkTimeoutFrames
	xor a
	ld [hli], a
	ld [hl], a
	ldh [hVBlank], a
	ld [wLinkMode], a
	vc_hook Wireless_term_exit
	ret

SetBitsForLinkTradeRequest:
	ld a, CABLECLUBROOM_TRADECENTER
	ld [wPlayerLinkAction], a
	ld [wChosenCableClubRoom], a
	ret

SetBitsForBattleRequest:
	ld a, CABLECLUBROOM_COLOSSEUM
	ld [wPlayerLinkAction], a
	ld [wChosenCableClubRoom], a
	ret

WaitForLinkedFriend:
	ld a, [wPlayerLinkAction]
	and a
	jr z, .no_link_action
	ld a, USING_INTERNAL_CLOCK
	ldh [rSB], a
	xor a
	ldh [hSerialReceive], a
	ld a, SC_EXTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_EXTERNAL
	ldh [rSC], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.no_link_action
	ld a, $2
	ld [wLinkTimeoutFrames + 1], a
	ld a, $ff
	ld [wLinkTimeoutFrames], a
.loop
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .connected
	cp USING_EXTERNAL_CLOCK
	jr z, .connected
	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a
	ld a, USING_INTERNAL_CLOCK
	ldh [rSB], a
	xor a
	ldh [hSerialReceive], a
	ld a, SC_EXTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_EXTERNAL
; This vc_hook causes the Virtual Console to set [hSerialConnectionStatus] to
; USING_INTERNAL_CLOCK, which allows the player to proceed past the link
; receptionist's "Please wait." It assumes that hSerialConnectionStatus is at
; its original address.
	vc_hook Link_fake_connection_status
	vc_assert hSerialConnectionStatus == $ffcb, \
		"hSerialConnectionStatus is no longer located at 00:ffcb."
	vc_assert USING_INTERNAL_CLOCK == $02, \
		"USING_INTERNAL_CLOCK is no longer equal to $02."
	ldh [rSC], a
	ld a, [wLinkTimeoutFrames]
	dec a
	ld [wLinkTimeoutFrames], a
	jr nz, .not_done
	ld a, [wLinkTimeoutFrames + 1]
	dec a
	ld [wLinkTimeoutFrames + 1], a
	jr z, .done

.not_done
	ld a, USING_EXTERNAL_CLOCK
	ldh [rSB], a
	ld a, SC_INTERNAL
	ldh [rSC], a
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
	call DelayFrame
	jr .loop

.connected
	call LinkDataReceived
	call DelayFrame
	call LinkDataReceived
	ld c, 50
	call DelayFrames
	ld a, $1
	ld [wScriptVar], a
	ret

.done
	xor a
	ld [wScriptVar], a
	ret

CheckLinkTimeout_Receptionist:
	ld a, $1
	ld [wPlayerLinkAction], a
	ld hl, wLinkTimeoutFrames
	ld a, 3
	ld [hli], a
	xor a
	ld [hl], a
	call WaitBGMap
	ld a, $2
	ldh [hVBlank], a
	call DelayFrame
	call DelayFrame
	call Link_CheckCommunicationError
	xor a
	ldh [hVBlank], a
	ld a, [wScriptVar]
	and a
	ret nz
	jp Link_ResetSerialRegistersAfterLinkClosure

CheckLinkTimeout_Gen2:
; if wScriptVar = 0 on exit, link connection is closed
	ld a, $5
	ld [wPlayerLinkAction], a
	ld hl, wLinkTimeoutFrames
	ld a, 3
	ld [hli], a
	xor a
	ld [hl], a
	call WaitBGMap
	ld a, $2
	ldh [hVBlank], a
	call DelayFrame
	call DelayFrame
	call Link_CheckCommunicationError
	ld a, [wScriptVar]
	and a
	jr z, .exit

; Wait for ~$70000 cycles to give the other GB time to be ready
	ld bc, $ffff
.wait
	dec bc
	ld a, b
	or c
	jr nz, .wait

; If other GB is not ready at this point, disconnect due to timeout
	ld a, [wOtherPlayerLinkMode]
	cp $5
	jr nz, .timeout

; Another check to increase reliability
	ld a, $6
	ld [wPlayerLinkAction], a
	ld hl, wLinkTimeoutFrames
	vc_patch Wireless_net_delay_9
if DEF(_CRYSTAL11_VC)
	ld a, $3
else
	ld a, 1
endc
	vc_patch_end
	ld [hli], a
	ld [hl], 50
	call Link_CheckCommunicationError
	ld a, [wOtherPlayerLinkMode]
	cp $6
	jr z, .exit

.timeout
	xor a
	ld [wScriptVar], a
	ret

.exit
	xor a
	ldh [hVBlank], a
	ret

Link_CheckCommunicationError:
	xor a
	ldh [hSerialReceivedNewData], a
	vc_hook Wireless_prompt
	ld a, [wLinkTimeoutFrames]
	ld h, a
	ld a, [wLinkTimeoutFrames + 1]
	ld l, a
	push hl
	call .CheckConnected
	pop hl
	jr nz, .load_true
	call .AcknowledgeSerial
	call .ConvertDW
	call .CheckConnected
	jr nz, .load_true
	call .AcknowledgeSerial
	xor a ; FALSE
	jr .done

.load_true
	ld a, TRUE

.done
	ld [wScriptVar], a
	ld hl, wLinkTimeoutFrames
	xor a
	ld [hli], a
	ld [hl], a
	ret

.CheckConnected:
	call WaitLinkTransfer
	ld hl, wLinkTimeoutFrames
	vc_hook Wireless_net_recheck
	ld a, [hli]
	inc a
	ret nz
	ld a, [hl]
	inc a
	ret

.AcknowledgeSerial:
	vc_patch Wireless_net_delay_7
if DEF(_CRYSTAL11_VC)
	ld b, 26
else
	ld b, 10
endc
	vc_patch_end
.loop
	call DelayFrame
	call LinkDataReceived
	dec b
	jr nz, .loop
	ret

.ConvertDW:
	; [wLinkTimeoutFrames] = ((hl - $100) / 4) + $100
	;                      = (hl / 4) + $c0
	dec h
	srl h
	rr l
	srl h
	rr l
	inc h
	ld a, h
	ld [wLinkTimeoutFrames], a
	ld a, l
	ld [wLinkTimeoutFrames + 1], a
	ret

TryQuickSave:
	ld a, [wChosenCableClubRoom]
	push af
	farcall Link_SaveGame
	vc_hook Wireless_TryQuickSave_block_input_1
	ld a, TRUE
	jr nc, .return_result
	vc_hook Wireless_TryQuickSave_block_input_2
	xor a ; FALSE
.return_result
	ld [wScriptVar], a
	pop af
	ld [wChosenCableClubRoom], a
	ret

CheckOtherPlayerGender:
	ld a, [wPlayerGender]
	call Link_EnsureSync
	push af
	call LinkDataReceived
	call DelayFrame
	call LinkDataReceived
	pop af
	ld [wLinkOtherPlayerGender], a
	ret

CheckBothSelectedSameRoom:
	ld a, [wChosenCableClubRoom]
	call Link_EnsureSync
	push af
	call LinkDataReceived
	call DelayFrame
	call LinkDataReceived
	pop af
	ld b, a
	ld a, [wChosenCableClubRoom]
	cp b
	jr nz, .fail
	ld a, [wChosenCableClubRoom]
	inc a
	ld [wLinkMode], a
	xor a
	ldh [hVBlank], a
	ld a, TRUE
	ld [wScriptVar], a
	ret

.fail
	xor a ; FALSE
	ld [wScriptVar], a
	ret

TradeCenter:
	vc_hook Wireless_TradeCenter
	ld a, LINK_TRADECENTER
	ld [wLinkMode], a
	call DisableSpriteUpdates
	callfar LinkCommunications
	call EnableSpriteUpdates
	xor a
	ldh [hVBlank], a
	ret

Colosseum:
	vc_hook Wireless_Colosseum
	ld a, LINK_COLOSSEUM
	ld [wLinkMode], a
	call DisableSpriteUpdates
	callfar LinkCommunications
	call EnableSpriteUpdates
	xor a
	ldh [hVBlank], a
	ret

CloseLink:
	xor a
	ld [wLinkMode], a
	ld c, 3
	call DelayFrames
	vc_hook Wireless_room_check
	jp Link_ResetSerialRegistersAfterLinkClosure

FailedLinkToPast:
	ld c, 40
	call DelayFrames
	ld a, $e
	jp Link_EnsureSync

Link_ResetSerialRegistersAfterLinkClosure:
	ld c, 3
	call DelayFrames
	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a
	ld a, USING_INTERNAL_CLOCK
	ldh [rSB], a
	xor a
	ldh [hSerialReceive], a
	ldh [rSC], a
	ret

Link_EnsureSync:
	add $d0
	ld [wLinkPlayerSyncBuffer], a
	ld [wLinkPlayerSyncBuffer + 1], a
	ld a, $2
	ldh [hVBlank], a
	call DelayFrame
	call DelayFrame
.receive_loop
	call Serial_ExchangeSyncBytes
	ld a, [wLinkReceivedSyncBuffer]
	ld b, a
	and $f0
	cp $d0
	jr z, .done
	ld a, [wLinkReceivedSyncBuffer + 1]
	ld b, a
	and $f0
	cp $d0
	jr nz, .receive_loop

.done
	xor a
	ldh [hVBlank], a
	ld a, b
	and $f
	ret

CableClubCheckWhichPlayer:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	ld a, TRUE
	jr z, .yes
	dec a ; FALSE

.yes
	ld [wScriptVar], a
	ret

GSLinkCommsBorderGFX: ; unreferenced
INCBIN "gfx/trade/unused_gs_border_tiles.2bpp"

CheckSRAM0Flag: ; unreferenced
; input: hl = unknown flag array in "SRAM Bank 0"
	ld a, BANK("SRAM Bank 0")
	call OpenSRAM
	ld d, 0
	ld b, CHECK_FLAG
	predef SmallFarFlagAction
	call CloseSRAM
	ld a, c
	and a
	ret
ValidateOTTrademon:
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartyMon1Species
	call GetPartyLocation
	push hl
	ld a, [wCurOTTradePartyMon]
	inc a
	ld c, a
	ld b, 0
	ld hl, wOTPartyCount
	add hl, bc
	ld a, [hl]
	pop hl
	cp EGG
	jr z, .matching_or_egg
	cp [hl]
	jr nz, .abnormal

.matching_or_egg
	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL + 1
	jr nc, .abnormal
.normal
	and a
	ret

.abnormal
	scf
	ret

CheckAnyOtherAliveMonsForTrade:
	ld a, [wCurTradePartyMon]
	ld d, a
	ld a, [wPartyCount]
	ld b, a
	ld c, 0
.loop
	ld a, c
	cp d
	jr z, .next
	push bc
	ld a, c
	ld hl, wPartyMon1HP
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .done

.next
	inc c
	dec b
	jr nz, .loop
	ld a, [wCurOTTradePartyMon]
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	jr nz, .done
	scf
	ret

.done
	and a
	ret

PlaceTradePartnerNamesAndParty:
	hlcoord 4, 0
	ld de, wPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 4, 8
	ld de, wOTPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, wPartySpecies
	call .PlaceSpeciesNames
	hlcoord 7, 9
	ld de, wOTPartySpecies
.PlaceSpeciesNames:
	ld c, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wNamedObjectIndex], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ldh [hProduct], a
	call GetPokemonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	jr .loop

