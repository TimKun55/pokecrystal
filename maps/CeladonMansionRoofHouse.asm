	object_const_def
	const CELADONMANSIONROOFHOUSE_GRANNY1
	const CELADONMANSIONROOFHOUSE_GRANNY2
	const CELADONMANSIONROOFHOUSE_PSYDUCK
	const CELADONMANSIONROOFHOUSE_WOOPER
	

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CeladonMansionRoofHouseGrannyPlayingCallback
	
CeladonMansionRoofHouseGrannyPlayingCallback:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .GrannyStreaming
	ifequal MONDAY, .GrannyStreaming
	ifequal WEDNESDAY, .GrannyStreaming
	ifequal THURSDAY, .GrannyStreaming
	disappear CELADONMANSIONROOFHOUSE_GRANNY1
	appear CELADONMANSIONROOFHOUSE_GRANNY2
	endcallback

.GrannyStreaming:
	disappear CELADONMANSIONROOFHOUSE_GRANNY2
	appear CELADONMANSIONROOFHOUSE_GRANNY1
	endcallback

CeladonMansionRoofHouseGrannyStream:
	faceplayer
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SundaeScaries
	writetext GrannyStreamingText
	waitbutton
	closetext
	turnobject CELADONMANSIONROOFHOUSE_GRANNY1, UP
	end
	
.SundaeScaries
	writetext GrannySundaeScariesText
	waitbutton
	closetext
	turnobject CELADONMANSIONROOFHOUSE_GRANNY1, UP
	end

CeladonMansionRoofHouseGrannyWatch:
	faceplayer
	opentext
	writetext GrannyWatchingStreamText
	waitbutton
	closetext
	turnobject CELADONMANSIONROOFHOUSE_GRANNY2, UP
	end
	
CeladonMansionRoofHousePsyduckScript:
	opentext
	writetext GrannyHousePsyduckText
	cry PSYDUCK
	waitbutton
	refreshscreen
	pokepic PSYDUCK
	waitbutton
	closepokepic
	closetext
	end
	
CeladonMansionRoofHouseWooperScript:
	opentext
	writetext GrannyHouseWooperText
	cry WOOPER
	waitbutton
	refreshscreen
	pokepic WOOPER
	waitbutton
	closepokepic
	closetext
	end
	
GrannysPC:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SundaeScariesPC
	ifequal TUESDAY, .NotStreamingPC
	ifequal FRIDAY, .NotStreamingPC
	ifequal SATURDAY, .NotStreamingPC
	jumptext GrannysPCText
	
.SundaeScariesPC
	jumptext SundaeScariesGrannysPCText

.NotStreamingPC
	jumptext GrannyWatchPCText

GrannysTV:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .NotStreamingTV
	ifequal FRIDAY, .NotStreamingTV
	ifequal SATURDAY, .NotStreamingTV
	jumptext GrannysTVText
	
.NotStreamingTV
	jumptext GrannyWatchTVText

GrannyStreamingText:
	text "Sorry, dear,"
	line "I'm streaming"
	cont "right now."
	
	para "Come back"
	line "another time."
	done

GrannySundaeScariesText:
	text "URAAAAAAHHHHH!!!"
	
	para "Oh, dear, you"
	line "scared the life"
	cont "out of me!!"
	
	para "I'm seeing stars!"
	
	para "Jeez…"
	
	para "Today is Sundae"
	line "Scaries, so I'm"
	cont "extra jumpy."
	done
	
GrannyWatchingStreamText:
	text "Today is a day"
	line "off, but I like"
	cont "watching others"
	cont "stream."
	
	para "It's good fun!"
	
	para "Good luck out"
	line "there, dear and"
	
	para "remember to ask"
	line "yourself the"
	cont "three questions:"
	
	para "'What is because"
	line "of me?',"
	
	para "'What is because"
	line "of others?',"
	cont "and,"
	
	para "'What is because.'"
	
	para "If you can answer"
	line "those questions"
	cont "honestly, you can"
	
	para "get through"
	line "anything in life."
	
	para "I love you very"
	line "much, dear."

	para "You're doing"
	line "so well!"
	
	para "Raspberries!!!"
	done
	
GrannyHousePsyduckText:
	text "Psyduck: Psyyy?"
	done

GrannyHouseWooperText::
	text "Wooper: Oopa?"
	
	para "        :0        "
	done
	
GrannysPCText:
	text "There's some kind"
	line "of video game"
	cont "on the screen."
	
	para "A bunch of people"
	line "in different colo-"
	cont "red space suits?"
	
	para "Looks like fun!"
	done
	
SundaeScariesGrannysPCText:
	text "There's some kind"
	line "of video game"
	cont "on the screen."
	
	para "It looks super"
	line "scary!"
	
	para "Looks like fun…?"
	done

GrannyWatchPCText:
	text "Lots of people"
	line "are commenting"
	cont "on the game"
	cont "being played."
	
	para "They seem to be"
	line "having a fun time!"
	done

GrannysTVText:
	text "The TV is off."
	done

GrannyWatchTVText:
	text "This looks like"
	line "a fun game!"
	
	para "Better move so"
	line "Granny can keep"
	cont "watching."
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, GrannysPC
	bg_event  7,  1, BGEVENT_READ, GrannysPC
	bg_event  5,  1, BGEVENT_READ, GrannysTV

	def_object_events
	object_event  7,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseGrannyStream, EVENT_PLAYERS_HOUSE_MUM_1
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseGrannyWatch, EVENT_PLAYERS_HOUSE_MUM_2
	object_event  7,  4, SPRITE_PSYDUCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePsyduckScript, -1
	object_event  0,  3, SPRITE_WOOPER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseWooperScript, -1
	