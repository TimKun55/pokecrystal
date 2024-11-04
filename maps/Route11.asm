	object_const_def
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_SUPER_NERD
	const ROUTE11_BIG_SNORLAX
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerAngus:
	trainer JUGGLER, ANGUS, EVENT_BEAT_JUGGLER_ANGUS, JugglerAngusSeenText, JugglerAngusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerAngusAfterBattleText
	waitbutton
	closetext
	end

Route11Snorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext Route11SnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext Route11RadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear ROUTE11_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end
	
Route11DiglettsCaveSign:
	jumptext Route11DiglettsCaveSignText

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "There's no cheat-"
	line "ing in #mon."

	para "Let's keep it fair"
	line "and square!"
	done

YoungsterOwenBeatenText:
	text "Huh? How did this"
	line "happen?"
	done

YoungsterOwenAfterBattleText:
	text "I fought fair and"
	line "square with honor."

	para "I don't regret"
	line "this at all."
	done

YoungsterJasonSeenText:
	text "It itches and"
	line "tickles a bit when"

	para "I wear shorts in"
	line "the grass."
	done

YoungsterJasonBeatenText:
	text "Aiyaaah!"
	line "I got stomped!"
	done

YoungsterJasonAfterBattleText:
	text "I'm going to catch"
	line "more #mon in"
	cont "the grass."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "I lost while I had"
	line "my eyes closed…"
	done

PsychicFidelSeenText:
	text "I can see it…"

	para "Everything to see"
	line "about you…"
	done

PsychicFidelBeatenText:
	text "I couldn't foresee"
	line "your power…"
	done

PsychicFidelAfterBattleText:
	text "Strength in con-"
	line "viction…"

	para "You're strong be-"
	line "cause you believe"
	cont "in your #mon."
	done

JugglerAngusSeenText:
	text "Round and round"
	line "they go!"
	done

JugglerAngusBeatenText:
	text "Oh, they stopped."
	done

JugglerAngusAfterBattleText:
	text "I need more"
	line "concentration…"
	done

Route11SnorlaxSleepingText:
	text "Snorlax is snoring"
	line "peacefully…"
	done

Route11RadioNearSnorlaxText:
	text "The #gear was"
	line "placed near the"
	cont "sleeping Snorlax…"

	para "…"

	para "Snorlax woke up!"
	done

Route11DiglettsCaveSignText:
	text "Diglett's Cave"
	done

Route11SignText:
	text "Route 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, DIGLETTS_CAVE, 1
	warp_event 37,  8, ROUTE_11_ROUTE_12_GATE, 1
	warp_event 37,  9, ROUTE_11_ROUTE_12_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, Route11DiglettsCaveSign
	bg_event 18,  8, BGEVENT_READ, Route11Sign
	bg_event 34,  3, BGEVENT_ITEM, Route11HiddenRevive

	def_object_events
	object_event 23, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 21,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 30,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  9,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 11, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerAngus, -1
	object_event  3,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11Snorlax, EVENT_ROUTE_11_SNORLAX
	object_event 34, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
