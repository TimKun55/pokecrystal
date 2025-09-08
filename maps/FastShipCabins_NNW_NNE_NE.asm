	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_HIKER
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainermSeanAfterBattleText

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerfCarolAfterBattleText

TrainerPokemaniacTravis:
	trainer POKEMANIAC, TRAVIS, EVENT_BEAT_POKEMANIAC_TRAVIS, PokemaniacTravisSeenText, PokemaniacTravisBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext PokemaniacTravisAfterBattleText

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext HikerNolandAfterBattleText

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GentlemanEdwardAfterBattleText

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BurglarCoreyAfterBattleText

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_NOOP
	readvar VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	clearevent EVENT_FAST_SHIP_B1F_SAILOR_GENERATOR_ROOM
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	clearevent EVENT_FAST_SHIP_B1F_SAILOR_GENERATOR_ROOM
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd TrashCanScript

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "I'm going to Kanto"
	line "to test my skills."
	done

CooltrainermSeanBeatenText:
	text "I wanted to win!"
	done

CooltrainermSeanAfterBattleText:
	text "Trainers from"
	line "Johto can battle"
	cont "with Kanto Gym"
	cont "Leaders."
	done

CooltrainerfCarolSeenText:
	text "I'm training to"
	line "become the Champ!"
	done

CooltrainerfCarolBeatenText:
	text "What's so differ-"
	line "ent between us?"
	done

CooltrainerfCarolAfterBattleText:
	text "I'm going to beat"
	line "you someday!"
	done

PokemaniacTravisSeenText:
	text "Do you know Lily?"
	line "She's a hot DJ in"
	cont "Kanto."
	done

PokemaniacTravisBeatenText:
	text "Gyaaaah!"
	done

PokemaniacTravisAfterBattleText:
	text "Lily's nice, but"
	line "Mary's the best!"

	para "I want to check"
	line "out Johto's radio"
	cont "programs!"
	done

HikerNolandSeenText:
	text "Are you alone?"
	line "Then let's battle!"
	done

HikerNolandBeatenText:
	text "That's too much to"
	line "handle!"
	done

HikerNolandAfterBattleText:
	text "I wonder if there"
	line "are any mountains"
	cont "worth climbing in"
	cont "Kanto?"
	done

SailorStanlySeenText:
	text "Yeah, I'm a sail-"
	line "or, all right."

	para "I wasn't goofing"
	line "off!"

	para "This cabin was"
	line "vacant, so I just"
	cont "took a quick nap!"

	para "Ah, forget it!"
	line "Let's battle!"
	done

SailorStanlyBeatenText:
	text "Sorry! It's all my"
	line "fault!"
	done

SailorStanlyAfterBattleText:
	text "Being a sailor, I"
	line "have to do phys-"
	cont "ical labor. It's"
	cont "exhausting!"
	done

GentlemanEdwardSeenText:
	text "Oh, no. I've lost"
	line "something that's"
	cont "very important."
	done

GentlemanEdwardBeatenText:
	text "I… I can't find"
	line "it…"
	done

GentlemanEdwardAfterBattleText:
	text "I give up."
	line "You don't have to"
	cont "look. Just forget"
	cont "about it!"
	done

BurglarCoreySeenText:
	text "Yeehaw!"
	line "Lucky!"
	done

BurglarCoreyBeatenText:
	text "How unlucky!"
	line "I lost!"
	done

BurglarCoreyAfterBattleText:
	text "I found a pretty"
	line "coin here."

	para "Someone must have"
	line "lost it…"
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, FAST_SHIP_1F, 2
	warp_event  3, 12, FAST_SHIP_1F, 3
	warp_event  3, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7,  7, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	def_object_events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacTravis, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
