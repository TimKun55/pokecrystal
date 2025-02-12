	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_MEOWTH
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .InterviewPlayer
	checkevent EVENT_GOT_POLKADOT_BOW_FROM_MARY
	iftrue .GotPolkadotBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem POLKADOT_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_POLKADOT_BOW_FROM_MARY
	end

.GotPolkadotBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

.InterviewPlayer
	checkevent EVENT_MARY_INTERVIEW_AFTER_CHAMPION
	iftrue .NextInterview2
	writetext RadioTower4FDJMaryText_Interview1
	waitbutton
	closetext
	turnobject RADIOTOWER4F_TEACHER, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove1
	applymovement PLAYER, RadioTower4FPlayerWalksToMicrophoneMovement
.DontNeedToMove1
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower4FDJMaryText_IntroducePlayer
	waitbutton
	writetext RadioTower4FDJMaryText_IntroduceInterview1
	turnobject RADIOTOWER4F_TEACHER, DOWN
	turnobject PLAYER, UP
	writetext RadioTower4FDJMaryText_Interview1Questions
	waitbutton
	turnobject RADIOTOWER4F_TEACHER, RIGHT
	writetext RadioTower4FDJMaryText_RegularSchedule
	waitbutton
	turnobject RADIOTOWER4F_TEACHER, DOWN
	writetext RadioTower4FDJMaryText_InterviewGift
	promptbutton
	writetext RadioTower4FPikachuDollReceivedText
	waitbutton
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_DECO_PIKACHU_DOLL
	writetext RadioTower4FPikachuDollSentHomeText
	setevent EVENT_MARY_INTERVIEW_AFTER_CHAMPION
	writetext RadioTower4FDJMaryText_TalkAgain
	waitbutton
	closetext
	end

.NextInterview2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse .NoInterview
	checkevent EVENT_MARY_INTERVIEW_AFTER_POWER_PLANT
	iftrue .NextInterview3
	writetext RadioTower4FDJMaryText_Interview2
	waitbutton
	closetext
	turnobject RADIOTOWER4F_TEACHER, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove2
	applymovement PLAYER, RadioTower4FPlayerWalksToMicrophoneMovement
.DontNeedToMove2
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower4FDJMaryText_IntroducePlayer
	waitbutton
	writetext RadioTower4FDJMaryText_IntroduceInterview2
	turnobject RADIOTOWER4F_TEACHER, DOWN
	turnobject PLAYER, UP
	writetext RadioTower4FDJMaryText_Interview2Questions
	waitbutton
	turnobject RADIOTOWER4F_TEACHER, RIGHT
	writetext RadioTower4FDJMaryText_RegularSchedule
	waitbutton
	turnobject RADIOTOWER4F_TEACHER, DOWN
	writetext RadioTower4FDJMaryText_InterviewGift
	promptbutton
	writetext RadioTower4FMareepDollReceivedText
	waitbutton
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_DECO_MAREEP_DOLL
	writetext RadioTower4FMareepDollSentHomeText
	setevent EVENT_MARY_INTERVIEW_AFTER_POWER_PLANT
	writetext RadioTower4FDJMaryText_TalkAgain
	waitbutton
	closetext
	end

.NextInterview3:
	checkevent EVENT_GRAND_CHAMPION
	iffalse .NoInterview
	checkevent EVENT_MARY_INTERVIEW_AFTER_GRAND_CHAMPION
	iftrue .NoInterview
	writetext RadioTower4FDJMaryText_Interview3
	waitbutton
	closetext
	turnobject RADIOTOWER4F_TEACHER, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove3
	applymovement PLAYER, RadioTower4FPlayerWalksToMicrophoneMovement
.DontNeedToMove3
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower4FDJMaryText_IntroducePlayer
	waitbutton
	writetext RadioTower4FDJMaryText_IntroduceInterview3
	turnobject RADIOTOWER4F_TEACHER, DOWN
	turnobject PLAYER, UP
	writetext RadioTower4FDJMaryText_Interview3Questions
	waitbutton
	turnobject RADIOTOWER4F_TEACHER, RIGHT
	writetext RadioTower4FDJMaryText_RegularSchedule
	waitbutton
	turnobject RADIOTOWER4F_TEACHER, DOWN
	writetext RadioTower4FDJMaryText_InterviewGift
	promptbutton
	writetext RadioTower4FTeddiursaDollReceivedText
	waitbutton
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_DECO_TEDDIURSA_DOLL
	writetext RadioTower4FTeddiursaDollSentHomeText
	setevent EVENT_MARY_INTERVIEW_AFTER_GRAND_CHAMPION
	writetext RadioTower4FDJMaryText_TalkAgain
	waitbutton
	closetext
	end

.NoInterview
	writetext RadioTower4FDJMaryText_ThanksForInterview
	waitbutton
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	refreshscreen
	pokepic MEOWTH
	waitbutton
	closepokepic
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

RadioTowerProton:
	trainer PROTON, PROTON2, EVENT_BEAT_PROTON_2, RadioTowerProtonSeenText, RadioTowerProtonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RadioTowerProtonAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower4FFisherText:
	text "I listened to the"
	line "radio while I was"
	cont "at the Ruins."

	para "I heard a strange"
	line "broadcast there."
	done

RadioTower4FDJMaryText:
	text "Mary: Why? Why do"
	line "I have to suffer"
	cont "through this?"

	para "Meowth, help me!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "Mary: Oh! You're"
	line "my little savior!"

	para "Will you take this"
	line "as my thanks?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "Mary: It's just"
	line "right for #mon"

	para "that know normal-"
	line "type moves."
	done

RadioTower4FDJMaryText_After:
	text "Mary: Please tune"
	line "into me on Prof."

	para "Oak's #mon Talk"
	line "show."
	done

RadioTower4FDJMaryText_Interview1:
	text "Oh, you're hear to"
	line "discuss becoming"
	cont "Champion after the"
	cont "battle with Lance?"

	para "Thanks so much for"
	line "taking me up on my"
	cont "offer!"
	done

RadioTower4FDJMaryText_Interview2:
	text "Oh, you're hear to"
	line "discuss restoring"
	cont "power to Kanto and"
	cont "helping with the"
	cont "Magnet Train?"

	para "Thanks so much!"
	done

RadioTower4FDJMaryText_Interview3:
	text "Oh, you're hear to"
	line "discuss becoming"
	cont "Grand Champion"
	cont "after earning the"
	cont "Badges of Kanto?"

	para "Thanks so much!"
	done

RadioTower4FDJMaryText_IntroducePlayer:
	text "Listeners!"

	para "In the studio, a"
	line "very special guest"
	cont "just dropped in!"
	done

RadioTower4FDJMaryText_IntroduceInterview1:
	text "Please welcome"
	line "<PLAYER>, who"
	cont "recently defeated"
	cont "Lance and became"
	cont "the latest trainer"
	cont "to become the"
	cont "#mon Champion!"
	done

RadioTower4FDJMaryText_IntroduceInterview2:
	text "Please welcome"
	line "<PLAYER>, who"
	cont "recently defeated"
	cont "Team Rocket again"
	cont "and helped restore"
	cont "power to Kanto and"
	cont "the Magnet Train!"
	done

RadioTower4FDJMaryText_IntroduceInterview3:
	text "Please welcome"
	line "<PLAYER>, who"
	cont "recently defeated"
	cont "the Gym Leaders of"
	cont "Kanto, is our new"
	cont "Grand Champion and"
	cont "is one of the most"
	cont "accomplished and"
	cont "talented trainers!"
	done

RadioTower4FDJMaryText_Interview1Questions:
	text "<PLAYER>, please"
	line "give us some idea"
	cont "of the struggles"
	cont "you went through"
	cont "to achieve this"
	cont "accomplishment."

	para "<PLAYER>: … … …"

	para "Mary: Can you"
	line "please elaborate?"

	para "<PLAYER>: … … …"

	para "Mary: So exciting!"

	para "Well we've used up"
	line "enough of the"
	cont "Champion's time,"
	cont "so that's all for"
	cont "now."

	para "Thanks for joining"
	line "us today! Feel"
	cont "free to drop in as"
	cont "you achieve more!"
	done

RadioTower4FDJMaryText_Interview2Questions:
	text "<PLAYER>, please"
	line "give us some idea"
	cont "of what it was"
	cont "like facing down"
	cont "Team Rocket again."

	para "<PLAYER>: … … …"

	para "Mary: Can you"
	line "please elaborate?"

	para "<PLAYER>: … … …"

	para "Mary: The former"
	line "Boss?!"
	
	para "<PLAYER>: … … …"

	para "Mary: So exciting!"

	para "And how did you"
	line "help restore the"
	cont "power in Kanto?"

	para "<PLAYER>: … … …"

	para "Mary: Oh my!"
	line "It was in the Gym,"
	cont "you say?!"

	para "<PLAYER>: … … …"

	para "Mary: Amazing!"

	para "Well we've used up"
	line "enough of your"
	cont "time, so that's"
	cont "all for now."

	para "Thanks for joining"
	line "us today! Feel"
	cont "free to drop in as"
	cont "you achieve even"
	cont "more!"
	done

RadioTower4FDJMaryText_Interview3Questions:
	text "<PLAYER>, please"
	line "give us some idea"
	cont "of what it was"
	cont "like traveling"
	cont "around Kanto!"

	para "<PLAYER>: … … …"

	para "Mary: Wow!"
	line "It was just laying"
	cont "laying there?"
	
	para "What did you do?"

	para "<PLAYER>: … … …"

	para "Mary: Interesting!"

	para "And what about"
	line "your defeat of the"
	cont "Kanto Leaders?"

	para "<PLAYER>: … … …"

	para "Mary: She was on"
	line "a date? Goodness!"

	para "<PLAYER>: … … …"

	para "Mary: Relocated"
	line "because of the"
	cont "Volcano?"
	
	para "Wow, the Kanto"
	line "Leaders sure are"
	cont "Interesting!"

	para "Not only have you"
	line "defeated them, but"
	cont "you took on the"
	cont "Elite Four and"
	cont "Champion Lance"
	cont "again and won!"
	
	para "You're such an"
	line "amazing trainer!"
	
	para "Not only did you"
	line "save us from Team"
	cont "Rocket, you went"
	cont "to Kanto and made"
	cont "sure they were"
	cont "gone for good!"
	
	para "All while on your"
	line "own journey!"
	
	para "On behalf of the"
	line "people of Johto"
	cont "and I'm sure the"
	cont "people of Kanto,"
	cont "too; Thank you for"
	cont "your services!"

	para "Well we've used up"
	line "enough of your"
	cont "time, so that's"
	cont "all for now."

	para "Thanks for joining"
	line "us today! Feel"
	cont "free to drop in as"
	cont "you achieve even"
	cont "more!"
	done

RadioTower4FDJMaryText_RegularSchedule:
	text "And now back to"
	line "regular program!"
	done

RadioTower4FDJMaryText_InterviewGift:
	text "And here's a very"
	line "special thank you"
	cont "for your time."
	done
	
RadioTower4FPikachuDollReceivedText:
	text "<PLAYER> received a"
	line "Pikachu Doll."
	done

RadioTower4FMareepDollReceivedText:
	text "<PLAYER> received a"
	line "Mareep Doll."
	done

RadioTower4FTeddiursaDollReceivedText:
	text "<PLAYER> received a"
	line "Teddiursa Doll."
	done

RadioTower4FPikachuDollSentHomeText:
	text "The Pikachu Doll"
	line "was sent home."
	done

RadioTower4FMareepDollSentHomeText:
	text "The Mareep Doll"
	line "was sent home."
	done

RadioTower4FTeddiursaDollSentHomeText:
	text "The Teddiursa Doll"
	line "was sent home."
	done

RadioTower4FDJMaryText_TalkAgain:
	text "I can't wait to"
	line "talk to you again!"
	done

RadioTower4FDJMaryText_ThanksForInterview:
	text "Thanks for the"
	line "interview!"

	para "And don't forget,"
	line "my listeners are"
	cont "eager to hear more"
	cont "of your stories!"
	done

RadioTowerMeowthText:
	text "Meowth: Meowth…"
	done

GruntM10SeenText:
	text "You plan to rescue"
	line "the Director?"

	para "That won't be pos-"
	line "sible because I'm"
	cont "going to beat you!"
	done

GruntM10BeatenText:
	text "No! Unbelievable!"
	done

GruntM10AfterBattleText:
	text "I don't believe"
	line "it! I was beaten!"
	done

RadioTowerProtonSeenText:
	text "You!! I haven't"
	line "forgotten the way"
	cont "you humiliated"
	
	para "us at the Well!"

	para "You're not taking"
	line "another step!"
	done

RadioTowerProtonBeatenText:
	text "Humiliation again!"
	done

RadioTowerProtonAfterBattleText:
	text "You've earned my"
	line "respect, so here's"
	cont "some advice."

	para "It's not too late."
	line "You can still turn"
	cont "back."
	done

GruntF4SeenText:
	text "Don't I think"
	line "#mon are cute?"

	para "I'll think my"
	line "#mon are cute--"

	para "after they beat"
	line "yours!"
	done

GruntF4BeatenText:
	text "Oh, no! They're so"
	line "useless!"
	done

GruntF4AfterBattleText:
	text "I love my"
	line "beautiful self!"

	para "Who cares about"
	line "#mon?"
	done

ScientistRichSeenText:
	text "Most excellent."

	para "This Radio Tower"
	line "will fulfill our"
	cont "grand design."
	done

ScientistRichBeatenText:
	text "Hmmm…"

	para "All grand plans"
	line "come with snags."
	done

ScientistRichAfterBattleText:
	text "Do you honestly"
	line "believe you can"
	cont "stop Team Rocket?"
	done

RadioTower4FProductionSignText:
	text "4F Production"
	done

RadioTower4FStudio2SignText:
	text "4F Studio 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	def_object_events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, RadioTowerProton, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
