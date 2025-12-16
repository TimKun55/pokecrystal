	object_const_def
	const SAFARIZONEFUCHSIAGATE_OFFICER1
	const SAFARIZONEFUCHSIAGATE_OFFICER2
	const SAFARIZONEFUCHSIAGATE_SCIENTIST	

SafariZoneFuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneFuchsiaGateOfficerScript:
	jumptextfaceplayer SafariZoneFuchsiaGateOfficerText

SafariZoneFuchsiaGateScientistScript:
	jumptextfaceplayer SafariZoneFuchsiaGateScientistText

SafariZoneFuchsiaGateOfficerText:
	text "Welcome to the"
	line "Safari Zone!"

	para "It's free entry"
	line "but be careful."

	para "You'll find some"
	line "rare, but strong"
	cont "#mon out there!"
	done

SafariZoneFuchsiaGateScientistText:
	text "My team and I are"
	line "documenting the"
	cont "habitat changes of"
	cont "#mon in the"
	cont "Safari Zone!"
	
	para "If you need help"
	line "finding certain"
	cont "#mon, find"
	cont "my teammates."
	
	para "They should be in"
	line "each area's Rest"
	cont "House."
	done

SafariZoneFuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  0, SAFARI_ZONE_HUB, 1
	warp_event  6,  0, SAFARI_ZONE_HUB, 2
	warp_event  5,  7, FUCHSIA_CITY, 6
	warp_event  6,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneFuchsiaGateOfficerScript, -1
	object_event  8,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneFuchsiaGateOfficerScript, -1
	object_event  0,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneFuchsiaGateScientistScript, -1