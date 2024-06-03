	object_const_def
	const GOLDENRODTOYSTORE_CLERK
	const GOLDENRODTOYSTORE_YOUNGSTER
	const GOLDENRODTOYSTORE_TEACHER
	const GOLDENRODTOYSTORE_TYROGUE
	const GOLDENRODTOYSTORE_HITMONCHAN
	const GOLDENRODTOYSTORE_HITMONLEE
	const GOLDENRODTOYSTORE_HITMONTOP

GoldenrodToyStore_MapScripts:
	def_scene_scripts

	def_callbacks
	
GoldenrodToyStoreClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_TOY
	closetext
	end
	
GoldenrodToyStoreYoungsterScript:
	jumptextfaceplayer GoldenrodToyStoreYoungsterText
	
GoldenrodToyStoreTeacherScript:
	jumptextfaceplayer GoldenrodToyStoreTeacherText
	
GoldenrodToyStoreTyrogueScript:
	opentext
	writetext GoldenrodToyStoreTyrogueText
	cry TYROGUE
	waitbutton
	refreshscreen
	pokepic TYROGUE
	waitbutton
	closepokepic
	closetext
	end

GoldenrodToyStoreHitmonchanScript:
	opentext
	writetext GoldenrodToyStoreHitmonchanText
	cry HITMONCHAN
	waitbutton
	refreshscreen
	pokepic HITMONCHAN
	waitbutton
	closepokepic
	closetext
	end

GoldenrodToyStoreHitmonleeScript:
	opentext
	writetext GoldenrodToyStoreHitmonleeText
	cry HITMONLEE
	waitbutton
	refreshscreen
	pokepic HITMONLEE
	waitbutton
	closepokepic
	closetext
	end

GoldenrodToyStoreHitmontopScript:
	opentext
	writetext GoldenrodToyStoreHitmontopText
	cry HITMONTOP
	waitbutton
	refreshscreen
	pokepic HITMONTOP
	waitbutton
	closepokepic
	closetext
	end

GoldenrodToyStoreYoungsterText:
	text "Did you know that"
	line "TYROGUE can evolve"
	
	para "depending on which"
	line "toy it holds?"
	
	para "It will evolve"
	line "starting at LV20,"
	cont "so I've got some"
	cont "time to decide."
	done
	
GoldenrodToyStoreTeacherText:
	text "I can't believe"
	line "simple children's"
	cont "toys can cause"
	
	para "a #MON to"
	line "evolve!"
	done

GoldenrodToyStoreTyrogueText:
	text "TYROGUE: Tyty!"
	done

GoldenrodToyStoreHitmonchanText:
	text "HITMONCHAN: Cha!"
	done

GoldenrodToyStoreHitmonleeText:
	text "HITMONLEE: Monlee!"
	done
	
GoldenrodToyStoreHitmontopText:
	text "HITMONTOP: Montop!"
	done

GoldenrodToyStore_MapEvents:
	db 0, 0 ; filler
	
	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 17
	warp_event  3,  7, GOLDENROD_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreClerkScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreYoungsterScript, -1
	object_event  5,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreTeacherScript, -1
	object_event  8,  6, SPRITE_TYROGUE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreTyrogueScript, -1
	object_event  6,  5, SPRITE_HITMONCHAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreHitmonchanScript, -1
	object_event  8,  4, SPRITE_HITMONLEE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreHitmonleeScript, -1
	object_event  9,  5, SPRITE_HITMONTOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodToyStoreHitmontopScript, -1
	