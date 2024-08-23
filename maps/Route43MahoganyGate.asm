	object_const_def
	const ROUTE43MAHOGANYGATE_OFFICER
	const ROUTE43MAHOGANYGATE_ELMS_AIDE

Route43MahoganyGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route43MahoganyGateOfficer:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .RocketsCleared
	writetext Route43MahoganyGateOfficerText
	waitbutton
	closetext
	end

.RocketsCleared:
	writetext Route43MahoganyGateOfficerRocketsClearedText
	waitbutton
	closetext
	end

Route43MahoganyGateAideDexCheckScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_CHARM
	iftrue .AlreadyGotExpCharm
	writetext ExpCharmAideIntroText
	waitbutton
	readvar VAR_DEXCAUGHT
	ifgreater 120, .Aide120Caught
	writetext ExpCharmAideTextFailure
	waitbutton
	closetext
	end

.AlreadyGotExpCharm:
	writetext AideGotExpCharmText
	waitbutton
	closetext
	end

.Aide120Caught
	writetext ExpCharmAideTextSuccess
	promptbutton
	verbosegiveitem EXP_CHARM
	setevent EVENT_GOT_EXP_CHARM
	writetext AideExplainExpCharmText
	waitbutton
	closetext
	end

Route43MahoganyGateOfficerText:
	text "Only people headed"
	line "up to Lake Of Rage"

	para "have been through"
	line "here lately."
	done

Route43MahoganyGateOfficerRocketsClearedText:
	text "Nobody goes up to"
	line "Lake Of Rage these"
	cont "days."
	done

ExpCharmAideIntroText:
	text "Hi, <PLAYER>!"
	line "Good to see"
	cont "you again!"
	
	para "If you've regis-"
	line "tered over 120"
	cont "#mon in your"
	
	para "#dex, I have"
	line "something super"
	cont "useful for you!"
	done
	
ExpCharmAideTextFailure:
	text "Hmm… You don't have"
	line "enough #mon."

	para "Check your #dex"
	line "for locations on"
	cont "where to find"
	cont "more of them!"
	done

ExpCharmAideTextSuccess:
	text "Oh! You do have"
	line "enough #mon."

	para "Here's the"
	line "Exp. Charm!"
	done
	
AideExplainExpCharmText:
	text "Having that Charm"
	line "will make raising"
	cont "#mon easier by"
	
	para "boosting the Exp."
	line "they earn."
	
	para "Use it well!"
	
	para "Or, if you don't"
	line "want to use it,"
	
	para "you can always"
	line "store it in"
	cont "the PC."
	done

AideGotExpCharmText:
	text "I'll be heading"
	line "back soon."

	para "Keep up all the"
	line "catching and I'm"
	
	para "sure I'll see you"
	line "at least one"
	cont "more time!"
	done

Route43MahoganyGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_43, 1
	warp_event  5,  0, ROUTE_43, 2
	warp_event  4,  7, MAHOGANY_TOWN, 5
	warp_event  5,  7, MAHOGANY_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43MahoganyGateOfficer, -1
	object_event  8,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route43MahoganyGateAideDexCheckScript, EVENT_GOT_EXP_CHARM
