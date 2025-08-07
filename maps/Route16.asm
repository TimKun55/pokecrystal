Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route16AlwaysOnBikeCallback

Route16AlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

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
	warp_event  5,  4, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 15,  2, ROUTE_16_GATE, 1
	warp_event 15,  3, ROUTE_16_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 11, 19, BGEVENT_READ, CyclingRoadSign

	def_object_events
