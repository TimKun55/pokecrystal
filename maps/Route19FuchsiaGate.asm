	object_const_def
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_SURFING_COMPETITION_OVER
	iftrue .CompetitionOver
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.CompetitionOver:
	writetext Route19FuchsiaGateOfficerText_CompetitionOver
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "Route 19 is closed"
	line "due to the Surfing"
	cont "Competition."
	
	para "If you want to"
	line "visit Cinnabar and"
	cont "Seafoam, please"
	
	para "travel there via"
	line "Pallet Town."
	done

Route19FuchsiaGateOfficerText_CompetitionOver:
	text "The Competition is"
	line "good fun, but can"

	para "cause some travel"
	line "frustration."
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY,  9
	warp_event  5,  0, FUCHSIA_CITY, 10
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
