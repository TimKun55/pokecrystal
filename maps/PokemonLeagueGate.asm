	object_const_def
	const POKEMONLEAGUEGATE_OFFICER
	const POKEMONLEAGUEGATE_BLACK_BELT1
	const POKEMONLEAGUEGATE_BLACK_BELT2
	const POKEMONLEAGUEGATE_COOLTRAINER_M
	const POKEMONLEAGUEGATE_HIKER
	const POKEMONLEAGUEGATE_BEAUTY
	const POKEMONLEAGUEGATE_COOLTRAINER_F

PokemonLeagueGate_MapScripts:
	def_scene_scripts
	scene_script PokemonLeagueGateNoop1Scene, SCENE_POKEMONLEAGUEGATE_BADGE_CHECK
	scene_script PokemonLeagueGateNoop2Scene, SCENE_POKEMONLEAGUEGATE_NOOP

	def_callbacks

PokemonLeagueGateNoop1Scene:
	end

PokemonLeagueGateNoop2Scene:
	end

PokemonLeagueGateBadgeCheckScript:
	turnobject PLAYER, LEFT
	sjump _PokemonLeagueGateBadgeCheckScript

PokemonLeagueGateOfficerScript:
	faceplayer
_PokemonLeagueGateBadgeCheckScript:
	opentext
	writetext PokemonLeagueGateOfficerText
	promptbutton
	readvar VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext PokemonLeagueGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, PokemonLeagueGateStepDownMovement
	end

.AllEightBadges:
	writetext PokemonLeagueGateEightBadgesText
	waitbutton
	closetext
	checkevent EVENT_BEAT_ROUTE_23_FALKNER
	iftrue .end
	clearevent EVENT_ROUTE_23_FALKNER
	clearevent EVENT_ROUTE_23_BUGSY
	clearevent EVENT_ROUTE_23_WHITNEY
	clearevent EVENT_ROUTE_23_MORTY
	clearevent EVENT_ROUTE_23_CHUCK
	clearevent EVENT_ROUTE_23_JASMINE
	clearevent EVENT_ROUTE_23_PRYCE
	clearevent EVENT_ROUTE_23_CLAIR
	setscene SCENE_POKEMONLEAGUEGATE_NOOP
.end
	end

PokemonLeagueGateLeftBlackBeltScript:
	jumptextfaceplayer PokemonLeagueGateLeftBlackBeltText

PokemonLeagueGateRightBlackBeltScript:
	jumptextfaceplayer PokemonLeagueGateRightBlackBeltText

PokemonLeagueGateCooltrainerMScript:
	jumptextfaceplayer PokemonLeagueGateCooltrainerMText

PokemonLeagueGateHikerScript:
	jumptextfaceplayer PokemonLeagueGateHikerText

PokemonLeagueGateBeautyScript:
	jumptextfaceplayer PokemonLeagueGateBeautyText

PokemonLeagueGateCooltrainerFScript:
	jumptextfaceplayer PokemonLeagueGateCooltrainerFText

PokemonLeagueGateStepDownMovement:
	step DOWN
	step_end

PokemonLeagueGateOfficerText:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

PokemonLeagueGateNotEnoughBadgesText:
	text "You don't have all"
	line "the Gym Badges of"
	cont "Johto or Kanto."

	para "I'm sorry, but I"
	line "can't let you go"
	cont "through."
	done

PokemonLeagueGateEightBadgesText:
	text "Oh! The eight"
	line "Badges of Johto!"

	para "Please, go right"
	line "on through!"
	done

PokemonLeagueGateLeftBlackBeltText:
	text "This way leads to"
	line "Mt.Silver."

	para "You'll see scary-"
	line "strong #mon out"
	cont "there."
	done

PokemonLeagueGateRightBlackBeltText:
	text "Off to the #mon"
	line "League, are you?"

	para "The Elite Four are"
	line "so strong it's"

	para "scary, and they're"
	line "ready for you!"
	done

PokemonLeagueGateCooltrainerMText:
	text "I tried to sneak"
	line "past the guard"
	
	para "but I couldn't get"
	line "past with only"
	cont "7 badges!"
	done

PokemonLeagueGateHikerText:
	text "I can't wait to"
	line "climb Mt.Silver"
	cont "one day."
	
	para "But I'm not sure"
	line "if I can handle"
	cont "the wild #mon…"
	done

PokemonLeagueGateBeautyText:
	text "I hear Elite Four"
	line "Will is really"
	cont "cute!"
	
	para "And Bruno has lots"
	line "of muscles."
	
	para "I wonder if"
	line "they're single!"
	
	para "Tee-hee!"
	done

PokemonLeagueGateCooltrainerFText:
	text "The League isn't"
	line "ready for me!"
	
	para "I'm going to knock"
	line "them all down!"
	done

PokemonLeagueGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 41, 14, ROUTE_22, 1
	warp_event 41, 15, ROUTE_22, 2
	warp_event 19,  0, ROUTE_23, 1
	warp_event 20,  0, ROUTE_23, 2
	warp_event 19, 31, ROUTE_26, 1
	warp_event 20, 31, ROUTE_26, 1
	warp_event  0, 14, ROUTE_28, 2
	warp_event  0, 15, ROUTE_28, 3

	def_coord_events
	coord_event 20,  5, SCENE_POKEMONLEAGUEGATE_BADGE_CHECK, PokemonLeagueGateBadgeCheckScript

	def_bg_events

	def_object_events
	object_event 18,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateOfficerScript, -1
	object_event 17, 14, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateLeftBlackBeltScript, EVENT_OPENED_MT_SILVER
	object_event 22, 14, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateRightBlackBeltScript, EVENT_FOUGHT_SNORLAX
	object_event 18, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateCooltrainerMScript, -1
	object_event 21,  8, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateHikerScript, -1
	object_event 21, 19, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateBeautyScript, -1
	object_event 38, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonLeagueGateCooltrainerFScript, -1
