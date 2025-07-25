	object_const_def
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	def_scene_scripts
	scene_script Route6SaffronGateNoopScene ; unusable

	def_callbacks

Route6SaffronGateNoopScene:
	end

Route6SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext Route6SaffronGuardWelcomeText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route6SaffronGuardMagnetTrainText
	waitbutton
	closetext
	end

Route6SaffronGuardWelcomeText:
	text "Welcome to Saffron"
	line "City, home of the"
	cont "Magnet Train!"

	para "…That's what I'd"
	line "normally say, but"

	para "the Magnet Train"
	line "isn't running now."

	para "It's not getting"
	line "any electricity"

	para "because there's"
	line "something wrong"

	para "with the Power"
	line "Plant."
	done

Route6SaffronGuardMagnetTrainText:
	text "The Magnet Train"
	line "is one of the most"

	para "famous things"
	line "about Saffron."
	done

Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFFRON_CITY, 15
	warp_event  5,  0, SAFFRON_CITY, 16
	warp_event  4,  7, ROUTE_6, 3
	warp_event  5,  7, ROUTE_6, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
