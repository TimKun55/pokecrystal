	object_const_def
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM
	const ROUTE14_LADY_EVA
	const ROUTE14_TOGEKISS
	const ROUTE14_SWIMMER_GUY1
	const ROUTE14_SWIMMER_GUY2

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

Route14SwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHalAfterBattleText
	waitbutton
	closetext
	end

Route14SwimmermPaton:
	trainer SWIMMERM, PATON, EVENT_BEAT_SWIMMERM_PATON, SwimmermPatonSeenText, SwimmermPatonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermPatonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLadyEva:
	trainer LADY, EVA, EVENT_BEAT_LADY_EVA, LadyEvaSeenText, LadyEvaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LadyEvaAfterBattleText
	waitbutton
	closetext
	checkevent EVENT_BEAT_LADY_LIA
	iffalse .end
	checkevent EVENT_BEAT_LADY_ZOE
	iffalse .end
	setevent EVENT_BEAT_LIA_ZOE_EVA
	end
	
.end	
	end

Route14Togekiss:
	opentext
	writetext Route14TogekissText
	cry TOGEKISS
	waitbutton
	refreshscreen
	pokepic TOGEKISS
	waitbutton
	closepokepic
	closetext
	end

PokefanmCarterSeenText:
	text "Let me tell you,"
	line "I had a hard time"

	para "catching my prized"
	line "#mon."
	done

PokefanmCarterBeatenText:
	text "Awaaah!"
	done

PokefanmCarterAfterBattleText:
	text "Squirtle, Charman-"
	line "der and Bulbasaur…"

	para "I think that's a"
	line "well-balanced mix."
	done

BirdKeeperRoySeenText:
	text "My dream is to fly"
	line "with my beloved"
	cont "bird #mon."
	done

BirdKeeperRoyBeatenText:
	text "I can dream, but I"
	line "can't ever fly…"
	done

BirdKeeperRoyAfterBattleText:
	text "You have #mon"
	line "that know the HM"

	para "move Fly, don't"
	line "you? I envy you."
	done

PokefanmTrevorSeenText:
	text "Hi. Did you know…?"

	para "#mon get more"
	line "friendly if you"

	para "train them in a"
	line "place that they"
	cont "remember."
	done

PokefanmTrevorBeatenText:
	text "Where did I meet"
	line "this Psyduck?"
	done

PokefanmTrevorAfterBattleText:
	text "If only there were"
	line "an easy way to"

	para "identify where I"
	line "got my #mon…"
	done

SwimmermHalSeenText:
	text "Swimming today."

	para "Swimming tomorrow."

	para "Battle now!"
	done

SwimmermHalBeatenText:
	text "Should have stuck"
	line "to swimming."
	done

SwimmermHalAfterBattleText:
	text "I've gotta do a"
	line "lot more training;"

	para "for #mon and"
	line "for swimming."
	done

SwimmermPatonSeenText:
	text "I swam out here"
	line "to explore that"
	cont "small island, but"

	para "there was nothing"
	line "there."

	para "I need to vent"
	line "with a battle!"
	done

SwimmermPatonBeatenText:
	text "Frustrated AND"
	line "disappointed."
	done

SwimmermPatonAfterBattleText:
	text "There has to be"
	line "something there!"

	para "It's colder there"
	line "and the trees look"
	cont "frozen…"
	done
	
LadyEvaSeenText:
	text "Hi! I'm Eva."
	line "You're the trainer"
	cont "from Johto!"
	
	para "My sisters have"
	line "told me all about"
	cont "you, and I'm quite"
	
	para "keen to battle!"
	line "Hope you're ready!"
	done
	
LadyEvaBeatenText:
	text "You're really good"
	line "at this!"
	done

LadyEvaAfterBattleText:
	text "I thought I would"
	line "apply to be a Gym"
	cont "Leader for the"
	
	para "fairy-type but"
	line "you've shown me"
	cont "I've still got"
	
	para "room for"
	line "improvement!"
	
	para "If you've beaten"
	line "Lia and Zoe, go"
	cont "see Granny!"
	done

Route14TogekissText:
	text "Togekiss: Toge!"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 44, 24, ROUTE_14_ARTICUNO_NEST, 1
	warp_event 45, 24, ROUTE_14_ARTICUNO_NEST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  6, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
	object_event 15, 11, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerLadyEva, -1
	object_event 16, 11, SPRITE_TOGEKISS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route14Togekiss, -1
	object_event 29, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Route14SwimmermHal, -1
	object_event 35, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, Route14SwimmermPaton, -1
