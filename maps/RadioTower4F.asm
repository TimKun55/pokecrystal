	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_MARY
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
	writetextend RadioTower4FDJMaryText

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem POLKADOT_BOW
	iffalse .NoRoom
	setevent EVENT_GOT_POLKADOT_BOW_FROM_MARY	
	writetextend RadioTower4FDJMaryText_GivePinkBow

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
	turnobject RADIOTOWER4F_MARY, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove1
	applymovement PLAYER, RadioTower4FPlayerWalksToMicrophoneMovement
.DontNeedToMove1
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower4FDJMaryText_IntroducePlayer
	waitbutton
	writetext RadioTower4FDJMaryText_IntroduceInterview1
	waitbutton
	turnobject RADIOTOWER4F_MARY, DOWN
	turnobject PLAYER, UP
	writetext RadioTower4FDJMaryText_Interview1Start
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_PleaseElaborateText
	waitbutton
	writetext RadioTower4FDJMaryText_Interview1Finish
	waitbutton
	turnobject RADIOTOWER4F_MARY, RIGHT
	writetext RadioTower4FDJMaryText_RegularSchedule
	waitbutton
	pause 15
	turnobject RADIOTOWER4F_MARY, DOWN
	writetext RadioTower4FDJMaryText_InterviewGift
	promptbutton
	writetext RadioTower4FPikachuDollReceivedText
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_DECO_PIKACHU_DOLL
	writetext RadioTower4FPikachuDollSentHomeText
	promptbutton
	setevent EVENT_MARY_INTERVIEW_AFTER_CHAMPION
	writetext RadioTower4FDJMaryText_TalkAgain
	waitbutton
	closetext
	turnobject RADIOTOWER4F_MARY, RIGHT
	end

.NextInterview2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse .NoInterview
	checkevent EVENT_MARY_INTERVIEW_AFTER_POWER_PLANT
	iftrue .NextInterview3
	writetext RadioTower4FDJMaryText_Interview2
	waitbutton
	closetext
	turnobject RADIOTOWER4F_MARY, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove2
	applymovement PLAYER, RadioTower4FPlayerWalksToMicrophoneMovement
.DontNeedToMove2
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower4FDJMaryText_IntroducePlayer
	waitbutton
	writetext RadioTower4FDJMaryText_IntroduceInterview2
	waitbutton
	turnobject RADIOTOWER4F_MARY, DOWN
	turnobject PLAYER, UP
	writetext RadioTower4FDJMaryText_Interview2Start
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_PleaseElaborateText
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview2FormerBoss
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview2RestorePower
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview2InTheGym
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview2Finish
	waitbutton
	turnobject RADIOTOWER4F_MARY, RIGHT
	writetext RadioTower4FDJMaryText_RegularSchedule
	waitbutton
	pause 15
	turnobject RADIOTOWER4F_MARY, DOWN
	writetext RadioTower4FDJMaryText_InterviewGift
	promptbutton
	writetext RadioTower4FMareepDollReceivedText
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_DECO_MAREEP_DOLL
	writetext RadioTower4FMareepDollSentHomeText
	promptbutton
	setevent EVENT_MARY_INTERVIEW_AFTER_POWER_PLANT
	writetext RadioTower4FDJMaryText_TalkAgain
	waitbutton
	closetext
	turnobject RADIOTOWER4F_MARY, RIGHT
	end

.NextInterview3:
	checkevent EVENT_GRAND_CHAMPION
	iffalse .NoInterview
	checkevent EVENT_MARY_INTERVIEW_AFTER_GRAND_CHAMPION
	iftrue .NoInterview
	writetext RadioTower4FDJMaryText_Interview3
	waitbutton
	closetext
	turnobject RADIOTOWER4F_MARY, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove3
	applymovement PLAYER, RadioTower4FPlayerWalksToMicrophoneMovement
.DontNeedToMove3
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower4FDJMaryText_IntroducePlayer
	waitbutton
	writetext RadioTower4FDJMaryText_IntroduceInterview3
	waitbutton
	turnobject RADIOTOWER4F_MARY, DOWN
	turnobject PLAYER, UP
	writetext RadioTower4FDJMaryText_Interview3Start
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview3Snorlax
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview3DefeatLeaders
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview3OnADate
	waitbutton
	writetext RadioTower4FDJMaryInterview_PlayerResponse
	waitbutton
	writetext RadioTower4FDJMaryText_Interview3End
	waitbutton
	turnobject RADIOTOWER4F_MARY, RIGHT
	writetext RadioTower4FDJMaryText_RegularSchedule
	waitbutton
	pause 15
	turnobject RADIOTOWER4F_MARY, DOWN
	writetext RadioTower4FDJMaryText_InterviewGift
	promptbutton
	writetext RadioTower4FTeddiursaDollReceivedText
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_DECO_TEDDIURSA_DOLL
	writetext RadioTower4FTeddiursaDollSentHomeText
	promptbutton
	setevent EVENT_MARY_INTERVIEW_AFTER_GRAND_CHAMPION
	writetext RadioTower4FDJMaryText_TalkAgain
	waitbutton
	closetext
	turnobject RADIOTOWER4F_MARY, RIGHT
	end

.NoInterview
	writetextend RadioTower4FDJMaryText_ThanksForInterview

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
	jumptext GruntM10AfterBattleText

RadioTowerProton:
	trainer PROTON, PROTON2, EVENT_BEAT_PROTON_2, RadioTowerProtonSeenText, RadioTowerProtonBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext RadioTowerProtonAfterBattleText

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntF4AfterBattleText

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext ScientistRichAfterBattleText

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
	ntag "Mary"
	text "Why? Why do I have"
	line "to suffer through"
	cont "this?"

	para "Meowth, help me!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	ntag "Mary"
	text "Oh! You're my"
	line "little savior!"

	para "Will you take this"
	line "as my thanks?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	ntag "Mary"
	text "It's just right"
	line "for #mon that"
	cont "know normal-type"
	cont "moves."
	done

RadioTower4FDJMaryText_After:
	ntag "Mary"
	text "Please tune into"
	line "me on Prof.Oak's"
	cont "#mon Talk show."
	done

RadioTower4FDJMaryText_Interview1:
	ntag "Mary"
	text "Oh, you're hear to"
	line "discuss becoming"
	cont "Champion after the"
	cont "battle with Lance?"

	para "Thanks so much for"
	line "taking me up on my"
	cont "offer!"
	done

RadioTower4FDJMaryText_Interview2:
	ntag "Mary"
	text "Oh, you're hear to"
	line "discuss restoring"
	cont "power to Kanto and"
	cont "helping with the"
	cont "Magnet Train?"

	para "Thanks so much!"
	done

RadioTower4FDJMaryText_Interview3:
	ntag "Mary"
	text "Oh, you're hear to"
	line "discuss becoming"
	cont "Grand Champion"
	cont "after earning the"
	cont "Badges of Kanto?"

	para "Thanks so much!"
	done

RadioTower4FDJMaryText_IntroducePlayer:
	ntag "Mary"
	text "Listeners!"

	para "In the studio, a"
	line "very special guest"
	cont "just dropped in!"
	done

RadioTower4FDJMaryText_IntroduceInterview1:
	ntag "Mary"
	text "Please welcome"
	line "<PLAYER>, who"
	cont "recently defeated"
	cont "Lance and became"
	cont "the latest trainer"
	cont "to become the"
	cont "#mon League"
	cont "Champion!"
	done

RadioTower4FDJMaryText_IntroduceInterview2:
	ntag "Mary"
	text "Please welcome"
	line "<PLAYER>, who"
	cont "recently defeated"
	cont "Team Rocket again"
	cont "and helped restore"
	cont "power to Kanto and"
	cont "the Magnet Train!"
	done

RadioTower4FDJMaryText_IntroduceInterview3:
	ntag "Mary"
	text "Please welcome"
	line "<PLAYER>."
	
	para "They recently def-"
	cont "eated the Gym"
	cont "Leaders of Kanto,"

	para "is our new Grand"
	line "Champion and is"
	cont "one of the most"
	cont "accomplished and"
	cont "talented trainers!"
	done

RadioTower4FDJMaryText_Interview1Start:
	ntag "Mary"
	text "<PLAYER>, please"
	line "give us some idea"
	cont "of the struggles"
	cont "you went through"
	cont "to achieve this"
	cont "accomplishment."
	done

RadioTower4FDJMaryText_PleaseElaborateText:
	ntag "Mary"
	text "Can you please"
	line "elaborate?"
	done

RadioTower4FDJMaryText_Interview1Finish:
	ntag "Mary"
	text "So exciting!"

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

RadioTower4FDJMaryText_Interview2Start:
	ntag "Mary"
	text "<PLAYER>, please"
	line "give us some idea"
	cont "of what it was"
	cont "like facing down"
	cont "Team Rocket again."
	done
	
RadioTower4FDJMaryText_Interview2FormerBoss:
	ntag "Mary"
	text "The former Boss?!"
	done

RadioTower4FDJMaryText_Interview2RestorePower:
	ntag "Mary"
	text "So exciting!"

	para "And how did you"
	line "help restore the"
	cont "power in Kanto?"
	done

RadioTower4FDJMaryText_Interview2InTheGym:
	ntag "Mary"
	text "Oh my!"
	line "It was in the Gym,"
	cont "you say?!"
	done

RadioTower4FDJMaryText_Interview2Finish:
	ntag "Mary"
	text "Amazing!"

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

RadioTower4FDJMaryText_Interview3Start:
	ntag "Mary"
	text "<PLAYER>, please"
	line "give us some idea"
	cont "of what it was"
	cont "like traveling"
	cont "around Kanto!"
	done

RadioTower4FDJMaryText_Interview3Snorlax:
	ntag "Mary"
	text "Wow!"
	line "It was just laying"
	cont "there, sleeping?"
	
	para "What did you do?"
	done

RadioTower4FDJMaryText_Interview3DefeatLeaders:
	ntag "Mary"
	text "Interesting!"

	para "And what about"
	line "your defeat of the"
	cont "Kanto Leaders?"
	done

RadioTower4FDJMaryText_Interview3OnADate:
	ntag "Mary"
	text "She was on a date?"
	line "Goodness!"
	done

RadioTower4FDJMaryText_Interview3End:
	ntag "Mary"
	text "Relocated because"
	line "of the Volcano?"
	
	para "Wow, the Kanto"
	line "Leaders sure are"
	cont "interesting."

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
	cont "gone for good."
	
	para "All while on your"
	line "own journey."
	
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
	ntag "Mary"
	text "And now, back"
	line "to our regular"
	cont "program!"
	done

RadioTower4FDJMaryText_InterviewGift:
	ntag "Mary"
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
	ntag "Mary"
	text "I can't wait to"
	line "talk to you again!"
	done

RadioTower4FDJMaryText_ThanksForInterview:
	ntag "Mary"
	text "Thanks for the"
	line "interview!"

	para "And don't forget,"
	line "my listeners are"
	cont "eager to hear more"
	cont "of your stories!"
	done

RadioTower4FDJMaryInterview_PlayerResponse:
	ntag "<PLAYER>"
	text "… … …@"
	done

RadioTowerMeowthText:
	ntag "Meowth"
	text "Nyaa…"
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
	ntag "Proton"
	text "You!! I haven't"
	line "forgotten the way"
	cont "you humiliated"
	cont "us at the Well!"

	para "You're not taking"
	line "another step!"
	done

RadioTowerProtonBeatenText:
	ntag "Proton"
	text "Humiliation again!"
	done

RadioTowerProtonAfterBattleText:
	ntag "Proton"
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
	cont "after they beat"
	cont "yours!"
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
	object_event 14,  5, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, RadioTowerProton, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
