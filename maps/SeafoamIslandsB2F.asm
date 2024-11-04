	object_const_def
	const SEAFOAMISLANDSB2F_BEAUTY
	const SEAFOAMISLANDSB2F_ROCKER1
	const SEAFOAMISLANDSB2F_ROCKER2
	const SEAFOAMISLANDSB2F_POKE_BALL

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSkierCady:
	trainer SKIER, CADY, EVENT_BEAT_SKIER_CADY, SkierCadySeenText, SkierCadyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierCadyAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderShaun:
	trainer BOARDER, SHAUN, EVENT_BEAT_BOARDER_SHAUN, BoarderShaunSeenText, BoarderShaunBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderShaunAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBryce:
	trainer BOARDER, BRYCE, EVENT_BEAT_BOARDER_BRYCE, BoarderBryceSeenText, BoarderBryceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBryceAfterBattleText
	waitbutton
	closetext
	end

SeafoamIslandsB2FWaterStone:
	itemball WATER_STONE

SeafoamIslandsB2FHiddenPearl1:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_1

SeafoamIslandsB2FHiddenPearl2:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_2

SkierCadySeenText:
	text "To beat the cold,"
	line "try warm clothes"
	cont "and a hot drink!"
	done

SkierCadyBeatenText:
	text "Argh, all the way"
	line "out here!"
	done

SkierCadyAfterBattleText:
	text "That was a hot"
	line "battle!"
	done

BoarderShaunSeenText:
	text "Hey, hey, you're"
	line "in my way! Right!"
	done

BoarderShaunBeatenText:
	text "I got kicked"
	line "around…"
	done

BoarderShaunAfterBattleText:
	text "All right, please"
	line "pass through!"
	done

BoarderBryceSeenText:
	text "What did you"
	line "come all the way"
	cont "out here for,"
	cont "I wonder."
	done

BoarderBryceBeatenText:
	text "I lost all the"
	line "way out here…"
	done

BoarderBryceAfterBattleText:
	text "Trainers are"
	line "everywhere."
	done

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 17, SEAFOAM_ISLANDS_B1F, 2
	warp_event  9,  9, SEAFOAM_ISLANDS_B1F, 3
	warp_event  5, 13, SEAFOAM_ISLANDS_B1F, 4
	warp_event  9, 15, SEAFOAM_ISLANDS_B1F, 5
	warp_event 27,  7, SEAFOAM_ISLANDS_B3F, 1
	warp_event 14,  7, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25, 13, SEAFOAM_ISLANDS_B3F, 3
	warp_event  3, 17, SEAFOAM_ISLANDS_B3F, 4

	def_coord_events

	def_bg_events
	bg_event  7,  8, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl1
	bg_event 23,  5, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl2

	def_object_events
	object_event  9,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierCady, -1
	object_event 14,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderShaun, -1
	object_event 20,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBryce, -1
	object_event 11, 16, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB2FWaterStone, EVENT_SEAFOAM_ISLANDS_B2F_WATER_STONE
	