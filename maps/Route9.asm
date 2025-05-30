	object_const_def
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_HIKER1
	const ROUTE9_HIKER2
	const ROUTE9_LADY_ZOE

Route9_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLadyZoe:
	trainer LADY, ZOE, EVENT_BEAT_LADY_ZOE, LadyZoeSeenText, LadyZoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadyZoeAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "I came to explore"
	line "Rock Tunnel."
	done

CamperDeanBeatenText:
	text "Whoa! Danger, man."
	done

CamperDeanAfterBattleText:
	text "My #mon were"
	line "hurt before even"

	para "entering Rock"
	line "Tunnel."

	para "I'd better take"
	line "them to a #mon"
	cont "Center right away."
	done

PicnickerHeidiSeenText:
	text "Have you ever been"
	line "to a picnic?"

	para "They're so much"
	line "fun!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "We bake lots of"
	line "goodies and share"

	para "them all around."
	line "They're delicious!"
	done

CamperSidSeenText:
	text "Hey, you!"
	line "Don't litter!"
	done

CamperSidBeatenText:
	text "I was just point-"
	line "ing out…"
	done

CamperSidAfterBattleText:
	text "Sorry. You weren't"
	line "littering. It was"
	cont "my mistake."
	done

PicnickerEdnaSeenText:
	text "People shouldn't"
	line "leave any litter"
	cont "behind."
	done

PicnickerEdnaBeatenText:
	text "Ohh… I lost…"
	done

PicnickerEdnaAfterBattleText:
	text "Conserving energy"
	line "is important, but"

	para "the environment is"
	line "even more vital."
	done

HikerTimSeenText:
	text "She'll be coming"
	line "'round Mt.Silver"
	cont "when she comes…"

	para "Mt.Silver is in"
	line "Johto, right?"
	done

HikerTimBeatenText:
	text "I was too busy"
	line "singing…"
	done

HikerTimAfterBattleText:
	text "Battles are about"
	line "concentration."
	done

HikerSidneySeenText:
	text "I'll tell you a"
	line "secret."

	para "But first, we"
	line "battle!"
	done

HikerSidneyBeatenText:
	text "Oh, dang!"
	line "I lost that…"
	done

HikerSidneyAfterBattleText:
	text "The Power Plant is"
	line "across a small"
	cont "river."
	done
	
LadyZoeSeenText:
	text "YOU! BATTLE!"
	line "NOW!!!"
	done

LadyZoeBeatenText:
	text "DEFEAT!!"
	done

LadyZoeAfterBattleText:
	text "YOU'RE the trainer"
	line "from Johto?!"

	para "Oh, well, no"
	line "wonder I lost!"
	
	para "I guess"
	line "that's OK…"
	done

Route9SignText:
	text "Route 9"

	para "Cerulean City -"
	line "Rock Tunnel"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 23, 11, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 30,  3, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerHikerTim, -1
	object_event 37, 14, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerHikerSidney, -1
	object_event  8,  9, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerLadyZoe, -1
