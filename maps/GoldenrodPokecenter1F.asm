	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_CHANSEY
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F
	const GOLDENRODPOKECENTER1F_ROCKER
	const GOLDENRODPOKECENTER1F_BEAUTY

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
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

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
	writetext GoldenrodPokecenter1FMoveTutorIronDefenseRefused
	waitbutton
	closetext
	end
	
.TeachMove
	writetext GoldenrodPokecenter1FMoveTutorPayment
	takemoney YOUR_MONEY, 2500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext GoldenrodPokecenter1FMoveTutorIronDefenseTaught
	waitbutton
	closetext
	end

.NotEnough
	writetext GoldenrodPokecenter1FMoveTutorNotEnough
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext GoldenrodPokecenter1FMoveTutorIncompatibleText
	waitbutton
	closetext
	end

GoldenrodPokecenter1FVendingMachine:
	jumpstd VendingMachineScript

GoldenrodPokecenter1FGameboyKidText:
	text "The Colosseum"
	line "upstairs is for"
	cont "link battles."

	para "Battle records are"
	line "posted on the"

	para "wall, so I can't"
	line "afford to lose."
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

	para "#mon that is"
	line "the toughest."
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have something"
	cont "named Eon Mail"

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
	
	para "#mon a useful"
	line "defensive move"
	
	para "to defend against"
	line "Physical attacks?"
	done

GoldenrodPokecenter1FMoveTutorIronDefenseText2:
	text "I can teach your"
	line "#mon how to use"

	para "Iron Defense for"
	line "¥2,500?"
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
	
GoldenrodPokecenter1FMoveTutorIncompatibleText:
	text "I'm sorry, your"
	line "#mon can't"
	cont "learn this move…"
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 15
	warp_event  8,  7, GOLDENROD_CITY, 15
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
