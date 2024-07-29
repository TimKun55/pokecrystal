	object_const_def
	const FUCHSIACINNABARHOUSE1_SAILOR
	const FUCHSIACINNABARHOUSE1_SCIENTIST

FuchsiaCinnabarHouse1_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaCinnabarHouseSailor:
	faceplayer
	opentext
	writetext SailorMovedHereAfterEruptionText
	waitbutton
	closetext
	end

FuchsiaCinnabarHouseScientist:
	faceplayer
	opentext
	writetext ScientistMovedHereAfterEruptionText
	waitbutton
	closetext
	end

SailorMovedHereAfterEruptionText:
	text "I used to live"
	line "on Cinnabar but"
	
	para "had to move here"
	line "after the volcano"
	cont "erupted."
	
	para "I haven't been out"
	line "on the water since"
	cont "then…"
	done

ScientistMovedHereAfterEruptionText:
	text "I was part of"
	line "Team Rocket over"
	cont "three years ago."
	
	para "I hated the way"
	line "they treated us"
	cont "and their #mon"
	
	para "so I left and"
	line "went into hiding."
	
	para "I had to hide"
	line "because I took a"
	cont "very valuable Map"
	
	para "that they needed"
	line "for one of their"
	cont "schemes."
	
	para "Once I heard that"
	line "they had disbanded"
	
	para "I came out of"
	line "hiding, started"
	
	para "working at the"
	line "Cinnabar Lab and"
	
	para "donated the Map"
	line "to them."
	
	para "Once the volcano"
	line "erupted, though,"
	
	para "it was all over."
	
	para "I lost the Map"
	line "and my job."
	
	para "I moved here and"
	line "started helping"
	
	para "with the Safari"
	line "Zone. It's fun!"
	done

FuchsiaCinnabarHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 11
	warp_event  3,  7, FUCHSIA_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, OBJECTTYPE_SCRIPT, 0, FuchsiaCinnabarHouseSailor, -1
	object_event  5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCinnabarHouseScientist, -1
