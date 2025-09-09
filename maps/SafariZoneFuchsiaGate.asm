	object_const_def
	const SAFARIZONEFUCHSIAGATE_OFFICER

SafariZoneFuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneFuchsiaGateOfficerScript:
	jumptextfaceplayer SafariZoneFuchsiaGateOfficerText

SafariZoneFuchsiaGateOfficerText:
	text "Welcome to the"
	line "Safari Zone!"

	para "It's free entry"
	line "but be careful."

	para "You'll find some"
	line "rare, but strong"
	cont "#mon out there!"
	done

SafariZoneFuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFARI_ZONE_HUB, 1
	warp_event  5,  0, SAFARI_ZONE_HUB, 2
	warp_event  4,  7, FUCHSIA_CITY, 6
	warp_event  5,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneFuchsiaGateOfficerScript, -1
