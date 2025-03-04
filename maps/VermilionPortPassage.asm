	object_const_def
	const VERMILIONPORTPASSAGE_SAILOR
	const VERMILIONPORTPASSAGE_TEACHER

VermilionPortPassage_MapScripts:
	def_scene_scripts
	scene_script VermilionPortPassageNoop1Scene, SCENE_VERMILIONPORTPASSAGE_TICKET_CHECK
	scene_script VermilionPortPassageNoop2Scene, SCENE_VERMILIONPORTPASSAGE_NOOP

	def_callbacks

VermilionPortPassageNoop1Scene:
	end

VermilionPortPassageNoop2Scene:
	end

VermilionPortPassageTicketCheckScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .done
	readvar VAR_FACING
	ifequal UP, .done
	turnobject PLAYER, RIGHT
	turnobject VERMILIONPORTPASSAGE_SAILOR, LEFT
	sjump _VermilionPortPassageTicketCheckScript

.done:
	end

VermilionPortPassageSailorScript:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue _VermilionPortPassageTicketCheckScript.GoOnThrough
_VermilionPortPassageTicketCheckScript:
	opentext
	writetext VermilionPortPassageAskBoardText
	yesorno
	iffalse VermilionPortPassageNotRidingScript
	writetext VermilionPortPassageAskTicketText
	promptbutton
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext VermilionPortPassageFlashTicketText
	waitbutton
	closetext
	turnobject VERMILIONPORTPASSAGE_SAILOR, UP
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

.NoTicket:
	writetext VermilionPortPassageNoTicketText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal RIGHT, .VermilionPortPassagePlayerStepsBack
	end

.GoOnThrough:
	opentext
	writetext VermilionPortPassageGoOnThroughText
	waitbutton
	closetext
	end

.VermilionPortPassagePlayerStepsBack:
	applymovement PLAYER, VermilionPortPassagePlayerStepsBackMovement
	turnobject VERMILIONPORTPASSAGE_SAILOR, UP
	end

VermilionPortPassageNotRidingScript:
	writetext VermilionPortPassageComeAgainText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal RIGHT, _VermilionPortPassageTicketCheckScript.VermilionPortPassagePlayerStepsBack
	end

VermilionPortPassageTeacherScript:
	jumptextfaceplayer VermilionPortPassageTeacherText

VermilionPortPassagePlayerStepsBackMovement:
	step UP
	step_end

VermilionPortPassageAskBoardText:
	text "Welcome to Fast"
	line "Ship S.S.Aqua."

	para "Will you be board-"
	line "ing today?"
	done

VermilionPortPassageAskTicketText:
	text "May I see your"
	line "S.S.Ticket?"
	done

VermilionPortPassageComeAgainText:
	text "We hope to see you"
	line "again!"
	done

VermilionPortPassageFlashTicketText:
	text "<PLAYER> flashed"
	line "the S.S.Ticket."

	para "That's it."
	line "Thank you!"
	done

VermilionPortPassageGoOnThroughText:
	text "I've seen your"
	line "Ticket. Please, go"
	cont "on through."
	done

VermilionPortPassageNoTicketText:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "Ticket…"

	para "…But no Ticket!"

	para "Sailor: Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.Ticket."
	done

VermilionPortPassageTeacherText:
	text "The Fast Ship"
	line "sails on Wednes-"
	cont "days and Sundays"
	cont "every week."
	done

VermilionPortPassage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, VERMILION_CITY, 8
	warp_event  5,  0, VERMILION_CITY, 9
	warp_event  4,  7, VERMILION_PORT, 1
	warp_event  5,  7, VERMILION_PORT, 2

	def_coord_events
	coord_event  4,  5, SCENE_VERMILIONPORTPASSAGE_TICKET_CHECK, VermilionPortPassageTicketCheckScript

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortPassageSailorScript, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortPassageTeacherScript, -1
