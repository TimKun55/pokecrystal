	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY1
	const ROUTE20_SWIMMER_GUY2
	const ROUTE20_SWIMMER_GUY3

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20SurfingCompetitionOverCallback

Route20SurfingCompetitionOverCallback:
	setevent EVENT_CINNABAR_SURFING_COMPETITION_OVER
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmerfNicoleAfterBattleText

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmerfLoriAfterBattleText

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmermCameronAfterBattleText

TrainerSwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmermHalAfterBattleText

TrainerSwimmermPaton:
	trainer SWIMMERM, PATON, EVENT_BEAT_SWIMMERM_PATON, SwimmermPatonSeenText, SwimmermPatonBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmermPatonAfterBattleText

SeafoamIslandsSign:
	jumptext SeafoamIslandsSignText

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of Gym"
	cont "Badges. We should"
	cont "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "Surf is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"
	cont "all the way to"
	cont "Johto."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done

SwimmermHalSeenText:
	text "Swimming today."

	para "Swimming tomorrow."

	para "Battle now!"
	done

SwimmermHalBeatenText:
	text "Should have stuck"
	line "to swimming."
	done

SwimmermHalAfterBattleText:
	text "I've gotta do a"
	line "lot more training;"
	cont "for #mon and"
	cont "for swimming."
	done

SwimmermPatonSeenText:
	text "I swam out here"
	line "to explore the"
	cont "Seafoam Islands"
	cont "but got lost"
	cont "in there."
	done

SwimmermPatonBeatenText:
	text "Frustrated AND"
	line "disappointed."
	done

SwimmermPatonAfterBattleText:
	text "I want to explore"
	line "more but I have a"
	cont "bad sense of"
	cont "direction…"
	done

SeafoamIslandsSignText:
	text "Seafoam Islands"
	done
	
Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 56, 11, SEAFOAM_ISLANDS_1F, 1
	warp_event 48,  7, SEAFOAM_ISLANDS_1F, 4

	def_coord_events

	def_bg_events
	bg_event 50,  8, BGEVENT_READ, SeafoamIslandsSign
	bg_event 55, 12, BGEVENT_READ, SeafoamIslandsSign

	def_object_events
	object_event 89, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 68,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 24, 12, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
	object_event 10,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSwimmermHal, -1
	object_event 39,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSwimmermPaton, -1
