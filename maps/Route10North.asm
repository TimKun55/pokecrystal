	object_const_def
	const ROUTE10NORTH_HIKER1
	const ROUTE10NORTH_HIKER2

Route10North_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route10NorthFlypointCallback
	callback MAPCALLBACK_OBJECTS, Route10NorthHikerCallback
	callback MAPCALLBACK_TILES, Route10NorthEasyAccessCallback

Route10NorthFlypointCallback:
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	endcallback

Route10NorthHikerCallback:
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .ClearPath
	disappear ROUTE10NORTH_HIKER2
	appear ROUTE10NORTH_HIKER1
	endcallback

.ClearPath:
	disappear ROUTE10NORTH_HIKER1
	appear ROUTE10NORTH_HIKER2
	endcallback

Route10NorthEasyAccessCallback:
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iffalse .done
	changeblock 14, 18, $36
	changeblock 14, 20, $3d
.done:
	endcallback

Route10NorthHikerCuttingTreeScript:
	faceplayer
	opentext
	writetext Route10NorthHikerCuttingTreeText
	waitbutton
	closetext
	turnobject ROUTE10NORTH_HIKER1, DOWN
	end

Route10NorthHikerCutTreeScript:
	jumptextfaceplayer Route10NorthHikerCutTreeText

RockTunnelSign:
	jumptext RockTunnelSignText

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

Route10NorthHikerCuttingTreeText:
	text "I was hired by"
	line "the Power Plant"
	cont "to make a short-"
	cont "cut through here."
	
	para "I'm almost done."
	done

Route10NorthHikerCutTreeText:
	text "I'm finished!"
	
	para "I'm proud of my"
	line "handiwork!"
	done

RockTunnelSignText:
	text "Rock Tunnel"

	para "Through to"
	line "Lavender Town"
	done

PowerPlantSignText:
	text "Kanto Power Plant"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  1, ROCK_TUNNEL_1F, 1
	warp_event  9,  3, ROUTE_10_POKECENTER_1F, 1
	warp_event  5, 27, POWER_PLANT, 1

	def_coord_events

	def_bg_events
	bg_event  6,  2, BGEVENT_READ, RockTunnelSign
	bg_event  3, 29, BGEVENT_READ, PowerPlantSign
	bg_event 10,  3, BGEVENT_READ, Route10PokecenterSign

	def_object_events
	object_event 14, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10NorthHikerCuttingTreeScript, EVENT_ROUTE_10_NORTH_HIKER_CUTTING_TREE
	object_event 12, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10NorthHikerCutTreeScript, EVENT_ROUTE_10_NORTH_HIKER_CUT_TREE
