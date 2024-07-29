	object_const_def
	const VIRIDIANFORESTROUTE2GATE_OFFICER
	const VIRIDIANFORESTROUTE2GATE_PARASECT

ViridianForestRoute2Gate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestRoute2GateOfficerScript:
	jumptextfaceplayer ViridianForestRoute2GateOfficerText
	
ViridianForestRoute2GateParasectScript:
	opentext
	writetext ViridianForestRoute2GateParasectText
	cry PARASECT
	waitbutton
	refreshscreen
	pokepic PARASECT
	waitbutton
	closepokepic
	closetext
	end

ViridianForestRoute2GateOfficerText:
	text "We've got some"
	line "officers out on"
	cont "patrol."
	done
	
ViridianForestRoute2GateParasectText:
	text "Parasect: Parasss!"
	done


ViridianForestRoute2Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VIRIDIAN_FOREST, 4
	warp_event  5,  7, VIRIDIAN_FOREST, 4
	warp_event  4,  0, ROUTE_2, 7
	warp_event  5,  0, ROUTE_2, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianForestRoute2GateOfficerScript, -1
	object_event  9,  3, SPRITE_PARASECT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianForestRoute2GateParasectScript, -1
