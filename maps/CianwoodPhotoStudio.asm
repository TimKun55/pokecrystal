	object_const_def
	const CIANWOODPHOTOSTUDIO_FISHING_GURU

CianwoodPhotoStudio_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_CIANWOOD_PHOTOGRAPH
	iftrue .AlreadyDone
	writetext CianwoodPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext CianwoodPhotoStudioFishingGuruText_Yes
	promptbutton
	special CianwoodPhotograph
	ifequal $0, .NoPicture
	ifequal $1, .EggPicture
 	writetext PhotoStudioHoldStillText
	setflag ENGINE_DAILY_CIANWOOD_PHOTOGRAPH	
	waitbutton
	closetext
	special FadeOutToBlack
	special LoadMapPalettes
	pause 10
	readmem wCurPartySpecies
	refreshscreen
	pokepic 0
	cry 0
	waitsfx
	pause 30
	closepokepic
	opentext
	writetext PhotoStudioPrestoText
	special PlayCurMonCry
	waitbutton
	writetext PhotoStudioComeAgainText
	waitbutton
	closetext
	end

.Refused:
	writetext CianwoodPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

.AlreadyDone
	writetext PhotoStudioAlreadyDoneText
	waitbutton
	closetext
	end

.NoPicture:
	writetext PhotoStudioNoPictureText
	waitbutton
	closetext
	end

.EggPicture:
	writetext PhotoStudioEggPictureText
    waitbutton
	closetext
	end

CianwoodPhotoStudioFishingGuruText_Question:
	text "You have magnifi-"
	line "cent #mon with"
	cont "you."

	para "How about a photo"
	line "for a souvenir?"
	done

CianwoodPhotoStudioFishingGuruText_Yes:
	text "OK! Big smile now!"

	para "Which #mon"
	line "should I photo-"
	cont "graph?"
	done

CianwoodPhotoStudioFishingGuruText_No:
	text "Oh, that's too"
	line "bad. I thought it"

	para "would be a great"
	line "memento…"
	done

PhotoStudioHoldStillText:
	text "All righty. Hold"
	line "still for a bit."
	done

PhotoStudioPrestoText:
	text "Presto! All done."

	para "Your @"
	text_ram wStringBuffer3
	text ""
	line "looks happier!"
	done

PhotoStudioAlreadyDoneText:
	text "I've already taken"
	line "a photo for you"
	cont "today."

	para "Come back again"
	line "tomorrow."
	done

PhotoStudioNoPictureText:
	text "Oh, no picture?"
	line "Come again, OK?"
	done

PhotoStudioEggPictureText:
	text "An Egg? My talent"
	line "is worth more…"
	done

PhotoStudioComeAgainText:
	text "Come again, OK?"
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 8
	warp_event  3,  7, CIANWOOD_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1
