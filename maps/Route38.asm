	object_const_def
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_LASS
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_BEAUTY1
	const ROUTE38_SAILOR
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BEAUTY2
	const ROUTE38_LADY_KAT
	const ROUTE38_RAIKOU

Route38_MapScripts:
	def_scene_scripts
	scene_script Route38Noop1Scene, SCENE_ROUTE38_NOOP
	scene_script Route38Noop2Scene, SCENE_ROUTE38_RAIKOU

	def_callbacks

Route38Noop1Scene:
Route38Noop2Scene:
	end

Route38Raikou1aScript:
	turnobject PLAYER, DOWN
	pause 15
	turnobject ROUTE38_RAIKOU, UP
	sjump Route38Raikou1bScript.Route38RaikouLeave

Route38Raikou1bScript:
	turnobject PLAYER, RIGHT
	pause 15
	turnobject ROUTE38_RAIKOU, LEFT
.Route38RaikouLeave
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	showemote EMOTE_SHOCK, ROUTE38_RAIKOU, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement ROUTE38_RAIKOU, Route38RaikouMovement
	disappear ROUTE38_RAIKOU
	pause 10
	setscene SCENE_ROUTE38_NOOP
	clearevent EVENT_SAW_RAIKOU_ON_ROUTE_44
	setmapscene ROUTE_44, SCENE_ROUTE44_RAIKOU
	end

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext BirdKeeperTobyAfterBattleText

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext SailorHarryAfterBattleText

TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	opentext
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftrue .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftrue .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext LassDanaMoomooMilkText
	promptbutton
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1F
	sjump .AskForPhoneNumber

.SecondTimeAsking:
	scall .AskNumber2F
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .DeclinedPhoneNumber
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall .RegisteredPhoneNumber
	sjump .NumberAccepted

.DanaRematch:
	scall .Rematch
	winlosstext LassDana1BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.TryGiveThunderstone:
	scall .Gift
	verbosegiveitem THUNDERSTONE
	iffalse .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	sjump .NumberAccepted

.NoRoomForThunderstone:
	sjump .PackFull

.AskNumber1F:
	jumpstd AskNumber1FScript
	end

.AskNumber2F:
	jumpstd AskNumber2FScript
	end

.RegisteredPhoneNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.DeclinedPhoneNumber:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Rematch:
	jumpstd RematchFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	sjump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.AskPhoneNumber1:
	jumpstd AskNumber1MScript
	end

.AskPhoneNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredChad:
	jumpstd RegisteredNumberMScript
	end

.HaveChadsNumber:
	jumpstd NumberAcceptedMScript
	end

.SaidNo:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext BeautyValerieAfterBattleText

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext BeautyOliviaAfterBattleText
	
TrainerLadyKat:
	trainer LADY, KAT, EVENT_BEAT_LADY_KAT, LadyKatSeenText, LadyKatBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext LadyKatAfterBattleText

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

Route38OranTree:
	fruittree FRUITTREE_ROUTE_38_ORAN

Route38RaikouMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

BirdKeeperTobySeenText:
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #mon!"
	done

BirdKeeperTobyBeatenText:
	text "I feel like just"
	line "flying away now."
	done

BirdKeeperTobyAfterBattleText:
	text "I plan to train in"
	line "Cianwood City to"
	cont "teach my #mon"
	cont "how to Fly."
	done

SchoolboyChad1SeenText:
	text "Let me try some-"
	line "thing I learned"
	cont "today."
	done

SchoolboyChad1BeatenText:
	text "I didn't study"
	line "enough, I guess."
	done

SchoolboyChadSoManyTestsText:
	text "I have to take so"
	line "many tests, I"
	cont "don't have much"
	cont "time for #mon."

	para "So when I do get"
	line "to play, I really"
	cont "concentrate."
	done

LassDana1SeenText:
	text "You seem to be"
	line "good at #mon."

	para "If you are, how"
	line "about giving me"
	cont "some advice?"
	done

LassDana1BeatenText:
	text "I see. So you can"
	line "battle that way."
	done

LassDanaMoomooMilkText:
	text "I know something"
	line "good!"

	para "Moomoo Farm's milk"
	line "is famous for its"
	cont "flavor."
	done

BeautyValerieSeenText:
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#mon?"
	done

BeautyValerieBeatenText:
	text "I'm glad I got to"
	line "see your #mon!"
	done

BeautyValerieAfterBattleText:
	text "When I see #-"
	line "mon, it seems to"
	cont "soothe my nerves."
	done

SailorHarrySeenText:
	text "I've been over-"
	line "seas, so I know"
	cont "about all sorts of"
	cont "#mon!"
	done

SailorHarryBeatenText:
	text "Your skill is"
	line "world class!"
	done

SailorHarryAfterBattleText:
	text "All kinds of peo-"
	line "ple around the"
	cont "world live happily"
	cont "with #mon."
	done

BeautyOliviaSeenText:
	text "Don't you think my"
	line "#mon and I are"
	cont "beautiful?"
	done

BeautyOliviaBeatenText:
	text "We drink Moomoo"
	line "Milk every day."
	done

BeautyOliviaAfterBattleText:
	text "Moomoo Milk is"
	line "good for beauty"
	cont "and health!"

	para "I usually buy a"
	line "dozen bottles"
	cont "at a time."
	done
	
LadyKatSeenText:
	text "Hi there!"
	line "Did you just come"
	cont "from Ecruteak?"
	
	para "Did you visit my"
	line "family's house?"
	
	para "We should battle!"
	done

LadyKatBeatenText:
	text "Aww, I lost!"
	done

LadyKatAfterBattleText:
	text "Johto is such a"
	line "beautiful region"
	cont "but I miss Hoenn."
	done

Route38SignText:
	text "Route 38"

	para "Olivine City -"
	line "Ecruteak City"
	done

Route38TrainerTipsText:
	text "Trainer Tips"

	para "If a #mon is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#mon and stops"
	cont "its evolution."
	done

Route38_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 10, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35, 11, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events
	coord_event  6, 13, SCENE_ROUTE38_RAIKOU, Route38Raikou1aScript
	coord_event  5, 14, SCENE_ROUTE38_RAIKOU, Route38Raikou1bScript
	coord_event  5, 16, SCENE_ROUTE38_RAIKOU, Route38Raikou1bScript

	def_bg_events
	bg_event 33,  9, BGEVENT_READ, Route38Sign
	bg_event  5, 15, BGEVENT_READ, Route38TrainerTips

	def_object_events
	object_event  5,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 12, 17, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
	object_event 19, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyValerie, -1
	object_event 24,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	object_event 12, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38OranTree, -1
	object_event 23, 14, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyOlivia, -1
	object_event 31,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerLadyKat, -1
	object_event  6, 15, SPRITE_RAIKOU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_RAIKOU_ON_ROUTE_38
