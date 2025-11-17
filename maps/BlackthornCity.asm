	object_const_def
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2
	const BLACKTHORNCITY_FRUIT_TREE

BlackthornCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetextend Text_ClairIsOut

.ClearedRadioTower:
	writetextend Text_ClairIsIn

.BeatClair:
	writetextend Text_ClairIsBeaten

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetextend BlackBeltText_WeirdRadio

.ClearedRadioTower:
	writetextend BlackBeltText_VoicesInMyHead

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetextend SantosGaveGiftText

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetextend SantosNotSaturdayText

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd PokecenterSignScript

BlackthornCityMartSign:
	jumpstd MartSignScript
	
BlackthornCityMadamItemsSign:
	jumptext MadamItemsSignText
	
BlackthornCityMoveTutorSign:
	jumptext BlackthornMoveTutorSignText
	
BlackthornCitySitrusTree:
	fruittree FRUITTREE_BLACKTHORN_CITY_SITRUS

Text_ClairIsOut:
	text "I am sorry."

	para "Clair, our Gym"
	line "Leader, entered"
	cont "the Dragon's Den"
	cont "behind the Gym."

	para "I have no idea"
	line "when our Leader"
	cont "will return."
	done

Text_ClairIsIn:
	text "Clair, our Gym"
	line "Leader, is waiting"
	cont "for you."

	para "However, it would"
	line "be impossible for"
	cont "a run-of-the-mill"
	cont "trainer to win."
	done

Text_ClairIsBeaten:
	text "You defeated"
	line "Clair?"

	para "That's amazing!"

	para "I've never heard"
	line "of her losing to"
	cont "anyone other than"
	cont "Lance."
	done

BlackthornGrampsRefusesEntryText:
	text "No. Only chosen"
	line "trainers may train"
	cont "here."
	
	para "Please leave."
	done

BlackthornGrampsGrantsEntryText:
	text "If Clair allows"
	line "it, her grand-"
	cont "father--our Master"
	cont "--will also."

	para "You may enter."
	done

BlackBeltText_WeirdRadio:
	text "My radio's busted?"
	line "Lately, I only get"
	cont "this weird signal."
	done

BlackBeltText_VoicesInMyHead:
	text "Arooo! Voices in"
	line "my head!"

	para "Huh? I'm listening"
	line "to my radio!"
	done

BlackthornCooltrainerF1Text:
	text "Are you going to"
	line "buy some items"
	cont "to evolve your"
	cont "#mon with?"
	done

BlackthornYoungsterText:
	text "Dragon masters all"
	line "come from the city"
	cont "of Blackthorn."
	done

MeetSantosText:
	text "Santos: …"

	para "It's Saturday…"

	para "I'm Santos of"
	line "Saturday…"
	done

SantosGivesGiftText:
	text "You can have this…"
	done

SantosGaveGiftText:
	text "Santos: …"

	para "Spell Tag…"

	para "Ghost-type moves"
	line "get stronger…"

	para "It will frighten"
	line "you…"
	done

SantosSaturdayText:
	text "Santos: …"

	para "See you again on"
	line "another Saturday…"

	para "I won't have any"
	line "more gifts…"
	done

SantosNotSaturdayText:
	text "Santos: Today's"
	line "not Saturday…"
	done

BlackthornCooltrainerF2Text:
	text "Wow, you came"
	line "through the Ice"
	cont "Path?"

	para "You must be a real"
	line "hotshot trainer!"
	done

BlackthornCitySignText:
	text "Blackthorn City"

	para "A Quiet Mountain"
	line "Retreat"
	done

BlackthornGymSignText:
	text "Blackthorn City"
	line "#mon Gym"
	cont "Leader: Clair"

	para "The Blessed User"
	line "of Dragon #mon"
	done

DragonDensSignText:
	text "Dragon's Den ahead"
	done

BlackthornCityTrainerTipsText:
	text "Trainer Tips"

	para "A #mon holding"
	line "a Lum Berry"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done
	
MadamItemsSignText:
	text "Madam Items"
	
	para "For your evolution"
	line "item needs!"
	done
	
BlackthornMoveTutorSignText:
	text "Blackthorn City"
	line "Move Tutor"
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 15, 23, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 23, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1
	warp_event  9, 29, MADAM_ITEMS_HOUSE, 1
	warp_event 23, 17, BLACKTHORN_MOVE_TUTOR_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 33, 23, BGEVENT_READ, BlackthornCitySign
	bg_event 16, 11, BGEVENT_READ, BlackthornGymSign
	bg_event 18,  2, BGEVENT_READ, DragonDensSign
	bg_event 23,  2, BGEVENT_READ, DragonDensSign
	bg_event 11, 23, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign
	bg_event  7, 29, BGEVENT_READ, BlackthornCityMadamItemsSign
	bg_event 24, 18, BGEVENT_READ, BlackthornCityMoveTutorSign

	def_object_events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 15, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 20, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
	object_event 12, 19, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornCitySitrusTree, -1
