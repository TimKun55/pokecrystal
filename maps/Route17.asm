	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4
	const ROUTE17_BIKER5
	const ROUTE17_BIKER6
	const ROUTE17_BIKER7
	const ROUTE17_BIKER8
	const ROUTE17_BIKER9

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17AlwaysOnBikeCallback

Route17AlwaysOnBikeCallback:
	setflag ENGINE_DOWNHILL
	endcallback

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerCharlesAfterBattleText

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerRileyAfterBattleText

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerJoelAfterBattleText

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerGlennAfterBattleText

TrainerBikerBenny:
	trainer BIKER, BIKER_BENNY, EVENT_BEAT_BIKER_BENNY, BikerBennySeenText, BikerBennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerBennyAfterBattleText

TrainerBikerKazu:
	trainer BIKER, KAZU, EVENT_BEAT_BIKER_KAZU, BikerKazuSeenText, BikerKazuBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerKazuAfterBattleText

TrainerBikerOrville:
	trainer BIKER, ORVILLE, EVENT_BEAT_BIKER_ORVILLE, BikerOrvilleSeenText, BikerOrvilleBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerOrvilleAfterBattleText

TrainerBikerBert:
	trainer BIKER, BERT, EVENT_BEAT_BIKER_BERT, BikerBertSeenText, BikerBertBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerBertAfterBattleText

TrainerBikerManny:
	trainer BIKER, MANNY, EVENT_BEAT_BIKER_MANNY, BikerMannySeenText, BikerMannyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BikerMannyAfterBattleText

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "Hey, you! You're"
	line "from Johto, huh?"
	done

BikerRileyBeatenText:
	ntag " Riley "
	text "Whoa, you kick!"
	done

BikerRileyAfterBattleText:
	ntag " Riley "
	text "Don't get cocky,"
	line "you Johto punk!"
	done

BikerJoelSeenText:
	text "Wow. That's a cool"
	line "Bicycle!"
	done

BikerJoelBeatenText:
	ntag " Joel "
	text "But you don't just"
	line "look cool…"
	done

BikerJoelAfterBattleText:
	ntag " Joel "
	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done

BikerGlennSeenText:
	text "Hey! Want to have"
	line "a speed battle?"
	done

BikerGlennBeatenText:
	ntag " Glenn "
	text "Yikes! You've got"
	line "awesome torque!"
	done

BikerGlennAfterBattleText:
	ntag " Glenn "
	text "Hands-free riding"
	line "is considered cool"
	cont "on Cycling Road."
	done

BikerCharlesSeenText:
	text "We're fearless"
	line "highway stars!"
	done

BikerCharlesBeatenText:
	ntag " Charles "
	text "Arrrgh! Crash and"
	line "burn!"
	done

BikerCharlesAfterBattleText:
	ntag " Charles "
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done

BikerBennySeenText:
	text "Woah!"
	line "What's the rush?"
	done

BikerBennyBeatenText:
	ntag " Benny "
	text "I shouldn't have"
	line "stopped you…"
	done

BikerBennyAfterBattleText:
	ntag " Benny "
	text "Well, off you go!"
	line "Enjoy the ride."
	done

BikerKazuSeenText:
	text "This here is"
	line "Biker territory!"
	
	para "You'd best be"
	line "ready for this."
	done

BikerKazuBeatenText:
	ntag " Kazu "
	text "Wow, were"
	line "you ready!"
	done

BikerKazuAfterBattleText:
	ntag " Kazu "
	text "Sorry I mouthed"
	line "off before."
	done

BikerOrvilleSeenText:
	text "Let's ride!"
	done

BikerOrvilleBeatenText:
	ntag " Orville "
	text "We rode!"
	done

BikerOrvilleAfterBattleText:
	ntag " Orville "
	text "Nothing beats"
	line "biking around!"
	done

BikerBertSeenText:
	text "My legs are like"
	line "granite!"
	done

BikerBertBeatenText:
	ntag " Bert "
	text "Woah, stronger"
	line "than granite?!"
	done

BikerBertAfterBattleText:
	ntag " Bert "
	text "I train by riding"
	line "up and down, each"
	cont "and every day."
	done

BikerMannySeenText:
	text "Vroom, Vroom!"
	line "The Biker's Life"
	cont "for me!"
	done

BikerMannyBeatenText:
	ntag " Manny "
	text "Woah! Zoomed past!"
	done

BikerMannyAfterBattleText:
	ntag " Manny "
	text "Man, I wish there"
	line "was an engine, or"
	cont "a bike #mon."
	done

Route17_MapEvents:

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  7, 35, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  9, 72, BGEVENT_ITEM, Route17HiddenMaxElixer

	def_object_events
	object_event  4, 11, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event 17, 60, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event 18, 38, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  4, 74, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
	object_event  1, 27, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerBenny, -1
	object_event 11,  6, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerKazu, -1
	object_event 15, 21, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerOrville, -1
	object_event  6, 41, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerBert, -1
	object_event  3, 57, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerManny, -1

