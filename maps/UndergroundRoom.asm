	object_const_def
	const UNDERGROUNDROOM_ARCHER
	const UNDERGROUNDROOM_SNEASEL
	const UNDERGROUNDROOM_ARIANA
	const UNDERGROUNDROOM_PETREL
	const UNDERGROUNDROOM_PROTON
	const UNDERGROUNDROOM_GIOVANNI

UndergroundRoom_MapScripts:
	def_scene_scripts

	def_callbacks

UndergroundRoomArcherScript:
	opentext 
	writetext UndergroundArcherBeforeText
	promptbutton
	closetext
	pause 15
	turnobject UNDERGROUNDROOM_ARCHER, DOWN
	showemote EMOTE_SHOCK, UNDERGROUNDROOM_ARCHER, 15
	opentext
	writetext UndergroundArcherSeenText
	promptbutton
	writetext UndergroundArcherBeforeBattleText
	waitbutton
	closetext
	winlosstext UndergroundArcherWinLossText, 0
	loadtrainer ARCHER, ARCHER2
	startbattle
	disappear UNDERGROUNDROOM_SNEASEL
	reloadmapafterbattle
	setevent EVENT_BEAT_ARCHER_2
	opentext
	writetext UndergroundArcherAfterBattleText
	promptbutton
	writetext UndergroundGiovanniStopText
	promptbutton
	closetext
	moveobject UNDERGROUNDROOM_GIOVANNI, 11,  9
	appear UNDERGROUNDROOM_GIOVANNI
	applymovement UNDERGROUNDROOM_GIOVANNI, UndergroundRoomGiovanniEnterMovement
	showemote EMOTE_SHOCK, UNDERGROUNDROOM_ARCHER, 15
	turnobject UNDERGROUNDROOM_ARCHER, LEFT
	turnobject PLAYER, LEFT
	opentext
	writetext UndergroundArcherBossText
	promptbutton
	closetext
	applymovement UNDERGROUNDROOM_ARCHER, UndergroundRoomArcherWalkMovement
	opentext
	writetext UndergroundArcherHereText
	promptbutton
	writetext UndergroundGiovanni1Text
	promptbutton
	writetext UndergroundArcherShockText
	promptbutton
	closetext
	turnobject UNDERGROUNDROOM_GIOVANNI, LEFT
	pause 45
	turnobject UNDERGROUNDROOM_GIOVANNI, RIGHT
	opentext
	writetext UndergroundGiovanni2Text
	promptbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	applymovement UNDERGROUNDROOM_ARCHER, UndergroundRoomArcherLeaveMovement1
	opentext
	writetext UndergroundArcherFarewellText
	promptbutton
	closetext
	applymovement UNDERGROUNDROOM_ARCHER, UndergroundRoomArcherLeaveMovement2
	disappear UNDERGROUNDROOM_ARCHER
	applymovement PLAYER, UndergroundRoomPlayerMovement
	opentext
	writetext UndergroundGiovanni3Text
	promptbutton
	closetext
	setevent EVENT_KANTO_ROCKET_DISBAND
	clearevent EVENT_REPENTING_ROCKETS
	special FadeOutToBlack
	disappear UNDERGROUNDROOM_GIOVANNI
	disappear UNDERGROUNDROOM_ARIANA
	disappear UNDERGROUNDROOM_PROTON
	disappear UNDERGROUNDROOM_PETREL
	pause 25
	special FadeInFromBlack
	end
	
ExecutivePetrel:
	trainer PETREL, PETREL3, EVENT_BEAT_PETREL_3, UndergroundPetrelSeenText, UndergroundPetrelBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext UndergroundPetrelAfterBattleText
	waitbutton
	closetext
	end
	
ExecutiveProton:
	trainer PROTON, PROTON3, EVENT_BEAT_PROTON_3, UndergroundProtonSeenText, UndergroundProtonBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext UndergroundProtonAfterBattleText
	waitbutton
	closetext
	end
	
ExecutiveAriana:
	trainer ARIANA, ARIANA3, EVENT_BEAT_ARIANA_3, UndergroundArianaSeenText, UndergroundArianaBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext UndergroundArianaAfterBattleText
	waitbutton
	closetext
	end	

UndergroundRoomGiovanniEnterMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

UndergroundRoomArcherWalkMovement:
	step LEFT
	step DOWN
	turn_head LEFT
	step_end
	
UndergroundRoomArianaWalkMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
UndergroundRoomArianaLeaveMovement1:
	step RIGHT
	step_end
	
UndergroundRoomArianaLeaveMovement2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UndergroundRoomArcherLeaveMovement1:
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end
	
UndergroundRoomArcherLeaveMovement2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UndergroundRoomPlayerMovement:
	step LEFT
	step_end

UndergroundRoomSneasel:
	opentext
	writetext SneaselText
	cry SNEASEL
	waitbutton
	refreshscreen
	pokepic SNEASEL
	waitbutton
	closepokepic
	closetext
	end

UndergroundRoomComputer:	
	jumptext UndergroundRoomComputerText
	
UndergroundArcherBeforeText:
	text "Ariana, not now."
	
	para "I'm so close to"
	line "pinpointing his"
	cont "loca-"
	done	
	
UndergroundArcherSeenText:
	text "You."
	
	para "It's you again."
	line "Even after moving,"
	cont "even after the"
	
	para "disguises and"
	line "extra secret lair,"
	
	para "you STILL found us"
	line "… … …"
	
	para "HOW?!"

	para "How can one"
	line "kid be THIS"
	cont "persistent?!"
	done

UndergroundArcherBeforeBattleText:
	text "And to think"
	line "you've gotten past"
	cont "the others…"
	
	para "I can't lose now!"
	line "Not when I'm so"
	
	para "close to finding"
	line "the Boss!!"
	done
	
UndergroundArcherWinLossText:
	text "NO!"
	
	para "No, no, no, no!"
	line "We were so close!"
	done
	
UndergroundArcherAfterBattleText:
	text "How are you this"
	line "powerful of a"
	cont "trainer?!"
	
	para "You beat us"
	line "already; why are"
	
	para "you still"
	line "following us?!"
	
	para "Why are you"
	line "getting in the"
	
	para "way of us finding"
	line "Giovanni?!"
	done
	
UndergroundArcherBossText:
	text "Archer: BOSS?!"
	done
	
UndergroundArcherHereText:
	text "Its…its you…"
	
	para "You're here…"
	line "You're actually"
	cont "here!"
	
	para "All our hard work"
	line "finally paid off!"
	done
	
UndergroundArcherShockText:
	text "Archer:'Why'?"
	line "For you!"
	
	para "You taught us to"
	line "never give up, and"
	cont "that only the weak"
	
	para "give up on their"
	line "plans!"
	
	para "3 years ago, you"
	line "completely vanish-"
	cont "ed and we heard"
	
	para "that you had appa-"
	line "rently abandoned"
	cont "the Team."
	
	para "But you would"
	line "never do that!"
	
	para "You would never"
	line "give up, never"
	cont "lose to a random"
	
	para "trainer. You would"
	line "never abandon us."
	
	para "You would never"
	line "abandon ME!"
	done
	
UndergroundArcherFarewellText:
	text "………Goodbye"
	line "<PLAY_G>."
	done
	
UndergroundGiovanniStopText:
	text "???: Archer."
	line "Stop this."
	done

UndergroundGiovanni1Text:
	text "Giovanni: Your"
	line "'hard work'?"
	
	para "I followed this"
	line "child in here"
	cont "after hearing"
	
	para "rumours about Team"
	line "Rocket being"
	
	para "active again in"
	line "Kanto."
	
	para "I'm guessing that"
	line "business at the"
	
	para "Power Plant was"
	line "your doing?"
	
	para "Absolute fools!"
	
	para "I disbanded the"
	line "Team years ago"
	cont "with good reason"
	
	para "and you wanted to"
	line "rebuild it? WHY?"
	done

UndergroundGiovanni2Text:
	text "Giovanni: I see."
	
	para "I should have"
	line "told you in"
	cont "person myself."
	
	para "For all my grand"
	line "plans for the Team"
	cont "they were all"
	
	para "squashed by one"
	line "child. He showed"
	cont "me how futile"
	
	para "it would be to"
	line "continue our plans"
	cont "when such a strong"
	
	para "new generation of"
	line "trainers are"
	cont "emerging."
	
	para "#mon are not"
	line "tools for us to"
	cont "exploit and use"
	
	para "for our gain."
	line "I was a fool"
	cont "to try."
	
	para "Archer, I want you"
	line "four to come to"
	cont "my place and I'll"
	
	para "explain further."
	line "Go to this"
	cont "location and wait"
	
	para "for me there."
	done
	
UndergroundGiovanni3Text:
	text "I need to give"
	line "you my deepest"
	cont "thanks."
	
	para "Because of you"
	line "I was finally able"
	cont "to put Team Rocket"
	
	para "to rest. You are"
	line "a very remarkable"
	cont "young person."
	
	para "You have shown me"
	line "that I was correct"
	cont "3 years ago."
	
	para "Thank you, and I"
	line "hope we're able"
	cont "to meet again."
	done
	
UndergroundPetrelSeenText:
	text "Wait, you?!"
	line "How did you even"
	cont "get in here?!"
	
	para "I left the"
	line "door open?!"
	
	para "Aah!!"
	line "This is my fault!"
	done

UndergroundPetrelBeatenText:
	text "… again?"
	done

UndergroundPetrelAfterBattleText:
	text "All we wanted was"
	line "to find Giovanni…"
	cont "this time…"
	done
	
UndergroundProtonSeenText:
	text "WHAT?! YOU?!"
	line "We were so careful"
	cont "to make sure"
	
	para "no one saw us"
	line "building this"
	cont "hideout!"
	
	para "We wore disguises"
	line "so no one could"
	cont "identify us!"
	
	para "How did you"
	line "find us?!"
	done

UndergroundProtonBeatenText:
	text "Argh!!"
	done

UndergroundProtonAfterBattleText:
	text "Why? Why do you"
	line "keep messing up"
	cont "our plans?!"
	done
	
UndergroundArianaSeenText:
	text "Of all the people"
	line "to find us, of"
	cont "course it's you."
	
	para "Even moving to"
	line "a different region"
	cont "didn't help."
	
	para "You're a thorn in"
	line "our side and must"
	cont "be removed."
	done

UndergroundArianaBeatenText:
	text "………"
	done

UndergroundArianaAfterBattleText:
	text "By losing to you"
	line "again, I've lost"
	cont "the right to do or"
	
	para "say anything else."
	done
	
SneaselText:
	text "Sneasel: Neeaa!!"
	done
	
UndergroundRoomComputerText:
	text "Is this some kind"
	line "of GPS system?"
	
	para "It seems to be"
	line "showing the west"
	cont "side of Kanto."
	done

UndergroundRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  9, UNDERGROUND_PATH, 3

	def_coord_events

	def_bg_events
	bg_event 13,  2, BGEVENT_READ, UndergroundRoomComputer

	def_object_events
	object_event 13,  3, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UndergroundRoomArcherScript, EVENT_KANTO_ROCKET_DISBAND
	object_event 12,  3, SPRITE_SNEASEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, UndergroundRoomSneasel, EVENT_KANTO_ROCKET_DISBAND
	object_event  4,  8, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, ExecutivePetrel, EVENT_KANTO_ROCKET_DISBAND
	object_event  8, 10, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, ExecutiveProton, EVENT_KANTO_ROCKET_DISBAND
	object_event  9, 10, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, ExecutiveAriana, EVENT_KANTO_ROCKET_DISBAND
	object_event 14, 19, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_KANTO_ROCKET_DISBAND
