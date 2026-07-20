	object_const_def
	const GOLDENRODARTGALLERY_RECEPTIONIST1
	const GOLDENRODARTGALLERY_RECEPTIONIST2
	const GOLDENRODARTGALLERY_GENTLEMAN
	const GOLDENRODARTGALLERY_SCIENTIST
	const GOLDENRODARTGALLERY_GRAMPS
	const GOLDENRODARTGALLERY_BEAUTY
	const GOLDENRODARTGALLERY_TEACHER
	const GOLDENRODARTGALLERY_TWIN
	const GOLDENRODARTGALLERY_EUSINE

GoldenrodArtGallery_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, GoldenrodArtGalleryEusineCheckCallback

GoldenrodArtGalleryEusineCheckCallback:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .NoEusine
	readvar VAR_WEEKDAY
	ifequal MONDAY, .NoEusine
	ifequal WEDNESDAY, .NoEusine
	ifequal FRIDAY, .NoEusine
	appear GOLDENRODARTGALLERY_EUSINE
	endcallback

.NoEusine:
	disappear GOLDENRODARTGALLERY_EUSINE
	endcallback

GoldenrodArtGalleryReceptionistScript:
	jumptextfaceplayer GoldenrodArtGalleryReceptionistText

GoldenrodArtGalleryOwnerScript:
	jumptextfaceplayer GoldenrodArtGalleryOwnerText

GoldenrodArtGalleryScientistScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iftrue .ACompletedPuzzle
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iftrue .ACompletedPuzzle
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iftrue .ACompletedPuzzle
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iftrue .ACompletedPuzzle
	jumptextfaceplayer GoldenrodArtGalleryScientistNoCompletePuzzlesText

.ACompletedPuzzle
	jumptextfaceplayer GoldenrodArtGalleryScientistACompletedPuzzleText

GoldenrodArtGalleryGrampsScript:
	jumptextfaceplayer GoldenrodArtGalleryGrampsText

GoldenrodArtGalleryBeautyScript:
	jumptextfaceplayer GoldenrodArtGalleryBeautyText

GoldenrodArtGalleryTeacherScript:
	jumptextfaceplayer GoldenrodArtGalleryTeacherText

GoldenrodArtGalleryStudentScript:
	jumptextfaceplayer GoldenrodArtGalleryStudentText

GoldenrodArtGalleryEusineScript:
	jumptextfaceplayer GoldenrodArtGalleryEusineText

GoldenrodArtGalleryLugiaPaintingScript:
	refreshscreen
	paintingpic LUGIA_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryLugiaPaintingSignText
	end

GoldenrodArtGalleryBellTowerPaintingScript:
	refreshscreen
	paintingpic BELL_TOWER_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryBellTowerPaintingSignText
	end

GoldenrodArtGalleryHoOhPaintingScript:
	refreshscreen
	paintingpic HO_OH_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryHoOhPaintingSignText
	end

GoldenrodArtGalleryAerodactylPaintingScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .NotCompleted
	refreshscreen
	paintingpic AERODACTYL_PUZZLE
	waitbutton
	closepaintingpic
	end

.NotCompleted
	opentext
	writetextend GoldenrodArtGalleryNothingHereText

GoldenrodArtGalleryHoOhRoAPaintingScript:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse GoldenrodArtGalleryAerodactylPaintingScript.NotCompleted
	refreshscreen
	paintingpic HO_OH_PUZZLE
	waitbutton
	closepaintingpic
	end

GoldenrodArtGalleryKabutoPaintingScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse GoldenrodArtGalleryAerodactylPaintingScript.NotCompleted
	refreshscreen
	paintingpic KABUTO_PUZZLE
	waitbutton
	closepaintingpic
	end

GoldenrodArtGalleryOmanytePaintingScript:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse GoldenrodArtGalleryAerodactylPaintingScript.NotCompleted
	refreshscreen
	paintingpic OMANYTE_PUZZLE
	waitbutton
	closepaintingpic
	end

GoldenrodArtGalleryWestWingSignScript:
	jumptext GoldenrodArtGalleryWestWingSignText

GoldenrodArtGalleryEastWingSignScript:
	jumptext GoldenrodArtGalleryEastWingSignText

GoldenrodArtGalleryVendingMachine:
	jumpstd VendingMachineScript

GoldenrodArtGalleryReceptionistText:
	text "Welcome to the"
	line "Goldenrod Art"
	cont "Gallery."
	
	para "Entry is free"
	line "so please enjoy"
	cont "yourself."
	done

GoldenrodArtGalleryOwnerText:
	ntag " Owner "
	text "Welcome to my"
	line "Art Gallery."
	
	para "Please take your"
	line "time and enjoy"
	cont "all the pieces"
	cont "I've collected!"
	
	para "The West Wing"
	line "displays the"
	cont "#mon that Tim"
	cont "had to remove."

	para "The East Wing has"
	line "some that he"
	cont "wanted to add but"
	cont "didn't have enough"
	cont "space."
	done

GoldenrodArtGalleryScientistNoCompletePuzzlesText:
	text "No one has yet"
	line "completed the"
	cont "puzzles at the"
	cont "Ruins of Alph."
	
	para "When someone does,"
	line "I want to display"
	cont "a copy here!"
	done

GoldenrodArtGalleryScientistACompletedPuzzleText:
	text "It's happening!"

	para "Someone has been"
	line "completing the"
	cont "Alph Puzzles!"
	
	para "Don't they look"
	line "good?"
	done

GoldenrodArtGalleryGrampsText:
	text "There's something"
	line "so peaceful about"
	cont "being surrounded"
	cont "by art."
	done

GoldenrodArtGalleryBeautyText:
	text "I like how quiet"
	line "it is in here."
	done

GoldenrodArtGalleryTeacherText:
	text "I'm here with"
	line "some students."
	
	para "I hope they're"
	line "learning something"
	cont "interesting…"
	done

GoldenrodArtGalleryStudentText:
	text "Wow!"
	
	para "I'd love to see a"
	line "#mon that big!"
	done

GoldenrodArtGalleryEusineText:
	text "<PLAYER>!"
	line "Good to see you."
	
	para "I like coming here"
	line "to reflect on my"
	cont "journey."
	done

GoldenrodArtGalleryNothingHereText:
	text "There's nothing"
	line "displayed yet."
	done

CompletedRoASignText:
	text "A completed sli-"
	line "ding puzzle from"
	cont "the Ruins of Alph."
	done

GoldenrodArtGalleryLugiaPaintingSignText:
	text "  The Leviathan"
	line "     Awakens"
	done

GoldenrodArtGalleryBellTowerPaintingSignText:
	text "    Friendship"
	line "     and Hope"
	done

GoldenrodArtGalleryHoOhPaintingSignText:
	text "   The Phoenix"
	line "    Ascending"
	done

GoldenrodArtGalleryWestWingSignText:
	text "West Wing"
	done

GoldenrodArtGalleryEastWingSignText:
	text "East Wing"
	done

GoldenrodArtGallery_MapEvents:

	def_warp_events
	warp_event 16, 27, GOLDENROD_CITY, 23
	warp_event 17, 27, GOLDENROD_CITY, 24
	warp_event 10,  4, GOLDENROD_ART_GALLERY_WEST_WING, 1
	warp_event 10,  5, GOLDENROD_ART_GALLERY_WEST_WING, 2
	warp_event  4, 18, GOLDENROD_ART_GALLERY_WEST_WING, 3
	warp_event  5, 18, GOLDENROD_ART_GALLERY_WEST_WING, 4
	warp_event 23,  4, GOLDENROD_ART_GALLERY_EAST_WING, 1
	warp_event 23,  5, GOLDENROD_ART_GALLERY_EAST_WING, 2
	warp_event 28, 18, GOLDENROD_ART_GALLERY_EAST_WING, 3
	warp_event 29, 18, GOLDENROD_ART_GALLERY_EAST_WING, 4

	def_coord_events

	def_bg_events
	bg_event  6, 18, BGEVENT_READ, GoldenrodArtGalleryWestWingSignScript
	bg_event 27, 18, BGEVENT_READ, GoldenrodArtGalleryEastWingSignScript
	bg_event 12,  2, BGEVENT_READ, GoldenrodArtGalleryLugiaPaintingScript
	bg_event 13,  2, BGEVENT_READ, GoldenrodArtGalleryLugiaPaintingScript
	bg_event 16,  2, BGEVENT_READ, GoldenrodArtGalleryBellTowerPaintingScript
	bg_event 17,  2, BGEVENT_READ, GoldenrodArtGalleryBellTowerPaintingScript
	bg_event 20,  2, BGEVENT_READ, GoldenrodArtGalleryHoOhPaintingScript
	bg_event 21,  2, BGEVENT_READ, GoldenrodArtGalleryHoOhPaintingScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodArtGalleryAerodactylPaintingScript
	bg_event 21, 10, BGEVENT_READ, GoldenrodArtGalleryHoOhRoAPaintingScript
	bg_event 12, 16, BGEVENT_READ, GoldenrodArtGalleryKabutoPaintingScript
	bg_event 21, 16, BGEVENT_READ, GoldenrodArtGalleryOmanytePaintingScript
	bg_event 12, 25, BGEVENT_UP, GoldenrodArtGalleryVendingMachine
	bg_event 13, 25, BGEVENT_UP, GoldenrodArtGalleryVendingMachine
	bg_event 20, 25, BGEVENT_UP, GoldenrodArtGalleryVendingMachine
	bg_event 21, 25, BGEVENT_UP, GoldenrodArtGalleryVendingMachine

	def_object_events
	object_event 19, 24, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryReceptionistScript, -1
	object_event 14, 24, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryReceptionistScript, -1
	object_event 16, 19, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryOwnerScript, -1
	object_event 14, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryScientistScript, -1
	object_event  9, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryGrampsScript, -1
	object_event 17, 13, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 3, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryBeautyScript, -1
	object_event 18, 22, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryTeacherScript, -1
	object_event 13,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryStudentScript, -1
	object_event 16,  5, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryEusineScript, EVENT_ART_GALLERY_EUSINE
