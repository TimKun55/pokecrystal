	object_const_def
	const VIOLETPRIMOSHOUSE_PRIMO
	const VIOLETPRIMOSHOUSE_MAREEP
	const VIOLETPRIMOSHOUSE_SLUGMA
	const VIOLETPRIMOSHOUSE_WOOPER

VioletPrimosHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PrimosHousePrimoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SLUGMA
	iftrue .GotSlugma
	writetext PrimoIntroText
	waitbutton
	checkevent EVENT_BEAT_FALKNER
	iffalse .BeatFalkner
	writetext PrimoTakeThisSlugmaText
	yesorno
	iffalse .Refused
	writetext PrimoAmazingText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedSlugmaText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SLUGMA, 10
	setevent EVENT_GOT_SLUGMA
	writetextend PrimoSlugmaComeInHandyText

.NoRoom:
	writetextend PrimoPartyFullText

.Refused:
	writetextend PrimoNoSlugmaText

.GotSlugma:
	writetextend PrimoLoveJohtoText
	
.BeatFalkner
	writetextend PrimoBeatFalknerText
	
PrimosHouseMareepScript:
	opentext
	writetext PrimosHouseMareepText
	cry MAREEP
	waitbutton
	refreshscreen
	pokepic MAREEP
	waitbutton
	closepokepic
	closetext
	end

PrimosHouseSlugmaScript:
	opentext
	writetext PrimosHouseSlugmaText
	cry SLUGMA
	waitbutton
	refreshscreen
	pokepic SLUGMA
	waitbutton
	closepokepic
	closetext
	end

PrimosHouseWooperScript:
	opentext
	writetext PrimosHouseWooperText
	cry WOOPER
	waitbutton
	refreshscreen
	pokepic WOOPER
	waitbutton
	closepokepic
	closetext
	end

PrimoIntroText:
	text "Hi! I'm Primo."
	line "I moved here from"
	cont "Kanto not too"
	cont "long ago."

	para "You recently"
	line "became a trainer,"
	cont "right?"

	para "I like to help out"
	line "new trainers on"
	cont "their journey!"
	done
	
PrimoBeatFalknerText:
	text "Hmm, you don't"
	line "seem to have any"
	cont "Gym Badges."

	para "Defeat Falkner and"
	line "I'll have some-"
	cont "thing for you!"
	done

PrimoTakeThisSlugmaText:
	text "Hey, you've got"
	line "Falkner's Badge!"

	para "Would you like"
	line "this Slugma?"
	done

PrimoAmazingText:
	text "Amazing!"
	line "Slugma isn't easy"
	cont "to raise but"
	cont "it can be very"
	cont "useful with the"
	cont "right team."
	done

ReceivedSlugmaText:
	text "<PLAYER> received"
	line "Slugma!"
	done

PrimoSlugmaComeInHandyText:
	text "As a fire-type,"
	line "Slugma will"
	cont "definitely come"
	cont "in handy in the"
	cont "Azalea Gym!"
	done

PrimoPartyFullText:
	text "Whoa, wait. You"
	line "can't carry any"
	cont "more #mon."
	done

PrimoNoSlugmaText:
	text "Oh… No problem."
	
	para "I'll see if the"
	line "next trainer would"
	cont "like one!"
	done

PrimoLoveJohtoText:
	text "Moving here from"
	line "Viridian City was"
	cont "a bit hectic!"

	para "But I absolutely"
	line "love Johto!"
	done

PrimosHouseMareepText:
	text "Mareep: Meep!"
	done

PrimosHouseSlugmaText:
	text "Slugma: Maaag!"
	done

PrimosHouseWooperText:
	text "Wooper: Oopaa!"
	done

VioletPrimosHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 7
	warp_event  4,  7, VIOLET_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PrimosHousePrimoScript, -1
	object_event  4,  1, SPRITE_MAREEP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PrimosHouseMareepScript, -1
	object_event  7,  3, SPRITE_SLUGMA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PrimosHouseSlugmaScript, -1
	object_event  4,  5, SPRITE_WOOPER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PrimosHouseWooperScript, -1
