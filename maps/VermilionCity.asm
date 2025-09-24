	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_POKEFAN_M
	const VERMILIONCITY_TUTOR
	const VERMILIONCITY_ROCK1
	const VERMILIONCITY_ROCK2
	const VERMILIONCITY_ROCK3
	const VERMILIONCITY_ROCK4
	const VERMILIONCITY_ROCK5
	const VERMILIONCITY_SNORLAX

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionCityGramps:
	jumptextfaceplayer VermilionCityGrampsText

VermilionCityMachop:
	opentext
	writetext VermilionCityMachopText1
	cry MACHOP
	waitbutton
	refreshscreen
	pokepic MACHOP
	waitbutton
	closepokepic
	closetext
	earthquake 30
	opentext
	writetextend VermilionCityMachopText2

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetextend VermilionCityBadgeGuyTrainerText

.SomeBadges:
	writetextend VermilionCityBadgeGuySomeBadgesText

.MostBadges:
	writetextend VermilionCityBadgeGuyMostBadgesText

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end
	
VermilionCityTutorScript:
	faceplayer
	opentext
	writetext VermilionCityTutorHurricaneText
	waitbutton
	special PlaceMoneyTopRight
	writetext VermilionCityTutorHurricaneText2
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnough
	yesorno
	iffalse .TutorRefused
	setval HURRICANE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend VermilionCityTutorHurricaneRefused
	
.TeachMove
	writetext VermilionCityTutorPayment
	takemoney YOUR_MONEY, 20000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend VermilionCityTutorHurricaneTaught

.NotEnough
	writetextend VermilionCityTutorNotEnough
	
VermilionSnorlax:
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityRock:
	jumpstd SmashRockScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "Vermilion Port is"
	line "Kanto's seaside"
	cont "gateway."

	para "Luxury liners from"
	line "around the world"
	cont "dock here."
	done

VermilionCityGrampsText:
	text "My #mon is"
	line "preparing the land"
	cont "for construction."

	para "But I have no"
	line "money to start the"
	cont "project…"
	done

VermilionCityMachopText1:
	text "Machop: Guooh"
	line "gogogoh!"
	done

VermilionCityMachopText2:
	text "A Machop is growl-"
	line "ing while stomping"
	cont "the ground flat."
	done

VermilionCitySuperNerdText:
	text "There are eight"
	line "Gyms in Kanto."

	para "That big building"
	line "is Vermilion's"
	cont "#mon Gym."
	done

VermilionCityBadgeGuyTrainerText:
	text "Skilled trainers"
	line "gather in Kanto."

	para "Gym Leaders are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "You've started to"
	line "collect Kanto Gym"
	cont "Badges?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "I guess you'll be"
	line "finished with your"
	cont "conquest of Kanto"
	cont "Gyms soon."

	para "Let me know if"
	line "you get all eight"
	cont "Badges."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Congratulations!"

	para "You got all the"
	line "Kanto Gym Badges."

	para "I've got a reward"
	line "for your efforts."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Having a variety"
	line "of #mon types"
	cont "should give you an"
	cont "edge in battle."

	para "I'm sure the Kanto"
	line "Gym Badges will"
	cont "help you."
	done
	
VermilionCityTutorHurricaneText:
	text "Hello!"
	line "Are you a trainer?"
	
	para "Oh, you've earned"
	line "all of the Badges"
	cont "of Johto?"

	para "Wow! You must be"
	line "quite strong."
	
	para "You can definitely"
	line "handle this move"
	cont "I've been working"
	cont "on lately."
	done

VermilionCityTutorHurricaneText2:
	text "Would you like me"
	line "to teach your"
	cont "#mon to use"
	cont "Hurricane for"
	cont "¥20,000?"
	done

VermilionCityTutorHurricaneRefused:
	text "OK then."
	done

VermilionCityTutorPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥20000."
	done

VermilionCityTutorHurricaneTaught:
	text "It's a very"
	line "powerful move that"
	cont "hits hard, and can"
	cont "even confuse the"
	cont "foe, if it hits!"

	para "It's deadly in"
	line "the rain, too!"
	done
	
VermilionCityTutorNotEnough:
	text "Sorry, you can't"
	line "afford it."
	done
	
VermilionCitySignText:
	text "Vermilion City"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionGymSignText:
	text "Vermilion City"
	line "#mon Gym"
	cont "Leader: Lt.Surge"

	para "The Lightning"
	line "American"
	done

PokemonFanClubSignText:
	text "#mon Fan Club"

	para "All #mon Fans"
	line "Welcome!"
	done

VermilionCityPortSignText:
	text "Vermilion Port"
	line "Entrance"
	done

BattleHallSignText:
	text "Battle Hall"
	done

BattleHallOpeningSoonText:
	text "Battle Hall"
	
	para "Opening soon."
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 15, POKEMON_FAN_CLUB, 1
	warp_event 13, 15, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 15, VERMILION_MART, 2
	warp_event 21, 21, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event  8, 22, VERMILION_GYM, 1
	warp_event 19, 33, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 33, VERMILION_PORT_PASSAGE, 2
	warp_event  5,  5, VERMILION_SAILORS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 16, 12, BGEVENT_READ, VermilionCitySign
	bg_event  6, 22, BGEVENT_READ, VermilionGymSign
	bg_event 10, 15, BGEVENT_READ, PokemonFanClubSign
	bg_event 28, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 15, BGEVENT_READ, VermilionCityMartSign
	bg_event 31,  7, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 19, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 25,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityGramps, -1
	object_event 24,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, VermilionCityMachop, -1
	object_event 21, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 25, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event  4, 19, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionCityTutorScript, -1
	object_event 23,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityRock, -1
	object_event 27,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityRock, -1
	object_event 22,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityRock, -1
	object_event 26,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityRock, -1
	object_event 25,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityRock, -1
	object_event 43,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_ROUTE_11_SNORLAX
