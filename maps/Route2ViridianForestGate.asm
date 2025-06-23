	object_const_def
	const ROUTE2VIRIDIANFORESTGATE_OFFICER
	const ROUTE2VIRIDIANFORESTGATE_BEEDRILL

Route2ViridianForestGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2ViridianForestGateOfficerScript:
	jumptextfaceplayer Route2ViridianForestGateOfficerText
	
Route2ViridianForestGateBeedrillScript:
	opentext
	writetext Route2ViridianForestGateBeedrillText
	cry BEEDRILL
	waitbutton
	refreshscreen
	pokepic BEEDRILL
	waitbutton
	closepokepic
	closetext
	end

Route2ViridianForestGateOfficerText:
	text "The Forest has"
	line "some strong Bugs!"
	cont "Be careful!"
	done
	
Route2ViridianForestGateBeedrillText:
	text "Beedrill: Beeeeee!"
	done


Route2ViridianForestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_2, 7
	warp_event  5,  7, ROUTE_2, 8
	warp_event  4,  0, VIRIDIAN_FOREST, 1
	warp_event  5,  0, VIRIDIAN_FOREST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2ViridianForestGateOfficerScript, -1
	object_event  0,  3, SPRITE_BEEDRILL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2ViridianForestGateBeedrillScript, -1
