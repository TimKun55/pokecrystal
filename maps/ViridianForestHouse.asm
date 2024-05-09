	object_const_def
	const VIRIDIANFORESTHOUSE_ARIANA

ViridianForestHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ViridianForestHouseArianaCallback
	callback MAPCALLBACK_TILES, ViridianForestHouseStaircaseCallback
	
ViridianForestHouseArianaCallback:
	checkevent EVENT_KANTO_ROCKET_DISBAND
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
	changeblock 0, 0, $3b ; stairs
	endcallback

ViridianForestHouseAriana:
	faceplayer
	opentext
	writetext ViridianForestHouseArianaText
	waitbutton
	closetext
	turnobject VIRIDIANFORESTHOUSE_ARIANA, LEFT
	pause 45
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
	
	para "ARCHER said you'd"
	line "eventually find"
	cont "this place."
	
	para "GIOVANNI explained"
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
	cont "thing I have to"
	
	para "do here first."
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
	line "SAMPLE we had"
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
	line "the CERULEAN"
	cont "DUNGEON. MEWTWO's"

	para "strength was far"
	line "beyond what I had"
	cont "anticipated."

	para "Keep reading?"
	done

ViridianForestHouseNotebookText3:
	text "Our battle left"
	line "the CAVE destroyed"
	cont "and I barely"

	para "managed to escape"
	line "with my life."

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
	object_event  3,  1, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestHouseAriana, EVENT_KANTO_ROCKET_DISBAND	
