	object_const_def
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_BIRD_KEEPER1
	const ROUTE12_BIRD_KEEPER2
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperTeddy:
	trainer BIRD_KEEPER, TEDDY, EVENT_BEAT_BIRD_KEEPER_TEDDY, BirdKeeperTeddySeenText, BirdKeeperTeddyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTeddyAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperFred:
	trainer BIRD_KEEPER, FRED, EVENT_BEAT_BIRD_KEEPER_FRED, BirdKeeperFredSeenText, BirdKeeperFredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperFredAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #mon."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "I'm too impatient"
	line "for fishing…"
	done

FisherStephenSeenText:
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done

FisherStephenBeatenText:
	text "My stupid radio"
	line "distracted me!"
	done

FisherStephenAfterBattleText:
	text "Have you checked"
	line "out Kanto's radio"

	para "programs? We get a"
	line "good variety here."
	done

FisherBarneySeenText:
	text "What's most impor-"
	line "tant in our every-"
	cont "day lives?"
	done

FisherBarneyBeatenText:
	text "The answer is"
	line "coming up next!"
	done

FisherBarneyAfterBattleText:
	text "I think electric-"
	line "ity is the most"

	para "important thing in"
	line "our daily lives."

	para "If it weren't,"
	line "people wouldn't"

	para "have made such a"
	line "fuss when the"

	para "Power Plant went"
	line "out of commission."
	done

FisherKyleSeenText:
	text "Do you remember?"
	done

FisherKyleBeatenText:
	text "You do remember?"
	done

FisherKyleAfterBattleText:
	text "The tug you feel"
	line "on the Rod when"

	para "you hook a #-"
	line "mon…"

	para "That's the best"
	line "feeling ever for"
	cont "an angler like me."
	done

BirdKeeperTeddySeenText:
	text "Check out my"
	line "awesome birds!"
	done

BirdKeeperTeddyBeatenText:
	text "My awesome birds!"
	done

BirdKeeperTeddyAfterBattleText:
	text "No matter the time"
	line "of day, I'm always"

	para "looking out for"
	line "bird #mon."
	done

BirdKeeperFredSeenText:
	text "Do you know about"
	line "the Society?"
	done

BirdKeeperFredBeatenText:
	text "My membership!"
	done

BirdKeeperFredAfterBattleText:
	text "I'm a member of"
	line "the Avicultural"

	para "Society in Saffron"
	line "City!"
	
	para "I'm collecting"
	line "data for them."
	done

Route12SignText:
	text "Route 12"

	para "North to Lavender"
	line "Town"
	done

FishingSpotSignText:
	text "Fishing Spot"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 41, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  9,  3, ROUTE_12_LAVENDER_GATE, 3
	warp_event 10,  3, ROUTE_12_LAVENDER_GATE, 4
	warp_event  2, 34, ROUTE_11_ROUTE_12_GATE, 3
	warp_event  2, 35, ROUTE_11_ROUTE_12_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  8, 29, BGEVENT_READ, Route12Sign
	bg_event 12, 15, BGEVENT_READ, FishingSpotSign
	bg_event 15, 26, BGEVENT_ITEM, Route12HiddenElixer

	def_object_events
	object_event  5, 21, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 15, 32, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 46, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  5, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event 11, 23, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperTeddy, -1
	object_event 15, 56, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperFred, -1
	object_event  5, 51, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 59, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
