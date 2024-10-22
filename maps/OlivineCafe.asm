	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2
	const OLIVINECAFE_LYRA

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeLyraScript:
	faceplayer
	opentext
	writetext OlivineCafeLyraText1
	promptbutton
	verbosegiveitem AMULET_COIN
	iffalse .LyraNoRoomForAmuletCoin
	writetext OlivineCafeLyraText2
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .GoStraightDown
	applymovement OLIVINECAFE_LYRA, OlivineCafeLyraLeavesRightMovement
	sjump .FinalLyraExit
	
.GoStraightDown
	applymovement OLIVINECAFE_LYRA, OlivineCafeLyraLeavesMovement
.FinalLyraExit
	playsound SFX_EXIT_BUILDING
	disappear OLIVINECAFE_LYRA
	setevent EVENT_GOT_AMULET_COIN_FROM_LYRA
	waitsfx
	end

.LyraNoRoomForAmuletCoin:
	writetext NoRoomForAmuletCoinText
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeLyraLeavesRightMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end
	
OlivineCafeLyraLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

OlivineCafeStrengthSailorText:
	text "Hah! Your #mon"
	line "sure look like"
	cont "lightweights!"

	para "They don't have"
	line "the power to move"
	cont "boulders aside."

	para "Here, use this"
	line "and teach them"
	cont "Strength!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "On the sea, the"
	line "only thing you can"

	para "count on is your"
	line "own good self!"

	para "I'm so proud of my"
	line "buff bod!"
	done

OlivineCafeLyraText1:
	text "Lyra: Hi, <PLAYER>!"
	line "You should try the"

	para "food here. It's"
	line "really good!"

	para "Although I don't"
	line "want to eat too"
	cont "much…"

	para "Oh, that's right!"
	line "I found an item"

	para "that you might"
	line "like. Here!"
	done

OlivineCafeLyraText2:
	text "Isn't it pretty?"
	line "And useful, too."

	para "Well, I should"
	line "get going."

	para "I want to check"
	line "out Whirl Islands"

	para "near Cianwood"
	line "before I go home."

	para "See you,"
	line "<PLAYER>!"
	done

NoRoomForAmuletCoinText:
	text "Aww, <PLAYER>,"
	line "you'll need to"
	cont "make some room."
	done

OlivineCafeFishingGuruText:
	text "Olivine Cafe's"
	line "menu is chock full"

	para "of hearty fare for"
	line "beefy Sailors!"
	done

OlivineCafeSailorText:
	text "Whenever I roll"
	line "into this town, I"

	para "always visit the"
	line "Olivine Cafe."

	para "Everything on the"
	line "menu makes me feel"

	para "stronger. I can't"
	line "stop eating!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, OLIVINE_CITY, 6
	warp_event  5,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  9,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  8,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
	object_event  4,  4, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeLyraScript, EVENT_GOT_AMULET_COIN_FROM_LYRA
