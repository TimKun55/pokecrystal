	object_const_def
	const SEAFOAMISLANDSB2F_BEAUTY
	const SEAFOAMISLANDSB2F_ROCKER1
	const SEAFOAMISLANDSB2F_ROCKER2
	const SEAFOAMISLANDSB2F_LORELEI
	const SEAFOAMISLANDSB2F_POKE_BALL

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SeafoamIslandsB2FLoreleiCallback

SeafoamIslandsB2FLoreleiCallback:
	checkevent EVENT_BEAT_GUARDIAN_LORELEI
	iftrue .NoAppear
	checkevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear SEAFOAMISLANDSB2F_LORELEI
	endcallback

.NoAppear:
	disappear SEAFOAMISLANDSB2F_LORELEI
	endcallback

SeafoamIslandsB2FLorelei:
	faceplayer
	opentext
	writetext GuardianLoreleiIntroText
	waitbutton
	closetext
	winlosstext GuardianLoreleiWinLossText, 0
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_LORELEI
	opentext 
	writetext GuardianLoreleiOutroText
	waitbutton
	closetext
	cry LAPRAS
	applymovement SEAFOAMISLANDSB2F_LORELEI, GuardianLoreleiExitMovement
	playsound SFX_EXIT_BUILDING
	disappear SEAFOAMISLANDSB2F_LORELEI
	appear SEAFOAMISLANDSB4F_ARTICUNO
	end

GuardianLoreleiExitMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step_end

SeafoamIslandsB2FWaterStone:
	itemball WATER_STONE

SeafoamIslandsB2FHiddenPearl1:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_1

SeafoamIslandsB2FHiddenPearl2:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_2

GuardianLoreleiIntroText:
	text "So, you're the"
	line "newest challenger."
	
	para "You certainly look"
	line "stronger than the"
	cont "others, but"
	
	para "looks aren't"
	line "everything."
	
	para "As a former Elite"
	line "Four member and as"
	
	para "the Guardian of"
	line "Articuno, let me"
	
	para "warn you; you had"
	line "best be prepared."
	
	para "Articuno, let's"
	line "do this."
	done
	
GuardianLoreleiWinLossText:
	text "Oh my!"
	line "You truly"
	cont "are strong."
	done
	
GuardianLoreleiOutroText:
	text "Very well done."
	
	para "I did not expect"
	line "to be bested but"
	cont "there is only"
	
	para "pride in seeing"
	line "new, powerful"
	cont "trainers emerging."
	
	para "The last Champion"
	line "gave us clear"
	cont "instructions;"
	
	para "I'll now release"
	line "Articuno back to"
	
	para "its nest, and you"
	line "can try to"
	line "capture it."
	
	para "Good luck."
	
	para "Come past the"
	line "Society sometime,"
	
	para "I'd like to have"
	line "a rematch."
	done

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 17, SEAFOAM_ISLANDS_B1F, 2
	warp_event  9,  9, SEAFOAM_ISLANDS_B1F, 3
	warp_event  5, 13, SEAFOAM_ISLANDS_B1F, 4
	warp_event  9, 15, SEAFOAM_ISLANDS_B1F, 5
	warp_event 27,  7, SEAFOAM_ISLANDS_B3F, 1
	warp_event 14,  7, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25, 13, SEAFOAM_ISLANDS_B3F, 3
	warp_event  3, 17, SEAFOAM_ISLANDS_B3F, 4

	def_coord_events

	def_bg_events
	bg_event  7,  8, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl1
	bg_event 23,  5, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl2

	def_object_events
	object_event 21,  9, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FLorelei, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event 11, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB2FWaterStone, EVENT_SEAFOAM_ISLANDS_B2F_WATER_STONE
	