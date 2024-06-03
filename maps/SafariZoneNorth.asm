	object_const_def
	const SAFARIZONENORTH_FISHER
	const SAFARIZONENORTH_SCIENTIST
	const SAFARIZONENORTH_POKE_BALL1
	const SAFARIZONENORTH_POKE_BALL2
	const SAFARIZONENORTH_MEW

SafariZoneNorth_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SafariZoneNorthMewCallback
	
SafariZoneNorthMewCallback:
	checkevent EVENT_FOUGHT_MEW
	iftrue .NoAppear
	checkitem DNA_SAMPLE
	iftrue .Appear
	sjump .NoAppear
	
.Appear:
	appear SAFARIZONENORTH_MEW
	endcallback

.NoAppear:
	disappear SAFARIZONENORTH_MEW
	endcallback

SafariZoneNorthMew:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	loadwildmon MEW, 60	
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	startbattle
	disappear SAFARIZONENORTH_MEW
	setevent EVENT_FOUGHT_MEW
	reloadmapafterbattle
	end

SafariZoneNorthFisherScript:
	jumptextfaceplayer SafariZoneNorthFisherText
	
SafariZoneNorthScientistScript:
	jumptextfaceplayer SafariZoneNorthScientistText
	
SafariZoneNorthProtein:
	itemball PROTEIN

SafariZoneNorthRareCandy:
	itemball RARE_CANDY
	
SafariZoneNorthAreaSign:
	jumptext SafariZoneNorthAreaSignText
	
SafariZoneNorthRestHouseSign:
	jumptext SafariZoneNorthRestHouseSignText
	
SafariZoneNorthTrainerTips1Sign:
	jumptext SafariZoneNorthTrainerTips1SignText
	
SafariZoneNorthTrainerTips2Sign:
	jumptext SafariZoneNorthTrainerTips2SignText

SafariZoneNorthTrainerTips3Sign:
	jumptext SafariZoneNorthTrainerTips3SignText
	
SafariZoneNorthFisherText:
	text "If you throw your"
	line "emotions into"

	para "training, you'll"
	line "become strong!"
	done
	
SafariZoneNorthScientistText:
	text "Ahh, I was looking"
	line "for something"
	cont "but I'm pretty"
	cont "sure I'm lost…"
	done

SafariZoneNorthAreaSignText:
	text "SAFARI ZONE"
	line "NORTH AREA"
	done

SafariZoneNorthRestHouseSignText:
	text "REST HOUSE"
	done

SafariZoneNorthTrainerTips1SignText:
	text "TRAINER TIPS"

	para "Moves of the same"
	line "type can do"
	cont "damage or are"
	cont "status-based."
	done

SafariZoneNorthTrainerTips2SignText:
	text "TRAINER TIPS"

	para "#MON hide in"
	line "tall grass!"

	para "Zigzag through"
	line "grassy areas to"
	cont "flush them out."
	done

SafariZoneNorthTrainerTips3SignText:
	text "TRAINER TIPS"

	para "The rest of the"
	line "sign has been"
	cont "torn away…"
	done
	
MewText:
	text "Mew!"
	done

SafariZoneNorth_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 41, 32, SAFARI_ZONE_EAST, 3
	warp_event 41, 33, SAFARI_ZONE_EAST, 4
	warp_event 10, 37, SAFARI_ZONE_WEST, 3
	warp_event 11, 37, SAFARI_ZONE_WEST, 4
	warp_event 22, 37, SAFARI_ZONE_HUB, 7
	warp_event 23, 37, SAFARI_ZONE_HUB, 8
	warp_event 37,  5, SAFARI_ZONE_NORTH_REST_HOUSE, 1
	warp_event  4, 37, SAFARI_ZONE_WEST, 1
	warp_event  5, 37, SAFARI_ZONE_WEST, 2

	def_coord_events

	def_bg_events
	bg_event 15, 33, BGEVENT_READ, SafariZoneNorthAreaSign
	bg_event 38,  6, BGEVENT_READ, SafariZoneNorthRestHouseSign
	bg_event 28, 30, BGEVENT_READ, SafariZoneNorthTrainerTips1Sign
	bg_event 20, 34, BGEVENT_READ, SafariZoneNorthTrainerTips2Sign
	bg_event  5, 27, BGEVENT_READ, SafariZoneNorthTrainerTips3Sign

	def_object_events
	object_event 18, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthFisherScript, -1
	object_event 30,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthScientistScript, -1
	object_event 24, 17, SPRITE_MEW, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthMew, EVENT_SAFARI_ZONE_NORTH_MEW
	object_event  6,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNorthProtein, EVENT_SAFARI_ZONE_NORTH_PROTEIN
	object_event 15, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNorthRareCandy, EVENT_SAFARI_ZONE_NORTH_RARE_CANDY
