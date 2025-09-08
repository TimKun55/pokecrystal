	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_SUPER_NERD
	const POKECENTER2F_FISHER

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FLeaveTradeCenterScene,      SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,        SCENE_POKECENTER2F_LEAVE_COLOSSEUM

	def_callbacks

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end
	
MoveReminderScript:
	faceplayer
	opentext
	special MoveReminder
	waitbutton
	closetext
	end

Script_TradeCenterClosed:
	jumptextfaceplayer Text_TradeRoomClosed

Script_BattleRoomClosed:
	jumptextfaceplayer Text_BattleRoomClosed

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	special CheckOtherPlayerGender
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_EnterRoom
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	special CheckOtherPlayerGender
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall Pokecenter2F_EnterRoom
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Pokecenter2F_EnterRoom:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	readmem wLinkOtherPlayerGender
	iftrue .Female
	variablesprite SPRITE_LINK_TRAINER, SPRITE_ETHAN
	end

.Female
	variablesprite SPRITE_LINK_TRAINER, SPRITE_KRIS
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special UpdatePlayerSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Pokecenter2FLinkRecordSign:
	refreshscreen
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
Pokecenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
Pokecenter2FMovementData_PlayerTakesTwoStepsDown:	
	step DOWN
Pokecenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

Text_BattleReceptionistIntro:
	text "Welcome to Cable"
	line "Club Colosseum."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to Cable"
	line "Trade Center."

	para "You may trade your"
	line "#mon here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

YourFriendIsNotReadyText:
	text "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	text "Please wait."
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	done

Text_TradeRoomClosed:
	text "I'm sorry--the"
	line "Trade Machine is"
	cont "being adjusted."
	done

Text_BattleRoomClosed:
	text "I'm sorry--the"
	line "Battle Machine is"
	cont "being adjusted."
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  9,  0, TRADE_CENTER, 1
	warp_event 13,  0, COLOSSEUM, 1

	def_coord_events

	def_bg_events
	bg_event 15,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	def_object_events
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event 13,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  6,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveReminderScript, -1	
