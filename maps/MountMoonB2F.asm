	object_const_def
	const MOUNTMOONB2F_SUPER_NERD1
	const MOUNTMOONB2F_YOUNGSTER1
	const MOUNTMOONB2F_SUPER_NERD2
	const MOUNTMOONB2F_HEX_MANIAC
	const MOUNTMOONB2F_YOUNGSTER2
	const MOUNTMOONB2F_POKE_BALL1
	const MOUNTMOONB2F_POKE_BALL2
	const MOUNTMOONB2F_POKE_BALL3
	const MOUNTMOONB2F_POKE_BALL4

MountMoonB2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSuperNerdRuss:
	trainer SUPER_NERD, RUSS, EVENT_BEAT_SUPER_NERD_RUSS, SuperNerdRussSeenText, SuperNerdRussBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdRussAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterZak:
	trainer YOUNGSTER, ZAK, EVENT_BEAT_YOUNGSTER_ZAK, YoungsterZakSeenText, YoungsterZakBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterZakAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerNedd:
	trainer JUGGLER, NEDD, EVENT_BEAT_JUGGLER_NEDD, JugglerNeddSeenText, JugglerNeddBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerNeddAfterBattleText
	waitbutton
	closetext
	end

TrainerHexManiacBethany:
	trainer HEX_MANIAC, BETHANY, EVENT_BEAT_HEX_MANIAC_BETHANY, HexManiacBethanySeenText, HexManiacBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacBethanyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperHarvey:
	trainer CAMPER, HARVEY, EVENT_BEAT_CAMPER_HARVEY, CamperHarveySeenText, CamperHarveyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperHarveyAfterBattleText
	waitbutton
	closetext
	end

MountMoonB2FFullRestoreScript:
	itemball FULL_RESTORE

MountMoonB2FZincScript:
	itemball ZINC

MountMoonB2FRareCandyScript:
	itemball RARE_CANDY

MountMoonB2FMoonStoneScript:
	itemball MOON_STONE

MountMoonB2FHiddenEther:
	hiddenitem ETHER, EVENT_MOUNT_MOON_B2F_HIDDEN_ETHER

MountMoonB2FHiddenPPUp:
	hiddenitem PP_UP, EVENT_MOUNT_MOON_B2F_HIDDEN_PP_UP

MountMoonB2FHiddenStardust:
	hiddenitem STARDUST, EVENT_MOUNT_MOON_B2F_HIDDEN_STARDUST

SuperNerdRussSeenText:
	text "Rare #mon, rare"
	line "items; this cave"
	cont "has it all."
	done

SuperNerdRussBeatenText:
	text "A huge loss."
	done

SuperNerdRussAfterBattleText:
	text "I'm not great"
	line "at battles."
	done

YoungsterZakSeenText:
	text "You came to ex-"
	line "plore the cave,"
	cont "right?"

	para "Be careful, you"
	line "may get lost."
	done

YoungsterZakBeatenText:
	text "You're not lost"
	line "at all."
	done

YoungsterZakAfterBattleText:
	text "With that team of"
	line "#mon, you must"

	para "have explored a"
	line "lot of places."

	para "Getting lost must"
	line "be pretty normal"
	cont "for you, huh?"
	done

JugglerNeddSeenText:
	text "Oh, a battle will"
	line "be a good break"
	cont "from practice!"
	done

JugglerNeddBeatenText:
	text "Dropped them all!"
	done

JugglerNeddAfterBattleText:
	text "I guess I need to"
	line "practice battles"
	cont "as well."
	done

HexManiacBethanySeenText:
	text "Mirror, mirror,"
	line "on the wall,"

	para "who will throw"
	line "their # Ball?"
	done

HexManiacBethanyBeatenText:
	text "You will!"
	done

HexManiacBethanyAfterBattleText:
	text "Magic mirror,"
	line "great and wise,"

	para "failed to see my"
	line "swift demise."
	done

CamperHarveySeenText:
	text "You've either got"
	line "it or you don't."
	done

CamperHarveyBeatenText:
	text "Whoa!"
	line "You've got it!"
	done

CamperHarveyAfterBattleText:
	text "Style and charm"
	line "go hand in hand."

	para "They're the cool-"
	line "est combination."
	done

MountMoonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 25, MOUNT_MOON_B1F, 5
	warp_event 21,  7, MOUNT_MOON_B1F, 6
	warp_event 17, 15, MOUNT_MOON_B1F, 7
	warp_event  3,  9, MOUNT_MOON_B1F, 8

	def_coord_events

	def_bg_events
	bg_event 28,  7, BGEVENT_ITEM, MountMoonB2FHiddenEther
	bg_event 10, 30, BGEVENT_ITEM, MountMoonB2FHiddenPPUp
	bg_event  7,  9, BGEVENT_ITEM, MountMoonB2FHiddenStardust

	def_object_events
	object_event 10,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdRuss, -1
	object_event 24,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerYoungsterZak, -1
	object_event 12, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerNedd, -1
	object_event 29, 18, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHexManiacBethany, -1
	object_event  4, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerCamperHarvey, -1
	object_event 22,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonB2FFullRestoreScript, EVENT_MOUNT_MOON_B2F_FULL_RESTORE
	object_event 26, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonB2FZincScript, EVENT_MOUNT_MOON_B2F_ZINC
	object_event 18, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonB2FRareCandyScript, EVENT_MOUNT_MOON_B2F_RARE_CANDY
	object_event 11, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoonB2FMoonStoneScript, EVENT_MOUNT_MOON_B2F_MOON_STONE
