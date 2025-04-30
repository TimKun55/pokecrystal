	object_const_def
	const VIOLETCITY_EARL
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_POKE_BALL1
	const VIOLETCITY_POKE_BALL2

VioletCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VioletCityFlypointCallback

VioletCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

VioletCityEarlScript:
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
	yesorno
	iftrue .FollowEarl
	writetext Text_MoreTraining
	waitbutton
	closetext
	end

.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	turnobject PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	opentext
	writetext Text_HereTeacherIAm
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applymovement VIOLETCITY_EARL, VioletCityFinishFollowEarl_MovementData
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	special RestartMapMusic
	end

VioletCityLassScript:
	jumptextfaceplayer VioletCityLassText

VioletCitySuperNerdScript:
	jumptextfaceplayer VioletCitySuperNerdText

VioletCityGrampsScript:
	jumptextfaceplayer VioletCityGrampsText

VioletCityYoungsterScript:
	jumptextfaceplayer VioletCityYoungsterText

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

VioletCityPokecenterSign:
	jumpstd PokecenterSignScript

VioletCityMartSign:
	jumpstd MartSignScript

VioletCityPPUp:
	itemball PP_UP

VioletCityRareCandy:
	itemball RARE_CANDY

VioletCityFruitTree:
	fruittree FRUITTREE_VIOLET_CITY

VioletCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION

VioletCityFollowEarl_MovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	big_step UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	big_step UP
	turn_head DOWN
	step_end

VioletCityFinishFollowEarl_MovementData:
	step UP
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
Text_EarlAsksIfYouBeatFalkner:
	text "Hello!"
	line "You are trainer?"

	para "Battle Gym Leader,"
	line "you want?"
	done

Text_MoreTraining:
	text "Hmm, I see."
	line "More training,"
	cont "you need?"
	
	para "Try Sprout Tower,"
	line "you should."
	done

Text_FollowEarl:
	text "Is that so?"
	line "Then study first"
	cont "shall you!"
	cont "Follow me!"
	done

Text_HereTeacherIAm:
	text "Here, teacher I"
	line "am. Good it is"
	cont "you study here!"
	done

VioletCityLassText:
	text "Ghosts are rumored"
	line "to appear in"
	cont "Sprout Tower."

	para "They said normal-"
	line "type #mon moves"

	para "had no effect on"
	line "ghosts."
	done

VioletCitySuperNerdText:
	text "Hey, you're a"
	line "#mon trainer?"

	para "If you beat the"
	line "Gym Leader,"

	para "you'll be ready"
	line "for prime time!"
	done

VioletCityGrampsText:
	text "Falkner, from the"
	line "Violet #mon"

	para "Gym, is a fine"
	line "trainer!"

	para "He inherited his"
	line "father's gym and"

	para "has done a great"
	line "job with it."
	done

VioletCityYoungsterText:
	text "I saw a wiggly"
	line "tree up ahead!"

	para "If you touch it,"
	line "it squirms and"
	cont "dances! Cool!"
	done

VioletCitySignText:
	text "Violet City"

	para "The City of"
	line "Nostalgic Scents"
	done

VioletGymSignText:
	text "Violet City"
	line "#mon Gym"
	cont "Leader: Falkner"

	para "The Elegant Master"
	line "of Flying #mon"
	done

SproutTowerSignText:
	text "Sprout Tower"

	para "Experience the"
	line "Way of #mon"
	done

EarlsPokemonAcademySignText:
	text "Earl's #mon"
	line "Academy"
	done

VioletCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 23, VIOLET_MART, 2
	warp_event 18, 23, VIOLET_GYM, 1
	warp_event 30, 23, EARLS_POKEMON_ACADEMY, 1
	warp_event  3, 21, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 31, 31, VIOLET_POKECENTER_1F, 1
	warp_event 21, 35, VIOLET_KYLES_HOUSE, 1
	warp_event 11, 29, VIOLET_PRIMOS_HOUSE, 1
	warp_event 23,  3, SPROUT_TOWER_1F, 1
	warp_event 39, 30, ROUTE_31_VIOLET_GATE, 1
	warp_event 39, 31, ROUTE_31_VIOLET_GATE, 2
	warp_event  0, 14, ROUTE_36_VIOLET_GATE, 3
	warp_event  0, 15, ROUTE_36_VIOLET_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 24, 26, BGEVENT_READ, VioletCitySign
	bg_event 16, 23, BGEVENT_READ, VioletGymSign
	bg_event 22,  4, BGEVENT_READ, SproutTowerSign
	bg_event 27, 23, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 32, 31, BGEVENT_READ, VioletCityPokecenterSign
	bg_event 10, 23, BGEVENT_READ, VioletCityMartSign
	bg_event 37, 20, BGEVENT_ITEM, VioletCityHiddenHyperPotion

	def_object_events
	object_event 18, 24, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityEarlScript, EVENT_VIOLET_CITY_EARL
	object_event 29, 35, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityLassScript, -1
	object_event 21, 26, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletCitySuperNerdScript, -1
	object_event 21, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityGrampsScript, -1
	object_event  5, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityYoungsterScript, -1
	object_event 17, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityFruitTree, -1
	object_event 11,  7, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityPPUp, EVENT_VIOLET_CITY_PP_UP
	object_event 36, 12, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityRareCandy, EVENT_VIOLET_CITY_RARE_CANDY
