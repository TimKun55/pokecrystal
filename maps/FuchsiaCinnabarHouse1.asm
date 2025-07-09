	object_const_def
	const FUCHSIACINNABARHOUSE1_SAILOR
	const FUCHSIACINNABARHOUSE1_SCIENTIST

FuchsiaCinnabarHouse1_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaCinnabarHouseSailor:
	faceplayer
	opentext
	checkitem OLD_SEA_MAP
	iftrue .HasOldSeaMap
	writetext SailorMovedHereAfterEruptionText
	waitbutton
	closetext
	end

.HasOldSeaMap:
	writetext SailorThatMapText
	waitbutton
	closetext
	clearevent EVENT_VERMILION_SAILORS_HOUSE_SAILOR
	readvar VAR_FACING
	ifnotequal UP, .PathClear
	applymovement PLAYER, PlayerMovement
.PathClear:
	applymovement FUCHSIACINNABARHOUSE1_SAILOR, FuchsiaCinnabarHouseSailorExitMovement
	disappear FUCHSIACINNABARHOUSE1_SAILOR
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

FuchsiaCinnabarHouseScientist:
	faceplayer
	opentext
	checkevent EVENT_READ_FARAWAY_ISLAND_SIGN
	iftrue .IslandVisited
	checkitem OLD_SEA_MAP
	iftrue .MapFound
	writetext ScientistMovedHereAfterEruptionText
	waitbutton
	closetext
	end

.MapFound:
	writetext ScientistMapExcitedText
	waitbutton
	closetext
	end

.IslandVisited:
	writetext ScientistVisitedIslandText
	waitbutton
	closetext
	end	

PlayerMovement:
	step LEFT
	turn_head RIGHT
	step_end

FuchsiaCinnabarHouseSailorExitMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

SailorMovedHereAfterEruptionText:
	text "I used to live"
	line "on Cinnabar but"
	
	para "had to move afer"
	line "after the volcano"
	cont "erupted."
	
	para "I live over in"
	line "Vermilion now and"
	cont "have my boat"
	cont "there, but I"
	cont "haven't been out"
	cont "on the water since"
	cont "then."
	
	para "I have no reason"
	line "go exploring…"
	done

SailorThatMapText:
	text "Wait!"
	
	para "That Map in your"
	line "pack…!"
	
	para "May I please"
	line "see it?"
	
	para "… … …"
	
	para "Wow!"
	
	para "Listen, can you"
	line "bring this Map"
	cont "to my house in"
	cont "Vermilion City?"
	
	para "I'll be waiting!"
	done

ScientistMovedHereAfterEruptionText:
	text "I was part of"
	line "Team Rocket over"
	cont "three years ago."
	
	para "I hated the way"
	line "they treated us"
	cont "and their #mon"
	cont "so I left and"
	cont "went into hiding."
	
	para "I had to hide"
	line "because I took a"
	cont "very valuable Map"
	cont "that they needed"
	cont "for one of their"
	cont "schemes."
	
	para "I lost it at some"
	line "point around"
	cont "Vermilion, but I"
	cont "don't know where."
	
	para "I was going to"
	line "give it to my"
	cont "Sailor friend and"
	cont "we were going to"
	cont "sail away."
	
	para "Once I heard that"
	line "Team Rocket had"
	cont "broken up, I came"
	cont "out of hiding and"
	cont "started working at"
	cont "the Cinnabar Lab."
	
	para "Once the volcano"
	line "erupted, though,"
	cont "it was all over."
	
	para "I had lost the Map"
	line "and then my job."
	
	para "I moved here and"
	line "started helping"
	cont "with the Safari"
	cont "Zone. It's fun!"
	done

ScientistMapExcitedText:
	text "I can't belive you"
	line "found that Map!"
	
	para "So it WAS in"
	line "Vermilion City"
	cont "but it was under"
	cont "a truck?"
	
	para "How did it get"
	line "there, though?"
	done

ScientistVisitedIslandText:
	text "Hi <PLAYER>!"
	
	para "Good to see you"
	line "again."
	
	para "Since visiting the"
	line "Island, I keep"
	cont "getting the urge"
	cont "to go back!"
	
	para "I wonder if I can"
	line "take some time off"
	cont "of work…"
	done

FuchsiaCinnabarHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 11
	warp_event  3,  7, FUCHSIA_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, OBJECTTYPE_SCRIPT, 0, FuchsiaCinnabarHouseSailor, EVENT_FUCHSIA_CINNABAR_HOUSE1_SAILOR
	object_event  5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCinnabarHouseScientist, -1
