	object_const_def
	const SAFFRONAVICULTURALSOCIETY3F_BIRD_KEEPER
	const SAFFRONAVICULTURALSOCIETY3F_GRAMPS
	const SAFFRONAVICULTURALSOCIETY3F_LORELEI
	const SAFFRONAVICULTURALSOCIETY3F_AGATHA
	const SAFFRONAVICULTURALSOCIETY3F_ARTICUNO_STATUE
	const SAFFRONAVICULTURALSOCIETY3F_ZAPDOS_STATUE
	const SAFFRONAVICULTURALSOCIETY3F_MOLTRES_STATUE

SaffronAviculturalSociety3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, AviculturalSocietyLoreleiCallback
	callback MAPCALLBACK_OBJECTS, AviculturalSocietyAgathaCallback

AviculturalSocietyLoreleiCallback:
	checkevent EVENT_BEAT_GUARDIAN_LORELEI
	iftrue .Appear
	disappear SAFFRONAVICULTURALSOCIETY3F_LORELEI
	endcallback

.Appear:
	appear SAFFRONAVICULTURALSOCIETY3F_LORELEI
	endcallback
	
AviculturalSocietyAgathaCallback:
	checkevent EVENT_BEAT_GUARDIAN_AGATHA
	iftrue .Appear
	disappear SAFFRONAVICULTURALSOCIETY3F_AGATHA
	endcallback

.Appear:
	appear SAFFRONAVICULTURALSOCIETY3F_AGATHA
	endcallback

AviculturalSocietyGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	iftrue .GrampsEncounteredBirds
	checkevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	iffalse .GrampsLuck
	writetext AviculturalSocietyGrampsIntroText
	waitbutton
	closetext
	end
	
.GrampsLuck
	writetext AviculturalSocietyGrampsGoodLuckText
	waitbutton
	closetext
	end
	
.GrampsEncounteredBirds
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext AviculturalSocietyGrampsYouDidItText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
.GotSilverWing:
	writetext AviculturalSocietyGrampsSilverWingText
	waitbutton
	closetext
	end

AviculturalSociety3FBirdKeeperScript:
	faceplayer
	opentext
	checkevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	iffalse .GoodLuck
	checkevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	iftrue .EncounteredBirds
	writetext AviculturalSocietyBirdKeeperIntroText
	yesorno
	iffalse .Refused
	writetext AviculturalSocietyBirdKeeperBeginText
	waitbutton
	clearevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	setevent EVENT_CINNABAR_VOLCANO_1F_OFFICER
	setmapscene CINNABAR_VOLCANO_1F, SCENE_CINNABARVOLCANO1F_NOOP
	closetext
	end
	
.GoodLuck
	writetext AviculturalSocietyBirdKeeperGoodLuckText
	waitbutton
	closetext
	end
	
.EncounteredBirds
	writetext AviculturalSocietyBirdKeeperEncounteredBirdsText
	waitbutton
	closetext
	end
	
.Refused
	writetext AviculturalSocietyBirdKeeperRefusedText
	waitbutton
	closetext
	end
	
AviculturalSocietyLoreleiScript:
	faceplayer
	opentext
	writetext LoreleiRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext LoreleiWinLossRematchText, 0
	loadtrainer LORELEI, LORELEI2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoreleiRematchAfterBattleText
	waitbutton
	closetext
	end
	
.EndRematch
	writetext LoreleiNextTimeText
	waitbutton
	closetext
	end

AviculturalSocietyAgathaScript:
	faceplayer
	opentext
	writetext AgathaRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext AgathaWinLossRematchText, 0
	loadtrainer AGATHA, AGATHA2
	startbattle
	reloadmapafterbattle
	opentext
	writetext AgathaRematchAfterBattleText
	waitbutton
	closetext
	end
	
.EndRematch
	writetext AgathaNextTimeText
	waitbutton
	closetext
	end

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
	
	para "or are you think-"
	line "ing of challening"
	cont "the Guardians?"
	
	para "Either way, I am"
	line "impressed!"
	
	para "I'm the founder of"
	line "the Avicultural"
	cont "Society."
	
	para "You might not"
	line "believe it, but my"
	cont "family is deeply"
	
	para "connected to the"
	line "great Lugia."
	
	para "Others have family"
	line "or friends who" 
	
	para "have spotted the"
	line "Legendary Birds."
	
	para "So I set out,"
	line "found as many"
	cont "of them as I could"
	
	para "and formed this"
	line "Society to have"
	cont "all the data"
	cont "in one place."
	
	para "It has taken"
	line "many years, but"
	cont "I'm proud of my"
	cont "life's work!"
	done
	
AviculturalSocietyGrampsGoodLuckText:
	text "Oh ho!"
	line "I see that you're"
	cont "taking on the"
	cont "Guardians!"
	
	para "Very few have"
	line "succeeded."
	
	para "I wish you the"
	line "best of luck."
	
	para "Though, if you"
	line "made it up here,"
	
	para "I'd say you are"
	line "so skilled you"
	cont "don't need luck!"
	done
	
AviculturalSocietyGrampsYouDidItText:
	text "Oh my!"
	line "You've done it!"
	
	para "I can not tell"
	line "you the pride I"
	cont "feel seeing a new"
	
	para "Successor emerging"
	line "before us!"
	
	para "You have proved"
	line "yourself many"
	cont "times. I will"
	
	para "not ask for a"
	line "battle, don't"
	cont "worry. Ho ho ho."
	
	para "Please, take this."
	done
	
AviculturalSocietyGrampsSilverWingText:
	text "That is the"
	line "Silver Wing."
	
	para "A feather from"
	line "Lugia itself."
	
	para "Many have tried"
	line "to find it, but"
	
	para "without this,"
	line "none have been"
	cont "successful."
	
	para "Take this to"
	line "Whirl Islands"
	cont "and challenge"
	cont "Lugia."
	done	

AviculturalSocietyBirdKeeperIntroText:
	text "Welcome."

	para "If you're here,"
	line "you must want to"
	cont "take on the"
	cont "Guardians."
	
	para "You will need to" 
	line "track down each"
	cont "Guardian then try"
	
	para "defeat them"
	line "in battle."
	
	para "If you manage to"
	line "do so, you will"
	cont "have a chance to"
	
	para "prove yourself to"
	line "each mighty Bird."
	
	para "Will take on"
	line "the challenge?"
	done
	
AviculturalSocietyBirdKeeperGoodLuckText:
	text "Good luck, and"
	line "be well prepared."
	done
	
AviculturalSocietyBirdKeeperEncounteredBirdsText:
	text "You did it?!"
	
	para "You defeated the"
	line "Guardians and"
	cont "encountered the"
	cont "Legendary Birds?"
	
	para "You're amazing!"
	done

AviculturalSocietyBirdKeeperRefusedText:
	text "Hmm, this isn't"
	line "for the faint"
	cont "of heart."
	done

AviculturalSocietyBirdKeeperBeginText:
	text "Very well."
	
	para "I'll let the"
	line "Guardians know"
	cont "and you can"
	cont "seek them out."
	done

LoreleiRematchIntroText:
	text "Ah, you're here."
	
	para "Shall we have"
	line "our rematch?"
	done

LoreleiWinLossRematchText:
	text "Still powerful."
	done

LoreleiRematchAfterBattleText:
	text "I'm happy to see"
	line "you're still"
	cont "training so"
	cont "seriously."
	done

LoreleiNextTimeText:
	text "Hmm, maybe"
	line "next time, then."

AgathaRematchIntroText:
	text "Ah, you're here,"
	line "<PLAYER>."
	
	para "Are you prepared"
	line "for our rematch?"
	done

AgathaWinLossRematchText:
	text "I lost again."
	done

AgathaRematchAfterBattleText:
	text "It may sound odd,"
	line "but I'm almost"
	cont "glad I lost;"
	
	para "It shows you're"
	line "continuing your"
	cont "training."
	
	para "Unlike a certain"
	line "Professor…"
	
	para "Anyway, keep"
	line "it up."
	done

AgathaNextTimeText:
	text "Oh?"
	
	para "It's OK to be"
	line "afraid."
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
	
	para "and flaps of its"
	line "wings are said to"
	cont "cause storms"
	cont "lasting 40 days."
	
	para "As a result, it"
	line "chooses to live"
	cont "out of sight deep"
	cont "under the sea.'"
	done

AviculturalSociety3FBookshelf2Text:
	text "Said to be the"
	line "leader of the"
	cont "Legendary Birds."
	
	para "Should they find"
	line "themselves in a"
	cont "rage, Lugia will"

	para "appear to calm"
	line "them with its"
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
	object_event  8,  8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AviculturalSociety3FBirdKeeperScript, -1
	object_event  2,  1, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyLoreleiScript, EVENT_LORELEI_IN_SAFFRON
	object_event 11,  1, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AviculturalSocietyAgathaScript, EVENT_AGATHA_IN_SAFFRON
	object_event  5,  7, SPRITE_ARTICUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, ArticunoStatueScript, -1
	object_event  7,  7, SPRITE_ZAPDOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, ZapdosStatueScript, -1
	object_event  9,  7, SPRITE_MOLTRES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, MoltresStatueScript, -1
