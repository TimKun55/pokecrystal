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
	promptbutton
	giveitem PREMIER_BALL, 5
	iffalse .BagFull
	writetext SilphCoEmployeeDayGotBallText
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_GOT_PREMIER_BALLS_FROM_SILPH
	writetext SilphCoEmployeeDayBallFavouriteText
	waitbutton
	closetext
	end
	
.SilphCoEmployeeDayFamily:
	writetext SilphCoEmployeeDayFamilyText
	waitbutton
	closetext
	end

.BagFull
	writetext SilphCoEmployeeDayBagFullText
	waitbutton
	closetext
	end

SilphCoEmployee1Night:
	jumptextfaceplayer SilphCoEmployee1NightText

SilphCoEmployee2Night:
	jumptextfaceplayer SilphCoEmployee2NightText

SilphCoDisplayCase:
	jumptext SilphCoDisplayCaseText

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

SilphCoScientistMornText:
	text "Good morning."
	line "I work up on the"
	cont "11th floor."
	
	para "The elevator isn't"
	line "working, so I've"
	cont "got to climb all"
	cont "those stairs…"
	done

SilphCoEmployeeMornText:
	text "We had to find and"
	line "reinstall all of"
	
	para "the old teleport"
	line "pads because the"
	
	para "elevator is out"
	line "of order, but"
	
	para "using them makes"
	line "most of the other"
	cont "employees sick."
	
	para "Why is no one fix-"
	line "ing the elevator?"
	done

SilphCoGentlemanDayText:
	text "We're always work-"
	line "ing on new TMs."

	para "Some have been"
	line "discontinued, but"

	para "others are so pop-"
	line "ular that they"

	para "haven't changed in"
	line "over 20 years!"
	done

SilphCoEmployeeDayBallFamilyText:
	text "I'm from a family"
	line "of # Ball"
	cont "creators."

	para "My father Kurt is"
	line "teaching my daugh-"
	cont "ter how to make"

	para "Apricorn Balls"
	line "while I'm busy"
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

SilphCoEmployeeDayBallFavouriteText:
	text "They don't have any"
	line "special effects"

	para "like some other"
	line "# balls, I just"
	
	para "like the way"
	line "they look."
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
	warp_event  8,  7, SAFFRON_CITY, 7
	warp_event  9,  7, SAFFRON_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SilphCoDisplayCase
	bg_event  7,  1, BGEVENT_READ, SilphCoDisplayCase
	bg_event  4,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event  5,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event 12,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event 13,  1, BGEVENT_UP, SilphCoVendingMachine

	def_object_events
	object_event  1,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 13,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, SilphCoScientistMorn, EVENT_SILPHCO1F_EMPLOYEE
	object_event  3,  6, SPRITE_CLERK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, MORN, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoEmployeeMorn, EVENT_SILPHCO1F_EMPLOYEE
	object_event  7,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, SilphCoGentlemanDay, EVENT_SILPHCO1F_EMPLOYEE
	object_event 13,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoEmployeeDay, EVENT_SILPHCO1F_EMPLOYEE
	object_event 10,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, SilphCoEmployee1Night, EVENT_SILPHCO1F_EMPLOYEE
	object_event 15,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, SilphCoEmployee2Night, EVENT_SILPHCO1F_EMPLOYEE
