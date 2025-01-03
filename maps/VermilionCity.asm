	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_POKEFAN_M
	const VERMILIONCITY_TUTOR
	const VERMILIONCITY_BEAUTY
	const VERMILIONCITY_SNORLAX
	const VERMILIONCITY_FRUIT_TREE1
	const VERMILIONCITY_FRUIT_TREE2
	const VERMILIONCITY_FRUIT_TREE3
	const VERMILIONCITY_FRUIT_TREE4
	const VERMILIONCITY_FRUIT_TREE5
	const VERMILIONCITY_FRUIT_TREE6

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	refreshscreen
	pokepic MACHOP
	waitbutton
	closepokepic
	closetext
	end

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
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

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
	waitbutton
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, .NotEnough
	yesorno
	iffalse .TutorRefused
	setval HURRICANE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext VermilionCityTutorHurricaneRefused
	waitbutton
	closetext
	end
	
.TeachMove
	writetext VermilionCityTutorPayment
	takemoney YOUR_MONEY, 20000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetext VermilionCityTutorHurricaneTaught
	waitbutton
	closetext
	end

.NotEnough
	writetext VermilionCityTutorNotEnough
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext VermilionCityTutorIncompatibleText
	waitbutton
	closetext
	end

VermilionCityBeautyScript:
	jumptextfaceplayer VermilionCityBeautyText

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

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityFruitTree1:
	fruittree FRUITTREE_VERMILION_CITY_1

VermilionCityFruitTree2:
	fruittree FRUITTREE_VERMILION_CITY_2

VermilionCityFruitTree3:
	fruittree FRUITTREE_VERMILION_CITY_3

VermilionCityFruitTree4:
	fruittree FRUITTREE_VERMILION_CITY_4

VermilionCityFruitTree5:
	fruittree FRUITTREE_VERMILION_CITY_5

VermilionCityFruitTree6:
	fruittree FRUITTREE_VERMILION_CITY_6

VermilionCityTeacherText:
	text "Vermilion Port is"
	line "Kanto's seaside"
	cont "gateway."

	para "Luxury liners from"
	line "around the world"
	cont "dock here."
	done

VermilionMachopOwnerText:
	text "My #mon is"
	line "preparing the land"
	cont "for construction."

	para "But I have no"
	line "money to start the"
	cont "project…"
	done

VermilionMachopText1:
	text "Machop: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
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

	para "conquest of Kanto"
	line "Gyms soon."

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

	para "should give you an"
	line "edge in battle."

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

	para "#mon to use"
	line "Hurricane for"
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
	
	para "even confuse the"
	line "foe, if it hits!"

	para "It's deadly in"
	line "the rain, too!"
	done
	
VermilionCityTutorNotEnough:
	text "Sorry, you can't"
	line "afford it."
	done
	
VermilionCityTutorIncompatibleText:
	text "I'm sorry, your"
	line "#mon can't"
	cont "learn this move…"
	done

VermilionCityBeautyText:
	text "Look at the pretty"
	line "Berry Trees I've"
	cont "been growing!"
	
	para "Aparently they're"
	line "rare and useful to"
	cont "trainers."
	
	para "Please feel free"
	line "to help yourself."
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

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  5, 13, POKEMON_FAN_CLUB, 1
	warp_event 11, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 19, 13, VERMILION_MART, 2
	warp_event 21, 19, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event  8, 20, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event  5,  5, VERMILION_SAILORS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 11, BGEVENT_READ, VermilionCitySign
	bg_event  6, 20, BGEVENT_READ, VermilionGymSign
	bg_event  8, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 26, 17, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 20, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 34, 10, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 15,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 24, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 27, 11, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 16, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 29, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event  4, 17, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionCityTutorScript, -1
	object_event 22,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionCityBeautyScript, -1
	object_event 43,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_ROUTE_11_SNORLAX
	object_event 19,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityFruitTree1, -1
	object_event 21,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityFruitTree2, -1
	object_event 24,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityFruitTree3, -1
	object_event 26,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityFruitTree4, -1
	object_event 19,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityFruitTree5, -1
	object_event 26,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityFruitTree6, -1
