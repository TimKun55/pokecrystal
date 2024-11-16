	object_const_def
	const EUSINESHOUSE_EUSINE
	const EUSINESHOUSE_GRAMPS

EusinesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	checkflag ENGINE_PLAYER_CAUGHT_SUICUNE
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
	turnobject PLAYER, RIGHT
.PathClear:
	applymovement EUSINESHOUSE_EUSINE, .EusineLeavesMovement
	disappear EUSINESHOUSE_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.PlayerStepsAsideMovement:
	step LEFT
	step_end

.EusineLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EusinesHouseGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_SET_WHEN_FOUGHT_HO_OH
	iftrue .EusineOutLooking
	writetext EusinesHouseGrampsText1
	waitbutton
	closetext
	end

.EusineOutLooking:
	writetext EusinesHouseGrampsText2
	waitbutton
	closetext
	end

CeladonEusineText1:
	text "Eusine: Hi!"

	para "I'm back visiting"
	line "my hometown."

	para "It's been quite a"
	line "while."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, have you"
	line "heard?"

	para "There have been"
	line "fresh rumors of a"

	para "rainbow-colored"
	line "#mon appearing"
	cont "at Tin Tower."

	para "I've just had my"
	line "party healed, so"

	para "now I'm headed to"
	line "Ecruteak."

	para "I'll be seeing"
	line "you, <PLAYER>!"
	done

NoBeastsText:
	text "Oh, by the way,"
	line "<PLAYER>."

	para "Have you caught"
	line "the legendary"

	para "#mon Raikou and"
	line "Entei?"

	para "<……><……><……>"

	para "Okay…"

	para "If you catch even"
	line "one, I hope that"
	cont "you'll inform me."

	para "I'm counting on"
	line "you, <PLAYER>!"
	done

EusinesHouseGrampsText1:
	text "My grandson came"
	line "home!"
	cont "I'm overjoyed!"
	done

EusinesHouseGrampsText2:
	text "My grandson Eusine"
	line "is in Johto,"

	para "searching far and"
	line "wide for Suicune."

	para "I taught him all"
	line "about the legend-"
	cont "ary #mon!"
	done

EusinesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_CITY, 15
	warp_event  3,  7, CELADON_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EusinesHouseGrampsScript, -1
