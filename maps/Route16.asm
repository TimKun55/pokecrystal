Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route16AlwaysOnBikeCallback

Route16AlwaysOnBikeCallback:
;	readvar VAR_YCOORD
;	ifless 5, .CanWalk
;	readvar VAR_XCOORD
;	ifgreater 13, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

;.CanWalk:
;	clearflag ENGINE_ALWAYS_ON_BIKE
;	endcallback

CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "Cycling Road"

	para "Downhill coasting"
	line "all the way!"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 15,  4, ROUTE_16_GATE, 1
	warp_event 15,  5, ROUTE_16_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_READ, CyclingRoadSign

	def_object_events
