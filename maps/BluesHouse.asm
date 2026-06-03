	object_const_def
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetextend DaisyHelloText

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetextend DaisyAllDoneText

.AlreadyGroomedMon:
	writetextend DaisyAlreadyGroomedText

.Refused:
	writetextend DaisyRefusedText

.CantGroomEgg:
	writetextend DaisyCantGroomEggText

DaisyHelloText:
	ntag " Daisy "
	text "Hi! I'm Daisy."
	
	para "My kid brother is"
	line "the Gym Leader in"
	cont "Viridian City."

	para "But he goes out"
	line "of town so often,"
	cont "it causes problems"
	cont "for the trainers."
	done

DaisyOfferGroomingText:
	ntag " Daisy "
	text "Hi! Good timing."
	line "I'm about to have"
	cont "some tea."

	para "Would you like to"
	line "join me?"

	para "Oh, your #mon"
	line "are a bit dirty."

	para "Would you like me"
	line "to groom one?"
	done

DaisyWhichMonText:
	ntag " Daisy "
	text "Which one should"
	line "I groom?"
	done

DaisyAlrightText:
	ntag " Daisy "
	text "OK, I'll get them"
	line "looking nice in"
	cont "no time."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " looks"
	line "content."
	done

DaisyAllDoneText:
	ntag " Daisy "
	text "There you go!"
	line "All done."

	para "See? Doesn't it"
	line "look nice?"

	para "It's such a cute"
	line "#mon."
	done

DaisyAlreadyGroomedText:
	ntag " Daisy "
	text "I always have tea"
	line "around this time."
	cont "Come join me."
	done

DaisyRefusedText:
	ntag " Daisy "
	text "You don't want to"
	line "have one groomed?"
	cont "OK, we'll just"
	cont "have tea."
	done

DaisyCantGroomEggText:
	ntag " Daisy "
	text "Oh, sorry."
	line "I honestly can't"
	cont "groom an Egg."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
