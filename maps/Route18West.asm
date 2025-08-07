	object_const_def
	const ROUTE18W_BIKER1
	const ROUTE18W_BIKER2

Route18West_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route18WestAlwaysOnBikeCallback

Route18WestAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

Route18WBiker1Script:
	jumptextfaceplayer Route18WBiker1Text

Route18WBiker2Script:
	jumptextfaceplayer Route18WBiker2Text

Route18WBiker1Text:
	text "I'm psyching"
	line "myself up to"
	cont "ride to the top!"
	
	para "I know I'm going"
	line "to feel the burn!"
	done

Route18WBiker2Text:
	text "Whew, I'm pooped!"
	
	para "I'm just enjoying"
	line "the view here."
	done

Route18West_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21,  8, ROUTE_18_EAST_WEST_GATE, 1
	warp_event 21,  9, ROUTE_18_EAST_WEST_GATE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route18WBiker1Script, -1
	object_event 11,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route18WBiker2Script, -1
