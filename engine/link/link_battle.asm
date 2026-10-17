; Link battle action exchange.
;
; Moved here from mobile/mobile_40.asm.
; The mobile-adapter-specific branch has been stripped out.

_LinkBattleSendReceiveAction:
	call .StageForSend
	ld [wLinkBattleSentAction], a
	vc_hook Wireless_start_exchange
	farcall PlaceWaitingText
	call .LinkBattle_SendReceiveAction
	ret

.StageForSend:
	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	jr nz, .switch
	ld a, [wCurPlayerMove]
	ld b, BATTLEACTION_STRUGGLE
	cp STRUGGLE
	jr z, .struggle
	ld b, BATTLEACTION_SKIPTURN
	cp $ff
	jr z, .struggle
	ld a, [wCurMoveNum]
	jr .use_move

.switch
	ld a, [wCurPartyMon]
	add BATTLEACTION_SWITCH1
	jr .use_move

.struggle
	ld a, b

.use_move
	and $0f
	ret

.LinkBattle_SendReceiveAction:
	ld a, [wLinkBattleSentAction]
	ld [wPlayerLinkAction], a
	ld a, $ff
	ld [wOtherPlayerLinkAction], a
.waiting
	call LinkTransfer
	call DelayFrame
	ld a, [wOtherPlayerLinkAction]
	inc a
	jr z, .waiting

	vc_hook Wireless_end_exchange
	vc_patch Wireless_net_delay_3
if DEF(_CRYSTAL11_VC)
	ld b, 26
else
	ld b, 10
endc
	vc_patch_end
.receive
	call DelayFrame
	call LinkTransfer
	dec b
	jr nz, .receive

	vc_hook Wireless_start_send_zero_bytes
	vc_patch Wireless_net_delay_4
if DEF(_CRYSTAL11_VC)
	ld b, 26
else
	ld b, 10
endc
	vc_patch_end
.acknowledge
	call DelayFrame
	call LinkDataReceived
	dec b
	jr nz, .acknowledge

	vc_hook Wireless_end_send_zero_bytes
	ld a, [wOtherPlayerLinkAction]
	ld [wBattleAction], a
	ret
