	object_const_def
	const CELADONROCKETHIDEOUTB4F_ARCHER
	const CELADONROCKETHIDEOUTB4F_WEAVILE
	const CELADONROCKETHIDEOUTB4F_ARIANA
	const CELADONROCKETHIDEOUTB4F_PETREL
	const CELADONROCKETHIDEOUTB4F_PROTON
	const CELADONROCKETHIDEOUTB4F_GIOVANNI

CeladonRocketHideoutB4FArcherScript:
	opentext 
	writetext CeladonRocketHideoutB4FArcherBeforeText
	promptbutton
	closetext
	pause 15
	turnobject CELADONROCKETHIDEOUTB4F_ARCHER, DOWN
	showemote EMOTE_SHOCK, CELADONROCKETHIDEOUTB4F_ARCHER, 15
	opentext
	writetext CeladonRocketHideoutB4FArcherSeenText
	promptbutton
	writetext CeladonRocketHideoutB4FArcherBeforeBattleText
	waitbutton
	closetext
	winlosstext CeladonRocketHideoutB4FArcherWinLossText, 0
	loadtrainer ARCHER, ARCHER2
	startbattle
	disappear CELADONROCKETHIDEOUTB4F_WEAVILE
	reloadmapafterbattle
	setevent EVENT_BEAT_ARCHER_2
	opentext
	writetext CeladonRocketHideoutB4FArcherAfterBattleText
	promptbutton
	writetext CeladonRocketHideoutB4FGiovanniStopText
	promptbutton
	closetext
	moveobject CELADONROCKETHIDEOUTB4F_GIOVANNI, 20,  8
	appear CELADONROCKETHIDEOUTB4F_GIOVANNI
	applymovement CELADONROCKETHIDEOUTB4F_GIOVANNI, CeladonRocketHideoutB4FGiovanniEnterMovement
	showemote EMOTE_SHOCK, CELADONROCKETHIDEOUTB4F_ARCHER, 15
	turnobject CELADONROCKETHIDEOUTB4F_ARCHER, LEFT
	turnobject PLAYER, LEFT
	opentext
	writetext CeladonRocketHideoutB4FArcherBossText
	promptbutton
	closetext
	applymovement CELADONROCKETHIDEOUTB4F_ARCHER, CeladonRocketHideoutB4FArcherWalkMovement
	opentext
	writetext CeladonRocketHideoutB4FArcherHereText
	promptbutton
	writetext CeladonRocketHideoutB4FGiovanni1Text
	promptbutton
	writetext CeladonRocketHideoutB4FArcherShockText
	promptbutton
	closetext
	turnobject CELADONROCKETHIDEOUTB4F_GIOVANNI, DOWN
	pause 45
	turnobject CELADONROCKETHIDEOUTB4F_GIOVANNI, UP
	opentext
	writetext CeladonRocketHideoutB4FGiovanni2Text
	promptbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	applymovement CELADONROCKETHIDEOUTB4F_GIOVANNI, CeladonRocketHideoutB4GiovanniMoveback
	applymovement CELADONROCKETHIDEOUTB4F_ARCHER, CeladonRocketHideoutB4FArcherLeaveMovement1
	opentext
	writetext CeladonRocketHideoutB4FArcherFarewellText
	promptbutton
	closetext
	applymovement CELADONROCKETHIDEOUTB4F_ARCHER, CeladonRocketHideoutB4FArcherLeaveMovement2
	disappear CELADONROCKETHIDEOUTB4F_ARCHER
	applymovement CELADONROCKETHIDEOUTB4F_GIOVANNI, CeladonRocketHideoutB4GiovanniMoveForward
	opentext
	writetext CeladonRocketHideoutB4FGiovanni3Text
	promptbutton
	closetext
	setevent EVENT_KANTO_ROCKET_DISBAND
	clearevent EVENT_REPENTING_ROCKETS
	special FadeOutToBlack
	disappear CELADONROCKETHIDEOUTB4F_GIOVANNI
	disappear CELADONROCKETHIDEOUTB4F_ARIANA
	disappear CELADONROCKETHIDEOUTB4F_PROTON
	disappear CELADONROCKETHIDEOUTB4F_PETREL
	pause 25
	special FadeInFromBlack
	setmapscene ROUTE_7, SCENE_ROUTE7_CLOSE_DOORS
	end
	
ExecutivePetrel:
	trainer PETREL, PETREL3, EVENT_BEAT_PETREL_3, CeladonRocketHideoutB4FPetrelSeenText, CeladonRocketHideoutB4FPetrelBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	jumptext CeladonRocketHideoutB4FPetrelAfterBattleText
	
ExecutiveProton:
	trainer PROTON, PROTON3, EVENT_BEAT_PROTON_3, CeladonRocketHideoutB4FProtonSeenText, CeladonRocketHideoutB4FProtonBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	jumptext CeladonRocketHideoutB4FProtonAfterBattleText
	
ExecutiveAriana:
	trainer ARIANA, ARIANA3, EVENT_BEAT_ARIANA_3, CeladonRocketHideoutB4FArianaSeenText, CeladonRocketHideoutB4FArianaBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	jumptext CeladonRocketHideoutB4FArianaAfterBattleText

CeladonRocketHideoutB4FGiovanniEnterMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

CeladonRocketHideoutB4FArcherWalkMovement:
	slow_step LEFT
	turn_head DOWN
	step_end
	
CeladonRocketHideoutB4GiovanniMoveback:
	step LEFT
	turn_head RIGHT
	step_end

CeladonRocketHideoutB4FArcherLeaveMovement1:
	step DOWN
	turn_head RIGHT
	step_end
	
CeladonRocketHideoutB4FArcherLeaveMovement2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonRocketHideoutB4GiovanniMoveForward:
	step RIGHT
	step_end

CeladonRocketHideoutB4FWeavile:
	opentext
	writetext WeavileText
	cry WEAVILE
	waitbutton
	refreshscreen
	pokepic WEAVILE
	waitbutton
	closepokepic
	closetext
	end

CeladonRocketHideoutB4FComputer:	
	jumptext CeladonRocketHideoutB4FComputerText

CeladonRocketHideoutB4FElevator:
	jumptext CeladonRocketHideoutB4FElevatorText

CeladonRocketHideoutB4FArcherBeforeText:
	text "Archer: Ariana,"
	line "not now."
	
	para "I'm so close to"
	line "pinpointing his"
	cont "loca-"
	done	
	
CeladonRocketHideoutB4FArcherSeenText:
	text "You."
	
	para "It's you again."
	line "Even after moving,"
	
	para "even after the"
	line "disguises and"
	cont "using our old"
	cont "hideout, you still"
	cont "found us … … …"
	
	para "How?!"

	para "How can one kid be"
	line "this persistent?!"
	done

CeladonRocketHideoutB4FArcherBeforeBattleText:
	text "And to think"
	line "you've gotten past"
	cont "the others…"
	
	para "I can't lose now!"
	line "Not when I'm so"
	cont "close to finding"
	cont "the Boss!"
	done
	
CeladonRocketHideoutB4FArcherWinLossText:
	text "NO!"
	
	para "No, no, no, no!"
	line "We were so close!"
	done
	
CeladonRocketHideoutB4FArcherAfterBattleText:
	text "How are you this"
	line "powerful of a"
	cont "trainer?!"
	
	para "You beat us"
	line "already; why are"
	cont "you still"
	cont "following us?!"
	
	para "Why are you"
	line "getting in the"
	cont "way of us finding"
	cont "Giovanni?!"
	done
	
CeladonRocketHideoutB4FArcherBossText:
	text "Archer: Boss?!"
	done
	
CeladonRocketHideoutB4FArcherHereText:
	text "Its…its you…"
	
	para "You're here…"
	line "You're actually"
	cont "here!"
	
	para "All our hard work"
	line "finally paid off!"
	done
	
CeladonRocketHideoutB4FArcherShockText:
	text "Archer: Why?"
	line "For you!"
	
	para "You taught us to"
	line "never give up, and"
	cont "that only the weak"
	cont "give up on their"
	cont "plans!"
	
	para "3 years ago, you"
	line "completely vanish-"
	cont "ed and we heard"
	cont "that you had appa-"
	cont "rently abandoned"
	cont "the Team."
	
	para "But you would"
	line "never do that!"
	
	para "You would never"
	line "give up, never"
	cont "lose to a random"
	cont "trainer. You would"
	cont "never abandon us."
	
	para "You would never"
	line "abandon me!"
	done
	
CeladonRocketHideoutB4FArcherFarewellText:
	text "………Goodbye,"
	line "<PLAY_G>."
	done
	
CeladonRocketHideoutB4FGiovanniStopText:
	text "???: Archer."
	line "Stop this."
	done

CeladonRocketHideoutB4FGiovanni1Text:
	text "Giovanni: Your"
	line "hard work?"
	
	para "I followed this"
	line "child in here"
	cont "after hearing"
	cont "rumours about Team"
	cont "Rocket being"
	cont "active again in"
	cont "Kanto."
	
	para "I'm guessing that"
	line "business at the"
	cont "Power Plant was"
	cont "your doing?"
	
	para "You fools."
	
	para "I disbanded the"
	line "Team years ago"
	cont "with good reason"
	cont "and you wanted to"
	cont "rebuild it? Why?"
	done

CeladonRocketHideoutB4FGiovanni2Text:
	text "Giovanni: I see."
	
	para "I should have"
	line "told you in"
	cont "person myself."
	
	para "All my grand plans"
	line "for the Team were"
	cont "all squashed by"
	cont "one child."

	para "He showed me how"
	line "futile it would be"
	cont "to continue our"
	cont "plans when such a"
	cont "strong, new"
	cont "generation of"
	cont "trainers are"
	cont "emerging."
	
	para "#mon are not"
	line "tools for us to"
	cont "exploit and use"
	cont "for our gain."
	cont "I was a fool"
	cont "to try."
	
	para "Archer, I want you"
	line "four to come to"
	cont "my place and I'll"
	cont "explain further."
	
	para "Go to this"
	line "location and wait"
	cont "for me there."
	done
	
CeladonRocketHideoutB4FGiovanni3Text:
	text "I need to give"
	line "you my deepest"
	cont "thanks."
	
	para "Because of you"
	line "I was finally able"
	cont "to put Team Rocket"
	cont "to rest."
	
	para "You are a very"
	line "remarkable young"
	cont "person."
	
	para "You have shown me"
	line "that I was correct"
	cont "3 years ago."
	
	para "Thank you, and I"
	line "hope we're able"
	cont "to meet again."
	done
	
CeladonRocketHideoutB4FPetrelSeenText:
	text "Wait, you?!"
	line "How did you even"
	cont "get in here?!"
	
	para "I left the"
	line "doors open?"
	
	para "Aah!"
	line "This is my fault!"
	done

CeladonRocketHideoutB4FPetrelBeatenText:
	text "… again?"
	done

CeladonRocketHideoutB4FPetrelAfterBattleText:
	text "All we wanted was"
	line "to find Giovanni…"
	cont "this time…"
	done
	
CeladonRocketHideoutB4FProtonSeenText:
	text "What? You?"
	line "We were so careful"
	cont "to make sure"
	
	para "no one saw us"
	line "tunneling into"
	cont "our old hideout!"
	
	para "We wore disguises"
	line "so no one could"
	cont "identify us!"
	
	para "How did you"
	line "find us?!"
	done

CeladonRocketHideoutB4FProtonBeatenText:
	text "Argh!!"
	done

CeladonRocketHideoutB4FProtonAfterBattleText:
	text "Why? Why do you"
	line "keep messing up"
	cont "our plans?!"
	done
	
CeladonRocketHideoutB4FArianaSeenText:
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

CeladonRocketHideoutB4FArianaBeatenText:
	text "………"
	done

CeladonRocketHideoutB4FArianaAfterBattleText:
	text "By losing to you"
	line "again, I've lost"
	
	para "the right to do or"
	line "say anything else."
	done
	
WeavileText:
	text "Weavile: Wea!"
	done
	
CeladonRocketHideoutB4FComputerText:
	text "Is this some kind"
	line "of GPS system?"
	
	para "This looks like"
	line "the north-west"
	cont "side of Kanto."
	done

CeladonRocketHideoutB4FElevatorText:
	text "The elevator is"
	line "out of order."
	done

CeladonRocketHideoutB4F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonRocketHideoutB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  6, ROCKET_UNDERGROUND_TUNNEL, 1

	def_coord_events

	def_bg_events
	bg_event 21,  1, BGEVENT_READ, CeladonRocketHideoutB4FComputer
	bg_event 22, 24, BGEVENT_READ, CeladonRocketHideoutB4FElevator

	def_object_events
	object_event 21,  2, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonRocketHideoutB4FArcherScript, EVENT_KANTO_ROCKET_DISBAND
	object_event 20,  2, SPRITE_WEAVILE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonRocketHideoutB4FWeavile, EVENT_KANTO_ROCKET_DISBAND
	object_event  9,  3, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, ExecutivePetrel, EVENT_KANTO_ROCKET_DISBAND
	object_event  9, 21, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, ExecutiveProton, EVENT_KANTO_ROCKET_DISBAND
	object_event 19, 13, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, ExecutiveAriana, EVENT_KANTO_ROCKET_DISBAND
	object_event 17, 15, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKETS_IN_KANTO
