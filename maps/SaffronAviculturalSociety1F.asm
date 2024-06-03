	object_const_def
	const SAFFRONAVICULTURALSOCIETY1F_RECEPTIONIST
	const SAFFRONAVICULTURALSOCIETY1F_BIRD_KEEPER1
	const SAFFRONAVICULTURALSOCIETY1F_BIRD_KEEPER2
	const SAFFRONAVICULTURALSOCIETY1F_BIRD_KEEPER3
	const SAFFRONAVICULTURALSOCIETY1F_PIDGEOT
	const SAFFRONAVICULTURALSOCIETY1F_FEAROW
	const SAFFRONAVICULTURALSOCIETY1F_DODRIO

SaffronAviculturalSociety1F_MapScripts:
	def_scene_scripts
	scene_script SaffronAviculturalSociety1FNoop1Scene, SCENE_AVICULTURALSOCIETY1F_CHECK
	scene_script SaffronAviculturalSociety1FNoop2Scene, SCENE_AVICULTURALSOCIETY1F_NOOP

	def_callbacks

SaffronAviculturalSociety1FNoop1Scene:
	end

SaffronAviculturalSociety1FNoop2Scene:
	end
	
AviculturalSociety1FCheckScript:
	turnobject PLAYER, LEFT
	sjump _AviculturalSociety1FCheckScript
	
AviculturalSociety1FBirdKeeper3Script:
	faceplayer
_AviculturalSociety1FCheckScript:
	opentext
	writetext AviculturalSocietyBirdKeeper3Text
	promptbutton
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext AviculturalSocietyBirdKeeper3NoEntryText
	waitbutton
	closetext
	applymovement PLAYER, AviculturalSociety1FStepDownMovement
	end
	
.ReturnedMachinePart:
	writetext AviculturalSocietyBirdKeeper3YouMayPassText
	waitbutton
	closetext
	setscene SCENE_AVICULTURALSOCIETY1F_NOOP
	end

AviculturalSocietyReceptionistScript:
	faceplayer
	opentext
	writetext AviculturalSocietyReceptionistText
	waitbutton
	closetext
	end

AviculturalSociety1FBirdKeeper1Script:
	faceplayer
	opentext
	writetext AviculturalSociety1FBirdKeeper1Text
	waitbutton
	closetext
	end

AviculturalSociety1FBirdKeeper2Script:
	faceplayer
	opentext
	writetext AviculturalSociety1FBirdKeeper2Text
	waitbutton
	closetext
	end
	
AviculturalSocietyPidgeotScript:
	opentext
	writetext AviculturalSocietyPidgeotText
	cry PIDGEOT
	waitbutton
	refreshscreen
	pokepic PIDGEOT
	waitbutton
	closepokepic
	closetext
	end

AviculturalSocietyDodrioScript:
	opentext
	writetext AviculturalSocietyDodrioText
	cry DODRIO
	waitbutton
	refreshscreen
	pokepic DODRIO
	waitbutton
	closepokepic
	closetext
	end
	
AviculturalSocietyFearowScript:
	opentext
	writetext AviculturalSocietyFearowText
	cry FEAROW
	waitbutton
	refreshscreen
	pokepic FEAROW
	waitbutton
	closepokepic
	closetext
	end

AviculturalSocietySign1:
	jumptext AviculturalSocietySign1Text
	
AviculturalSocietySign2:
	jumptext AviculturalSocietySign2Text

AviculturalSocietyBookshelf1:
	jumptext AviculturalSocietyBookshelf1Text

AviculturalSocietyBookshelf2:
	jumptext AviculturalSocietyBookshelf2Text

AviculturalSocietyBook1:
	jumptext AviculturalSocietyBook1Text

AviculturalSocietyBook2:
	jumptext AviculturalSocietyBook2Text
	
AviculturalSociety1FStepDownMovement:
	step DOWN
	step_end

AviculturalSocietyReceptionistText:
	text "Welcome to the"
	line "AVICULTURAL"
	cont "SOCIETY."
	
	para "Anyone can join"
	line "as long as you"
	cont "have a love and"
	cont "passion for birds."
	done

AviculturalSociety1FBirdKeeper1Text:
	text "I've been all"
	line "over KANTO with my"
	cont "trusted partner."
	
	para "Bird #MON"
	line "are the best!"
	done

AviculturalSociety1FBirdKeeper2Text:
	text "I've been tracking"
	line "the location of"
	cont "several #MON"
	cont "in JOHTO!"
	
	para "I'm tired!"
	done

AviculturalSocietyBirdKeeper3Text:
	text "Only those who"
	line "have proven them-"
	cont "selves may pass."
	done

AviculturalSocietyBirdKeeper3NoEntryText:
	text "Sorry, I can't let"
	line "you pass."
	done

AviculturalSocietyBirdKeeper3YouMayPassText:
	text "Wow! You got the"
	line "TRAIN back up and"
	cont "running?"
	
	para "Thank you!"
	
	para "If you'd like to"
	line "go up, feel free."
	done

AviculturalSocietyPidgeotText:
	text "PIDGEOT: Geot!"
	done
	
AviculturalSocietyDodrioText:
	text "DODRIO: Drio!"
	line "Dododo!"
	done
	
AviculturalSocietyFearowText:
	text "FEAROW: Feeaar!"
	done

AviculturalSocietySign1Text:
	text "Love birds?"
	line "So do we!"
	
	para "Welcome!"
	done
	
AviculturalSocietySign2Text:
	text "Don't like birds?"
	line "Please leave."
	
	para "Immediately."
	done
	
AviculturalSocietyBookshelf1Text:
	text "All these books"
	line "seem to be about"
	
	para "bird #MON and"
	line "their habitats!"
	
	para "PIDGEOT can be"
	line "found on ROUTES 1,"
	cont "2, 13, 14,"
	cont "15 and 25."
	
	para "FEAROW can be"
	line "found on ROUTES 2,"
	cont "3, 4, 5, 7, 9, 16,"
	cont "17, 18 and 22."
	
	para "FARFETCH'D can be"
	line "found in JOHTO on"
	cont "ROUTE 43."
	
	para "DODRIO can be"
	line "found on ROUTES"
	cont "22, 26, the SAFARI"
	cont "ZONE and Route 27."
	done
	
AviculturalSocietyBookshelf2Text:
	text "All these books"
	line "seem to be about"
	
	para "bird #MON and"
	line "their habitats!"
	
	para "NOCTOWL can be"
	line "found on ROUTES 1,"
	cont "13, 14, 15,"
	cont "37, 42 and 43."
	
	para "TOGEKISS can be"
	line "found deep in"
	cont "WHIRL ISLANDS."
	
	para "XATU can be found"
	line "in TIN TOWER."
	
	para "MURKROW can be"
	line "found on ROUTES 7,"
	cont "16, 17, BURNED"
	cont "TOWER, 38 and 39."
	
	para "HONCHKROW can be"
	line "found on ROUTES 7,"
	cont "16 and 17."
	
	para "DELIBIRD can be"
	line "found in the"
	cont "ICE PATH and"
	cont "DARK CAVE."
	
	para "SKARMORY can be"
	line "found on ROUTE 45."
	done
	
AviculturalSocietyBook1Text:
	text "There are many"
	line "FLYING TYPE"
	cont "#MON but not"
	
	para "all of them are"
	line "birds."
	
	para "However KANTO has"
	line "3 LEGENDARY bird"
	cont "#MON."
	done
	
AviculturalSocietyBook2Text:
	text "There are many"
	line "FLYING TYPE"
	cont "#MON but not"
	
	para "all of them are"
	line "birds."
	
	para "However JOHTO has"
	line "2 LEGENDARY bird"
	cont "#MON."
	done 

SaffronAviculturalSociety1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, SAFFRON_CITY, 16
	warp_event  5,  9, SAFFRON_CITY, 16
	warp_event 11,  0, SAFFRON_AVICULTURAL_SOCIETY_2F, 1

	def_coord_events
	coord_event 11,  1, SCENE_AVICULTURALSOCIETY1F_CHECK, AviculturalSociety1FCheckScript

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, AviculturalSocietySign1
	bg_event  7,  0, BGEVENT_READ, AviculturalSocietySign2
	bg_event  4,  1, BGEVENT_READ, AviculturalSocietyBookshelf1
	bg_event  5,  1, BGEVENT_READ, AviculturalSocietyBookshelf2
	bg_event  1,  6, BGEVENT_READ, AviculturalSocietyBook1
	bg_event  9,  6, BGEVENT_READ, AviculturalSocietyBook2

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyReceptionistScript, -1
	object_event  2,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSociety1FBirdKeeper1Script, -1
	object_event 10,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSociety1FBirdKeeper2Script, -1
	object_event  9,  1, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSociety1FBirdKeeper3Script, -1
	object_event  1,  4, SPRITE_PIDGEOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyPidgeotScript, -1
	object_event 11,  4, SPRITE_DODRIO, SPRITEMOVEDATA_POKEMON, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyDodrioScript, -1
	object_event  4,  3, SPRITE_FEAROW, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyFearowScript, -1
