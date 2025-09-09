	object_const_def
	const VIRIDIANFORESTHOUSE_ARIANA
	const VIRIDIANFORESTHOUSE_GIOVANNI
	const VIRIDIANFORESTHOUSE_BOOK

ViridianForestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ViridianForestHouseArianaCallback
	callback MAPCALLBACK_OBJECTS, ViridianForestHouseGiovanniCallback
	
ViridianForestHouseArianaCallback:
	checkevent EVENT_BEAT_ARIANA_3
	iftrue .Appear
	disappear VIRIDIANFORESTHOUSE_ARIANA
	endcallback

.Appear:
	appear VIRIDIANFORESTHOUSE_ARIANA
	endcallback
	
ViridianForestHouseGiovanniCallback:
	readvar VAR_BADGES
	if_equal 16, .Appear
	disappear VIRIDIANFORESTHOUSE_GIOVANNI
	disappear VIRIDIANFORESTHOUSE_BOOK
	endcallback

.Appear:
	appear VIRIDIANFORESTHOUSE_GIOVANNI
	appear VIRIDIANFORESTHOUSE_BOOK
	endcallback

ViridianForestHouseAriana:
	faceplayer
	opentext
	writetext ViridianForestHouseArianaText
	waitbutton
	closetext
	turnobject VIRIDIANFORESTHOUSE_ARIANA, LEFT
	pause 30
	turnobject VIRIDIANFORESTHOUSE_ARIANA, UP
	end
	
ViridianForestHouseGiovanniScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .GotSecretKey
	writetext GiovanniText_1
	waitbutton
	closetext
	winlosstext GiovanniText_AfterBattle, 0
	loadtrainer EX_BOSS, GIOVANNI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GIOVANNI
	opentext
	writetext GiovanniSecretKeyText
	promptbutton
	verbosegiveitem SECRET_KEY
	setevent EVENT_GOT_SECRET_KEY
	writetext GiovanniSecretKeySpeech
	waitbutton
.GotSecretKey:
	writetextend GiovanniSecretKeyExplainText

ViridianForestHouseBookshelfNotebook:
	opentext
	writetext ViridianForestHouseNotebookText
	yesorno
	iffalse .Done
	writetext ViridianForestHouseNotebookText1
	yesorno
	iffalse .Done
	writetext ViridianForestHouseNotebookText2
	yesorno
	iffalse .Done
	writetext ViridianForestHouseNotebookText3
	waitbutton
.Done:
	closetext
	end

ViridianForestHouseGiovannisNotebook:
	jumptext ViridianForestHouseGiovannisNotebookText
	
ViridianForestHouseArianaText:
	text "Oh, it's you,"
	line "<PLAY_G>."

	para "Archer said you'd"
	line "eventually find"
	cont "this place."

	para "Giovanni explained"
	line "everything to us."

	para "It's been an"
	line "adjustment, but"
	cont "the others have"
	cont "already started"
	cont "to try and make"
	cont "things right."

	para "It's going to be"
	line "a lot of work, but"
	cont "we're prepared."

	para "I'll set out soon"
	line "but I have some-"
	cont "thing I have to"
	cont "do here first."
	done

GiovanniText_1:
	text "So, you've found"
	line "my hidden house."

	para "I wanted to live"
	line "a quiet life and"
	cont "repent for all my"
	cont "past mistakes and"
	cont "failures but it"
	cont "seems I had"
	cont "some unfinished"
	cont "business."

	para "Once again it"
	line "is a child"
	cont "who has shown me"
	cont "the way and helped"
	cont "me move forward."

	para "If it wasn't for"
	line "you, I wouldn't"
	cont "have found Archer"
	cont "and the others and"
	cont "resolved the Team."

	para "I know you are"
	line "a very powerful"
	cont "trainer."

	para "Please, battle me."
	done

GiovanniText_AfterBattle:
	text "Hahaha! The youth"
	line "of today really"
	cont "are amazing!"
	done

GiovanniSecretKeyText:
	text "I think you might"
	line "be able to use"
	cont "this item."

	para "Take this."
	done

Text_ReceivedSecretKey:
	text "<PLAYER> received"
	line "the Secret Key."
	done

GiovanniSecretKeySpeech:
	text "That's the Key"
	line "to the secret"
	cont "entrance to"
	cont "Cerulean Cave I"
	cont "had made."
	done

GiovanniSecretKeyExplainText:
	text "There's an empty"
	line "house in Cerulean."

	para "Use that Key on"
	line "the bookshelf to"
	cont "reveal the"
	cont "entrance."
	
	para "Seeing how you"
	line "handle your"
	cont "#mon it's clear"
	cont "that you are a"
	cont "powerful and"
	cont "capable trainer."
	
	para "I know I can"
	line "trust you with"
	cont "this item."
	
	para "With this, I feel"
	line "like I am one step"
	cont "closer to atoning"
	cont "for all my crimes."

	para "There is still"
	line "much for me to do."

	para "But I know I,"
	line "and the others,"
	cont "can do it."
	done

ViridianForestHouseNotebookText:
	text "I was so close to"
	line "achieving my plan."

	para "Thwarted by a mere"
	line "child, I went into"
	cont "hiding to bide my"
	cont "time and regroup."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText1:
	text "Using the DNA"
	line "sample we had"
	cont "collected, I used"
	cont "it to flush"
	cont "out our escaped"
	cont "experiment."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText2:
	text "I succeeded and"
	line "tracked down our"
	cont "failed creation in"
	cont "the Cerulean"
	cont "Cave."

	para "Mewtwo's strength"
	line "was far beyond"
	cont "what I had"
	cont "anticipated."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText3:
	text "Our battle was"
	line "intense and I"
	cont "barely managed to"
	cont "escape with my"
	cont "life."
	
	para "To prevent others"
	line "from finding it"
	cont "I ordered the"
	cont "entrance destoyed"
	cont "and a secret one"
	cont "created, so, one"
	cont "day, a powerful"
	cont "trainer could do"
	cont "what I couldn't."

	para "That being is"
	line "cursed with power."
	done

ViridianForestHouseGiovannisNotebookText:
	text "Seems to be a list"
	line "of trainer names."

	para "Almost all of the"
	line "names have a tick"
	cont "next to them."

	para "It's titled"
	line "'Amends'"
	done

ViridianForestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_FOREST, 3
	warp_event  3,  7, VIRIDIAN_FOREST, 3

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, ViridianForestHouseBookshelfNotebook

	def_object_events
	object_event  3,  1, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseAriana, EVENT_REPENTING_ROCKETS	
	object_event  5,  4, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseGiovanniScript, EVENT_GIOVANNI_AT_HOME
	object_event  6,  7, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseGiovannisNotebook, EVENT_GIOVANNI_AT_HOME
