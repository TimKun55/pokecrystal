	object_const_def
	const PEWTERMUSEUM2F_SCIENTIST1
	const PEWTERMUSEUM2F_TEACHER
	const PEWTERMUSEUM2F_YOUNGSTER
	const PEWTERMUSEUM2F_GRAMPS
	const PEWTERMUSEUM2F_GRANNY

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum2FScientistScript:
	jumptextfaceplayer PewterMuseum2FScientistText

PewterMuseum2FTeacherScript:
	jumptextfaceplayer PewterMuseum2FTeacherText

PewterMuseum2FYoungsterScript:
	jumptextfaceplayer PewterMuseum2FYoungsterText

PewterMuseum2FGrampsScript:
	jumptextfaceplayer PewterMuseum2FGrampsText

PewterMuseum2FGrannyScript:
	jumptextfaceplayer PewterMuseum2FGrannyText

PewterMuseum2FMoonStoneSignpostScript:
	opentext
	writetext PewterMuseum2FMoonStoneSignpostText
	waitbutton
	closetext
	refreshscreen
	trainerpic METEORITE
	waitbutton
	closepokepic
	end

PewterMuseum2FSpaceShuttleSignpostScript:
	jumptextfaceplayer PewterMuseum2FSpaceShuttleSignpostText

PewterMuseum2FCuboneArmorScript:
	opentext
	writetext PewterMuseum2FCuboneArmorText
	waitbutton
	closetext
	refreshscreen
	trainerpic CUBONE_ARMOR
	waitbutton
	closepokepic
	end

PewterMuseum2FScientistText:
	text "Meteorites struck"
	line "Mt.Moon near"
	cont "Pewter City."

	para "We have one"
	line "on display."

	para "It seems to emit"
	line "strange energy…"
	done

PewterMuseum2FTeacherText:
	text "These are all"
	line "so pretty!"
	done

PewterMuseum2FYoungsterText:
	text "Do you really"
	line "think these fell"
	cont "from the Moon?"
	done

PewterMuseum2FGrampsText:
	text "This set of armor"
	line "has been passed"
	
	para "down for generat-"
	line "ions in my family."
	
	para "Legend has it this"
	line "Cubone saved my"
	
	para "ancestors from"
	line "danger."
	
	para "The Cubone lived"
	line "with the family"
	
	para "for many, many"
	line "years before pass-"
	cont "ing away peace-"
	cont "fully."
	
	para "Since then, my"
	line "family passed down"
	
	para "the armor as a"
	line "reminder of that"
	cont "Cubone's kindness."
	
	para "I donated the set"
	line "to the Museum to"
	
	para "show others the"
	line "amazing kindness"
	cont "of #mon."
	done

PewterMuseum2FGrannyText:
	text "I still remember"
	line "the day the shut-"
	cont "tle was launched."
	
	para "Such an amazing"
	line "achievement that"
	
	para "inspired so many"
	line "people around the"
	cont "world."
	
	para "How fast time"
	line "passes…"
	done

PewterMuseum2FMoonStoneSignpostText:
	text "Meteorite that"
	line "fell on Mt.Moon."
	done

PewterMuseum2FCuboneArmorText:
	text "Cubone Armor"
	
	para "The armor of a"
	line "heroic Cubone."
	done

PewterMuseum2FSpaceShuttleSignpostText:
	text "Space Shuttle"
	
	para "A model of the"
	line "first shuttle"
	cont "sent into space"
	
	para "by the Hoenn Moss-"
	line "deep Space Center."
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  2, PEWTER_MUSEUM_1F, 3

	def_coord_events

	def_bg_events
	bg_event 12,  9, BGEVENT_READ, PewterMuseum2FMoonStoneSignpostScript
	bg_event 13,  2, BGEVENT_READ, PewterMuseum2FSpaceShuttleSignpostScript
	bg_event  3,  9, BGEVENT_READ, PewterMuseum2FCuboneArmorScript


	def_object_events
	object_event  9,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FScientistScript, -1
	object_event 11, 10, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FTeacherScript, -1
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FYoungsterScript, -1
	object_event  4, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FGrampsScript, -1
	object_event  6,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FGrannyScript, -1
