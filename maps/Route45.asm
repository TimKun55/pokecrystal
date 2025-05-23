	object_const_def
	const ROUTE45_HIKER_M1
	const ROUTE45_HIKER_M2
	const ROUTE45_HIKER_M3
	const ROUTE45_HIKER_M4
	const ROUTE45_BLACK_BELT
	const ROUTE45_COOLTRAINER_M
	const ROUTE45_COOLTRAINER_F
	const ROUTE45_FRUIT_TREE
	const ROUTE45_POKE_BALL1
	const ROUTE45_POKE_BALL2
	const ROUTE45_POKE_BALL3
	const ROUTE45_POKE_BALL4
	const ROUTE45_YOUNGSTER
	const ROUTE45_GLIGAR

Route45_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route45GligarShinyCallback

Route45GligarShinyCallback:
	checkevent EVENT_ROUTE_45_GLIGAR_ENCOUNTERED
	iftrue .NoAppear
	checkevent EVENT_GOT_DIPLOMA
	iftrue .Appear
	sjump .NoAppear

.Appear
	appear ROUTE45_GLIGAR
	endcallback

.NoAppear
	disappear ROUTE45_GLIGAR
	endcallback

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenjiSeenText, BlackbeltKenjiBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BLACKBELT_KENJI
	opentext
	checkcellnum PHONE_BLACKBELT_KENJI
	iftrue .Registered
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	special SampleKenjiBreakCountdown
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.Registered:
	readvar VAR_KENJI_BREAK
	ifnotequal 1, Route45NumberAcceptedM
	checktime MORN
	iftrue .Morning
	checktime EVE | NITE
	iftrue .Night
	checkevent EVENT_KENJI_ON_BREAK
	iffalse Route45NumberAcceptedM
	scall Route45GiftM
	verbosegiveitem PP_UP
	iffalse .NoRoom
	clearevent EVENT_KENJI_ON_BREAK
	special SampleKenjiBreakCountdown
	sjump Route45NumberAcceptedM

.Morning:
	writetext BlackbeltKenjiMorningText
	waitbutton
	closetext
	end

.Night:
	writetext BlackbeltKenjiNightText
	waitbutton
	closetext
	end

.NoRoom:
	sjump Route45PackFullM

Route45AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route45AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route45RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route45NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route45NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route45PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route45RematchM:
	jumpstd RematchMScript
	end

Route45GiftM:
	jumpstd GiftMScript
	end

Route45PackFullM:
	jumpstd PackFullMScript
	end

HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd PackFullMScript
	end

Route45RematchGiftM:
	jumpstd RematchGiftMScript
	end

TrainerHikerErik:
	trainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerErikAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerParry:
	trainer HIKER, PARRY1, EVENT_BEAT_HIKER_PARRY, HikerParrySeenText, HikerParryBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	opentext
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParryBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	checkevent EVENT_PARRY_IRON
	iftrue .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftrue .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermRyan:
	trainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRyanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperQuentin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iftrue .Defeated
	writetext CamperQuentinSeenText
	waitbutton
	closetext
	winlosstext CamperQuentinBeatenText, 0
	loadtrainer CAMPER, QUENTIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_QUENTIN
	closetext
	end

.Defeated:
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end

Route45Gligar:
	cry GLIGAR
	loadwildmon GLIGAR, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	disappear ROUTE45_GLIGAR
	reloadmapafterbattle
	setevent EVENT_ROUTE_45_GLIGAR_ENCOUNTERED
	end

Route45Sign:
	jumptext Route45SignText

Route45FruitTree:
	fruittree FRUITTREE_ROUTE_45

Route45Nugget:
	itemball NUGGET

Route45Revive:
	itemball REVIVE

Route45Elixer:
	itemball ELIXER

Route45MaxPotion:
	itemball MAX_POTION

Route45HiddenPpUp:
	hiddenitem PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP

HikerErikSeenText:
	text "Be prepared for"
	line "anything!"

	para "Let me see if your"
	line "#mon have been"
	cont "raised properly!"
	done

HikerErikBeatenText:
	text "Oh, I lost that!"
	done

HikerErikAfterBattleText:
	text "I'll head back to"
	line "Blackthorn's Ice"

	para "Path and train"
	line "some more."
	done

HikerMichaelSeenText:
	text "Yo! You're spunky!"
	line "But you know what?"

	para "When it comes to"
	line "sheer spunkiness,"
	cont "I'm the man!"
	done

HikerMichaelBeatenText:
	text "My #mon weren't"
	line "spunky enough!"
	done

HikerMichaelAfterBattleText:
	text "Boy, do I love"
	line "HP Up! Mmmm, yum!"

	para "I keep drinking my"
	line "#mon's!"

	para "I can't help it!"
	done

HikerParrySeenText:
	text "My #mon are"
	line "power packed!"
	done

HikerParryBeatenText:
	text "Wahahah! I'm the"
	line "big loser!"
	done

HikerParryAfterBattleText:
	text "I'm not much good"
	line "at thinking, see?"

	para "So, I just plow"
	line "ahead with power!"
	done

HikerTimothySeenText:
	text "Why do I climb"
	line "mountains?"

	para "Because they're"
	line "there."

	para "Why do I train"
	line "#mon?"

	para "Because they're"
	line "there!"
	done

HikerTimothyBeatenText:
	text "Losses…"
	line "They're there too!"
	done

HikerTimothyAfterBattleText:
	text "The best thing to"
	line "ever happen to me"

	para "was discovering"
	line "#mon."
	done

HikerParryGivesIronText:
	text "I just can't find"
	line "a way to win!"

	para "Keep it up!"

	para "Oh, and take this"
	line "--it's the gift"

	para "you couldn't take"
	line "when we last met."
	done

BlackbeltKenjiSeenText:
	text "I was training"
	line "here alone."

	para "Behold the fruits"
	line "of my labor!"
	done

BlackbeltKenjiBeatenText:
	text "Waaaargh!"
	done

BlackbeltKenjiAfterBattleText:
	text "This calls for"
	line "extreme measures."

	para "I must take to the"
	line "hills and train in"
	cont "solitude."
	done

BlackbeltKenjiMorningText:
	text "I'm going to train"
	line "a bit more before"
	cont "I break for lunch."
	done

BlackbeltKenjiNightText:
	text "We had plenty of"
	line "rest at lunch, so"

	para "now we're all"
	line "ready to go again!"

	para "We're going to"
	line "train again!"
	done

CooltrainermRyanSeenText:
	text "What are your"
	line "thoughts on rais-"
	cont "ing #mon?"
	done

CooltrainermRyanBeatenText:
	text "You've won my"
	line "respect."
	done

CooltrainermRyanAfterBattleText:
	text "I see you're rais-"
	line "ing your #mon"
	cont "with care."

	para "The bond you build"
	line "will save you in"
	cont "tough situations."
	done

CooltrainerfKellySeenText:
	text "What is your"
	line "battle strategy?"

	para "It is foolish to"
	line "use strong moves"
	cont "indiscriminately."
	done

CooltrainerfKellyBeatenText:
	text "Fine. I lost."
	done

CooltrainerfKellyAfterBattleText:
	text "I'm not in favor"
	line "of overly power-"
	cont "ful moves."

	para "I want to win, but"
	line "I also don't want"
	cont "to harm #mon."
	done

Route45DummyText:
	text "I'm really, really"
	line "tough!"

	para "Is there anywhere"
	line "I can prove how"
	cont "tough I really am?"
	done

CamperQuentinSeenText:
	text "I'm really, really"
	line "tough!"
	done

CamperQuentinBeatenText:
	text "I was tough at the"
	line "Battle Tower…"
	done

CamperQuentinAfterBattleText:
	text "Have you been to"
	line "the Battle Tower?"

	para "I never, ever lose"
	line "there, but…"
	done

Route45SignText:
	text "Route 45"
	line "Mountain Rd. ahead"
	done

Route45_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route45Sign
	bg_event 11, 74, BGEVENT_ITEM, Route45HiddenPpUp

	def_object_events
	object_event  9, 15, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerErik, -1
	object_event 11, 69, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event  5, 26, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerHikerParry, -1
	object_event  5, 69, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerHikerTimothy, -1
	object_event 11, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 17, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermRyan, -1
	object_event  5, 38, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfKelly, -1
	object_event 10, 80, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45FruitTree, -1
	object_event  4, 47, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, Route45Nugget, EVENT_ROUTE_45_NUGGET
	object_event  3, 61, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, Route45Revive, EVENT_ROUTE_45_REVIVE
	object_event  2, 17, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, Route45Elixer, EVENT_ROUTE_45_ELIXER
	object_event 12, 31, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, Route45MaxPotion, EVENT_ROUTE_45_MAX_POTION
	object_event 16, 64, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerCamperQuentin, -1
	object_event 13, 42, SPRITE_GLIGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route45Gligar, EVENT_ROUTE_45_GLIGAR
