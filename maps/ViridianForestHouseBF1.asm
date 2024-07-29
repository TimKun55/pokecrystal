	object_const_def
	const VIRIDIANFORESTHOUSEBF1_EX_BOSS

ViridianForestHouseBF1_MapScripts:
	def_scene_scripts

	def_callbacks
	
ViridianForestHouseBF1GiovanniScript:
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
	writetext GiovanniSecretKeyExplainText
	waitbutton
	closetext
	end

ViridianForestHouseBF1Notebook:
	jumptext ViridianForestHouseBF1NotebookText
	
GiovanniText_1:
	text "So, you've found"
	line "my hidden house."

	para "I wanted to live"
	line "a quiet life and"
	cont "repent for all my"

	para "past mistakes and"
	line "failures but it"
	cont "seems I had"
	
	para "some unfinished"
	line "business."

	para "Once again it"
	line "is a child"

	para "who has shown me"
	line "the way and helped"
	cont "me move forward."
	
	para "If it wasn't for"
	line "you, I wouldn't"
	cont "have found Archer"
	
	para "and the others and"
	line "resolved the Team."

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

	para "Cerulean Cave I"
	line "had made."
	done

GiovanniSecretKeyExplainText:
	text "There's an empty"
	line "house in Cerulean."
	
	para "Use that Key on"
	line "the bookshelf to"
	
	para "reveal the"
	line "entrance."
	
	para "Seeing how you"
	line "handle your"
	cont "#mon it's clear"
	
	para "that you are a"
	line "powerful and"
	cont "capable trainer."
	
	para "I know I can"
	line "trust you with"
	cont "this item."
	
	para "With this, I feel"
	line "like I am one step"
	
	para "closer to atoning"
	line "for all my crimes."
	
	para "There is still"
	line "much for me to do."
	
	para "But I know I,"
	line "and the others,"
	cont "can do it."
	done

ViridianForestHouseBF1NotebookText:
	text "Seems to be a list"
	line "of trainer names."
	
	para "Almost all of the"
	line "names have a tick"
	cont "next to them."
	
	para "It's titled"
	line "'Amends'"
	done
	
ViridianForestHouseBF1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, VIRIDIAN_FOREST_HOUSE, 3

	def_coord_events

	def_bg_events
	bg_event 6,  6, BGEVENT_READ, ViridianForestHouseBF1Notebook

	def_object_events
	object_event  0,  6, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseBF1GiovanniScript, -1
