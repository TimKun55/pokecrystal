	object_const_def
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_CHANSEY
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeladonPokecenter1FChansey:
	jumpstd PokecenterChanseyScript

CeladonPokecenter1FGentlemanScript:
	jumpstd HappinessCheckScript

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

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
	ifequal RIGHT, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step UP
	step LEFT
	step LEFT
	step LEFT	
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "Erika is a master"
	line "of grass #mon."

	para "She'll make you"
	line "pay if you don't"
	cont "watch yourself."
	done

CeladonPokecenter1FPharmacistText:
	text "Team Rocket's"
	line "hideout is in the"

	para "basement of the"
	line "Game Corner."

	para "Oh, wait. That was"
	line "three years ago."
	done

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

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CELADON_CITY, 5
	warp_event  6,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FChansey, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  2,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  9,  4, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
