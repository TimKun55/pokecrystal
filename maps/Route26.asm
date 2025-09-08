	object_const_def
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_PSYCHIC
	const ROUTE26_BIRD_KEEPER
	const ROUTE26_FISHER1
	const ROUTE26_BUG_MANIAC
	const ROUTE26_FISHER2
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL
	const ROUTE26_ROCK1
	const ROUTE26_ROCK2
	const ROUTE26_ROCK3

Route26_MapScripts:
	def_scene_scripts
	scene_script Route26Noop1Scene, SCENE_ROUTE26_FIRST_STEP_INTO_KANTO
	scene_script Route26Noop2Scene, SCENE_ROUTE26_NOOP

	def_callbacks
	
Route26Noop1Scene:
Route26Noop2Scene:
	end
	
FirstStepIntoKantoScene:
	turnobject ROUTE26_FISHER2, LEFT
	showemote EMOTE_SHOCK, ROUTE26_FISHER2, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext Route26Fisher2HeyText
	promptbutton
	writetext Route26Fisher2Text
	waitbutton
	closetext
	setscene SCENE_ROUTE26_NOOP
	end

Route26Fisher2Script:
	jumptextfaceplayer Route26Fisher2Text

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainermJakeAfterBattleText

TrainerCooltrainermGaven:
	trainer COOLTRAINERM, GAVEN1, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGavenSeenText, CooltrainermGavenBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGavenBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerfJoyceAfterBattleText

TrainerBirdKeeperJose:
	trainer BIRD_KEEPER, JOSE1, EVENT_BEAT_BIRD_KEEPER_JOSE, BirdKeeperJoseSeenText, BirdKeeperJoseBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_JOSE
	opentext
	checkflag ENGINE_JOSE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasStarPiece
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftrue .NumberAccepted
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperJoseAfterBattleText
	promptbutton
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext BirdKeeperJoseBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.HasStarPiece:
	scall .Gift
	verbosegiveitem STAR_PIECE
	iffalse .NoRoom
	clearflag ENGINE_JOSE_HAS_STAR_PIECE
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerBeautyBrenda:
	trainer BEAUTY, BRENDA, EVENT_BEAT_BEAUTY_BRENDA, BeautyBrendaSeenText, BeautyBrendaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BeautyBrendaAfterBattleText

TrainerFisherScott:
	trainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext FisherScottAfterBattleText

TrainerBugManiacNeville:
	trainer BUG_MANIAC, NEVILLE, EVENT_BEAT_BUG_MANIAC_NEVILLE, BugManiacNevilleSeenText, BugManiacNevilleBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugManiacNevilleAfterBattleText

Route26Rock:
	jumpstd SmashRockScript

Route26Sign:
	jumptext Route26SignText
	
TohjoFallsKantoSign:
	jumptext TohjoFallsKantoSignText

Route26RawstTree:
	fruittree FRUITTREE_ROUTE_26_RAWST

Route26MaxElixer:
	itemball MAX_ELIXER

Route26PPUp:
	itemball PP_UP
	
Route26Fisher2HeyText:
	text "Hey!"
	done

Route26Fisher2Text:
	text "Do you know what"
	line "you just did?"

	para "You've taken your"
	line "first step into"
	cont "Kanto."

	para "Check your #-"
	line "gear Map and see."
	done

CooltrainermJakeSeenText:
	text "I'm making my"
	line "final preparations"
	cont "for the #mon"
	cont "League."
	done

CooltrainermJakeBeatenText:
	text "I blew it!"
	done

CooltrainermJakeAfterBattleText:
	text "It's going to be"
	line "tough to win at"
	cont "the League."

	para "I need to do some"
	line "more training."

	para "I hear that the"
	line "League's Elite"
	cont "Four are tougher"
	cont "than Gym Leaders."
	done

CooltrainermGavenSeenText:
	text "By experiencing"
	line "tough battles, you"
	cont "gain power."
	done

CooltrainermGavenBeatenText:
	text "Gaah! Life is even"
	line "tougher!"
	done

CooltrainermGavenAfterText:
	text "To get to #mon"
	line "League, you have"
	cont "to get through"
	cont "Victory Road."

	para "But Victory Road"
	line "is tough."

	para "Practically nobody"
	line "goes there!"
	done

CooltrainerfJoyceSeenText:
	text "Since you've come"
	line "this far, you must"
	cont "be good."

	para "I'm going to give"
	line "this battle every-"
	cont "thing I've got!"
	done

CooltrainerfJoyceBeatenText:
	text "No! I don't"
	line "believe this!"
	done

CooltrainerfJoyceAfterBattleText:
	text "I've defeated"
	line "eight Gym Leaders,"
	cont "so I was feeling"
	cont "confident."

	para "I'll have to try"
	line "harder next time."
	done

BirdKeeperJoseSeenText:
	text "Tweet! Tweet!"
	line "Tetweet!"
	done

BirdKeeperJoseBeatenText:
	text "Tweet!"
	done

BirdKeeperJoseAfterBattleText:
	text "Bird Keepers like"
	line "me mimic bird"
	cont "whistles to com-"
	cont "mand #mon."
	done

PsychicRichardSeenText:
	text "Wow, look at all"
	line "those Badges!"
	cont "I'm impressed."

	para "But you're not"
	line "satisfied by just"
	cont "collecting them,"
	cont "right?"
	done

PsychicRichardBeatenText:
	text "Good battle!"
	done

PsychicRichardAfterBattleText:
	text "People and #mon"
	line "grow from their"
	cont "experiences."

	para "Don't get lazy and"
	line "complacent."
	done

BeautyBrendaSeenText:
	text "On your way to the"
	line "League, hey?"

	para "Let's see if"
	line "you're ready!"
	done

BeautyBrendaBeatenText:
	text "Ok, ok, you won!"
	done

BeautyBrendaAfterBattleText:
	text "After a bit more"
	line "training, I'm"
	cont "going to challenge"
	cont "them, too!"
	done

FisherScottSeenText:
	text "I'm feeling great"
	line "today!"

	para "I feel like I"
	line "could boot even"
	cont "the League Champ!"
	done

FisherScottBeatenText:
	text "No! Not in this"
	line "battle!"
	done

FisherScottAfterBattleText:
	text "Just like in fish-"
	line "ing, it's all over"
	cont "in #mon if you"
	cont "give up."
	done

BugManiacNevilleSeenText:
	text "You're on your"
	line "way to the"
	cont "#mon League?"

	para "We should battle"
	line "as a warm up!"
	done

BugManiacNevilleBeatenText:
	text "Oh, wow, too hot!"
	done

BugManiacNevilleAfterBattleText:
	text "I lost but I'm"
	line "not giving up!"

	para "Maybe I should"
	line "have a rematch"
	cont "with Bugsy…?"
	done

Route26SignText:
	text "Route 26"

	para "#mon League"
	line "Reception Gate"
	done
	
TohjoFallsKantoSignText:
	text "Tohjo Falls"

	para "The link between"
	line "Kanto and Johto"
	
	para "West: New"
	line "Bark Town."

	para "North: #mon"
	line "League."
	done

Route26_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, POKEMON_LEAGUE_GATE, 5
	warp_event  8,  5, POKEMON_LEAGUE_GATE, 6	
	warp_event 15, 51, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1
	warp_event  4, 89, TOHJO_FALLS, 2
	warp_event  6, 95, TOHJO_FALLS, 3

	def_coord_events
	coord_event  4, 90, SCENE_ROUTE26_FIRST_STEP_INTO_KANTO, FirstStepIntoKantoScene

	def_bg_events
	bg_event  9,  7, BGEVENT_READ, Route26Sign
	bg_event  6, 90, BGEVENT_READ, TohjoFallsKantoSign


	def_object_events
	object_event 14,  24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	object_event 11,  82, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermGaven, -1
	object_event  9,  58, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	object_event  5,   8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperJose, -1
	object_event 12,  72, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyBrenda, -1
	object_event  8,  38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherScott, -1
	object_event  7,  45, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBugManiacNeville, -1
	object_event  5,  90, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, Route26Fisher2Script, -1
	object_event 12,  51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26RawstTree, -1
	object_event   6, 15, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
	object_event  9,  96, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Rock, -1
	object_event 14,  98, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Rock, -1
	object_event 13, 100, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26Rock, -1
	object_event 10, 100, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26PPUp, EVENT_ROUTE_26_PP_UP
