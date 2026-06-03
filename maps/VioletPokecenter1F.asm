	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_CHANSEY
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1FChansey:
	jumpstd PokecenterChanseyScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksRightToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "Egg@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetextend VioletCityElmsAideFullPartyText

.RefusedEgg:
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	writetextend VioletPokecenterElmsAideRefuseText

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg
	
VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksRightToExitPokecenter:
	step RIGHT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	ntag " Elm's Aide "
	text "<PLAY_G>, long"
	line "time, no see."

	para "Prof.Elm asked me"
	line "to find you."

	para "He has another"
	line "favor to ask."

	para "Would you take the"
	line "#mon Egg?"
	done

VioletPokecenterElmsAideGiveEggText:
	ntag " Elm's Aide "
	text "We know that a"
	line "#mon will not"
	cont "hatch until it"
	cont "grows in the Egg."

	para "It also has to be"
	line "with other active"
	cont "#mon to hatch."

	para "<PLAY_G>, we"
	line "know we can rely"
	cont "on you to help."

	para "Please call Prof."
	line "Elm when that Egg"
	cont "hatches!"
	done

VioletCityElmsAideFullPartyText:
	ntag " Elm's Aide "
	text "Oh, no. You can't"
	line "carry any more"
	cont "#mon with you."

	para "I'll wait here"
	line "while you make"
	cont "room for the Egg."
	done

VioletPokecenterElmsAideRefuseText:
	ntag " Elm's Aide "
	text "B-but… Prof.Elm"
	line "asked for you…"
	done

VioletPokecenterElmsAideAskEggText:
	ntag " Elm's Aide "
	text "<PLAY_G>, will you"
	line "take the Egg?"
	done

VioletPokecenter1FGameboyKidText:
	text "A guy named Bill"
	line "made the #mon"
	cont "PC storage system."
	done

VioletPokecenter1FGentlemanText:
	text "It was around"
	line "three years ago."

	para "Team Rocket was up"
	line "to no good with"
	cont "#mon."

	para "But justice pre-"
	line "vailed--a young"
	cont "kid broke 'em up."
	done

VioletPokecenter1FYoungsterText:
	text "#mon are smart."
	line "They won't obey a"
	cont "trainer they don't"
	cont "respect."

	para "Without the right"
	line "Gym Badges, they"
	cont "will just do as"
	cont "they please."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, VIOLET_CITY, 4
	warp_event  6,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1
	warp_event 11,  7, VIOLET_MART, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  6,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FChansey, -1
	object_event  8,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event 10,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  2,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
