	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST4

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphResearchCenterNoopScene,        SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

RuinsOfAlphResearchCenterNoopScene:
	end

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .CaveDoorOpen
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.CaveDoorOpen:
	checkitem GS_BALL
	iftrue .GSBall
	checkitem BALL_RELIC
	iftrue .BallRelic
	writetext RuinsOfAlphResearchCenterScientist3_AllUnown
	waitbutton
	closetext
	end

.GSBall:
	writetext RuinsOfAlphResearchCenterScientist3_GSBall
	waitbutton
	closetext
	end

.BallRelic:
	writetext RuinsOfAlphResearchCenterScientist3_BallRelic1
	waitbutton
	closetext
	takeitem BALL_RELIC
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, UP
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 10
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 10
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 10
	faceplayer
	opentext
	writetext RuinsOfAlphResearchCenterScientist3_BallRelic2
	waitbutton
	verbosegiveitem GS_BALL
	closetext
	setevent EVENT_RESEARCH_CENTER_GS_BALL
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end
	
RuinsOfAlphResearchCenterFossilScientist:
	faceplayer
	opentext
	checkevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	iftrue .GiveAerodactyl
	checkevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	iftrue .GiveOmanyte
	writetext FossilScientistIntroText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue IsOldAmber
	writetext FossilScientistNoFossilText
	waitbutton
	closetext
	end

.GiveOmanyte:

	playsound SFX_FULL_HEAL
	writetext FossilScientistDoneText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx	
	givepoke OMANYTE, 30
	writetext FossilScientistGoodCareText
	waitbutton
	closetext
	clearevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	end

.GiveKabuto:
	writetext FossilScientistDoneText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 30
	writetext FossilScientistGoodCareText
	waitbutton
	closetext
	clearevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	end

.GiveAerodactyl:
	writetext FossilScientistDoneText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedAerodactylText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 30
	writetext FossilScientistGoodCareText
	waitbutton
	closetext
	clearevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	end

.NoRoom:
	writetext FossilScientistPartyFullText
	waitbutton
	closetext
	end

.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_amber
	writetext FossilScientistIsHelixFossilText
	yesorno
	iftrue IsHelixFossil
	jump .no_fossil

.own_dome
	checkitem OLD_AMBER
	iftrue .ask_dome_amber
	writetext FossilScientistIsDomeFossilText
	yesorno
	iftrue IsDomeFossil
	jump .no_fossil

.own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsDomeFossil
	jump .no_fossil

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsOldAmber
	jump .no_fossil

.ask_dome_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsDomeFossil
	ifequal $2, IsOldAmber
	jump .no_fossil

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsDomeFossil
	ifequal $3, IsOldAmber
.no_fossil:
	writetext FossilScientistNoFossilText
	waitbutton
	closetext
	end

HelixDomeMenuDataHeader:
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

HelixAmberMenuDataHeader:
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

DomeAmberMenuDataHeader:
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

HelixDomeAmberMenuDataHeader:
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

IsHelixFossil:
	writetext FossilScientistIsHelixFossilText
	yesorno
	iffalse DeniedRessurection
	writetext FossilScientistTimeText
	waitbutton
	closetext
	takeitem HELIX_FOSSIL
	setevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	special FadeOutToBlack 
	special ReloadSpritesNoPalettes
	playsound SFX_WARP_TO
	waitsfx
	pause 35
	sjump RuinsOfAlphResearchCenterFossilScientist

IsDomeFossil:
	writetext FossilScientistIsDomeFossilText
	yesorno
	iffalse DeniedRessurection
	writetext FossilScientistTimeText
	waitbutton
	closetext
	takeitem DOME_FOSSIL
	setevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	special FadeOutToBlack 
	special ReloadSpritesNoPalettes
	playsound SFX_WARP_TO
	waitsfx
	pause 35
	sjump RuinsOfAlphResearchCenterFossilScientist

IsOldAmber:
	writetext FossilScientistIsOldAmberText
	yesorno
	iffalse DeniedRessurection
	writetext FossilScientistTimeText
	waitbutton
	closetext
	takeitem OLD_AMBER
	setevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	special FadeOutToBlack 
	special ReloadSpritesNoPalettes
	playsound SFX_WARP_TO
	waitsfx
	pause 35
	sjump RuinsOfAlphResearchCenterFossilScientist

DeniedRessurection:
	writetext FossilScientistNoFossilText
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Done!"

	para "I modified your"
	line "#dex."

	para "I added an"
	line "optional #dex"

	para "to store Unown"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>'s #dex"
	line "was upgraded."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "The Unown you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done

RuinsOfAlphResearchCenterScientist3_AllUnown:
	text "I still can't"
	line "believe all the"

	para "things we've dis-"
	line "covered and learn-"
	cont "ed about!"
	
	para "I love my job!"
	done

RuinsOfAlphResearchCenterScientist3_GSBall:
	text "I wonder what you"
	line "can use that"
	cont "Ball for…?"
	done

RuinsOfAlphResearchCenterScientist3_BallRelic1:
	text "<PLAYER>,"
	line "you're back!"

	para "What did you find?"
	
	para "This? It looks"
	line "like a # Ball…"
	
	para "Let me clean"
	line "it up a bit."
	done

RuinsOfAlphResearchCenterScientist3_BallRelic2:
	text "This is definitely"
	line "a # Ball, but"
	
	para "not like any I've"
	line "ever seen."
	
	para "Look here, there's"
	line "a 'G' and an 'S'…"
	
	para "Tell you what,"
	line "why don't you take"
	
	para "this to Kurt in"
	line "Azalea Town?"
	
	para "# Balls are his"
	line "speciality."
	
	para "If anyone can"
	line "help with this,"
	cont "it's him."
	done

RuinsOfAlphResearchCenterScientist3_MoreToDiscover:
	text "No matter how much"
	line "we learn and dis-"
	cont "cover, there's"
	
	para "always more to"
	line "learn and find."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The Ruins are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #mon"
	cont "are in the Ruins?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#mon appeared"
	line "in the Ruins?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the Ruins."

	para "The Ruins appear"
	line "to have been built"

	para "as a habitat for"
	line "#mon."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "Ruins."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the Ruins."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "mon you saw in the"
	cont "Ruins?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done
	
FossilScientistIntroText:
	text "Hiya!"

	para "I am important"
	line "doctor from Kanto!"
	
	para "Everyone here"
	line "is studying"
	cont "Unown, but"

	para "I study rare"
	line "#mon fossils!"

	para "Do you have a"
	line "fossil for me?"
	done

FossilScientistNoFossilText:
	text "No fossils?"
	line "Too bad!"
	done

FossilScientistNoText:
	text "No? Too bad!"

	para "Come again!"
	done

FossilScientistPartyFullText:
	text "Oh no!"

	para "Your party is"
	line "already full!"
	
	para "I'll hold onto it"
	line "while you make"
	cont "room for it."
	done

FossilScientistTimeText:
	text "Give me a second…"
	done

FossilScientistDoneText:
	text "There we are!"

	para "All done!"
	done

FossilScientistIsHelixFossilText:
	text "Oh! That's a"
	line "Helix Fossil!"

	para "That's the fossil"
	line "of Omanyte, an"
	cont "extinct #mon."

	para "Should I bring it"
	line "back to life?"
	done

FossilScientistIsDomeFossilText:
	text "Oh! That's a"
	line "Dome Fossil!"

	para "That's the fossil"
	line "of Kabuto, an"
	cont "extinct #mon."

	para "Should I bring it"
	line "back to life?"
	done

FossilScientistIsOldAmberText:
	text "Oh! That's some"
	line "Old Amber!"

	para "That's the fossil"
	line "of Aerodactyl, an"
	cont "extinct #mon."

	para "Should I bring it"
	line "back to life?"
	done

FossilScientistGiveText:
	text "So! You hurry and"
	line "give me that!"

	para "<PLAYER> handed"
	line "over the fossil."
	done

ReceivedAerodactylText:
	text "<PLAYER> received"
	line "Aerodactyl!"
	done

ReceivedOmanyteText:
	text "<PLAYER> received"
	line "Omanyte!"
	done

ReceivedKabutoText:
	text "<PLAYER> received"
	line "Kabuto!"
	done

FossilScientistGoodCareText:
	text "Take good care"
	line "of it!"
	done

RuinsOfAlphResearchCenterComputerText:
	text "Ruins Of Alph"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mystery #mon"
	line "Name: Unown"

	para "A total of {d:NUM_UNOWN}"
	line "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "Unown may be"
	line "printed out."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "It's a photo of"
	line "the Research"

	para "Center's founder,"
	line "Prof.Silktree."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	object_event  0,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterFossilScientist, -1
	