	object_const_def
	const LYRASHOUSE1F_LYRAS_DAD

LyrasHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

LyrasDadScript:
	faceplayer
	opentext
	checkevent EVENT_LYRA_IN_HER_ROOM
	iffalse .LyraInside
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .LyraTraining
	writetext LyrasDadHelpingText
	waitbutton
	closetext
	end

.LyraInside
	writetext LyrasDadInsideText
	waitbutton
	closetext
	end

.LyraTraining
	writetext LyrasDadTrainingText
	waitbutton
	closetext
	end

LyrasFridgeScript:
	jumptext LyrasFridgeText

LyrasSinkScript:
	jumptext LyrasSinkText

LyrasStoveScript:
	jumptext LyrasStoveText

LyrasTVScript:
	jumptext LyrasTVText

LyrasDadInsideText:
	text "Hi, <PLAYER>!"
	line "Lyra is upstairs."

	para "She's playing"
	line "with her #mon"
	cont "as usual."
	done

LyrasDadHelpingText:
	text "Hi, <PLAYER>!"
	line "Lyra isn't here."

	para "She's been busy"
	line "helping the prof-"
	cont "essor."
	done

LyrasDadTrainingText:
	text "Hi, <PLAYER>!"
	line "Lyra isn't here."

	para "She's collecting"
	line "Badges all over"
	cont "Johto!"
	done

LyrasFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "Fresh Water and"
	line "rice balls!"
	done

LyrasSinkText:
	text "The sink is spot-"
	line "less."
	done

LyrasStoveText:
	text "Curry is simmering"
	line "on the stove."
	done

LyrasTVText:
	text "There's a movie on"
	line "TV: A girl with"

	para "her hair in pig-"
	line "tails is walking"
	cont "up a brick road."

	para "I'd better get"
	line "going too!"
	done

LyrasHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 5
	warp_event  3,  7, NEW_BARK_TOWN, 5
	warp_event  0,  0, LYRAS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, LyrasFridgeScript
	bg_event  8,  1, BGEVENT_READ, LyrasSinkScript
	bg_event  9,  1, BGEVENT_READ, LyrasStoveScript
	bg_event  5,  1, BGEVENT_READ, LyrasTVScript

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LyrasDadScript, -1
