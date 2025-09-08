	object_const_def
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_AMPHAROS
	const OLIVINELIGHTHOUSE6F_SAILOR1
	const OLIVINELIGHTHOUSE6F_SAILOR2
	const OLIVINELIGHTHOUSE6F_SAILOR3
	const OLIVINELIGHTHOUSE6F_SAILOR4
	const OLIVINELIGHTHOUSE6F_SAILOR5
	const OLIVINELIGHTHOUSE6F_YOUNGSTER
	const OLIVINELIGHTHOUSE6F_BEAUTY
	const OLIVINELIGHTHOUSE6F_HIKER
	const OLIVINELIGHTHOUSE6F_FISHING_GURU
	const OLIVINELIGHTHOUSE6F_POKE_BALL

OlivineLighthouse6F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue .ExplainedSickness
	writetext JasmineCianwoodPharmacyText
	promptbutton
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
.ExplainedSickness:
	writetextend JasmineGetSomeMedicineText

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .Refused
	writetext PlayerHandedSecretpotionText
	promptbutton
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_AMPHAROS, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 10
	special FadeInFromWhite
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_AMPHAROS, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_AMPHAROS, LEFT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_AMPHAROS, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_AMPHAROS, LEFT
	pause 10
	faceplayer
	opentext
	writetext JasmineThankYouText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesDownMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesRightMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.Refused:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_AMPHAROS, LEFT
	opentext
	writetextend JasmineAmphyHangOnText

OlivineLighthouseAmphy:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	writetext AmphyPalPalooText
	setval AMPHAROS
	special PlaySlowCry
	promptbutton
	writetextend AmphyBreathingLaboredText

.HealthyNow:
	writetext AmphyPaluPaluluText
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInFromWhite
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInFromWhite
	end

OlivineLighthouse6FElevatorSailorScript:
	opentext
	writetext ElevatorSailorFixedText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OLIVINELIGHTHOUSE6F_SAILOR1, 15
	pause 10
	faceplayer
	opentext
	writetext ElevatorSailorElevatorText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE6F_SAILOR1, OlivineLighthouse6FElevatorSailorMovement
	playsound SFX_EXIT_BUILDING
	disappear OLIVINELIGHTHOUSE6F_SAILOR1
	end

OlivineLighthouse6FWindowCleanerScript:
	jumptext OlivineLighthouse6FWindowCleanerText

OlivineLighthouse6FYoungsterScript:
	faceplayer
	opentext
	writetext OlivineLighthouse6FYoungsterText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_YOUNGSTER, LEFT
	end

OlivineLighthouse6FBeautyScript:
	faceplayer
	opentext
	writetext OlivineLighthouse6FBeautyText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_BEAUTY, UP
	end

OlivineLighthouse6FHikerScript:
	faceplayer
	opentext
	writetext OlivineLighthouse6FHikerText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_HIKER, RIGHT
	end

OlivineLighthouse6FFishingGuruScript:
	faceplayer
	opentext
	writetext OlivineLighthouse6FFishingGuruText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_FISHING_GURU, DOWN
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

BinocularsLeft1:
	jumptext BinocularsLeft1Text

BinocularsLeft2:
	jumptext BinocularsLeft2Text

BinocularsLeft3:
	jumptext BinocularsLeft3Text

BinocularsRight1:
	jumptext BinocularsRight1Text

BinocularsRight2:
	jumptext BinocularsRight2Text

BinocularsRight3:
	jumptext BinocularsRight3Text

OlivineLighthouseJasmineLeavesDownMovement:
	slow_step LEFT
	slow_step DOWN
	slow_step DOWN
	slow_step RIGHT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

OlivineLighthouseJasmineLeavesRightMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

OlivineLighthouse6FElevatorSailorMovement:
	step UP
	step_end

JasmineCianwoodPharmacyText:
	text "Jasmine: … This"
	line "#mon always"
	cont "kept the sea lit"
	cont "at night."

	para "…But it suddenly"
	line "got sick… It's"
	cont "gasping for air…"

	para "…I understand"
	line "that there is a"
	cont "wonderful Pharmacy"
	cont "in Cianwood…"

	para "But that's across"
	line "the sea…"

	para "And I can't leave"
	line "Amphy unattended…"
	done

JasmineGetSomeMedicineText:
	text "…May I ask you to"
	line "get some medicine"
	cont "for me? Please?"
	done

JasmineCureAmphyText:
	text "Jasmine: …Will"
	line "that medicine cure"
	cont "Amphy?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> handed the"
	line "SecretPotion to"
	cont "Jasmine."
	done

JasmineDontBeOffendedText:
	text "Jasmine: …Um,"
	line "please don't be"
	cont "offended…"

	para "…Amphy will not"
	line "take anything from"
	cont "anyone but me…"
	done

JasmineAmphyHowAreYouFeelingText:
	text "Jasmine: …"

	para "Amphy, how are you"
	line "feeling?"
	done

JasmineThankYouText:
	text "Jasmine: …Oh, I'm"
	line "so relieved…"

	para "This is just so"
	line "wonderful…"

	para "Thank you so very,"
	line "very much."

	para "…I will return to"
	line "the Gym…"
	done

JasmineISeeText:
	text "Jasmine: …I see…"
	done

JasmineAmphyHangOnText:
	text "…Amphy, hang on!"
	done

AmphyPalPalooText:
	text "Amphy: …"
	line "…Pa… paloo…"
	done

AmphyBreathingLaboredText:
	text "Its breathing is"
	line "terribly labored…"
	done

AmphyPaluPaluluText:
	text "Amphy: Palu!"
	line "Palulu!"
	done

ElevatorSailorFixedText:
	text "There we go;"
	line "all fixed!"
	done

ElevatorSailorElevatorText:
	text "Oh, hello."
	line "The elevator is"
	cont "working again."
	
	para "Feel free to use"
	line "it when you need."
	done

OlivineLighthouse6FWindowCleanerText:
	text "These need to be"
	line "super clean!"
	
	para "Sorry, no time"
	line "to talk!"
	done

OlivineLighthouse6FYoungsterText:
	text "Wow! Look at that"
	line "massive building!"
	
	para "The Battle Tower"
	line "looks so cool!"
	done

OlivineLighthouse6FBeautyText:
	text "This view is so"
	line "breathtaking."
	done

OlivineLighthouse6FHikerText:
	text "I don't have a"
	line "mountain to climb"
	cont "so I climbed this"
	cont "lighthouse."
	cont "Hahahaha!"
	done

OlivineLighthouse6FFishingGuruText:
	text "I'm scoping out"
	line "the best fishing"
	cont "spot from up here."
	done

BinocularsLeft1Text:
	text "These binoculars"
	line "don't seem to be"
	cont "working…"
	done

BinocularsLeft2Text:
	text "Someone is"
	line "smashing rocks"
	cont "on the beach."
	done

BinocularsLeft3Text:
	text "Two trainers are"
	line "having a battle"
	cont "in the ocean!"
	
	para "A #mon fired a"
	line "jet of water!"

	para "That makes me feel"
	line "like battling"
	cont "right now!"
	done

BinocularsRight1Text:
	text "These binoculars"
	line "let me see far"
	cont "away. I can see"
	cont "the Tin Tower!"
	done

BinocularsRight2Text:
	text "There are trainers"
	line "catching a ton of"
	cont "Bug #mon!"
	done

BinocularsRight3Text:
	text "It's the roof of"
	line "the Goldenrod"
	cont "Department Store!"
	
	para "There are people"
	line "using binoculars!"
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 11, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  2,  5, BGEVENT_LEFT, BinocularsLeft1
	bg_event  2,  9, BGEVENT_LEFT, BinocularsLeft2
	bg_event  2, 13, BGEVENT_LEFT, BinocularsLeft3
	bg_event 17,  5, BGEVENT_RIGHT, BinocularsRight1
	bg_event 17,  9, BGEVENT_RIGHT, BinocularsRight2
	bg_event 17, 13, BGEVENT_RIGHT, BinocularsRight3

	def_object_events
	object_event  9,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseJasmine, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event 10,  8, SPRITE_AMPHAROS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, -1
	object_event  9,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FElevatorSailorScript, EVENT_OLIVINE_LIGHTHOUSE_ELEVATOR_SAILOR
	object_event 11,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FWindowCleanerScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event 14,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FWindowCleanerScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event  7, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FWindowCleanerScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event  5,  8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FWindowCleanerScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FYoungsterScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event 13,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FBeautyScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event 17, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FHikerScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event 13, 15, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FFishingGuruScript, EVENT_OLIVINE_LIGHTHOUSE_6F_VISITORS
	object_event  2,  4, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
