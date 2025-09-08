	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3
	const OAKSLAB_POKEDEX

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, OaksLabOakCallback

OaksLabOakCallback:
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .OakInLab
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .OakNotInLab
.OakInLab:
	appear OAKSLAB_OAK
	endcallback

.OakNotInLab:
	disappear OAKSLAB_OAK
	endcallback

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetextend OakLabGoodbyeText

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksPokedexScript:
	jumptext OaksPokedexText

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "Oak: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to Kanto."

	para "What do you think"
	line "of the trainers"
	cont "out here?"
	cont "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "How is your #-"
	line "dex coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "Oak: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "Badges of Gyms in"
	cont "Kanto. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"
	cont "arrangements so"
	cont "that you can go to"
	cont "Mt.Silver."

	para "Mt.Silver is a big"
	line "mountain that is"
	cont "home to many wild"
	cont "#mon."

	para "It's too dangerous"
	line "for your average"
	cont "trainer, so it's"
	cont "off limits. But"
	cont "we can make an"
	cont "exception in your"
	cont "case, <PLAY_G>."

	para "Go west from"
	line "Viridian City,"
	cont "pass through the"
	cont "Victory Road Gate,"
	cont "still heading west"
	cont "and you'll reach"
	cont "Mt.Silver."
	
	para "Watching your"
	line "amazing progress"
	cont "makes me feel like"
	cont "getting out of the"
	cont "Lab for a bit, and"
	cont "start up my"
	cont "training again!"
	done

OakNoKantoBadgesText:
	text "Oak: Hmm? You're"
	line "not collecting"
	cont "Kanto Gym Badges?"

	para "The Gym Leaders in"
	line "Kanto are as tough"
	cont "as any you battled"
	cont "in Johto."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "Oak: Ah, you're"
	line "collecting Kanto"
	cont "Gym Badges."

	para "I imagine that"
	line "it's hard, but the"
	cont "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "The Prof's #mon"
	line "Talk radio program"
	cont "isn't aired here"
	cont "in Kanto."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "dex, the Prof's"
	cont "research is coming"
	cont "along great."
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but Prof.Oak's"
	cont "#mon Talk isn't"
	cont "a live broadcast."
	done

OaksPokedexText:
	text "This is Prof.Oak's"
	line "#dex."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the Menu."
	done

OaksLabPoster2Text:
	text "The Save option is"
	line "on the Menu."

	para "Use it in a timely"
	line "manner."
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "Prof.Oak, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAY_G> is"
	cont "getting quite a"
	cont "reputation."

	para "I'm delighted to"
	line "hear that."

	para "Elm in New Bark"
	line "Town 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, EVENT_OAK_IN_LAB
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
	object_event  2,  1, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksPokedexScript, -1
