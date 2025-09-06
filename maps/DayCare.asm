	object_const_def
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY
	const DAYCARE_LYRA

DayCare_MapScripts:
	def_scene_scripts
	scene_script DayCareLyraAndGrannyScene, SCENE_DAYCARE_LYRA_AND_GRANNY
	scene_script DayCareNoopScene,          SCENE_DAYCARE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

DayCareLyraAndGrannyScene:
	sdefer DayCare_MeetGrandma
DayCareNoopScene:	
	end

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

DayCare_MeetGrandma:
	follow DAYCARE_LYRA, PLAYER
	applymovement DAYCARE_LYRA, DayCareLyraApproachesGrandma
	stopfollow
	turnobject PLAYER, UP
	turnobject DAYCARE_GRANNY, DOWN
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .IntroduceFemale
	writetext DayCareLyraHelloText1
	sjump .Continue1
.IntroduceFemale:
	writetext DayCareLyraHelloText2
.Continue1:
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ProtestFemale
	writetext DayCareLyraProtestText1
	sjump .Continue2
.ProtestFemale:
	writetext DayCareLyraProtestText2
.Continue2:
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, DOWN
	opentext
	writetext DayCareLyraGoodbyeText
	waitbutton
	closetext
	applymovement DAYCARE_LYRA, DayCareLyraStartsToLeave
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	turnobject DAYCARE_LYRA, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext DayCareLyraForgotText
	waitbutton
	closetext
	addcellnum PHONE_LYRA
	opentext
	writetext GotLyrasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, UP
	opentext
	writetext DayCareLyraEmbarassedText
	waitbutton
	closetext
	applymovement DAYCARE_LYRA, DayCareLyraLeaves
	disappear DAYCARE_LYRA
	setscene SCENE_DAYCARE_NOOP
	end

DayCareManScript_Inside:
	faceplayer
	opentext
	checkitem EGG_TICKET
	iftrue .TicketOddEgg
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	closetext
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetextend DayCareText_PartyFull

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

.TicketOddEgg:
	writetext EggTicketText
	promptbutton
	closetext
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	takeitem EGG_TICKET
	special GiveOddEgg
	opentext
	writetext TradedTicketForOddEggText
	playsound SFX_KEY_ITEM
	waitsfx
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	checkevent EVENT_LYRA_GAVE_AWAY_EGG
	iffalse .NoLyrasEgg
	checkevent EVENT_GOT_LYRAS_EGG
	iftrue .NoLyrasEgg
	writetext DayCareLadyText_GiveLyrasEgg
	promptbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GiveCyndaquilEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GiveTotodileEgg
	giveegg CHIKORITA, EGG_LEVEL
	sjump .GotLyrasEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL, EGG_LEVEL
	sjump .GotLyrasEgg

.GiveTotodileEgg:
	giveegg TOTODILE, EGG_LEVEL
.GotLyrasEgg
	waitsfx
	writetext ReceivedLyrasEggText
	playsound SFX_GET_EGG
	waitsfx
	promptbutton
	writetext DayCareLadyText_DescribeLyrasEgg
	waitbutton
	closetext
	setevent EVENT_GOT_LYRAS_EGG
	end

.NoLyrasEgg:
	special DayCareLady
	waitbutton
	closetext
	end

.PartyFull:
	opentext
	writetextend DayCareText_PartyFull

.HusbandWasLookingForYou:
	writetextend Text_GrampsLookingForYou

DayCareLyraApproachesGrandma:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

DayCareLyraStartsToLeave:
	step RIGHT
	step DOWN
	step_end

DayCareLyraLeaves:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

DayCareLyraHelloText1:
	text "Lyra: Grandma!"

	para "Let me introduce"
	line "my friend."

	para "This is <PLAYER>!"

	para "Grandma: Ah ha."

	para "This is your"
	line "boy… friend."

	para "I see. Hmm."
	done

DayCareLyraHelloText2:
	text "Lyra: Grandma!"

	para "Let me introduce"
	line "my friend."

	para "This is <PLAYER>!"

	para "Grandma: Ah ha."

	para "This is your"
	line "girl… friend."

	para "I see. Hmm."
	done

DayCareLyraProtestText1:
	text "Lyra: What?"
	line "Grandma…!"

	para "What are you"
	line "talking about?"

	para "He just lives"
	line "nearby…"

	para "Grandma: Hahaha."
	line "I know, I know."

	para "You must be sure"
	line "he's talented."

	para "Right, <PLAYER>?"
	line "Come and see us"
	cont "anytime!"
	done

DayCareLyraProtestText2:
	text "Lyra: What?"
	line "Grandma…!"

	para "What are you"
	line "talking about?"

	para "She just lives"
	line "nearby…"

	para "Grandma: Hahaha."
	line "I know, I know."

	para "You must be sure"
	line "she's talented."

	para "Right, <PLAYER>?"
	line "Come and see us"
	cont "anytime!"
	done

DayCareLyraGoodbyeText:
	text "Lyra: Well, I'd"
	line "better go now…"
	cont "See ya!"
	done

DayCareLyraForgotText:
	text "Lyra: Oh!"
	line "I almost forgot!"

	para "Here! This is my"
	line "#gear number!"
	done

GotLyrasNumberText:
	text "<PLAYER> got Lyra's"
	line "phone number."
	done

DayCareLyraEmbarassedText:
	text "Lyra: Grandma!"

	para "Don't you say"
	line "anything."

	para "We're both train-"
	line "ers, and we're"
	cont "supposed to ex-"
	cont "change numbers."
	cont "That's all."
	done

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

DayCareManText_GiveOddEgg:
	text "Hello <PLAYER>."

	para "Do you know about"
	line "Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see,"
	cont "and one day,"
	cont "We were shocked to"
	cont "find an Egg!"

	para "Since then, we"
	line "raise #mon"
	
	para "for other trainers"
	line "and sometimes"
	cont "find Eggs!"

	para "You know, your"
	line "#dex shows Egg"
	cont "groups, and how"
	cont "long they take to"
	cont "hatch!"

	para "Well, wouldn't you"
	line "like this Egg?"

	para "Then fine, this is"
	line "yours to keep!"
	done

DayCareText_GotOddEgg:
	text "<PLAYER> received"
	line "Odd Egg!"
	done

DayCareText_DescribeOddEgg:
	text "We've been raising"
	line "special #mon"
	cont "for a promotion."
	
	para "If you find an Egg"
	line "Ticket, bring it"
	cont "to me, and you'll"
	cont "get another EGG."
	done

EggTicketText:
	text "Oh! You've got"
	line "an Egg Ticket!"
	
	para "I'll exchange it"
	line "for a special Egg."
	done

TradedTicketForOddEggText:
	text "<PLAYER> exchanged"
	line "the Egg Ticket for"
	cont "the Odd Egg!"
	done

DayCareLadyText_GiveLyrasEgg:
	text "Hello, dear."

	para "Lyra told me this"
	line "Egg was a gift for"
	cont "you. Here you go!"
	done

ReceivedLyrasEggText:
	text "<PLAYER> received"
	line "Lyra's Egg!"
	done

DayCareLadyText_DescribeLyrasEgg:
	text "That Egg came from"
	line "her first #mon."

	para "She must really"
	line "trust you as a"
	cont "trainer."
	done

DayCareText_PartyFull:
	text "You've no room for"
	line "this."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_34, 3
	warp_event  0,  5, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, DayCareBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  0,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_DAYCARE
