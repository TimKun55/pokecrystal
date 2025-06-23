	object_const_def
	const ROUTE7_BUG_MANIAC
	const ROUTE7_POKEFAN_M

Route7_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBugManiacEli:
	trainer BUG_MANIAC, ELI, EVENT_BEAT_BUG_MANIAC_ELI, BugManiacEliSeenText, BugManiacEliBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugManiacEliAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanMCarlos:
	trainer POKEFANM, CARLOS, EVENT_BEAT_POKEFANM_CARLOS, PokefanMCarlosSeenText, PokefanMCarlosBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanMCarlosAfterBattleText
	waitbutton
	closetext
	end

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

BugManiacEliSeenText:
	text "I've been training"
	line "to take on Erika!"
	
	para "I won't lose!"
	done

BugManiacEliBeatenText:
	text "Well, I guess not!"
	done

BugManiacEliAfterBattleText:
	text "Back to training I"
	line "go! It's good to"
	
	para "have goals to"
	line "work towards!"
	done

PokefanMCarlosSeenText:
	text "Look at how cute"
	line "my #mon are!"
	done

PokefanMCarlosBeatenText:
	text "My cuties!"
	done

PokefanMCarlosAfterBattleText:
	text "I should go to"
	line "the Fan Club in"
	
	para "Vermilion and show"
	line "off my #mon!"
	done

Route7UndergroundPathSignText:
	text "What's this flyer?"

	para "… Uncouth trainers"
	line "have been holding"

	para "battles in the"
	line "Underground Path."

	para "Because of rising"
	line "complaints by lo-"
	cont "cal residents, the"
	cont "Underground Path"
	cont "has been sealed"
	cont "indefinitely."

	para "Celadon Police"
	done

Route7LockedDoorText:
	text "It's locked…"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  8, ROUTE_7_SAFFRON_GATE, 1
	warp_event 17,  9, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  4, 12, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  5, 11, BGEVENT_READ, Route7LockedDoor
	bg_event  6, 11, BGEVENT_READ, Route7LockedDoor

	def_object_events
	object_event  6,  3, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugManiacEli, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerPokefanMCarlos, -1
