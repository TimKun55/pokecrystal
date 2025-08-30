	object_const_def
	const ROUTE5_SUPER_NERD1
	const ROUTE5_SUPER_NERD2
	const ROUTE5_SUPER_NERD3
	const ROUTE5_OFFICER1
	const ROUTE5_OFFICER2

Route5_MapScripts:
	def_scene_scripts

	def_callbacks

Route5SuperNerdGreggScript:
	trainer SUPER_NERD, GREGG, EVENT_BEAT_SUPER_NERD_GREGG, SupernerdGreggSeenText, SupernerdGreggBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdGreggAfterBattleText
	waitbutton
	closetext
	end

Route5SuperNerdJayScript:
	trainer SUPER_NERD, JAY, EVENT_BEAT_SUPER_NERD_JAY, SupernerdJaySeenText, SupernerdJayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdJayAfterBattleText
	waitbutton
	closetext
	end

Route5OfficerScript:
	jumptextfaceplayer Route5OfficerText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5DisguisedRunDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	step_end

Route5DisguisedRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

Route5DisguisedFast1Movement:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

Route5DisguisedFast2Movement:
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	step_end

SupernerdGreggSeenText:
	text "You're from Johto?"
	line "You must have some"
	cont "rare #mon!"
	done

SupernerdGreggBeatenText:
	text "Rare and strong!"
	done

SupernerdGreggAfterBattleText:
	text "That guy Jay says"
	line "Misty is better"
	cont "than Sabrina."
	
	para "Lies!"
	done

SupernerdJaySeenText:
	text "Hey, let's battle!"
	done

SupernerdJayBeatenText:
	text "A miscalculation!"
	done

SupernerdJayAfterBattleText:
	text "That guy Gregg"
	line "says Sabrina is"
	cont "better than Misty."
	
	para "Lies!"
	done

Route5OfficerText:
	text "The Underground"
	line "Path is closed"
	cont "until the problem"

	para "at the Power Plant"
	line "is solved."
	done

Route5UndergroundPathSignText:
	text "Underground Path"

	para "Cerulean City -"
	line "Vermilion City"
	done

HouseForSaleSignText:
	text "What's this?"

	para "House for Sale…"
	line "Nobody lives here."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 37, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 16, 37, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 2
	warp_event  9, 41, ROUTE_5_SAFFRON_GATE, 1
	warp_event 10, 41, ROUTE_5_SAFFRON_GATE, 2
	warp_event  9, 23, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 13, 37, BGEVENT_READ, Route5UndergroundPathSign
	bg_event  9, 23, BGEVENT_READ, HouseForSaleSign

	def_object_events
	object_event  1, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Route5SuperNerdGreggScript, -1
	object_event 18, 22, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Route5SuperNerdJayScript, -1
	object_event 15, 38, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5OfficerScript, EVENT_ROUTE_5_6_OFFICER_BLOCKS_UNDERGROUND_PATH
	object_event 16, 38, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5OfficerScript, EVENT_ROUTE_5_6_OFFICER_BLOCKS_UNDERGROUND_PATH
