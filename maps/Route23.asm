	object_const_def
	const ROUTE23_FALKNER
	const ROUTE23_NOCTOWL
	const ROUTE23_BUGSY
	const ROUTE23_SCYTHER
	const ROUTE23_WHITNEY
	const ROUTE23_MILTANK
	const ROUTE23_MORTY
	const ROUTE23_GENGAR
	const ROUTE23_CHUCK
	const ROUTE23_POLIWRATH
	const ROUTE23_JASMINE
	const ROUTE23_STEELIX
	const ROUTE23_PRYCE
	const ROUTE23_MAMOSWINE

Route23_MapScripts:
	def_scene_scripts

	def_callbacks

Route23Falkner:
	faceplayer
	opentext 
	writetext Route23FalknerBeforeText
	waitbutton
	closetext
	winlosstext Route23FalknerDefeatText, Route23FalknerVictoryText
	setlasttalked ROUTE23_FALKNER
	loadtrainer FALKNER, FALKNER2
	startbattle
	disappear ROUTE23_NOCTOWL
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_FALKNER
	setevent EVENT_ROUTE_23_FALKNER
	opentext
	writetext Route23FalknerAfterText
	waitbutton
	closetext
	applymovement ROUTE23_FALKNER, Route23FalknerBattleExitMovement
	disappear ROUTE23_FALKNER
	end
	
Route23Bugsy:
	faceplayer
	opentext 
	writetext Route23BugsyBeforeText
	waitbutton
	closetext
	winlosstext Route23BugsyDefeatText, Route23BugsyVictoryText
	setlasttalked ROUTE23_BUGSY
	loadtrainer BUGSY, BUGSY2
	startbattle
	disappear ROUTE23_SCYTHER
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_BUGSY
	setevent EVENT_ROUTE_23_BUGSY
	opentext
	writetext Route23BugsyAfterText
	waitbutton
	closetext
	applymovement ROUTE23_BUGSY, Route23BugsyBattleExitMovement
	disappear ROUTE23_BUGSY
	end

Route23Whitney:
	faceplayer
	opentext 
	writetext Route23WhitneyBeforeText
	waitbutton
	closetext
	winlosstext Route23WhitneyDefeatText, Route23WhitneyVictoryText
	setlasttalked ROUTE23_WHITNEY
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	disappear ROUTE23_MILTANK
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_WHITNEY
	setevent EVENT_ROUTE_23_WHITNEY
	opentext
	writetext Route23WhitneyAfterText
	waitbutton
	closetext
	applymovement ROUTE23_WHITNEY, Route23WhitneyBattleExitMovement
	disappear ROUTE23_WHITNEY
	end
	
Route23Morty:
	faceplayer
	opentext 
	writetext Route23MortyBeforeText
	waitbutton
	closetext
	winlosstext Route23MortyDefeatText, Route23MortyVictoryText
	setlasttalked ROUTE23_MORTY
	loadtrainer MORTY, MORTY2
	startbattle
	disappear ROUTE23_GENGAR
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_MORTY
	setevent EVENT_ROUTE_23_MORTY
	opentext
	writetext Route23MortyAfterText
	waitbutton
	closetext
	applymovement ROUTE23_MORTY, Route23MortyBattleExitMovement
	disappear ROUTE23_MORTY
	end
	
Route23Chuck:
	faceplayer
	opentext 
	writetext Route23ChuckBeforeText
	waitbutton
	closetext
	winlosstext Route23ChuckDefeatText, Route23ChuckVictoryText
	setlasttalked ROUTE23_CHUCK
	loadtrainer CHUCK, CHUCK2
	startbattle
	disappear ROUTE23_POLIWRATH
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_CHUCK
	setevent EVENT_ROUTE_23_CHUCK
	opentext
	writetext Route23ChuckAfterText
	waitbutton
	closetext
	applymovement ROUTE23_CHUCK, Route23ChuckBattleExitMovement
	disappear ROUTE23_CHUCK
	end
	
Route23Jasmine:
	faceplayer
	opentext 
	writetext Route23JasmineBeforeText
	waitbutton
	closetext
	winlosstext Route23JasmineDefeatText, Route23JasmineVictoryText
	setlasttalked ROUTE23_JASMINE
	loadtrainer JASMINE, JASMINE2
	startbattle
	disappear ROUTE23_STEELIX
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_JASMINE
	setevent EVENT_ROUTE_23_JASMINE
	opentext
	writetext Route23JasmineAfterText
	waitbutton
	closetext
	applymovement ROUTE23_JASMINE, Route23JasmineBattleExitMovement
	disappear ROUTE23_JASMINE
	end
	
Route23Pryce:
	faceplayer
	opentext 
	writetext Route23PryceBeforeText
	waitbutton
	closetext
	winlosstext Route23PryceDefeatText, Route23PryceVictoryText
	setlasttalked ROUTE23_PRYCE
	loadtrainer PRYCE, PRYCE2
	startbattle
	disappear ROUTE23_MAMOSWINE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_PRYCE
	setevent EVENT_ROUTE_23_PRYCE
	setevent EVENT_MAHOGANY_GYM_PILOSWINE
	clearevent EVENT_MAHOGANY_GYM_MAMOSWINE
	opentext
	writetext Route23PryceAfterText
	waitbutton
	closetext
	applymovement ROUTE23_PRYCE, Route23PryceBattleExitMovement
	disappear ROUTE23_PRYCE
	end

Route23Noctowl:
	opentext
	writetext Route23NoctowlText
	cry NOCTOWL
	waitbutton
	refreshscreen
	pokepic NOCTOWL
	waitbutton
	closepokepic
	closetext
	end
	
Route23Scyther:
	opentext
	writetext Route23ScytherText
	cry SCYTHER
	waitbutton
	refreshscreen
	pokepic SCYTHER
	waitbutton
	closepokepic
	closetext
	end
	
Route23Miltank:
	opentext
	writetext Route23MiltankText
	cry MILTANK
	waitbutton
	refreshscreen
	pokepic MILTANK
	waitbutton
	closepokepic
	closetext
	end
	
Route23Gengar:
	opentext
	writetext Route23GengarText
	cry GENGAR
	waitbutton
	refreshscreen
	pokepic GENGAR
	waitbutton
	closepokepic
	closetext
	end
	
Route23Poliwrath:
	opentext
	writetext Route23PoliwrathText
	cry POLIWRATH
	waitbutton
	refreshscreen
	pokepic POLIWRATH
	waitbutton
	closepokepic
	closetext
	end
	
Route23Steelix:
	opentext
	writetext Route23SteelixText
	cry STEELIX
	waitbutton
	refreshscreen
	pokepic STEELIX
	waitbutton
	closepokepic
	closetext
	end
	
Route23Mamoswine:
	opentext
	writetext Route23MamoswineText
	cry MAMOSWINE
	waitbutton
	refreshscreen
	pokepic MAMOSWINE
	waitbutton
	closepokepic
	closetext
	end

VictoryRoadSign:
	jumptext VictoryRoadSignText

Route23FalknerBattleExitMovement:
Route23BugsyBattleExitMovement:
Route23WhitneyBattleExitMovement:
Route23PryceBattleExitMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
Route23MortyBattleExitMovement:
	step LEFT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Route23ChuckBattleExitMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Route23JasmineBattleExitMovement:
	step LEFT
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

Route23FalknerBeforeText:
	text "<PLAYER>!"
	line "It's been a while!"

	para "Clair told us that"
	line "you had earned"
	cont "your final badge"
	cont "and were on your"
	cont "way to the #mon"
	cont "League!"

	para "So, we decided to"
	line "wait for you here!"
	
	para "It's been a long"
	line "time since we"
	cont "last battled and"
	cont "I'd love to see"
	cont "how much stronger"
	cont "you are now!"
	
	para "Let's battle!"
	done

Route23FalknerDefeatText:
	text "Haha, wow! You're"
	line "as strong as ever."
	done

Route23FalknerAfterText:
	text "Seeing how strong"
	line "you've become"
	cont "makes me want to"
	cont "become a better"
	cont "trainer and"
	cont "Gym Leader."
	
	para "I'm going to keep"
	line "training hard and"
	cont "make sure I win"
	cont "next time."

	para "Good luck at the"
	line "League!"
	
	para "And good luck"
	line "with everyone"
	cont "else, too!"
	done

Route23FalknerVictoryText:
	text "Yeah! I won!!"
	done
	
Route23NoctowlText:
	text "Noctowl: Towl!!"
	line "NocTowl!"
	done

Route23BugsyBeforeText:
	text "Hey <PLAYER>!"
	line "Did Falkner tell"
	cont "you we all wanna"
	cont "battle you?"

	para "Haha, it's funny"
	line "how much of an"
	cont "impression you"
	cont "left on us! We all"
	cont "want to go another"
	cont "round with you!"

	para "Let's do this!"
	done

Route23BugsyDefeatText:
	text "Yeah, you're still"
	line "super strong."
	done

Route23BugsyAfterText:
	text "Man, I still have"
	line "a long way to go"
	cont "both with my"
	cont "research and my"
	cont "battling."

	para "I'd better get"
	line "back to it!"

	para "Good luck!"
	done

Route23BugsyVictoryText:
	text "Yeah! I won!!"
	done
	
Route23ScytherText:
	text "Scyther: Scyth!"
	line "Scytherrrr!"
	done
	
Route23WhitneyBeforeText:
	text "Hi <PLAYER>!"
	line "I've been waiting"
	cont "for you!"
	
	para "It's been a long"
	line "time since we've"
	cont "battled and I'm"
	cont "much better now!"
	
	para "Wanna see?"
	done

Route23WhitneyDefeatText:
	text "Aww, I lost again?"
	done

Route23WhitneyAfterText:
	text "I hate losing but"
	line "at least I didn't"
	cont "cry this time!"

	para "I'm sure you'll"
	line "do really well at"
	cont "the League!"
	
	para "Good luck!"
	done

Route23WhitneyVictoryText:
	text "Yeah! I won!!"
	done
	
Route23MiltankText:
	text "Miltank: Miltaa!!"
	done
	
Route23MortyBeforeText:
	text "Ah <PLAYER>,"
	line "you've arrived."
	
	para "I see you haven't"
	line "given up on your"
	cont "journey."
	
	para "Neither have I."
	line "I am still in"
	cont "pursuit of the"
	cont "rainbow-colored"
	cont "#mon."
	
	para "My defeat at your"
	line "hands only pushed"
	cont "me harder to get"
	cont "stronger."
	
	para "This is the"
	line "result of all"
	cont "that training."
	done

Route23MortyDefeatText:
	text "Still not"
	line "good enough…"
	done

Route23MortyAfterText:
	text "One day I'll be"
	line "strong enough to"
	cont "encounter that"
	cont "rainbow-colored"
	cont "#mon."
	
	para "But, you are"
	line "strong enough for"
	cont "the League right"
	cont "now."
	
	para "I wish you the"
	line "best of luck."
	done

Route23MortyVictoryText:
	text "I did it."
	done
	
Route23GengarText:
	text "Gengar: Gen!"
	line "GarGar!"
	done
	
Route23ChuckBeforeText:
	text "WAHAHAH!"
	line "We meet again"
	cont "<PLAYER>!"
	
	para "Have you been"
	line "keeping up with"
	cont "your training?"
	
	para "I definitely have!"
	line "Let me show you!"
	done

Route23ChuckDefeatText:
	text "I lost again!"
	line "WAHAHAH!"
	done

Route23ChuckAfterText:
	text "Looks like I need"
	line "more training!"

	para "It makes me happy"
	line "to see how well"
	cont "your training"
	cont "has been going."
	
	para "You're in for a"
	line "tough battle"
	cont "against the"
	cont "League."
	
	para "I know you"
	line "can do it!"
	done

Route23ChuckVictoryText:
	text "WAHAHAH!"
	line "Victory!"
	done
	
Route23PoliwrathText:
	text "Poliwrath: Wrath!"
	line "Poli!"
	done
	
Route23JasmineBeforeText:
	text "Oh, hello"
	line "<PLAYER>."
	
	para "It's good to see"
	line "you again."
	
	para "Clair told us"
	line "how strong"
	cont "you've become."
	
	para "Umm…"
	line "could we battle?"
	done

Route23JasmineDefeatText:
	text "Well done."
	done

Route23JasmineAfterText:
	text "As a Gym Leader"
	line "it makes me happy"
	cont "to see how strong"
	cont "you've become."
	
	para "I'm glad we got"
	line "the chance to"
	cont "battle again and"
	cont "I'll never forget"
	cont "how you helped"
	cont "Amphy that time."
	
	para "Go and show the"
	line "League just how"
	cont "strong you are."
	
	para "Good luck."
	done

Route23JasmineVictoryText:
	text "Yay, I won!"
	done
	
Route23SteelixText:
	text "Steelix: Stee!"
	line "LixLix!"
	done

Route23PryceBeforeText:
	text "Ah, its young"
	line "<PLAYER>."
	
	para "No need for words."
	
	para "A #mon battle"
	line "is the best"
	cont "way for us"
	cont "to communicate."
	done

Route23PryceDefeatText:
	text "Mmm… Impressive!"
	done

Route23PryceAfterText:
	text "Your experiences"
	line "have been serving"
	cont "you well, I see."

	para "It's been a very"
	line "long time since we"
	cont "Leaders saw a"
	cont "trainer off to"
	cont "the League."
	
	para "Go and show them"
	line "your power."
	done

Route23PryceVictoryText:
	text "These old bones"
	line "still have"
	cont "strength in them."
	done
	
Route23MamoswineText:
	text "Mamoswine: Mooo!"
	line "Mammooo!"
	done

VictoryRoadSignText:
	text "Victory Road"

	para "The last test"
	line "for Trainers!"
	done

Route23_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 139, POKEMON_LEAGUE_GATE, 3
	warp_event  7, 139, POKEMON_LEAGUE_GATE, 4
	warp_event  8,  41, VICTORY_ROAD_1F,  1
	warp_event 10,  23, VICTORY_ROAD_3F, 10

	def_coord_events

	def_bg_events
	bg_event  7, 42, BGEVENT_READ, VictoryRoadSign

	def_object_events
	object_event 15, 131, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route23Falkner, EVENT_ROUTE_23_FALKNER
	object_event 14, 131, SPRITE_NOCTOWL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route23Noctowl, EVENT_ROUTE_23_FALKNER
	object_event  9, 123, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route23Bugsy, EVENT_ROUTE_23_BUGSY
	object_event  8, 123, SPRITE_SCYTHER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route23Scyther, EVENT_ROUTE_23_BUGSY
	object_event 11, 115, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route23Whitney, EVENT_ROUTE_23_WHITNEY
	object_event 10, 115, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route23Miltank, EVENT_ROUTE_23_WHITNEY
	object_event 13, 107, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route23Morty, EVENT_ROUTE_23_MORTY
	object_event 12, 107, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route23Gengar, EVENT_ROUTE_23_MORTY
	object_event  9,  80, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route23Chuck, EVENT_ROUTE_23_CHUCK
	object_event  8,  80, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route23Poliwrath, EVENT_ROUTE_23_CHUCK
	object_event 13,  55, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route23Jasmine, EVENT_ROUTE_23_JASMINE
	object_event 12,  55, SPRITE_STEELIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, Route23Steelix, EVENT_ROUTE_23_JASMINE
	object_event 10,  18, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route23Pryce, EVENT_ROUTE_23_PRYCE
	object_event  9,  18, SPRITE_MAMOSWINE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route23Mamoswine, EVENT_ROUTE_23_PRYCE
