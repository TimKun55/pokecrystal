	object_const_def
	const VIRIDIANFORESTHOUSE_ARIANA

ViridianForestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ViridianForestHouseArianaCallback
	callback MAPCALLBACK_TILES, ViridianForestHouseStaircaseCallback
	
ViridianForestHouseArianaCallback:
	checkevent EVENT_BEAT_ARIANA_3
	iftrue .Appear
	disappear VIRIDIANFORESTHOUSE_ARIANA
	endcallback

.Appear:
	appear VIRIDIANFORESTHOUSE_ARIANA
	endcallback
	
ViridianForestHouseStaircaseCallback:
	checkcode VAR_BADGES
	if_equal 16, .ShowStairs
	endcallback

.ShowStairs:
	changeblock 6, 0, $89 ; stairs
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
	
	para "already started"
	line "to try and make"
	cont "things right."
	
	para "It's going to be"
	line "a lot of work, but"
	cont "we're prepared."
	
	para "I'll set out soon"
	line "but I have some-"
	
	para "thing I have to"
	line "do here first."
	done

ViridianForestHouseNotebookText:
	text "I was so close to"
	line "achieving my plan."

	para "Thwarted by a mere"
	line "child, I went into"

	para "hiding to bide my"
	line "time and regroup."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText1:
	text "Using the DNA"
	line "sample we had"
	cont "collected, I used"

	para "it to flush"
	line "out our escaped"
	cont "experiment."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText2:
	text "I succeeded and"
	line "tracked down our"

	para "failed creation in"
	line "the Cerulean"
	cont "Cave. Mewtwo's"

	para "strength was far"
	line "beyond what I had"
	cont "anticipated."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText3:
	text "Our battle was"
	line "intense and I"
	cont "barely managed to"

	para "escape with my"
	line "life."
	
	para "To prevent others"
	line "from finding it"
	
	para "I ordered the"
	line "entrance destoyed"
	
	para "and a secret one"
	line "created, so, one"
	
	para "day, a powerful"
	line "trainer could do"
	
	para "what I couldn't."

	para "That being is"
	line "cursed with power."
	done

ViridianForestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_FOREST, 3
	warp_event  3,  7, VIRIDIAN_FOREST, 3
	warp_event  7,  1, VIRIDIAN_FOREST_HOUSE_BF1, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, ViridianForestHouseBookshelfNotebook

	def_object_events
	object_event  3,  1, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseAriana, EVENT_REPENTING_ROCKETS	
