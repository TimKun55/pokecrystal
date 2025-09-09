	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN
	const TRAINERHOUSE1F_SCIENTIST

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .TrainerHouse1FScientistCallback

.TrainerHouse1FScientistCallback:
	checkevent EVENT_BATTLE_TOWER_TYPE_MODES_UNLOCKED
	iftrue .DisappearScientist
	readvar VAR_WEEKDAY
	ifequal MONDAY, .BattleTowerScout
	ifequal THURSDAY, .BattleTowerScout
.DisappearScientist:
	disappear TRAINERHOUSE1F_SCIENTIST
	endcallback

.BattleTowerScout:
	appear TRAINERHOUSE1F_SCIENTIST
	endcallback

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouse1FScientistScript:
	faceplayer
	opentext
	writetext TrainerHouse1FScientistGreetingText
	waitbutton
	checkevent EVENT_BEAT_INVER_FIRST_TIME
	iffalse .NotUnlocked
	checkevent EVENT_BEAT_THORTON_FIRST_TIME
	iffalse .NotUnlocked
	setevent EVENT_BATTLE_TOWER_TYPE_MODES_UNLOCKED
	writetextend TrainerHouse1FScientistUnlockedModesText

.NotUnlocked:
	writetextend TrainerHouse1FScientistGoodluckText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Welcome to Trainer"
	line "House, the newest"
	cont "and most happening"
	cont "place in Viridian."

	para "We're open to"
	line "trainers only."

	para "You can battle"
	line "against the best"
	cont "of the best right"
	cont "downstairs."
	done

TrainerHouse1FCooltrainerMText:
	text "Viridian is the"
	line "town closest to"
	cont "Indigo Plateau."

	para "They built this"
	line "place because so"
	cont "many trainers pass"
	cont "through on their"
	cont "way up to Indigo"
	cont "Plateau."
	done

TrainerHouse1FCooltrainerFText:
	text "They hold practice"
	line "battles downstairs"
	cont "here."

	para "I would love to"
	line "see how well a"
	cont "trainer from Johto"
	cont "battles."
	done

TrainerHouse1FYoungsterText:
	text "I guess you can't"
	line "become the Champ"
	cont "unless you go all"
	cont "over the place and"
	cont "battle all kinds"
	cont "of people."

	para "The Champion from"
	line "Pallet traveled to"
	cont "all the cities and"
	cont "towns in Kanto."
	done

TrainerHouse1FGentlemanText:
	text "Whew… I'm taking a"
	line "rest from #mon"
	cont "battles."
	done

TrainerHouse1FScientistGreetingText:
	text "Hello."
	line "I'm from Johto's"
	cont "Battle Tower."

	para "I'm observing the"
	line "types of battles"
	cont "being offered here"
	cont "and if it would"
	cont "be worth intro-"
	cont "ducing them at"
	cont "the Battle Tower."
	done

TrainerHouse1FScientistUnlockedModesText:
	text "Hello!"

	para "You've defeated"
	line "both Thorton and"
	cont "Inver!"

	para "I hope you don't"
	line "mind, I was watch-"
	cont "ing your battles"
	cont "and I think we can"
	cont "implement Typeless"
	cont "and Inverse bat-"
	cont "tles at the"
	cont "Battle Tower!"

	para "Look forward to"
	line "challenging them!"
	done

TrainerHouse1FScientistGoodluckText:
	text "Good luck down"
	line "there and be"
	cont "prepared!"
	done

TrainerHouseSign1Text:
	text "Practice battles"
	line "are held in the"
	cont "Training Hall"
	cont "downstairs."

	para "Skilled trainers"
	line "are invited to"
	cont "participate."
	done

TrainerHouseSign2Text:
	text "There are no rules"
	line "or regulations for"
	cont "practice matches."
	
	para "Just like in field"
	line "battles, anything"
	cont "goes!"
	done

TrainerHouseIllegibleText:
	text "…What's this?"
	line "A strategy memo?"

	para "This writing looks"
	line "like Onix tracks…"

	para "It's completely"
	line "illegible…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, VIRIDIAN_CITY, 3
	warp_event  5, 11, VIRIDIAN_CITY, 3
	warp_event  9,  0, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  4,  6, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  8, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  5,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
	object_event  8,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FScientistScript, EVENT_TRAINER_HALL_1F_SCIENTIST
