	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPHCO1F_SCIENTIST
	const SILPHCO1F_CLERK1
	const SILPHCO1F_GENTLEMAN
	const SILPHCO1F_CLERK2
	const SILPHCO1F_CLERK3
	const SILPHCO1F_CLERK4

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoScientistMorn:
	jumptextfaceplayer SilphCoScientistMornText

SilphCoEmployeeMorn:
	jumptextfaceplayer SilphCoEmployeeMornText

SilphCoGentlemanDay:
	jumptextfaceplayer SilphCoGentlemanDayText

SilphCoEmployeeDay:
	faceplayer
	opentext
	checkevent EVENT_GOT_PREMIER_BALLS_FROM_SILPH
	iftrue .SilphCoEmployeeDayFamily
	writetext SilphCoEmployeeDayBallFamilyText
	waitbutton
	giveitem PREMIER_BALL, 5
	iffalse .BagFull
	writetext SilphCoEmployeeDayGotBallText
	playsound SFX_ITEM
	waitsfx
	writetext SilphCoEmployeeBallInBagText
	waitbutton
	setevent EVENT_GOT_PREMIER_BALLS_FROM_SILPH
	writetextend SilphCoEmployeeDayBallFavouriteText
	
.SilphCoEmployeeDayFamily:
	writetextend SilphCoEmployeeDayFamilyText

.BagFull
	writetextend SilphCoEmployeeDayBagFullText

SilphCoEmployee1Night:
	jumptextfaceplayer SilphCoEmployee1NightText

SilphCoEmployee2Night:
	jumptextfaceplayer SilphCoEmployee2NightText

SilphCoDisplayCase:
	jumptext SilphCoDisplayCaseText

SilphCoElevator:
	jumptext SilphCoElevatorText

SilphCoElevatorSign:
	jumptext SilphCoElevatorSignText

SilphCoVendingMachine:
	jumpstd VendingMachineScript

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Building."
	done

SilphCoOfficerText:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But since you came"
	line "such a long way,"

	para "have this neat"
	line "little souvenir."
	done

SilphCoOfficerText_GotUpGrade:
	text "It's Silph Co.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere in Kanto"
	cont "just yet."

	para "Though I believe"
	line "Madam Items in"
	cont "Blackthorn City"

	para "has been supplied"
	line "with some stock."
	done

SilphCoDisplayCaseText:
	text "There are some"
	line "old products on"
	cont "display."

	para "Looks like a"
	line "# Ball, and a"
	cont "pair of goggles."
	done

SilphCoElevatorText:
	text "…… ……"

	para "There's no"
	line "response…"
	done

SilphCoElevatorSignText:
	text "Scan employee"
	line "I.D. for elevator"
	cont "access."
	done

SilphCoScientistMornText:
	text "Good morning."
	line "I work up on the"
	cont "11th floor."

	para "I forgot my I.D."
	line "upstairs, so I've"
	cont "got to climb all"
	cont "those stairs…"
	done

SilphCoEmployeeMornText:
	text "We used to have"
	line "teleport pads"
	cont "installed to help"
	cont "us get around"
	cont "faster."

	para "The problem was"
	line "that they weren't"
	cont "programmed well"
	cont "and took us to"
	cont "random floors!"
	
	para "Was a total"
	line "nightmare!"
	done

SilphCoGentlemanDayText:
	text "We're always work-"
	line "ing on new TMs."

	para "Some have been"
	line "discontinued, but"
	cont "others are so pop-"
	cont "ular that they"
	cont "haven't changed in"
	cont "over 20 years!"
	done

SilphCoEmployeeDayBallFamilyText:
	text "I'm from a family"
	line "of # Ball"
	cont "creators."

	para "My father Kurt is"
	line "teaching my daugh-"
	cont "ter how to make"
	cont "Apricorn Balls"
	cont "while I'm busy"
	cont "working here."

	para "You helped them"
	line "out in Azalea"
	cont "Town? Great!"

	para "I'm glad my Maizie"
	line "is doing well."

	para "Take these as a"
	line "thank-you!"
	done

SilphCoEmployeeDayBagFullText:
	text "Oh, looks like"
	line "your bag is full."
	done

SilphCoEmployeeDayGotBallText:
	text "<PLAYER> received"
	line "5 Premier Balls."
	done

SilphCoEmployeeBallInBagText:
	text "<PLAYER> put the"
	line "Premier Balls in"
	cont "the Ball Pocket."
	done

SilphCoEmployeeDayBallFavouriteText:
	text "Ron: They don't"
	line "have any special"
	cont "effects like some"
	cont "other # balls,"
	cont "I just like the"
	cont "way they look."
	done

SilphCoEmployeeDayFamilyText:
	text "I love my job, but"
	line "I miss being with"
	cont "my family."
	done
	
SilphCoEmployee1NightText:
	text "We recently part-"
	line "nered with Devon"
	cont "Corp. in Hoenn."

	para "We've been making"
	line "lots of new"
	cont "products!"
	done

SilphCoEmployee2NightText:
	text "Man, I hate the"
	line "night shift."

	para "I can barely keep"
	line "my eyes open…"

	para "…… yawn ……"
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 11, SAFFRON_CITY, 8
	warp_event 11, 11, SAFFRON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, SilphCoElevator
	bg_event 15,  0, BGEVENT_READ, SilphCoElevatorSign
	bg_event  2,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event  3,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event  6,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event  7,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event 10,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event 11,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event  3,  4, BGEVENT_UP, SilphCoDisplayCase
	bg_event  4,  4, BGEVENT_UP, SilphCoDisplayCase
	bg_event 17,  4, BGEVENT_UP, SilphCoDisplayCase
	bg_event 18,  4, BGEVENT_UP, SilphCoDisplayCase

	def_object_events
	object_event 10,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 19,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 19, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, SilphCoScientistMorn, EVENT_SILPHCO1F_EMPLOYEE
	object_event  3,  7, SPRITE_CLERK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, MORN, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoEmployeeMorn, EVENT_SILPHCO1F_EMPLOYEE
	object_event  4,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, SilphCoGentlemanDay, EVENT_SILPHCO1F_EMPLOYEE
	object_event 16,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoEmployeeDay, EVENT_SILPHCO1F_EMPLOYEE
	object_event  5, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, SilphCoEmployee1Night, EVENT_SILPHCO1F_EMPLOYEE
	object_event 18,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, SilphCoEmployee2Night, EVENT_SILPHCO1F_EMPLOYEE
