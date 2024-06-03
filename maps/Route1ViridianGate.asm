	object_const_def
	const ROUTE1VIRIDIANGATE_OFFICER

Route1ViridianGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route1ViridianGuardScript:
	faceplayer
	opentext
	writetext Route1ViridianGuardText
	waitbutton
	closetext
	end

Route1ViridianGuardText:
	text "Welcome to"
	line "VIRIDIAN CITY."

	para "Head north for"
	line "PEWTER CITY via"
	cont "VIRIDIAN FOREST."

	para "Head south for"
	line "PALLET TOWN."

	para "Head west for the"
	line "#MON LEAGUE,"

	para "MT. SILVER and"
	line "JOHTO."
	done

Route1ViridianGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, VIRIDIAN_CITY, 6
	warp_event  5,  0, VIRIDIAN_CITY, 7
	warp_event  4,  7, ROUTE_1, 1
	warp_event  5,  7, ROUTE_1, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route1ViridianGuardScript, -1
