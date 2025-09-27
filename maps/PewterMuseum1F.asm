	object_const_def
	const PEWTERMUSEUM1F_RECEPTIONIST1
	const PEWTERMUSEUM1F_RECEPTIONIST2
	const PEWTERMUSEUM1F_SCIENTIST1
	const PEWTERMUSEUM1F_SCIENTIST2
	const PEWTERMUSEUM1F_GRAMPS
	const PEWTERMUSEUM1F_SCHOOLBOY
	const PEWTERMUSEUM1F_OLD_AMBER
	const PEWTERMUSEUM1F_DOME_FOSSIL
	const PEWTERMUSEUM1F_HELIX_FOSSIL

PewterMuseum1F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum1FReceptionistScript:
	jumptextfaceplayer PewterMuseum1FReceptionistText

PewterMuseum1FScientistScript:
	jumptextfaceplayer PewterMuseum1FScientistText

PewterMuseum1FFossilScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_PEWTER_SCIENTIST_OLD_AMBER
	iftrue .GiveAerodactyl
	checkevent EVENT_GAVE_PEWTER_SCIENTIST_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_PEWTER_SCIENTIST_HELIX_FOSSIL
	iftrue .GiveOmanyte
	writetext PewterMuseumFossilScientistIntroText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue PewterIsOldAmber
	writetext PewterMuseumFossilScientistNoFossilText
	waitbutton
	closetext
	turnobject PEWTERMUSEUM1F_SCIENTIST2, RIGHT
	end

.GiveOmanyte:
	writetext PewterMuseumFossilScientistDoneText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext PewterMuseumReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx	
	givepoke OMANYTE, 45
	writetext PewterMuseumFossilScientistGoodCareText
	waitbutton
	closetext
	clearevent EVENT_GAVE_PEWTER_SCIENTIST_HELIX_FOSSIL
	end

.GiveKabuto:
	writetext PewterMuseumFossilScientistDoneText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext PewterMuseumReceivedKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 45
	writetext PewterMuseumFossilScientistGoodCareText
	waitbutton
	closetext
	clearevent EVENT_GAVE_PEWTER_SCIENTIST_DOME_FOSSIL
	end

.GiveAerodactyl:
	writetext PewterMuseumFossilScientistDoneText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext PewterMuseumReceivedAerodactylText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 50
	writetext PewterMuseumFossilScientistGoodCareText
	waitbutton
	closetext
	clearevent EVENT_GAVE_PEWTER_SCIENTIST_OLD_AMBER
	end

.NoRoom:
	writetextend PewterMuseumFossilScientistPartyFullText

.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_amber
	sjump PewterIsHelixFossil

.own_dome
	checkitem OLD_AMBER
	iftrue .ask_dome_amber
	sjump PewterIsDomeFossil

.own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_dome_amber
	loadmenu PewterHelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, PewterIsHelixFossil
	ifequal $2, PewterIsDomeFossil
	jump .no_fossil

.ask_helix_amber
	loadmenu PewterHelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, PewterIsHelixFossil
	ifequal $2, PewterIsOldAmber
	jump .no_fossil

.ask_dome_amber
	loadmenu PewterDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, PewterIsDomeFossil
	ifequal $2, PewterIsOldAmber
	jump .no_fossil

.ask_helix_dome_amber
	loadmenu PewterHelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, PewterIsHelixFossil
	ifequal $2, PewterIsDomeFossil
	ifequal $3, PewterIsOldAmber
.no_fossil:
	writetextend PewterMuseumFossilScientistNoFossilText

PewterHelixDomeMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Cancel@"

PewterHelixAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Old Amber@"
	db "Cancel@"

PewterDomeAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"

PewterHelixDomeAmberMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"

PewterIsHelixFossil:
	writetext PewterMuseumFossilScientistIsHelixFossilText
	yesorno
	iffalse PewterDeniedRessurection
	writetext PewterMuseumFossilScientistTimeText
	waitbutton
	closetext
	takeitem HELIX_FOSSIL
	setevent EVENT_GAVE_PEWTER_SCIENTIST_HELIX_FOSSIL
	turnobject PEWTERMUSEUM1F_SCIENTIST2, UP
	pause 24
	playsound SFX_BOOT_PC
	waitsfx
	pause 24
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 24
	playsound SFX_WARP_TO
	waitsfx
	pause 24
	playsound SFX_FULL_HEAL
	waitsfx
	pause 24
	sjump PewterMuseum1FFossilScientistScript

PewterIsDomeFossil:
	writetext PewterMuseumFossilScientistIsDomeFossilText
	yesorno
	iffalse PewterDeniedRessurection
	writetext PewterMuseumFossilScientistTimeText
	waitbutton
	closetext
	takeitem DOME_FOSSIL
	setevent EVENT_GAVE_PEWTER_SCIENTIST_DOME_FOSSIL
	turnobject PEWTERMUSEUM1F_SCIENTIST2, UP
	pause 24
	playsound SFX_BOOT_PC
	waitsfx
	pause 24
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 24
	playsound SFX_WARP_TO
	waitsfx
	pause 24
	playsound SFX_FULL_HEAL
	waitsfx
	pause 24
	sjump PewterMuseum1FFossilScientistScript

PewterIsOldAmber:
	writetext PewterMuseumFossilScientistIsOldAmberText
	yesorno
	iffalse PewterDeniedRessurection
	writetext PewterMuseumFossilScientistTimeText
	waitbutton
	closetext
	takeitem OLD_AMBER
	setevent EVENT_GAVE_PEWTER_SCIENTIST_OLD_AMBER
	turnobject PEWTERMUSEUM1F_SCIENTIST2, UP
	pause 24
	playsound SFX_BOOT_PC
	waitsfx
	pause 24
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 24
	playsound SFX_WARP_TO
	waitsfx
	pause 24
	playsound SFX_FULL_HEAL
	waitsfx
	pause 24
	sjump PewterMuseum1FFossilScientistScript

PewterDeniedRessurection:
	writetextend PewterMuseumFossilScientistNoFossilText

AerodactylFossilScript:
	opentext
	writetext AerodactylFossilText
	waitbutton
	closetext
	refreshscreen
	trainerpic AERODACTYL_FOSSIL
	waitbutton
	closepokepic
	end

KabutopsFossilScript:
	opentext
	writetext KabutopsFossilText
	waitbutton
	closetext
	refreshscreen
	trainerpic KABUTOPS_FOSSIL
	waitbutton
	closepokepic
	end

OmastarFossilScript:
	opentext
	writetext OmastarFossilText
	waitbutton
	closetext
	refreshscreen
	trainerpic OMASTAR_FOSSIL
	waitbutton
	closepokepic
	end

PewterMuseum1FGrampsScript:
	jumptextfaceplayer PewterMuseum1FGrampsText

PewterMuseum1FYoungsterScript:
	jumptextfaceplayer PewterMuseum1FYoungsterText

PewterMuseum1FOldAmberScript:
	jumptext PewterMuseum1FOldAmberText

PewterMuseum1FDomeFossilScript:
	jumptext PewterMuseum1FDomeFossilText

PewterMuseum1FHelixFossilScript:
	jumptext PewterMuseum1FHelixFossilText

PewterMuseum1FBookshelfScript:
	jumptext PewterMuseum1FBookshelfText

PewterMuseum1FMachineScript:
	jumptext PewterMuseum1FMachineText

PewterMuseum1FFossilDeptScript:
	jumptext PewterMuseum1FFossilDeptText

PewterMuseum1FSpaceDeptScript:
	jumptext PewterMuseum1FSpaceDeptText

PewterMuseum1FVendingMachine:
	jumpstd VendingMachineScript

PewterMuseum1FReceptionistText:
	text "Welcome to the"
	line "Pewter Museum"
	cont "Of Science."
	
	para "We've just re-"
	line "opened after"
	cont "renovations"
	cont "and entry is free!"
	done

PewterMuseum1FScientistText:
	text "We are proud of"
	line "three fossils of"
	cont "rare, prehistoric"
	cont "#mon."

	para "I helped assemble"
	line "them!"
	done

PewterMuseumFossilScientistIntroText:
	text "Hiya!"

	para "Did you know that"
	line "you can extract"
	cont "#mon from"
	cont "fossils?"

	para "Do you have a"
	line "fossil for me?"
	done

PewterMuseumFossilScientistNoFossilText:
	text "No fossils?"
	line "Too bad!"
	done

PewterMuseumFossilScientistNoText:
	text "No? Too bad!"

	para "Come again!"
	done

PewterMuseumFossilScientistPartyFullText:
	text "Oh no!"

	para "Your party is"
	line "already full!"
	
	para "I'll hold onto it"
	line "while you make"
	cont "room for it."
	done

PewterMuseumFossilScientistTimeText:
	text "Give me a second…"
	done

PewterMuseumFossilScientistDoneText:
	text "There we are!"

	para "All done!"
	done

PewterMuseumFossilScientistIsHelixFossilText:
	text "Oh! That's a"
	line "Helix Fossil!"

	para "That's the fossil"
	line "of Omanyte, an"
	cont "extinct #mon."

	para "Should I bring it"
	line "back to life?"
	done

PewterMuseumFossilScientistIsDomeFossilText:
	text "Oh! That's a"
	line "Dome Fossil!"

	para "That's the fossil"
	line "of Kabuto, an"
	cont "extinct #mon."

	para "Should I bring it"
	line "back to life?"
	done

PewterMuseumFossilScientistIsOldAmberText:
	text "Oh! That's some"
	line "Old Amber!"

	para "That contains DNA"
	line "of Aerodactyl, an"
	cont "extinct #mon."

	para "Should I bring it"
	line "back to life?"
	done

PewterMuseumFossilScientistGiveText:
	text "So! You hurry and"
	line "give me that!"

	para "<PLAYER> handed"
	line "over the fossil."
	done

PewterMuseumReceivedAerodactylText:
	text "<PLAYER> received"
	line "Aerodactyl!"
	done

PewterMuseumReceivedOmanyteText:
	text "<PLAYER> received"
	line "Omanyte!"
	done

PewterMuseumReceivedKabutoText:
	text "<PLAYER> received"
	line "Kabuto!"
	done

PewterMuseumFossilScientistGoodCareText:
	text "Take good care"
	line "of it!"
	done

PewterMuseum1FGrampsText:
	text "That is one"
	line "magnificent"
	cont "fossil!"
	done

PewterMuseum1FYoungsterText:
	text "There are two"
	line "places that I"
	cont "love!"

	para "One is the Ruins"
	line "of Alph in Johto."

	para "The other is the"
	line "Pewter Museum!"

	para "I get a sense of"
	line "history from both"
	cont "of them."
	done

PewterMuseum1FOldAmberText:
	text "A piece of amber"
	line "that still con-"
	cont "tains the genetic"
	cont "material of a"
	cont "prehistoric"
	cont "#mon."

	para "It's clear with a"
	line "reddish tint."
	done

PewterMuseum1FDomeFossilText:
	text "A fossil from a"
	line "prehistoric"

	para "#mon that once"
	line "lived in the sea."
	
	para "It could be a"
	line "shell or carapace."
	done

PewterMuseum1FHelixFossilText:
	text "A fossil from a"
	line "prehistoric"

	para "#mon that once"
	line "lived in the sea."

	para "It might be a"
	line "piece of a"
	cont "seashell."
	done

AerodactylFossilText:
	text "Aerodactyl Fossil"

	para "A primitive and"
	line "rare #mon."
	done

KabutopsFossilText:
	text "Kabutops Fossil"
	line "(Dome)"

	para "A primitive and"
	line "rare #mon."
	done

OmastarFossilText:
	text "Omastar Fossil"
	line "(Helix)"

	para "A primitive and"
	line "rare #mon."
	done

PewterMuseum1FBookshelfText:
	text "Thick and well-"
	line "read books!"

	para "Archaeology Man-"
	line "ual, Lost #mon,"
	cont "#mon Ancestors…"
	done

PewterMuseum1FMachineText:
	text "A very complicated"
	line "and expensive-"
	cont "looking computer."
	
	para "Better not"
	line "touch it!"
	done

PewterMuseum1FFossilDeptText:
	text "Pewter Museum"
	line "Fossil Department"
	done

PewterMuseum1FSpaceDeptText:
	text "Upstairs for"
	line "Pewter Museum"
	cont "Space Department"
	done

PewterMuseum1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 19, PEWTER_CITY, 6
	warp_event 13, 19, PEWTER_CITY, 6
	warp_event  2,  7, PEWTER_MUSEUM_2F, 1

	def_coord_events

	def_bg_events
	bg_event  9,  6, BGEVENT_READ, KabutopsFossilScript
	bg_event 15,  6, BGEVENT_READ, OmastarFossilScript
	bg_event 12,  9, BGEVENT_READ, AerodactylFossilScript
	bg_event  8,  3, BGEVENT_READ, PewterMuseum1FBookshelfScript
	bg_event  9,  3, BGEVENT_READ, PewterMuseum1FBookshelfScript
	bg_event 16,  3, BGEVENT_READ, PewterMuseum1FBookshelfScript
	bg_event 17,  3, BGEVENT_READ, PewterMuseum1FBookshelfScript
	bg_event 28,  5, BGEVENT_READ, PewterMuseum1FMachineScript
	bg_event  4,  7, BGEVENT_READ, PewterMuseum1FSpaceDeptScript
	bg_event  5,  7, BGEVENT_READ, PewterMuseum1FSpaceDeptScript
	bg_event 20,  7, BGEVENT_READ, PewterMuseum1FFossilDeptScript
	bg_event 21,  7, BGEVENT_READ, PewterMuseum1FFossilDeptScript
	bg_event 10, 15, BGEVENT_UP, PewterMuseum1FVendingMachine
	bg_event 11, 15, BGEVENT_UP, PewterMuseum1FVendingMachine
	bg_event 14, 15, BGEVENT_UP, PewterMuseum1FVendingMachine
	bg_event 15, 15, BGEVENT_UP, PewterMuseum1FVendingMachine

	def_object_events
	object_event 15, 12, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FReceptionistScript, -1
	object_event 10, 12, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FReceptionistScript, -1
	object_event 24,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FScientistScript, -1
	object_event 28,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FFossilScientistScript, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FGrampsScript, -1
	object_event 19, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FYoungsterScript, -1
	object_event 23,  5, SPRITE_FOSSILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FOldAmberScript, -1
	object_event 24,  5, SPRITE_FOSSILS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FDomeFossilScript, -1
	object_event 25,  5, SPRITE_FOSSILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FHelixFossilScript, -1
