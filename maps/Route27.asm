	object_const_def
	const ROUTE27_COOLTRAINER_M1
	const ROUTE27_COOLTRAINER_M2
	const ROUTE27_COOLTRAINER_F1
	const ROUTE27_COOLTRAINER_F2
	const ROUTE27_COOLTRAINER_F3
	const ROUTE27_YOUNGSTER1
	const ROUTE27_POKE_BALL1
	const ROUTE27_POKE_BALL2

Route27_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPsychicGilbert:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBlake:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	opentext
	checkflag ENGINE_REENA_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue .NumberAccepted
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfReenaAfterBattleText
	promptbutton
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfReenaBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

TrainerCooltrainerfMegan:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsJohtoSign:
	jumptext TohjoFallsJohtoSignText

Route27TMSolarbeam:
	itemball TM_SOLARBEAM

Route27RareCandy:
	itemball RARE_CANDY

CooltrainerfBeth1SeenText:
	text "I lost to a train-"
	line "er named <RIVAL>."

	para "He was really"
	line "strong, but…"

	para "It was as if he"
	line "absolutely had to"
	cont "win at any cost."

	para "I felt sorry for"
	line "his #mon."
	done

CooltrainerfBeth1BeatenText:
	text "#mon aren't"
	line "tools of war."
	done

CooltrainerfBethAfterText:
	text "#mon are in-"
	line "valuable, lifelong"
	cont "partners."
	done

CooltrainermBlakeSeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainermBlakeBeatenText:
	text "Yow!"
	done

CooltrainermBlakeAfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done

CooltrainermBrianSeenText:
	text "Hm? You're good,"
	line "aren't you?"
	done

CooltrainermBrianBeatenText:
	text "Just as I thought!"
	done

CooltrainermBrianAfterBattleText:
	text "A good trainer can"
	line "recognize other"
	cont "good trainers."
	done

CooltrainerfReenaSeenText:
	text "You shouldn't"
	line "underestimate the"

	para "wild #mon in"
	line "these parts."
	done

CooltrainerfReenaBeatenText:
	text "Oh! You're much"
	line "too strong!"
	done

CooltrainerfReenaAfterBattleText:
	text "You're just a kid,"
	line "but you're not to"

	para "be underestimated"
	line "either."
	done

CooltrainerfMeganSeenText:
	text "It's rare to see"
	line "anyone come here."

	para "Are you training"
	line "on your own?"
	done

CooltrainerfMeganBeatenText:
	text "Oh! You're really"
	line "strong!"
	done

CooltrainerfMeganAfterBattleText:
	text "I'm checking out"
	line "pre- and post-"
	cont "evolution #mon."

	para "Evolution really"
	line "does make #mon"
	cont "stronger."

	para "But evolved forms"
	line "also learn moves"
	cont "later on."
	done

PsychicGilbertSeenText:
	text "Don't say a thing!"

	para "Let me guess what"
	line "you're thinking."

	para "Mmmmmmm…"

	para "I got it! You're"
	line "on the #mon"
	cont "League challenge!"
	done

PsychicGilbertBeatenText:
	text "You're too much!"
	done

PsychicGilbertAfterBattleText:
	text "With your skills,"
	line "you'll do well at"
	cont "the League."

	para "That's what my"
	line "premonition says."
	done

TohjoFallsJohtoSignText:
	text "Tohjo Falls"

	para "The link between"
	line "Kanto and Johto"
	
	para "North: #mon"
	line "League."
	
	para "West: New"
	line "Bark Town."
	done

Route27_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, ROUTE_27_AERIAL_ACE_HOUSE, 1
	warp_event 72, 11, TOHJO_FALLS, 1

	def_coord_events

	def_bg_events
	bg_event 71, 12, BGEVENT_READ, TohjoFallsJohtoSign

	def_object_events
	object_event 22, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 24,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 55, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 42,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMegan, -1
	object_event 67, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event 60,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfBeth1, -1
	object_event 51,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 54, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27RareCandy, EVENT_ROUTE_27_RARE_CANDY
