	object_const_def
	const VIRIDIANFORESTHOUSEBF1_EX_BOSS

ViridianForestHouseBF1_MapScripts:
	def_scene_scripts

	def_callbacks
	
ViridianForestHouseBF1GiovanniScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .GotDNASample
	writetext GiovanniText_1
	waitbutton
	closetext
	winlosstext GiovanniText_AfterBattle, 0
	loadtrainer EX_BOSS, GIOVANNI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GIOVANNI
	opentext
	writetext GiovanniText_DNASampleText
	promptbutton
	verbosegiveitem DNA_SAMPLE
	setevent EVENT_GOT_DNA_SAMPLE
	writetext GiovanniText_DNASampleSpeech
	waitbutton
.GotDNASample:
	writetext GiovanniText_Mew
	waitbutton
	closetext
	end
	
ViridianForestHouseBF1Notebook1:
	opentext
	writetext ViridianForestHouseBF1Notebook1Text
	yesorno
	iffalse .Done
	writetext ViridianForestHouseBF1Notebook1Text1
	yesorno
	iffalse .Done
	writetext ViridianForestHouseBF1Notebook1Text2
	yesorno
	iffalse .Done
	writetext ViridianForestHouseBF1Notebook1Text3
	waitbutton
.Done:
	closetext
	end
	
ViridianForestHouseBF1Notebook2:
	opentext
	writetext ViridianForestHouseBF1Notebook2Text
	yesorno
	iffalse .Done
	writetext ViridianForestHouseBF1Notebook2Text1
	yesorno
	iffalse .Done
	waitbutton
.Done:
	closetext
	end
	
GiovanniText_1:
	text "So, you've found"
	line "my hidden house."

	para "I wanted to live"
	line "a quiet life and"
	cont "repent for all my"

	para "past mistakes and"
	line "failures. Once"
	cont "again it's a child"

	para "who has shown me"
	line "the way and helped"
	cont "me move forward."
	
	para "If it wasn't for"
	line "you, I wouldn't"
	cont "have found ARCHER"
	
	para "and the others and"
	line "resolved the TEAM."

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
	
GiovanniText_DNASampleText:
	text "I think you might"
	line "be able to use"
	cont "this item."

	para "Take this."
	done

Text_ReceivedDNASample:
	text "<PLAYER> received"
	line "the DNA SAMPLE."
	done
	
GiovanniText_DNASampleSpeech:
	text "That's a sample"
	line "of the MYTHICAL"
	cont "#MON MEW's DNA."

	para "As the former BOSS"
	line "of TEAM ROCKET and"
	cont "the GYM LEADER of"

	para "VIRIDIAN CITY, I"
	line "used my influence"
	cont "to fund a huge"
	
	para "research expedition."
	line "We found that DNA"
	cont "SAMPLE and used it"

	para "in our extensive"
	line "experiments to"
	cont "create MEWTWO."
	done

GiovanniText_Mew:
	para "After years, I've"
	line "discovered that"
	cont "both MEWTWO and"
	
	para "MEW respond to"
	line "this sample."
	
	para "Seeing how you"
	line "handle your"
	cont "#MON it's clear"
	
	para "that you are a"
	line "powerful and"
	cont "capable trainer."
	
	para "I know I can trust"
	line "you with this item"
	cont "and the ones it's"
	
	para "linked to."
	line "With this, I feel"
	cont "like I am one step"
	
	para "closer to atoning"
	line "for all my crimes."
	
	para "There is still"
	line "much for me to do."
	
	para "But I know I,"
	line "and the others,"
	cont "can do it."
	done
	
ViridianForestHouseBF1Notebook1Text:
	text "After using MEW's"
	line "DNA to create"

	para "MEWTWO, I sent out"
	line "4 teams to search"

	para "for MEW. They all"
	line "failed."

	para "Keep reading?"
	done

ViridianForestHouseBF1Notebook1Text1:
	text "I noticed that"
	line "when we had the"
	cont "sample with us, my"

	para "men would claim to"
	line "have seen a pink"
	cont "blur passing by."

	para "Keep reading?"
	done

ViridianForestHouseBF1Notebook1Text2:
	text "Could the sample"
	line "be calling out to"
	cont "MEW somehow?"
	
	para "Testing this"
	line "theory, we set out"

	para "across the region"
	line "and discovered"
	cont "something."

	para "Keep reading?"
	done

ViridianForestHouseBF1Notebook1Text3:
	text "The men saw the"
	line "blur around"
	cont "FUCHSIA the most."

	para "We spent weeks"
	line "trying to pinpoint"
	cont "a precise location"

	para "but failed. In the"
	line "end, once again,"
	cont "I was forced to"

	para "give up. My plans"
	line "in ruins…"
	
	para "My family in ruins"
	line "…I sacrificed"
	cont "everything and"
	
	para "gained nothing…"
	line "I have failed."
	done

ViridianForestHouseBF1Notebook2Text:
	text "Having this SAMPLE"
	line "around FUCHSIA may"
	cont "encourage MEW to"

	para "appear. As for"
	line "MEWTWO, if you"
	cont "truly wish to test"

	para "yourself, the last"
	line "report I have on"
	cont "its location is…"

	para "Keep reading?"
	done

ViridianForestHouseBF1Notebook2Text1:
	text "MT SILVER."
	line "Good luck."
	done

ViridianForestHouseBF1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, VIRIDIAN_FOREST_HOUSE, 3

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, ViridianForestHouseBF1Notebook1
	bg_event  0,  6, BGEVENT_READ, ViridianForestHouseBF1Notebook2

	def_object_events
	object_event  4,  2, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseBF1GiovanniScript, -1
