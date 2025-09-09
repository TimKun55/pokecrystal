	object_const_def
	const SAFFRONAVICULTURALSOCIETY3F_BIRD_KEEPER
	const SAFFRONAVICULTURALSOCIETY3F_GRAMPS
	const SAFFRONAVICULTURALSOCIETY3F_ARTICUNO_STATUE
	const SAFFRONAVICULTURALSOCIETY3F_ZAPDOS_STATUE
	const SAFFRONAVICULTURALSOCIETY3F_MOLTRES_STATUE

SaffronAviculturalSociety3F_MapScripts:
	def_scene_scripts

	def_callbacks

AviculturalSocietyGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	iftrue .GrampsEncounteredBirds
	writetextend AviculturalSocietyGrampsIntroText
	
.GrampsEncounteredBirds
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext AviculturalSocietyGrampsYouDidItText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
.GotSilverWing:
	writetextend AviculturalSocietyGrampsSilverWingText

ArticunoStatueScript:
	jumptext ArticunoStatueText

ZapdosStatueScript:
	jumptext ZapdosStatueText

MoltresStatueScript:
	jumptext MoltresStatueText

AviculturalSociety3FBookshelf1:
	jumptext AviculturalSociety3FBookshelf1Text

AviculturalSociety3FBookshelf2:
	jumptext AviculturalSociety3FBookshelf2Text
	
AviculturalSocietyGrampsIntroText:
	text "Hello there."

	para "It's not often we"
	line "get someone of"
	cont "your age up here."

	para "Have you come to"
	line "learn more about"
	cont "the great Legends"
	cont "or are you think-"
	cont "ing of challening"
	cont "the Guardians of"
	cont "the Birds?"

	para "Either way, I am"
	line "impressed!"

	para "I'm the founder of"
	line "the Avicultural"
	cont "Society."

	para "You might not"
	line "believe it, but my"
	cont "family is deeply"
	cont "connected to the"
	cont "great Lugia."

	para "Others have family"
	line "or friends who" 
	cont "have spotted the"
	cont "Legendary Birds."

	para "So I set out,"
	line "found as many"
	cont "of them as I could"
	cont "and formed this"
	cont "Society to have"
	cont "all the data"
	cont "in one place."

	para "It has taken"
	line "many years, but"
	cont "I'm proud of my"
	cont "life's work!"
	done

AviculturalSocietyGrampsYouDidItText:
	text "Oh my!"
	line "You've done it!"

	para "I can not tell"
	line "you the pride I"
	cont "feel seeing a new"
	cont "Successor emerging"
	cont "before us!"

	para "You have proved"
	line "yourself many"
	cont "times. I will"
	cont "not ask for a"
	cont "battle, don't"
	cont "worry. Ho ho ho."

	para "Please, take this."
	done

AviculturalSocietyGrampsSilverWingText:
	text "That is the"
	line "Silver Wing."

	para "A feather from"
	line "Lugia itself."

	para "Many have tried"
	line "to find Lugia,"
	cont "but without some-"
	cont "thing like this,"
	cont "Lugia will not"
	cont "show itself to"
	cont "just any trainer."

	para "Take this to"
	line "Whirl Islands"
	cont "and challenge"
	cont "Lugia."
	done

ArticunoStatueText:
	text "An extremely det-"
	line "ailed statue of"
	cont "Articuno."
	done

ZapdosStatueText:
	text "An extremely det-"
	line "ailed statue of"
	cont "Zapdos."
	done

MoltresStatueText:
	text "An extremely det-"
	line "ailed statue of"
	cont "Moltres."
	done

AviculturalSociety3FBookshelf1Text:
	text "So powerful even"
	line "a light fluttering"
	cont "of its wings can"
	cont "blow apart houses"
	cont "and flaps of its"
	cont "wings are said to"
	cont "cause storms"
	cont "lasting 40 days."

	para "As a result, it"
	line "chooses to live"
	cont "out of sight deep"
	cont "under the sea."
	done

AviculturalSociety3FBookshelf2Text:
	text "Said to be the"
	line "leader of the"
	cont "Legendary Birds."

	para "Should they find"
	line "themselves in a"
	cont "rage, Lugia will"
	cont "appear to calm"
	cont "them with its"
	cont "high intelligence"
	cont "and power."
	done

SaffronAviculturalSociety3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 12, SAFFRON_AVICULTURAL_SOCIETY_2F, 2

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, AviculturalSociety3FBookshelf1
	bg_event  5,  1, BGEVENT_READ, AviculturalSociety3FBookshelf1
	bg_event  8,  1, BGEVENT_READ, AviculturalSociety3FBookshelf2
	bg_event  9,  1, BGEVENT_READ, AviculturalSociety3FBookshelf2

	def_object_events
	object_event  6,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyGrampsScript, -1
	object_event  5,  7, SPRITE_ARTICUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, ArticunoStatueScript, -1
	object_event  7,  7, SPRITE_ZAPDOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, ZapdosStatueScript, -1
	object_event  9,  7, SPRITE_MOLTRES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, MoltresStatueScript, -1
