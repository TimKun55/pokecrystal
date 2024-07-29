	object_const_def
	const CINNABARVOLCANO1F_OFFICER

CinnabarVolcano1F_MapScripts:
	def_scene_scripts

	def_callbacks
	
CinnabarVolcano1FOfficer:
	faceplayer
	opentext
	writetext CinnabarVolcano1FOfficerText
	waitbutton
	closetext
	end
	
CinnabarVolcano1FSign:
	jumptext CinnabarVolcanoSignText
	
CinnabarVolcano1FOfficerText:
	text "Hello."
	
	para "The Gym is up"
	line "the ladder to"
	cont "the north."
	
	para "The ladder to the"
	line "south will take"
	
	para "you deeper into"
	line "the volcano."
	
	para "It's usually"
	line "closed off, but"
	cont "I see you have"
	
	para "all the Johto"
	line "Badges. Please"
	cont "be careful."
	done
	
CinnabarVolcanoSignText:
	text "Cinnabar Island"
	line "#mon Gym ahead"
	done

CinnabarVolcano1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 11, CINNABAR_ISLAND, 2
	warp_event 13,  5, CINNABAR_VOLCANO_2F, 1
	warp_event  5, 17, CINNABAR_VOLCANO_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, CinnabarVolcano1FSign

	def_object_events
	object_event 13, 10, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CinnabarVolcano1FOfficer, -1
	