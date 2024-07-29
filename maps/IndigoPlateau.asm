	object_const_def
	const ROUTE23_CLAIR
	const ROUTE23_KINGDRA

IndigoPlateau_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, IndigoPlateauFlypointCallback

IndigoPlateauFlypointCallback:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	endcallback

Route23Clair:
	faceplayer
	opentext 
	writetext Route23ClairBeforeText
	waitbutton
	closetext
	winlosstext Route23ClairDefeatText, Route23ClairVictoryText
	setlasttalked ROUTE23_CLAIR
	loadtrainer CLAIR, CLAIR2
	startbattle
	disappear ROUTE23_KINGDRA
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_23_CLAIR
	setevent EVENT_ROUTE_23_CLAIR
	opentext
	writetext Route23ClairAfterText
	waitbutton
	closetext
	applymovement ROUTE23_CLAIR, Route23ClairBattleExitMovement
	disappear ROUTE23_CLAIR
	end
	
Route23Kingdra:
	opentext
	writetext Route23KingdraText
	cry KINGDRA
	waitbutton
	refreshscreen
	pokepic KINGDRA
	waitbutton
	closepokepic
	closetext
	end

IndigoPlateauSign:
	jumptext IndigoPlateauSignText
	
Route23ClairBattleExitMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
Route23ClairBeforeText:
	text "<PLAYER>."
	
	para "I know we just"
	line "battled, but the"
	cont "others wanted to"
	
	para "do an old-school"
	line "Leader send-off."
	
	para "So, as the final"
	line "obstacle between"
	
	para "you and the"
	line "Leader, I"
	cont "challenge you."
	done

Route23ClairDefeatText:
	text "Mmm…"
	line "Very well done."
	done

Route23ClairAfterText:
	text "In the short time"
	line "since we battled"
	cont "you've become"

	para "even stronger."
	line "The Master was"
	cont "correct."
	
	para "Go. You've beaten"
	line "us all twice; the"
	cont "Leader had better"
	
	para "not underestimate"
	line "you and your"
	cont "#mon!"
	done

Route23ClairVictoryText:
	text "It seems I was"
	line "the stronger one"
	cont "this time."
	done
	
Route23KingdraText:
	text "Kingdra: Draa!"
	done

IndigoPlateauSignText:
	text "Indigo Plateau"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#mon League HQ"
	done

IndigoPlateau_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 10,  5, INDIGO_PLATEAU_POKECENTER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, IndigoPlateauSign

	def_object_events
	object_event 10, 13, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route23Clair, EVENT_ROUTE_23_CLAIR
	object_event  9, 13, SPRITE_KINGDRA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route23Kingdra, EVENT_ROUTE_23_CLAIR
