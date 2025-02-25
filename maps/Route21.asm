	object_const_def
	const ROUTE21_SWIMMER_GIRL1
	const ROUTE21_SWIMMER_GIRL2
	const ROUTE21_SWIMMER_GUY1
	const ROUTE21_SWIMMER_GUY2
	const ROUTE21_FISHER

Route21_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermDaryl:
	trainer SWIMMERM, DARYL, EVENT_BEAT_SWIMMERM_DARYL, SwimmermDarylSeenText, SwimmermDarylBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermDarylAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Land ho! Gotta"
	line "keep going!"
	done

SwimmermSethBeatenText:
	text "Glug…"
	done

SwimmermSethAfterBattleText:
	text "This arrogant guy"
	line "was at Cinnabar's"
	cont "volcano."
	done

SwimmerfNikkiSeenText:
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "sunburn…"
	done

SwimmerfNikkiAfterBattleText:
	text "I have to watch"
	line "out for blemishes"
	cont "caused by the sun."
	done

SwimmermDarylSeenText:
	text "Gotta swim fast!"
	done

SwimmermDarylBeatenText:
	text "Too fast…"
	done

SwimmermDarylAfterBattleText:
	text "Since the eruption"
	line "happened, there"
	cont "rocks everywhere."
	done

SwimmerfLisaSeenText:
	text "Just keep swim-"
	line "ming, swimming,"
	cont "swimming!"
	done

SwimmerfLisaBeatenText:
	text "What were we"
	line "talking about…?"
	done

SwimmerfLisaAfterBattleText:
	text "Fish #mon"
	line "are friends."
	done

FisherArnoldSeenText:
	text "I'm bored by fish-"
	line "ing. Let's battle!"
	done

FisherArnoldBeatenText:
	text "Utter failure…"
	done

FisherArnoldAfterBattleText:
	text "I'll just go back"
	line "to fishing…"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event 13, 40, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLisa, -1
	object_event  4, 36, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event  6, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmermDaryl, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
