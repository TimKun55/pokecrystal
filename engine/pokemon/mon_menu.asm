HasNoItems:
	ld a, [wNumItems]
	and a
	ret nz
	ld a, [wNumKeyItems]
	and a
	ret nz
	ld a, [wNumBalls]
	and a
	ret nz
	ld a, [wNumBerries]
	and a
	ret nz
	ld a, [wNumMedicines]
	and a
	ret nz	
	ld hl, wTMsHMs
	ld b, NUM_TMS + NUM_HMS
.loop
	ld a, [hli]
	and a
	jr nz, .done
	dec b
	jr nz, .loop
	scf
	ret
.done
	and a
	ret

TossItemFromPC:
	push de
	call PartyMonItemName
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .key_item
	ld hl, .ItemsTossOutHowManyText
	call MenuTextbox
	farcall SelectQuantityToToss
	push af
	call CloseWindow
	call ExitMenu
	pop af
	jr c, .quit
	ld hl, .ItemsThrowAwayText
	call MenuTextbox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	jr c, .quit
	pop hl
	ld a, [wCurItemQuantity]
	call TossItem
	call PartyMonItemName
	ld hl, .ItemsDiscardedText
	call MenuTextbox
	call ExitMenu
	and a
	ret

.key_item
	call .CantToss
.quit
	pop hl
	scf
	ret

.ItemsTossOutHowManyText:
	text_far _ItemsTossOutHowManyText
	text_end

.ItemsThrowAwayText:
	text_far _ItemsThrowAwayText
	text_end

.ItemsDiscardedText:
	text_far _ItemsDiscardedText
	text_end

.CantToss:
	ld hl, .ItemsTooImportantText
	call MenuTextboxBackup
	ret

.ItemsTooImportantText:
	text_far _ItemsTooImportantText
	text_end

CantUseItem:
	ld hl, ItemsOakWarningText
	call MenuTextboxWaitButton
	ret

ItemsOakWarningText:
	text_far _ItemsOakWarningText
	text_end

PartyMonItemName:
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyName1
	ret

CancelPokemonAction:
	farcall InitPartyMenuWithCancel
	farcall UnfreezeMonIcons
	ld a, 1
	ret

PokemonActionSubmenu:
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearBox
	farcall MonSubmenu
	call GetCurNickname
	ld a, [wMenuSelection]
	ld hl, .Actions
	ld de, 3
	call IsInArray
	jr nc, .nothing

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nothing
	ld a, 0
	ret

.Actions:
	dbw MONMENUITEM_CUT,         MonMenu_Cut
	dbw MONMENUITEM_FLY,         MonMenu_Fly
	dbw MONMENUITEM_SURF,        MonMenu_Surf
	dbw MONMENUITEM_STRENGTH,    MonMenu_Strength
	dbw MONMENUITEM_FLASH,       MonMenu_Flash
	dbw MONMENUITEM_WHIRLPOOL,   MonMenu_Whirlpool
	dbw MONMENUITEM_DIG,         MonMenu_Dig
	dbw MONMENUITEM_TELEPORT,    MonMenu_Teleport
	dbw MONMENUITEM_FRESH_SNACK, MonMenu_FreshSnack
	dbw MONMENUITEM_HEADBUTT,    MonMenu_Headbutt
	dbw MONMENUITEM_WATERFALL,   MonMenu_Waterfall
	dbw MONMENUITEM_ROCKSMASH,   MonMenu_RockSmash
	dbw MONMENUITEM_SWEETSCENT,  MonMenu_SweetScent
	dbw MONMENUITEM_SUMMARY,     OpenPartySummary
	dbw MONMENUITEM_SWITCH,      SwitchPartyMons
	dbw MONMENUITEM_ITEM,        GiveTakePartyMonItem
	dbw MONMENUITEM_CANCEL,      CancelPokemonAction
	dbw MONMENUITEM_MOVE,        ManagePokemonMoves
	dbw MONMENUITEM_MAIL,        MonMailAction

SwitchPartyMons:
; Don't try if there's nothing to switch!
	ld a, [wPartyCount]
	cp 2
	jr c, .DontSwitch

	ld a, [wCurPartyMon]
	inc a
	ld [wSwitchMon], a

	farcall HoldSwitchmonIcon
	farcall InitPartyMenuNoCancel

	ld a, PARTYMENUACTION_MOVE
	ld [wPartyMenuActionText], a
	farcall WritePartyMenuTilemap
	farcall PlacePartyMenuText

	hlcoord 0, 1
	ld bc, SCREEN_WIDTH * 2
	ld a, [wSwitchMon]
	dec a
	call AddNTimes
	ld [hl], "▷"
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame

	farcall PartyMenuSelect
	bit 1, b
	jr c, .DontSwitch

	farcall _SwitchPartyMons

	xor a
	ld [wPartyMenuActionText], a

	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

	ld a, 1
	ret

.DontSwitch:
	xor a
	ld [wPartyMenuActionText], a
	call CancelPokemonAction
	ret

GiveTakePartyMonItem:
; Eggs can't hold items!
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .cancel

	call GetPartyItemLocation
	ld a, [hl]
	and a
	ld de, .noItemString
	jr z, .not_holding_anything
	ld [wNamedObjectIndex], a
	call GetItemName
	ld de, wStringBuffer1
.not_holding_anything
	hlcoord 1, 16
	call PlaceString
	ld hl, GiveTakeItemMenuData
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	jr c, .cancel

	call GetCurNickname
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld a, [wMenuCursorY]
	cp 2 ; 2 = take
	jr z, .take
	cp 3 ; 3 = swap
	jr z, .swap
	; 1 = give

	call LoadStandardMenuHeader
	call ClearPalettes
	call .GiveItem
	call ClearPalettes
	call LoadFontsBattleExtra
	call ExitMenu
	ld a, 0
	ret

.take
	call TakePartyItem
	ld a, 3
	ret

.swap
	call SwapPartyItem
	ld a, 3
	ret

.cancel
	ld a, 3
	ret

.noItemString
	db "No held item@"

.GiveItem:
	call GetItemToGive
	ret z
	jp TryGiveItemToPartymon

.quit
	ret

GetItemToGive:
; Returns nz if we got an item to give.
	farcall DepositSellInitPackBuffers
	; fallthrough
_GetItemToGive:
.loop
	farcall DepositSellPack

	ld a, [wPackUsedItem]
	and a
	ret z

	ld a, [wCurPocket]
	cp KEY_ITEM_POCKET
	jr z, .next

	call CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .next

	or 1
	ret

.next
	ld hl, ItemCantHeldText
	call MenuTextboxBackup
	jr .loop

PCGiveItem:
	call DepositSellInitPackBuffers
.loop
	call _GetItemToGive
	ret z

	; Ensure that we aren't trying to give Mail to a Pokémon in storage.
	ld a, [wCurItem]
	ld d, a
	newfarcall ItemIsMail
	jr nc, .item_ok

	ld a, [wBufferMonBox]
	and a
	jr z, .item_ok

	ld hl, CantPlaceMailInStorageText
	call MenuTextboxBackup
	jr .loop

.item_ok
	call PartyMonItemName
	call GiveItemToPokemon

	ld hl, wBufferMonNickname
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	ld hl, PokemonHoldItemText
	call MenuTextboxBackup

	; Now, actually give the item.
	ld a, [wBufferMonSpecies]
	ld [wCurPartySpecies], a
	ld de, wCurItem
	ld a, [de]
	ld [wBufferMonItem], a
	newfarcall UpdateStorageBoxMonFromTemp

	; We know that if we're dealing with Mail, then we're giving to a partymon.
	; Thus, there's no harm in using party-specific code.
	ld a, [wBufferMonSlot]
	dec a
	ld [wCurPartyMon], a
	ld a, [wCurItem]
	ld d, a
	newfarcall ItemIsMail
	ret nc
	jp ComposeMailMessage

SwapPartyItem:
	ld a, [wPartyCount]
	cp 2
	jr c, .DontSwap
	ld a, [wCurPartyMon]
	inc a
	ld [wSwitchMon], a
	farcall HoldSwitchmonIcon
	farcall InitPartyMenuNoCancel
	ld a, 4
	ld [wPartyMenuActionText], a
	farcall WritePartyMenuTilemap
	farcall PlacePartyMenuText
	hlcoord 0, 1
	ld bc, 20 * 2
	ld a, [wSwitchMon]
	dec a
	call AddNTimes
	ld [hl], "▷"
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
	farcall PartyMenuSelect
	bit 1, b
	jr c, .DontSwap
	; wSwitchMon contains first selected pkmn
	; wCurPartyMon contains second selected pkmn
	; getting pkmn2 item and putting into stack item addr + item id
	call GetPartyItemLocation
	ld a, [hl] ; a pkmn2 contains item
	push hl
	push af
	; getting pkmn 1 item and putting item id into b
	ld a, [wSwitchMon]
	dec a
	ld [wCurPartyMon], a
	call GetPartyItemLocation
	ld a, [hl] ; a pkmn1 contains item
	ld b, a
	; actual swap
	pop af
	ld [hl], a ; pkmn1 get pkm2 item
	pop hl
	ld a, b
	ld [hl], a ; pkmn1 get pkm2 item
	xor a
	ld [wPartyMenuActionText], a
	jp CancelPokemonAction

.DontSwap
	xor a
	ld [wPartyMenuActionText], a
	jp CancelPokemonAction

TryGiveItemToPartymon:
	call SpeechTextbox
	call PartyMonItemName
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .give_item_to_mon

	push hl
	ld d, a
	farcall ItemIsMail
	pop hl
	jr c, .please_remove_mail
	ld a, [hl]
	jr .already_holding_item

.give_item_to_mon
	call GiveItemToPokemon
	ld hl, PokemonHoldItemText
	call MenuTextboxBackup
	call GivePartyItem
	ret

.please_remove_mail
	ld hl, PokemonRemoveMailText
	call MenuTextboxBackup
	ret

.already_holding_item
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, PokemonAskSwapItemText
	call StartMenuYesNo
	jr c, .abort

	call GiveItemToPokemon
	ld a, [wNamedObjectIndex]
	push af
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	pop af
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .bag_full

	ld hl, PokemonSwapItemText
	call MenuTextboxBackup
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	call GivePartyItem
	ret

.bag_full
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	ld hl, ItemStorageFullText
	call MenuTextboxBackup

.abort
	ret

GivePartyItem:
	call GetPartyItemLocation
	ld a, [wCurItem]
	ld [hl], a
	ld d, a
	farcall ItemIsMail
	jr nc, .done
	call ComposeMailMessage

.done
	ret

TakePartyItem:
	call SpeechTextbox
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .not_holding_item

	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .item_storage_full

	farcall ItemIsMail
	call GetPartyItemLocation
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld [hl], NO_ITEM
	call GetItemName
	ld hl, PokemonTookItemText
	call MenuTextboxBackup
	jr .done

.not_holding_item
	ld hl, PokemonNotHoldingText
	call MenuTextboxBackup
	jr .done

.item_storage_full
	ld hl, ItemStorageFullText
	call MenuTextboxBackup

.done
	ret

GiveTakeItemMenuData:
	db MENU_SPRITE_ANIMS | MENU_BACKUP_TILES ; flags
	menu_coords 13, 10, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .Items
	db 1 ; default option

.Items:
	db STATICMENU_CURSOR ; flags
	db 3 ; # items
	db "Give@"
	db "Take@"
	db "Swap@"

PokemonSwapItemText:
	text_far _PokemonSwapItemText
	text_end

PokemonHoldItemText:
	text_far _PokemonHoldItemText
	text_end

PokemonRemoveMailText:
	text_far _PokemonRemoveMailText
	text_end

PokemonNotHoldingText:
	text_far _PokemonNotHoldingText
	text_end

ItemStorageFullText:
	text_far _ItemStorageFullText
	text_end

PokemonTookItemText:
	text_far _PokemonTookItemText
	text_end

PokemonAskSwapItemText:
	text_far _PokemonAskSwapItemText
	text_end

ItemCantHeldText:
	text_far _ItemCantHeldText
	text_end

CantPlaceMailInStorageText:
	text_far _CantPlaceMailInStorageText
	text_end

GetPartyItemLocation:
	push af
	ld a, MON_ITEM
	call GetPartyParamLocation
	pop af
	ret

ReceiveItemFromPokemon:
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	jp ReceiveItem

GiveItemToPokemon:
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	jp TossItem

StartMenuYesNo:
	call MenuTextbox
	call YesNoBox
	jp ExitMenu

ComposeMailMessage:
	ld de, wTempMailMessage
	farcall _ComposeMailMessage
	ld hl, wPlayerName
	ld de, wTempMailAuthor
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld hl, wPlayerID
	ld bc, 2
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [de], a
	inc de
	ld a, [wCurItem]
	ld [de], a
	ld a, [wCurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wTempMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call OpenSRAM
	call CopyBytes
	call CloseSRAM
	ret

MonMailAction:
; If in the time capsule or trade center,
; selecting the mail only allows you to
; read the mail.
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .read
	cp LINK_TRADECENTER
	jr z, .read

; Show the READ/TAKE/QUIT menu.
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu

; Interpret the menu.
	ld a, $3
	ret c
	ld a, [wMenuCursorY]
	cp $1
	jr z, .read
	cp $2
	jr z, TakeMail
	ld a, $3
	ret

.read
	farcall ReadPartyMonMail
	xor a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 10, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Read@"
	db "Take@"
	db "Quit@"

TakeMail:
	ld hl, .MailAskSendToPCText
	call StartMenuYesNo
	jr c, .RemoveMailToBag
	ld a, [wCurPartyMon]
	ld b, a
	farcall SendMailToPC
	jr c, .MailboxFull
	ld hl, .MailSentToPCText
	call MenuTextboxBackup
	jr .TookMail

.MailboxFull:
	ld hl, .MailboxFullText
	call MenuTextboxBackup
	jr .KeptMail

.RemoveMailToBag:
	ld hl, .MailLoseMessageText
	call StartMenuYesNo
	jr c, .KeptMail
	call GetPartyItemLocation
	ld a, [hl]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .BagIsFull
	call GetPartyItemLocation
	ld [hl], $0
	call GetCurNickname
	ld hl, .MailDetachedText
	call MenuTextboxBackup
	; fallthrough
.TookMail:
	scf
	jr .done

.BagIsFull:
	ld hl, .MailNoSpaceText
	call MenuTextboxBackup
	; fallthrough
.KeptMail:
	and a
.done
	ld a, $3
	ret

.MailLoseMessageText:
	text_far _MailLoseMessageText
	text_end

.MailDetachedText:
	text_far _MailDetachedText
	text_end

.MailNoSpaceText:
	text_far _MailNoSpaceText
	text_end

.MailAskSendToPCText:
	text_far _MailAskSendToPCText
	text_end

.MailboxFullText:
	text_far _MailboxFullText
	text_end

.MailSentToPCText:
	text_far _MailSentToPCText
	text_end

OpenPartySummary:
; PartyMon
	xor a
	ld [wMonType], a
	; fallthrough
_OpenPartySummary:
	call LoadStandardMenuHeader
	call ClearSprites
	call LowVolume
	predef SummaryScreenInit
	call MaxVolume
	call Call_ExitMenu
	ld a, 0
	ret

MonMenu_Cut:
	farcall CutFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Fly:
	farcall FlyFunction
	ld a, [wFieldMoveSucceeded]
	cp $2
	jr z, .Fail
	cp $0
	jr z, .Error
	farcall StubbedTrainerRankings_Fly
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

.Error:
	ld a, $0
	ret

MonMenu_Flash:
	farcall FlashFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Strength:
	farcall StrengthFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Whirlpool:
	farcall WhirlpoolFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Waterfall:
	farcall WaterfallFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Teleport:
	farcall TeleportFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Surf:
	farcall SurfFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Dig:
	farcall DigFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_FreshSnack:
	call .CheckMonHasEnoughHP
	jr nc, .NotEnoughHP
	farcall FreshSnackFunction
	jr .finish

.NotEnoughHP:
	ld hl, .PokemonNotEnoughHPText
	call PrintText

.finish
	xor a
	ld [wPartyMenuActionText], a
	ld a, $3
	ret

.PokemonNotEnoughHPText:
	text_far _PokemonNotEnoughHPText
	text_end

.CheckMonHasEnoughHP:
; Need to have at least (MaxHP / 5) HP left.
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ldh [hDividend + 0], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ldh a, [hQuotient + 2]
	sbc [hl]
	ret

MonMenu_Headbutt:
	farcall HeadbuttFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_RockSmash:
	farcall RockSmashFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_SweetScent:
	farcall SweetScentFromMenu
	ld b, $4
	ld a, $2
	ret

ChooseMoveToDelete:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call ClearBGPalettes
	farcall LoadPartyMenuGFX
	call .ChooseMoveToDelete
	pop bc
	ld a, b
	ld [wOptions], a
	push af
	call ClearBGPalettes
	pop af
	ret

.ChooseMoveToDelete
	call SetUpMoveScreenBG
	ld de, DeleteMoveScreen2DMenuData
	call Load2DMenuData
	call SetUpMoveList
	ld hl, w2DMenuFlags1
	set 6, [hl]
	jr .enter_loop

.loop
	call ScrollingMenuJoypad
	bit B_BUTTON_F, a
	jp nz, .b_button
	bit A_BUTTON_F, a
	jp nz, .a_button

.enter_loop
	call PrepareToPlaceMoveData
	call PlaceMoveData
	jp .loop

.a_button
	and a
	jr .finish

.b_button
	scf

.finish
	push af
	xor a
	ld [wSwitchMon], a
	ld hl, w2DMenuFlags1
	res 6, [hl]
	call ClearSprites
	call ClearTilemap
	pop af
	ret

DeleteMoveScreen2DMenuData:
	db 3, 1 ; cursor start y, x
	db 3, 1 ; rows, columns
	db $40, $00 ; flags
	dn 2, 0 ; cursor offset
	db D_UP | D_DOWN | A_BUTTON | B_BUTTON ; accepted buttons

ManagePokemonMoves:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call MoveScreenLoop
	pop af
	ld [wOptions], a
	call ClearBGPalettes

.egg
	ld a, $0
	ret

MoveScreenLoop:
	ld a, [wCurPartyMon]
	inc a
	ld [wPartyMenuCursor], a
	call SetUpMoveScreenBG
	call PlaceMoveScreenArrows
	ld de, MoveScreen2DMenuData
	call Load2DMenuData
.loop
	call SetUpMoveList
	ld hl, w2DMenuFlags1
	set 6, [hl]
	jr .skip_joy

.joy_loop
	call ScrollingMenuJoypad
	bit 1, a
	jp nz, .b_button
	bit 0, a
	jp nz, .a_button
	bit 4, a
	jp nz, .d_right
	bit 5, a
	jp nz, .d_left

.skip_joy
	call PrepareToPlaceMoveData
	ld a, [wSwappingMove]
	and a
	jr nz, .moving_move
	call PlaceMoveData
	jp .joy_loop

.moving_move
	ld a, " "
	hlcoord 1, 12
	ld bc, 5
	call ByteFill
	hlcoord 1, 12
	lb bc, 5, 7
	call ClearBox
	hlcoord 1, 12
	lb bc, 5, SCREEN_WIDTH - 2
	call ClearBox
	hlcoord 2, 13
	ld de, String_MoveWhere
	call PlaceString
	jp .joy_loop
.b_button
	call PlayClickSFX
	call WaitSFX
	ld a, [wSwappingMove]
	and a
	jp z, .exit

	ld a, [wSwappingMove]
	ld [wMenuCursorY], a
	xor a
	ld [wSwappingMove], a
	hlcoord 1, 2
	lb bc, 8, SCREEN_WIDTH - 2
	call ClearBox
	jp .loop

.d_right
	ld a, [wSwappingMove]
	and a
	jp nz, .joy_loop

	ld a, [wCurPartyMon]
	ld b, a
	push bc
	call .cycle_right
	pop bc
	ld a, [wCurPartyMon]
	cp b
	jp z, .joy_loop
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	jp MoveScreenLoop

.d_left
	ld a, [wSwappingMove]
	and a
	jp nz, .joy_loop
	ld a, [wCurPartyMon]
	ld b, a
	push bc
	call .cycle_left
	pop bc
	ld a, [wCurPartyMon]
	cp b
	jp z, .joy_loop
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	jp MoveScreenLoop

.cycle_right
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .cycle_left
	cp EGG
	ret nz
	jr .cycle_right

.cycle_left
	ld a, [wCurPartyMon]
	and a
	ret z
.cycle_left_loop
	ld a, [wCurPartyMon]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	cp EGG
	ret nz
	ld a, [wCurPartyMon]
	and a
	jr z, .cycle_right
	jr .cycle_left_loop

.a_button
	call PlayClickSFX
	call WaitSFX
	ld a, [wSwappingMove]
	and a
	jr nz, .place_move
	ld a, [wMenuCursorY]
	ld [wSwappingMove], a
	call PlaceHollowCursor
	jp .moving_move

.place_move
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	push hl
	call .copy_move
	pop hl
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	call .copy_move
	ld a, [wBattleMode]
	jr z, .swap_moves
	ld hl, wBattleMonMoves
	ld bc, wBattleMonStructEnd - wBattleMon
	ld a, [wCurPartyMon]
	call AddNTimes
	push hl
	call .copy_move
	pop hl
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	call .copy_move

.swap_moves
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	hlcoord 1, 2
	lb bc, 8, 18
	call ClearBox
	hlcoord 10, 10
	lb bc, 1, 9
	call ClearBox
	jp .loop

.copy_move
	push hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wSwappingMove]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

.exit
	xor a
	ld [wSwappingMove], a
	ld hl, w2DMenuFlags1
	res 6, [hl]
	call ClearSprites
	jp ClearTilemap

MoveScreen2DMenuData:
	db 3, 1 ; cursor start y, x
	db 3, 1 ; rows, columns
	db $40, $00 ; flags
	dn 2, 0 ; cursor offsets
	db D_UP | D_DOWN | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON ; accepted buttons

String_MoveWhere:
	db "Select a move<NEXT>to swap places.@"

SetUpMoveScreenBG:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	farcall LoadSummaryScreenPageTilesGFX
	farcall ClearSpriteAnims2
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wTempIconSpecies], a
	ld e, MONICON_MOVES
	farcall LoadMenuMonIcon
	hlcoord 0, -1
	ld b, 1
	ld c, 18
	call Textbox
	hlcoord 0, 11
	ld b, 5
	ld c, 18
	call Textbox
	hlcoord 2, 0
	lb bc, 2, 3
	call ClearBox
	xor a
	ld [wMonType], a
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNickname
	hlcoord 5, 1
	call PlaceString
	push bc
	farcall CopyMonToTempMon
	pop hl
	hlcoord 5, 0
	call PrintLevel
	
	ld a, TEMPMON
	ld [wMonType], a
	callfar GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "<MALE>"
	jr nz, .got_gender
	ld a, "<FEMALE>"

.got_gender
	hlcoord 9, 0
	ld [hl], a

	ld hl, wPlayerHPPal
	call SetHPPal
	ld b, SCGB_MOVE_LIST
	call GetSGBLayout
	hlcoord 16, 0
	lb bc, 1, 3
	jp ClearBox

SetUpMoveList:
	xor a
	ldh [hBGMapMode], a
	ld [wSwappingMove], a
	ld [wMonType], a
	predef CopyMonToTempMon
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	hlcoord 2, 3
	predef ListMoves
	hlcoord 10, 4
	predef ListMovePP
	call WaitBGMap
	call SetDefaultBGPAndOBP
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	hlcoord 0, 11
	ld b, 5
	ld c, 18
	jp Textbox

PrepareToPlaceMoveData:
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	hlcoord 1, 12
	lb bc, 5, 18
	jp ClearBox

PlaceMoveData:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 10
	ld de, String_MoveType_Top
	call PlaceString
	hlcoord 0, 11
	ld de, String_MoveType_Bottom
	call PlaceString
; Place Move "Atk"/Pow String
	hlcoord 2, 12
	ld de, String_MoveAtk ; string for "Pow"
	call PlaceString

; Place Move Cateogry
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_TYPE
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	push af ; raw Move Type+category Byte, unmasked
	and ~TYPE_MASK ; Specific to Phys/Spec split
	swap a ; Specific to Phys/Spec split
	srl a  ; Specific to Phys/Spec split
	srl a  ; Specific to Phys/Spec split
	dec a  ; Specific to Phys/Spec split
	ld hl, CategoryIconGFX ; ptr to Category GFX loaded from PNG(2bpp)
	ld bc, 2 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $59 ; category icon tile slot in VRAM, destination
	lb bc, BANK(CategoryIconGFX), 2
	call Request2bpp ; Load 2bpp at b:de to occupy c tiles of hl.
	hlcoord 16, 12
	ld a, $59 ; category icon tile 1
	ld [hli], a
	ld [hl], $5a ; category icon tile 2
; Place Move Type
	pop af ; raw Move Type+category Byte, unmasked
	and TYPE_MASK ; Phys/Spec Split specific
	ld c, a
	farcall GetMonTypeIndex
	ld a, c
; Type Index adjust done
; Load Type GFX Tiles, color will be in Slot 4 of Palette
	ld hl, TypeIconGFX ; ptr for PNG w/ black Tiles, since this screen is using Slot 4 in the Palette for Type color
	ld bc, 4 * LEN_1BPP_TILE ; purely Black and White tiles are 1bpp. Type Tiles are 4 Tiles wide
	call AddNTimes ; increments pointer based on Type Index
	ld d, h
	ld e, l ; de is the source Pointer
	ld hl, vTiles2 tile $5b ; $5b is destination Tile for first Type Tile
	lb bc, BANK(TypeIconGFX), 4 ; Bank in 'b', num of Tiles to load in 'c'
	call Request1bpp
	hlcoord 11, 12
	ld a, $5b ; first Type Tile
	ld [hli], a
	inc a ; Tile $5c
	ld [hli], a
	inc a ; Tile $5d
	ld [hli], a
	ld [hl], $5e ; final Type Tile

; Place Move Accuracy
	hlcoord 2, 13
	ld de, String_MoveAcc ; string for "Acc"
	call PlaceString
	hlcoord 9, 13
	ld [hl], "<%>"

	; getting the actual Move's accuracy
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_ACC
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	call Adjust_percent ; outputs accuracy in decimal instead of hex to print appropiatley
	hlcoord 6, 13
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	lb bc, 1, 3 ; number of bytes of num being printed in 'b', max digits in 'c'
	call PrintNum
; Place Move Effect Chance
; repeat steps but for Move's effect chance
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_CHANCE
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	hlcoord 15, 13
	cp 2
	jr c, .no_efct_chance

	call Adjust_percent ; outputs chance in decimal instead of hex to print appropiatley
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	lb bc, 1, 3 ; number of bytes of num being printed in 'b', max digits in 'c'
	call PrintNum

	hlcoord 11, 13
	ld de, String_MoveChance ; string for "Eff"
	call PlaceString
	hlcoord 18, 13
	ld [hl], "<%>"
.no_efct_chance

; Print Pow Num
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_POWER
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	hlcoord 6, 12
	cp 2
	jr c, .no_power ; means it's a status move
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	lb bc, 1, 3 ; number of bytes of num being printed in 'b', max digits in 'c'
	call PrintNum
; Print Move Description
	jr .description ; printed Pow, don't overwrite with "---", jump to print description
.no_power
	ld de, String_MoveNoPower ; string for "---"
	call PlaceString

.description
	hlcoord 1, 15
	predef PrintMoveDescription

	ld b, SCGB_MOVE_LIST
	call GetSGBLayout ; reload proper palettes for new Move Type and Category, and apply
	ld a, $1 ; done editing the screen
	ldh [hBGMapMode], a
	ret

String_MoveType_Top:
	db "          @"
String_MoveType_Bottom:
	db "┌─────────@"
String_MoveAtk:
	db "Pow/@"
String_MoveAcc:
	db "Acc/@"
String_MoveChance:
	db "Eff/@"
String_MoveNoPower:
	db "---@"

PlaceMoveScreenArrows:
	call PlaceMoveScreenLeftArrow
	call PlaceMoveScreenRightArrow
	ret

PlaceMoveScreenLeftArrow:
	ld a, [wCurPartyMon]
	and a
	ret z
	ld c, a
	ld e, a
	ld d, 0
	ld hl, wPartyCount
	add hl, de
.loop
	ld a, [hl]
	and a
	jr z, .prev
	cp EGG
	jr z, .prev
	cp NUM_POKEMON + 1
	jr c, .legal

.prev
	dec hl
	dec c
	jr nz, .loop
	ret

.legal
	hlcoord 16, 0
	ld [hl], "▶"
	ret

PlaceMoveScreenRightArrow:
	ld a, [wCurPartyMon]
	inc a
	ld c, a
	ld a, [wPartyCount]
	cp c
	ret z
	ld e, c
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
.loop
	ld a, [hl]
	cp -1
	ret z
	and a
	jr z, .next
	cp EGG
	jr z, .next
	cp NUM_POKEMON + 1
	jr c, .legal

.next
	inc hl
	jr .loop

.legal
	hlcoord 18, 0
	ld [hl], "▶"
	ret
