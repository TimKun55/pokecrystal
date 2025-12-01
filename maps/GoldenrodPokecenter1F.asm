DEF GOLDENRODPOKECENTER1F_TM33_COINS      EQU 3000
DEF GOLDENRODPOKECENTER1F_TM41_COINS      EQU 3000
DEF GOLDENRODPOKECENTER1F_TM48_COINS      EQU 3000

	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_CHANSEY
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F
	const GOLDENRODPOKECENTER1F_ROCKER
	const GOLDENRODPOKECENTER1F_BEAUTY
	const GOLDENRODPOKECENTER1F_BLACK_BELT

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1FChansey:
	jumpstd PokecenterChanseyScript

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetextend GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText

.NoEonMail:
	writetextend GoldenrodPokecenter1FPokefanFTooBadText

.NoRoom:
	giveitem EON_MAIL
	writetextend GoldenrodPokecenter1FPokefanFAnotherTimeThenText

Aizen:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .BulbasaurTrade
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .CharmanderTrade
; SquirtleTrade
	trade NPC_TRADE_AIZEN2
	waitbutton
	closetext
	end

.BulbasaurTrade
	trade NPC_TRADE_AIZEN3
	waitbutton
	closetext
	end

.CharmanderTrade
	trade NPC_TRADE_AIZEN1
	waitbutton
	closetext
	end

GoldenrodPokecenter1FMoveTutor:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FMoveTutorIronDefenseText
	waitbutton
	special PlaceMoneyTopRight
	writetext GoldenrodPokecenter1FMoveTutorIronDefenseText2
	waitbutton
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, .NotEnough
	yesorno
	iffalse .TutorRefused
	setval IRON_DEFENSE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend GoldenrodPokecenter1FMoveTutorIronDefenseRefused
	
.TeachMove
	writetext GoldenrodPokecenter1FMoveTutorPayment
	takemoney YOUR_MONEY, 2500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend GoldenrodPokecenter1FMoveTutorIronDefenseTaught

.NotEnough
	writetextend GoldenrodPokecenter1FMoveTutorNotEnough

GoldenrodPokecenter1FTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FTMVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodPokecenter1FTMVendor_NoCoinCaseScript
	writetext GoldenrodPokecenter1FTMVendorWhichTMText
GoldenrodPokecenter1FTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodPokecenter1FTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .IcePunch
	ifequal 2, .ThunderPunch
	ifequal 3, .FirePunch
	sjump GoldenrodPokecenter1FTMVendor_CancelPurchaseScript

.IcePunch:
	checkitem TM_ICE_PUNCH
	iftrue GoldenrodPokecenter1FTMVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODPOKECENTER1F_TM33_COINS
	ifequal HAVE_LESS, GoldenrodPokecenter1FTMVendor_NotEnoughCoinsScript
	writetext GoldenrodPokecenter1FTMVendorConfirmTM33Text
	yesorno
	iffalse GoldenrodPokecenter1FTMVendor_CancelPurchaseScript
	giveitem TM_ICE_PUNCH
	iffalse GoldenrodPokecenter1FTMMonVendor_NoRoomForTMScript
	takecoins GOLDENRODPOKECENTER1F_TM33_COINS
	sjump GoldenrodPokecenter1FTMVendor_FinishScript

.ThunderPunch:
	checkitem TM_THUNDERPUNCH
	iftrue GoldenrodPokecenter1FTMVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODPOKECENTER1F_TM41_COINS
	ifequal HAVE_LESS, GoldenrodPokecenter1FTMVendor_NotEnoughCoinsScript
	writetext GoldenrodPokecenter1FTMVendorConfirmTM41Text
	yesorno
	iffalse GoldenrodPokecenter1FTMVendor_CancelPurchaseScript
	giveitem TM_THUNDERPUNCH
	iffalse GoldenrodPokecenter1FTMMonVendor_NoRoomForTMScript
	takecoins GOLDENRODPOKECENTER1F_TM41_COINS
	sjump GoldenrodPokecenter1FTMVendor_FinishScript

.FirePunch:
	checkitem TM_FIRE_PUNCH
	iftrue GoldenrodPokecenter1FTMVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODPOKECENTER1F_TM48_COINS
	ifequal HAVE_LESS, GoldenrodPokecenter1FTMVendor_NotEnoughCoinsScript
	writetext GoldenrodPokecenter1FTMVendorConfirmTM48Text
	yesorno
	iffalse GoldenrodPokecenter1FTMVendor_CancelPurchaseScript
	giveitem TM_FIRE_PUNCH
	iffalse GoldenrodPokecenter1FTMMonVendor_NoRoomForTMScript
	takecoins GOLDENRODPOKECENTER1F_TM48_COINS
	sjump GoldenrodPokecenter1FTMVendor_FinishScript

GoldenrodPokecenter1FTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodPokecenter1FTMVendorHereYouGoText
	waitbutton
	sjump GoldenrodPokecenter1FTMVendor_LoopScript
	
GoldenrodPokecenter1FTMVendor_AlreadyHaveTMScript:
	writetext GoldenrodPokecenter1FTMVendorAlreadyHaveTMText
	waitbutton
	sjump GoldenrodPokecenter1FTMVendor_LoopScript

GoldenrodPokecenter1FTMVendor_NotEnoughCoinsScript:
	writetextend GoldenrodPokecenter1FTMVendorNeedMoreCoinsText

GoldenrodPokecenter1FTMMonVendor_NoRoomForTMScript:
	writetextend GoldenrodPokecenter1FTMVendorNoMoreRoomText

GoldenrodPokecenter1FTMVendor_CancelPurchaseScript:
	writetextend GoldenrodPokecenter1FTMVendorQuitText

GoldenrodPokecenter1FTMVendor_NoCoinCaseScript:
	writetextend GoldenrodPokecenter1FTMVendorNoCoinCaseText

GoldenrodPokecenter1FTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM33    3000@"
	db "TM41    3000@"
	db "TM48    3000@"
	db "Cancel@"
	
GoldenrodPokecenter1FVendingMachine:
	jumpstd VendingMachineScript

GoldenrodPokecenter1FGameboyKidText:
	text "The Colosseum"
	line "upstairs is for"
	cont "link battles."

	para "Battle records are"
	line "posted on the"
	cont "wall, so I can't"
	cont "afford to lose."
	done

GoldenrodPokecenter1FLassText:
	text "A higher level"
	line "#mon doesn't"
	cont "always win."

	para "After all, it may"
	line "have a type dis-"
	cont "advantage."

	para "I don't think"
	line "there is a single"
	cont "#mon that is"
	cont "the toughest."
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have something"
	cont "named Eon Mail?"

	para "My daughter is"
	line "after one."

	para "You can part with"
	line "one, can't you?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Give away an Eon"
	line "Mail?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "the Eon Mail."
	done

GoldenrodPokecenter1FMoveTutorIronDefenseText:
	text "Hello!"
	line "Are you a trainer?"
	
	para "Would you like me"
	line "to teach your"
	cont "#mon a useful"
	cont "defensive move"
	cont "to defend against"
	cont "Physical attacks?"
	done

GoldenrodPokecenter1FMoveTutorIronDefenseText2:
	text "I can teach your"
	line "#mon how to use"
	cont "Iron Defense for"
	cont "¥2,500?"
	done

GoldenrodPokecenter1FMoveTutorIronDefenseRefused:
	text "No problem."
	done

GoldenrodPokecenter1FMoveTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥2500."
	done

GoldenrodPokecenter1FMoveTutorIronDefenseTaught:
	text "Nothing like a"
	line "solid defense!"
	done
	
GoldenrodPokecenter1FMoveTutorNotEnough:
	text "Sorry, you can't"
	line "afford it."
	done

GoldenrodPokecenter1FTMVendorIntroText:
	text "Hello there!"

	para "I've mastered the"
	line "three Elemental"
	cont "Punches!"
	
	para "For some coins, I"
	line "can give you the"
	cont "TMs for them."
	done

GoldenrodPokecenter1FTMVendorWhichTMText:
	text "Which TM would"
	line "you like?"
	done

GoldenrodPokecenter1FTMVendorConfirmTM33Text:
	text "TM33 Ice Punch."
	line "Is that right?"
	done

GoldenrodPokecenter1FTMVendorConfirmTM41Text:
	text "TM41 ThunderPunch."
	line "Is that right?"
	done

GoldenrodPokecenter1FTMVendorConfirmTM48Text:
	text "TM41 Fire Punch."
	line "Is that right?"
	done

GoldenrodPokecenter1FTMVendorHereYouGoText:
	text "Here you go!"
	
	para "Punch your way to"
	line "absolute victory!"
	done
	
GoldenrodPokecenter1FTMVendorAlreadyHaveTMText:
	text "But you already"
	line "have that TM!"
	done

GoldenrodPokecenter1FTMVendorNeedMoreCoinsText:
	text "Hmm, you'll need"
	line "more coins."
	done

GoldenrodPokecenter1FTMVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodPokecenter1FTMVendorQuitText:
	text "OK. Save those"
	line "coins and come"
	cont "again."
	done

GoldenrodPokecenter1FTMVendorNoCoinCaseText:
	text "Oi! You don't have"
	line "a Coin Case."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 20
	warp_event  8,  7, GOLDENROD_CITY, 20
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_UP, GoldenrodPokecenter1FVendingMachine
	bg_event  1,  1, BGEVENT_UP, GoldenrodPokecenter1FVendingMachine
	bg_event 14,  1, BGEVENT_UP, GoldenrodPokecenter1FVendingMachine
	bg_event 15,  1, BGEVENT_UP, GoldenrodPokecenter1FVendingMachine

	def_object_events
	object_event  7,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  8,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FChansey, -1
	object_event 10,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  5,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event 13,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Aizen, -1
	object_event 11,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FMoveTutor, -1
	object_event 15,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FTMVendorScript, -1
