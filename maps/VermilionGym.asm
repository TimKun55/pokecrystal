	object_const_def
	const VERMILIONGYM_FENCE_1_LEFT
	const VERMILIONGYM_FENCE_1_RIGHT
	const VERMILIONGYM_FENCE_2_LEFT
	const VERMILIONGYM_FENCE_2_RIGHT
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_RAICHU
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionGymDoorsScript

VermilionGymDoorsScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .done
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iffalse .resample
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
.resample
	callasm SampleVermilionGymTrashCans
.done
	endcallback

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KANTO_LEADERS
	iftrue .SurgeScript_Rematch
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	readvar VAR_BADGES
	ifequal 9, .FirstBadge
	ifequal 11, .Lyra3Badges
	ifequal 13, .LyrasEgg
	sjump .Finish
.FirstBadge:
	specialphonecall SPECIALCALL_LYRAFIRSTBADGE
	sjump .Finish
.Lyra3Badges:
	specialphonecall SPECIALCALL_LYRATHIRDBADGE
	sjump .Finish
.LyrasEgg:
	specialphonecall SPECIALCALL_LYRASEGG
.Finish:
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end
	
.afterbattle16
	setevent EVENT_BEAT_KANTO_LEADERS
	end

.SurgeScript_Rematch
	checkflag ENGINE_DAILY_LTSURGE_REMATCH
	iftrue .skip_rematch
	writetext LtSurgeRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext LtSurgeWinLossRematchText, 0
	loadtrainer LT_SURGE, LT_SURGE2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_LTSURGE_REMATCH
	opentext
	writetext LtSurgeRematchAfterBattleText
	waitbutton
	closetext
	end

.skip_rematch
	writetext LtSurgeComeBackTomorrowText
	waitbutton
	closetext
	end

.EndRematch
	writetext LtSurgeNextTimeText
	waitbutton
	closetext
	end

VermilionGymRaichu:
	opentext
	writetext RaichuText
	cry RAICHU
	waitbutton
	refreshscreen
	pokepic RAICHU
	waitbutton
	closepokepic
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymTrashCanScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .trash_can
	callasm CheckVermilionGymTrashCan
	iftrue .open_lock
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .reset_switches
.trash_can
	jumpstd TrashCanScript

.open_lock
	opentext
	writetext VermilionGymFoundSwitchText
	playsound SFX_PUSH_BUTTON
	promptbutton
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .second_switch
	writetext VermilionGymFoundFirstSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_1_LEFT
	disappear VERMILIONGYM_FENCE_1_RIGHT
	waitbutton
	closetext
	end

.second_switch
	writetext VermilionGymFoundSecondSwitchText
	waitbutton
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_2_LEFT
	disappear VERMILIONGYM_FENCE_2_RIGHT
	closetext
	end

.reset_switches
	opentext
	writetext VermilionGymTrashCanText
	promptbutton
	writetext VermilionGymResetSwitchesText
	playsound SFX_WRONG
	waitbutton
	closetext
	callasm SampleVermilionGymTrashCans
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
	end

SampleVermilionGymTrashCans:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rSVBK], a
.loop
	call Random
	ld e, a
	swap e
	and $f
	jr z, .loop
	dec a
	ld [wVermilionGymTrashCan1], a
	call .GetSecondTrashCan
	ld [wVermilionGymTrashCan2], a
	pop af
	ldh [rSVBK], a
	ret

.GetSecondTrashCan:
	ld hl, .AdjacencyTable
	add a
	add a
	ld c, a
	ld a, e
	and %11
	add c
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

.AdjacencyTable:
	; left, right, up, down
	db  1,  1,  5,  5 ;  0 ( 1, 7)
	db  0,  2,  6,  6 ;  1 ( 3, 7)
	db  1,  3,  7,  7 ;  2 ( 5, 7)
	db  2,  4,  8,  8 ;  3 ( 7, 7)
	db  3,  3,  9,  9 ;  4 ( 9, 7)
	db  6,  6,  0, 10 ;  5 ( 1, 9)
	db  5,  7,  1, 11 ;  6 ( 3, 9)
	db  6,  8,  2, 12 ;  7 ( 5, 9)
	db  7,  9,  3, 13 ;  8 ( 7, 9)
	db  8,  8,  4, 14 ;  9 ( 9, 9)
	db 11, 11,  5,  5 ; 10 ( 1,11)
	db 10, 12,  6,  6 ; 11 ( 3,11)
	db 11, 13,  7,  7 ; 12 ( 5,11)
	db 12, 14,  8,  8 ; 13 ( 7,11)
	db 13, 13,  9,  9 ; 14 ( 9,11)

CheckVermilionGymTrashCan:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rSVBK], a
	ld de, EVENT_VERMILION_GYM_SWITCH_1
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .first
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, TRUE
	jr z, .done
	dec a ; FALSE
.done
	ld [wScriptVar], a
	pop af
	ldh [rSVBK], a
	ret

.first:
	ld a, [wVermilionGymTrashCan1]
	call .CheckTrashCan
	jr z, .yes
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, FALSE
	jr nz, .done
	ld a, [wVermilionGymTrashCan1]
	ld [wVermilionGymTrashCan2], a
.yes
	ld a, TRUE
	jr .done

.CheckTrashCan:
	ld c, a
	call GetFacingTileCoord
	call .ConvertCoordsToTrashCan
	cp c
	ret

.ConvertCoordsToTrashCan:
	ld a, d
	sub 5
	srl a
	ld d, a
	ld a, e
	sub 11
	srl a
	ld e, a
	add a
	add a
	add e
	add d
	ret

VermilionGymElectricFenceScript:
	jumptext VermilionGymElectricFenceText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "Surge: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #mon,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done

LtSurgeWinLossText:
	text "Surge: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "the ThunderBadge!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> received"
	line "the ThunderBadge."
	done

LtSurgeThunderBadgeText:
	text "Surge: Consider"
	line "it proof that"
	cont "you defeated me."

	para "You wear it"
	line "proudly, y'hear?"
	done

LtSurgeFightDoneText:
	text "Surge: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #mon and I"
	line "are still at it!"
	done
	
LtSurgeRematchIntroText:
	text "Hey kid!"
	line "You're back!"
	
	para "We going"
	line "another round?"
	done
	
LtSurgeWinLossRematchText:
	text "Haha, shocking!"
	done
	
LtSurgeRematchAfterBattleText:
	text "I still need"
	line "to work on"
	cont "closing the gap"
	cont "between us."
	
	para "Come back for"
	line "a rematch!"
	done
	
LtSurgeComeBackTomorrowText:
	text "Hey kid! Come"
	line "back tomorrow, we"
	cont "can battle again."
	done

LtSurgeNextTimeText:
	text "Make sure to keep"
	line "up your training."
	done

GentlemanGregorySeenText:
	text "You're here to"
	line "defeat Lt.Surge?"

	para "Not if I can help"
	line "it!"
	done

GentlemanGregoryBeatenText:
	text "Sorry I failed"
	line "you, Lt.Surge,"
	cont "sir!"
	done

GentlemanGregoryAfterBattleText:
	text "When I was still"
	line "in the army, Lt."

	para "Surge saved my"
	line "life."
	done

GuitaristVincentSeenText:
	text "Lt.Surge recog-"
	line "nized my potential"

	para "with electric"
	line "#mon."

	para "Think you can beat"
	line "me?"
	done

GuitaristVincentBeatenText:
	text "Ooh, how shocking!"
	done

GuitaristVincentAfterBattleText:
	text "If the Gym's traps"
	line "were working, you"

	para "would have been"
	line "toast…"
	done

JugglerHortonSeenText:
	text "I'm going to take"
	line "you down! Prepare"
	cont "to be shocked!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "I was overpowered…"
	done

JugglerHortonAfterBattleText:
	text "Don't get too com-"
	line "fortable about"

	para "beating me…"
	line "Lt.Surge is tough."
	done

VermilionGymFoundSwitchText:
	text "Hey!"

	para "There's a switch"
	line "under the trash!"

	para "Better press it."
	done

VermilionGymFoundFirstSwitchText:
	text "The first electric"
	line "fence opened!"
	done

VermilionGymFoundSecondSwitchText:
	text "The second"
	line "electric fence"
	cont "opened!"

	para "The path ahead is"
	line "clear!"
	done

VermilionGymResetSwitchesText:
	text "Oh no, the elec-"
	line "tric fence locked"
	cont "again!"
	done

VermilionGymGuideText:
	text "Yo! Champ in"
	line "making!"

	para "You lucked out"
	line "this time."

	para "Lt.Surge is very"
	line "cautious. He has"

	para "traps set all over"
	line "the Gym."

	para "Why lucky, you may"
	line "ask? Because you"

	para "can train yourself"
	line "better that way!"

	para "Make up your mind"
	line "and take on Surge!"
	done

VermilionGymGuideWinText:
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made my"
	line "nerves tingle."
	done

VermilionGymTrashCanText:
	text "Nope! Nothing here"
	line "but trash."
	done

VermilionGymElectricFenceText:
	text "An electric fence!"
	line "Don't touch it!"
	done

RaichuText:
	text "Raichu: Rai!!"
	line "Raichuuu!"
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  4,  5, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymElectricFenceScript, EVENT_VERMILION_GYM_SWITCH_1
	object_event  5,  5, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymElectricFenceScript, EVENT_VERMILION_GYM_SWITCH_1
	object_event  4,  4, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymElectricFenceScript, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  4, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymElectricFenceScript, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  4,  2, SPRITE_RAICHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymRaichu, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
