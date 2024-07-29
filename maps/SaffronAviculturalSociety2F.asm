	object_const_def
	const SAFFRONAVICULTURALSOCIETY2F_BIRD_KEEPER1
	const SAFFRONAVICULTURALSOCIETY2F_BIRD_KEEPER2
	const SAFFRONAVICULTURALSOCIETY2F_MURKROW
	const SAFFRONAVICULTURALSOCIETY2F_SKARMORY

SaffronAviculturalSociety2F_MapScripts:
	def_scene_scripts
	scene_script SaffronAviculturalSociety2FNoop1Scene, SCENE_AVICULTURALSOCIETY2F_BADGE_CHECK
	scene_script SaffronAviculturalSociety2FNoop2Scene, SCENE_AVICULTURALSOCIETY2F_NOOP

	def_callbacks

SaffronAviculturalSociety2FNoop1Scene:
	end

SaffronAviculturalSociety2FNoop2Scene:
	end
	
AviculturalSociety2FBadgeCheckScript:
	turnobject PLAYER, LEFT
	sjump _AviculturalSociety2FBadgeCheckScript
	
AviculturalSociety2FBirdKeeper2Script:
	faceplayer
_AviculturalSociety2FBadgeCheckScript:
	opentext
	writetext AviculturalSociety2FBirdKeeper2Text
	promptbutton
	checkflag ENGINE_VOLCANOBADGE
	iftrue .GoUp
	writetext AviculturalSocietyBirdKeeper2NoEntryText
	waitbutton
	closetext
	applymovement PLAYER, AviculturalSociety2FStepUpMovement
	end
	
.GoUp:
	writetext AviculturalSocietyBirdKeeper2YouMayPassText
	waitbutton
	closetext
	setscene SCENE_AVICULTURALSOCIETY2F_NOOP
	end

AviculturalSociety2FBirdKeeper1Script:
	faceplayer
	opentext
	writetext AviculturalSocietyBirdKeeper1Text
	waitbutton
	closetext
	end

AviculturalSocietyMurkrowScript:
	opentext
	writetext AviculturalSocietyMurkrowText
	cry MURKROW
	waitbutton
	refreshscreen
	pokepic MURKROW
	waitbutton
	closepokepic
	closetext
	end
	
AviculturalSocietySkarmoryScript:
	opentext
	writetext AviculturalSocietySkarmoryText
	cry SKARMORY
	waitbutton
	refreshscreen
	pokepic SKARMORY
	waitbutton
	closepokepic
	closetext
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	setevent EVENT_FOUGHT_ARTICUNO
	setevent EVENT_FOUGHT_ZAPDOS
	setevent EVENT_FOUGHT_MOLTRES
	end

AviculturalSocietyArticunoBookshelf:
	jumptext AviculturalSocietyArticunoBookshelfText

AviculturalSocietyZapdosBookshelf:
	jumptext AviculturalSocietyZapdosBookshelfText

AviculturalSocietyMoltresBookshelf:
	jumptext AviculturalSocietyMoltresBookshelfText

AviculturalSocietyLugiaBookshelf:
	jumptext AviculturalSocietyLugiaBookshelfText

AviculturalSocietyHoOhBookshelf:
	jumptext AviculturalSocietyHoOhBookshelfText

AviculturalSocietyBook:
	jumptext AviculturalSocietyBookText
	
AviculturalSociety2FStepUpMovement:
	step UP
	step_end

AviculturalSocietyBirdKeeper1Text:
	text "We've gathered as"
	line "much information"
	cont "about the"
	
	para "Legendary Bird"
	line "#mon as we"
	cont "possibly could."
	
	para "They're such maje-"
	line "stic and powerful"
	cont "creatures."
	done

AviculturalSociety2FBirdKeeper2Text:
	text "You've done well"
	line "to make it up"
	cont "here, but to go"
	
	para "to the top floor"
	line "you'll need to"
	cont "have defeated"
	cont "Blaine in battle."
	done

AviculturalSocietyBirdKeeper2NoEntryText:
	text "Sorry, I can't let"
	line "you through."
	done

AviculturalSocietyBirdKeeper2YouMayPassText:
	text "You've been to"
	line "Cinnabar and"
	cont "beaten Blaine?"
	
	para "Please go on up."
	done 

AviculturalSocietyMurkrowText:
	text "Murkrow: Row!"
	line "Krow! Mur!"
	done
	
AviculturalSocietySkarmoryText:
	text "Skarmory: Skaaaar!"
	done

AviculturalSocietyArticunoBookshelfText:
	text "It used to make"
	line "its home in the"
	cont "Seafoam Islands."
	
	para "Its current where-"
	line "abouts are unknown"
	cont "but others have"
	
	para "reported colder"
	line "temperatures in"
	cont "the east of Kanto."
	
	para "Articuno, also"
	line "known as Furiizaa."
	done
	
AviculturalSocietyZapdosBookshelfText:
	text "It used to live"
	line "in the then aban-"
	cont "doned Power Plant."

	para "Its current where-"
	line "abouts are unknown"
	cont "but others have"

	para "reported storms"
	line "in the northern"
	cont "parts of Kanto."

	para "Zapdos, also"
	line "known as Sandaa."
	done
	
AviculturalSocietyMoltresBookshelfText:
	text "It used to live"
	line "in Victory Road."
	
	para "Known to migrate."

	para "Its current where-"
	line "abouts are unknown"
	cont "but others have"

	para "reported increased"
	line "temperatures in"
	cont "southern Kanto."

	para "Moltres, also"
	line "known as Faiyaa."
	done
	
AviculturalSocietyLugiaBookshelfText:	
	text "Known as the"
	line "Guardian Of"
	cont "The Seas."
	
	para "A flap of its"
	line "wings are enough"
	cont "to create or calm"
	cont "vicious storms."
	
	para "Very few have"
	line "encountered it."
	
	para "Seems to be"
	line "linked to Whirl"
	cont "Islands and the"
	cont "Silver Wing."
	
	para "Lugia."
	done
	
AviculturalSocietyHoOhBookshelfText:
	text "Known as the"
	line "Guardian Of"
	cont "The Skies."
	
	para "A flap of its"
	line "wings are enough"
	cont "to create bright,"
	cont "colorful rainbows."
	
	para "Very few have"
	line "encountered it."
	
	para "Seems to be"
	line "linked to Tin"
	cont "Tower and the"
	cont "Rainbow Wing."
	
	para "Ho-Oh."
	done
	
AviculturalSocietyBookText:
	text "The 3 Legendary"
	line "Birds were caught"
	cont "by one powerful"
	
	para "trainer who became"
	line "the Champion."
	
	para "However, the"
	line "trainer wanted to"
	cont "continue on their"
	
	para "journey and chose"
	line "3 poweful Guardian"
	cont "trainers to watch" 
	
	para "over and protect"
	line "the Birds."
	
	para "Many have tried"
	line "to challenge them"
	cont "to gain the Birds"
	cont "for themselves."
	
	para "None have yet"
	line "been successful."	
	done
	
SaffronAviculturalSociety2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  0, SAFFRON_AVICULTURAL_SOCIETY_1F, 3
	warp_event 11, 10, SAFFRON_AVICULTURAL_SOCIETY_3F, 1

	def_coord_events
	coord_event  7, 11, SCENE_AVICULTURALSOCIETY2F_BADGE_CHECK, AviculturalSociety2FBadgeCheckScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, AviculturalSocietyArticunoBookshelf
	bg_event  1,  1, BGEVENT_READ, AviculturalSocietyZapdosBookshelf
	bg_event  2,  1, BGEVENT_READ, AviculturalSocietyMoltresBookshelf
	bg_event  0,  7, BGEVENT_READ, AviculturalSocietyLugiaBookshelf
	bg_event  1,  7, BGEVENT_READ, AviculturalSocietyHoOhBookshelf
	bg_event  6,  4, BGEVENT_READ, AviculturalSocietyBook

	def_object_events
	object_event  4,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSociety2FBirdKeeper1Script, -1
	object_event  6, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSociety2FBirdKeeper2Script, -1	
	object_event  7,  2, SPRITE_MURKROW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyMurkrowScript, -1
	object_event  3,  7, SPRITE_SKARMORY, SPRITEMOVEDATA_POKEMON, 0, 1, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, AviculturalSocietySkarmoryScript, -1
