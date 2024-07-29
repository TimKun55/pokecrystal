	object_const_def
	const CINNABARISLANDRECOVERYLAB_SCIENTIST1
	const CINNABARISLANDRECOVERYLAB_SCIENTIST2

CinnabarIslandRecoveryLab_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarIslandRecoveryLabScientist1:
	faceplayer
	opentext
	writetext RecoveryLabScientist1Text
	waitbutton
	closetext
	end

CinnabarIslandRecoveryLabScientist2:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_SEA_MAP
	iftrue .DidYouFindAUse
	writetext ScientistOldSeaMapText
	waitbutton
	verbosegiveitem OLD_SEA_MAP
	setevent EVENT_GOT_OLD_SEA_MAP
	writetext ScientistOldSeaMapGoodUseText
	waitbutton
	closetext
	end

.DidYouFindAUse
	writetext ScientistOldSeaMapDidYouFindAUseText
	waitbutton
	closetext
	end

CinnabarIslandRecoveryLabBoxes:
	jumptext CinnabarIslandRecoveryLabBoxesText

CinnabarIslandRecoveryLabGlassCase:
	opentext
	checkevent EVENT_GOT_OLD_SEA_MAP
	iftrue .empty
	writetext CinnabarIslandRecoveryLabGlassCaseText
	waitbutton
	closetext
	end

.empty
	writetext CinnabarIslandRecoveryLabGlassCaseEmptyText
	waitbutton
	closetext
	end

RecoveryLabScientist1Text:
	text "Hello there."
	
	para "We set up this"
	line "lab after the"
	cont "eruption to"
	
	para "recover as many"
	line "things as we could"
	cont "find, but I think"

	para "we've found all"
	line "that we can."
	done

ScientistOldSeaMapText:
	text "I used to work in"
	line "the old Lab that"
	cont "was here, and I"
	
	para "managed to save"
	line "this Map that was"
	cont "on display!"
	
	para "It was a recent"
	line "donation at the"
	cont "time, so I was"
	
	para "keeping a close"
	line "eye on it."
	
	para "Huh?"
	line "You want this?"
	
	para "I don't know…"
	
	para "Who even are you?"
	
	para "WAIT!"
	
	para "You're a Champion"
	line "of Johto AND"
	cont "you're collecting"
	cont "Kanto Gym Badges?"
	
	para "OK, you're strong."
	
	para "Here, take it."
	done

ScientistOldSeaMapGoodUseText:
	text "I hope you've"
	line "put that Map to"
	cont "good use!"
	
	para "Though, I'm not"
	line "sure what you"
	cont "could use it for…"
	done

ScientistOldSeaMapDidYouFindAUseText:
	text "Did you find a"
	line "use for that Map?"
	done

CinnabarIslandRecoveryLabBoxesText:
	text "Boxes full of"
	line "broken, torn and"
	cont "damaged items."
	done

CinnabarIslandRecoveryLabGlassCaseText:
	text "There's a very old"
	line "and faded map."
	done
	
CinnabarIslandRecoveryLabGlassCaseEmptyText:
	text "There's nothing"
	line "on display."
	done

CinnabarIslandRecoveryLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 7, CINNABAR_ISLAND, 3
	warp_event  3, 7, CINNABAR_ISLAND, 3

	def_coord_events

	def_bg_events
	bg_event 0, 5, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 1, 5, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 2, 5, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 3, 5, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 6, 5, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 7, 5, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 0, 3, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 1, 3, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 6, 3, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 7, 3, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 0, 1, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 1, 1, BGEVENT_READ, CinnabarIslandRecoveryLabBoxes
	bg_event 4, 1, BGEVENT_READ, CinnabarIslandRecoveryLabGlassCase
	bg_event 5, 1, BGEVENT_READ, CinnabarIslandRecoveryLabGlassCase

	def_object_events
	object_event 2, 4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandRecoveryLabScientist1, -1
	object_event 4, 2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandRecoveryLabScientist2, -1
	
	