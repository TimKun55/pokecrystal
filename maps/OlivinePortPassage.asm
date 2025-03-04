	object_const_def
	const OLIVINEPORTPASSAGE_SAILOR
	const OLIVINEPORTPASSAGE_POKEFAN_M

OlivinePortPassage_MapScripts:
	def_scene_scripts
	scene_script OlivinePortPassageNoop1Scene, SCENE_OLIVINEPORTPASSAGE_TICKET_CHECK
	scene_script OlivinePortPassageNoop2Scene, SCENE_OLIVINEPORTPASSAGE_NOOP

	def_callbacks

OlivinePortPassageNoop1Scene:
	end

OlivinePortPassageNoop2Scene:
	end

OlivinePortPassageTicketCheckScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .done
	readvar VAR_FACING
	ifequal UP, .done
	turnobject PLAYER, RIGHT
	turnobject OLIVINEPORTPASSAGE_SAILOR, LEFT
	sjump _OlivinePortPassageTicketCheckScript

.done:
	end

OlivinePortPassageSailorScript:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue _OlivinePortPassageTicketCheckScript.GoOnThrough
_OlivinePortPassageTicketCheckScript:
	opentext
	writetext OlivinePortPassageAskBoardText
	yesorno
	iffalse OlivinePortPassageNotRidingScript
	writetext OlivinePortPassageAskTicketText
	promptbutton
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext OlivinePortPassageFlashTicketText
	waitbutton
	closetext
	turnobject OLIVINEPORTPASSAGE_SAILOR, UP
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

.NoTicket:
	writetext OlivinePortPassageNoTicketText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal RIGHT, .OlivinePortPassagePlayerStepsBack
	end

.GoOnThrough:
	opentext
	writetext OlivinePortPassageGoOnThroughText
	waitbutton
	closetext
	end

.OlivinePortPassagePlayerStepsBack:
	applymovement PLAYER, OlivinePortPassagePlayerStepsBackMovement
	turnobject OLIVINEPORTPASSAGE_SAILOR, UP
	end

OlivinePortPassageNotRidingScript:
	writetext OlivinePortPassageComeAgainText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal RIGHT, _OlivinePortPassageTicketCheckScript.OlivinePortPassagePlayerStepsBack
	end

OlivinePortPassagePokefanMScript:
	jumptextfaceplayer OlivinePortPassagePokefanMText

OlivinePortPassagePlayerStepsBackMovement:
	step UP
	step_end

OlivinePortPassageAskBoardText:
	text "Welcome to Fast"
	line "Ship S.S.Aqua."

	para "Will you be board-"
	line "ing today?"
	done

OlivinePortPassageAskTicketText:
	text "May I see your"
	line "S.S.Ticket?"
	done

OlivinePortPassageComeAgainText:
	text "We hope to see you"
	line "again!"
	done

OlivinePortPassageFlashTicketText:
	text "<PLAYER> flashed"
	line "the S.S.Ticket."

	para "That's it."
	line "Thank you!"
	done

OlivinePortPassageGoOnThroughText:
	text "I've seen your"
	line "Ticket. Please, go"
	cont "on through."
	done

OlivinePortPassageNoTicketText:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "Ticket…"

	para "…But no Ticket!"

	para "Sailor: Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.Ticket."
	done

OlivinePortPassagePokefanMText:
	text "Fast Ship S.S.Aqua"
	line "sails to Kanto on"

	para "Mondays and Fri-"
	line "days."
	done

YoungsterTake:
	text "Hi! Take this."
	done

OlivinePortPassage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, OLIVINE_CITY,  9
	warp_event  5,  0, OLIVINE_CITY, 10
	warp_event  4,  7, OLIVINE_PORT, 1
	warp_event  5,  7, OLIVINE_PORT, 2

	def_coord_events
	coord_event  4,  5, SCENE_OLIVINEPORTPASSAGE_TICKET_CHECK, OlivinePortPassageTicketCheckScript

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassageSailorScript, -1
	object_event  2,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassagePokefanMScript, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
