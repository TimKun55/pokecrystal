MtSilverOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MtSilverOutsideFlypointCallback

MtSilverOutsideFlypointCallback:
	setflag ENGINE_FLYPOINT_MT_SILVER
	endcallback

MtSilverPokecenterSign:
	jumpstd PokecenterSignScript

MtSilverSign:
	jumptext MtSilverSignText

MtSilverOutsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_MT_SILVER_OUTSIDE_HIDDEN_FULL_RESTORE

MtSilverSignText:
	text "MT.SILVER"
	done

MtSilverOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 19, MT_SILVER_POKECENTER_1F, 1
	warp_event 18, 11, MT_SILVER_ROOM_1, 1

	def_coord_events

	def_bg_events
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event  9, 25, BGEVENT_ITEM, MtSilverOutsideHiddenFullRestore

	def_object_events
